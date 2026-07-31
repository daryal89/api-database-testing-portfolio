# Requirements Traceability

This folder contains the booking-system requirement baseline and the
Requirements Traceability Matrix in Excel and GitHub-previewable CSV
formats.

## Files

- [Requirements Baseline](booking-system-requirements.md)
- [Requirements Traceability Matrix — Excel](booking-system-requirements-traceability-matrix.xlsx)
- [Requirements Traceability Matrix — CSV](booking-system-requirements-traceability-matrix.csv)
- [Test Cases — CSV](../test-cases/booking-system-test-cases.csv)
- [Confirmed Defect Reports](../defect-reports/README.md)

## Purpose

The RTM connects each requirement to:

- Related test cases or SQL validation activities
- Coverage status
- Execution status
- Related defect IDs
- Coverage and limitation comments

## Current RTM Summary

| Metric | Result |
|---|---:|
| Requirements documented | 35 |
| Covered | 30 |
| Partially Covered | 3 |
| Planned | 2 |
| Execution Pass | 28 |
| Execution Fail | 5 |
| Not Run | 2 |

## Failed Requirement Rows

| Requirement | Result | Related Defect |
|---|---|---|
| BOOK-001 | Fail | DEF-API-003 |
| BOOK-002 | Fail | DEF-API-003 |
| BOOK-003 | Fail | DEF-API-001 |
| BOOK-004 | Fail | DEF-API-002 |
| NFR-002 | Fail | DEF-API-001; DEF-API-002; DEF-API-003 |

## Database Requirement Status

| Requirement | Coverage | Execution |
|---|---|---|
| DATA-001 | Partially Covered | Pass |
| DATA-002 | Planned | Not Run |
| DATA-003 | Covered | Pass |
| DATA-004 | Covered | Pass |
| DATA-005 | Covered | Pass |
| DATA-006 | Covered | Pass |
| DATA-007 | Covered | Pass |
| DATA-008 | Planned | Not Run |

`DATA-002` and `DATA-008` remain planned because the public Restful
Booker API does not provide authorized access to its underlying database
and is not connected to the local PostgreSQL portfolio database.

## Traceability Principles

- Every confirmed API defect is linked to failed test cases.
- Failed test cases are mapped to the affected requirements.
- Database testing is not represented as direct validation of public API
  persistence.
- Planned and partially covered requirements remain visible rather than
  being marked complete without evidence.
- Public-safe evidence is linked through the screenshot index.

## Related Documentation

- [Main Project README](../README.md)
- [Test Cases](../test-cases/README.md)
- [Confirmed Defects](../defect-reports/README.md)
- [Postman Documentation](../postman/README.md)
- [Day 4 Database Execution Report](../reports/day4-database-validation-execution.md)
- [Day 5 API Execution Report](../reports/day5-api-validation-execution.md)
- [Screenshot Evidence Index](../screenshots/README.md)
