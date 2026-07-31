# DEF-API-002: API Accepts Zero and Negative Total Prices

## Defect Information

| Field | Value |
|---|---|
| Defect ID | DEF-API-002 |
| Title | API accepts zero and negative total prices during booking creation |
| Requirement ID | BOOK-004 |
| Related Test Cases | TC-BOOK-005; TC-VAL-002 |
| Severity | High |
| Priority | High |
| Status | New |
| Reproducibility | Reproduced |

## Expected Result

The API returns HTTP 400 or HTTP 422 and does not create a booking when
`totalprice` is zero or negative.

## Actual Result

The API returned HTTP 200 and created bookings with `totalprice` equal to
`0` and `-1`.

## Evidence

```text
day5-26-defect-zero-price-request.png
day5-27-defect-zero-price-response.png
day5-28-defect-negative-price-request.png
day5-29-defect-negative-price-response.png
day5-37-final-complete-collection-run.png
```
