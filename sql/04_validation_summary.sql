/*
File: 04_validation_summary.sql
Project: API and Database Testing Portfolio
Purpose: Produce a consolidated database-validation result.
Author: Dhruba Aryal
*/

SET search_path TO booking_portfolio, public;

WITH known_emails AS (
    SELECT LOWER(email) AS normalized_email
    FROM customers

    UNION

    SELECT LOWER(email)
    FROM staging_customer_import
    WHERE email IS NOT NULL
),
validation_metrics AS (

    SELECT
        1 AS metric_order,
        'Production duplicate booking ID groups' AS validation_metric,
        0::BIGINT AS expected_count,
        (
            SELECT COUNT(*)
            FROM (
                SELECT booking_id
                FROM bookings
                GROUP BY booking_id
                HAVING COUNT(*) > 1
            ) duplicate_booking_ids
        ) AS actual_count

    UNION ALL

    SELECT
        2,
        'Production duplicate customer email groups',
        0::BIGINT,
        (
            SELECT COUNT(*)
            FROM (
                SELECT LOWER(email)
                FROM customers
                GROUP BY LOWER(email)
                HAVING COUNT(*) > 1
            ) duplicate_customer_emails
        )

    UNION ALL

    SELECT
        3,
        'Production required-field issue rows',
        0::BIGINT,
        (
            SELECT COUNT(*)
            FROM customers
            WHERE first_name IS NULL
               OR BTRIM(first_name) = ''
               OR last_name IS NULL
               OR BTRIM(last_name) = ''
               OR email IS NULL
               OR BTRIM(email) = ''
        )

    UNION ALL

    SELECT
        4,
        'Production invalid booking-date rows',
        0::BIGINT,
        (
            SELECT COUNT(*)
            FROM bookings
            WHERE check_out_date <= check_in_date
        )

    UNION ALL

    SELECT
        5,
        'Production nonpositive-price rows',
        0::BIGINT,
        (
            SELECT COUNT(*)
            FROM bookings
            WHERE total_price <= 0
        )

    UNION ALL

    SELECT
        6,
        'Production orphan-booking rows',
        0::BIGINT,
        (
            SELECT COUNT(*)
            FROM bookings b
            LEFT JOIN customers c
                ON c.customer_id = b.customer_id
            WHERE c.customer_id IS NULL
        )

    UNION ALL

    SELECT
        7,
        'Completed-payment mismatch rows',
        0::BIGINT,
        (
            SELECT COUNT(*)
            FROM bookings b
            JOIN (
                SELECT
                    booking_id,
                    SUM(amount) AS completed_amount
                FROM payments
                WHERE payment_status = 'COMPLETED'
                GROUP BY booking_id
            ) pt
                ON pt.booking_id = b.booking_id
            WHERE b.total_price <> pt.completed_amount
        )

    UNION ALL

    SELECT
        8,
        'Staging duplicate customer email groups',
        1::BIGINT,
        (
            SELECT COUNT(*)
            FROM (
                SELECT LOWER(email)
                FROM staging_customer_import
                WHERE email IS NOT NULL
                GROUP BY LOWER(email)
                HAVING COUNT(*) > 1
            ) staging_duplicates
        )

    UNION ALL

    SELECT
        9,
        'Staging missing-customer-data rows',
        2::BIGINT,
        (
            SELECT COUNT(*)
            FROM staging_customer_import
            WHERE first_name IS NULL
               OR BTRIM(first_name) = ''
               OR last_name IS NULL
               OR BTRIM(last_name) = ''
               OR email IS NULL
               OR BTRIM(email) = ''
        )

    UNION ALL

    SELECT
        10,
        'Staging invalid booking-date rows',
        2::BIGINT,
        (
            SELECT COUNT(*)
            FROM staging_booking_import
            WHERE check_in_date IS NULL
               OR check_out_date IS NULL
               OR check_out_date <= check_in_date
        )

    UNION ALL

    SELECT
        11,
        'Staging nonpositive-price rows',
        2::BIGINT,
        (
            SELECT COUNT(*)
            FROM staging_booking_import
            WHERE total_price IS NULL
               OR total_price <= 0
        )

    UNION ALL

    SELECT
        12,
        'Staging unknown-customer rows',
        1::BIGINT,
        (
            SELECT COUNT(*)
            FROM staging_booking_import s
            LEFT JOIN known_emails k
                ON k.normalized_email = LOWER(s.customer_email)
            WHERE k.normalized_email IS NULL
        )

    UNION ALL

    SELECT
        13,
        'Staging invalid or missing booking-status rows',
        1::BIGINT,
        (
            SELECT COUNT(*)
            FROM staging_booking_import
            WHERE booking_status IS NULL
               OR BTRIM(booking_status) = ''
               OR booking_status NOT IN (
                    'CONFIRMED',
                    'COMPLETED',
                    'CANCELLED'
               )
        )
)
SELECT
    validation_metric,
    expected_count,
    actual_count,
    CASE
        WHEN expected_count = actual_count THEN 'PASS'
        ELSE 'FAIL'
    END AS validation_result
FROM validation_metrics
ORDER BY metric_order;
