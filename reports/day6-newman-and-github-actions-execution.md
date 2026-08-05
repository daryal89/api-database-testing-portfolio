# Day 6 Newman and GitHub Actions Execution Report

## Execution Summary

## Objectives

## Environment

## Tools and Versions

## Collection Strategy

## Local Full-Collection Execution

## Local Smoke-Collection Execution

## Initial GitHub Actions Failure

## Root-Cause Analysis

## Corrective Action

## Successful GitHub Actions Execution

## Repository Secrets

## Generated Reports and Artifacts

## Security Controls

## Issues Encountered

## Resolutions

## Final Results

## Limitations

## Evidence

## Career-Reentry Skills Demonstrated

## CI smoke suite

| Metric | Result |
|---|---:|
| Requests executed | 19 |
| Failed requests | 0 |
| Test scripts executed | 19 |
| Failed test scripts | 0 |
| Pre-request scripts executed | 2 |
| Failed pre-request scripts | 0 |
| Assertions executed | 45 |
| Failed assertions | 0 |
| Exit code | 0 |

The smoke suite is the strict GitHub Actions quality gate. Any smoke-suite
failure makes the workflow fail.

## Full validation suite

| Metric | Result |
|---|---:|
| Requests executed | 26 |
| Failed requests | 0 |
| Assertions executed | 61 |
| Passed assertions | 51 |
| Failed assertions | 10 |
| Unique API validation findings | 7 |
| Exit code | 1 |

## Known API validation findings

1. A negative total price is accepted and creates a booking.
2. A zero total price is accepted and creates a booking.
3. Checkout before check-in is accepted.
4. Missing booking dates return HTTP 500 instead of HTTP 400 or 422.
5. Missing first name returns HTTP 500 instead of HTTP 400 or 422.
6. Missing last name returns HTTP 500 instead of HTTP 400 or 422.
7. An authenticated update accepts an invalid date sequence.

## GitHub Actions strategy

The workflow runs two suites:

1. **CI smoke suite**
   - Stable health, authentication, CRUD, authorization, retrieval, and
     deletion coverage
   - Must pass
   - Acts as the strict CI quality gate

2. **Full validation suite**
   - Includes all negative validation scenarios
   - Continues exposing documented API defects
   - Runs with `continue-on-error: true`
   - Does not hide failed assertions
   - Produces a separate JUnit report

## Workflow artifacts

The workflow uploads:

- `smoke-junit-report`
- `full-validation-junit-report`

This design provides a green CI quality gate for stable functionality while
retaining transparent evidence of known third-party API validation defects.