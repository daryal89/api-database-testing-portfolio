# Defect Reports

This folder contains confirmed REST API defect reports, the consolidated
defect workbook and CSV, and the preserved outcome of the original
hypothetical defect drafts.

## Confirmed Defects

| Defect ID | Summary | Related Test Cases | Severity | Priority | Status |
|---|---|---|---|---|---|
| [DEF-API-001](DEF-API-001-invalid-booking-date-sequence.md) | Checkout before check-in is accepted during booking creation and update | TC-BOOK-004; TC-UPD-005 | High | High | New |
| [DEF-API-002](DEF-API-002-nonpositive-total-price.md) | Zero and negative total prices are accepted | TC-BOOK-005; TC-VAL-002 | High | High | New |
| [DEF-API-003](DEF-API-003-missing-required-fields-return-500.md) | Missing required fields return HTTP 500 | TC-BOOK-002; TC-BOOK-003; TC-BOOK-006 | Medium | High | New |

## Defect Files

- [Defect workbook](booking-system-defect-reports.xlsx)
- [GitHub-previewable defect CSV](booking-system-defect-reports.csv)
- [DEF-API-001 — Invalid Booking-Date Sequence](DEF-API-001-invalid-booking-date-sequence.md)
- [DEF-API-002 — Nonpositive Total Price](DEF-API-002-nonpositive-total-price.md)
- [DEF-API-003 — Missing Required Fields Return HTTP 500](DEF-API-003-missing-required-fields-return-500.md)

## Defect Evidence Summary

| Defect | Primary Finding | Evidence Index |
|---|---|---|
| DEF-API-001 | Invalid date sequence accepted during creation and update | [Screenshot evidence](../screenshots/README.md#def-api-001--invalid-booking-date-sequence-accepted) |
| DEF-API-002 | Zero and negative prices accepted during creation | [Screenshot evidence](../screenshots/README.md#def-api-002--zero-and-negative-total-prices-accepted) |
| DEF-API-003 | Missing required fields return HTTP 500 | [Screenshot evidence](../screenshots/README.md#def-api-003--missing-required-fields-return-http-500) |

## Original Draft Outcomes

| Draft | Outcome |
|---|---|
| DEF-DRAFT-001 | Confirmed and converted to DEF-API-001 |
| DEF-DRAFT-002 | Rejected — unauthorized update returned HTTP 403 |
| DEF-DRAFT-003 | Rejected — deleted booking returned HTTP 404 |

The draft history is retained in the `Draft_History` worksheet of the
Excel defect workbook. This preserves the original hypotheses and shows
which behaviors were confirmed or rejected after execution.

## Defect Assessment Notes

- The defects are evaluated against the assumed production requirement
  baseline documented for this portfolio.
- Restful Booker is a public demonstration API.
- Severity and priority ratings demonstrate professional defect triage
  for a production-oriented scenario.
- The public API and local PostgreSQL portfolio database are separate
  systems.
- Evidence contains only synthetic, nonproduction test information.
- Active credentials and authentication tokens are not included.

## Related Documentation

- [Screenshot Evidence Index](../screenshots/README.md)
- [Test Cases](../test-cases/README.md)
- [Requirements Traceability](../requirements-traceability/README.md)
- [Day 5 API Execution Report](../reports/day5-api-validation-execution.md)
- [Postman Documentation](../postman/README.md)
- [Main Project README](../README.md)
