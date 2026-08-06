# Test and Automation Reports

This folder contains the completed PostgreSQL, Postman and CI automation
reports for the portfolio.

## Files

### Day 4 — PostgreSQL Database Testing

- [Day 4 Database Validation Summary — CSV](day4-database-validation-summary.csv)
- [Day 4 Database Execution Report](day4-database-validation-execution.md)
- [SQL Validation Queries](../sql/03_validation_queries.sql)
- [SQL Testing Documentation](../sql/README.md)

### Day 5 — Postman REST API Testing

- [Day 5 API Execution Report](day5-api-validation-execution.md)
- [Sanitized Collection Runner Result](../postman/day5-postman-collection-run-results.public-sanitized.json)
- [Complete Public-Safe Postman Collection](../postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [Confirmed Defect Reports](../defect-reports/README.md)

### Day 6 — Newman and GitHub Actions

- [Day 6 Newman and GitHub Actions Execution Report](day6-newman-and-github-actions-execution.md)
- [API, Database and Automation Executive Summary](api-database-automation-executive-summary.md)
- [Automation Documentation](../automation/README.md)
- [GitHub Actions Workflow](../.github/workflows/newman-api-tests.yml)
- [CI Smoke Collection](../postman/restful-booker-ci-smoke.public-sanitized.postman_collection.json)
- [Day 6 Automation Evidence](../screenshots/README.md#day-6-automation-evidence)
- [CI Troubleshooting Case Study](../docs/day6-ci-troubleshooting-case-study.md)

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

## Day 6 Automation Results

### CI Smoke/Regression Quality Gate

| Metric | Result |
|---|---:|
| Requests executed | 19 |
| Test scripts executed | 19 |
| Pre-request scripts executed | 2 |
| Assertions executed | 45 |
| Assertions passed | 45 |
| Assertions failed | 0 |
| Runtime errors | 0 |
| GitHub Actions result | Pass |

### Complete Validation Suite

| Metric | Result |
|---|---:|
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Known assertion failures | 10 |
| Runtime errors | 0 |
| CI behavior | Failure tolerated; reports published |

### Automated Output

| Item | Result |
|---|---|
| JSON reports | Generated |
| JUnit reports | Generated |
| Artifact groups | 2 |
| Retention | 14 days |

## Result Interpretation

The Day 5 collection completed all 26 requests with zero runtime errors.

The ten failed assertions map to seven failed test cases and three
confirmed defects. They remain intentionally visible.

Day 6 does not redefine those failures as passes.

Instead, the stable 19-request CI smoke/regression suite acts as the
strict gate, while the complete suite remains available for requirement
and defect reporting.

The Day 4 and Day 5/Day 6 reports describe separate environments:

- Day 4 — local PostgreSQL portfolio database
- Day 5 and Day 6 — public Restful Booker API

The reports do not claim direct API-to-database reconciliation.

## Generated Result Storage

Generated local Newman files are stored under:

```text
newman-results/
```

and remain ignored by Git.

GitHub Actions uploads separate smoke and full-validation artifact groups.
Raw generated files should not be committed without a separate security
review.

## Related Documentation

- [Main Project README](../README.md)
- [Test Cases](../test-cases/README.md)
- [Requirements Traceability](../requirements-traceability/README.md)
- [Confirmed Defects](../defect-reports/README.md)
- [Postman Documentation](../postman/README.md)
- [Automation Documentation](../automation/README.md)
- [Screenshot Evidence Index](../screenshots/README.md)
