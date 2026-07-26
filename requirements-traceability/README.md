# Requirements Traceability

This folder contains the requirements baseline and Requirements
Traceability Matrix for the sample booking system.

## Current Files

### booking-system-requirements.md

Defines the assumed functional, database, data-quality and
nonfunctional requirements used by the portfolio project.

### booking-system-requirements-traceability-matrix.xlsx

The Excel matrix connects each requirement to:

- Related test cases or SQL checks
- Coverage status
- Execution status
- Related defects
- Coverage comments

### booking-system-requirements-traceability-matrix.csv

Provides a GitHub-previewable version of the traceability matrix.

## Functional Requirements

The following requirement groups have manual test-case coverage:

- Authentication
- Booking creation
- Booking retrieval
- Booking update
- Booking deletion

The related manual and API test cases remain **Not Run** pending Postman
execution.

## Database Requirements

The Day 4 local PostgreSQL work produced the following status:

| Requirement | Coverage Status | Execution Status |
|---|---|---|
| DATA-001 | Partially Covered | Pass |
| DATA-002 | Planned | Not Run |
| DATA-003 | Covered | Pass |
| DATA-004 | Covered | Pass |
| DATA-005 | Covered | Pass |
| DATA-006 | Covered | Pass |
| DATA-007 | Covered | Pass |
| DATA-008 | Planned | Not Run |

`DATA-002` and `DATA-008` remain pending because the local database is
not the database behind the public demonstration API.

## Nonfunctional Requirements

The nonfunctional API requirements remain planned or partially covered.
They will receive additional coverage during Postman execution and
repository-security review.
