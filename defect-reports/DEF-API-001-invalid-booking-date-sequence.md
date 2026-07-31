# DEF-API-001: API Accepts Checkout Date Earlier Than Check-In Date

## Defect Information

| Field | Value |
|---|---|
| Defect ID | DEF-API-001 |
| Title | API accepts checkout date earlier than check-in date during booking creation and update |
| Requirement ID | BOOK-003 |
| Related Test Cases | TC-BOOK-004; TC-UPD-005 |
| Module | Booking Creation and Booking Update |
| Severity | High |
| Priority | High |
| Status | New |
| Reported By | Dhruba Aryal |
| Execution Date | July 30, 2026 |
| Reproducibility | Reproduced |

## Description

The API accepts a booking when the checkout date occurs before the
check-in date.

The same date-validation weakness was reproduced through two separate
operations:

1. Booking creation using `POST /booking`
2. Authenticated full booking update using
   `PUT /booking/{{bookingId}}`

Both operations returned HTTP 200 and retained the invalid date
sequence.

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
- Valid booking data is available.
- A valid authentication token has been generated for the update
  scenario.
- A valid booking ID exists for the update scenario.
- Request headers include the required content type and authentication
  information.

## Test Data

| Field | Value |
|---|---|
| Check-in date | `2026-08-14` |
| Checkout date | `2026-08-10` |
| Remaining booking fields | Valid test data |
| Expected validation rule | Checkout must occur after check-in |

## Steps to Reproduce

### Scenario 1: Booking Creation — `POST /booking`

1. Open `TC-BOOK-004 - Checkout before check-in` in Postman.
2. Confirm the request method is `POST`.
3. Confirm the endpoint is `{{baseUrl}}/booking`.
4. Enter otherwise valid booking data.
5. Set `bookingdates.checkin` to `2026-08-14`.
6. Set `bookingdates.checkout` to `2026-08-10`.
7. Send the request.
8. Review the HTTP status and response body.
9. Verify whether a booking ID is returned.

### Scenario 2: Full Booking Update — `PUT /booking/{{bookingId}}`

1. Authenticate successfully and save the returned token locally.
2. Create a valid booking and save its booking ID.
3. Open `TC-UPD-005 - Update with invalid date sequence`.
4. Confirm the request method is `PUT`.
5. Confirm the endpoint is
   `{{baseUrl}}/booking/{{bookingId}}`.
6. Confirm valid authentication is included.
7. Set `bookingdates.checkin` to `2026-08-14`.
8. Set `bookingdates.checkout` to `2026-08-10`.
9. Send the request.
10. Review the HTTP status and returned booking dates.

## Expected Result

For both booking creation and authenticated booking update:

- The API should reject the invalid date sequence.
- The API should return HTTP 400 or HTTP 422.
- No new booking should be created using the invalid dates.
- An existing booking should not be updated using the invalid dates.
- The response should identify the date-sequence validation failure.

## Actual Result

### Booking Creation

- The API returned HTTP 200.
- A booking ID was returned.
- The booking was created with checkout earlier than check-in.

### Booking Update

- The API returned HTTP 200.
- The existing booking was updated.
- The invalid date sequence was retained in the response.

The same validation weakness therefore affects both creation and update
operations.

## Reproducibility

**Reproduced**

The behavior was reproduced during the Day 5 Postman execution in both
affected test cases:

- `TC-BOOK-004`
- `TC-UPD-005`

## Severity and Priority Rationale

**Severity: High**

The defect allows logically invalid booking records to be created and
updated. Invalid dates can affect availability calculations, reporting,
billing and downstream integrations.

**Priority: High**

The validation should be applied consistently before booking data is
accepted by either the create or update endpoint.

Severity and priority are assigned against the assumed production
requirement baseline used by this portfolio. Restful Booker is a public
demonstration API, so these ratings demonstrate professional defect
assessment rather than a claim about a production service.

## Business Impact

Potential business consequences include:

- Logically impossible booking periods
- Inaccurate availability calculations
- Incorrect duration or pricing calculations
- Invalid customer confirmations
- Reporting and analytics errors
- Downstream data-integrity problems
- Additional manual correction and support effort

## Recommended Correction

- Add server-side validation requiring checkout to occur after check-in.
- Apply the same validation rule to both creation and update endpoints.
- Reject invalid requests before writing booking data.
- Return HTTP 400 or HTTP 422.
- Return a clear validation message identifying the invalid date
  sequence.
- Add automated regression coverage for create, full-update and
  partial-update operations.

## Evidence

### Booking Creation Evidence

- [Invalid-date creation request](../screenshots/day5-defects/day5-22-defect-invalid-date-create-request.png)
- [Invalid-date creation response](../screenshots/day5-defects/day5-23-defect-invalid-date-create-response.png)

### Booking Update Evidence

- [Invalid-date update request](../screenshots/day5-defects/day5-24-defect-invalid-date-update-request.png)
- [Invalid-date update response](../screenshots/day5-defects/day5-25-defect-invalid-date-update-response.png)

### Final Execution Evidence

- [Final complete Collection Runner result](../screenshots/day5-api-execution/day5-37-final-complete-collection-run.png)
- [Final failed assertions — Part 1](../screenshots/day5-api-execution/day5-38-final-failed-assertions.png)

## Notes

- The requirement that checkout must occur after check-in is an assumed
  business requirement documented for this portfolio.
- The API and the local PostgreSQL portfolio database are separate
  systems.
- This report documents observed public demonstration API behavior.
- Dynamic booking IDs may differ in later executions because the API can
  reset its data.
- No production customer data or active credential is included in the
  evidence.
