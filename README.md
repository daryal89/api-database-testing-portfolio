# API and Database Testing Portfolio

## Project Overview

This portfolio demonstrates an end-to-end quality-assurance workflow for
a sample online booking system.

The project includes:

- Requirements analysis and professional test planning
- Manual and REST API test-case design
- Requirements traceability
- PostgreSQL database validation
- Postman collection development and execution
- Positive, negative, boundary-value and authorization testing
- Automated API assertions
- Defect investigation and reporting
- Test-execution reporting
- Public-safe credential and test-data handling

The REST API phase uses the public **Restful Booker** demonstration API.
The database phase uses a separate, locally created PostgreSQL portfolio
database.

Because the public API does not provide authorized access to its
underlying database, direct API-to-database reconciliation was not
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
- [Requirements Traceability Matrix — Excel](requirements-traceability/booking-system-requirements-traceability-matrix.xlsx)
- [Requirements Traceability Matrix — CSV](requirements-traceability/booking-system-requirements-traceability-matrix.csv)

### Test Cases and Defects

- [Test Cases — Excel](test-cases/booking-system-test-cases.xlsx)
- [Test Cases — CSV](test-cases/booking-system-test-cases.csv)
- [Defect Reports — Excel](defect-reports/booking-system-defect-reports.xlsx)
- [Defect Reports — CSV](defect-reports/booking-system-defect-reports.csv)
- [DEF-API-001 — Invalid Date Sequence](defect-reports/DEF-API-001-invalid-booking-date-sequence.md)
- [DEF-API-002 — Nonpositive Total Price](defect-reports/DEF-API-002-nonpositive-total-price.md)
- [DEF-API-003 — Missing Required Fields Return HTTP 500](defect-reports/DEF-API-003-missing-required-fields-return-500.md)

### Postman API Testing

- [Postman Documentation](postman/README.md)
- [Public-Safe Postman Collection](postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [Sanitized Postman Environment Template](postman/restful-booker-template.public-sanitized.postman_environment.json)
- [Sanitized Collection Runner Result](postman/day5-postman-collection-run-results.public-sanitized.json)
- [Day 5 API Execution Report](reports/day5-api-validation-execution.md)

### Automation and CI/CD

- [CI Smoke Collection](postman/restful-booker-ci-smoke.public-sanitized.postman_collection.json)
- [Automation Documentation](automation/README.md)
- [GitHub Actions Workflow](.github/workflows/newman-api-tests.yml)
- [Day 6 Automation Report](reports/day6-newman-and-github-actions-execution.md)
- [API, Database and Automation Executive Summary](reports/api-database-automation-executive-summary.md)
- [Day 6 Automation Evidence](screenshots/README.md#day-6-automation-evidence)

### PostgreSQL Database Testing

- [SQL Database Testing Documentation](sql/README.md)
- [SQL Validation Queries](sql/03_validation_queries.sql)
- [Automated Database Validation Summary](reports/day4-database-validation-summary.csv)
- [Day 4 Database Execution Report](reports/day4-database-validation-execution.md)

### Evidence and History

- [Screenshot Evidence Index](screenshots/README.md)
- [Project Development Journal](docs/project-development-journal.md)

  ## Latest Release

[Day 5 — Manual, API and Database Testing Baseline](https://github.com/daryal89/api-database-testing-portfolio/releases/tag/v1.0.0)

The `v1.0.0` release preserves the completed manual, REST API and
PostgreSQL testing baseline before Day 6 automation work begins.

Key release results:

- 25 test cases executed: 18 passed and seven failed
- 26 Postman requests and 61 assertions executed
- Zero Postman runtime errors
- Three confirmed API defects
- 19 SQL validation queries
- 13 automated database checks
- Six database-constraint negative tests

## Portfolio Highlights

- Designed and executed a complete booking CRUD workflow using Postman.
- Connected failed test cases to requirements, defect reports and
  screenshot evidence.
- Preserved the original defect-draft history to show which hypotheses
  were confirmed or rejected.
- Built a local PostgreSQL validation suite with positive, data-quality
  and constraint-negative testing.
- Sanitized public Postman assets to prevent credential and token
  exposure.
- Documented the limitation that the public API and local database are
  separate systems.
  - Automated the stable core API workflow with Newman and GitHub Actions.
- Separated the full defect-validation suite from the passing CI smoke
  quality gate.
- Protected demonstration credentials with GitHub repository secrets.
- Generated JSON and JUnit test reports as downloadable workflow
  artifacts.
- Investigated and corrected an initial CI failure without hiding valid
  Day 5 defect findings.

## Business Scenario

The sample online booking system allows users to:

- Authenticate
- Create a booking
- Retrieve booking information
- Search for bookings
- Fully update a booking
- Partially update a booking
- Delete a booking

Testing validates whether the system:

- Processes valid information correctly
- Rejects invalid or missing information appropriately
- Enforces authentication and authorization requirements
- Returns accurate API responses
- Maintains database integrity
- Handles expected and unexpected error conditions clearly

## Testing Scope

### In Scope

- Requirement analysis and test planning
- Authentication and authorization testing
- Booking creation, retrieval, search, update and deletion
- Required-field, date and price validation
- Positive, negative and boundary-value testing
- API status-code, response-body and response-time validation
- PostgreSQL data-integrity and data-quality validation
- Requirements traceability
- Defect reporting
- Test-execution reporting
- Public repository security review

### Out of Scope

- Production security penetration testing
- High-volume load and stress testing
- Production performance testing
- Payment-card processing
- Mobile application testing
- Production customer data
- Production deployment
- Disaster-recovery testing
- Full accessibility certification
- Direct API-to-database validation without authorized database access

## Skills Demonstrated

### Software Testing

- Requirement analysis
- Test planning
- Test-case development
- Functional, positive and negative testing
- Boundary-value analysis
- Authentication and authorization testing
- Business-rule and error-handling validation
- Defect reporting
- Requirements traceability
- Test-execution reporting

### REST API Testing

- HTTP methods and CRUD workflows
- Status-code and response-body validation
- Response-time validation
- Authentication-token handling
- Postman environment variables
- Automated booking-ID workflow
- Collection Runner execution
- Automated Postman assertions
- Public-safe Postman exports

### Test Automation and CI/CD

- Node.js and npm
- Newman command-line execution
- API smoke-test design
- npm dependency and lockfile management
- GitHub Actions
- YAML workflow configuration
- CI test-quality gates
- GitHub repository secrets
- JSON and JUnit test reporting
- Workflow artifact management
- CI failure investigation and resolution

### Database Testing

- PostgreSQL and SQL
- Schema and table validation
- Primary-key and foreign-key validation
- Null, duplicate and orphan detection
- Check-constraint validation
- Staging-data and data-quality testing
- Automated validation-summary checks
- Database-constraint negative testing

### Documentation and Tools

- Git and GitHub
- Markdown
- Microsoft Excel
- Postman Desktop
- PostgreSQL and pgAdmin 4
- Structured test, defect, RTM and execution documentation

## Technologies and Tools

- Git and GitHub
- Microsoft Excel
- Markdown
- Postman Desktop
- PostgreSQL
- pgAdmin 4
- SQL
- Microsoft Edge or Google Chrome
- Windows
- Node.js
- npm
- Newman
- GitHub Actions
- YAML
- JSON and JUnit test reports

## Project Structure

```text
api-database-testing-portfolio/
├── .gitignore
├── LICENSE
├── README.md
├── docs/
│   ├── README.md
│   └── project-development-journal.md
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
    ├── restful-booker-ci-smoke.public-sanitized.postman_collection.json
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
    ├── day6-newman-and-github-actions-execution.md
│   └── api-database-automation-executive-summary.md
└── screenshots/
    ├── README.md
    ├── day4-database/
    ├── day5-api-execution/
    └── day5-defects/
    └── day6-automation/
├── .github/
│   └── workflows/
│       └── newman-api-tests.yml
├── automation/
│   └── README.md
├── package.json
├── package-lock.json
```

## Current Project Status

### Completed

#### Foundation and Test Design

- [x] Professional repository structure and documentation
- [x] Requirements baseline and software test plan
- [x] 25 detailed manual/API test cases
- [x] Excel and GitHub-previewable CSV test assets
- [x] Requirements Traceability Matrix
- [x] Self-navigating folder README files
- [x] Recruiter-focused root README optimization

#### PostgreSQL Database Testing

- [x] Local PostgreSQL portfolio database
- [x] Relational and staging tables
- [x] Key, required-field and business-rule constraints
- [x] Synthetic production-style records and controlled anomalies
- [x] 19 SQL validation and analysis queries
- [x] 13 automated validation-summary checks
- [x] Six database-constraint negative tests
- [x] Database execution report and screenshots

#### Postman REST API Testing

- [x] 26-request Postman collection
- [x] Reusable local environment
- [x] Authentication-token and booking-ID workflows
- [x] Booking CRUD execution
- [x] Positive, negative, boundary, authorization and performance assertions
- [x] Full Collection Runner execution
- [x] Zero runtime errors
- [x] Public-safe Postman exports
- [x] Reproducibility instructions

#### Final API Results and Defects

- [x] All 25 manual/API test cases executed
- [x] 18 test cases passed
- [x] Seven test cases failed
- [x] Three confirmed API defects documented
- [x] Original defect-draft history preserved
- [x] Two hypothetical defect drafts rejected
- [x] Clickable defect evidence
- [x] Organized screenshot evidence index
- [x] Day 5 API execution report

#### Final Repository Quality and Security Review

- [x] Final public link verification
- [x] Final public repository security review
- [x] Final cross-document consistency check

#### Day 6 Test Automation

- [x] Node.js, npm and Git verified
- [x] Newman installed as a project dependency
- [x] Complete validation collection executed through Newman
- [x] Stable CI smoke collection created
- [x] Smoke collection passed in Postman
- [x] Smoke collection passed locally through Newman
- [x] GitHub repository secrets configured
- [x] Initial GitHub Actions failure investigated
- [x] Root cause documented
- [x] GitHub Actions smoke-test workflow completed successfully
- [x] JSON and JUnit reports generated
- [x] Workflow artifacts preserved
- [x] Day 6 automation evidence organized
- [x] Day 6 execution report completed

#### In Progress

- [ ] Final Day 6 public-link verification
- [ ] Portfolio résumé integration
- [ ] Interview-story preparation
- [ ] Day 7 job-application and presentation activities

## Day 4 Database Validation Summary

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

## Day 5 API Execution Summary

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

The failed assertions are intentionally retained as evidence of observed
requirement mismatches. They are not hidden or changed to create an
artificially passing collection.

## Day 6 Automation Summary

Day 6 introduced repeatable command-line and continuous-integration API
testing.

Completed automation includes:

- Newman installed as a project dependency
- Complete validation collection executed from Git Bash
- Separate stable CI smoke collection
- Passing local Newman smoke execution
- GitHub Actions workflow
- Repository-secret credential handling
- JSON and JUnit report generation
- Downloadable workflow artifacts
- Initial CI failure investigation and resolution

The complete validation collection retains the confirmed requirement
mismatches documented on Day 5.

The separate smoke collection validates the stable core booking
workflow and is used as the required passing CI quality gate.

| Automation Metric | Result |
|---|---:|
| Smoke requests executed | INSERT FINAL COUNT |
| Smoke assertions executed | INSERT FINAL COUNT |
| Smoke assertions passed | INSERT FINAL COUNT |
| Smoke assertions failed | 0 |
| Smoke runtime errors | 0 |
| Local Newman exit code | 0 |
| GitHub Actions result | Pass |
| Report formats generated | JSON and JUnit |

## Current Test Coverage

| Test Area | Test Cases | Execution Result |
|---|---:|---|
| Authentication | 5 | 5 Pass |
| Booking Creation and Validation | 8 | 3 Pass / 5 Fail |
| Booking Retrieval | 3 | 3 Pass |
| Booking Update | 5 | 4 Pass / 1 Fail |
| Booking Deletion | 4 | 4 Pass |
| **Total** | **25** | **18 Pass / 7 Fail** |

## Confirmed API Defects

| Defect | Summary | Related Test Cases | Severity |
|---|---|---|---|
| [DEF-API-001](defect-reports/DEF-API-001-invalid-booking-date-sequence.md) | Checkout before check-in accepted during creation and update | TC-BOOK-004; TC-UPD-005 | High |
| [DEF-API-002](defect-reports/DEF-API-002-nonpositive-total-price.md) | Zero and negative total prices accepted | TC-BOOK-005; TC-VAL-002 | High |
| [DEF-API-003](defect-reports/DEF-API-003-missing-required-fields-return-500.md) | Missing required fields return HTTP 500 | TC-BOOK-002; TC-BOOK-003; TC-BOOK-006 | Medium |

## Requirements Traceability Summary

| Metric | Result |
|---|---:|
| Requirements documented | 35 |
| Covered | 30 |
| Partially Covered | 3 |
| Planned | 2 |
| Execution Pass | 28 |
| Execution Fail | 5 |
| Not Run | 2 |

`DATA-002` and `DATA-008` remain planned because the public API is not
connected to the local PostgreSQL portfolio database.

## Reproducing the API Tests

The project provides two public-safe Postman collections:

1. The complete validation collection, which preserves the full
   requirement and defect-testing baseline
2. The CI smoke collection, which validates the stable critical booking
   workflow

The complete collection may report known failed assertions associated
with confirmed Day 5 defects.

The smoke collection is expected to complete with zero failed
assertions.

See:

- [Postman Reproduction Instructions](postman/README.md)
- [Automation Documentation](automation/README.md)
- [GitHub Actions Workflow](.github/workflows/newman-api-tests.yml)
- [Day 6 Execution Report](reports/day6-newman-and-github-actions-execution.md)

## Data Security

The public repository does not contain:

- Real customer information
- Real passwords
- Active authentication tokens
- Private API keys
- Confidential employer information
- Payment-card information
- Production database records
- Personal health information
- Secret local environment files

Sensitive and dynamic values are blank, represented through variables or
replaced with `<REDACTED>` markers in public exports.

## Project Limitations

- Restful Booker is a public demonstration API.
- Its records may reset periodically.
- Dynamic booking IDs and response times may differ between runs.
- The requirement baseline is assumed for portfolio testing.
- The local PostgreSQL database is separate from the public API.
- Direct API-to-database reconciliation was not performed.

## Project Development History

The portfolio was completed through structured daily milestones:

- **Day 1** — Repository foundation
- **Day 2** — Requirements and test planning
- **Day 3** — Test cases, RTM and defect drafts
- **Day 4** — PostgreSQL database validation
- **Day 5** — Postman execution and confirmed defects
- **Day 6** — Newman command-line execution, CI smoke-test design,
  GitHub Actions automation, secure secrets and report artifacts

[View the complete project development journal](docs/project-development-journal.md)

## Next Planned Activities

1. Verify every public link after the optimized files are uploaded.
2. Complete the final public repository security review.
3. Prepare a combined API and database executive summary.
4. Begin Day 6 automation and portfolio-presentation activities.

## Author

**Dhruba Aryal**

QA, REST API and Database Testing Portfolio

## License

This project is licensed under the MIT License. See the
[LICENSE](LICENSE) file for details.
