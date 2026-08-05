# Postman REST API Testing

This folder contains the public-safe Postman assets used for complete
requirement validation and CI smoke testing of the Restful Booker
demonstration service.

## Files

- [Complete Public-Safe Collection](restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [Public-Safe CI Smoke Collection](restful-booker-ci-smoke.public-sanitized.postman_collection.json)
- [Sanitized Environment Template](restful-booker-template.public-sanitized.postman_environment.json)
- [Sanitized Day 5 Collection Runner Result](day5-postman-collection-run-results.public-sanitized.json)
- [Day 5 API Execution Report](../reports/day5-api-validation-execution.md)
- [Day 6 Automation Report](../reports/day6-newman-and-github-actions-execution.md)
- [Automation Documentation](../automation/README.md)
- [GitHub Actions Workflow](../.github/workflows/newman-api-tests.yml)
- [Screenshot Evidence Index](../screenshots/README.md)

## Complete Collection Coverage

The complete collection contains 26 requests:

| Area | Requests |
|---|---:|
| Health Check | 1 |
| Authentication | 5 |
| Booking Creation and Validation | 8 |
| Booking Retrieval and Search | 3 |
| Booking Update | 5 |
| Booking Deletion | 4 |
| **Total** | **26** |

It demonstrates:

- Authentication-token handling
- Dynamic booking-ID storage
- Positive and negative testing
- Boundary-value testing
- Status-code validation
- Response-body validation
- Authorization testing
- Response-time assertions
- Complete booking CRUD workflows

## CI Smoke Collection Coverage

The CI smoke collection contains eight requests:

| Order | Request Purpose |
|---:|---|
| 1 | Verify API health |
| 2 | Authenticate successfully |
| 3 | Create a valid booking |
| 4 | Retrieve the created booking |
| 5 | Perform an authorized full update |
| 6 | Perform an authorized partial update |
| 7 | Delete the booking |
| 8 | Confirm the deleted booking returns HTTP 404 |

The documented smoke baseline is:

| Metric | Result |
|---|---:|
| Requests | 8 |
| Assertions | 22 |
| Passed assertions | 22 |
| Failed assertions | 0 |
| Runtime errors | 0 |

## Automation Strategy

| Collection | Purpose | Expected Result | CI Role |
|---|---|---|---|
| Complete collection | Full positive, negative, boundary, authorization and defect validation | Known failures may remain | Reporting suite |
| CI smoke collection | Stable critical workflow validation | Zero failures | Strict quality gate |

The complete collection retains failed assertions associated with
confirmed requirement mismatches.

The CI smoke collection does not replace or renumber the complete test
baseline.

## How to Run the Complete Collection in Postman

1. Download or clone the repository.
2. Open Postman Desktop.
3. Import the complete public-safe collection.
4. Import the sanitized environment template.
5. Select the imported environment.
6. Enter valid demonstration credentials locally.
7. Do not commit the completed local environment.
8. Clear `token`, `authToken`, `bookingId` and `deletedBookingId`.
9. Run the complete collection with one iteration.
10. Review both passed and failed assertions.
11. Sanitize any evidence before making it public.

## How to Run the CI Smoke Collection in Postman

1. Import the CI smoke collection.
2. Select the same private local environment.
3. Confirm valid demonstration credentials are present.
4. Clear dynamic token and booking variables.
5. Run one iteration.
6. Confirm all eight requests execute.
7. Confirm all 22 assertions pass.
8. Confirm zero runtime errors.

## Run the Complete Collection with Newman

Install dependencies:

```bash
npm ci
```

Create a private local environment from the public template and enter
valid credentials.

Run:

```bash
mkdir -p newman-results

npx newman run \
"postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json" \
-e "postman/restful-booker-day6.local.postman_environment.json" \
-r cli,json,junit \
--reporter-json-export "newman-results/day6-full-run.json" \
--reporter-junit-export "newman-results/day6-full-run.xml" \
--suppress-exit-code
```

The complete suite may report the ten known assertion failures.

`--suppress-exit-code` is appropriate only for the local complete-suite
evidence run.

## Run the CI Smoke Collection with Newman

Run:

```bash
npx newman run \
"postman/restful-booker-ci-smoke.public-sanitized.postman_collection.json" \
-e "postman/restful-booker-day6.local.postman_environment.json" \
--delay-request 100 \
--timeout-request 15000 \
-r cli,json,junit \
--reporter-json-export "newman-results/day6-smoke-run.json" \
--reporter-junit-export "newman-results/day6-smoke-run.xml"
```

Confirm:

```bash
echo $?
```

Expected exit code:

```text
0
```

Do not use `--suppress-exit-code` for the smoke suite.

## Day 5 Baseline Execution Result

| Metric | Result |
|---|---:|
| Requests | 26 |
| Assertions | 61 |
| Passed assertions | 51 |
| Failed assertions | 10 |
| Runtime errors | 0 |
| Average response time | 36 ms |

The public demonstration API resets its booking data periodically.
Dynamic booking IDs and individual response times may differ.

## Why Failed Assertions Are Retained

The failed complete-suite assertions document that the API:

- Accepted checkout before check-in
- Accepted zero and negative total prices
- Returned HTTP 500 when required fields were omitted
- Accepted an invalid date sequence during authenticated update

They are not Postman or Newman runtime errors.

Changing assertions only to make the complete collection appear green
would hide valid test findings.

## Local and Public Environment Rules

### Private Local Environment

The private environment may contain:

- Demonstration username
- Demonstration password
- Generated token
- Generated booking ID
- Deleted booking ID

It must remain ignored by Git.

### Public Environment Template

These values must remain blank:

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

## GitHub Actions Credential Handling

The CI workflow injects:

```text
BOOKER_USERNAME
BOOKER_PASSWORD
```

from GitHub repository secrets.

The workflow does not require permanent token or booking-ID secrets.
Those values are generated during each execution.

## Expected Variability

Because Restful Booker is a public demonstration service:

- Booking IDs may change
- Response times may change
- Existing records may disappear after a reset
- A temporary network or service problem may affect a run
- The documented baseline remains the evidence for the recorded session

## Security Rules

Do not commit:

- Active passwords
- Active authentication tokens
- Token-bearing cookie values
- Unsanitized environments
- Private runner results
- Dynamic IDs copied from a specific private execution
- Postman account-linked export metadata
- Console statements that print active token values
- Raw artifacts that have not been reviewed

## Related Documentation

- [Main Project README](../README.md)
- [Automation Documentation](../automation/README.md)
- [Test Cases](../test-cases/README.md)
- [Confirmed Defects](../defect-reports/README.md)
- [Requirements Traceability](../requirements-traceability/README.md)
- [Day 5 API Execution Report](../reports/day5-api-validation-execution.md)
- [Day 6 Automation Report](../reports/day6-newman-and-github-actions-execution.md)
- [Screenshot Evidence Index](../screenshots/README.md)
