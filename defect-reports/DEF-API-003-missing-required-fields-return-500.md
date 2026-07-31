# DEF-API-003: POST /booking Returns HTTP 500 When Required Fields Are Missing

## Defect Information

| Field | Value |
|---|---|
| Defect ID | DEF-API-003 |
| Title | POST /booking returns HTTP 500 instead of a client-validation response when required fields are missing |
| Requirement IDs | BOOK-001; BOOK-002; NFR-002 |
| Related Test Cases | TC-BOOK-002; TC-BOOK-003; TC-BOOK-006 |
| Module | Booking Creation and Error Handling |
| Severity | Medium |
| Priority | High |
| Status | New |
| Reported By | Dhruba Aryal |
| Execution Date | July 30, 2026 |
| Reproducibility | Reproduced |

## Description

The booking-creation endpoint returns HTTP 500 when a required booking
field is omitted.

The issue was reproduced separately for:

1. Missing `firstname`
2. Missing `bookingdates`
3. Missing `lastname`

The requests were rejected and no invalid booking was created. However,
the response classified predictable client-input validation failures as
an internal server error.

## Environment

| Item | Value |
|---|---|
| Application | Restful Booker public demonstration API |
| Base URL | `https://restful-booker.herokuapp.com` |
| API Client | Postman Desktop |
| Collection | Restful Booker API Testing Portfolio |
| Environment | Restful Booker - Day 5 Local |
| Operating System | Windows |
| Test Environment Type | Public, nonproduction demonstration service |

## Preconditions

- The Restful Booker API is available.
- The Postman collection and local environment are selected.
- Request headers include `Content-Type: application/json`.
- All fields other than the field being omitted contain valid test data.
- The corrected Postman assertions require HTTP 400 or HTTP 422 for
  required-field validation failures.

## Test Data

### Scenario 1: Missing `firstname`

| Field | Value |
|---|---|
| Omitted field | `firstname` |
| Related test case | TC-BOOK-002 |
| Remaining fields | Valid test data |

### Scenario 2: Missing `bookingdates`

| Field | Value |
|---|---|
| Omitted field | `bookingdates` |
| Related test case | TC-BOOK-003 |
| Remaining fields | Valid test data |

### Scenario 3: Missing `lastname`

| Field | Value |
|---|---|
| Omitted field | `lastname` |
| Related test case | TC-BOOK-006 |
| Remaining fields | Valid test data |

## Steps to Reproduce

### Scenario 1: Missing `firstname`

1. Open `TC-BOOK-002 - Missing first name` in Postman.
2. Confirm the request method is `POST`.
3. Confirm the endpoint is `{{baseUrl}}/booking`.
4. Remove the `firstname` property from the request body.
5. Keep the remaining booking fields valid.
6. Send the request.
7. Review the HTTP status and response body.
8. Verify that no booking ID is returned.

### Scenario 2: Missing `bookingdates`

1. Open `TC-BOOK-003 - Missing booking dates` in Postman.
2. Confirm the request method is `POST`.
3. Confirm the endpoint is `{{baseUrl}}/booking`.
4. Remove the complete `bookingdates` object from the request body.
5. Keep the remaining booking fields valid.
6. Send the request.
7. Review the HTTP status and response body.
8. Verify that no booking ID is returned.

### Scenario 3: Missing `lastname`

1. Open `TC-BOOK-006 - Missing last name` in Postman.
2. Confirm the request method is `POST`.
3. Confirm the endpoint is `{{baseUrl}}/booking`.
4. Remove the `lastname` property from the request body.
5. Keep the remaining booking fields valid.
6. Send the request.
7. Review the HTTP status and response body.
8. Verify that no booking ID is returned.

## Expected Result

For all three required-field scenarios:

- The API should reject the request.
- No booking ID should be generated.
- The API should return HTTP 400 or HTTP 422.
- The response should identify the missing required field.
- The response should be classified as a client-validation error rather
  than an internal server error.

## Actual Result

For all three scenarios:

- The API returned HTTP 500 Internal Server Error.
- No booking ID was returned.
- No invalid booking was created.
- The response did not provide a clear field-level validation message.

No invalid booking was created, but HTTP 500 was returned instead of a
clear HTTP 400 or HTTP 422 client-validation response.

## Reproducibility

**Reproduced**

The behavior was reproduced during the Day 5 Postman execution in:

- `TC-BOOK-002`
- `TC-BOOK-003`
- `TC-BOOK-006`

Each scenario returned HTTP 500.

## Severity and Priority Rationale

**Severity: Medium**

The API successfully prevented creation of the invalid records, so the
core data-integrity impact is lower than defects that create invalid
bookings. However, HTTP 500 incorrectly represents a predictable
client-validation condition as a server failure.

**Priority: High**

Incorrect server-error classification can trigger false outage alerts,
mislead API consumers, complicate retry logic and prevent clients from
correcting invalid input efficiently.

Severity and priority are based on the assumed production requirement
baseline used by this portfolio, even though Restful Booker is a public
demonstration API. The ratings demonstrate how the behavior would be
assessed in a production-oriented testing context.

## Business Impact

Potential consequences include:

- False server-failure or availability alerts
- Misleading monitoring and incident reports
- Unnecessary automatic retries
- Poor client-side error handling
- Inability to identify and correct the missing field quickly
- Increased troubleshooting and support effort
- Inaccurate service-reliability metrics

## Recommended Correction

- Return HTTP 400 or HTTP 422 for missing required fields.
- Return a structured response identifying the missing field.
- Use a consistent validation-error schema across required-field checks.
- Reserve HTTP 500 for unexpected server-side failures.
- Add automated regression tests for every required field.
- Confirm that creation and update endpoints apply consistent
  validation and error classification.

## Evidence

### Missing-First-Name Evidence

- [Missing-first-name request](../screenshots/day5-defects/day5-30-defect-missing-firstname-request.png)
- [Missing-first-name response](../screenshots/day5-defects/day5-31-defect-missing-firstname-response.png)

### Missing-Booking-Dates Evidence

- [Missing-booking-dates request](../screenshots/day5-defects/day5-32-defect-missing-booking-dates-request.png)
- [Missing-booking-dates response](../screenshots/day5-defects/day5-33-defect-missing-booking-dates-response.png)

### Missing-Last-Name Evidence

- [Missing-last-name request](../screenshots/day5-defects/day5-34-defect-missing-lastname-request.png)
- [Missing-last-name response](../screenshots/day5-defects/day5-35-defect-missing-lastname-response.png)

### Collection Runner Evidence

- [Required-field Collection Runner results](../screenshots/day5-defects/day5-36-missing-required-fields-run-results.png)
- [Final complete Collection Runner result](../screenshots/day5-api-execution/day5-37-final-complete-collection-run.png)
- [Final failed assertions — Part 1](../screenshots/day5-api-execution/day5-38-final-failed-assertions.png)

## Notes

- The required-field and error-response expectations are based on the
  assumed production requirement baseline used by this portfolio.
- Restful Booker is a public demonstration API and may intentionally
  implement simplified behavior.
- The issue is the HTTP classification and lack of useful validation
  detail, not the creation of an invalid booking.
- The API and the local PostgreSQL portfolio database are separate
  systems.
- No production customer data or active credential is included in the
  evidence.
