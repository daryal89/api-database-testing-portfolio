# Postman REST API Testing

This folder contains the public-safe Postman assets used for Day 5 REST
API testing of the Restful Booker demonstration service.

## Files

- [Public-Safe Postman Collection](restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [Sanitized Postman Environment Template](restful-booker-template.public-sanitized.postman_environment.json)
- [Sanitized Collection Runner Result](day5-postman-collection-run-results.public-sanitized.json)
- [Day 5 API Execution Report](../reports/day5-api-validation-execution.md)
- [Screenshot Evidence Index](../screenshots/README.md)

## Collection Coverage

The collection contains 26 requests:

| Area | Requests |
|---|---:|
| Health Check | 1 |
| Authentication | 5 |
| Booking Creation and Validation | 8 |
| Booking Retrieval and Search | 3 |
| Booking Update | 5 |
| Booking Deletion | 4 |
| **Total** | **26** |

The collection demonstrates:

- Authentication-token handling
- Dynamic booking-ID storage
- Positive and negative testing
- Boundary-value testing
- Status-code validation
- Response-body validation
- Authorization testing
- Response-time assertions
- Complete booking CRUD workflows

## How to Run the Collection

1. Download or clone the repository.
2. Open Postman Desktop.
3. Import the public-safe collection JSON.
4. Import the sanitized environment template.
5. Select the imported environment.
6. Enter valid demonstration credentials locally.
7. Do not commit the completed local environment.
8. Clear `token`, `authToken`, `bookingId` and `deletedBookingId`.
9. Run the complete collection with one iteration.
10. Review assertion results and exported evidence.

### Detailed Postman Steps

1. Select **Import** in Postman.
2. Import:
   `restful-booker-api-portfolio.public-sanitized.postman_collection.json`.
3. Import:
   `restful-booker-template.public-sanitized.postman_environment.json`.
4. Select **Restful Booker - Public Template** from the environment menu.
5. Enter the valid demonstration username and password in the
   environment's **Current value** column.
6. Keep the credential values local. Do not export or commit the
   completed working environment.
7. Confirm the following dynamic fields are blank before the run:

```text
token
authToken
bookingId
deletedBookingId
```

8. Open the collection and select **Run collection**.
9. Use one iteration.
10. Run requests in their saved order so that authentication, creation,
    update and deletion dependencies work correctly.
11. Review both passed and failed assertions.
12. Export a runner result only after sanitizing credentials, tokens,
    dynamic IDs and account-linked metadata.

## Baseline Execution Result

The documented Day 5 baseline produced:

| Metric | Result |
|---|---:|
| Requests | 26 |
| Assertions | 61 |
| Passed assertions | 51 |
| Failed assertions | 10 |
| Runtime errors | 0 |
| Average response time | 36 ms |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Confirmed defects | 3 |

The public demonstration API resets its booking data periodically, so
dynamic booking IDs and individual response times may differ.

## Why Failed Assertions Are Retained

The failed assertions are intentionally retained as evidence of observed
requirement mismatches.

They document that the API:

- Accepted checkout before check-in
- Accepted zero and negative total prices
- Returned HTTP 500 when required fields were omitted

The failures are not Postman runtime errors. The collection completed all
26 requests with zero runtime errors.

Changing the assertions only to make the collection appear fully green
would hide valid test findings and weaken the accuracy of the portfolio.

## Local and Public Environment Rules

### Local Working Environment

The local environment may contain:

- Demonstration username
- Demonstration password
- Generated token
- Generated booking ID
- Deleted booking ID

The completed local environment must remain private.

### Public Environment Template

The public template must keep these values blank:

```text
username
password
token
authToken
bookingId
deletedBookingId
```

Safe reusable values such as the base URL, generic test names, synthetic
dates and response-time limit may remain populated.

## Expected Variability

Because Restful Booker is a public demonstration service:

- Booking IDs may change
- Response times may change
- Existing records may disappear after a reset
- A later run may produce slightly different timing results
- The documented Day 5 baseline remains the portfolio evidence for the
  recorded execution session

## Security Rules

Do not commit:

- Active passwords
- Active authentication tokens
- Cookie values containing a resolved token
- Unsanitized environments
- Private runner results
- Dynamic booking IDs when they identify a specific execution
- Postman account-linked export metadata
- Console statements that print active token values

## Related Documentation

- [Main Project README](../README.md)
- [Test Cases](../test-cases/README.md)
- [Confirmed Defects](../defect-reports/README.md)
- [Requirements Traceability](../requirements-traceability/README.md)
- [Day 5 API Execution Report](../reports/day5-api-validation-execution.md)
- [Screenshot Evidence Index](../screenshots/README.md)
