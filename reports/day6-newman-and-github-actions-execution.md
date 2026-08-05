# Day 6 Newman and GitHub Actions Execution Report

## Document Information

| Field | Value |
|---|---|
| Project | API, Database and CI Test Automation Portfolio |
| API | Restful Booker public demonstration API |
| Milestone | Day 6 |
| Prepared By | Dhruba Aryal |
| Execution Period | August 4–5, 2026 |
| Execution Status | Completed; pull request pending merge |
| Automation Tools | Node.js, npm, Newman and GitHub Actions |

## Execution Summary

Day 6 added repeatable command-line and continuous-integration execution
to the completed Day 5 API test baseline.

The implementation uses two separate suites:

- A strict, passing CI smoke suite
- A complete validation suite that preserves known requirement
  mismatches

The smoke suite passed locally and in GitHub Actions.

The complete suite executed 26 requests and 61 assertions. Its ten known
failed assertions remained visible and were published as reports without
causing the successful smoke quality gate to appear failed.

## Objectives

- Verify Node.js, npm, Git and Newman
- Install Newman as a project dependency
- Execute the complete Postman collection from Git Bash
- Preserve the Day 5 assertions and confirmed defect evidence
- Create a stable CI smoke collection
- Run the smoke collection in Postman and Newman
- Protect credentials with GitHub repository secrets
- Create a GitHub Actions workflow
- Generate JSON and JUnit reports
- Preserve reports as workflow artifacts
- Investigate and document the initial workflow failure
- Prepare the automation for pull-request validation and merge

## Environment

| Item | Value |
|---|---|
| Local operating system | Windows |
| Local shell | Git Bash |
| CI runner | `ubuntu-latest` |
| API environment | Public nonproduction demonstration service |
| Collection format | Postman Collection v2.1 |
| Credential source — local | Ignored private Postman environment |
| Credential source — CI | GitHub repository secrets |

## Tools and Versions

| Tool | Version |
|---|---:|
| Node.js | 24.18.1 |
| npm | 11.16.0 |
| Git for Windows | 2.55.0.windows.3 |
| Newman | 6.2.2 |

## Files Added or Updated

```text
.github/workflows/newman-api-tests.yml
automation/README.md
package.json
package-lock.json
postman/restful-booker-ci-smoke.public-sanitized.postman_collection.json
postman/README.md
reports/day6-newman-and-github-actions-execution.md
reports/api-database-automation-executive-summary.md
reports/README.md
screenshots/day6-automation/
screenshots/README.md
docs/day6-ci-troubleshooting-case-study.md
docs/project-development-journal.md
README.md
CHANGELOG.md
```

## Collection Strategy

| Suite | Purpose | Expected Result | CI Behavior |
|---|---|---|---|
| CI smoke suite | Validate the stable critical booking workflow | Zero failures | Strict quality gate |
| Complete validation suite | Preserve full requirement, negative and defect coverage | Known failures may remain | Failure tolerated; results published |

The smoke collection does not replace the complete collection.

No Day 5 test case, defect expectation or assertion was changed to make
the workflow pass.

## CI Smoke Collection

The smoke suite contains eight critical requests:

1. Health check
2. Valid authentication
3. Valid booking creation
4. Retrieve created booking
5. Authorized full update
6. Authorized partial update
7. Authorized deletion
8. Retrieve deleted booking

### Smoke Results

| Metric | Result |
|---|---:|
| Requests executed | 8 |
| Assertions executed | 22 |
| Assertions passed | 22 |
| Assertions failed | 0 |
| Runtime errors | 0 |
| Local Newman exit code | 0 |
| GitHub Actions result | Pass |

## Complete Validation Execution

The complete Day 5 collection was rerun through Newman.

### Full-Suite Results

| Metric | Result |
|---|---:|
| Requests executed | 26 |
| Test scripts executed | 26 |
| Assertions executed | 61 |
| Assertions passed | 51 |
| Assertions failed | 10 |
| Runtime errors | 0 |

The failed assertions correspond to the documented requirement
mismatches. They are not Newman installation or workflow-runtime errors.

## Initial GitHub Actions Failure

The first GitHub Actions workflow:

- Checked out the repository
- Started the Newman run
- Executed the complete validation collection
- Generated a JUnit artifact
- Ended with exit code 1

The initial failure was retained as troubleshooting evidence.

## Root-Cause Analysis

The first workflow used the complete validation suite as the required
passing CI step.

Newman correctly returned a nonzero exit code because the suite contains
ten intentionally retained failed assertions associated with confirmed
Day 5 defects.

The failure was not caused by:

- Node.js installation
- npm installation
- Newman installation
- Workflow startup
- Missing collection files
- An unexpected Newman runtime error

## Corrective Action

The solution was not to remove or weaken the failed assertions.

Instead:

1. The complete validation suite was preserved.
2. A separate eight-request smoke suite was created.
3. The smoke suite was verified in Postman.
4. The smoke suite was verified locally through Newman.
5. The smoke suite became the strict GitHub Actions quality gate.
6. The complete suite continued to run with
   `continue-on-error: true`.
7. Both suites generated JSON and JUnit reports.
8. Both report groups were uploaded as artifacts.

## Final GitHub Actions Design

The workflow:

1. Checks out the repository.
2. Sets up Node.js.
3. Displays Node.js and npm versions.
4. Installs dependencies with `npm ci`.
5. Displays the Newman version.
6. Validates repository-secret configuration.
7. Runs the CI smoke suite.
8. Runs the complete validation suite.
9. Writes a workflow summary.
10. Uploads smoke reports.
11. Uploads full-validation reports.

## Workflow Result Logic

| Condition | Workflow Result |
|---|---|
| Smoke passes; complete suite reports known failures | Success |
| Smoke passes; complete suite passes | Success; investigate changed API behavior |
| Smoke fails | Failure |
| Required repository secret is missing | Failure before test execution |
| Report upload runs after a test failure | Artifact remains available when generated |

## Repository Secrets

The workflow uses:

```text
BOOKER_USERNAME
BOOKER_PASSWORD
```

The resolved secret values are not stored in the public collection,
environment template, workflow file or documentation.

Token and booking-ID values are generated during execution.

## Generated Reports and Artifacts

### Smoke Artifact

```text
smoke-newman-results/
├── smoke-results.json
└── smoke-results.xml
```

### Complete-Validation Artifact

```text
full-validation-newman-results/
├── full-validation-results.json
└── full-validation-results.xml
```

Artifact retention is configured for 14 days.

Generated local reports remain under `newman-results/` and are ignored
by Git.

## Security Controls

- The public environment template contains blank credentials.
- Local credentials remain in an ignored environment file.
- GitHub Actions uses repository secrets.
- Workflow permissions are limited to `contents: read`.
- Active tokens are not committed.
- Generated report directories are ignored locally.
- Public screenshots are reviewed for credentials and tokens.
- Public collections are sanitized before commit.
- Raw workflow artifacts are not committed automatically.

## Issues Encountered and Resolutions

| Issue | Resolution |
|---|---|
| Initial GitHub Actions run failed | Separated strict smoke testing from known-failure validation |
| Complete collection returned nonzero exit code | Preserved outcome and used `continue-on-error` only for the complete suite |
| Local run showed 58 assertions and 17 failures | Corrected local credential setup so authorized conditional assertions executed |
| Generated Newman reports appeared as untracked files | Added `newman-results/` to `.gitignore` |
| Need to preserve test evidence without blocking CI | Uploaded separate JSON and JUnit artifact groups |

## Validation of the 61-Assertion Baseline

The complete collection contains response-dependent assertions.

When valid authentication succeeds, protected update and deletion
requests reach their expected endpoints and all 61 assertions execute.

A prior 58-assertion run was not accepted as the baseline because
authentication failed, resulting in HTTP 403 responses and preventing
three conditional update-body assertions from running.

The corrected full run retained:

```text
26 requests
61 assertions
51 passed assertions
10 failed assertions
0 runtime errors
```

## Final Results

| Deliverable | Status |
|---|---|
| Newman project dependency | Completed |
| Complete collection local execution | Completed |
| CI smoke collection | Completed |
| Local smoke execution | Passed |
| GitHub repository secrets | Configured |
| GitHub Actions workflow | Passed |
| Complete-suite findings in CI | Preserved |
| JSON reports | Generated |
| JUnit reports | Generated |
| Artifact uploads | Completed |
| Day 6 documentation | Completed |
| Pull-request merge | Pending |

## Limitations

- Restful Booker is a public demonstration service.
- Booking records may reset.
- Response times and booking IDs may differ.
- The smoke suite covers the critical workflow, not the complete
  negative baseline.
- The local PostgreSQL database is separate from the public API.
- Artifact retention is limited to the configured period.
- A green smoke workflow does not mean all 25 manual/API test cases pass.

## Evidence

- [Node, npm and Git Versions](../screenshots/day6-automation/day6-01-node-npm-git-versions.png)
- [Newman Installation](../screenshots/day6-automation/day6-02-newman-installation.png)
- [Full Newman Run](../screenshots/day6-automation/day6-03-full-newman-run-known-findings.png)
- [Smoke Collection Structure](../screenshots/day6-automation/day6-04-postman-smoke-collection-structure.png)
- [Passing Postman Smoke Run](../screenshots/day6-automation/day6-05-postman-smoke-run-passed.png)
- [Initial GitHub Actions Failure](../screenshots/day6-automation/day6-06-initial-github-actions-failure.png)
- [Initial Failure Log](../screenshots/day6-automation/day6-07-github-actions-failure-log.png)
- [Passing Local Newman Smoke Run](../screenshots/day6-automation/day6-08-local-newman-smoke-pass.png)
- [Repository Secret Names](../screenshots/day6-automation/day6-09-github-actions-secret-names.png)
- [Green GitHub Actions Summary](../screenshots/day6-automation/day6-11-github-actions-green-summary.png)
- [Passing CI Smoke Log](../screenshots/day6-automation/day6-12-github-actions-newman-pass.png)
- [Full Validation Findings](../screenshots/day6-automation/day6-13-full-validation-known-findings.png)
- [Workflow Strategy Summary](../screenshots/day6-automation/day6-14-workflow-test-strategy-summary.png)
- [Workflow Artifacts](../screenshots/day6-automation/day6-15-github-actions-artifacts.png)
- [Pull-Request Checks](../screenshots/day6-automation/day6-16-pull-request-checks-passed.png)

## Career-Reentry Skills Demonstrated

- API test automation
- Command-line test execution
- Node.js and npm dependency management
- Newman
- GitHub Actions
- CI quality-gate design
- Secure secret management
- JSON and JUnit reporting
- Workflow artifact handling
- Root-cause analysis
- Technical documentation
- Git feature-branch and pull-request workflow

## Next Steps

1. Merge the pull request after all required checks pass.
2. Verify the workflow on `main`.
3. Verify all public documentation links.
4. Publish the `v1.1.0` release.
5. Add the project to the résumé and interview portfolio.
