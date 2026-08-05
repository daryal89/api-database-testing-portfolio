# API Test Automation

## Overview

## Automation Strategy

The complete validation collection retains assertions associated with
confirmed requirement mismatches. It is used for regression and defect
evidence and is not the required passing CI quality gate.

The separate CI smoke collection validates the stable core booking
workflow and must complete with zero assertion failures and zero runtime
errors.


## Tools and Versions

## Prerequisites

## Public-Safe Automation Files

- [CI Smoke Collection](../postman/restful-booker-ci-smoke.public-sanitized.postman_collection.json)
- [Sanitized Environment Template](../postman/restful-booker-template.public-sanitized.postman_environment.json)
- [GitHub Actions Workflow](../.github/workflows/newman-api-tests.yml)
- [Day 6 Execution Report](../reports/day6-newman-and-github-actions-execution.md)
- [Automation Evidence](../screenshots/README.md#day-6-automation-evidence)

## Full Validation Collection

## CI Smoke Collection

## Running the Full Collection Locally

## Running the Smoke Collection Locally

## GitHub Actions Workflow

## Repository Secrets

## JSON and JUnit Reports

## Workflow Artifacts

## Known-Failure Strategy

## Security Controls

## Troubleshooting

## Related Documentation