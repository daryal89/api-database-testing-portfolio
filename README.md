# API and Database Testing Portfolio

## Project Overview

This portfolio demonstrates an end-to-end quality-assurance workflow for
a sample online booking system.

The project includes:

- Requirements analysis
- Professional test planning
- Manual and REST API test-case design
- Requirements traceability
- PostgreSQL database validation
- Postman collection development
- Positive, negative, boundary-value and authorization testing
- Automated API assertions
- Defect investigation and reporting
- Test-execution reporting
- Public-safe credential and test-data handling

The REST API phase uses the public **Restful Booker** demonstration API.
The database phase uses a separate locally created PostgreSQL portfolio
database.

Because the public API does not provide authorized access to its
underlying database, direct API-to-database comparison was not
performed. API results and local database results are documented as
separate testing activities.

## Key Results

| Area | Final Result |
|---|---:|
| Manual/API test cases designed | 25 |
| Manual/API test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Postman requests executed | 26 |
| Postman assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Postman runtime errors | 0 |
| Average API response time | 36 ms |
| Confirmed API defects | 3 |
| SQL validation and analysis queries | 19 |
| Automated database-summary checks passed | 13 of 13 |
| Database-constraint negative tests passed | 6 of 6 |

The seven failed API test cases represent observed application behavior,
not Postman configuration or runtime failures.

## Quick Links

### Planning and Requirements

- [Software Test Plan](test-plan/booking-system-test-plan.md)
- [Requirements Baseline](requirements-traceability/booking-system-requirements.md)
- [Requirements Traceability Matrix — CSV](requirements-traceability/booking-system-requirements-traceability-matrix.csv)

### Test Cases and Defects

- [Manual/API Test Cases — CSV](test-cases/booking-system-test-cases.csv)
- [Confirmed Defect Reports — CSV](defect-reports/booking-system-defect-reports.csv)
- [DEF-API-001 — Invalid Date Sequence](defect-reports/DEF-API-001-invalid-booking-date-sequence.md)
- [DEF-API-002 — Nonpositive Total Price](defect-reports/DEF-API-002-nonpositive-total-price.md)
- [DEF-API-003 — Missing Required Fields Return HTTP 500](defect-reports/DEF-API-003-missing-required-fields-return-500.md)

### Postman API Testing

- [Public-Safe Postman Collection](postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [Sanitized Postman Environment Template](postman/restful-booker-template.public-sanitized.postman_environment.json)
- [Sanitized Collection Runner Result](postman/day5-postman-collection-run-results.public-sanitized.json)
- [Day 5 API Execution Report](reports/day5-api-validation-execution.md)

### PostgreSQL Database Testing

- [SQL Database Testing Documentation](sql/README.md)
- [SQL Validation Queries](sql/03_validation_queries.sql)
- [Automated Database Validation Summary](reports/day4-database-validation-summary.csv)
- [Day 4 Database Execution Report](reports/day4-database-validation-execution.md)

### Evidence

- [Execution Screenshots](screenshots/README.md)

## Business Scenario

The sample online booking system allows users to:

- Authenticate
- Create a booking
- Retrieve booking information
- Search for bookings
- Fully update a booking
- Partially update a booking
- Delete a booking

A booking may contain:

- First name
- Last name
- Total price
- Deposit-paid status
- Check-in date
- Checkout date
- Optional additional needs

Testing validates whether the system:

- Processes valid information correctly
- Rejects invalid or missing information appropriately
- Enforces authentication and authorization requirements
- Returns accurate API responses
- Maintains database integrity
- Handles expected and unexpected error conditions clearly

## Project Objectives

The objectives of this project are to:

1. Create a professional software test plan
2. Define clear and testable system requirements
3. Develop functional, positive, negative and boundary-value test cases
4. Demonstrate requirement-to-test-case traceability
5. Document defects using a professional reporting format
6. Test REST API endpoints with Postman
7. Validate HTTP status codes, response bodies and response times
8. Validate database records using SQL
9. Execute end-to-end booking CRUD workflows
10. Record actual results and Pass or Fail status accurately
11. Demonstrate responsible credential and test-data handling
12. Build a recruiter-friendly quality-assurance portfolio

## Testing Scope

### In Scope

- Requirement analysis
- Test planning
- Authentication testing
- Booking-creation testing
- Booking-retrieval testing
- Booking-search testing
- Full-update testing
- Partial-update testing
- Booking-deletion testing
- Required-field validation
- Date validation
- Price validation
- Positive testing
- Negative testing
- Boundary-value testing
- Authorization testing
- API status-code validation
- API response-body validation
- API response-time validation
- PostgreSQL database validation
- Data-integrity validation
- Requirements traceability
- Defect reporting
- Test-execution reporting
- Public repository security review

### Out of Scope

- Production security penetration testing
- High-volume load testing
- Stress testing
- Production performance testing
- Payment-card processing
- Mobile application testing
- Production customer data
- Production deployment
- Disaster-recovery testing
- Full accessibility certification
- Direct API-to-database validation without authorized database access

## Testing Approach

The project follows this structured testing process:

1. Define the portfolio requirement baseline
2. Analyze requirements for clarity and testability
3. Create a professional test plan
4. Design detailed manual and API test cases
5. Map requirements to test cases
6. Prepare hypothetical defect-report drafts
7. Build and execute the local PostgreSQL validation suite
8. Build and execute the Postman API collection
9. Record actual results and test status
10. Investigate failed assertions
11. Confirm, reject or revise defect drafts
12. Update the Requirements Traceability Matrix
13. Sanitize public portfolio assets
14. Prepare database and API execution reports
15. Review the public repository for consistency and security

## Skills Demonstrated

### Software Testing

- Requirement analysis
- Test planning
- Test-scenario development
- Test-case development
- Functional testing
- Positive testing
- Negative testing
- Boundary-value analysis
- Equivalence partitioning
- Authentication testing
- Authorization testing
- Business-rule validation
- Error-handling validation
- Regression-test planning
- Defect reporting
- Requirements traceability
- Test-execution reporting

### REST API Testing

- REST API fundamentals
- HTTP methods
- Status-code validation
- Response-body validation
- Response-time validation
- Authentication-token handling
- Environment-variable management
- Positive API testing
- Negative API testing
- CRUD workflow testing
- Full and partial update testing
- Authorization testing
- Postman collection development
- Collection Runner execution
- Automated Postman assertions
- Public-safe Postman exports

### Database Testing

- SQL
- PostgreSQL
- Schema and table validation
- Data-integrity testing
- Null-value validation
- Duplicate detection
- Primary-key validation
- Foreign-key validation
- Check-constraint validation
- Staging-data validation
- Data-quality analysis
- Automated SQL summary checks
- Negative database-constraint testing

### Documentation and Tools

- Git
- GitHub
- Markdown
- Microsoft Excel
- Postman
- PostgreSQL
- pgAdmin 4
- Requirements documentation
- Test-plan documentation
- Defect-report documentation
- Test-data documentation
- Execution-report documentation

## Technologies and Tools

- Git
- GitHub
- Microsoft Excel
- Markdown
- Postman Desktop
- PostgreSQL
- pgAdmin 4
- SQL
- Microsoft Edge or Google Chrome
- Windows 10 or Windows 11

## Project Structure

```text
api-database-testing-portfolio/
├── .gitignore
├── LICENSE
├── README.md
├── test-plan/
│   ├── README.md
│   └── booking-system-test-plan.md
├── test-cases/
│   ├── README.md
│   ├── booking-system-test-cases.xlsx
│   └── booking-system-test-cases.csv
├── defect-reports/
│   ├── README.md
│   ├── booking-system-defect-reports.xlsx
│   ├── booking-system-defect-reports.csv
│   ├── DEF-API-001-invalid-booking-date-sequence.md
│   ├── DEF-API-002-nonpositive-total-price.md
│   └── DEF-API-003-missing-required-fields-return-500.md
├── requirements-traceability/
│   ├── README.md
│   ├── booking-system-requirements.md
│   ├── booking-system-requirements-traceability-matrix.xlsx
│   └── booking-system-requirements-traceability-matrix.csv
├── postman/
│   ├── README.md
│   ├── restful-booker-api-portfolio.public-sanitized.postman_collection.json
│   ├── restful-booker-template.public-sanitized.postman_environment.json
│   └── day5-postman-collection-run-results.public-sanitized.json
├── sql/
│   ├── README.md
│   ├── 01_create_schema.sql
│   ├── 02_seed_test_data.sql
│   ├── 03_validation_queries.sql
│   ├── 04_validation_summary.sql
│   └── 05_constraint_negative_tests.sql
├── reports/
│   ├── README.md
│   ├── day4-database-validation-summary.csv
│   ├── day4-database-validation-execution.md
│   └── day5-api-validation-execution.md
└── screenshots/
    ├── README.md
    ├── Day 4 database evidence
    └── Day 5 API and defect evidence
```

## Current Project Status

### Completed

#### Project Foundation and Documentation

- [x] Professional GitHub repository structure
- [x] Main project README
- [x] Repository description and topics
- [x] Folder-level README documentation
- [x] Booking-system requirements baseline
- [x] Comprehensive software test plan
- [x] Data-security and credential-handling rules

#### Test Design and Traceability

- [x] 25 detailed manual/API test cases
- [x] Excel test-case workbook
- [x] Requirements worksheet
- [x] Test-data worksheet
- [x] GitHub-previewable test-case CSV
- [x] Requirements Traceability Matrix
- [x] GitHub-previewable traceability CSV
- [x] Requirements traceability updated after database and API execution

#### PostgreSQL Database Testing

- [x] Local PostgreSQL portfolio database
- [x] Relational customer, booking and payment tables
- [x] Customer and booking staging tables
- [x] Primary-key and foreign-key controls
- [x] Required-field and business-rule constraints
- [x] Synthetic production-style test records
- [x] Controlled staging data-quality anomalies
- [x] 19 SQL validation and analysis queries
- [x] 13 automated database-validation summary checks
- [x] Six database-constraint negative tests
- [x] Database-validation execution report
- [x] SQL execution screenshots

#### Postman REST API Testing

- [x] Private Postman workspace
- [x] 26-request Postman API collection
- [x] Reusable Postman environment
- [x] Authentication-token workflow
- [x] Automated booking-ID workflow
- [x] Booking CRUD API execution
- [x] Positive and negative API assertions
- [x] Boundary-value assertions
- [x] Status-code assertions
- [x] Response-body assertions
- [x] Authorization assertions
- [x] Response-time assertions
- [x] Full 26-request Collection Runner execution
- [x] Final run completed with zero runtime errors

#### Final API Test Results

- [x] All 25 manual/API test cases executed
- [x] 18 API test cases passed
- [x] Seven API test cases failed
- [x] Three confirmed API defects documented
- [x] Original defect-draft history preserved
- [x] Two hypothetical defect drafts rejected
- [x] GitHub-previewable confirmed defect-report CSV
- [x] Day 5 API execution report
- [x] API execution and defect screenshots

#### Public-Safe Portfolio Assets

- [x] Public-safe Postman collection export
- [x] Sanitized Postman environment template
- [x] Sanitized Collection Runner result
- [x] Active tokens and dynamic booking IDs removed
- [x] Public repository credential-exposure safeguards

### In Progress

- [ ] Final cross-document consistency review
- [ ] Final public repository security review
- [ ] Combined API and database test-summary report
- [ ] Recruiter-friendly main README optimization
- [ ] Final repository navigation and Quick Links review
- [ ] Final screenshot organization and evidence verification
- [ ] Final portfolio quality-assurance review
- [ ] Day 6 portfolio presentation and job-readiness activities

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

## Current Test Coverage

The current manual/API suite contains **25 executed test cases**
covering the main functional workflows, business rules, authorization
controls and negative scenarios for the booking API.

### Coverage by Area

| Test Area | Test Cases | Execution Result |
|---|---:|---|
| Authentication | 5 | 5 Pass |
| Booking Creation and Validation | 8 | 3 Pass / 5 Fail |
| Booking Retrieval | 3 | 3 Pass |
| Booking Update | 5 | 4 Pass / 1 Fail |
| Booking Deletion | 4 | 4 Pass |
| **Total** | **25** | **18 Pass / 7 Fail** |

### Testing Techniques Represented

- Functional testing
- Positive testing
- Negative testing
- Boundary-value testing
- Required-field validation
- Authentication testing
- Authorization testing
- Business-rule validation
- Error-handling validation
- Data-integrity validation
- CRUD workflow testing
- Automated response validation

### Combined Coverage Summary

| Test Area | Test Assets | Coverage Status | Execution Status |
|---|---:|---|---|
| Authentication | 5 manual/API test cases | Covered | 5 Pass |
| Booking Creation and Validation | 8 manual/API test cases | Covered | 3 Pass / 5 Fail |
| Booking Retrieval | 3 manual/API test cases | Covered | 3 Pass |
| Booking Update | 5 manual/API test cases | Covered | 4 Pass / 1 Fail |
| Booking Deletion | 4 manual/API test cases | Covered | 4 Pass |
| Local Database Validation | 19 SQL queries | Covered locally | Executed |
| Automated Database Summary | 13 checks | Covered | 13 Pass |
| Database Constraint Testing | 6 negative tests | Covered | 6 Pass |
| API Response-Time Validation | Configured assertions | Partially Covered | Pass |
| Public Asset Security Review | Sanitized exports | Partially Covered | Pass |

## Requirements Traceability

The RTM connects requirements to test cases, SQL validation activities,
execution status and related defects.

### Current RTM Summary

| Metric | Result |
|---|---:|
| Requirements documented | 35 |
| Covered | 30 |
| Partially Covered | 3 |
| Planned | 2 |
| Execution Pass | 28 |
| Execution Fail | 5 |
| Not Run | 2 |

### Failed Requirement Rows

| Requirement | Result | Related Defect |
|---|---|---|
| BOOK-001 | Fail | DEF-API-003 |
| BOOK-002 | Fail | DEF-API-003 |
| BOOK-003 | Fail | DEF-API-001 |
| BOOK-004 | Fail | DEF-API-002 |
| NFR-002 | Fail | DEF-API-001; DEF-API-002; DEF-API-003 |

### Database Requirement Status

- `DATA-001` — Partially Covered / Pass
- `DATA-002` — Planned / Not Run
- `DATA-003` — Covered / Pass
- `DATA-004` — Covered / Pass
- `DATA-005` — Covered / Pass
- `DATA-006` — Covered / Pass
- `DATA-007` — Covered / Pass
- `DATA-008` — Planned / Not Run

`DATA-002` and `DATA-008` remain pending because the local PostgreSQL
database is not connected to the public demonstration API.

## Confirmed Defects and Draft Outcomes

### Confirmed API Defects

| Defect ID | Summary | Related Test Cases | Severity |
|---|---|---|---|
| DEF-API-001 | Checkout before check-in accepted during creation and update | TC-BOOK-004; TC-UPD-005 | High |
| DEF-API-002 | Zero and negative total prices accepted | TC-BOOK-005; TC-VAL-002 | High |
| DEF-API-003 | Missing required fields return HTTP 500 | TC-BOOK-002; TC-BOOK-003; TC-BOOK-006 | Medium |

### Original Draft Outcomes

| Draft | Outcome |
|---|---|
| DEF-DRAFT-001 | Confirmed and converted to DEF-API-001 |
| DEF-DRAFT-002 | Rejected because unauthorized update returned HTTP 403 |
| DEF-DRAFT-003 | Rejected because deleted-booking retrieval returned HTTP 404 |

The original draft history is preserved in the defect workbook for
auditability.

## Test-Execution Status

### Manual and API Test Cases

| Metric | Current Value |
|---|---:|
| Test cases created | 25 |
| Test cases executed | 25 |
| Passed | 18 |
| Failed | 7 |
| Blocked | 0 |
| Not Run | 0 |
| Confirmed API defects | 3 |

### Postman Collection Runner

| Metric | Current Value |
|---|---:|
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Runtime errors | 0 |
| Assertions skipped | 0 |
| Average response time | 36 ms |
| Duration | 3.256 seconds |

### Local Database Validation

| Metric | Current Value |
|---|---:|
| SQL validation and analysis queries created | 19 |
| Automated summary checks executed | 13 |
| Automated summary checks passed | 13 |
| Automated summary checks failed | 0 |
| Constraint negative tests executed | 6 |
| Constraint negative tests passed | 6 |
| Constraint negative tests failed | 0 |
| Production integrity failures identified | 0 |

## Test Data

The project uses synthetic, nonproduction test data.

Public-safe Postman variables include:

```text
{{baseUrl}}
{{username}}
{{password}}
{{authToken}}
{{bookingId}}
{{deletedBookingId}}
{{nonexistentBookingId}}
{{responseTimeLimit}}
```

Sensitive and dynamic values are blank or redacted in public exports.

Example synthetic booking information:

```text
First Name: Test
Last Name: User
Total Price: 450
Deposit Paid: true
Check-in Date: 2026-08-10
Checkout Date: 2026-08-14
Additional Needs: Breakfast
```

No production customer information is used.

## Data and Security Rules

The public repository does not contain:

- Real customer information
- Real passwords
- Active authentication tokens
- Private API keys
- Confidential employer information
- Payment-card information
- Production database records
- Personal health information
- Secret environment files
- Private Postman account information

Sensitive values are represented using empty values, placeholders,
environment variables or `<REDACTED>` markers.

Public Postman assets were reviewed to remove:

- Active tokens
- Dynamic booking identifiers
- Private credentials
- Saved response examples containing dynamic records
- Account-linked export metadata
- Token values printed by scripts

## Project Limitations

This portfolio demonstration is based on:

- Assumed requirements
- Synthetic test data
- A nonproduction testing environment
- A publicly available demonstration API
- A locally created PostgreSQL database

The Restful Booker API may intentionally behave differently from the
portfolio requirement baseline.

The public API and local database are separate systems. Therefore:

- API success does not prove local database persistence
- Local database success does not prove API persistence
- Direct API-to-database reconciliation was not performed
- Database verification after API deletion was not performed

Differences between expected and actual behavior are documented
honestly as observations, limitations or confirmed defects.

## Next Planned Activities

The remaining portfolio activities are:

1. Complete the final cross-document consistency review
2. Complete the final public repository security review
3. Prepare a combined API and database test-summary report
4. Optimize the main README for recruiter review
5. Verify all Quick Links
6. Confirm screenshot filenames match defect evidence references
7. Perform the final portfolio quality-assurance review
8. Prepare Day 6 presentation and job-readiness materials

## Author

**Dhruba Aryal**

QA, REST API and Database Testing Portfolio

## License

This project is licensed under the MIT License. See the
[LICENSE](LICENSE) file for details.
