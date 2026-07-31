# Project Screenshots

This folder contains execution evidence supporting the API and database
testing portfolio.

The screenshots document:

- PostgreSQL database setup and validation
- SQL data-quality and constraint testing
- Postman REST API execution
- Positive and negative API test results
- Confirmed API defects
- Final Collection Runner results

Only screenshots containing public-safe, nonproduction information are
included.

## Evidence Categories

### Day 4 — PostgreSQL Database Testing

The Day 4 screenshots demonstrate:

- PostgreSQL connection and database selection
- `booking_test_db` database
- `booking_portfolio` schema
- Customer, booking and payment tables
- Customer and booking staging tables
- Production-style record counts
- Customers without bookings
- Bookings without payment records
- Duplicate and orphan-record checks
- Production date-integrity validation
- Production price-integrity validation
- Controlled staging duplicate detection
- Controlled staging date-error detection
- Controlled staging price-error detection
- Invalid or missing booking-status detection
- Customer-value ranking
- Automated 13-check database-validation summary
- Six database-constraint negative-test results

### Day 4 Validation Results

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
portfolio environment.

They do not represent access to the database used by the public Restful
Booker demonstration API.

## Day 5 — Postman REST API Testing

The Day 5 screenshots demonstrate:

- Postman workspace and collection organization
- Reusable environment-variable configuration
- Authentication-token workflow
- Automated booking-ID workflow
- Valid and invalid authentication testing
- Valid booking creation
- Required-field validation
- Boundary-value validation
- Booking retrieval and search
- Full and partial booking updates
- Authorization testing
- Booking deletion
- Positive and negative assertions
- Status-code assertions
- Response-body assertions
- Response-time assertions
- Complete Collection Runner execution
- Confirmed API defect evidence

### Day 5 Final Execution Results

| Metric | Result |
|---|---:|
| Requests planned | 26 |
| Requests executed | 26 |
| Collection completion | 100% |
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

## Day 5 Functional Evidence

| Screenshot | Purpose | Related Test Cases |
|---|---|---|
| [Valid authentication results](day5-17-valid-authentication-results.png) | Demonstrates successful authentication, token validation and response-time testing | TC-AUTH-001 |
| [Valid booking creation results](day5-18-valid-booking-creation-results.png) | Demonstrates successful booking creation, booking-ID generation and response-data validation | TC-BOOK-001 |
| [Booking retrieval results](day5-19-booking-retrieval-results.png) | Demonstrates existing-booking retrieval, nonexistent-booking handling and customer-name search | TC-RET-001; TC-RET-002; TC-RET-003 |
| [Booking update results](day5-20-booking-update-results.png) | Demonstrates authorized full update, authorized partial update and unauthorized-update rejection | TC-UPD-001; TC-UPD-002; TC-UPD-004 |
| [Booking deletion results](day5-21-booking-deletion-results.png) | Demonstrates authorized deletion, unauthorized-deletion rejection and deleted-booking verification | TC-DEL-001; TC-DEL-002; TC-DEL-003 |
| [Final complete Collection Runner result](day5-37-final-complete-collection-run.png) | Demonstrates completion of the full 26-request workflow with zero runtime errors | All API test cases |
| [Final failed assertions — Part 1](day5-38-final-failed-assertions-part-1.png) | Shows the first portion of the final failed-assertion evidence | Failed API test cases |
| [Final failed assertions — Part 2](day5-39-final-failed-assertions-part-2.png) | Shows the remaining final failed-assertion evidence | Failed API test cases |

## Confirmed API Defect Evidence

### DEF-API-001 — Invalid Booking-Date Sequence Accepted

The API accepted a checkout date earlier than the check-in date during
both booking creation and authenticated update.

Related test cases:

```text
TC-BOOK-004
TC-UPD-005
