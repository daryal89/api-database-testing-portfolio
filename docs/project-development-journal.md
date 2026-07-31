# Project Development Journal

## Purpose

This journal preserves the chronological development of the API and
database testing portfolio.

Historical statements such as **Not Run**, **Draft—Pending Validation**
and planned Postman work describe the project status at the end of the
specific day. They are not the current project status.

For the current execution totals and confirmed findings, see the
[main project README](../README.md).

## Day 1 Deliverables

Day 1 established the professional GitHub foundation for the project.

Completed work:

- Reviewed and optimized the GitHub account
- Removed or privatized weak and unfinished public repositories
- Updated the GitHub profile information
- Created a professional GitHub profile README
- Created the public `api-database-testing-portfolio` repository
- Added a professional repository description
- Added repository topics
- Created the initial project README
- Created the project folder structure
- Added folder-level README files
- Reviewed the public profile using an InPrivate browser

## Day 2 Deliverables

Day 2 established the requirements, test-planning and initial manual
testing foundation.

Files created:

```text
requirements-traceability/booking-system-requirements.md
test-plan/booking-system-test-plan.md
test-cases/booking-system-test-cases.xlsx
test-cases/booking-system-test-cases.csv
```

Day 2 accomplishments included:

- Reviewed essential software-testing concepts
- Documented SDLC and STLC fundamentals
- Reviewed positive, negative and boundary-value testing
- Reviewed severity, priority and the defect lifecycle
- Created the booking-system requirements baseline
- Defined functional, database and nonfunctional requirements
- Created a comprehensive software test plan
- Created the initial Excel test-case workbook
- Created the Requirements worksheet
- Created the Test_Data worksheet
- Created the first 10 manual test cases
- Created a GitHub-previewable CSV file

At the end of Day 2, all test cases remained in **Not Run** status
because execution had not started.

## Day 3 Deliverables

Day 3 expanded the project’s manual/API test coverage and introduced
formal requirements traceability and defect-documentation examples.

Files added or updated:

```text
test-cases/booking-system-test-cases.xlsx
test-cases/booking-system-test-cases.csv
requirements-traceability/booking-system-requirements-traceability-matrix.xlsx
requirements-traceability/booking-system-requirements-traceability-matrix.csv
defect-reports/booking-system-defect-report-drafts.xlsx
defect-reports/booking-system-defect-report-drafts.csv
```

Day 3 accomplishments included:

- Expanded the test suite from 10 to 25 test cases
- Added authentication, booking, retrieval, update and deletion coverage
- Added required-field, invalid-date and price-boundary scenarios
- Created a formal Requirements Traceability Matrix
- Mapped functional requirements to test cases
- Created three clearly labeled hypothetical defect-report drafts
- Updated folder-level documentation
- Updated the main project status

At the end of Day 3:

- All API test cases remained **Not Run**
- All three defect reports remained **Draft—Pending Validation**

These were historical Day 3 statuses and were updated after Day 5
execution.

## Day 4 Deliverables

Day 4 established the local PostgreSQL database-testing and data-quality
foundation.

Files added:

```text
sql/01_create_schema.sql
sql/02_seed_test_data.sql
sql/03_validation_queries.sql
sql/04_validation_summary.sql
sql/05_constraint_negative_tests.sql
reports/day4-database-validation-summary.csv
reports/day4-database-validation-execution.md
```

Day 4 accomplishments included:

- Created the `booking_test_db` database
- Created the `booking_portfolio` schema
- Created customer, booking, payment and staging tables
- Added key, required-field and business-rule constraints
- Inserted synthetic production-style records
- Added controlled staging anomalies
- Created 19 SQL validation and analysis queries
- Created 13 automated validation-summary checks
- Executed six database-constraint negative tests
- Updated database requirements in the RTM
- Added database execution evidence

### Day 4 Validation Results

| Metric | Result |
|---|---:|
| SQL validation and analysis queries created | 19 |
| Automated summary checks executed | 13 |
| Automated summary checks passed | 13 |
| Automated summary checks failed | 0 |
| Constraint negative tests executed | 6 |
| Constraint negative tests passed | 6 |
| Constraint negative tests failed | 0 |
| Production integrity failures identified | 0 |

The local database is a portfolio testing environment and is not the
database used by the public demonstration API.

## Day 5 Deliverables

Day 5 completed the REST API testing and Postman execution phase.

Files added or updated:

```text
postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json
postman/restful-booker-template.public-sanitized.postman_environment.json
postman/day5-postman-collection-run-results.public-sanitized.json
reports/day5-api-validation-execution.md
test-cases/booking-system-test-cases.xlsx
test-cases/booking-system-test-cases.csv
defect-reports/booking-system-defect-reports.xlsx
defect-reports/booking-system-defect-reports.csv
defect-reports/DEF-API-001-invalid-booking-date-sequence.md
defect-reports/DEF-API-002-nonpositive-total-price.md
defect-reports/DEF-API-003-missing-required-fields-return-500.md
requirements-traceability/booking-system-requirements-traceability-matrix.xlsx
requirements-traceability/booking-system-requirements-traceability-matrix.csv
```

Day 5 accomplishments included:

- Created and executed a 26-request Postman collection
- Automated authentication-token and booking-ID storage
- Added positive, negative, boundary, authorization, response-body and
  response-time assertions
- Executed all 25 manual/API test cases
- Passed 18 test cases
- Failed seven test cases
- Confirmed three API defects
- Converted one draft into a confirmed defect
- Rejected two hypothetical defect drafts
- Completed the run with zero runtime errors
- Sanitized the exported Postman assets
- Updated requirements traceability

### Day 5 Execution Results

| Metric | Result |
|---|---:|
| Requests created | 26 |
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Runtime errors | 0 |
| Average response time | 36 ms |
| Manual/API test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Test cases blocked | 0 |
| Confirmed API defects | 3 |

The failed tests represent observed API behavior rather than Postman
runtime or configuration errors.

## Current Final Status

After Day 5:

| Metric | Result |
|---|---:|
| API test cases executed | 25 |
| API test cases passed | 18 |
| API test cases failed | 7 |
| Postman requests executed | 26 |
| Assertions executed | 61 |
| Runtime errors | 0 |
| Confirmed API defects | 3 |

The Day 1 through Day 3 planning and draft history is preserved above for
auditability and learning purposes.
