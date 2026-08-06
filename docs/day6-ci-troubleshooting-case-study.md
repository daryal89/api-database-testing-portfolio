# Day 6 CI Troubleshooting Case Study

## Case Summary

The first Newman GitHub Actions workflow failed with exit code 1 even
though the workflow started correctly and generated a JUnit artifact.

The failure was investigated rather than hidden.

The root cause was the test-strategy design: the complete Day 5
validation collection contains intentionally retained failed assertions
for confirmed API defects and was being used as the required passing CI
step.

## Situation

The portfolio already contained:

- 25 manual/API test cases
- A 26-request Postman collection
- 61 assertions
- Seven failed test cases
- Ten failed assertions
- Three confirmed API defects

Day 6 introduced Newman and GitHub Actions.

The initial workflow directly executed the complete collection as a
strict test job.

## Observed Symptom

GitHub Actions showed:

```text
Process completed with exit code 1.
```

The workflow still generated a JUnit report, demonstrating that Newman
ran and produced structured output.

The failure log showed known assertion mismatches, including:

- Invalid booking dates accepted
- Zero and negative prices accepted
- Missing required fields returning HTTP 500
- Invalid date update accepted

## Investigation

The investigation confirmed:

1. The workflow file was recognized.
2. The repository was checked out.
3. Node.js and npm were available.
4. Newman started successfully.
5. The collection file loaded.
6. Requests and assertions executed.
7. The failing assertions matched the documented Day 5 findings.

Therefore, the problem was not tool installation or workflow startup.

## Root Cause

The complete requirement-validation collection was unsuitable as the
only required green quality gate.

A CI gate should determine whether a stable critical workflow is
operational.

The complete collection had a different purpose: expose requirement
mismatches and preserve defect evidence.

## Corrective Action

The project adopted a two-suite strategy.

### Complete Validation Suite

- Preserves all original assertions
- Includes positive, negative, boundary and authorization tests
- Continues to expose confirmed defects
- Generates JSON and JUnit reports
- Uses `continue-on-error: true` in GitHub Actions
- Does not determine the final workflow result

### CI Smoke Suite

- Contains eight stable critical requests
- Executes 45 assertions across 19 requests
- Must pass all assertions
- Uses Newman's normal exit-code behavior
- Determines the final workflow result

## Validation

The corrected design was validated at three levels:

1. Postman Desktop
2. Local Newman execution
3. GitHub Actions

The stable CI smoke/regression suite completed with:

```text
19 requests
19 test scripts
2 pre-request scripts
45 assertions
45 passed
0 failed
0 runtime errors
```

The complete suite continued to report:

```text
26 requests
61 assertions
51 passed
10 known failures
0 runtime errors
```

## Additional Local Troubleshooting

A separate local run produced only 58 assertions and 17 failures.

Investigation showed that valid authentication had returned
`Bad credentials`, leaving the token empty.

Authorized update and deletion requests then returned HTTP 403.
Three response-body assertions were conditional on HTTP 200 and did not
execute.

After correcting the private local credential setup, the full
61-assertion baseline executed again.

## Security Decisions

- Credentials remained in a private ignored environment locally.
- GitHub Actions used `BOOKER_USERNAME` and `BOOKER_PASSWORD` secrets.
- No token or password was added to workflow YAML.
- Generated local reports remained ignored.
- Public evidence did not expose secret values.

## Lessons Learned

- A green CI result must represent a meaningful quality gate.
- Known defects should not be hidden merely to make automation pass.
- Full regression reporting and smoke gating can serve different
  purposes.
- Exit codes must be interpreted in the context of suite design.
- Conditional assertions can change the executed assertion count when a
  prerequisite fails.
- Artifact generation is valuable for both successful and failed runs.
- Clear workflow summaries reduce reviewer confusion.

## Interview-Ready STAR Summary

### Situation

A GitHub Actions workflow running a complete Newman collection failed
with exit code 1.

### Task

Determine whether the failure was caused by the automation framework,
credential setup, API availability or actual test findings, and create a
meaningful passing CI design without weakening tests.

### Action

- Inspected the workflow log and JUnit artifact
- Confirmed Newman executed successfully
- Mapped failed assertions to existing defect reports
- Preserved the complete collection
- Created a stable 19-request CI smoke/regression collection from the
  health check and 18 passing Day 5 scenarios selected for CI
- Configured repository secrets
- Used the smoke suite as the strict gate
- Used the complete suite for known-failure reporting
- Uploaded separate JSON and JUnit artifact groups

### Result

The CI suite passed locally and in GitHub Actions with 45 of 45
assertions, while the complete suite continued to expose ten documented
requirement mismatches.

## Evidence

- [Initial Workflow Failure](../screenshots/day6-automation/day6-06-initial-github-actions-failure.png)
- [Failure Log](../screenshots/day6-automation/day6-07-github-actions-failure-log.png)
- [Passing Local Smoke Run](../screenshots/day6-automation/day6-08-local-newman-smoke-pass.png)
- [Green Workflow](../screenshots/day6-automation/day6-11-github-actions-green-summary.png)
- [Passing Smoke Log](../screenshots/day6-automation/day6-12-github-actions-newman-pass.png)
- [Workflow Strategy Summary](../screenshots/day6-automation/day6-14-workflow-test-strategy-summary.png)
- [Workflow Artifacts](../screenshots/day6-automation/day6-15-github-actions-artifacts.png)

## Related Documentation

- [Automation Documentation](../automation/README.md)
- [Day 6 Execution Report](../reports/day6-newman-and-github-actions-execution.md)
- [Executive Summary](../reports/api-database-automation-executive-summary.md)
