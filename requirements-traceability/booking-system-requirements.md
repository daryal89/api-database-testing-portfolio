# Booking System Requirements Baseline

## Document Purpose

This document defines the assumed functional and data requirements for
the sample online booking system used in this portfolio project.

These requirements provide the baseline for test planning, manual test
cases, API testing, database validation and requirements traceability.

## Important Note

This is a portfolio testing project. The following requirements are
project assumptions created for testing and demonstration purposes.

## Authentication Requirements

### AUTH-001: Valid Authentication

The system shall authenticate an authorized user when a valid username
and password are provided.

### AUTH-002: Invalid Authentication

The system shall reject authentication when an invalid username or
password is provided.

### AUTH-003: Required Username

The username field shall be required for authentication.

### AUTH-004: Required Password

The password field shall be required for authentication.

### AUTH-005: Authentication Token

After successful authentication, the system shall return an
authentication token that can be used for authorized update and delete
operations.

## Booking-Creation Requirements

### BOOK-001: Required Customer Name

A booking shall contain a non-empty first name and last name.

### BOOK-002: Required Booking Dates

A booking shall contain a valid check-in date and checkout date.

### BOOK-003: Valid Date Sequence

The checkout date shall occur after the check-in date.

### BOOK-004: Valid Total Price

The total booking price shall be greater than zero.

### BOOK-005: Deposit Indicator

The booking shall include a deposit-paid value of either true or false.

### BOOK-006: Optional Additional Needs

The booking may contain an optional additional-needs value.

### BOOK-007: Unique Booking Identifier

After successful booking creation, the system shall return a unique
booking identifier.

### BOOK-008: Accurate Booking Response

The booking-creation response shall contain the same customer name,
price, deposit status and dates submitted in the request.

## Booking-Retrieval Requirements

### RET-001: Retrieve Existing Booking

The system shall return the complete booking information when a valid
existing booking identifier is provided.

### RET-002: Nonexistent Booking

The system shall return an appropriate not-found response when a booking
identifier does not exist.

### RET-003: Booking Search

The system should allow bookings to be identified using supported
search criteria, such as customer name or booking dates.

## Booking-Update Requirements

### UPD-001: Authorized Update

Only an authenticated user shall be permitted to update an existing
booking.

### UPD-002: Accurate Update

After a successful update, the system shall return and store the new
booking information.

### UPD-003: Unauthorized Update

The system shall reject an update request that does not contain valid
authentication.

### UPD-004: Update Existing Booking Only

The system shall not update a booking identifier that does not exist.

## Booking-Deletion Requirements

### DEL-001: Authorized Deletion

Only an authenticated user shall be permitted to delete an existing
booking.

### DEL-002: Deleted Booking Availability

After a successful deletion, the deleted booking shall no longer be
available for retrieval.

### DEL-003: Unauthorized Deletion

The system shall reject a deletion request that does not contain valid
authentication.

### DEL-004: Delete Existing Booking Only

The system shall return an appropriate response when a user attempts to
delete a nonexistent booking.

## Database and Data-Quality Requirements

### DATA-001: Data Persistence

A successfully created booking shall be stored in the database.

### DATA-002: API and Database Consistency

Booking information returned by the API shall match the corresponding
database record.

### DATA-003: Unique Primary Identifier

Every booking record shall contain a unique booking identifier.

### DATA-004: Customer Relationship

Every booking shall be connected to a valid customer record.

### DATA-005: Required Data

Required database fields shall not contain null values.

### DATA-006: Date Integrity

The stored checkout date shall occur after the stored check-in date.

### DATA-007: Price Integrity

The stored total price shall be greater than zero.

### DATA-008: Deletion Integrity

After successful booking deletion, the database shall not return the
booking as an active record.

## Nonfunctional Expectations

### NFR-001: Response Time

Normal booking API responses should be returned within two seconds in
the portfolio test environment.

### NFR-002: Error Information

Invalid requests should return a clear response status and sufficient
information to understand the failure.

### NFR-003: Sensitive Information

Passwords, access tokens and sensitive authentication information shall
not be exposed in logs, screenshots or public repository files.

## Requirement Status

All requirements in this document are currently marked as:

**Status: Approved for Portfolio Testing**
