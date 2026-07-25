# SQL Database Validation

This folder contains the PostgreSQL schema, synthetic test data,
validation queries, automated validation summary and database-constraint
tests for the booking-system portfolio project.

## Database Environment

| Component | Value |
|---|---|
| Database Platform | PostgreSQL |
| Database Name | booking_test_db |
| Schema Name | booking_portfolio |
| Administration Tool | pgAdmin 4 |
| Environment | Local nonproduction portfolio environment |
| Data Classification | Synthetic test data only |

## Important Project Boundary

The local PostgreSQL database is not the actual database behind the
public demonstration booking API.

The local database is used to demonstrate:

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

Direct API-to-database comparison remains a planned project activity.

## Database Tables

### Production-Style Tables

- `customers`
- `bookings`
- `payments`

### Staging Tables

- `staging_customer_import`
- `staging_booking_import`

The staging tables intentionally contain controlled data-quality issues
used to verify that the SQL validation queries detect expected
anomalies.

## SQL Files

### 01_create_schema.sql

Creates:

- `booking_portfolio` schema
- `customers` table
- `bookings` table
- `payments` table
- `staging_customer_import` table
- `staging_booking_import` table
- Primary keys
- Foreign keys
- Unique controls
- Required-field controls
- Date and price check constraints
- Supporting indexes

### 02_seed_test_data.sql

Inserts:

- 10 valid synthetic customers
- 15 valid synthetic bookings
- 10 valid synthetic payments
- Controlled customer-staging anomalies
- Controlled booking-staging anomalies

### 03_validation_queries.sql

Contains 18 SQL validation and analysis queries covering:

- Record counts
- Complete booking and payment details
- Customers without bookings
- Bookings without payments
- Duplicate booking identifiers
- Duplicate customer emails
- Missing required values
- Invalid booking dates
- Zero and negative booking prices
- Orphan booking records
- Payment-to-booking reconciliation
- Staging duplicate detection
- Staging missing-data detection
- Staging invalid-date detection
- Staging invalid-price detection
- Unknown-customer detection
- Booking-status summaries
- Customer-value ranking

### 04_validation_summary.sql

Produces a consolidated 12-row validation report containing:

- Validation metric
- Expected count
- Actual count
- PASS or FAIL result

### 05_constraint_negative_tests.sql

Verifies that PostgreSQL rejects:

- Blank first names
- Duplicate customer emails
- Missing last names
- Bookings associated with unknown customers
- Checkout dates earlier than check-in dates
- Zero booking prices

## Execution Order

Run the SQL files in this order:

```text
1. 01_create_schema.sql
2. 02_seed_test_data.sql
3. 03_validation_queries.sql
4. 04_validation_summary.sql
5. 05_constraint_negative_tests.sql
```

## Expected Production Record Counts

| Table | Expected Count |
|---|---:|
| customers | 10 |
| bookings | 15 |
| payments | 10 |

## Validation Results

The automated validation summary produced:

| Metric | Result |
|---|---:|
| Validation-summary checks executed | 12 |
| Validation-summary checks passed | 12 |
| Validation-summary checks failed | 0 |

The database-constraint test suite produced:

| Metric | Result |
|---|---:|
| Constraint negative tests executed | 6 |
| Constraint negative tests passed | 6 |
| Constraint negative tests failed | 0 |

These values reflect the local portfolio database only.

## Controlled Staging Anomalies

The staging data intentionally includes:

- One duplicate customer-email group
- Two customer rows with missing or blank required information
- Two booking rows with invalid date sequences
- Two booking rows with zero or negative prices
- One booking row with an unknown customer
- One booking row with a missing status value

These records are intentional testing inputs. They are not production
records and are not unexpected database defects.

## Requirements Coverage

The local database testing provides coverage for:

- `DATA-001` — Local booking-data storage
- `DATA-003` — Unique booking identifiers
- `DATA-004` — Valid customer relationships
- `DATA-005` — Required database fields
- `DATA-006` — Booking-date integrity
- `DATA-007` — Positive-price integrity

The following requirements remain pending:

- `DATA-002` — Direct API-to-database comparison
- `DATA-008` — Database verification after API booking deletion

## Security Rules

The SQL files do not contain:

- Real passwords
- Database connection passwords
- Live API tokens
- Private API keys
- Real customer information
- Employer information
- Production database records
- Payment-card information
- Personal health information

Local PostgreSQL and pgAdmin passwords must never be committed to this
repository.
