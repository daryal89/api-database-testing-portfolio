# Day 4 Database Validation Execution Summary

## Document Information

| Field | Value |
|---|---|
| Project | API and Database Testing Portfolio |
| Database | booking_test_db |
| Schema | booking_portfolio |
| Database Platform | PostgreSQL |
| Administration Tool | pgAdmin 4 |
| Prepared By | Dhruba Aryal |
| Test Environment | Local nonproduction portfolio environment |
| Test Data | Synthetic data only |
| Execution Status | Completed |

## Purpose

The purpose of this activity was to create and validate a local
relational database model for the sample booking system.

The local database is a portfolio testing environment. It is not the
database used by the public demonstration booking API.

## Database Objects Created

### Production-Style Tables

- customers
- bookings
- payments

### Staging Tables

- staging_customer_import
- staging_booking_import

The staging tables intentionally contain controlled data-quality
problems used to demonstrate the effectiveness of the SQL validation
queries.

## Valid Test-Data Summary

| Table | Record Count |
|---|---:|
| customers | 10 |
| bookings | 15 |
| payments | 10 |

## SQL Deliverables

The following SQL files were executed:

```text
01_create_schema.sql
02_seed_test_data.sql
03_validation_queries.sql
04_validation_summary.sql
05_constraint_negative_tests.sql
```

## Validation-Query Coverage

The SQL validation suite includes:

- Record-count validation
- Customer-to-booking relationship validation
- Customers without bookings identification
- Bookings without payments identification
- Duplicate booking-ID detection
- Duplicate customer-email detection
- Required-field validation
- Booking-date validation
- Positive-price validation
- Foreign-key relationship validation
- Payment-to-booking amount reconciliation
- Staging duplicate detection
- Staging missing-data detection
- Staging invalid-date detection
- Staging invalid-price detection
- Unknown-customer detection
- Booking-status aggregation
- Customer booking-value ranking
- Staging invalid booking status

## Automated Validation Summary

| Metric | Expected | Actual | Result |
|---|---:|---:|---|
| Production duplicate booking ID groups | 0 | 0 | PASS |
| Production duplicate customer email groups | 0 | 0 | PASS |
| Production required-field issue rows | 0 | 0 | PASS |
| Production invalid booking-date rows | 0 | 0 | PASS |
| Production nonpositive-price rows | 0 | 0 | PASS |
| Production orphan-booking rows | 0 | 0 | PASS |
| Completed-payment mismatch rows | 0 | 0 | PASS |
| Staging duplicate customer email groups | 1 | 1 | PASS |
| Staging missing-customer-data rows | 2 | 2 | PASS |
| Staging invalid booking-date rows | 2 | 2 | PASS |
| Staging nonpositive-price rows | 2 | 2 | PASS |
| Staging unknown-customer rows | 1 | 1 | PASS |
| Staging invalid or missing booking-status rows | 1 | 1 | PASS |

## Constraint Negative-Test Results

| Constraint Test | Expected Behavior | Result |
|---|---|---|
| SQL-CON-01 | Reject blank first name | PASS |
| SQL-CON-02 | Reject duplicate customer email | PASS |
| SQL-CON-03 | Reject missing last name | PASS |
| SQL-CON-04 | Reject booking with an unknown customer | PASS |
| SQL-CON-05 | Reject invalid booking-date sequence | PASS |
| SQL-CON-06 | Reject zero total price | PASS |

## Key Findings

1. The production-style tables contained no duplicate booking IDs.
2. The production-style customer data contained no duplicate email
   addresses.
3. Required production customer fields contained no missing or blank
   values.
4. Production booking dates satisfied the required date sequence.
5. Production booking prices were greater than zero.
6. Production bookings were connected to valid customers.
7. Completed payment amounts matched their related booking totals.
8. The SQL queries successfully identified all controlled staging
   anomalies.
9. The database constraints rejected all six tested invalid records.

## Requirements Coverage

The local database activity provides initial or completed coverage for:

- DATA-001: Local booking-data storage
- DATA-003: Unique booking identifiers
- DATA-004: Valid customer relationships
- DATA-005: Required database fields
- DATA-006: Booking-date integrity
- DATA-007: Positive-price integrity

The following requirements remain pending:

- DATA-002: Direct API-to-database comparison
- DATA-008: Database verification after API booking deletion

## Project Limitations

The database was created locally and is not connected directly to the
public demonstration booking API.

Therefore:

- API persistence has not been verified
- API response values have not been compared with this database
- API deletion behavior has not been verified in this database
- The 25 manual and API test cases remain in Not Run status

The successful local SQL results must not be represented as direct
testing of the public API database.

## Execution Evidence

The following execution evidence was captured during Day 4:

```text
day4-01-postgresql-connection.png
day4-01-2-postgresql-connection.png
day4-02-database-tables.png
day4-03-production-row-counts.png
day4-04-bookings-without-payments.png
day4-05-production-integrity-zero-results.png
day4-06-staging-duplicate-emails.png
day4-07-staging-invalid-dates.png
day4-08-staging-invalid-prices.png
day4-09-customer-ranking.png
day4-10-expected-row-counts.png
day4-11-bookings-rows-count.png
day4-12-customer-without-booking.png
day4-13-validation-summary.png
day4-14-constraint-negative-tests.png
day4-15-staging-invalid-booking-status.png
```

## Final Result

The Day 4 local database-validation activity was completed successfully.

| Metric | Result |
|---|---:|
| SQL validation and analysis queries created | 18 |
| Automated validation-summary checks executed | 12 |
| Automated validation-summary checks passed | 12 |
| Automated validation-summary checks failed | 0 |
| Constraint negative tests executed | 6 |
| Constraint negative tests passed | 6 |
| Production integrity failures identified | 0 |

## Conclusion

The local PostgreSQL database successfully demonstrated relational
database design, database constraints, synthetic-data preparation,
data-quality testing and SQL validation.

The production-style records satisfied the expected integrity rules,
while the validation queries correctly detected the intentionally
created staging-data problems.

Direct API-to-database comparison remains a future project activity.

## Author

**Dhruba Aryal**

API and Database Testing Portfolio
