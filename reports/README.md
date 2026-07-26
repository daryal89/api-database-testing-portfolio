# Test Reports

This folder contains completed local PostgreSQL validation results and
will later contain the combined API and database test-execution report.

## Current Files

### day4-database-validation-summary.csv

Contains the 13 automated PostgreSQL validation results, including:

- Validation metric
- Expected count
- Actual count
- PASS or FAIL result

### day4-database-validation-execution.md

Documents:

- Database environment
- Database objects
- Synthetic test-data counts
- SQL validation coverage
- Automated validation results
- Constraint negative-test results
- Database requirements coverage
- Execution evidence
- Project limitations
- Final Day 4 result

## Current Results

| Metric | Result |
|---|---:|
| SQL validation and analysis queries | 19 |
| Automated summary checks executed | 13 |
| Automated summary checks passed | 13 |
| Automated summary checks failed | 0 |
| Constraint negative tests executed | 6 |
| Constraint negative tests passed | 6 |
| Constraint negative tests failed | 0 |

These results apply only to the locally created PostgreSQL portfolio
database.

The 25 manual and API test cases remain **Not Run** pending Postman
execution.
