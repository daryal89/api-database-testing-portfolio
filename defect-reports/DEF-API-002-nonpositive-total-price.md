# DEF-API-002: API Accepts Zero and Negative Total Prices

## Defect Information

| Field | Value |
|---|---|
| Defect ID | DEF-API-002 |
| Title | API accepts zero and negative total prices during booking creation |
| Requirement ID | BOOK-004 |
| Related Test Cases | TC-BOOK-005; TC-VAL-002 |
| Module | Booking Creation and Price Validation |
| Severity | High |
| Priority | High |
| Status | New |
| Reported By | Dhruba Aryal |
| Execution Date | July 30, 2026 |
| Reproducibility | Reproduced |

## Description

The booking-creation endpoint accepts nonpositive `totalprice` values.

The issue was reproduced through two separate negative scenarios:

1. `totalprice = 0`
2. `totalprice = -1`

In both scenarios, the API returned HTTP 200 and created a booking
instead of rejecting the invalid financial value.

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
- Valid values are supplied for all booking fields other than the price
  value under test.
- Request headers include `Content-Type: application/json`.

## Test Data

### Scenario 1: Zero Total Price

| Field | Value |
|---|---|
| `totalprice` | `0` |
| Remaining booking fields | Valid test data |
| Related test case | TC-BOOK-005 |

### Scenario 2: Negative Total Price

| Field | Value |
|---|---|
| `totalprice` | `-1` |
| Remaining booking fields | Valid test data |
| Related test case | TC-VAL-002 |

## Steps to Reproduce

### Scenario 1: `totalprice = 0`

1. Open `TC-BOOK-005 - Zero total price` in Postman.
2. Confirm the request method is `POST`.
3. Confirm the endpoint is `{{baseUrl}}/booking`.
4. Enter valid values for the name, deposit, dates and additional-needs
   fields.
5. Set `totalprice` to `0`.
6. Send the request.
7. Review the HTTP status and response body.
8. Verify whether a booking ID is returned.

### Scenario 2: `totalprice = -1`

1. Open `TC-VAL-002 - Negative total price` in Postman.
2. Confirm the request method is `POST`.
3. Confirm the endpoint is `{{baseUrl}}/booking`.
4. Enter valid values for the remaining booking fields.
5. Set `totalprice` to `-1`.
6. Send the request.
7. Review the HTTP status and response body.
8. Verify whether a booking ID is returned.

## Expected Result

For both scenarios:

- The API should reject the nonpositive price.
- The API should return HTTP 400 or HTTP 422.
- No booking ID should be generated.
- No booking should be created.
- The response should identify that `totalprice` must be greater than
  zero.

## Actual Result

### Scenario 1: `totalprice = 0`

- The API returned HTTP 200.
- A booking ID was returned.
- The booking was created with `totalprice` equal to `0`.

### Scenario 2: `totalprice = -1`

- The API returned HTTP 200.
- A booking ID was returned.
- The booking was created with `totalprice` equal to `-1`.

## Reproducibility

**Reproduced**

The behavior was reproduced during the Day 5 Postman execution in:

- `TC-BOOK-005`
- `TC-VAL-002`

## Severity and Priority Rationale

**Severity: High**

The defect permits invalid financial values to enter the booking
workflow. Nonpositive prices can affect billing, reporting and
downstream financial processing.

**Priority: High**

Price validation should occur before a booking is created so that
invalid financial data does not enter the system.

Severity and priority are assigned against the assumed production
requirement baseline used by this portfolio. Restful Booker is a public
demonstration API, so these ratings demonstrate professional defect
assessment rather than a claim about a production service.

## Business Impact

Invalid prices could create inaccurate billing, payment and revenue
records.

Additional potential impacts include:

- Incorrect booking totals
- Invalid payment calculations
- Inaccurate revenue reporting
- Incorrect financial reconciliation
- Invalid analytics and management reports
- Downstream integration errors
- Increased manual correction effort

## Recommended Correction

- Add server-side validation requiring `totalprice` to be greater than
  zero.
- Reject zero and negative values before creating a booking.
- Return HTTP 400 or HTTP 422.
- Return a clear field-level message for `totalprice`.
- Add automated regression tests for zero, negative, minimum-positive
  and unusually large price values.

## Evidence

### Zero-Price Evidence

- [Zero-price request](../screenshots/day5-defects/day5-26-defect-zero-price-request.png)
- [Zero-price response](../screenshots/day5-defects/day5-27-defect-zero-price-response.png)

### Negative-Price Evidence

- [Negative-price request](../screenshots/day5-defects/day5-28-defect-negative-price-request.png)
- [Negative-price response](../screenshots/day5-defects/day5-29-defect-negative-price-response.png)

### Final Execution Evidence

- [Final complete Collection Runner result](../screenshots/day5-api-execution/day5-37-final-complete-collection-run.png)
- [Final failed assertions — Part 1](../screenshots/day5-api-execution/day5-38-final-failed-assertions.png)

## Notes

- The requirement that `totalprice` must be greater than zero is an
  assumed business requirement documented for this portfolio.
- The API and the local PostgreSQL portfolio database are separate
  systems.
- This report documents observed public demonstration API behavior.
- Dynamic booking IDs may differ in later executions because the API can
  reset its data.
- No production customer data or active credential is included in the
  evidence.
