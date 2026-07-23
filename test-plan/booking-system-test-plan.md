# Booking System Test Plan

## 1. Document Information

| Field | Information |
|---|---|
| Project Name | API and Database Testing Portfolio |
| System Under Test | Sample Online Booking System |
| Document Type | Software Test Plan |
| Prepared By | Dhruba Aryal |
| Document Version | 1.0 |
| Test Status | Planning |
| Repository | api-database-testing-portfolio |

## 2. Purpose

The purpose of this test plan is to define the testing approach for a
sample online booking system.

The project demonstrates professional quality-assurance activities
including:

- Requirement analysis
- Test planning
- Manual test-case development
- Positive testing
- Negative testing
- Boundary-value testing
- REST API testing
- SQL database validation
- Defect reporting
- Requirements traceability
- Test execution reporting

## 3. System Overview

The sample booking system allows authorized users and customers to
perform booking-related operations.

Core functions include:

1. Authentication
2. Booking creation
3. Booking retrieval
4. Booking update
5. Booking deletion
6. Database storage and validation

A booking may contain:

- First name
- Last name
- Total price
- Deposit-paid status
- Check-in date
- Checkout date
- Optional additional needs

## 4. Test Objectives

The objectives of testing are to verify that:

1. Valid users can authenticate successfully.
2. Invalid authentication attempts are rejected.
3. Required booking fields are validated.
4. Valid bookings can be created.
5. Invalid bookings are rejected appropriately.
6. Existing bookings can be retrieved.
7. Nonexistent bookings return an appropriate response.
8. Authorized users can update bookings.
9. Unauthorized updates are rejected.
10. Authorized users can delete bookings.
11. Deleted bookings are no longer retrievable.
12. API responses contain accurate data.
13. Database records match API information.
14. Required database fields do not contain invalid null values.
15. Booking dates and prices satisfy defined business rules.
16. Sensitive information is not stored in public project files.

## 5. Testing Scope

### 5.1 In Scope

The following areas are included:

- Authentication testing
- Booking-creation testing
- Booking-retrieval testing
- Booking-update testing
- Booking-deletion testing
- Required-field validation
- Positive testing
- Negative testing
- Boundary-value testing
- REST API response validation
- HTTP status-code validation
- Response-body validation
- Response-time checks
- PostgreSQL database validation
- Record-count validation
- Null-value validation
- Duplicate detection
- Date validation
- Data reconciliation
- Requirements traceability
- Defect reporting
- Test execution reporting

### 5.2 Out of Scope

The following areas are excluded from the initial version:

- Production security penetration testing
- High-volume performance testing
- Load testing
- Stress testing
- Mobile application testing
- Payment-card processing
- Production customer information
- Production infrastructure
- Browser user-interface automation
- Full accessibility certification
- Disaster-recovery testing

These areas may be considered for future project improvements.

## 6. Requirements Source

Testing will be based on:

```text
requirements-traceability/booking-system-requirements.md
