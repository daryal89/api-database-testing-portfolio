# Software Test Plan

This folder contains the completed software test plan for the sample
online booking system.

## Files

- [Booking System Test Plan](booking-system-test-plan.md)
- [Requirements Baseline](../requirements-traceability/booking-system-requirements.md)
- [Manual/API Test Cases](../test-cases/README.md)
- [Requirements Traceability Matrix](../requirements-traceability/README.md)
- [Test Execution Reports](../reports/README.md)

## Test-Plan Coverage

The test plan documents:

- Project objectives
- Testing scope
- Testing approach
- Test environment
- Entry criteria
- Exit criteria
- Test deliverables
- Risks and mitigation strategies
- Roles and responsibilities
- Defect-management process
- Test-data and security requirements
- API and database testing boundaries

## Execution Status

The test plan was used to guide:

- Design of 25 manual/API test cases
- PostgreSQL database validation
- Postman REST API execution
- Requirements traceability
- Defect investigation and reporting
- Day 4 database reporting
- Day 5 API execution reporting

## Final API Results

| Metric | Result |
|---|---:|
| Test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Confirmed API defects | 3 |
| Postman runtime errors | 0 |

## Environment Limitation

The public Restful Booker API and the local PostgreSQL portfolio database
are separate systems.

Direct API-to-database reconciliation was not performed because the
public API does not provide authorized access to its underlying
database.

## Related Documentation

- [Main Project README](../README.md)
- [Postman Testing Documentation](../postman/README.md)
- [Database Testing Documentation](../sql/README.md)
- [Screenshot Evidence Index](../screenshots/README.md)