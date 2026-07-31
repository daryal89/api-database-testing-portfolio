# Test Cases

This folder contains the detailed manual and API test-case workbook and a
GitHub-previewable CSV export.

## Files

- [Test Cases — Excel](booking-system-test-cases.xlsx)
- [Test Cases — CSV](booking-system-test-cases.csv)
- [Requirements Traceability Matrix](../requirements-traceability/booking-system-requirements-traceability-matrix.csv)
- [Confirmed Defect Reports](../defect-reports/README.md)
- [Day 5 API Execution Report](../reports/day5-api-validation-execution.md)

## Workbook Structure

The Excel workbook contains:

- `Summary` — final execution totals
- `Test_Cases` — detailed test steps, expected results and actual results
- `Requirements` — requirement baseline used by the test suite
- `Test_Data` — public-safe reusable and dynamic test variables

## Final Day 5 Execution Status

| Metric | Result |
|---|---:|
| Test cases created | 25 |
| Test cases executed | 25 |
| Passed | 18 |
| Failed | 7 |
| Blocked | 0 |
| Not Run | 0 |
| Confirmed defects | 3 |

The health-check request is part of the 26-request Postman collection but
is not counted as one of the 25 manual/API test cases.

## Coverage by Area

| Test Area | Test Cases | Result |
|---|---:|---|
| Authentication | 5 | 5 Pass |
| Booking Creation and Validation | 8 | 3 Pass / 5 Fail |
| Booking Retrieval | 3 | 3 Pass |
| Booking Update | 5 | 4 Pass / 1 Fail |
| Booking Deletion | 4 | 4 Pass |
| **Total** | **25** | **18 Pass / 7 Fail** |

## Failed Test Cases

| Test Case | Actual Behavior | Related Defect |
|---|---|---|
| TC-BOOK-002 | Missing first name returned HTTP 500 | DEF-API-003 |
| TC-BOOK-003 | Missing booking dates returned HTTP 500 | DEF-API-003 |
| TC-BOOK-004 | Checkout before check-in was accepted | DEF-API-001 |
| TC-BOOK-005 | Zero total price was accepted | DEF-API-002 |
| TC-BOOK-006 | Missing last name returned HTTP 500 | DEF-API-003 |
| TC-VAL-002 | Negative total price was accepted | DEF-API-002 |
| TC-UPD-005 | Invalid date update was accepted | DEF-API-001 |

## Status Interpretation

- **Pass** — actual behavior satisfied the documented expected result.
- **Fail** — actual behavior did not satisfy the documented expected
  result.
- **Blocked** — execution could not proceed because a dependency was
  unavailable.
- **Not Run** — execution had not been performed.

A failed assertion is not the same as a Postman runtime error. The final
collection executed with zero runtime errors while seven test cases
identified requirement mismatches.

## Evidence

- [Day 5 API Execution Evidence](../screenshots/README.md#day-5-api-execution-evidence)
- [Confirmed Defect Evidence](../screenshots/README.md#confirmed-defect-evidence)

## Related Documentation

- [Main Project README](../README.md)
- [Postman Documentation](../postman/README.md)
- [Requirements Baseline](../requirements-traceability/booking-system-requirements.md)
- [Requirements Traceability](../requirements-traceability/README.md)
- [Defect Reports](../defect-reports/README.md)
- [Reports](../reports/README.md)
