# Test Reports

This folder contains the completed PostgreSQL database-validation and
Postman REST API execution reports.

## Files

### Day 4 — PostgreSQL Database Testing

- [Day 4 Database Validation Summary — CSV](day4-database-validation-summary.csv)
- [Day 4 Database Execution Report](day4-database-validation-execution.md)
- [SQL Validation Queries](../sql/03_validation_queries.sql)
- [SQL Testing Documentation](../sql/README.md)

### Day 5 — Postman REST API Testing

- [Day 5 API Execution Report](day5-api-validation-execution.md)
- [Sanitized Collection Runner Result](../postman/day5-postman-collection-run-results.public-sanitized.json)
- [Public-Safe Postman Collection](../postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [Screenshot Evidence Index](../screenshots/README.md)

## Day 4 Database Results

| Metric | Result |
|---|---:|
| SQL validation and analysis queries | 19 |
| Automated summary checks executed | 13 |
| Automated summary checks passed | 13 |
| Automated summary checks failed | 0 |
| Constraint negative tests executed | 6 |
| Constraint negative tests passed | 6 |
| Constraint negative tests failed | 0 |
| Production integrity failures | 0 |

## Day 5 API Results

| Metric | Result |
|---|---:|
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Runtime errors | 0 |
| Average response time | 36 ms |
| Test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Confirmed defects | 3 |

## Result Interpretation

The Day 5 collection completed all 26 requests with zero runtime errors.

The ten failed assertions map to seven failed test cases and three
confirmed defects. They are retained intentionally because they document
observed differences between the assumed requirement baseline and the
public demonstration API's behavior.

The Day 4 and Day 5 reports describe separate environments:

- Day 4 — local PostgreSQL portfolio database
- Day 5 — public Restful Booker API

The reports do not claim direct API-to-database reconciliation.

## Related Documentation

- [Main Project README](../README.md)
- [Test Cases](../test-cases/README.md)
- [Requirements Traceability](../requirements-traceability/README.md)
- [Confirmed Defects](../defect-reports/README.md)
- [Postman Documentation](../postman/README.md)
- [Screenshot Evidence Index](../screenshots/README.md)
