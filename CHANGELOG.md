# Changelog

All notable portfolio milestones are documented in this file.

## 1.1.1 — Portfolio Hardening and Metadata Alignment — 2026-08-14

### Changed

- Aligned npm project metadata with the `v1.1.1` patch release.
- Updated the Day 6 execution report to reflect the published `v1.1.0` release.
- Removed obsolete release-pending language from final project documentation.
- Preserved the verified complete-validation baseline of 26 requests, 61 runtime assertions and 10 known assertion failures.
- Preserved the verified CI smoke/regression baseline of 19 requests, 45 passing runtime assertions and zero failures.
- Preserved the verified database baseline of 19 SQL validation queries, 13 automated validation-summary checks and 6 database-constraint negative tests.

### Scope

This patch release contains portfolio-hardening and metadata-alignment changes only. It does not modify Postman test logic, SQL validation logic, confirmed defect results, requirements-traceability outcomes or CI quality-gate behavior.

## 1.1.0 — Day 6 Newman and GitHub Actions Automation — 2026-08-06

### Added

- Newman command-line execution as a project dependency
- Stable 19-request CI smoke/regression collection
- 45 passing CI assertions
- GitHub Actions API-test automation
- Repository-secret credential handling
- Smoke-suite JSON and JUnit reporting
- Complete-validation JSON and JUnit reporting
- Separate smoke and complete-validation workflow artifact groups
- Day 6 Newman and GitHub Actions execution report
- API, database and automation executive summary
- CI troubleshooting case study
- CI coverage-mapping document
- Day 6 screenshot evidence index
- Final pull-request validation evidence
- Final successful `main` workflow evidence
- Final informational-notice workflow evidence

### Changed

- Expanded the root README with verified CI/CD results, automation strategy and skills
- Expanded Postman documentation with reproducible Newman commands
- Expanded automation documentation with local and GitHub Actions execution instructions
- Expanded the reports index with Day 6 deliverables
- Expanded the project journal through Day 6
- Expanded the screenshot index with automation and workflow evidence
- Finalized workflow triggers for `main`, pull requests and manual execution
- Used the 19-request CI smoke/regression suite as the strict passing quality gate
- Preserved the complete validation suite for known-defect reporting
- Replaced duplicate full-validation warning annotations with one informational notice
- Merged the Day 6 automation pull request into `main`
- Verified the final `main` workflow with 19 requests and 45 passing assertions
- Aligned all Day 6 documentation with the verified CI execution results

### Verified Automation Results

| Metric | Result |
|---|---:|
| CI requests executed | 19 |
| CI test scripts executed | 19 |
| CI pre-request scripts executed | 2 |
| CI assertions executed | 45 |
| CI assertions passed | 45 |
| CI assertions failed | 0 |
| CI runtime errors | 0 |
| Complete validation requests | 26 |
| Complete validation test scripts | 26 |
| Complete validation assertions | 61 |
| Complete validation assertions passed | 51 |
| Known complete-suite failures | 10 |
| Complete-suite runtime errors | 0 |
| GitHub Actions quality gate | Pass |
| Workflow artifact groups | 2 |
| Automated report formats | JSON and JUnit |

### Preserved

- Original 25-test-case manual and API baseline
- Day 5 collection expectations
- Complete 26-request validation collection
- Complete 61-assertion validation baseline
- Ten documented failed assertions
- Three confirmed API defect reports
- Day 4 PostgreSQL validation results
- Public API and local database separation
- All existing Postman requests, assertions and test-case logic
- All existing SQL validation scripts and database evidence

### Security

- Credentials use GitHub repository secrets in CI
- Public environment credential values remain blank
- Local Postman environments remain ignored
- Generated Newman output remains ignored locally
- Active tokens and passwords are not committed
- Public collections, reports and screenshots remain sanitized
- Workflow permissions remain read-only for repository contents

## 1.0.0 — Day 5 Manual, API and Database Testing Baseline

### Added

- Requirements baseline and software test plan
- 25 manual/API test cases
- Requirements Traceability Matrix
- PostgreSQL schema and synthetic data
- 19 SQL validation and analysis queries
- 13 automated database-summary checks
- Six database-constraint negative tests
- 26-request Postman collection
- 61 automated Postman assertions
- Three confirmed API defect reports
- Day 4 and Day 5 execution reports
- Public-safe Postman exports
- Organized screenshot evidence

### Results

- 18 API test cases passed
- Seven API test cases failed
- 51 Postman assertions passed
- Ten Postman assertions failed
- Zero Postman runtime errors
- Three confirmed API defects
