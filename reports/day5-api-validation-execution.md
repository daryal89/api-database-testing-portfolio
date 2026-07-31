# Day 5 REST API Validation Execution Summary

## Document Information

| Field | Value |
|---|---|
| Project | API and Database Testing Portfolio |
| API | Restful Booker |
| Tool | Postman Desktop |
| Prepared By | Dhruba Aryal |
| Test Environment | Public demonstration API |
| Execution Date | July 30, 2026 |
| Execution Status | Completed with functional failures |

## Purpose

The purpose of Day 5 was to create and execute a structured Postman
collection covering authentication, booking creation, retrieval,
search, update, deletion, negative testing, boundary testing,
authorization and response validation.

## Request Coverage

| Area | Requests |
|---|---:|
| Health Check | 1 |
| Authentication | 5 |
| Booking Creation and Validation | 8 |
| Booking Retrieval | 3 |
| Booking Update | 5 |
| Booking Deletion | 4 |
| Total Requests | 26 |

## Collection Runner Results

| Metric | Result |
|---|---:|
| Iterations | 1 |
| Requests planned | 26 |
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Assertions skipped | 0 |
| Runtime errors | 0 |
| Average response time | 36 ms |
| Duration | 3.256 seconds |

## Manual and API Test-Case Results

| Metric | Result |
|---|---:|
| Test cases planned | 25 |
| Test cases executed | 25 |
| Passed | 18 |
| Failed | 7 |
| Blocked | 0 |
| Not Run | 0 |

The health-check request passed and is not included in the 25-test-case count.

## Failed Test Cases

| Test Case | Actual Behavior | Related Defect |
|---|---|---|
| TC-BOOK-002 | Missing first name returned HTTP 500 | DEF-API-003 |
| TC-BOOK-003 | Missing booking dates returned HTTP 500 | DEF-API-003 |
| TC-BOOK-004 | Invalid date sequence was accepted with HTTP 200 | DEF-API-001 |
| TC-BOOK-005 | Zero total price was accepted with HTTP 200 | DEF-API-002 |
| TC-BOOK-006 | Missing last name returned HTTP 500 | DEF-API-003 |
| TC-VAL-002 | Negative total price was accepted with HTTP 200 | DEF-API-002 |
| TC-UPD-005 | Invalid date update was accepted with HTTP 200 | DEF-API-001 |

## Confirmed Defects

| Defect ID | Title | Severity | Priority |
|---|---|---|---|
| DEF-API-001 | API accepts checkout before check-in during creation and update | High | High |
| DEF-API-002 | API accepts zero and negative total prices | High | High |
| DEF-API-003 | POST /booking returns HTTP 500 when required fields are missing | Medium | High |

## Original Draft Outcomes

| Draft | Outcome |
|---|---|
| DEF-DRAFT-001 | Confirmed and converted to DEF-API-001 |
| DEF-DRAFT-002 | Rejected because unauthorized update returned HTTP 403 |
| DEF-DRAFT-003 | Rejected because deleted-booking retrieval returned HTTP 404 |

## Response-Time Results

The configured response-time threshold was 2000 milliseconds.

All configured response-time assertions passed. The final collection-run
average response time was 36 milliseconds.

## API-Specific Observations

### OBS-API-001

Authenticated update and deletion requests for nonexistent booking IDs
returned HTTP 405. The Day 5 baseline accepted HTTP 404 or HTTP 405, so
the related cases were recorded as Pass and were not included in the
confirmed defect count.

### OBS-API-002

Invalid authentication returned HTTP 200 with a `Bad credentials`
response and no token. The test baseline was designed around this
demonstration-API behavior.

## Key Findings

1. The complete 26-request collection executed with zero runtime errors.
2. Valid authentication, creation, retrieval, search, update and deletion
   workflows completed successfully.
3. Unauthorized update and deletion operations were rejected.
4. The API accepted checkout dates earlier than check-in dates.
5. The API accepted zero and negative total prices.
6. The API returned HTTP 500 for missing required booking fields.
7. All configured response-time checks passed.
8. Direct API-to-database validation was not performed because the
   public API is separate from the local PostgreSQL database.

## Security Review

Before public upload:

- Active authentication tokens were removed
- Dynamic booking IDs were removed or redacted
- The environment template was sanitized
- Postman account-linked export metadata was removed
- Saved response examples containing dynamic data were removed
- No private credentials or API keys were included

## Final Result

Day 5 REST API execution completed successfully from a test-execution
perspective. All 26 requests ran and zero runtime errors occurred.

Ten assertions failed because seven test cases identified API behavior
that did not satisfy the portfolio requirement baseline.

Three confirmed API defects were documented.

## Author

**Dhruba Aryal**
