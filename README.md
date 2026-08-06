# API, Database and CI Test Automation Portfolio

[![Newman API Tests](https://github.com/daryal89/api-database-testing-portfolio/actions/workflows/newman-api-tests.yml/badge.svg?branch=main)](https://github.com/daryal89/api-database-testing-portfolio/actions/workflows/newman-api-tests.yml)

## Project Overview

This portfolio demonstrates a complete quality-assurance workflow for a
sample online booking system:

- Requirements analysis and software test planning
- Manual and REST API test design
- Requirements traceability
- PostgreSQL database validation
- Postman API execution
- Defect investigation and reporting
- Newman command-line automation
- GitHub Actions continuous integration
- JSON and JUnit reporting
- Secure credential handling
- Public-safe technical evidence

The REST API phase uses the public **Restful Booker** demonstration API.
The database phase uses a separate, locally created PostgreSQL portfolio
database.

The public API does not provide authorized access to its underlying
database. API and database results are therefore documented as separate
testing activities rather than as direct API-to-database reconciliation.

## Key Results

### PostgreSQL Database Validation

| Metric | Result |
|---|---:|
| SQL validation and analysis queries | 19 |
| Automated database-summary checks | 13 of 13 passed |
| Database-constraint negative tests | 6 of 6 passed |
| Production-style integrity failures | 0 |

### Complete Postman and Newman Validation

| Metric | Result |
|---|---:|
| Manual/API test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Known assertion failures | 10 |
| Runtime errors | 0 |
| Confirmed API defects | 3 |

### GitHub Actions CI Quality Gate

| Metric | Result |
|---|---:|
| CI requests executed | 19 |
| CI test scripts executed | 19 |
| CI pre-request scripts executed | 2 |
| CI assertions executed | 45 |
| CI assertions passed | 45 |
| CI assertions failed | 0 |
| CI runtime errors | 0 |
| GitHub Actions result | Pass |
| Automated report formats | JSON and JUnit |
| Workflow artifact groups | 2 |

The final `main` workflow completed successfully.

Newman uses `test-scripts` to describe post-response scripts. The
project's documented manual/API baseline remains 25 test cases.

## Quick Links

### Planning and Traceability

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

### Postman and Automation

- [Postman Documentation](postman/README.md)
- [Complete Public-Safe Collection](postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [Stable CI Collection](postman/restful-booker-ci-smoke.public-sanitized.postman_collection.json)
- [CI Coverage Mapping](docs/day6-ci-coverage-mapping.md)
- [Sanitized Environment Template](postman/restful-booker-template.public-sanitized.postman_environment.json)
- [Automation Documentation](automation/README.md)
- [GitHub Actions Workflow](.github/workflows/newman-api-tests.yml)

### Reports and Evidence

- [Day 4 Database Execution Report](reports/day4-database-validation-execution.md)
- [Day 5 API Execution Report](reports/day5-api-validation-execution.md)
- [Day 6 Newman and GitHub Actions Report](reports/day6-newman-and-github-actions-execution.md)
- [API, Database and Automation Executive Summary](reports/api-database-automation-executive-summary.md)
- [Screenshot Evidence Index](screenshots/README.md)
- [Day 6 CI Troubleshooting Case Study](docs/day6-ci-troubleshooting-case-study.md)
- [Project Development Journal](docs/project-development-journal.md)
- [Project Changelog](CHANGELOG.md)

## Portfolio Highlights

- Designed and executed 25 manual/API test cases.
- Built a 26-request complete Postman collection with 61 assertions.
- Documented seven failed test cases and three confirmed API defects.
- Created 19 SQL validation queries, 13 automated database checks and
  six database-constraint negative tests.
- Installed Newman as a project dependency with a committed lockfile.
- Created a stable 19-request CI smoke/regression collection.
- Executed 45 CI assertions with zero failures.
- Protected credentials with GitHub repository secrets.
- Generated JSON and JUnit reports as workflow artifacts.
- Investigated and corrected an initial CI design failure without
  weakening valid defect assertions.
- Preserved clear boundaries between the public API and local database.

## Test and Automation Strategy

The repository contains two public-safe Postman collections:

| Collection | Purpose | Actual Baseline | CI Role |
|---|---|---|---|
| Complete validation collection | Full positive, negative, boundary, authorization and defect coverage | 26 requests, 61 assertions, 10 known failures | Reporting suite |
| Stable CI smoke/regression collection | Health check plus 18 passing Day 5 scenarios selected for CI | 19 requests, 45 assertions, zero failures | Strict quality gate |

The CI collection excludes the seven requests associated with confirmed
Day 5 requirement mismatches:

```text
TC-BOOK-002
TC-BOOK-003
TC-BOOK-004
TC-BOOK-005
TC-BOOK-006
TC-VAL-002
TC-UPD-005
```

Those scenarios remain unchanged in the complete collection.

The smoke/regression suite determines the final workflow result. The
complete suite runs with `continue-on-error` so its known failures remain
visible and its JSON and JUnit reports are still uploaded.

## Confirmed API Defects

| Defect | Finding | Related Test Cases | Severity |
|---|---|---|---|
| [DEF-API-001](defect-reports/DEF-API-001-invalid-booking-date-sequence.md) | Checkout before check-in accepted during creation and update | TC-BOOK-004; TC-UPD-005 | High |
| [DEF-API-002](defect-reports/DEF-API-002-nonpositive-total-price.md) | Zero and negative total prices accepted | TC-BOOK-005; TC-VAL-002 | High |
| [DEF-API-003](defect-reports/DEF-API-003-missing-required-fields-return-500.md) | Missing required fields return HTTP 500 | TC-BOOK-002; TC-BOOK-003; TC-BOOK-006 | Medium |

The severity and priority classifications are based on the assumed
portfolio requirement baseline. Restful Booker is a demonstration API.

## Skills Demonstrated

### Testing

- Requirements analysis
- Test planning and traceability
- Functional, positive, negative and boundary testing
- Authentication and authorization testing
- Status-code, response-body and response-time validation
- Defect reporting
- Test-execution reporting

### API Automation and CI/CD

- Postman collection design
- Environment and dynamic-variable workflows
- Node.js and npm
- Newman command-line execution
- GitHub Actions
- YAML workflow configuration
- CI quality-gate design
- Repository-secret management
- JSON and JUnit reporting
- Workflow artifact management
- CI troubleshooting and root-cause analysis

### Database Testing

- PostgreSQL and SQL
- Schema and relationship validation
- Required-field, duplicate and orphan detection
- Date and price validation
- Staging-data quality checks
- Database-constraint negative testing

## Reproducing the Tests

The complete collection preserves the full requirement and defect
baseline.

The CI collection must complete:

```text
19 requests
19 test scripts
2 pre-request scripts
45 assertions
0 failures
0 runtime errors
```

Detailed instructions:

- [Postman Reproduction Guide](postman/README.md)
- [Newman and GitHub Actions Guide](automation/README.md)
- [Day 6 Execution Report](reports/day6-newman-and-github-actions-execution.md)

## Scope and Environment Boundaries

### In Scope

- Booking authentication and CRUD workflows
- Positive, negative and boundary API testing
- Required-field, date and price validation
- PostgreSQL data-integrity testing
- Traceability and defect reporting
- Local and CI Newman execution
- Secure automated reporting

### Out of Scope

- Production penetration testing
- High-volume load and stress testing
- Production deployment
- Payment-card processing
- Production customer information
- Direct API-to-database reconciliation without authorized access

## Security Controls

- Public Postman credentials remain blank.
- Local credentials remain in an ignored environment file.
- CI credentials use `BOOKER_USERNAME` and `BOOKER_PASSWORD` repository
  secrets.
- Active tokens are not committed.
- Generated local Newman results remain ignored.
- Public screenshots and exports are sanitized.
- Workflow permissions are limited to repository-content read access.

## Limitations

- Restful Booker is a public demonstration service.
- Booking data may reset.
- Dynamic IDs and response times may vary.
- The requirement baseline is assumed for portfolio testing.
- The local PostgreSQL database is separate from the public API.
- The CI collection excludes seven known-failure scenarios by design.
- The complete collection remains authoritative for defect coverage.
- Workflow artifacts expire according to the configured retention
  period.

<details>
<summary><strong>Repository Structure</strong></summary>

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
│   ├── day6-ci-coverage-mapping.md
│   ├── day6-ci-troubleshooting-case-study.md
│   └── project-development-journal.md
├── test-plan/
├── test-cases/
├── defect-reports/
├── requirements-traceability/
├── postman/
├── sql/
├── reports/
└── screenshots/
    ├── day4-database/
    ├── day5-api-execution/
    ├── day5-defects/
    └── day6-automation/
```

</details>

<details>
<summary><strong>Completed Milestones</strong></summary>

### Foundation and Test Design

- [x] Requirements baseline and software test plan
- [x] 25 detailed manual/API test cases
- [x] Requirements Traceability Matrix
- [x] Professional folder documentation

### PostgreSQL Validation

- [x] Local schema and synthetic data
- [x] 19 SQL validation and analysis queries
- [x] 13 automated validation-summary checks
- [x] Six database-constraint negative tests
- [x] Database execution report and evidence

### Postman API Testing

- [x] Complete 26-request validation collection
- [x] 61 automated assertions
- [x] 18 passed and seven failed test cases
- [x] Three confirmed API defects
- [x] Public-safe exports and evidence

### Newman and GitHub Actions

- [x] Newman installed as a project dependency
- [x] Complete collection executed through Newman
- [x] Stable 19-request CI collection created
- [x] 45 CI assertions passed
- [x] GitHub repository secrets configured
- [x] GitHub Actions workflow completed successfully
- [x] JSON and JUnit reports generated
- [x] Two artifact groups preserved
- [x] Pull request merged into `main`
- [x] Final `main` workflow verified
- [x] Documentation aligned to the actual CI result

</details>

## Release Status

The Day 6 work is merged and verified on `main`.

Current published release:

[Day 5 — Manual, API and Database Testing Baseline](https://github.com/daryal89/api-database-testing-portfolio/releases/tag/v1.0.0)

Next release:

```text
Tag: v1.1.0
Title: Day 6 — Newman and GitHub Actions Automation
Target: main
```

The remaining Day 6 step is to publish `v1.1.0` after this
documentation-only alignment is merged.

## Project Development History

- **Day 1** — Repository foundation
- **Day 2** — Requirements and test planning
- **Day 3** — Test cases, RTM and defect drafts
- **Day 4** — PostgreSQL validation
- **Day 5** — Postman execution and confirmed defects
- **Day 6** — Newman, CI collection design and GitHub Actions automation

[View the complete project development journal](docs/project-development-journal.md)

## Author

**Dhruba Aryal**

QA, REST API, Database and CI Test Automation Portfolio

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
