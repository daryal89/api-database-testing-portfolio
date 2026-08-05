# API, Database and CI Test Automation Portfolio

[![Newman API Tests](https://github.com/daryal89/api-database-testing-portfolio/actions/workflows/newman-api-tests.yml/badge.svg)](https://github.com/daryal89/api-database-testing-portfolio/actions/workflows/newman-api-tests.yml)

## Project Overview

This portfolio demonstrates an end-to-end quality-assurance workflow for
a sample online booking system.

The project progresses from requirements and manual test design through
database validation, REST API testing, defect reporting and continuous
integration:

- Requirements analysis and software test planning
- Manual and REST API test-case design
- Requirements traceability
- PostgreSQL database validation
- Postman collection development and execution
- Positive, negative, boundary-value and authorization testing
- Automated API assertions
- Defect investigation and reporting
- Newman command-line execution
- GitHub Actions continuous-integration testing
- JSON and JUnit test-report generation
- Secure credential handling with repository secrets
- Public-safe evidence and technical documentation

The REST API phase uses the public **Restful Booker** demonstration API.
The database phase uses a separate, locally created PostgreSQL portfolio
database.

The public API does not provide authorized access to its underlying
database. API results and local database results are therefore
documented as separate testing activities rather than as direct
API-to-database reconciliation.

## Key Results

### Day 4 — PostgreSQL Validation

| Metric | Result |
|---|---:|
| SQL validation and analysis queries | 19 |
| Automated database-summary checks | 13 of 13 passed |
| Database-constraint negative tests | 6 of 6 passed |
| Production-style integrity failures | 0 |

### Day 5 — Postman REST API Testing

| Metric | Result |
|---|---:|
| Manual/API test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Postman requests executed | 26 |
| Postman assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Postman runtime errors | 0 |
| Average response time | 36 ms |
| Confirmed API defects | 3 |

### Day 6 — Newman and GitHub Actions

| Metric | Result |
|---|---:|
| CI smoke requests | 8 |
| CI smoke assertions | 22 |
| CI smoke assertions passed | 22 |
| CI smoke assertions failed | 0 |
| CI smoke runtime errors | 0 |
| Full Newman validation requests | 26 |
| Full Newman validation assertions | 61 |
| Known full-suite assertion failures | 10 |
| Full-suite runtime errors | 0 |
| GitHub Actions smoke quality gate | Pass |
| Automated report formats | JSON and JUnit |
| Workflow artifact groups | 2 |

The full validation suite intentionally preserves the Day 5 requirement
mismatches. The separate smoke suite is the strict passing CI quality
gate.

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
- [Complete Public-Safe Collection](postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [Public-Safe CI Smoke Collection](postman/restful-booker-ci-smoke.public-sanitized.postman_collection.json)
- [Sanitized Environment Template](postman/restful-booker-template.public-sanitized.postman_environment.json)
- [Sanitized Day 5 Runner Result](postman/day5-postman-collection-run-results.public-sanitized.json)
- [Day 5 API Execution Report](reports/day5-api-validation-execution.md)

### Automation and CI/CD

- [Automation Documentation](automation/README.md)
- [GitHub Actions Workflow](.github/workflows/newman-api-tests.yml)
- [Day 6 Newman and GitHub Actions Report](reports/day6-newman-and-github-actions-execution.md)
- [API, Database and Automation Executive Summary](reports/api-database-automation-executive-summary.md)
- [Day 6 CI Troubleshooting Case Study](docs/day6-ci-troubleshooting-case-study.md)
- [Day 6 Automation Evidence](screenshots/README.md#day-6-automation-evidence)

### PostgreSQL Database Testing

- [SQL Database Testing Documentation](sql/README.md)
- [SQL Validation Queries](sql/03_validation_queries.sql)
- [Automated Database Validation Summary](reports/day4-database-validation-summary.csv)
- [Day 4 Database Execution Report](reports/day4-database-validation-execution.md)

### Evidence and Project History

- [Screenshot Evidence Index](screenshots/README.md)
- [Project Development Journal](docs/project-development-journal.md)
- [Project Changelog](CHANGELOG.md)

## Release Status

The current stable release is:

[Day 5 — Manual, API and Database Testing Baseline](https://github.com/daryal89/api-database-testing-portfolio/releases/tag/v1.0.0)

After the Day 6 pull request is merged and the final `main` workflow is
verified, the automation milestone can be published as `v1.1.0`.

## Portfolio Highlights

- Designed and executed a complete booking CRUD workflow using Postman.
- Connected failed test cases to requirements, defect reports and
  screenshot evidence.
- Preserved the original defect-draft history to show which hypotheses
  were confirmed or rejected.
- Built a local PostgreSQL validation suite with data-quality and
  constraint-negative testing.
- Automated API execution with Node.js, npm and Newman.
- Separated complete requirement validation from a stable CI smoke gate.
- Protected demonstration credentials with GitHub repository secrets.
- Generated JSON and JUnit results as downloadable workflow artifacts.
- Investigated and corrected an initial CI failure without weakening
  valid defect assertions.
- Sanitized public assets to prevent credential and token exposure.
- Documented the separation between the public API and local database.

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
- Continues to support a stable critical workflow in CI

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
- Newman command-line execution
- API smoke-test design
- GitHub Actions workflow execution
- JSON and JUnit reporting
- Workflow artifact retention
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
- Strict CI quality gates
- Known-failure regression reporting
- GitHub repository secrets
- JSON and JUnit test reports
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
- Structured test, defect, RTM, execution and automation documentation

## Technologies and Tools

- Git and GitHub
- GitHub Actions
- Node.js
- npm
- Newman
- Postman Desktop
- PostgreSQL
- pgAdmin 4
- SQL
- YAML
- JSON
- JUnit XML
- Microsoft Excel
- Markdown
- Windows and Git Bash

## Automation Strategy

The repository contains two public-safe Postman collections:

| Collection | Purpose | Expected Result | CI Role |
|---|---|---|---|
| Complete validation collection | Full positive, negative, boundary, authorization and defect coverage | Known failed assertions may remain | Reporting suite |
| CI smoke collection | Stable critical booking workflow | Zero failed assertions | Strict quality gate |

The smoke suite determines the GitHub Actions workflow result.

The complete suite runs with its original expectations preserved.
`continue-on-error` allows the workflow to retain and publish known
findings without converting them into artificial passes.

## Project Structure

```text
api-database-testing-portfolio/
├── .github/
│   └── workflows/
│       └── newman-api-tests.yml
├── .gitignore
├── CHANGELOG.md
├── LICENSE
├── README.md
├── package.json
├── package-lock.json
├── automation/
│   └── README.md
├── docs/
│   ├── README.md
│   ├── day6-ci-troubleshooting-case-study.md
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
│   ├── restful-booker-ci-smoke.public-sanitized.postman_collection.json
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
│   ├── day5-api-validation-execution.md
│   ├── day6-newman-and-github-actions-execution.md
│   └── api-database-automation-executive-summary.md
└── screenshots/
    ├── README.md
    ├── day4-database/
    ├── day5-api-execution/
    ├── day5-defects/
    └── day6-automation/
```

Generated Newman JSON and JUnit files are stored locally or as GitHub
Actions artifacts. They are not committed automatically.

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

- [x] 26-request complete validation collection
- [x] Authentication-token and booking-ID workflows
- [x] Booking CRUD execution
- [x] Positive, negative, boundary, authorization and performance assertions
- [x] Full Collection Runner execution
- [x] Public-safe Postman exports
- [x] Reproducibility instructions

#### API Results and Defects

- [x] All 25 manual/API test cases executed
- [x] 18 test cases passed
- [x] Seven test cases failed
- [x] Three confirmed API defects documented
- [x] Original defect-draft history preserved
- [x] Two hypothetical defect drafts rejected
- [x] Clickable defect evidence
- [x] Day 5 API execution report

#### Repository Quality and Security

- [x] Public link verification
- [x] Public repository security review
- [x] Cross-document consistency review
- [x] Organized screenshot evidence indexes

#### Day 6 Test Automation

- [x] Node.js, npm, Git and Newman verified
- [x] Newman installed as a project dependency
- [x] Complete validation collection executed through Newman
- [x] Stable eight-request CI smoke collection created
- [x] Smoke collection passed in Postman
- [x] Smoke collection passed locally through Newman
- [x] GitHub repository secrets configured
- [x] Initial GitHub Actions failure investigated
- [x] Root cause and corrective action documented
- [x] GitHub Actions smoke quality gate completed successfully
- [x] Complete validation findings preserved in CI
- [x] JSON and JUnit reports generated
- [x] Workflow artifacts preserved
- [x] Day 6 evidence and execution reporting completed

### Release Finalization

- [ ] Merge the Day 6 pull request into `main`
- [ ] Verify the final `main` workflow
- [ ] Verify public documentation links after merge
- [ ] Publish the `v1.1.0` Day 6 release

## Day 4 Database Validation Summary

| Metric | Result |
|---|---:|
| SQL validation and analysis queries | 19 |
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
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Runtime errors | 0 |
| Average response time | 36 ms |
| Manual/API test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Confirmed API defects | 3 |

The failed assertions are intentionally retained as evidence of observed
requirement mismatches. They are not hidden or changed to create an
artificially passing collection.

## Day 6 Automation Summary

### CI Smoke Quality Gate

| Metric | Result |
|---|---:|
| Requests executed | 8 |
| Assertions executed | 22 |
| Assertions passed | 22 |
| Assertions failed | 0 |
| Runtime errors | 0 |
| Local Newman exit code | 0 |
| GitHub Actions result | Pass |

### Complete Validation Reporting

| Metric | Result |
|---|---:|
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Known assertion failures | 10 |
| Runtime errors | 0 |
| CI behavior | Findings retained; failure tolerated |

### Automated Evidence

| Item | Result |
|---|---|
| Report formats | JSON and JUnit |
| Smoke artifact | Generated |
| Full-validation artifact | Generated |
| Artifact retention | 14 days |
| Credentials | GitHub repository secrets |

## Current Test Coverage

| Test Area | Test Cases | Execution Result |
|---|---:|---|
| Authentication | 5 | 5 Pass |
| Booking Creation and Validation | 8 | 3 Pass / 5 Fail |
| Booking Retrieval | 3 | 3 Pass |
| Booking Update | 5 | 4 Pass / 1 Fail |
| Booking Deletion | 4 | 4 Pass |
| **Total** | **25** | **18 Pass / 7 Fail** |

The smoke suite reuses selected stable scenarios. It does not replace,
renumber or change the complete 25-test-case baseline.

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

1. The complete collection preserves the full requirement, negative and
   confirmed-defect baseline.
2. The CI smoke collection validates the stable critical booking
   workflow.

The complete collection may report the ten known failed assertions.

The smoke collection must complete with zero failed assertions and zero
runtime errors.

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
- Completed private environment files
- Raw unsanitized execution output

Sensitive values are blank, represented through variables, injected from
repository secrets or replaced with `<REDACTED>` markers.

## Project Limitations

- Restful Booker is a public demonstration API.
- Its records may reset periodically.
- Dynamic booking IDs and response times may differ between runs.
- The requirement baseline is assumed for portfolio testing.
- The local PostgreSQL database is separate from the public API.
- Direct API-to-database reconciliation was not performed.
- The CI smoke suite proves the selected critical workflow, not every
  negative requirement in the complete suite.
- Workflow artifacts are execution evidence, not permanent production
  monitoring.

## Project Development History

The portfolio was completed through structured milestones:

- **Day 1** — Repository foundation
- **Day 2** — Requirements and test planning
- **Day 3** — Test cases, RTM and defect drafts
- **Day 4** — PostgreSQL database validation
- **Day 5** — Postman execution and confirmed defects
- **Day 6** — Newman, smoke-test design and GitHub Actions automation

[View the complete project development journal](docs/project-development-journal.md)

## Next Planned Activities

1. Merge the Day 6 pull request after all required checks pass.
2. Verify the final workflow and links on `main`.
3. Publish the `v1.1.0` automation release.
4. Add the project to the résumé and prepare the CI troubleshooting
   interview story.

## Author

**Dhruba Aryal**

QA, REST API, Database and CI Test Automation Portfolio

## License

This project is licensed under the MIT License. See the
[LICENSE](LICENSE) file for details.
