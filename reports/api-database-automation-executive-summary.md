# API, Database and Automation Executive Summary

## Project Scope

This portfolio demonstrates a complete quality-assurance lifecycle for a
sample online booking system:

- Requirements and test planning
- Manual and REST API test design
- PostgreSQL database validation
- Postman API execution
- Requirements traceability
- Defect reporting
- Newman command-line automation
- GitHub Actions continuous integration
- Secure test credential handling
- Automated test-report artifacts

The public Restful Booker API and the local PostgreSQL portfolio database
are separate systems. Direct API-to-database reconciliation was not
performed.

## PostgreSQL Database Results

| Metric | Result |
|---|---:|
| SQL validation and analysis queries | 19 |
| Automated validation-summary checks | 13 |
| Automated checks passed | 13 |
| Database-constraint negative tests | 6 |
| Constraint tests passed | 6 |
| Production-style integrity failures | 0 |

Database testing covered record counts, required values, duplicates,
orphan relationships, date integrity, price integrity, payment
reconciliation, staging anomalies and database constraints.

## Postman API Results

| Metric | Result |
|---|---:|
| Manual/API test cases executed | 25 |
| Test cases passed | 18 |
| Test cases failed | 7 |
| Requests executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Runtime errors | 0 |
| Confirmed defects | 3 |

The failed assertions represent requirement mismatches, not Postman
runtime errors.

## Confirmed API Defects

| Defect | Finding | Severity |
|---|---|---|
| DEF-API-001 | Checkout before check-in accepted during creation and update | High |
| DEF-API-002 | Zero and negative total prices accepted | High |
| DEF-API-003 | Missing required fields return HTTP 500 instead of a client-validation response | Medium |

## Newman and GitHub Actions Results

Two automation suites were used:

| Suite | Purpose | Result |
|---|---|---|
| CI smoke suite | Stable critical booking workflow | 8 requests, 22 of 22 assertions passed |
| Complete validation suite | Full requirement and defect evidence | 26 requests, 61 assertions, 10 known failures retained |

The smoke suite is the strict quality gate.

The complete suite continues to report known findings but does not
override a successful smoke result.

## CI Design

The GitHub Actions workflow:

- Installs dependencies with `npm ci`
- Uses Node.js and Newman
- Validates required repository secrets
- Runs the smoke suite as a strict gate
- Runs the complete suite for broader reporting
- Produces JSON and JUnit files
- Uploads separate artifact groups
- Writes a human-readable workflow summary

## Security and Data Handling

- Only synthetic test data is used.
- Public Postman credentials are blank.
- Local credentials remain in an ignored environment file.
- CI credentials use GitHub repository secrets.
- Active tokens are not committed.
- Generated local results are ignored.
- Workflow permissions are limited to read-only repository content.
- Public screenshots and exports are sanitized.

## Root-Cause and Improvement Outcome

The initial CI workflow failed because the complete validation suite,
which intentionally contains failed defect assertions, was used as the
required passing step.

The correction preserved the complete suite and introduced a separate
passing smoke suite.

This approach:

- Retains accurate defect evidence
- Avoids artificial assertion changes
- Provides a meaningful CI gate
- Preserves detailed regression output
- Demonstrates practical troubleshooting and test-strategy judgment

## Environment Limitations

- Restful Booker is a public demonstration API.
- Its data may reset without notice.
- Booking IDs and response times may vary.
- A passing smoke suite proves only the selected critical workflow.
- The local PostgreSQL database is not connected to the public API.
- Direct persistence validation was not possible.

## Skills Demonstrated

- Test planning and traceability
- Manual, API and database testing
- SQL data validation
- Postman collection design
- Defect reporting
- Node.js and npm
- Newman
- GitHub Actions
- CI quality-gate design
- Secret management
- JSON and JUnit reporting
- Git branching and pull requests
- Root-cause analysis
- Technical documentation

## Final Outcome

The portfolio now demonstrates three testing layers:

1. **Database quality** through PostgreSQL validation
2. **Functional and negative API testing** through Postman
3. **Repeatable CI automation** through Newman and GitHub Actions

The result is a public-safe, reproducible QA portfolio that demonstrates
both testing depth and practical automation capability.
