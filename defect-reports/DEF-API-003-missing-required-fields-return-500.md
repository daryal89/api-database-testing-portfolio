# DEF-API-003: POST /booking Returns HTTP 500 When Required Fields Are Missing

## Defect Information

| Field | Value |
|---|---|
| Defect ID | DEF-API-003 |
| Title | POST /booking returns HTTP 500 instead of a client-validation response when required fields are missing |
| Requirement IDs | BOOK-001; BOOK-002; NFR-002 |
| Related Test Cases | TC-BOOK-002; TC-BOOK-003; TC-BOOK-006 |
| Severity | Medium |
| Priority | High |
| Status | New |
| Reproducibility | Reproduced |

## Description

The booking-creation endpoint returns HTTP 500 when `firstname`,
`bookingdates`, or `lastname` is omitted.

## Expected Result

The API returns HTTP 400 or HTTP 422, identifies the missing field, and
does not create a booking.

## Actual Result

The API returned HTTP 500 for all three scenarios. No booking ID was
created, but no clear field-validation response was returned.

## Evidence

```text
day5-30-defect-missing-firstname-request.png
day5-31-defect-missing-firstname-response.png
day5-32-defect-missing-booking-dates-request.png
day5-33-defect-missing-booking-dates-response.png
day5-34-defect-missing-lastname-request.png
day5-35-defect-missing-lastname-response.png
day5-36-missing-required-fields-run-results.png
day5-37-final-complete-collection-run.png
```
