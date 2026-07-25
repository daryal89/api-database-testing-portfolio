/*
File: 05_constraint_negative_tests.sql
Project: API and Database Testing Portfolio
Purpose: Verify that database constraints reject invalid records.
Author: Dhruba Aryal

Expected:
The Messages panel should display PASS for SQL-CON-01 through SQL-CON-06.
No invalid records should remain in the tables.
*/

SET search_path TO booking_portfolio, public;

SET client_min_messages TO NOTICE;

-- =========================================================
-- SQL-CON-01
-- Blank first name should be rejected.
-- =========================================================

DO $$
DECLARE
    inserted_customer_id BIGINT;
BEGIN
    BEGIN
        INSERT INTO customers (
            first_name,
            last_name,
            email
        )
        VALUES (
            '',
            'ConstraintTest',
            'blank-first-name@example.com'
        )
        RETURNING customer_id INTO inserted_customer_id;

        DELETE FROM customers
        WHERE customer_id = inserted_customer_id;

        RAISE NOTICE
            'FAIL SQL-CON-01: Blank first name was unexpectedly accepted.';

    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE
                'PASS SQL-CON-01: Blank first name was rejected.';
    END;
END;
$$;


-- =========================================================
-- SQL-CON-02
-- Duplicate customer email should be rejected.
-- =========================================================

DO $$
DECLARE
    inserted_customer_id BIGINT;
BEGIN
    BEGIN
        INSERT INTO customers (
            first_name,
            last_name,
            email
        )
        VALUES (
            'Duplicate',
            'Email',
            'ALEX.LEE@EXAMPLE.COM'
        )
        RETURNING customer_id INTO inserted_customer_id;

        DELETE FROM customers
        WHERE customer_id = inserted_customer_id;

        RAISE NOTICE
            'FAIL SQL-CON-02: Duplicate email was unexpectedly accepted.';

    EXCEPTION
        WHEN unique_violation THEN
            RAISE NOTICE
                'PASS SQL-CON-02: Duplicate email was rejected.';
    END;
END;
$$;


-- =========================================================
-- SQL-CON-03
-- Missing required last name should be rejected.
-- =========================================================

DO $$
DECLARE
    inserted_customer_id BIGINT;
BEGIN
    BEGIN
        INSERT INTO customers (
            first_name,
            last_name,
            email
        )
        VALUES (
            'Missing',
            NULL,
            'missing-last-name@example.com'
        )
        RETURNING customer_id INTO inserted_customer_id;

        DELETE FROM customers
        WHERE customer_id = inserted_customer_id;

        RAISE NOTICE
            'FAIL SQL-CON-03: Missing last name was unexpectedly accepted.';

    EXCEPTION
        WHEN not_null_violation THEN
            RAISE NOTICE
                'PASS SQL-CON-03: Missing last name was rejected.';
    END;
END;
$$;


-- =========================================================
-- SQL-CON-04
-- Booking with an unknown customer should be rejected.
-- =========================================================

DO $$
DECLARE
    inserted_booking_id BIGINT;
BEGIN
    BEGIN
        INSERT INTO bookings (
            customer_id,
            total_price,
            deposit_paid,
            check_in_date,
            check_out_date,
            booking_status
        )
        VALUES (
            999999999,
            300.00,
            TRUE,
            DATE '2026-10-01',
            DATE '2026-10-05',
            'CONFIRMED'
        )
        RETURNING booking_id INTO inserted_booking_id;

        DELETE FROM bookings
        WHERE booking_id = inserted_booking_id;

        RAISE NOTICE
            'FAIL SQL-CON-04: Orphan booking was unexpectedly accepted.';

    EXCEPTION
        WHEN foreign_key_violation THEN
            RAISE NOTICE
                'PASS SQL-CON-04: Orphan booking was rejected.';
    END;
END;
$$;


-- =========================================================
-- SQL-CON-05
-- Checkout date before check-in should be rejected.
-- =========================================================

DO $$
DECLARE
    valid_customer_id BIGINT;
    inserted_booking_id BIGINT;
BEGIN
    SELECT customer_id
    INTO valid_customer_id
    FROM customers
    ORDER BY customer_id
    LIMIT 1;

    BEGIN
        INSERT INTO bookings (
            customer_id,
            total_price,
            deposit_paid,
            check_in_date,
            check_out_date,
            booking_status
        )
        VALUES (
            valid_customer_id,
            300.00,
            TRUE,
            DATE '2026-10-10',
            DATE '2026-10-05',
            'CONFIRMED'
        )
        RETURNING booking_id INTO inserted_booking_id;

        DELETE FROM bookings
        WHERE booking_id = inserted_booking_id;

        RAISE NOTICE
            'FAIL SQL-CON-05: Invalid date sequence was unexpectedly accepted.';

    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE
                'PASS SQL-CON-05: Invalid date sequence was rejected.';
    END;
END;
$$;


-- =========================================================
-- SQL-CON-06
-- Zero total price should be rejected.
-- =========================================================

DO $$
DECLARE
    valid_customer_id BIGINT;
    inserted_booking_id BIGINT;
BEGIN
    SELECT customer_id
    INTO valid_customer_id
    FROM customers
    ORDER BY customer_id
    LIMIT 1;

    BEGIN
        INSERT INTO bookings (
            customer_id,
            total_price,
            deposit_paid,
            check_in_date,
            check_out_date,
            booking_status
        )
        VALUES (
            valid_customer_id,
            0.00,
            FALSE,
            DATE '2026-10-10',
            DATE '2026-10-15',
            'CONFIRMED'
        )
        RETURNING booking_id INTO inserted_booking_id;

        DELETE FROM bookings
        WHERE booking_id = inserted_booking_id;

        RAISE NOTICE
            'FAIL SQL-CON-06: Zero total price was unexpectedly accepted.';

    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE
                'PASS SQL-CON-06: Zero total price was rejected.';
    END;
END;
$$;

SELECT
    'Constraint negative tests completed. Review the Messages panel.' AS test_message;