# Test Cases

This folder contains detailed functional, positive, negative and
boundary-value test cases for the sample booking system.

## Current Files

### booking-system-test-cases.xlsx

The Excel workbook contains:

- Test_Cases worksheet
- Requirements worksheet
- Test_Data worksheet
- Status and priority dropdowns
- 25 detailed manual test cases

### booking-system-test-cases.csv

The CSV file provides a GitHub-previewable copy of the Test_Cases
worksheet.

## Current Test Coverage

The 25 test cases cover:

### Authentication

- Valid authentication
- Invalid password
- Missing username
- Missing password
- Blank credentials

### Booking Creation and Validation

- Valid booking creation
- Missing first name
- Missing last name
- Missing booking dates
- Checkout date before check-in date
- Total price of zero
- Minimum positive total price
- Negative total price

### Booking Retrieval

- Retrieve an existing booking
- Retrieve a nonexistent booking
- Search using supported customer-name criteria

### Booking Update

- Authorized full update
- Unauthorized update
- Update a nonexistent booking
- Authorized partial update
- Invalid date sequence during update

### Booking Deletion

- Authorized deletion
- Retrieve a deleted booking
- Unauthorized deletion
- Delete a nonexistent booking

## Test Execution Status

| Metric | Current Value |
|---|---:|
| Test cases created | 25 |
| Test cases executed | 0 |
| Passed | 0 |
| Failed | 0 |
| Blocked | 0 |
| Not Run | 25 |

Actual results and Pass or Fail status will be entered only after the
test cases are executed against the demonstration API.
