# DEF-API-001: API Accepts Checkout Date Earlier Than Check-In Date

## Defect Information

| Field | Value |
|---|---|
| Defect ID | DEF-API-001 |
| Title | API accepts checkout date earlier than check-in date during booking creation and update |
| Requirement ID | BOOK-003 |
| Related Test Cases | TC-BOOK-004; TC-UPD-005 |
| Severity | High |
| Priority | High |
| Status | New |
| Reproducibility | Reproduced |

## Description

The API accepts a booking when checkout occurs before check-in. The
behavior was reproduced during booking creation and authenticated update.

## Test Data

```text
Check-in: 2026-08-14
Checkout: 2026-08-10
```

## Expected Result

The API returns HTTP 400 or HTTP 422 and does not create or update the
booking with an invalid date sequence.

## Actual Result

The API returned HTTP 200 and accepted the invalid date sequence during
both booking creation and update.

## Evidence

```text
day5-22-defect-invalid-date-create-request.png
day5-23-defect-invalid-date-create-response.png
day5-24-defect-invalid-date-update-request.png
day5-25-defect-invalid-date-update-response.png
day5-37-final-complete-collection-run.png
```
