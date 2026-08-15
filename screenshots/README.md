# Project Screenshot Evidence

This folder contains public-safe execution evidence supporting the
database, API and CI automation portfolio.

## Folder Structure

```text
screenshots/
├── README.md
├── day4-database/
├── day5-api-execution/
├── day5-defects/
└── day6-automation/
```

- `day4-database/` contains PostgreSQL and SQL validation evidence.
- `day5-api-execution/` contains Postman workflows and final runner
  summaries.
- `day5-defects/` contains focused evidence for confirmed API defects.
- `day6-automation/` contains Newman, GitHub Actions and CI
  troubleshooting evidence.

## Day 4 PostgreSQL Evidence

Day 4 evidence demonstrates:

- PostgreSQL connection and correct database selection
- `booking_test_db` database
- `booking_portfolio` schema and tables
- Production-style record counts
- Customer and booking staging tables
- Customers without bookings
- Bookings without payment records
- Duplicate, null, orphan, date and price validation
- Controlled staging anomalies
- Customer-value ranking
- Automated 13-check validation summary
- Six database-constraint negative tests

### Day 4 Results

| Metric | Result |
|---|---:|
| SQL validation and analysis queries | 19 |
| Automated validation-summary checks | 13 |
| Automated checks passed | 13 |
| Automated checks failed | 0 |
| Database-constraint negative tests | 6 |
| Constraint tests passed | 6 |
| Production integrity failures | 0 |

The Day 4 screenshots represent a local, nonproduction PostgreSQL
portfolio environment. They do not represent access to the database used
by the public Restful Booker API.

## Day 5 API Execution Evidence

| Screenshot | Purpose | Related Test Case |
|---|---|---|
| [Valid authentication](day5-api-execution/day5-17-valid-authentication-results.png) | Proves successful authentication and token assertion | TC-AUTH-001 |
| [Valid booking creation](day5-api-execution/day5-18-valid-booking-creation-results.png) | Proves successful booking creation and booking-ID generation | TC-BOOK-001 |
| [Booking retrieval and search](day5-api-execution/day5-19-booking-retrieval-results.png) | Proves retrieval, nonexistent handling and name search | TC-RET-001; TC-RET-002; TC-RET-003 |
| [Booking update results](day5-api-execution/day5-20-booking-update-results.png) | Proves full, partial and unauthorized update workflows | TC-UPD-001; TC-UPD-002; TC-UPD-004 |
| [Booking deletion results](day5-api-execution/day5-21-booking-deletion-results.png) | Proves deletion, unauthorized rejection and 404 verification | TC-DEL-001; TC-DEL-002; TC-DEL-003 |
| [Final collection run](day5-api-execution/day5-37-final-complete-collection-run.png) | Proves the complete 26-request execution | All API test cases |
| [Failed assertions — Part 1](day5-api-execution/day5-38-final-failed-assertions-part-1.png) | Shows the first portion of failed-assertion evidence | Failed API test cases |
| [Failed assertions — Part 2](day5-api-execution/day5-39-final-failed-assertions-part-2.png) | Shows the remaining failed-assertion evidence | Failed API test cases |

### Day 5 Results

| Metric | Result |
|---|---:|
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Runtime errors | 0 |
| Manual/API test cases | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Confirmed defects | 3 |

## Confirmed Defect Evidence

### DEF-API-001 — Invalid Booking-Date Sequence Accepted

| Screenshot | Finding | Test Case |
|---|---|---|
| [Invalid-date creation request](day5-defects/day5-22-defect-invalid-date-create-request.png) | Request contains checkout before check-in | TC-BOOK-004 |
| [Invalid-date creation response](day5-defects/day5-23-defect-invalid-date-create-response.png) | HTTP 200 and invalid booking creation | TC-BOOK-004 |
| [Invalid-date update request](day5-defects/day5-24-defect-invalid-date-update-request.png) | Authenticated update contains invalid dates | TC-UPD-005 |
| [Invalid-date update response](day5-defects/day5-25-defect-invalid-date-update-response.png) | HTTP 200 and invalid update acceptance | TC-UPD-005 |

[Open DEF-API-001](../defect-reports/DEF-API-001-invalid-booking-date-sequence.md)

### DEF-API-002 — Zero and Negative Total Prices Accepted

| Screenshot | Finding | Test Case |
|---|---|---|
| [Zero-price request](day5-defects/day5-26-defect-zero-price-request.png) | Request uses `totalprice = 0` | TC-BOOK-005 |
| [Zero-price response](day5-defects/day5-27-defect-zero-price-response.png) | Zero-price booking created | TC-BOOK-005 |
| [Negative-price request](day5-defects/day5-28-defect-negative-price-request.png) | Request uses `totalprice = -1` | TC-VAL-002 |
| [Negative-price response](day5-defects/day5-29-defect-negative-price-response.png) | Negative-price booking created | TC-VAL-002 |

[Open DEF-API-002](../defect-reports/DEF-API-002-nonpositive-total-price.md)

### DEF-API-003 — Missing Required Fields Return HTTP 500

| Screenshot | Finding | Test Case |
|---|---|---|
| [Missing-first-name request](day5-defects/day5-30-defect-missing-firstname-request.png) | Request omits `firstname` | TC-BOOK-002 |
| [Missing-first-name response](day5-defects/day5-31-defect-missing-firstname-response.png) | HTTP 500 instead of HTTP 400 or 422 | TC-BOOK-002 |
| [Missing-booking-dates request](day5-defects/day5-32-defect-missing-booking-dates-request.png) | Request omits `bookingdates` | TC-BOOK-003 |
| [Missing-booking-dates response](day5-defects/day5-33-defect-missing-booking-dates-response.png) | HTTP 500 instead of HTTP 400 or 422 | TC-BOOK-003 |
| [Missing-last-name request](day5-defects/day5-34-defect-missing-lastname-request.png) | Request omits `lastname` | TC-BOOK-006 |
| [Missing-last-name response](day5-defects/day5-35-defect-missing-lastname-response.png) | HTTP 500 instead of HTTP 400 or 422 | TC-BOOK-006 |
| [Required-field runner results](day5-defects/day5-36-missing-required-fields-run-results.png) | Groups the required-field failures | TC-BOOK-002; TC-BOOK-003; TC-BOOK-006 |

[Open DEF-API-003](../defect-reports/DEF-API-003-missing-required-fields-return-500.md)

## Day 6 Automation Evidence

| Screenshot | Purpose |
|---|---|
| [Node, npm and Git versions](day6-automation/day6-01-node-npm-git-versions.png) | Confirms the local command-line environment and feature branch |
| [Newman installation](day6-automation/day6-02-newman-installation.png) | Confirms Newman was installed as a project dependency |
| [Complete Newman run](day6-automation/day6-03-full-newman-run-known-findings.png) | Shows 26 requests, 61 assertions and known findings retained |
| [Smoke collection structure](day6-automation/day6-04-postman-smoke-collection-structure.png) | Shows the stable CI collection built from the health check and 18 passing Day 5 scenarios |
| [Passing Postman smoke run](day6-automation/day6-05-postman-smoke-run-passed.png) | Shows the smoke suite passing in Postman |
| [Initial GitHub Actions failure](day6-automation/day6-06-initial-github-actions-failure.png) | Documents the first CI result and generated artifact |
| [Initial failure log](day6-automation/day6-07-github-actions-failure-log.png) | Shows that retained defect assertions caused exit code 1 |
| [Passing local Newman smoke run](day6-automation/day6-08-local-newman-smoke-pass.png) | Shows zero smoke failures and local exit code 0 |
| [Repository secret names](day6-automation/day6-09-github-actions-secret-names.png) | Confirms secure secret configuration without exposing values |
| [Green GitHub Actions summary](day6-automation/day6-11-github-actions-green-summary.png) | Shows the final successful workflow |
| [Passing CI smoke log](day6-automation/day6-12-github-actions-newman-pass.png) | Shows 19 requests and 45 assertions completing with zero failures |
| [Full validation findings](day6-automation/day6-13-full-validation-known-findings.png) | Shows the complete suite findings retained in CI |
| [Workflow strategy summary](day6-automation/day6-14-workflow-test-strategy-summary.png) | Shows smoke as the strict gate and full validation as reporting |
| [Workflow artifacts](day6-automation/day6-15-github-actions-artifacts.png) | Shows both JSON/JUnit artifact groups |
| [Pull-request checks](day6-automation/day6-16-pull-request-checks-passed.png) | Confirms validation before merge |
| [Final main-branch workflow](day6-automation/day6-17-main-branch-workflow-success.png) | Confirms the merged workflow passed on `main`, preserved complete-suite findings and generated both artifact groups |
| [Final workflow notice summary](day6-automation/day6-18-main-workflow-notice-summary.png) | Confirms the final successful `main` workflow, one expected Newman exit-code annotation, one informational notice, and both Newman report artifact groups |

The initial failed workflow is retained as troubleshooting evidence. It
does not represent the final automation result.

The final CI quality gate is the 19-request smoke/regression suite,
which completed 45 assertions with zero failures and zero runtime errors.

## Day 7 — v1.1.1 Portfolio Hardening Evidence

| Screenshot | Purpose |
|---|---|
| [Post-change smoke validation](day7-v1.1.1-hardening/day7-01-v1.1.1-post-change-smoke-pass.png) | Confirms the hardened release candidate retained the strict CI baseline of 19 requests, 45 passing assertions and zero failures |
| [Complete validation known findings](day7-v1.1.1-hardening/day7-02-v1.1.1-complete-suite-known-findings.png) | Confirms the complete suite retained 26 requests, 61 runtime assertions and 10 known assertion failures for documented defect reporting |
| [Staged v1.1.1 release package](day7-v1.1.1-hardening/day7-03-v1.1.1-staged-release-package.png) | Confirms version 1.1.1, the four-file hardening scope, no unstaged changes and preservation of the v1.1.0 tag |
| [Pull request and CI success](day7-v1.1.1-hardening/day7-04-v1.1.1-pr-ci-success.png) | Confirms PR #5 triggered the Newman GitHub Actions workflow and completed the strict CI quality gate successfully |
| [Published v1.1.1 GitHub release](day7-v1.1.1-hardening/day7-05-v1.1.1-github-release.png) | Confirms v1.1.1 was published as the Latest release with the verified API, CI and database baselines |

The Day 7 evidence demonstrates that the portfolio-hardening patch changed
release metadata and documentation without weakening the verified QA,
database or CI behavior.

## Screenshot Security Rules

Public screenshots must not contain:

- Passwords
- Active authentication tokens
- Private API keys
- Token-bearing cookie values
- Private environment values
- Private Postman account information
- Personal email addresses
- Confidential employer information
- Real customer information
- Production database records
- Personal documents
- Unrelated browser tabs
- Desktop notifications
- Sensitive local file paths

Authentication-token values must always be hidden, cropped or redacted.

## Environment and Evidence Limitations

The Restful Booker API is a public demonstration service whose data may
reset periodically.

Therefore:

- Booking IDs may differ between executions.
- Response times may differ.
- Existing bookings may disappear after a reset.
- Screenshots represent specific recorded sessions.
- The public API is not connected to the local PostgreSQL portfolio
  database.
- A passing CI workflow proves the health check and 18 stable passing
  scenarios; the complete collection remains the source for known-
  failure and defect coverage.

## Related Documentation

- [Main Project README](../README.md)
- [Postman Documentation](../postman/README.md)
- [Automation Documentation](../automation/README.md)
- [Test Cases](../test-cases/README.md)
- [Confirmed Defect Reports](../defect-reports/README.md)
- [Requirements Traceability](../requirements-traceability/README.md)
- [Day 4 Database Report](../reports/day4-database-validation-execution.md)
- [Day 5 API Report](../reports/day5-api-validation-execution.md)
- [Day 6 Automation Report](../reports/day6-newman-and-github-actions-execution.md)
