# API and Database Testing Portfolio

## Project Overview

This project currently demonstrates professional requirement analysis,
manual test design, requirements traceability, defect-documentation
planning and executed PostgreSQL database validation for a sample
online booking system.

REST API testing with Postman is the next project phase and remains in
progress.

The purpose of the project is to show how a quality assurance
professional can analyze requirements, design test cases, document
potential defects, validate database information and prepare structured
API testing workflows.

The project is being developed in phases so that each testing activity
is documented clearly and can be reviewed directly through GitHub.

## Business Scenario

The sample online booking system allows users to:

- Authenticate
- Create a booking
- Retrieve booking information
- Search for bookings
- Update an existing booking
- Partially update a booking
- Delete or cancel a booking

A booking may contain:

- First name
- Last name
- Total price
- Deposit-paid status
- Check-in date
- Checkout date
- Optional additional needs

Testing will verify that the system:

- Processes valid information correctly
- Rejects invalid or missing information appropriately
- Enforces authentication and authorization requirements
- Returns accurate API responses
- Stores accurate information in the database
- Maintains data integrity throughout the booking lifecycle

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
9. Compare API information with database information
10. Document test-execution results accurately
11. Demonstrate responsible credential and test-data handling
13. Build a recruiter-friendly quality assurance portfolio

## Testing Scope

### In Scope

- Requirement analysis
- Test planning
- Authentication testing
- Booking-creation testing
- Booking-retrieval testing
- Booking-search testing
- Booking-update testing
- Partial-update testing
- Booking-deletion testing
- Required-field validation
- Date validation
- Price validation
- Positive testing
- Negative testing
- Boundary-value testing
- Authorization testing
- API response validation
- Database validation
- Data-integrity validation
- Requirements traceability
- Defect reporting
- Regression-test planning
- Test-execution reporting

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

## Testing Approach

The project follows a structured testing process:

1. Define assumed portfolio requirements
2. Analyze the requirements for clarity and testability
3. Create a professional test plan
4. Design detailed manual test cases
5. Map requirements to test cases
6. Prepare defect-report drafts
7. Execute API tests using Postman
8. Validate database information using SQL
9. Compare API and database results
10. Record actual results and test status
11. Confirm or discard defect-report drafts
13. Prepare a final test-execution report

## Skills Demonstrated

### Software Testing

- Software-testing fundamentals
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
- Regression-test planning
- Defect reporting
- Requirements traceability
- Test-execution reporting

### API Testing Scope — Planned for Day 5
The following API-testing capabilities will be demonstrated during the
Postman execution phase:

- REST API testing
- HTTP methods
- Status-code validation
- Response-body validation
- Response-time validation
- Authentication-token handling
- Positive API testing
- Negative API testing
- CRUD workflow testing
- Postman collection development

### Database Testing

- SQL
- PostgreSQL
- Database validation
- Data-integrity testing
- Null-value validation
- Duplicate detection
- Primary-key validation
- Foreign-key validation
- Data reconciliation

### Documentation and Tools

- Git
- GitHub
- Markdown
- Microsoft Excel
- Requirements documentation
- Test-plan documentation
- Defect-report documentation
- Test-data documentation

## Technologies and Tools

- GitHub
- Git
- Microsoft Excel
- Markdown
- Postman
- PostgreSQL
- DBeaver or pgAdmin
- SQL
- Microsoft Edge or Google Chrome
- Windows 10 or Windows 11

## Project Structure

```text
api-database-testing-portfolio/
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
│   ├── booking-system-defect-report-drafts.xlsx
│   └── booking-system-defect-report-drafts.csv
├── requirements-traceability/
│   ├── README.md
│   ├── booking-system-requirements.md
│   ├── booking-system-requirements-traceability-matrix.xlsx
│   └── booking-system-requirements-traceability-matrix.csv
├── postman/
│   └── README.md
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
│   └── day4-database-validation-execution.md
└── screenshots/
    ├── README.md
    └── Day 4 execution screenshots
```

## Planned Deliverables

The completed project will include:

- Booking-system requirements baseline
- Professional software test plan
- Detailed manual test cases
- Positive test cases
- Negative test cases
- Boundary-value test cases
- Requirements Traceability Matrix
- Professional defect reports
- Postman API collection
- Postman environment template
- Positive and negative API assertions
- PostgreSQL database schema
- Synthetic database test data
- SQL validation queries
- API-to-database comparison
- Test-execution report
- Supporting screenshots

## Current Project Status

### Completed

- [x] Professional GitHub repository structure
- [x] Initial project README
- [x] Repository description and topics
- [x] Booking-system requirements baseline
- [x] Comprehensive software test plan
- [x] Excel test-case workbook
- [x] Requirements worksheet
- [x] Test-data worksheet
- [x] 25 detailed manual test cases
- [x] GitHub-previewable test-case CSV
- [x] Requirements Traceability Matrix
- [x] GitHub-previewable traceability CSV
- [x] Three clearly labeled defect-report drafts
- [x] GitHub-previewable defect-report CSV
- [x] Folder-level README documentation
- [x] Local PostgreSQL database
- [x] `booking_test_db` database
- [x] `booking_portfolio` schema
- [x] Customers, bookings and payments tables
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
- [x] Updated database-requirement traceability
- [x] Data-security and credential-handling rules

### In Progress

- [ ] Actual manual and API test execution
- [ ] Validation of defect-report drafts
- [ ] Postman API collection
- [ ] Postman environment template
- [ ] API response assertions
- [ ] API response-time validation
- [ ] Authentication-token workflow
- [ ] Booking CRUD API execution
- [ ] Direct API-to-database comparison
- [ ] Database verification after API deletion
- [ ] Final test-execution report
- [ ] API execution screenshots

## Day 1 Deliverables

Day 1 established the professional GitHub foundation for the project.

The following work was completed:

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

Day 1 established a clean and organized public portfolio foundation.

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

Day 2 accomplishments include:

- Reviewed essential software-testing concepts
- Documented SDLC and STLC fundamentals
- Reviewed positive, negative and boundary-value testing
- Reviewed severity, priority and the defect lifecycle
- Created the booking-system requirements baseline
- Defined authentication requirements
- Defined booking-creation requirements
- Defined booking-retrieval requirements
- Defined booking-update requirements
- Defined booking-deletion requirements
- Defined database and data-quality requirements
- Defined nonfunctional expectations
- Created a comprehensive software test plan
- Defined testing objectives
- Defined in-scope and out-of-scope areas
- Defined the test approach
- Defined entry and exit criteria
- Defined risks and mitigation strategies
- Created the initial Excel test-case workbook
- Created the Requirements worksheet
- Created the Test_Data worksheet
- Created the first 10 manual test cases
- Created a GitHub-previewable CSV file

All Day 2 test cases were correctly left in **Not Run** status because
execution had not begun.

## Day 3 Deliverables

Day 3 expanded the project’s manual test coverage and introduced formal
requirements traceability and defect-documentation examples.

Files added or updated:

```text
test-cases/booking-system-test-cases.xlsx
test-cases/booking-system-test-cases.csv
requirements-traceability/booking-system-requirements-traceability-matrix.xlsx
requirements-traceability/booking-system-requirements-traceability-matrix.csv
defect-reports/booking-system-defect-report-drafts.xlsx
defect-reports/booking-system-defect-report-drafts.csv
```

Day 3 accomplishments include:

- Expanded the test suite from 10 to 25 test cases
- Added missing-last-name validation
- Added minimum positive-price validation
- Added negative-price validation
- Added booking-retrieval test cases
- Added booking-search coverage
- Added full booking-update coverage
- Added partial booking-update coverage
- Added unauthorized-update coverage
- Added nonexistent-booking update coverage
- Added invalid-date update coverage
- Added authorized booking-deletion coverage
- Added unauthorized-deletion coverage
- Added deleted-booking retrieval coverage
- Added nonexistent-booking deletion coverage
- Completed the remaining Requirements worksheet entries
- Created a formal Requirements Traceability Matrix
- Mapped functional requirements to test cases
- Identified planned and partially covered requirements
- Created three clearly labeled defect-report drafts
- Updated folder-level documentation
- Updated the main project status

All test cases remain in **Not Run** status.

The defect reports remain **Draft—Pending Validation** and do not claim
that actual defects have been observed.

## Day 4 Deliverables

Day 4 established the local PostgreSQL database-testing and data-quality
foundation for the project.

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

Day 4 accomplishments include:

- Installed or verified PostgreSQL and pgAdmin
- Created the `booking_test_db` database
- Created the `booking_portfolio` schema
- Created the `customers` table
- Created the `bookings` table
- Created the `payments` table
- Created customer and booking staging tables
- Added primary-key controls
- Added foreign-key controls
- Added required-field controls
- Added case-insensitive unique-email controls
- Added booking-date validation
- Added positive-price validation
- Added booking-status and payment-status validation
- Inserted 10 valid synthetic customers
- Inserted 15 valid synthetic bookings
- Inserted 10 valid synthetic payments
- Added controlled staging anomalies
- Created 19 SQL validation and analysis queries
- Created 13 automated validation-summary checks
- Executed six database-constraint negative tests
- Updated database requirements in the Requirements Traceability Matrix
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
database used by the public demonstration booking API.

Direct API-to-database comparison and database verification after an API
deletion therefore remain pending.

## Current Test Coverage

The current manual test suite contains **25 test cases** covering the
main functional workflows, business rules, authorization controls and
negative scenarios for the sample booking system.

### Authentication Testing

Authentication coverage includes:

- Valid username and password
- Valid username with an invalid password
- Missing username
- Missing password
- Blank username and password
- Successful authentication-token generation

Related test cases:

```text
TC-AUTH-001
TC-AUTH-002
TC-AUTH-003
TC-AUTH-004
TC-AUTH-005
```

### Booking-Creation and Validation Testing

Booking-creation and validation coverage includes:

- Successful booking creation using valid information
- Missing first name
- Missing last name
- Missing booking dates
- Checkout date earlier than check-in date
- Total price equal to zero
- Minimum valid positive total price
- Negative total price
- Unique booking-identifier validation
- Submitted-data response validation

Related test cases:

```text
TC-BOOK-001
TC-BOOK-002
TC-BOOK-003
TC-BOOK-004
TC-BOOK-005
TC-BOOK-006
TC-VAL-001
TC-VAL-002
```

### Booking-Retrieval Testing

Booking-retrieval coverage includes:

- Retrieving an existing booking using a valid booking identifier
- Attempting to retrieve a nonexistent booking
- Searching for bookings using supported customer-name criteria

Related test cases:

```text
TC-RET-001
TC-RET-002
TC-RET-003
```

### Booking-Update Testing

Booking-update coverage includes:

- Full booking update using valid authentication
- Update attempt without authentication
- Update attempt using a nonexistent booking identifier
- Partial update of the additional-needs field
- Update attempt using an invalid booking-date sequence

Related test cases:

```text
TC-UPD-001
TC-UPD-002
TC-UPD-003
TC-UPD-004
TC-UPD-005
```

### Booking-Deletion Testing

Booking-deletion coverage includes:

- Successful deletion using valid authentication
- Attempting to retrieve a successfully deleted booking
- Deletion attempt without authentication
- Deletion attempt using a nonexistent booking identifier

Related test cases:

```text
TC-DEL-001
TC-DEL-002
TC-DEL-003
TC-DEL-004
```

### Testing Techniques Represented

The current test suite demonstrates:

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
- Regression-test planning

### Requirements Coverage

The current manual test cases provide coverage for:

- Authentication requirements
- Booking-creation requirements
- Booking-retrieval requirements
- Booking-update requirements
- Booking-deletion requirements

Local PostgreSQL testing has provided executed coverage for several
database and data-quality requirements.

Current database-requirement status:

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

Additional nonfunctional coverage will be added through:

- Postman response assertions
- API response-time validation
- Negative API testing
- Error-response validation
- Repository credential-exposure checks

### Current Coverage Summary

| Test Area | Test Assets | Coverage Status | Execution Status |
|---|---:|---|---|
| Authentication | 5 manual/API test cases | Covered | Not Run |
| Booking Creation and Validation | 8 manual/API test cases | Covered | Not Run |
| Booking Retrieval | 3 manual/API test cases | Covered | Not Run |
| Booking Update | 5 manual/API test cases | Covered | Not Run |
| Booking Deletion | 4 manual/API test cases | Covered | Not Run |
| Local Database Validation | 19 SQL queries | Initial local validation complete | Executed |
| Automated Database Summary | 13 checks | Covered | Passed |
| Database Constraint Testing | 6 negative tests | Covered | Passed |
| Nonfunctional API Validation | Planned Postman assertions | Planned | Not Run |
| **Total Manual/API Test Cases** | **25** | **Functional coverage established** | **Not Run** |

The local PostgreSQL validation has been executed successfully.

The 25 manual and API test cases remain in **Not Run** status because
Postman execution has not started.

The local database is not connected to the public demonstration booking
API. Therefore, local database success does not represent direct
API-to-database validation.

## Requirements Traceability

The Requirements Traceability Matrix connects the project requirements
to related test cases and planned validation activities.

The matrix includes:

- Requirement ID
- Requirement category
- Requirement summary
- Linked test-case IDs
- Coverage status
- Execution status
- Related defect IDs
- Coverage comments

Current traceability status:

- Authentication requirements: Covered
- Booking-creation requirements: Covered
- Booking-retrieval requirements: Covered
- Booking-update requirements: Covered
- Booking-deletion requirements: Covered
- Database requirements: Planned or Partially Covered
- Nonfunctional requirements: Planned or Partially Covered

Files:

```text
requirements-traceability/booking-system-requirements.md
requirements-traceability/booking-system-requirements-traceability-matrix.xlsx
requirements-traceability/booking-system-requirements-traceability-matrix.csv
```

## Defect-Report Drafts

Three defect-report drafts were created to demonstrate professional
defect-documentation structure.

The draft scenarios include:

1. Booking may accept a checkout date earlier than the check-in date
2. Booking update may be accepted without valid authentication
3. A deleted booking may remain retrievable

These entries are clearly labeled:

**Draft—Pending Validation**

They are hypothetical portfolio examples and are not confirmed
application defects.

After API test execution, each draft will be:

- Confirmed and converted into an actual defect report
- Updated with actual results and supporting evidence
- Or discarded when the system behaves correctly

Files:

```text
defect-reports/booking-system-defect-report-drafts.xlsx
defect-reports/booking-system-defect-report-drafts.csv
```

## Test-Execution Status

### Manual and API Test Cases

| Metric | Current Value |
|---|---:|
| Test cases created | 25 |
| Test cases executed | 0 |
| Passed | 0 |
| Failed | 0 |
| Blocked | 0 |
| Not Run | 25 |
| Confirmed API defects | 0 |
| Defect drafts pending validation | 3 |

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

The local PostgreSQL checks have been executed.

The 25 manual and API test cases remain in **Not Run** status because
Postman API execution has not begun.

The three defect reports remain hypothetical drafts pending validation.

No API execution results or confirmed API defects have been invented or
assumed.

## Test Data

The project uses synthetic, nonproduction test data.

Example placeholders include:

```text
{{validUsername}}
{{validPassword}}
{{authToken}}
{{bookingId}}
{{deletedBookingId}}
```

Example synthetic booking information includes:

```text
First Name: Dhruba
Last Name: Aryal
Total Price: 450
Deposit Paid: true
Check-in Date: 2026-08-10
Checkout Date: 2026-08-14
Additional Needs: Breakfast
```

The use of names in this project represents synthetic portfolio test
data and not production customer information.

## Data and Security Rules

The repository will not contain:

- Real customer information
- Real passwords
- Live authentication tokens
- Private API keys
- Confidential employer information
- Payment-card information
- Production database records
- Personal health information
- Secret environment files

Actual credentials and tokens will not be uploaded to GitHub.

Sensitive values will be represented using placeholders or secure
environment variables.

## Project Limitations

This is a portfolio demonstration project based on:

- Assumed requirements
- Synthetic test data
- A nonproduction testing environment
- A publicly available demonstration API
- A locally created PostgreSQL database

The selected demonstration API may not enforce every assumed business
requirement.

A difference between the expected requirement and actual system
behavior will be documented honestly as:

- An observed behavior
- A project limitation
- A potential defect pending review
- Or a confirmed defect after reproduction

## Next Planned Activities

The next project phase will focus on REST API testing with Postman.

Planned activities are:

1. Install or verify Postman
2. Select and document the demonstration booking API
3. Create the Postman workspace and collection
4. Create collection variables
5. Create a sanitized Postman environment template
6. Create the authentication-token workflow
7. Create booking creation, retrieval and search requests
8. Create full-update and partial-update requests
9. Create booking-deletion requests
10. Add positive API assertions
11. Add negative API assertions
12. Add status-code assertions
13. Add response-body assertions
14. Add response-time assertions
15. Execute the applicable manual and API test cases
16. Record Actual Result and Pass or Fail status
17. Confirm, revise or discard the defect-report drafts
18. Export a sanitized Postman collection
19. Add API execution screenshots
20. Prepare the combined test-execution report

Direct API-to-database comparison will remain out of scope unless the
selected API provides authorized access to its underlying database.

## Author

**Dhruba Aryal**

QA Automation, API Testing and Database Testing Portfolio

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
