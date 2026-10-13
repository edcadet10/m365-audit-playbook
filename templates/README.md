# Engagement templates

These are **original consultant workpapers**. Their columns and suggested organization are not prescribed by Microsoft. Populate source and evidence fields so each engagement conclusion can be traced to the relevant product behavior and adopted business requirement. Keep completed workpapers and raw tenant evidence in restricted engagement storage, outside this public repository. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

| Template | Purpose |
|---|---|
| [engagement-charter.md](engagement-charter.md) | Scope, criteria, review period, test authority and responsibilities |
| [workload-scope.csv](workload-scope.csv) | Explicit inventory and inclusion/exclusion decisions |
| [license-matrix.csv](license-matrix.csv) | Entitlements by feature and beneficiary |
| [access-request.csv](access-request.csv) | Time-bounded roles, scopes and removal |
| [evidence-request.csv](evidence-request.csv) | Collection requests with population and fields |
| [evidence-register.csv](evidence-register.csv) | Provenance, completeness, custody and hashes |
| [retention-matrix.csv](retention-matrix.csv) | Required versus retrievable evidence history |
| [control-assessment.csv](control-assessment.csv) | All 90 controls, initially Not assessed |
| [test-record.csv](test-record.csv) | Claim, kill criterion, expectation, observation and cleanup |
| [finding-register.csv](finding-register.csv) | Evidence-backed technical and business findings |
| [finding.md](finding.md) | Narrative finding suitable for a report |
| [remediation-plan.csv](remediation-plan.csv) | Change, pilot, rollback, owner and retest |
| [exceptions.csv](exceptions.csv) | Risk acceptance separate from technical result |
| [framework-crosswalk.csv](framework-crosswalk.csv) | Version-specific mapping without invented equivalence |
| [decision-log.csv](decision-log.csv) | Supporting and contradicting evidence for important decisions |
| [executive-report.md](executive-report.md) | Conclusions, uncertainty and decisions for leadership |

Use object IDs and evidence IDs instead of embedding credentials, tokens or sensitive document contents. Add source URLs next to technical claims. A source citation supports product behavior; the control assessment still requires evidence from the actual tenant. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

Default statuses: Pass, Partially implemented, Fail, Not assessed, Not applicable. Record risk acceptance in a separate field. These are this playbook's **consultant conventions**; they prevent a tool's manual or skipped result from becoming unsupported assurance. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S57: ScubaGear v1.8.0 output schema](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/misc/tooloutputschema.md)

No CSV contains completed customer findings. The framework crosswalk deliberately begins empty: obtain the actual required framework/version and appropriate interpretation before mapping. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S05: CIS Microsoft 365 Benchmarks](https://www.cisecurity.org/benchmark/microsoft_365)
