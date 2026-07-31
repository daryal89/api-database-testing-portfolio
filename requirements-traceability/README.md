# Requirements Traceability

This folder contains the Requirements Traceability Matrix in Excel and
GitHub-previewable CSV formats.

## Day 5 API Execution

All 25 manual/API test cases were executed.

| Result | Count |
|---|---:|
| Passed | 18 |
| Failed | 7 |
| Blocked | 0 |
| Not Run | 0 |

The failed requirements are associated with:

- Invalid booking-date validation
- Nonpositive total-price validation
- Required-field error handling

`DATA-002` and `DATA-008` remain planned because the public API does not
provide authorized access to its underlying database.
