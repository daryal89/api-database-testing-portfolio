# SQL Database Validation

This folder contains the PostgreSQL schema, synthetic test data,
validation queries, automated validation summary and database-constraint
tests for the booking-system testing portfolio.

## Files

- [Create Database Schema](01_create_schema.sql)
- [Seed Synthetic Test Data](02_seed_test_data.sql)
- [SQL Validation and Analysis Queries](03_validation_queries.sql)
- [Automated Validation Summary](04_validation_summary.sql)
- [Database-Constraint Negative Tests](05_constraint_negative_tests.sql)
- [Day 4 Database Validation Summary — CSV](../reports/day4-database-validation-summary.csv)
- [Day 4 Database Execution Report](../reports/day4-database-validation-execution.md)
- [Requirements Traceability Matrix](../requirements-traceability/README.md)
- [Database Screenshot Evidence](../screenshots/README.md#day-4-postgresql-evidence)

## Database Environment

| Component | Value |
|---|---|
| Database Platform | PostgreSQL |
| Database Name | `booking_test_db` |
| Schema Name | `booking_portfolio` |
| Administration Tool | pgAdmin 4 |
| Environment | Local nonproduction portfolio environment |
| Data Classification | Synthetic test data only |

## Important Project Boundary

The local PostgreSQL database is not the database used by the public
Restful Booker demonstration API.

The local database was created independently to demonstrate:

- Relational database design
- SQL database testing
- Data-quality validation
- Primary-key validation
- Foreign-key validation
- Required-field validation
- Unique-value validation
- Date-integrity validation
- Positive-price validation
- Payment reconciliation
- Staging-data anomaly detection
- Database-constraint testing

Direct API-to-database comparison was not performed because the public
Restful Booker API does not provide authorized access to its underlying
database.

The public API and local PostgreSQL database are documented as separate
testing environments.

## Database Tables

### Production-Style Tables

| Table | Purpose |
|---|---|
| `customers` | Stores synthetic customer information |
| `bookings` | Stores synthetic booking records |
| `payments` | Stores synthetic booking-payment records |

### Staging Tables

| Table | Purpose |
|---|---|
| `staging_customer_import` | Stores controlled customer-import anomalies |
| `staging_booking_import` | Stores controlled booking-import anomalies |

The staging tables intentionally contain known data-quality issues.

These records are testing inputs used to verify that SQL validation
queries correctly detect duplicates, missing values, invalid dates,
invalid prices, unknown customers and unsupported booking statuses.

## SQL File Details

### `01_create_schema.sql`

Creates:

- `booking_portfolio` schema
- `customers` table
- `bookings` table
- `payments` table
- `staging_customer_import` table
- `staging_booking_import` table
- Primary-key constraints
- Foreign-key constraints
- Unique-value controls
- Required-field controls
- Date and price check constraints
- Booking-status and payment-status constraints
- Supporting indexes

### `02_seed_test_data.sql`

Inserts:

- 10 valid synthetic customers
- 15 valid synthetic bookings
- 10 valid synthetic payments
- Controlled customer-staging anomalies
- Controlled booking-staging anomalies

The production-style tables contain valid synthetic records.

The staging tables contain intentional anomalies used for data-quality
testing.

### `03_validation_queries.sql`

Contains **19 SQL validation and analysis queries**.

The validation suite covers:

1. Expected production record counts
2. Complete booking, customer and payment details
3. Customers without bookings
4. Bookings without payment records
5. Duplicate production booking identifiers
6. Duplicate production customer email addresses
7. Missing required production values
8. Invalid production booking-date sequences
9. Zero or negative production booking prices
10. Production bookings without valid customers
11. Payment-to-booking reconciliation
12. Duplicate staging customer email addresses
13. Missing required staging customer data
14. Invalid staging booking-date sequences
15. Zero or negative staging booking prices
16. Staging bookings associated with unknown customers
17. Booking counts and values by status
18. Customer ranking by total booking value
19. Missing or unsupported staging booking-status values

The file demonstrates:

- `SELECT`
- `WHERE`
- `JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `HAVING`
- Aggregate functions
- Common Table Expressions
- Window functions
- Conditional data-quality filtering
- Production and staging-data comparison

### `04_validation_summary.sql`

Produces a consolidated **13-row automated validation report**.

Each validation row contains:

- Validation metric
- Expected count
- Actual count
- Pass or Fail result

The summary checks:

- Production record counts
- Duplicate identifiers
- Duplicate customer emails
- Missing production data
- Invalid production dates
- Invalid production prices
- Orphan bookings
- Payment reconciliation
- Staging duplicate emails
- Missing staging customer data
- Invalid staging booking dates
- Invalid staging booking prices
- Missing or unsupported staging booking statuses

### `05_constraint_negative_tests.sql`

Verifies that PostgreSQL rejects invalid records.

The six negative tests confirm enforcement of:

1. Blank customer first name
2. Duplicate customer email
3. Missing customer last name
4. Booking associated with an unknown customer
5. Checkout date earlier than check-in date
6. Zero booking price

Each negative test is executed inside a controlled transaction so the
database can be returned to its valid state after the expected error is
observed.

## Execution Order

Run the SQL files in this order:

```text
1. 01_create_schema.sql
2. 02_seed_test_data.sql
3. 03_validation_queries.sql
4. 04_validation_summary.sql
5. 05_constraint_negative_tests.sql