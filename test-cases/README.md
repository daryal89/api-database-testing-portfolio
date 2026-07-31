# Test Cases

This folder contains the detailed manual and API test-case workbook and
a GitHub-previewable CSV export.

## Current Files

- `booking-system-test-cases.xlsx`
- `booking-system-test-cases.csv`

## Final Day 5 Execution Status

| Metric | Current Value |
|---|---:|
| Test cases created | 25 |
| Test cases executed | 25 |
| Passed | 18 |
| Failed | 7 |
| Blocked | 0 |
| Not Run | 0 |

## Confirmed Test Failures

The seven failed test cases are linked to three confirmed API defects:

- `DEF-API-001` — Invalid booking-date sequence accepted
- `DEF-API-002` — Zero and negative total prices accepted
- `DEF-API-003` — Missing required fields return HTTP 500
