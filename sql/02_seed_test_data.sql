/*
File: 02_seed_test_data.sql
Project: API and Database Testing Portfolio
Purpose: Insert valid production-style records and controlled staging anomalies.
Author: Dhruba Aryal

All names and email addresses are synthetic portfolio test data.
The example.com domain is used for demonstration only.
*/

BEGIN;

SET search_path TO booking_portfolio, public;

TRUNCATE TABLE
    staging_booking_import,
    staging_customer_import,
    payments,
    bookings,
    customers
RESTART IDENTITY CASCADE;

-- =========================================================
-- VALID CUSTOMER RECORDS
-- =========================================================

INSERT INTO customers (
    first_name,
    last_name,
    email
)
VALUES
    ('Alex',   'Lee',      'alex.lee@example.com'),
    ('Priya',  'Sharma',   'priya.sharma@example.com'),
    ('Noah',   'Williams', 'noah.williams@example.com'),
    ('Maya',   'Patel',    'maya.patel@example.com'),
    ('Liam',   'Johnson',  'liam.johnson@example.com'),
    ('Emma',   'Davis',    'emma.davis@example.com'),
    ('Ethan',  'Brown',    'ethan.brown@example.com'),
    ('Sophia', 'Wilson',   'sophia.wilson@example.com'),
    ('Ava',    'Martinez', 'ava.martinez@example.com'),
    ('Lucas',  'Taylor',   'lucas.taylor@example.com');

-- =========================================================
-- VALID BOOKING RECORDS
-- =========================================================

INSERT INTO bookings (
    customer_id,
    total_price,
    deposit_paid,
    check_in_date,
    check_out_date,
    additional_needs,
    booking_status
)
SELECT
    c.customer_id,
    v.total_price,
    v.deposit_paid,
    v.check_in_date,
    v.check_out_date,
    v.additional_needs,
    v.booking_status
FROM (
    VALUES
        (
            'alex.lee@example.com',
            350.00,
            TRUE,
            DATE '2026-08-10',
            DATE '2026-08-14',
            'Breakfast',
            'CONFIRMED'
        ),
        (
            'priya.sharma@example.com',
            420.00,
            TRUE,
            DATE '2026-08-12',
            DATE '2026-08-17',
            'Airport pickup',
            'CONFIRMED'
        ),
        (
            'noah.williams@example.com',
            275.00,
            FALSE,
            DATE '2026-07-01',
            DATE '2026-07-04',
            NULL,
            'COMPLETED'
        ),
        (
            'maya.patel@example.com',
            510.00,
            TRUE,
            DATE '2026-09-03',
            DATE '2026-09-08',
            'Late checkout',
            'CONFIRMED'
        ),
        (
            'liam.johnson@example.com',
            190.00,
            FALSE,
            DATE '2026-07-20',
            DATE '2026-07-22',
            NULL,
            'CANCELLED'
        ),
        (
            'emma.davis@example.com',
            640.00,
            TRUE,
            DATE '2026-10-10',
            DATE '2026-10-16',
            'Breakfast and parking',
            'CONFIRMED'
        ),
        (
            'ethan.brown@example.com',
            300.00,
            TRUE,
            DATE '2026-06-05',
            DATE '2026-06-09',
            NULL,
            'COMPLETED'
        ),
        (
            'sophia.wilson@example.com',
            455.00,
            TRUE,
            DATE '2026-08-22',
            DATE '2026-08-27',
            'Quiet room',
            'CONFIRMED'
        ),
        (
            'ava.martinez@example.com',
            225.00,
            FALSE,
            DATE '2026-09-15',
            DATE '2026-09-18',
            NULL,
            'CONFIRMED'
        ),
        (
            'alex.lee@example.com',
            390.00,
            TRUE,
            DATE '2026-05-10',
            DATE '2026-05-14',
            'Breakfast',
            'COMPLETED'
        ),
        (
            'priya.sharma@example.com',
            580.00,
            TRUE,
            DATE '2026-11-02',
            DATE '2026-11-08',
            'Airport pickup',
            'CONFIRMED'
        ),
        (
            'maya.patel@example.com',
            260.00,
            FALSE,
            DATE '2026-12-01',
            DATE '2026-12-04',
            NULL,
            'CONFIRMED'
        ),
        (
            'emma.davis@example.com',
            710.00,
            TRUE,
            DATE '2026-12-15',
            DATE '2026-12-22',
            'Breakfast',
            'CONFIRMED'
        ),
        (
            'sophia.wilson@example.com',
            330.00,
            FALSE,
            DATE '2026-07-28',
            DATE '2026-08-01',
            NULL,
            'CANCELLED'
        ),
        (
            'ava.martinez@example.com',
            475.00,
            TRUE,
            DATE '2027-01-05',
            DATE '2027-01-10',
            'Parking',
            'CONFIRMED'
        )
) AS v (
    email,
    total_price,
    deposit_paid,
    check_in_date,
    check_out_date,
    additional_needs,
    booking_status
)
JOIN customers c
    ON LOWER(c.email) = LOWER(v.email);

-- =========================================================
-- VALID PAYMENT RECORDS
-- Ten bookings receive completed payments.
-- Five bookings intentionally have no payment record.
-- =========================================================

INSERT INTO payments (
    booking_id,
    payment_status,
    amount,
    payment_date,
    payment_method,
    transaction_reference
)
SELECT
    b.booking_id,
    v.payment_status,
    v.amount,
    v.payment_date,
    v.payment_method,
    v.transaction_reference
FROM (
    VALUES
        (
            'alex.lee@example.com',
            DATE '2026-08-10',
            'COMPLETED',
            350.00,
            TIMESTAMPTZ '2026-07-20 09:15:00-04',
            'CARD',
            'TXN-1001'
        ),
        (
            'priya.sharma@example.com',
            DATE '2026-08-12',
            'COMPLETED',
            420.00,
            TIMESTAMPTZ '2026-07-21 10:30:00-04',
            'CARD',
            'TXN-1002'
        ),
        (
            'noah.williams@example.com',
            DATE '2026-07-01',
            'COMPLETED',
            275.00,
            TIMESTAMPTZ '2026-06-15 08:20:00-04',
            'BANK_TRANSFER',
            'TXN-1003'
        ),
        (
            'maya.patel@example.com',
            DATE '2026-09-03',
            'COMPLETED',
            510.00,
            TIMESTAMPTZ '2026-07-22 11:45:00-04',
            'CARD',
            'TXN-1004'
        ),
        (
            'emma.davis@example.com',
            DATE '2026-10-10',
            'COMPLETED',
            640.00,
            TIMESTAMPTZ '2026-07-23 12:10:00-04',
            'CARD',
            'TXN-1005'
        ),
        (
            'ethan.brown@example.com',
            DATE '2026-06-05',
            'COMPLETED',
            300.00,
            TIMESTAMPTZ '2026-05-18 14:25:00-04',
            'BANK_TRANSFER',
            'TXN-1006'
        ),
        (
            'sophia.wilson@example.com',
            DATE '2026-08-22',
            'COMPLETED',
            455.00,
            TIMESTAMPTZ '2026-07-24 09:40:00-04',
            'CARD',
            'TXN-1007'
        ),
        (
            'ava.martinez@example.com',
            DATE '2026-09-15',
            'COMPLETED',
            225.00,
            TIMESTAMPTZ '2026-07-24 10:05:00-04',
            'VOUCHER',
            'TXN-1008'
        ),
        (
            'alex.lee@example.com',
            DATE '2026-05-10',
            'COMPLETED',
            390.00,
            TIMESTAMPTZ '2026-04-15 15:00:00-04',
            'CARD',
            'TXN-1009'
        ),
        (
            'priya.sharma@example.com',
            DATE '2026-11-02',
            'COMPLETED',
            580.00,
            TIMESTAMPTZ '2026-07-24 16:15:00-04',
            'BANK_TRANSFER',
            'TXN-1010'
        )
) AS v (
    email,
    check_in_date,
    payment_status,
    amount,
    payment_date,
    payment_method,
    transaction_reference
)
JOIN customers c
    ON LOWER(c.email) = LOWER(v.email)
JOIN bookings b
    ON b.customer_id = c.customer_id
   AND b.check_in_date = v.check_in_date;

-- =========================================================
-- STAGING CUSTOMER DATA
-- These controlled anomalies are intentional.
-- =========================================================

INSERT INTO staging_customer_import (
    source_row_number,
    first_name,
    last_name,
    email,
    source_system
)
VALUES
    (
        1,
        'Import',
        'Customer',
        'import1@example.com',
        'PORTFOLIO_CSV'
    ),
    (
        2,
        'Duplicate',
        'Person',
        'duplicate.person@example.com',
        'PORTFOLIO_CSV'
    ),
    (
        3,
        'Duplicate',
        'Person',
        'duplicate.person@example.com',
        'PORTFOLIO_CSV'
    ),
    (
        4,
        'Missing',
        'Email',
        NULL,
        'PORTFOLIO_CSV'
    ),
    (
        5,
        '',
        'BlankName',
        'blank.name@example.com',
        'PORTFOLIO_CSV'
    ),
    (
        6,
        'Valid',
        'Person',
        'valid.person@example.com',
        'PORTFOLIO_CSV'
    );

-- =========================================================
-- STAGING BOOKING DATA
-- These controlled anomalies are intentional.
-- =========================================================

INSERT INTO staging_booking_import (
    source_row_number,
    customer_email,
    total_price,
    deposit_paid,
    check_in_date,
    check_out_date,
    booking_status,
    source_system
)
VALUES
    (
        1,
        'import1@example.com',
        250.00,
        TRUE,
        DATE '2026-09-01',
        DATE '2026-09-04',
        'CONFIRMED',
        'PORTFOLIO_CSV'
    ),
    (
        2,
        'duplicate.person@example.com',
        0.00,
        FALSE,
        DATE '2026-09-05',
        DATE '2026-09-07',
        'CONFIRMED',
        'PORTFOLIO_CSV'
    ),
    (
        3,
        'duplicate.person@example.com',
        -50.00,
        FALSE,
        DATE '2026-09-10',
        DATE '2026-09-12',
        'CONFIRMED',
        'PORTFOLIO_CSV'
    ),
    (
        4,
        'valid.person@example.com',
        300.00,
        TRUE,
        DATE '2026-10-10',
        DATE '2026-10-08',
        'CONFIRMED',
        'PORTFOLIO_CSV'
    ),
    (
        5,
        'import1@example.com',
        350.00,
        TRUE,
        DATE '2026-11-15',
        DATE '2026-11-15',
        'CONFIRMED',
        'PORTFOLIO_CSV'
    ),
    (
        6,
        'unknown.customer@example.com',
        400.00,
        FALSE,
        DATE '2026-12-01',
        DATE '2026-12-05',
        'CONFIRMED',
        'PORTFOLIO_CSV'
    ),
    (
        7,
        'import1@example.com',
        450.00,
        TRUE,
        DATE '2027-01-10',
        DATE '2027-01-14',
        NULL,
        'PORTFOLIO_CSV'
    );

COMMIT;

-- Confirm the main record counts.

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