# Project Screenshots

This folder contains public-safe execution evidence supporting the API
and database testing portfolio.

The evidence is organized so that reviewers can locate database
validation, successful API workflows, final Collection Runner results
and confirmed defect evidence without searching through unrelated
screenshots.

## Recommended Folder Structure

```text
screenshots/
├── README.md
├── day4-database/
├── day5-api-execution/
├── day5-defects/
└── day6-automation/
```

- `day4-database/` contains PostgreSQL and SQL validation evidence.
- `day5-api-execution/` contains successful workflows and final runner
  summaries.
- `day5-defects/` contains request, response and focused runner evidence
  for confirmed API defects.

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
| Automated validation-summary checks executed | 13 |
| Automated validation-summary checks passed | 13 |
| Automated validation-summary checks failed | 0 |
| Database-constraint negative tests executed | 6 |
| Database-constraint negative tests passed | 6 |
| Database-constraint negative tests failed | 0 |
| Production integrity failures identified | 0 |

The Day 4 screenshots represent a local, nonproduction PostgreSQL
portfolio environment. They do not represent direct access to the
database used by the public Restful Booker API.

## Day 5 API Execution Evidence

| Screenshot | Purpose | Related Test Case |
|---|---|---|
| [Valid authentication](day5-api-execution/day5-17-valid-authentication-results.png) | Proves successful authentication, token assertion and response-time validation | TC-AUTH-001 |
| [Valid booking creation](day5-api-execution/day5-18-valid-booking-creation-results.png) | Proves successful booking creation, booking-ID generation and returned-data validation | TC-BOOK-001 |
| [Booking retrieval and search](day5-api-execution/day5-19-booking-retrieval-results.png) | Proves existing retrieval, nonexistent-booking handling and customer-name search | TC-RET-001; TC-RET-002; TC-RET-003 |
| [Booking update results](day5-api-execution/day5-20-booking-update-results.png) | Proves authorized full and partial update workflows and unauthorized-update rejection | TC-UPD-001; TC-UPD-002; TC-UPD-004 |
| [Booking deletion results](day5-api-execution/day5-21-booking-deletion-results.png) | Proves authorized deletion, unauthorized-deletion rejection and deleted-booking retrieval | TC-DEL-001; TC-DEL-002; TC-DEL-003 |
| [Final collection run](day5-api-execution/day5-37-final-complete-collection-run.png) | Proves full 26-request execution with zero runtime errors | All API test cases |
| [Final failed assertions — Part 1](day5-api-execution/day5-38-final-failed-assertions-part-1.png) | Shows the first portion of the final failed-assertion results | Failed API test cases |
| [Final failed assertions — Part 2](day5-api-execution/day5-39-final-failed-assertions-part-2.png) | Shows the remaining final failed-assertion results | Failed API test cases |

### Day 5 Final Execution Results

| Metric | Result |
|---|---:|
| Requests planned | 26 |
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Runtime errors | 0 |
| Assertions skipped | 0 |
| Average response time | 36 ms |
| Manual/API test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Confirmed API defects | 3 |

The failed assertions represent observed API behavior that did not
satisfy the portfolio requirement baseline. They are not Postman
runtime or collection-configuration errors.

## Confirmed Defect Evidence

### DEF-API-001 — Invalid Booking-Date Sequence Accepted

| Screenshot | Finding | Related Test Case |
|---|---|---|
| [Invalid-date creation request](day5-defects/day5-22-defect-invalid-date-create-request.png) | POST request contains checkout before check-in | TC-BOOK-004 |
| [Invalid-date creation response](day5-defects/day5-23-defect-invalid-date-create-response.png) | HTTP 200 returned and invalid booking was created | TC-BOOK-004 |
| [Invalid-date update request](day5-defects/day5-24-defect-invalid-date-update-request.png) | Authenticated PUT request contains checkout before check-in | TC-UPD-005 |
| [Invalid-date update response](day5-defects/day5-25-defect-invalid-date-update-response.png) | HTTP 200 returned and invalid date update was accepted | TC-UPD-005 |

[Open DEF-API-001](../defect-reports/DEF-API-001-invalid-booking-date-sequence.md)

### DEF-API-002 — Zero and Negative Total Prices Accepted

| Screenshot | Finding | Related Test Case |
|---|---|---|
| [Zero-price request](day5-defects/day5-26-defect-zero-price-request.png) | Booking request uses `totalprice = 0` | TC-BOOK-005 |
| [Zero-price response](day5-defects/day5-27-defect-zero-price-response.png) | HTTP 200 returned and zero-price booking was created | TC-BOOK-005 |
| [Negative-price request](day5-defects/day5-28-defect-negative-price-request.png) | Booking request uses `totalprice = -1` | TC-VAL-002 |
| [Negative-price response](day5-defects/day5-29-defect-negative-price-response.png) | HTTP 200 returned and negative-price booking was created | TC-VAL-002 |

[Open DEF-API-002](../defect-reports/DEF-API-002-nonpositive-total-price.md)

### DEF-API-003 — Missing Required Fields Return HTTP 500

| Screenshot | Finding | Related Test Case |
|---|---|---|
| [Missing-first-name request](day5-defects/day5-30-defect-missing-firstname-request.png) | Booking request omits `firstname` | TC-BOOK-002 |
| [Missing-first-name response](day5-defects/day5-31-defect-missing-firstname-response.png) | HTTP 500 returned instead of HTTP 400 or 422 | TC-BOOK-002 |
| [Missing-booking-dates request](day5-defects/day5-32-defect-missing-booking-dates-request.png) | Booking request omits `bookingdates` | TC-BOOK-003 |
| [Missing-booking-dates response](day5-defects/day5-33-defect-missing-booking-dates-response.png) | HTTP 500 returned instead of HTTP 400 or 422 | TC-BOOK-003 |
| [Missing-last-name request](day5-defects/day5-34-defect-missing-lastname-request.png) | Booking request omits `lastname` | TC-BOOK-006 |
| [Missing-last-name response](day5-defects/day5-35-defect-missing-lastname-response.png) | HTTP 500 returned instead of HTTP 400 or 422 | TC-BOOK-006 |
| [Required-field runner results](day5-defects/day5-36-missing-required-fields-run-results.png) | Runner evidence groups the three required-field failures | TC-BOOK-002; TC-BOOK-003; TC-BOOK-006 |

[Open DEF-API-003](../defect-reports/DEF-API-003-missing-required-fields-return-500.md)

## Final Failed Test Cases

| Test Case | Observed Behavior | Related Defect |
|---|---|---|
| TC-BOOK-002 | Missing first name returned HTTP 500 | DEF-API-003 |
| TC-BOOK-003 | Missing booking dates returned HTTP 500 | DEF-API-003 |
| TC-BOOK-004 | Checkout before check-in was accepted with HTTP 200 | DEF-API-001 |
| TC-BOOK-005 | Zero total price was accepted with HTTP 200 | DEF-API-002 |
| TC-BOOK-006 | Missing last name returned HTTP 500 | DEF-API-003 |
| TC-VAL-002 | Negative total price was accepted with HTTP 200 | DEF-API-002 |
| TC-UPD-005 | Invalid date update was accepted with HTTP 200 | DEF-API-001 |

## Day 6 Automation Evidence

| Screenshot | Purpose |
|---|---|
| [Node, npm and Git versions](day6-automation/day6-01-node-npm-git-versions.png) | Confirms the local command-line environment and Day 6 branch |
| [Newman installation](day6-automation/day6-02-newman-installation.png) | Confirms Newman was installed as a project dependency |
| [Full Newman validation run](day6-automation/day6-03-full-newman-run-known-findings.png) | Shows the complete regression collection executing with known findings retained |
| [Smoke collection structure](day6-automation/day6-04-postman-smoke-collection-structure.png) | Shows the stable critical booking workflow selected for CI |
| [Passing Postman smoke run](day6-automation/day6-05-postman-smoke-run-passed.png) | Shows the smoke collection passing in Postman Desktop |
| [Initial GitHub Actions failure](day6-automation/day6-06-initial-github-actions-failure.png) | Documents the first CI result and generated artifact |
| [Initial failure log](day6-automation/day6-07-github-actions-failure-log.png) | Shows that known requirement-mismatch assertions caused exit code 1 |
| [Passing local Newman smoke run](day6-automation/day6-08-local-newman-smoke-pass.png) | Shows zero failed assertions and exit code 0 locally |
| [Repository secret names](day6-automation/day6-09-github-actions-secret-names.png) | Confirms secure credential configuration without exposing values |
| [Green GitHub Actions workflow](day6-automation/day6-11-github-actions-green-summary.png) | Shows the automated smoke workflow completing successfully |
| [Passing GitHub Actions Newman step](day6-automation/day6-12-github-actions-newman-pass.png) | Shows zero failed smoke assertions in CI |
| [Workflow report artifact](day6-automation/day6-13-github-actions-artifact.png) | Shows the generated JSON and JUnit report artifact |

The initial failed workflow is retained as troubleshooting evidence. It
does not represent the final automation result.

The final CI quality gate is the separate smoke collection, which must
complete with zero failed assertions and zero runtime errors.

## Preliminary Execution Evidence

Preliminary Collection Runner screenshots may be retained locally for
learning and troubleshooting history.

Screenshots showing outdated totals, incomplete execution or runtime
errors should not be uploaded as final public evidence.

The authoritative Day 5 execution result is:

```text
26 requests executed
61 assertions executed
51 assertions passed
10 assertions failed
0 runtime errors
```

## Screenshot Security Rules

Public screenshots must not contain:

- Passwords
- Active authentication tokens
- Private API keys
- Cookie values
- Private environment-variable values
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

Temporary synthetic booking IDs may appear only when they do not expose
private or production information.

## Environment and Evidence Limitations

The Restful Booker API is a public demonstration service whose data may
reset periodically.

Therefore:

- Booking IDs may differ between executions.
- Individual response times may differ.
- Existing bookings may disappear after an API reset.
- Screenshots represent the documented Day 5 execution session.
- The public API is not connected to the local PostgreSQL portfolio
  database.
- API and local database evidence must be interpreted as separate
  testing environments.

## Related Documentation

- [Main Project README](../README.md)
- [Postman Testing Documentation](../postman/README.md)
- [Test Cases](../test-cases/README.md)
- [Confirmed Defect Reports](../defect-reports/README.md)
- [Requirements Traceability](../requirements-traceability/README.md)
- [Day 4 Database Execution Report](../reports/day4-database-validation-execution.md)
- [Day 5 API Execution Report](../reports/day5-api-validation-execution.md)
