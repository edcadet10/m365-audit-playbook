# [Finding ID] — [Concrete condition and affected outcome]

**Template; no tenant finding is asserted.**

**Control IDs / assessed layer / period:** [IDs; design, implementation, operation; period].

**Condition:** [What was observed, in which tenant/workload, and when?]

**Criterion and source:** [Adopted requirement, direct Microsoft documentation URL, relevant documented behavior, framework/version if applicable]. Separate Microsoft facts from consultant acceptance criteria. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Evidence and population:** [Evidence IDs; object IDs; query scope; population/sample; errors; screenshots or raw records in restricted storage]. State completeness and history limitations. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention)

**Business consequence:** [Demonstrated effect and credible scenario; do not claim an actual breach solely from a setting]. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Cause:** [Established cause and evidence, or explicitly labeled hypothesis].

**Counterevidence and falsifying test:** [What could disprove the finding? What was tried? What happened?] Distinguish policy evaluation from actual enforcement. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only)

**Severity and confidence:** [Likelihood/impact rationale; residual risk; confidence; consultant scoring model].

**Recommendation:** [Desired outcome, technical direction, owner, dependencies, pilot and rollback]. Link Microsoft implementation guidance beside each technical action. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Management response and exception:** [Accept facts / dispute with evidence / accept risk / remediate; approver and expiry].

**Closure test:** [Repeat original failing scenario, verify scope and side effects, collect new operating evidence]. [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only)

**Retest:** [Date; evidence; actual outcome; remaining limitations; reviewer].
