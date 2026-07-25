/*
File: 03_validation_queries.sql
Project: API and Database Testing Portfolio
Purpose: Validate production-style records and identify staging anomalies.
Author: Dhruba Aryal

Execution:
Run queries individually when capturing screenshots.
The production integrity queries should return zero invalid rows.
The staging queries should return the intentional anomalies.
*/

SET search_path TO booking_portfolio, public;

-- =========================================================
-- SQL-VAL-01
-- Validate expected row counts.
-- Expected: customers=10, bookings=15, payments=10
-- =========================================================

SELECT
    'customers' AS table_name,
    COUNT(*) AS record_count
FROM customers

UNION ALL

SELECT
    'bookings',
    COUNT(*)
FROM bookings

UNION ALL

SELECT
    'payments',
    COUNT(*)
FROM payments

ORDER BY table_name;


-- =========================================================
-- SQL-VAL-02
-- Display complete booking, customer, and payment information.
-- Expected: 15 booking rows
-- =========================================================

SELECT
    b.booking_id,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    b.total_price,
    b.deposit_paid,
    b.check_in_date,
    b.check_out_date,
    b.booking_status,
    b.additional_needs,
    p.payment_id,
    p.payment_status,
    p.amount AS payment_amount,
    p.payment_method,
    p.transaction_reference
FROM bookings b
JOIN customers c
    ON c.customer_id = b.customer_id
LEFT JOIN payments p
    ON p.booking_id = b.booking_id
ORDER BY b.booking_id;


-- =========================================================
-- SQL-VAL-03
-- Find customers without bookings.
-- Expected: one customer, Lucas Taylor
-- =========================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM customers c
LEFT JOIN bookings b
    ON b.customer_id = c.customer_id
WHERE b.booking_id IS NULL
ORDER BY c.customer_id;


-- =========================================================
-- SQL-VAL-04
-- Find bookings without payment records.
-- Expected: five booking rows
-- =========================================================

SELECT
    b.booking_id,
    c.first_name,
    c.last_name,
    b.total_price,
    b.booking_status,
    b.check_in_date,
    b.check_out_date
FROM bookings b
JOIN customers c
    ON c.customer_id = b.customer_id
LEFT JOIN payments p
    ON p.booking_id = b.booking_id
WHERE p.payment_id IS NULL
ORDER BY b.booking_id;


-- =========================================================
-- SQL-VAL-05
-- Detect duplicate production booking identifiers.
-- Expected: zero rows
-- =========================================================

SELECT
    booking_id,
    COUNT(*) AS duplicate_count
FROM bookings
GROUP BY booking_id
HAVING COUNT(*) > 1;


-- =========================================================
-- SQL-VAL-06
-- Detect duplicate production customer emails.
-- Expected: zero rows
-- =========================================================

SELECT
    LOWER(email) AS normalized_email,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY LOWER(email)
HAVING COUNT(*) > 1;


-- =========================================================
-- SQL-VAL-07
-- Detect missing or blank required production data.
-- Expected: zero rows
-- =========================================================

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customers
WHERE first_name IS NULL
   OR BTRIM(first_name) = ''
   OR last_name IS NULL
   OR BTRIM(last_name) = ''
   OR email IS NULL
   OR BTRIM(email) = '';


-- =========================================================
-- SQL-VAL-08
-- Detect invalid date sequences in production bookings.
-- Expected: zero rows
-- =========================================================

SELECT
    booking_id,
    check_in_date,
    check_out_date
FROM bookings
WHERE check_out_date <= check_in_date;


-- =========================================================
-- SQL-VAL-09
-- Detect zero or negative prices in production bookings.
-- Expected: zero rows
-- =========================================================

SELECT
    booking_id,
    total_price
FROM bookings
WHERE total_price <= 0;


-- =========================================================
-- SQL-VAL-10
-- Detect production bookings without a valid customer.
-- Expected: zero rows
-- =========================================================

SELECT
    b.booking_id,
    b.customer_id
FROM bookings b
LEFT JOIN customers c
    ON c.customer_id = b.customer_id
WHERE c.customer_id IS NULL;


-- =========================================================
-- SQL-VAL-11
-- Compare completed payment totals with booking prices.
-- Expected: zero mismatches
-- =========================================================

WITH completed_payment_totals AS (
    SELECT
        booking_id,
        SUM(amount) AS completed_amount
    FROM payments
    WHERE payment_status = 'COMPLETED'
    GROUP BY booking_id
)
SELECT
    b.booking_id,
    b.total_price,
    pt.completed_amount,
    b.total_price - pt.completed_amount AS difference
FROM bookings b
JOIN completed_payment_totals pt
    ON pt.booking_id = b.booking_id
WHERE b.total_price <> pt.completed_amount
ORDER BY b.booking_id;


-- =========================================================
-- SQL-VAL-12
-- Detect duplicate emails in staging customer data.
-- Expected: one duplicate group
-- =========================================================

SELECT
    LOWER(email) AS normalized_email,
    COUNT(*) AS duplicate_count
FROM staging_customer_import
WHERE email IS NOT NULL
GROUP BY LOWER(email)
HAVING COUNT(*) > 1;


-- =========================================================
-- SQL-VAL-13
-- Detect missing or blank required staging customer data.
-- Expected: two rows
-- =========================================================

SELECT
    source_row_number,
    first_name,
    last_name,
    email,
    source_system
FROM staging_customer_import
WHERE first_name IS NULL
   OR BTRIM(first_name) = ''
   OR last_name IS NULL
   OR BTRIM(last_name) = ''
   OR email IS NULL
   OR BTRIM(email) = ''
ORDER BY source_row_number;


-- =========================================================
-- SQL-VAL-14
-- Detect invalid date sequences in staging booking data.
-- Expected: two rows
-- =========================================================

SELECT
    source_row_number,
    customer_email,
    check_in_date,
    check_out_date
FROM staging_booking_import
WHERE check_in_date IS NULL
   OR check_out_date IS NULL
   OR check_out_date <= check_in_date
ORDER BY source_row_number;


-- =========================================================
-- SQL-VAL-15
-- Detect zero or negative prices in staging booking data.
-- Expected: two rows
-- =========================================================

SELECT
    source_row_number,
    customer_email,
    total_price
FROM staging_booking_import
WHERE total_price IS NULL
   OR total_price <= 0
ORDER BY source_row_number;


-- =========================================================
-- SQL-VAL-16
-- Detect staging bookings whose customer is unknown to both
-- the production customer table and staging customer import.
-- Expected: one row
-- =========================================================

WITH known_emails AS (
    SELECT LOWER(email) AS normalized_email
    FROM customers

    UNION

    SELECT LOWER(email)
    FROM staging_customer_import
    WHERE email IS NOT NULL
)
SELECT
    s.source_row_number,
    s.customer_email,
    s.total_price,
    s.check_in_date,
    s.check_out_date
FROM staging_booking_import s
LEFT JOIN known_emails k
    ON k.normalized_email = LOWER(s.customer_email)
WHERE k.normalized_email IS NULL
ORDER BY s.source_row_number;


-- =========================================================
-- SQL-VAL-17
-- Summarize booking counts and value by status.
-- This is a business-analysis query.
-- =========================================================

SELECT
    booking_status,
    COUNT(*) AS booking_count,
    SUM(total_price) AS total_booking_value,
    ROUND(AVG(total_price), 2) AS average_booking_value,
    MIN(total_price) AS minimum_booking_value,
    MAX(total_price) AS maximum_booking_value
FROM bookings
GROUP BY booking_status
ORDER BY booking_status;


-- =========================================================
-- SQL-VAL-18
-- Rank customers by total booking value using a CTE
-- and a window function.
-- =========================================================

WITH customer_booking_totals AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        COUNT(b.booking_id) AS booking_count,
        COALESCE(SUM(b.total_price), 0) AS total_booking_value
    FROM customers c
    LEFT JOIN bookings b
        ON b.customer_id = c.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email
)
SELECT
    DENSE_RANK() OVER (
        ORDER BY total_booking_value DESC
    ) AS customer_rank,
    customer_id,
    first_name,
    last_name,
    email,
    booking_count,
    total_booking_value
FROM customer_booking_totals
ORDER BY customer_rank, customer_id;