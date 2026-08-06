# Day 6 CI Coverage Mapping

## Purpose

This document explains how the 19-request CI collection relates to the
complete 26-request Postman validation collection and the 25 documented
manual/API test cases.

The CI collection does not create new manual test cases and does not
change any Day 5 expected result.

## Final CI Baseline

| Metric | Result |
|---|---:|
| Requests executed | 19 |
| Test scripts executed | 19 |
| Pre-request scripts executed | 2 |
| Assertions executed | 45 |
| Assertions passed | 45 |
| Assertions failed | 0 |
| Runtime errors | 0 |
| GitHub Actions result | Pass |

Newman uses `test-scripts` for post-response scripts. The 19 test scripts
shown in the runner summary do not mean that 19 new manual test cases
were created.

## Included CI Requests

The CI collection contains the API health check and the 18 Day 5
scenarios that passed in the complete validation baseline.

### Health Check

- API health check

### Authentication

- `TC-AUTH-001` — Valid authentication
- `TC-AUTH-002` — Invalid password
- `TC-AUTH-003` — Missing username
- `TC-AUTH-004` — Missing password
- `TC-AUTH-005` — Blank credentials

### Booking Creation and Validation

- `TC-BOOK-001` — Valid booking creation
- `TC-VAL-001` — Minimum valid positive price

### Booking Retrieval and Search

- `TC-RET-001` — Retrieve an existing booking
- `TC-RET-002` — Retrieve a nonexistent booking
- `TC-RET-003` — Search by supported customer-name criteria

### Booking Update

- `TC-UPD-001` — Authorized full update
- `TC-UPD-002` — Update without authentication
- `TC-UPD-003` — Update a nonexistent booking
- `TC-UPD-004` — Authorized partial update

### Booking Deletion

- `TC-DEL-001` — Authorized deletion
- `TC-DEL-002` — Retrieve a deleted booking
- `TC-DEL-003` — Delete without authentication
- `TC-DEL-004` — Delete a nonexistent booking

## Excluded Known-Failure Requests

The following seven scenarios remain unchanged in the complete
validation collection but are excluded from the strict passing CI gate:

| Test Case | Documented Finding |
|---|---|
| `TC-BOOK-002` | Missing `firstname` returns HTTP 500 |
| `TC-BOOK-003` | Missing `bookingdates` returns HTTP 500 |
| `TC-BOOK-004` | Checkout before check-in is accepted |
| `TC-BOOK-005` | Zero total price is accepted |
| `TC-BOOK-006` | Missing `lastname` returns HTTP 500 |
| `TC-VAL-002` | Negative total price is accepted |
| `TC-UPD-005` | Invalid date sequence is accepted during update |

These scenarios account for the seven failed Day 5 test cases and the
three confirmed defects.

## Relationship to the Complete Suite

| Suite | Requests | Assertions | Result | Purpose |
|---|---:|---:|---|---|
| CI smoke/regression collection | 19 | 45 | Pass | Strict CI quality gate |
| Complete validation collection | 26 | 61 | 51 pass / 10 known failures | Full requirement and defect reporting |

The CI suite validates stable functionality. The complete suite remains
the authoritative source for negative testing and defect evidence.

## Maintenance Rule

When API behavior changes:

1. Reproduce the affected scenario manually.
2. Compare the result with the assumed requirement baseline.
3. Update defect status when appropriate.
4. Preserve historical evidence in the existing release.
5. Change CI membership only after documenting the reason.
6. Never weaken a valid assertion merely to keep the workflow green.

## Related Documentation

- [Main Project README](../README.md)
- [Postman Documentation](../postman/README.md)
- [Automation Documentation](../automation/README.md)
- [Day 6 Execution Report](../reports/day6-newman-and-github-actions-execution.md)
- [CI Troubleshooting Case Study](day6-ci-troubleshooting-case-study.md)
- [Screenshot Evidence](../screenshots/README.md#day-6-automation-evidence)
