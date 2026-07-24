# API and Database Testing Portfolio

## Project Overview

This project demonstrates manual software testing, REST API testing and
SQL database validation for a sample online booking system.

The purpose of the project is to show how a quality assurance
professional can validate system requirements across the user workflow,
API layer and database layer.

## Business Scenario

The sample booking system allows customers to:

- Authenticate
- Create a booking
- Retrieve booking information
- Update an existing booking
- Cancel a booking

The testing process will verify that the system processes valid
information correctly, rejects invalid information appropriately and
stores accurate data in the database.

## Project Objectives

The objectives of this project are to:

1. Create a professional software test plan
2. Develop functional, positive, negative and boundary-value test cases
3. Document defects using a professional defect-reporting format
4. Test REST API endpoints with Postman
5. Validate API response codes, response bodies and response times
6. Validate database records using SQL
7. Compare information between the API and database
8. Document test-execution results
9. Demonstrate requirements traceability
10. Build a recruiter-friendly quality-assurance portfolio

## Testing Scope

### In Scope

- Authentication testing
- Booking-creation testing
- Booking-retrieval testing
- Booking-update testing
- Booking-cancellation testing
- Required-field validation
- Date validation
- Positive testing
- Negative testing
- Boundary-value testing
- API response validation
- Database validation
- Defect reporting
- Regression-test documentation

### Out of Scope

- Production security testing
- Load and performance testing
- Payment-card processing
- Mobile application testing
- Production customer data
- Production deployment

## Skills Demonstrated

- Software-testing fundamentals
- Requirement analysis
- Test planning
- Test-scenario development
- Test-case development
- Positive and negative testing
- Boundary-value analysis
- Defect reporting
- Requirements traceability
- REST API testing
- Postman
- SQL
- Database testing
- Data validation
- Test-execution reporting
- Git and GitHub documentation

## Technologies and Tools

- GitHub
- Microsoft Excel
- Markdown
- Postman
- PostgreSQL
- DBeaver or pgAdmin
- SQL

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
│   └── README.md
├── requirements-traceability/
│   ├── README.md
│   └── booking-system-requirements.md
├── postman/
│   └── README.md
├── sql/
│   └── README.md
├── reports/
│   └── README.md
└── screenshots/
    └── README.md
```

## Planned Deliverables

The completed project will include:

- Booking-system requirements baseline
- Professional software test plan
- Functional test scenarios
- Detailed manual test cases
- Positive test cases
- Negative test cases
- Boundary-value test cases
- Requirements traceability matrix
- Professional defect reports
- Postman API collection
- Positive and negative API tests
- PostgreSQL database schema
- Sample database test data
- SQL validation queries
- Test-execution report
- Supporting screenshots

## Current Project Status

### Completed

- [x] Professional repository structure
- [x] Initial project README
- [x] Booking-system requirements baseline
- [x] Comprehensive software test plan
- [x] Excel test-case workbook
- [x] Requirements worksheet
- [x] Test-data worksheet
- [x] First 10 authentication and booking-creation test cases
- [x] GitHub-previewable CSV test-case file

### In Progress

- [ ] Additional manual test cases
- [ ] Requirements traceability matrix
- [ ] Sample defect reports
- [ ] Postman API collection
- [ ] API response assertions
- [ ] PostgreSQL schema
- [ ] Sample database records
- [ ] SQL validation queries
- [ ] Test-execution report
- [ ] Supporting execution screenshots

## Day 1 Deliverables

Day 1 established the professional GitHub structure and initial project
foundation.

The following work was completed:

- Professional GitHub profile optimization
- GitHub profile README
- Public portfolio repository
- Professional repository description
- Main project README
- Organized project folders
- Repository topics
- Initial project documentation

## Day 2 Deliverables

Day 2 established the requirements, test-planning and initial manual
testing foundation for the project.

Files added:

```text
requirements-traceability/booking-system-requirements.md
test-plan/booking-system-test-plan.md
test-cases/booking-system-test-cases.xlsx
test-cases/booking-system-test-cases.csv
```

The Day 2 work includes:

- Authentication requirements
- Booking-creation requirements
- Booking-retrieval requirements
- Booking-update requirements
- Booking-deletion requirements
- Database and data-quality requirements
- Test objectives
- Testing scope
- Test approach
- Entry and exit criteria
- Risks and mitigation
- Initial manual test cases
- Requirements and test-data worksheets

All test cases currently remain in **Not Run** status.

Actual results and Pass or Fail status will be recorded only after the
test cases are executed against the selected demonstration API.

## Current Test Coverage

The first 10 test cases cover:

1. Valid authentication
2. Authentication with an invalid password
3. Authentication without a username
4. Authentication without a password
5. Authentication with blank credentials
6. Valid booking creation
7. Booking creation without a first name
8. Booking creation without booking dates
9. Booking creation with checkout before check-in
10. Booking creation with a total price of zero

## Test-Execution Status

| Metric | Current Value |
|---|---:|
| Test cases created | 10 |
| Test cases executed | 0 |
| Passed | 0 |
| Failed | 0 |
| Blocked | 0 |
| Not Run | 10 |

No execution results have been invented or assumed.

## Project Data and Security Rules

This project uses synthetic, nonproduction test data.

The repository will not contain:

- Real customer information
- Real passwords
- Live authentication tokens
- Private API keys
- Confidential employer information
- Payment-card information
- Production database records
- Personal health information

Placeholders such as the following may be used:

```text
{{validUsername}}
{{validPassword}}
{{authToken}}
{{bookingId}}
```

Actual credentials and tokens will not be uploaded to GitHub.

## Project Limitations

This is a portfolio demonstration project based on assumed requirements,
synthetic test data and a nonproduction testing environment.

The behavior of the selected demonstration API may not enforce every
assumed business requirement. Any difference between the expected
requirement and actual application behavior will be documented honestly
as an observation, limitation or potential defect.

## Next Planned Activities

The next project activities are:

1. Create additional booking-retrieval test cases
2. Create booking-update test cases
3. Create booking-deletion test cases
4. Create additional boundary and negative test cases
5. Build the requirements traceability matrix
6. Create professional sample defect reports
7. Build the Postman API collection
8. Create the PostgreSQL schema and sample data
9. Write SQL validation queries
10. Prepare the final test-execution report

## Author

**Dhruba Aryal**

QA Automation, API Testing and Database Testing Portfolio
