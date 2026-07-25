/*
File: 01_create_schema.sql
Project: API and Database Testing Portfolio
Purpose: Create the booking portfolio schema and database tables.
Author: Dhruba Aryal

Important:
This script drops and recreates the portfolio tables.
Run it only inside the local booking_test_db database.
*/

BEGIN;

CREATE SCHEMA IF NOT EXISTS booking_portfolio;

SET search_path TO booking_portfolio, public;

DROP TABLE IF EXISTS staging_booking_import;
DROP TABLE IF EXISTS staging_customer_import;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id BIGINT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_customers
        PRIMARY KEY (customer_id),

    CONSTRAINT ck_customers_first_name_not_blank
        CHECK (BTRIM(first_name) <> ''),

    CONSTRAINT ck_customers_last_name_not_blank
        CHECK (BTRIM(last_name) <> ''),

    CONSTRAINT ck_customers_email_not_blank
        CHECK (BTRIM(email) <> '')
);

CREATE UNIQUE INDEX uq_customers_email_case_insensitive
    ON customers (LOWER(email));

CREATE TABLE bookings (
    booking_id BIGINT GENERATED ALWAYS AS IDENTITY,
    customer_id BIGINT NOT NULL,
    total_price NUMERIC(10, 2) NOT NULL,
    deposit_paid BOOLEAN NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    additional_needs VARCHAR(255),
    booking_status VARCHAR(20) NOT NULL DEFAULT 'CONFIRMED',
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_bookings
        PRIMARY KEY (booking_id),

    CONSTRAINT fk_bookings_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT ck_bookings_positive_price
        CHECK (total_price > 0),

    CONSTRAINT ck_bookings_valid_date_sequence
        CHECK (check_out_date > check_in_date),

    CONSTRAINT ck_bookings_valid_status
        CHECK (
            booking_status IN (
                'CONFIRMED',
                'COMPLETED',
                'CANCELLED'
            )
        )
);

CREATE INDEX idx_bookings_customer_id
    ON bookings (customer_id);

CREATE INDEX idx_bookings_dates
    ON bookings (check_in_date, check_out_date);

CREATE INDEX idx_bookings_status
    ON bookings (booking_status);

CREATE TABLE payments (
    payment_id BIGINT GENERATED ALWAYS AS IDENTITY,
    booking_id BIGINT NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    payment_date TIMESTAMPTZ NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    transaction_reference VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_payments
        PRIMARY KEY (payment_id),

    CONSTRAINT fk_payments_booking
        FOREIGN KEY (booking_id)
        REFERENCES bookings (booking_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT uq_payments_transaction_reference
        UNIQUE (transaction_reference),

    CONSTRAINT ck_payments_positive_amount
        CHECK (amount > 0),

    CONSTRAINT ck_payments_valid_status
        CHECK (
            payment_status IN (
                'PENDING',
                'COMPLETED',
                'FAILED',
                'REFUNDED'
            )
        ),

    CONSTRAINT ck_payments_valid_method
        CHECK (
            payment_method IN (
                'CARD',
                'BANK_TRANSFER',
                'CASH',
                'VOUCHER'
            )
        )
);

CREATE INDEX idx_payments_booking_id
    ON payments (booking_id);

CREATE INDEX idx_payments_status
    ON payments (payment_status);

-- Staging tables intentionally have fewer controls.
-- They simulate raw imported data that requires validation.

CREATE TABLE staging_customer_import (
    source_row_number INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150),
    source_system VARCHAR(50),
    loaded_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE staging_booking_import (
    source_row_number INTEGER,
    customer_email VARCHAR(150),
    total_price NUMERIC(10, 2),
    deposit_paid BOOLEAN,
    check_in_date DATE,
    check_out_date DATE,
    booking_status VARCHAR(20),
    source_system VARCHAR(50),
    loaded_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON SCHEMA booking_portfolio IS
    'Local portfolio schema for booking database testing.';

COMMENT ON TABLE customers IS
    'Validated customer master records.';

COMMENT ON TABLE bookings IS
    'Validated booking transactions linked to customers.';

COMMENT ON TABLE payments IS
    'Validated payment records linked to bookings.';

COMMENT ON TABLE staging_customer_import IS
    'Raw customer-import data used for data-quality testing.';

COMMENT ON TABLE staging_booking_import IS
    'Raw booking-import data used for data-quality testing.';

COMMIT;