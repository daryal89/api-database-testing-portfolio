# API Test Automation

## Overview

This folder documents the Day 6 automation layer for the Restful Booker
API testing portfolio.

The automation uses:

- Node.js and npm
- Newman
- A complete validation collection
- A separate stable CI smoke/regression collection
- GitHub Actions
- GitHub repository secrets
- JSON and JUnit reports
- Downloadable workflow artifacts

The automation does not alter the Day 5 test expectations or confirmed
defects.

## Automation Strategy

The repository deliberately separates two testing purposes:

| Suite | Purpose | Expected Result | Workflow Behavior |
|---|---|---|---|
| Complete validation suite | Execute the full positive, negative, boundary, authorization and defect baseline | Known failed assertions may remain | Runs for reporting; failure is tolerated |
| CI smoke/regression suite | Validate the health check and 18 passing Day 5 scenarios selected for CI | 19 requests, 45 assertions, zero failures | Strict quality gate |

The smoke suite determines the final GitHub Actions result.

The complete suite preserves accurate test findings. Its assertions are
not weakened merely to produce a green workflow.

## Public-Safe Automation Files

- [Complete Validation Collection](../postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json)
- [CI Smoke Collection](../postman/restful-booker-ci-smoke.public-sanitized.postman_collection.json)
- [CI Coverage Mapping](../docs/day6-ci-coverage-mapping.md)
- [Sanitized Environment Template](../postman/restful-booker-template.public-sanitized.postman_environment.json)
- [GitHub Actions Workflow](../.github/workflows/newman-api-tests.yml)
- [Day 6 Execution Report](../reports/day6-newman-and-github-actions-execution.md)
- [Automation Evidence](../screenshots/README.md#day-6-automation-evidence)

## Tools and Versions

| Tool | Documented Day 6 Version |
|---|---:|
| Node.js | 24.18.1 |
| npm | 11.16.0 |
| Git for Windows | 2.55.0.windows.3 |
| Newman | 6.2.2 |
| Postman collection schema | v2.1 |
| GitHub Actions runner | `ubuntu-latest` |

Versions can change in later executions. The committed `package-lock.json`
preserves the resolved npm dependency tree used by the project.

## Prerequisites

To run the automation locally:

1. Clone or download the repository.
2. Install Node.js and npm.
3. Open a terminal in the repository root.
4. Install dependencies with `npm ci`.
5. Create a private local Postman environment.
6. Enter valid demonstration credentials only in the private file.
7. Keep the private environment and generated reports out of Git.

## Install Dependencies

From the repository root:

```bash
npm ci
```

Verify Newman:

```bash
npx newman --version
```

## Local Environment Setup

Create a private copy of the public template:

```bash
cp \
postman/restful-booker-template.public-sanitized.postman_environment.json \
postman/restful-booker-day6.local.postman_environment.json
```

Enter valid demonstration credentials locally.

Before a clean run, clear:

```text
token
authToken
bookingId
deletedBookingId
```

The private environment must remain ignored by Git.

Verify:

```bash
git check-ignore -v \
postman/restful-booker-day6.local.postman_environment.json
```

## Run the Complete Validation Collection Locally

Create the local results folder:

```bash
mkdir -p newman-results
```

Run:

```bash
npx newman run \
"postman/restful-booker-api-portfolio.public-sanitized.postman_collection.json" \
-e "postman/restful-booker-day6.local.postman_environment.json" \
-r cli,json,junit \
--reporter-json-export "newman-results/day6-full-run.json" \
--reporter-junit-export "newman-results/day6-full-run.xml" \
--suppress-exit-code
```

`--suppress-exit-code` is used only for this local evidence run. It lets
the command finish without hiding the known assertion failures.

Expected documented baseline:

| Metric | Result |
|---|---:|
| Requests | 26 |
| Assertions | 61 |
| Passed assertions | 51 |
| Known failed assertions | 10 |
| Runtime errors | 0 |

## Run the CI Smoke Collection Locally

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

Do not use `--suppress-exit-code` for the smoke suite.

Confirm the process exit code:

```bash
echo $?
```

Expected documented baseline:

| Metric | Result |
|---|---:|
| Requests | 19 |
| Test scripts | 19 |
| Pre-request scripts | 2 |
| Assertions | 45 |
| Passed assertions | 45 |
| Failed assertions | 0 |
| Runtime errors | 0 |
| Exit code | 0 |

## CI Smoke Workflow

The workflow step is named **CI smoke collection**, but the collection
also provides stable regression coverage.

It contains 19 requests:

- One API health check
- The 18 Day 5 test scenarios that passed
- Authentication behavior
- Valid booking creation
- Booking retrieval and search
- Authorized and unauthorized updates
- Nonexistent-resource update handling
- Authorized and unauthorized deletion
- Verification after deletion
- Nonexistent-resource deletion handling

The CI collection excludes the seven Day 5 failed scenarios:

```text
TC-BOOK-002
TC-BOOK-003
TC-BOOK-004
TC-BOOK-005
TC-BOOK-006
TC-VAL-002
TC-UPD-005
```

Those seven requests remain in the complete validation collection and
continue to provide confirmed-defect evidence.

### Recorded Main-Branch CI Result

| Metric | Result |
|---|---:|
| Requests executed | 19 |
| Test scripts executed | 19 |
| Pre-request scripts executed | 2 |
| Assertions executed | 45 |
| Assertions passed | 45 |
| Assertions failed | 0 |
| Runtime errors | 0 |
| Total duration | 2.4 seconds |
| Average response time | 12 ms |

Duration and response-time values describe the recorded run and may vary
in later executions.

In Newman's summary, `test-scripts` refers to post-response scripts. It
does not create a separate 19-test-case baseline; the project's manual/API
baseline remains 25 test cases.

## GitHub Actions Workflow

The workflow is stored at:

```text
.github/workflows/newman-api-tests.yml
```

The final trigger design supports:

- Manual execution with `workflow_dispatch`
- Relevant pushes to `main`
- Relevant pull requests targeting `main`
- Path filtering for automation-related files

The workflow:

1. Checks out the repository.
2. Sets up Node.js.
3. Installs dependencies with `npm ci`.
4. Verifies required repository secrets.
5. Runs the smoke suite as the strict quality gate.
6. Runs the complete suite with `continue-on-error`.
7. Writes a workflow summary.
8. Uploads smoke JSON and JUnit reports.
9. Uploads full-validation JSON and JUnit reports.

## Repository Secrets

The workflow requires:

```text
BOOKER_USERNAME
BOOKER_PASSWORD
```

The secret values are configured under:

```text
Repository Settings
→ Secrets and variables
→ Actions
→ Repository secrets
```

Do not store resolved credentials in:

- Workflow YAML
- Postman public environment files
- Collection JSON
- Markdown documentation
- Screenshots
- Newman reports committed to Git

Token and booking variables are generated during execution and do not
need repository secrets.

## Exit-Code Strategy

### Smoke Suite

The smoke suite uses Newman's normal exit behavior.

Any failed smoke assertion produces a nonzero exit code and fails the
workflow.

### Complete Suite

The complete suite also returns a nonzero exit code when known
assertions fail.

GitHub Actions uses:

```yaml
continue-on-error: true
```

for the complete-suite step. This preserves the original failure outcome
for reporting while allowing the remaining summary and artifact steps to
run.

Do not combine `continue-on-error` with `--suppress-exit-code` in the
workflow. Doing so would incorrectly make the complete suite appear to
have passed.

## Generated Reports and Artifacts

The workflow generates:

```text
Smoke:
- smoke-results.json
- smoke-results.xml

Complete validation:
- full-validation-results.json
- full-validation-results.xml
```

Two artifact groups are uploaded:

```text
smoke-newman-results
full-validation-newman-results
```

The configured retention period is 14 days.

Generated local files should remain under:

```text
newman-results/
```

and remain ignored by Git.

## Known-Failure Strategy

The documented requirement mismatches are:

- Checkout before check-in is accepted
- Zero total price is accepted
- Negative total price is accepted
- Missing required fields return HTTP 500
- Invalid booking-date updates are accepted

These findings remain visible in the complete validation suite.

The CI suite does not redefine the affected requirements. It uses the
health check and 18 passing Day 5 scenarios selected for CI to provide a broad,
stable quality gate while the complete suite remains authoritative for
known-failure coverage.

## Security Controls

- Public environment credentials are blank.
- Local credentials remain in an ignored environment file.
- GitHub Actions credentials use repository secrets.
- Active tokens are not committed.
- Dynamic booking identifiers are not treated as permanent data.
- Generated execution output is ignored locally.
- Public screenshots must not expose tokens or credentials.
- Workflow permissions are limited to repository-content read access.

## Troubleshooting

### Valid Authentication Returns “Bad credentials”

1. Confirm the private environment contains valid values.
2. Confirm the keys are exactly `username` and `password`.
3. Confirm each key appears once.
4. Confirm the local file was saved.
5. Run only the authentication folder before rerunning the full suite.

### Full Suite Shows 58 Instead of 61 Assertions

This usually means authentication failed and authorized update
responses returned HTTP 403.

Some update-body assertions run only after HTTP 200. Correct the
credentials, verify a token is generated and rerun.

### Smoke Suite Fails

1. Run the smoke collection in Postman Desktop.
2. Run it locally through Newman.
3. Identify the first failing request.
4. Verify token and booking-ID variable flow.
5. Check whether the public demonstration API reset or is temporarily
   unavailable.
6. Do not weaken a valid assertion solely to make CI green.

### Collection or Environment Is Not Found

Verify exact case-sensitive paths and filenames.

### `npm ci` Fails

Confirm both `package.json` and `package-lock.json` are committed and
consistent.

## Limitations

- Restful Booker is a public demonstration service.
- API data may reset.
- Response times and booking identifiers may vary.
- The CI suite covers 19 stable requests but excludes the seven known-
  failure requests by design.
- The complete suite remains the authoritative requirement-validation
  baseline.
- The local PostgreSQL database is separate from the public API.

## Related Documentation

- [Main Project README](../README.md)
- [Postman Documentation](../postman/README.md)
- [Day 6 Execution Report](../reports/day6-newman-and-github-actions-execution.md)
- [Executive Summary](../reports/api-database-automation-executive-summary.md)
- [CI Troubleshooting Case Study](../docs/day6-ci-troubleshooting-case-study.md)
- [CI Coverage Mapping](../docs/day6-ci-coverage-mapping.md)
- [Screenshot Evidence](../screenshots/README.md#day-6-automation-evidence)
