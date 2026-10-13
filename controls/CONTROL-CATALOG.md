# Microsoft 365 control catalog

90 consultant-authored controls across 17 domains. Research reviewed 12 October 2026.

The Microsoft references beside each procedure explain its product basis. The procedures, priorities, owners and acceptance criteria are proposed consultant methodology, not text issued by Microsoft. Adopt and tailor them in the engagement charter. Source links support product facts and context; they do not imply Microsoft mandates every test, sample or organizational decision.

All controls start as **Not assessed**. The catalog does not report any real tenant findings. Every active test requires engagement authorization. Use [the playbook](../PLAYBOOK.md), [fieldwork runbooks](../docs/FIELDWORK-RUNBOOKS.md) and [assessment worksheet](../templates/control-assessment.csv) together.

## Domain index

- [Governance](#governance) — 5 controls
- [Identity and privileged access](#identity-and-privileged-access) — 9 controls
- [Applications and automation](#applications-and-automation) — 6 controls
- [Hybrid infrastructure](#hybrid-infrastructure) — 3 controls
- [Exchange and email security](#exchange-and-email-security) — 6 controls
- [SharePoint and OneDrive](#sharepoint-and-onedrive) — 5 controls
- [Teams](#teams) — 4 controls
- [Endpoints and applications](#endpoints-and-applications) — 6 controls
- [Information protection and compliance](#information-protection-and-compliance) — 7 controls
- [Audit logging and evidence](#audit-logging-and-evidence) — 5 controls
- [Detection and incident response](#detection-and-incident-response) — 4 controls
- [Resilience and recovery](#resilience-and-recovery) — 4 controls
- [Copilot and agent governance](#copilot-and-agent-governance) — 4 controls
- [Power Platform](#power-platform) — 4 controls
- [Fabric and Power BI](#fabric-and-power-bi) — 3 controls
- [Operations and service management](#operations-and-service-management) — 4 controls
- [Specialized tenant and workload overlays](#specialized-tenant-and-workload-overlays) — 11 controls

## Governance

### GOV-01 — Tenant and workload boundary

**Objective:** Establish the complete population being assessed. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

**Applicability:** Every engagement, including acquisitions and test tenants. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

**Proposed accountable owner:** Audit sponsor. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Tenant IDs; verified domains; subscription export; service inventory; architecture diagram; acquisition register. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

**Audit procedure (consultant method):** Reconcile finance, identity and administrator inventories. Include production, development, acquired and partner-managed tenants. Record enabled workloads, geographies, business owners, external dependencies and explicit exclusions. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

**Read-only execution — Tenant and workload boundary:** [GOV-01.ps1](../scripts/controls/GOV-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#gov-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The sponsor approves a boundary with every discovered tenant and workload accounted for; unexamined dependencies appear as limitations. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Compare the approved list with a subsidiary's domain and license invoices; an unexplained tenant disproves completeness. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

**Remediation direction:** Assign owners to discovered tenants and extend scope or obtain a documented limitation. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

### GOV-02 — Obligations and control criteria

**Objective:** Translate business commitments into testable requirements. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Applicability:** All tenants; add sector-specific obligations when applicable. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Proposed accountable owner:** Risk and compliance lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Contracts; internal standards; data classification; retention schedule; control crosswalk; legal interpretation. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Audit procedure (consultant method):** Identify mandatory obligations, contractual promises and internal targets separately. Select dated Microsoft, CISA and licensed CIS criteria. Map each adopted requirement to evidence and a control owner; mark unmapped requirements. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Read-only execution — Obligations and control criteria:** [GOV-02.ps1](../scripts/controls/GOV-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#gov-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Every claimed obligation has an owner, applicable population and assessment procedure. No benchmark score is presented as legal certification. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Falsifying probe (authorized test or evidence challenge):** Ask for the requirement supporting a proposed seven-year retention period; absence means it is an unapproved assumption. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Remediation direction:** Have the accountable legal/compliance owner define the requirement before configuring it. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S06: NIST SP 800-53A Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/a/r5/final); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S62: CISA Entra baseline, ScubaGear v1.8.0](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/PowerShell/ScubaGear/baselines/aad.md)

### GOV-03 — Roles, accountability and separation

**Objective:** Prevent unowned or self-approved security administration. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Applicability:** All tenant and service administrators, including outsourced support. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Proposed accountable owner:** CIO or service owner. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** RACI; role exports; change approvals; privileged access reviews; support contracts. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Audit procedure (consultant method):** Match operational responsibilities to actual permissions. Examine who approves their own elevation, grants consent, exports investigations and accepts risk. Review conflicts and independent oversight. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Read-only execution — Roles, accountability and separation:** [GOV-03.ps1](../scripts/controls/GOV-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#gov-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Sensitive functions have named accountable owners, justified access and independent review where separation is impractical. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Falsifying probe (authorized test or evidence challenge):** Trace one emergency production change from request to approval; identical requester and approver with no review challenges the design. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Remediation direction:** Separate approval from execution or introduce logged independent review with a deadline. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S06: NIST SP 800-53A Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/a/r5/final)

### GOV-04 — Exception governance

**Objective:** Keep accepted risk visible and time bounded. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Applicability:** All policy exclusions, scanner omissions and compensating controls. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Proposed accountable owner:** Risk owner. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Exception register; expiration dates; approvals; mitigation evidence; scanner configuration. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Audit procedure (consultant method):** Join exceptions to actual users, applications, locations and policy IDs. Verify business necessity, expiration, compensating evidence and reapproval. Look for expired exclusions still active. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Read-only execution — Exception governance:** [GOV-04.ps1](../scripts/controls/GOV-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#gov-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Every active exception is discoverable, justified, approved and bounded; residual risk remains visible in reporting. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Falsifying probe (authorized test or evidence challenge):** Select an omitted scanner control and demand operating evidence for its claimed alternate mitigation. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Remediation direction:** Remove obsolete exclusions through change control; document and retest valid exceptions. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S03: ScubaGear](https://github.com/cisagov/ScubaGear); [S04: ScubaGear v1.8.0 assumptions](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/misc/assumptions.md); [S57: ScubaGear v1.8.0 output schema](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/misc/tooloutputschema.md); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### GOV-05 — License and entitlement assurance

**Objective:** Determine which controls can actually be used and sustained. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Applicability:** Every license family, add-on, trial, guest and service population. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Proposed accountable owner:** Licensing owner. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Subscribed SKUs; assigned service plans; contracts; renewal dates; usage reports; feature matrix. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Audit procedure (consultant method):** Distinguish Microsoft 365 from Office 365 bundles. Match benefiting users and workloads to feature prerequisites; inspect disabled plans and trial expiration. Validate backup and AI consumption separately. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Read-only execution — License and entitlement assurance:** [GOV-05.ps1](../scripts/controls/GOV-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#gov-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required capabilities have verified entitlement and assignment, or an evidenced alternative and recorded gap. Missing licensing never becomes an automatic Pass. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Falsifying probe (authorized test or evidence challenge):** Inspect an advanced feature configured during a trial after its entitlement expires. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Remediation direction:** Correct assignments, procure justified capability or test an alternative; preserve the underlying control objective. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)


## Identity and privileged access

### IAM-01 — Privileged role population

**Objective:** Identify every effective route to high privilege. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Applicability:** All Entra roles and service-specific administrators. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Proposed accountable owner:** Identity lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Active and eligible role assignments; role-assignable groups; group membership; workload RBAC; partner access. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Audit procedure (consultant method):** Enumerate permanent, eligible, scoped and group-derived roles. Resolve memberships and app principals. Include Exchange, SharePoint, Teams, Purview, Intune and Defender administration; compare with HR and support rosters. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Read-only execution — Privileged role population:** [IAM-01.ps1](../scripts/controls/IAM-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Every effective privilege has a current owner and justification; unauthorized paths are findings, regardless of Global Administrator count. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Falsifying probe (authorized test or evidence challenge):** Follow a non-admin user's ownership of a privileged group or application to test indirect control. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Remediation direction:** Remove unjustified paths with rollback planning; use narrower roles and time-bound elevation where supported. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

### IAM-02 — Effective MFA and authentication strength

**Objective:** Verify required identities receive the intended authentication control. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

**Applicability:** Human identities; evaluate service principals separately. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

**Proposed accountable owner:** Identity lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Authentication method registrations; policy exports; exclusions; sign-in authentication details; approved test matrix. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

**Audit procedure (consultant method):** Define required strength by role and risk. Reconcile registrations with policy scope. Test administrator, employee, guest and exception identities using fresh sessions; include trusted locations and alternate clients. Interpret token claims rather than requiring a prompt every time. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

**Read-only execution — Effective MFA and authentication strength:** [IAM-02.ps1](../scripts/controls/IAM-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The intended population is covered by enforced controls and observed outcomes, with documented exceptions; registration alone is insufficient. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

**Falsifying probe (authorized test or evidence challenge):** A registered user who can obtain an unprotected session through an excluded path falsifies population-wide enforcement. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

**Remediation direction:** Close scope gaps; migrate sensitive roles to supported phishing-resistant methods with recovery readiness. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

### IAM-03 — Conditional Access coverage and interaction

**Objective:** Find gaps caused by policy state, scope and combined evaluation. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Applicability:** Tenants using Conditional Access; map security-defaults alternative separately. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Proposed accountable owner:** Identity lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** All policy states; included/excluded users and resources; named locations; device filters; sign-in details. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Audit procedure (consultant method):** Build an identity-by-resource-by-client matrix. Check exclusions, authentication strengths, grant operators and session controls. Use What If for design analysis, then corroborate with sign-ins and approved tests. Account for existing tokens and dependencies. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Read-only execution — Conditional Access coverage and interaction:** [IAM-03.ps1](../scripts/controls/IAM-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** No unexplained route bypasses the adopted access requirements; report-only policies are assessed as design evidence only. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Falsifying probe (authorized test or evidence challenge):** Try an in-scope test identity on an excluded resource or trusted-location path. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Remediation direction:** Stage corrections in report-only, assess business impact and move to enforcement under change control. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

### IAM-04 — Emergency administrative access

**Objective:** Maintain independently usable recovery access without uncontrolled privilege. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Applicability:** All tenants. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Proposed accountable owner:** Identity lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Emergency account inventory; authentication methods; custody records; monitoring rules; last exercise. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Audit procedure (consultant method):** Review at least two cloud-only emergency accounts, independent strong credentials, active role assignment and relevant policy exclusions against current Microsoft guidance. Observe an authorized sign-in exercise, alert delivery and secure credential recovery. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Read-only execution — Emergency administrative access:** [IAM-04.ps1](../scripts/controls/IAM-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Recovery access works when normal admin dependencies fail; access is monitored, controlled and exercised. Password-only MFA bypass is not a blanket recommendation. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Falsifying probe (authorized test or evidence challenge):** Simulate unavailability of the usual admin phone or federation path without disrupting production. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Remediation direction:** Repair independent credentials, custody and alert routing; schedule recurring exercises. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### IAM-05 — Privileged elevation and review

**Objective:** Limit standing administrative access and verify elevation governance. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Applicability:** PIM-capable tenants; use documented manual alternatives elsewhere. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Proposed accountable owner:** Identity governance lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** PIM assignments and settings; activation logs; approvers; access reviews; emergency exceptions. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Audit procedure (consultant method):** Examine approval, justification, duration and authentication requirements for sensitive roles. Sample activations and subsequent use. Check stale eligible assignments and whether approvers can be unavailable simultaneously. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Read-only execution — Privileged elevation and review:** [IAM-05.ps1](../scripts/controls/IAM-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Elevation is justified, constrained and reviewed; approved emergency access remains available. A configured PIM policy without operational review is insufficient. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Falsifying probe (authorized test or evidence challenge):** Inspect an activation outside working hours or one approved by the requester. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Remediation direction:** Reduce unnecessary standing roles; correct approval chains and enforce periodic entitlement review. [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### IAM-06 — Joiner, mover and leaver lifecycle

**Objective:** Remove access when business authorization ends. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

**Applicability:** Employees, contractors, guests and privileged accounts. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

**Proposed accountable owner:** HR and identity operations. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** HR termination dates; ticket timestamps; account status; group changes; token revocation; application sessions. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

**Audit procedure (consultant method):** Select recent leavers, movers and urgent terminations. Compare authoritative timestamps to disablement and downstream access removal. Check hybrid source, refresh tokens, application sessions, mailbox delegation and owned automations. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

**Read-only execution — Joiner, mover and leaver lifecycle:** [IAM-06.ps1](../scripts/controls/IAM-06.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-06). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Access removal meets the organization's documented SLA across relevant systems; preservation and business continuity are handled separately. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

**Falsifying probe (authorized test or evidence challenge):** Test whether a disabled test user retains an existing application session beyond the approved window. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

**Remediation direction:** Repair HR triggers and downstream deprovisioning; document actual session-expiry limitations. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

### IAM-07 — External identity lifecycle and partner trust

**Objective:** Constrain guest and cross-tenant access to approved collaboration. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

**Applicability:** Tenants with guests, partner access or cross-tenant synchronization. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

**Proposed accountable owner:** Identity and collaboration leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Guest roster; sponsors; last activity; reviews; inbound/outbound settings; partner overrides. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

**Audit procedure (consultant method):** Resolve guest sponsors and resource access. Review both default and partner-specific trust, including accepted MFA/device claims. Inspect dormant identities, access packages and review decisions; reconcile shared-channel participants separately. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

**Read-only execution — External identity lifecycle and partner trust:** [IAM-07.ps1](../scripts/controls/IAM-07.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-07). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** External access is sponsored, scoped, reviewed and removed when no longer needed; trusted claims have a documented partner rationale. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

**Falsifying probe (authorized test or evidence challenge):** Select an expired contractor with access via a partner override or shared channel. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

**Remediation direction:** Expire stale access and narrow trust; preserve necessary collaboration through explicit partner settings. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

### IAM-08 — Authentication recovery and legacy access

**Objective:** Prevent weak fallback paths from defeating strong access controls. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Applicability:** Human identities, recovery processes and legacy clients. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Proposed accountable owner:** Identity lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Allowed authentication methods; recovery/helpdesk procedures; registration controls; legacy sign-ins; exception inventory. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Audit procedure (consultant method):** Review helpdesk identity verification, recovery credentials and method registration. Check legacy protocols and app dependencies. Test one recovery workflow with an authorized account; confirm the result does not create an undocumented bypass. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Read-only execution — Authentication recovery and legacy access:** [IAM-08.ps1](../scripts/controls/IAM-08.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-08). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Recovery assurance is proportionate to the account's privilege and legacy access has a documented migration or compensating control. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Falsifying probe (authorized test or evidence challenge):** Attempt recovery using only information broadly visible in the directory. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Remediation direction:** Improve identity verification, restrict weak methods where appropriate and migrate legacy dependencies. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

### IAM-09 — Risk-based access and investigation

**Objective:** Verify identity risk leads to appropriate control and investigation. [S83: Identity Protection risk policies](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Applicability:** Identity Protection features where licensed; equivalent detection elsewhere. [S83: Identity Protection risk policies](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Proposed accountable owner:** Identity and SOC leads. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** User-risk/sign-in-risk policies; assignments; exclusions; risk detections; remediation tickets. [S83: Identity Protection risk policies](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Audit procedure (consultant method):** Review user and sign-in risk separately, feature entitlement and deployed policy experience. Inspect how detected risk is investigated and dismissed. Use permitted simulations or historical sanitized cases rather than provoking real account compromise. [S83: Identity Protection risk policies](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Read-only execution — Risk-based access and investigation:** [IAM-09.ps1](../scripts/controls/IAM-09.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#iam-09). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Risk handling matches approved thresholds and evidence supports closure; unavailable premium signals remain a disclosed limitation. [S83: Identity Protection risk policies](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Falsifying probe (authorized test or evidence challenge):** A risky user is marked remediated without evidence or remains excluded from the intended control. [S83: Identity Protection risk policies](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Remediation direction:** Correct policy scope and investigation workflow; validate fallback procedures. [S83: Identity Protection risk policies](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S83: Identity Protection risk policies](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)


## Applications and automation

### APP-01 — Application and service principal inventory

**Objective:** Expose persistent non-human access and abandoned applications. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Applicability:** All enterprise apps, app registrations and automation identities. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Proposed accountable owner:** Application security lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** App/service principal exports; owners; credentials metadata; consent grants; sign-in records; app roles. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Audit procedure (consultant method):** Reconcile registrations with service principals and business systems. Identify orphaned owners, unused high privilege, multitenant publishers and credentials. Distinguish application permissions from delegated grants and user-assigned access. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Read-only execution — Application and service principal inventory:** [APP-01.ps1](../scripts/controls/APP-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#app-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Each privileged application has an accountable owner, purpose, reviewed permission set and lifecycle. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Falsifying probe (authorized test or evidence challenge):** Pick an app with no recent human use but active application-only access. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Remediation direction:** Retire or narrow unused applications after dependency review; assign accountable owners. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### APP-02 — Consent and existing grants

**Objective:** Prevent inappropriate app authorization and inherited excessive consent. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Applicability:** All tenants permitting integrations. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Proposed accountable owner:** Application security lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** User consent policy; admin consent workflow; delegated grants; application role assignments; approvals. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Audit procedure (consultant method):** Review new-consent rules and enumerate existing grants separately. Examine permissions exposing mail, files, directory roles or write capabilities. Sample approval decisions and publisher verification without equating publisher verification to trust. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Read-only execution — Consent and existing grants:** [APP-02.ps1](../scripts/controls/APP-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#app-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Granted access matches business need and approved scope; changing consent settings does not substitute for reviewing old grants. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Falsifying probe (authorized test or evidence challenge):** Find a historical broad grant that still operates after user consent is disabled. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Remediation direction:** Revoke unnecessary grants through a tested dependency plan and improve approval criteria. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

### APP-03 — Workload identity credentials and trust

**Objective:** Reduce credential and federation abuse in unattended access. [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Applicability:** Service principals, managed identities and federated CI/CD. [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Proposed accountable owner:** Platform and application owners. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Credential types and expiry; federation issuer/subject/audience; secret custody; rotation evidence; app permissions. [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Audit procedure (consultant method):** Inspect metadata without collecting secret values. Review owner changes, credential addition alerts and federation restrictions. Evaluate managed identities on their actual resources; workload Conditional Access coverage is not universal. [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Read-only execution — Workload identity credentials and trust:** [APP-03.ps1](../scripts/controls/APP-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#app-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Credentials are scoped, protected, monitored and replaceable; trust subjects cannot be satisfied by unintended workloads. [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Falsifying probe (authorized test or evidence challenge):** Inspect a federation subject accepting an overly broad repository or branch set. [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Remediation direction:** Prefer appropriate secretless patterns; narrow trust and rotate exposed or unowned credentials. [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### APP-04 — Application resource boundaries

**Objective:** Prove applications reach only approved data and actions. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Applicability:** Apps with mailbox, site, directory or agent tool access. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Proposed accountable owner:** Application owner. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Effective API permissions; service RBAC; selected-resource grants; app access design; positive/negative test results. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Audit procedure (consultant method):** Map app permissions through both API and workload authorization. With a controlled identity, test an allowed resource and one outside its intended scope. Review owner and credential administrators as privilege paths. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Read-only execution — Application resource boundaries:** [APP-04.ps1](../scripts/controls/APP-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#app-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Allowed operations succeed and prohibited resource/action combinations fail; permission names alone do not establish isolation. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Falsifying probe (authorized test or evidence challenge):** Use an application credential against a mailbox or site outside the approved population. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Remediation direction:** Replace broad grants with supported resource-scoped authorization and retest dependent features. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### APP-05 — Automation and partner administration

**Objective:** Audit external administrators and administrative pipelines. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Applicability:** MSPs, delegated administration, deployment pipelines and scheduled jobs. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Proposed accountable owner:** Service owner. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Partner relationships; scoped roles; pipeline identities; approvals; job history; protected configuration. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Audit procedure (consultant method):** Trace a partner or pipeline action to a named authorization. Review expiration, offboarding, repository permissions and secret custody. Confirm automated output and logs do not expose tenant evidence publicly. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Read-only execution — Automation and partner administration:** [APP-05.ps1](../scripts/controls/APP-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#app-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Delegated access is bounded to current need and changes are attributable; pipelines cannot silently grant themselves new authority. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Falsifying probe (authorized test or evidence challenge):** Trace an expired support contract to surviving administrative access. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Remediation direction:** Expire old delegations and separate deployment authority from code approval where feasible. [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S06: NIST SP 800-53A Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/a/r5/final)

### APP-06 — Cloud app discovery and session controls

**Objective:** Assess connected SaaS and browser session restrictions. [S79: Conditional Access app control limitations](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [S80: Conditional Access app control](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Applicability:** Defender for Cloud Apps or equivalent CASB/session enforcement. [S79: Conditional Access app control limitations](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [S80: Conditional Access app control](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Proposed accountable owner:** Cloud security lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Connected apps; discovery sources; sanctioned apps; session routing; policy exceptions; client test matrix. [S79: Conditional Access app control limitations](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [S80: Conditional Access app control](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Audit procedure (consultant method):** Inventory connected and unsanctioned services. Test protected browser sessions and native-client paths, content inspection limits and encrypted/large-file cases. Confirm resource apps are covered and collector credentials remain healthy. [S79: Conditional Access app control limitations](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [S80: Conditional Access app control](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Read-only execution — Cloud app discovery and session controls:** [APP-06.ps1](../scripts/controls/APP-06.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#app-06). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required sessions and transfer paths are governed with explicit unsupported cases and tested alternatives. [S79: Conditional Access app control limitations](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [S80: Conditional Access app control](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Falsifying probe (authorized test or evidence challenge):** A browser download is blocked but the same test data is available through an uncontrolled native client. [S79: Conditional Access app control limitations](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [S80: Conditional Access app control](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Remediation direction:** Close alternate paths where supported and record remaining limitations; review business impact. [S79: Conditional Access app control limitations](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [S80: Conditional Access app control](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S79: Conditional Access app control limitations](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [S80: Conditional Access app control](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)


## Hybrid infrastructure

### HYB-01 — Identity synchronization and federation

**Objective:** Protect infrastructure that can influence cloud identity. [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Applicability:** Entra Connect, Cloud Sync, federation, PTA and password writeback where used. [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Proposed accountable owner:** Hybrid identity lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Topology; source-of-authority settings; server versions; admin access; connector accounts; trust certificates. [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Audit procedure (consultant method):** Identify every server, agent and trust path. Review hardening, patch support, service accounts and remote administration. Verify staging/recovery arrangements and monitor unexpected synchronization or federation changes. [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Read-only execution — Identity synchronization and federation:** [HYB-01.ps1](../scripts/controls/HYB-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#hyb-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Cloud identity authority is understood, supported, access-controlled and monitored, with tested recovery. [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Falsifying probe (authorized test or evidence challenge):** Find an unmanaged server or old agent still able to write identity changes. [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Remediation direction:** Remediate source infrastructure and credentials; validate synchronization behavior before cutover. [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### HYB-02 — Hybrid messaging and application connectors

**Objective:** Prevent unmanaged relay and integration paths. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Applicability:** Hybrid Exchange, mail gateways, application proxy and on-premises connectors. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Proposed accountable owner:** Messaging and infrastructure leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Connector inventory; certificates; relay restrictions; accepted domains; mail flow diagram; logs. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Audit procedure (consultant method):** Walk inbound and outbound paths, including bypass routes around filtering. Verify trust by endpoint and credential, renewal ownership and legacy dependencies. Test approved representative messages and application access. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Read-only execution — Hybrid messaging and application connectors:** [HYB-02.ps1](../scripts/controls/HYB-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#hyb-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Every connector has a business owner, bounded trust and observed expected routing. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Falsifying probe (authorized test or evidence challenge):** Check a route that skips the normal gateway or allows a broader sender population than intended. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Remediation direction:** Narrow relay and connector trust; remove obsolete paths after dependency validation. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

### HYB-03 — Source-of-authority and outage exercise

**Objective:** Prove identity continuity and emergency changes work across systems. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Applicability:** Hybrid and federated tenants. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Proposed accountable owner:** Identity operations. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Disaster recovery plan; authority map; outage exercise; synchronization timing; emergency contacts. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Audit procedure (consultant method):** Tabletop loss of federation or sync and urgent termination during that outage. Identify which system accepts each change, what is cached and how reconciliations occur. Observe a non-disruptive recovery rehearsal. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Read-only execution — Source-of-authority and outage exercise:** [HYB-03.ps1](../scripts/controls/HYB-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#hyb-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The organization can maintain essential access and revoke dangerous access within approved objectives during dependency failure. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Falsifying probe (authorized test or evidence challenge):** Ask staff to disable a synchronized test identity while the source change path is unavailable. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Remediation direction:** Document alternate paths and reconcile conflicting state; retest timing. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)


## Exchange and email security

### MAIL-01 — Sender authentication and domain ownership

**Objective:** Prevent unauthorized domain use while preserving legitimate sending. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

**Applicability:** All accepted, sending, parked and third-party mail domains. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

**Proposed accountable owner:** Messaging and DNS owners. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Domain inventory; SPF/DKIM/DMARC records; third-party senders; aggregate reports; message headers. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

**Audit procedure (consultant method):** Reconcile senders with business owners. Check SPF structure and lookup constraints, DKIM signing and tenant-provided selectors, and DMARC alignment. Sample each sending platform; inspect parked domains separately. Stage enforcement based on legitimate traffic evidence. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

**Read-only execution — Sender authentication and domain ownership:** [MAIL-01.ps1](../scripts/controls/MAIL-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#mail-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Approved senders authenticate and align; unauthorized use is addressed by the adopted policy. A published record without successful headers is insufficient. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

**Falsifying probe (authorized test or evidence challenge):** Send an approved test from a forgotten marketing platform and inspect authentication results. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

**Remediation direction:** Repair sender inventory and alignment, then progress DMARC enforcement with monitored exceptions. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

### MAIL-02 — Threat policy coverage and precedence

**Objective:** Verify intended email protection actually applies to recipients. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

**Applicability:** Exchange Online; feature checks depend on Defender entitlement. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

**Proposed accountable owner:** Messaging security lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Preset/custom policies; recipients and exceptions; anti-phish settings; Safe Links/Attachments; trace evidence. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

**Audit procedure (consultant method):** Map ordinary, executive and exception recipients to effective policy. Review impersonation targets, protections and quarantine handling. Resolve precedence before judging custom settings; use approved benign tests and policy evaluation evidence. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

**Read-only execution — Threat policy coverage and precedence:** [MAIL-02.ps1](../scripts/controls/MAIL-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#mail-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required recipient populations receive the adopted protection profile; unavailable premium features are disclosed. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

**Falsifying probe (authorized test or evidence challenge):** Choose a recipient assigned to both Standard and a custom policy and verify which settings win. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

**Remediation direction:** Correct assignment and precedence; pilot changes against legitimate business mail. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S59: ORCA README](https://github.com/cammurray/orca/blob/master/README.md)

### MAIL-03 — Forwarding, inbox rules and delegation

**Objective:** Identify unauthorized mailbox persistence or data transfer. [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Applicability:** User, shared, resource and privileged mailboxes. [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Proposed accountable owner:** Messaging security lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Mailbox forwarding; inbox rules including hidden where supported; delegates; SendAs/SendOnBehalf; forwarding reports. [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Audit procedure (consultant method):** Review all high-risk mailboxes and a justified remaining sample. Correlate forwarding and delegates with approvals and sign-in events. Inspect outbound policies, remote domains and transport rules together; verify actual forwarding behavior. [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Read-only execution — Forwarding, inbox rules and delegation:** [MAIL-03.ps1](../scripts/controls/MAIL-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#mail-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** External forwarding and delegation are authorized, constrained and monitored; suspicious rules are escalated promptly. [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Falsifying probe (authorized test or evidence challenge):** Inspect an explicit mailbox forward or rule despite a claimed tenant-wide block. [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Remediation direction:** Remove unauthorized persistence under incident procedures; constrain approved exceptions and retest. [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

### MAIL-04 — SMTP AUTH and legacy dependencies

**Objective:** Eliminate avoidable password-based messaging access. [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Applicability:** Mail-sending devices, applications and SMTP clients. [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Proposed accountable owner:** Messaging and application owners. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Organization/mailbox SMTP settings; authentication policies; SMTP usage; migration inventory. [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Audit procedure (consultant method):** Distinguish the SMTP AUTH protocol from Basic authentication. Check organization settings, mailbox overrides and actual client authentication. Recheck Microsoft's live retirement notice; identify owners and modern-authentication migration tests. [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Read-only execution — SMTP AUTH and legacy dependencies:** [MAIL-04.ps1](../scripts/controls/MAIL-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#mail-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Legacy access is either removed or explicitly risk-managed with a tested transition plan; the audit does not assume an obsolete retirement date has removed it. [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Falsifying probe (authorized test or evidence challenge):** Locate a mailbox override used by a printer or application after a broad disablement claim. [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Remediation direction:** Move supported clients to OAuth or an approved alternative; test delivery before disabling dependencies. [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

### MAIL-05 — Mail-flow bypass and quarantine

**Objective:** Prevent broad exceptions from neutralizing filtering. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Applicability:** All mail gateways, transport rules and allow lists. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Proposed accountable owner:** Messaging security lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Transport rules; connector restrictions; allow/block entries; expiry; quarantine roles and releases. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Audit procedure (consultant method):** Trace messages through third-party gateways and Exchange. Investigate broad allow rules, filtering bypass, unauthenticated relay and user release permissions. Sample exception creation and suspicious release events. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Read-only execution — Mail-flow bypass and quarantine:** [MAIL-05.ps1](../scripts/controls/MAIL-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#mail-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Bypasses have narrow business scope, accountable owners and periodic review; suspicious content is handled through an assigned process. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Falsifying probe (authorized test or evidence challenge):** Find a domain-wide allow rule justified by one application or sender. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Remediation direction:** Replace broad exceptions with precise supported controls and expiration; validate false-positive impact. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

### MAIL-06 — Mailbox auditing and administrative exposure

**Objective:** Establish reliable evidence for sensitive mailbox access. [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

**Applicability:** Exchange Online mailboxes and administrative roles. [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

**Proposed accountable owner:** Messaging and audit leads. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Organization AuditDisabled; mailbox actions; bypass associations; audit events; administrative access. [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

**Audit procedure (consultant method):** Check organization-level auditing before interpreting per-mailbox flags. Review bypasses and action coverage, including licensed events. Trace a permitted test action through the audit pipeline and review mailbox-level privileged access. [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

**Read-only execution — Mailbox auditing and administrative exposure:** [MAIL-06.ps1](../scripts/controls/MAIL-06.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#mail-06). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required access is auditable and least-privileged, or limitations are explicit; a single boolean does not establish full event coverage. [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

**Falsifying probe (authorized test or evidence challenge):** Choose an authorized delegate action and demonstrate whether its record is retrievable. [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

**Remediation direction:** Repair action coverage or collection gaps; document licensing and workload-specific limitations. [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)


## SharePoint and OneDrive

### COL-01 — External sharing boundaries

**Objective:** Control external collaboration at tenant, site and item levels. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Applicability:** SharePoint, OneDrive and Teams-connected sites. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Proposed accountable owner:** Collaboration lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Organization/site sharing settings; link inventory; external identities; sensitivity labels; access tests. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Audit procedure (consultant method):** Inventory permissive sites and sensitive content. Review link types, expiration, guests and direct grants. Evaluate tenant limits alongside site settings and item permissions. Test anonymous, approved guest and unrelated user access to synthetic content. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Read-only execution — External sharing boundaries:** [COL-01.ps1](../scripts/controls/COL-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#col-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Access matches approved collaboration requirements and sensitive data is not publicly exposed without authorization. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Falsifying probe (authorized test or evidence challenge):** Test a pre-existing direct grant or link after a claimed sharing restriction. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Remediation direction:** Remove unintended access and constrain future sharing through supported settings; retest old and new links. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### COL-02 — Effective permissions and broad access

**Objective:** Find oversharing hidden behind group membership and inheritance. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

**Applicability:** Sensitive sites, OneDrive accounts and channel sites. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

**Proposed accountable owner:** Data owner. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Site membership; nested groups; item inheritance; broad principals; access reviews; content inventory. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

**Audit procedure (consultant method):** Trace permissions from broad groups to sampled sensitive items, including broken inheritance. Review owner and administrator rights, inactive memberships and all-company access. Compare discovered access with the data owner's intended audience. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

**Read-only execution — Effective permissions and broad access:** [COL-02.ps1](../scripts/controls/COL-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#col-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The actual audience is approved and reviewed; a private site name or label is not proof. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

**Falsifying probe (authorized test or evidence challenge):** Use a low-privilege test user to request a synthetic sensitive item through its direct URL. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

**Remediation direction:** Correct ACLs and group membership, then verify search and direct access separately. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

### COL-03 — Site lifecycle and owner accountability

**Objective:** Prevent abandoned collaboration spaces from retaining uncontrolled access. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Applicability:** Active, inactive, archived and acquired sites. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Proposed accountable owner:** Collaboration service owner. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Site inventory; owners; activity; classification; storage; review and archive decisions. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Audit procedure (consultant method):** Reconcile site creation, guest access and ownership with projects and business units. Sample inactive and orphaned sites; inspect Teams private/shared-channel sites independently. Determine archive, retention and deletion dependencies. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Read-only execution — Site lifecycle and owner accountability:** [COL-03.ps1](../scripts/controls/COL-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#col-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Each site has an accountable owner, classification and lifecycle decision; no unmanaged high-risk space remains unexplained. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Falsifying probe (authorized test or evidence challenge):** Select a completed project whose guest access was never reassessed. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Remediation direction:** Assign ownership, review access and archive or dispose under approved retention rules. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

### COL-04 — Unmanaged-device and sync access

**Objective:** Limit data transfer to devices outside approved management. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

**Applicability:** Browser access, synchronization clients and personal devices. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

**Proposed accountable owner:** Endpoint and collaboration leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Conditional Access; site access settings; sync restrictions; app policies; test results. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

**Audit procedure (consultant method):** Test approved device/browser combinations with synthetic content. Verify download, sync and session restrictions rather than judging only sign-in success. Consider app protection and permitted business exceptions. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

**Read-only execution — Unmanaged-device and sync access:** [COL-04.ps1](../scripts/controls/COL-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#col-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Data handling on unmanaged devices matches the agreed control design across tested clients. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

**Falsifying probe (authorized test or evidence challenge):** Attempt a download or synchronization from an unapproved test device after browser access is permitted. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

**Remediation direction:** Align access and app controls; pilot restrictions to avoid blocking legitimate collaboration. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

### COL-05 — Leaver content, versioning and restoration

**Objective:** Preserve business content while retiring access. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Applicability:** OneDrive and SharePoint ownership changes and deletions. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Proposed accountable owner:** Collaboration and records owners. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Leaver handover; retention and holds; version settings; recycle/restore records; ownership transfer. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Audit procedure (consultant method):** Sample departed owners and deleted content. Confirm approved transfer, removal of sharing and preservation obligations. Perform recovery testing on synthetic items; document what version or recycle mechanisms cannot restore. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Read-only execution — Leaver content, versioning and restoration:** [COL-05.ps1](../scripts/controls/COL-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#col-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Content remains available to authorized successors for the required period and recovery outcomes are demonstrated. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Pick a leaver whose data remains shared externally or whose required content cannot be recovered. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Remediation direction:** Fix handover and preservation sequencing; add appropriate backup or export coverage. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)


## Teams

### TEAM-01 — External, guest and shared-channel paths

**Objective:** Assess every distinct route for external collaboration. [S29: Teams guest access and external access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

**Applicability:** All Teams tenants. [S29: Teams guest access and external access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

**Proposed accountable owner:** Teams and identity leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** External-access settings; guest settings; channel policies; B2B direct connect; team/channel membership. [S29: Teams guest access and external access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

**Audit procedure (consultant method):** Review federation, guest membership and shared channels as separate mechanisms. Reconcile shared-channel users with partner trust and channel sites. Test allowed and disallowed partner scenarios using controlled identities. [S29: Teams guest access and external access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

**Read-only execution — External, guest and shared-channel paths:** [TEAM-01.ps1](../scripts/controls/TEAM-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#team-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Each collaboration path matches approved partner relationships; closing one path does not leave another unexplained. [S29: Teams guest access and external access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

**Falsifying probe (authorized test or evidence challenge):** A guest-free team still has external shared-channel participants; inspect whether they were considered. [S29: Teams guest access and external access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

**Remediation direction:** Narrow policies and trust while documenting legitimate partner use. [S29: Teams guest access and external access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S29: Teams guest access and external access](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

### TEAM-02 — Meeting, recording and transcript exposure

**Objective:** Protect sensitive meetings and their persistent artifacts. [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Applicability:** Meetings, webinars, town halls and calling where applicable. [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Proposed accountable owner:** Teams and data owners. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Meeting policies/templates; labels; lobby/presenter settings; recordings/transcripts permissions; retention. [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Audit procedure (consultant method):** Define meeting tiers and test organizer/attendee behavior. Inspect who can join, present, record, transcribe and retrieve artifacts afterward. Reconcile retention with recording expiration; verify actual license support. [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Read-only execution — Meeting, recording and transcript exposure:** [TEAM-02.ps1](../scripts/controls/TEAM-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#team-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Sensitive meetings and artifacts have the intended audience and lifecycle; recommended defaults are tailored to business use. [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Falsifying probe (authorized test or evidence challenge):** Join a controlled sensitive meeting as an uninvited identity or access its recording URL afterward. [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Remediation direction:** Correct organizer assignments, meeting controls and artifact permissions; train owners. [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### TEAM-03 — Applications, bots and integrations

**Objective:** Control third-party and custom extensions in collaboration. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Applicability:** Teams applications, bots, tabs, webhooks and agents. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Proposed accountable owner:** Teams and application security leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** App catalog; allowed users; permissions; publisher review; app owners; activity. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Audit procedure (consultant method):** Review app approval and availability, actual grants and data transfer. Sample custom apps and bots that act across channels. Check whether removal from Teams also resolves relevant backend access and credentials. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Read-only execution — Applications, bots and integrations:** [TEAM-03.ps1](../scripts/controls/TEAM-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#team-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Every enabled integration has reviewed permissions, accountable ownership and an offboarding path. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Falsifying probe (authorized test or evidence challenge):** Remove an app from a test team's interface and check whether its service principal still has data access. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Remediation direction:** Align catalog governance with app permission lifecycle and vendor review. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### TEAM-04 — Team ownership, channel sites and telephony

**Objective:** Capture operational dependencies beyond chat settings. [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Applicability:** Teams; telephony and meeting rooms when deployed. [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Proposed accountable owner:** Teams service owner. **Suggested priority:** P2. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Owners; lifecycle decisions; private/shared channel sites; room accounts; voice routing and support plans. [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Audit procedure (consultant method):** Review owner redundancy and project closure. Reconcile channel sites with retention and backup scope. For voice, examine number ownership, emergency-calling design, carrier dependencies and authorized toll usage with telecom specialists. [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Read-only execution — Team ownership, channel sites and telephony:** [TEAM-04.ps1](../scripts/controls/TEAM-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#team-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Teams-related resources and voice dependencies are owned and included in appropriate operational and recovery plans. [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Ask who can restore a room account or recover an orphaned shared-channel artifact during an outage. [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Remediation direction:** Assign ownership and add workload-specific operational tests; qualify any unaudited telephony features. [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S31: Teams meetings with three tiers of protection](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)


## Endpoints and applications

### END-01 — Device population and management coverage

**Objective:** Establish the real denominator for endpoint assurance. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Applicability:** Corporate, BYOD, privileged, shared and virtual devices. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Proposed accountable owner:** Endpoint lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Asset/HR roster; Entra devices; Intune inventory; Defender inventory; last-seen times. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Audit procedure (consultant method):** Join inventories by stable identifiers and investigate unmatched assets. Separate registered, enrolled, compliant and protected states. Include macOS, mobile and Linux where deployed; identify duplicate/stale records and unsupported systems. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Read-only execution — Device population and management coverage:** [END-01.ps1](../scripts/controls/END-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#end-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** All business devices are accounted for with an approved management model; unmanaged assets remain in the risk denominator. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Falsifying probe (authorized test or evidence challenge):** Compare a recent sign-in device against the inventory marked fully managed. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Remediation direction:** Enroll or otherwise protect missing assets; correct discovery and inventory ownership. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

### END-02 — Compliance and access enforcement

**Objective:** Ensure device health meaningfully affects access. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Applicability:** Tenants using compliance-based access controls. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Proposed accountable owner:** Endpoint and identity leads. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Compliance policies; assignment/filter results; no-policy setting; grace periods; last check-in; access logs. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Audit procedure (consultant method):** Inspect tenant-wide treatment of devices without assigned policies, platform-specific assignments and stale-state handling. Test compliant, noncompliant, unassigned and grace-period devices against protected resources. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Read-only execution — Compliance and access enforcement:** [END-02.ps1](../scripts/controls/END-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#end-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Observed access follows the approved device trust policy; enrollment or a policy object alone does not establish protection. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Falsifying probe (authorized test or evidence challenge):** Use an unassigned or stale device that appears compliant in an aggregate dashboard. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Remediation direction:** Correct default treatment, assignments and access integration; test supported platform behavior. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### END-03 — Security baseline and local privilege

**Objective:** Verify effective hardening on representative endpoints. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Applicability:** Managed endpoints and privileged workstations. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Proposed accountable owner:** Endpoint security lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Baseline versions; settings catalog; assignment conflicts; local administrators; firewall; encryption status; recovery-key access. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Audit procedure (consultant method):** Sample platform and build cohorts. Reconcile baseline and other management sources; inspect effective settings on devices. Check encryption, local admin control, recovery-key custody, firewall and attack-surface rules against adopted platform requirements. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Read-only execution — Security baseline and local privilege:** [END-03.ps1](../scripts/controls/END-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#end-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required settings are effective, exceptions are approved and recovery access is controlled. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Falsifying probe (authorized test or evidence challenge):** Select a device with conflicting policy sources or an old baseline version. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Remediation direction:** Resolve conflicts and stale profiles; deploy in rings with application compatibility and recovery testing. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

### END-04 — Endpoint detection and response health

**Objective:** Confirm sensors and response workflows work beyond onboarding. [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Applicability:** Defender for Endpoint/Business or equivalent endpoint protection. [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Proposed accountable owner:** SOC and endpoint leads. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Sensor health; last telemetry; antivirus/tamper state; exclusions; alert history; response records. [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Audit procedure (consultant method):** Reconcile protection inventory with devices. Inspect unhealthy sensors, broad exclusions and response access. Use an approved vendor benign validation procedure on a test endpoint and trace the alert to the assigned responder. [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Read-only execution — Endpoint detection and response health:** [END-04.ps1](../scripts/controls/END-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#end-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Coverage and sensor health are measured against the real fleet; the response team receives and handles test telemetry. [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Falsifying probe (authorized test or evidence challenge):** A device is onboarded but stops transmitting or has an exclusion covering its user profile. [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Remediation direction:** Repair telemetry, exclusions and response routing; investigate unexplained protection changes. [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

### END-05 — Patch, application and browser lifecycle

**Objective:** Reduce exposure from unsupported software and unsafe client configuration. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Applicability:** Operating systems, Office clients, browsers and add-ins. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Proposed accountable owner:** Endpoint operations. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Version inventory; update rings; deployment errors; vulnerability backlog; macro/add-in controls; exceptions. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Audit procedure (consultant method):** Compare deployed versions with currently supported vendor releases. Sample failed updates and long-lived exceptions. Review Office/browser extensions and document handling against the adopted baseline, including business macros. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Read-only execution — Patch, application and browser lifecycle:** [END-05.ps1](../scripts/controls/END-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#end-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Update and application controls meet approved SLAs with validated exceptions and accountable remediation. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Falsifying probe (authorized test or evidence challenge):** Find a device reporting successful policy assignment but repeatedly failing installation. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Remediation direction:** Repair deployment failures and unsupported dependencies; validate business applications in pilot rings. [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S34: Manage Intune security baseline profiles](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

### END-06 — BYOD and application data protection

**Objective:** Protect organizational data in permitted unmanaged-device scenarios. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Applicability:** Intune app protection or equivalent mobile/application controls. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Proposed accountable owner:** Endpoint and privacy leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** App protection assignments; managed-app inventory; copy/save restrictions; conditional launch; wipe procedure. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Audit procedure (consultant method):** Test supported apps and platforms using synthetic data, including personal-account transfer and offline conditions. Confirm restrictions attach to the correct user and app, and assess selective removal without affecting personal content. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Read-only execution — BYOD and application data protection:** [END-06.ps1](../scripts/controls/END-06.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#end-06). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Approved app data remains within intended boundaries and a controlled selective-wipe exercise succeeds. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Falsifying probe (authorized test or evidence challenge):** Try moving a test document to a personal app on an unenrolled device. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Remediation direction:** Correct app/user targeting and unsupported-client paths; document privacy and support procedures. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)


## Information protection and compliance

### DATA-01 — Data discovery and classification

**Objective:** Locate sensitive information and assign protection requirements. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

**Applicability:** All enabled workloads and connected repositories. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

**Proposed accountable owner:** Data governance lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Data inventory; classification standard; discovery results; owner validation; external repositories. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

**Audit procedure (consultant method):** Reconcile automated discovery with business interviews and sampled content. Cover mail, files, chats, recordings, Power Platform and analytics. Use synthetic or minimized data to test classifiers and document uninspectable/encrypted formats. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

**Read-only execution — Data discovery and classification:** [DATA-01.ps1](../scripts/controls/DATA-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#data-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Sensitive data classes, locations and owners are known; blind spots are recorded and prioritized. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

**Falsifying probe (authorized test or evidence challenge):** Select a business-critical repository omitted from discovery or a representative format the classifier misses. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

**Remediation direction:** Expand inventory and classifier validation; assign owners and appropriate compensating controls. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

### DATA-02 — Sensitivity labels and encryption

**Objective:** Verify classification causes the intended protection. [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Applicability:** Purview labeling where licensed; equivalent controls elsewhere. [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Proposed accountable owner:** Information protection lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Label definitions; published policies; assignments; encryption settings; downgrade logs; test documents. [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Audit procedure (consultant method):** Distinguish labels on files/emails from group/site labels. Test allowed and denied recipients, offline use, supported clients and external collaboration. Check downgrade justification and access recovery procedures. [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Read-only execution — Sensitivity labels and encryption:** [DATA-02.ps1](../scripts/controls/DATA-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#data-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required information has effective protection with demonstrated recipient behavior; a labeled container does not prove files are encrypted. [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Falsifying probe (authorized test or evidence challenge):** Copy a document from a labeled site and inspect its own protection and accessibility. [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Remediation direction:** Correct label scope and publication; pilot encryption against real collaboration dependencies. [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### DATA-03 — DLP effectiveness and exception handling

**Objective:** Prevent or detect prohibited information transfer as designed. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Applicability:** Each licensed DLP location and adopted data class. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Proposed accountable owner:** DLP owner and SOC. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Policies/rules; locations; simulation/enforcement state; exclusions; incidents; overrides; test records. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Audit procedure (consultant method):** Map scenarios to locations and rules. Use synthetic examples with required context and confidence thresholds; include negative controls. Test actions, notifications, overrides and incident routing. Review excluded identities and endpoints. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Read-only execution — DLP effectiveness and exception handling:** [DATA-03.ps1](../scripts/controls/DATA-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#data-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The approved prevention/detection objective operates for the tested scenarios; simulation does not satisfy an enforcement requirement. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Falsifying probe (authorized test or evidence challenge):** Trigger the same synthetic transfer from an excluded user or a location not selected in the policy. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Remediation direction:** Close coverage gaps and tune false positives before enforcement; verify incident ownership. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

### DATA-04 — Retention, records and disposition

**Objective:** Preserve and delete information according to approved requirements. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Applicability:** All workloads with retention or records obligations. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Proposed accountable owner:** Records manager. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Approved schedule; retention policies/labels; scope; holds; policy lookup; disposition evidence. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Audit procedure (consultant method):** Map each record class and workload to duration and trigger. Inspect overlapping controls, held content, distribution errors and locations not covered. Test a short-lived synthetic lifecycle in an approved environment; assess storage and deletion effects. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Read-only execution — Retention, records and disposition:** [DATA-04.ps1](../scripts/controls/DATA-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#data-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Implemented rules match the approved schedule; conflicting holds and irreversible settings are understood and authorized. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Falsifying probe (authorized test or evidence challenge):** Select an item under multiple retention settings and demonstrate its actual disposition outcome. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Remediation direction:** Correct scope and precedence with legal approval; treat preservation locks and hold releases as separate changes. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

### DATA-05 — eDiscovery and investigation readiness

**Objective:** Prove authorized investigators can preserve, search and export relevant evidence. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Applicability:** Organizations with litigation, investigation or regulatory needs. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Proposed accountable owner:** Legal and eDiscovery lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Case membership; roles; hold/search status; export logs; chain of custody; encrypted-content limitations. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Audit procedure (consultant method):** Run an approved synthetic case from identification to hold, search and export. Record selected custodians and workload locations, failures and export hashes. Verify unauthorized staff cannot enter the case; use the current supported experience. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Read-only execution — eDiscovery and investigation readiness:** [DATA-05.ps1](../scripts/controls/DATA-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#data-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The workflow is complete, access-controlled and reproducible, with explicit coverage and processing limitations. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Falsifying probe (authorized test or evidence challenge):** Place the test artifact in a location omitted by the search and assess whether the team detects the omission. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Remediation direction:** Fix case scoping, roles and export procedures; train investigators on current tooling. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

### DATA-06 — Privacy, insider risk and compliance ownership

**Objective:** Prevent sensitive monitoring and regulatory work from becoming ungoverned access. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Applicability:** Privacy requests, insider risk, communication compliance and related licensed tools. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Proposed accountable owner:** Privacy and compliance officers. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Approved purposes; investigator roles; minimization rules; cases; assessments; legal hold exceptions. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Audit procedure (consultant method):** Review why data is collected, who can inspect it and how long it remains. Sample a request or investigation from intake to closure. Validate human review of automated indicators and separation of sensitive roles. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Read-only execution — Privacy, insider risk and compliance ownership:** [DATA-06.ps1](../scripts/controls/DATA-06.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#data-06). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Monitoring and requests follow approved purpose, access and review rules; legal exceptions and uncertainty are documented. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Falsifying probe (authorized test or evidence challenge):** Find an investigator who can access unrelated cases or an automated flag treated as a concluded violation. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Remediation direction:** Narrow case access and strengthen review, minimization and documented legal decisions. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

### DATA-07 — Customer-managed encryption and support access

**Objective:** Evaluate enhanced data-control features against actual requirements. [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [S82: Customer Lockbox](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Applicability:** Customer Key, Customer Lockbox or comparable contractual controls where required. [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [S82: Customer Lockbox](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Proposed accountable owner:** Security architecture and key custodian. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Key hierarchy; vault permissions; rotation/recovery; data encryption policies; Lockbox roles and request logs. [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [S82: Customer Lockbox](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Audit procedure (consultant method):** Determine whether the organization requires these features before assessing deployment. Distinguish service encryption, content encryption and support-access approval. Review supported workloads and recovery dependencies; tabletop key loss without deleting keys. [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [S82: Customer Lockbox](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Read-only execution — Customer-managed encryption and support access:** [DATA-07.ps1](../scripts/controls/DATA-07.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#data-07). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required controls are licensed, scoped, operationally owned and recoverable; feature names are not treated as interchangeable. [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [S82: Customer Lockbox](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Falsifying probe (authorized test or evidence challenge):** A support-approval control is presented as customer-controlled encryption or a key cannot be recovered. [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [S82: Customer Lockbox](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Remediation direction:** Correct the architecture and evidence; test key recovery through a controlled nonproduction procedure. [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [S82: Customer Lockbox](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [S82: Customer Lockbox](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)


## Audit logging and evidence

### LOG-01 — Audit ingestion and event visibility

**Objective:** Demonstrate required activities are recorded and retrievable. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

**Applicability:** All tenants, including business subscriptions and trials. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

**Proposed accountable owner:** Audit platform owner. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** UAL ingestion state; tenant license; event catalog; successful known-event query; errors. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

**Audit procedure (consultant method):** Read ingestion status in the Exchange Online context. Identify required operations by workload. Trace a permitted known action using UTC time, actor and object; record ingestion delay, permissions and missing events separately. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

**Read-only execution — Audit ingestion and event visibility:** [LOG-01.ps1](../scripts/controls/LOG-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#log-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** A known required event is searchable with the necessary fields; a default-setting assumption or empty query is insufficient. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

**Falsifying probe (authorized test or evidence challenge):** A successful query returns no known event, or access denied is incorrectly interpreted as no activity. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

**Remediation direction:** Resolve collection, entitlement, time-window or role gaps; preserve the limitation until retested. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

### LOG-02 — Retention by source, user and workload

**Objective:** Ensure investigation history meets business requirements. [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Applicability:** Entra logs, Purview UAL, Defender, SIEM and third-party sources. [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Proposed accountable owner:** SOC and records owners. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Retention matrix; user licenses; custom audit policies; archive settings; oldest retrievable records. [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Audit procedure (consultant method):** For each source, document required history and actual entitlement/configuration. Review user-specific premium coverage and policy priority. Query historical known records and distinguish source retention from search-job history. [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Read-only execution — Retention by source, user and workload:** [LOG-02.ps1](../scripts/controls/LOG-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#log-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required history is retrievable from a protected source, or a dated gap is reported; retention is never inferred from a single tenant license. [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Falsifying probe (authorized test or evidence challenge):** Try retrieving a guest or non-premium user's older event using a premium retention claim. [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Remediation direction:** Align licensed coverage, policies and export/archive; do not imply an upgrade restores expired logs. [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

### LOG-03 — Collection completeness and pipeline health

**Objective:** Detect silently incomplete exports and logging interruptions. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

**Applicability:** API, PowerShell, SIEM and scheduled audit collection. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

**Proposed accountable owner:** Security engineering. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Query parameters; next links; counts; cap indicators; retries; collector health; source/destination timestamps. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

**Audit procedure (consultant method):** Reconcile population and event counts. Follow all pages, partition capped windows and de-duplicate stable event IDs. Check throttling, connector failures, ingestion latency, authentication expiry and alerting on collector outage. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

**Read-only execution — Collection completeness and pipeline health:** [LOG-03.ps1](../scripts/controls/LOG-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#log-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Exports have documented completeness bounds and pipeline outages are detectable; unknown portions remain unassessed. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

**Falsifying probe (authorized test or evidence challenge):** Use a window larger than one page or a deliberately interrupted test collector. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

**Remediation direction:** Add completion accounting, bounded retries and outage alerts; rerun incomplete intervals. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps); [S61: ScubaGear v1.8.0 reports](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/execution/reports.md)

### LOG-04 — Evidence integrity and privileged access

**Objective:** Keep collected evidence authentic, restricted and usable. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Applicability:** Audit exports, incident data and investigation records. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Proposed accountable owner:** Evidence custodian. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Evidence register; hashes; collection context; access logs; retention; encryption and disposal records. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Audit procedure (consultant method):** Inspect raw-versus-working copies and storage permissions. Recompute a sample hash; trace transfers and modifications. Confirm collected data is proportionate and never stored in a public methodology repository. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Read-only execution — Evidence integrity and privileged access:** [LOG-04.ps1](../scripts/controls/LOG-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#log-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Another authorized reviewer can reproduce provenance and detect changed evidence; access and disposal are controlled. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Falsifying probe (authorized test or evidence challenge):** Modify a working copy and verify it is distinguishable from the preserved original. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Remediation direction:** Use protected originals, immutable records where required and documented handling procedures. [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S06: NIST SP 800-53A Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/a/r5/final); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components); [S61: ScubaGear v1.8.0 reports](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/execution/reports.md)

### LOG-05 — Alerts for sensitive configuration changes

**Objective:** Detect changes that weaken controls or evidence. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Applicability:** Identity, apps, mail, sharing, logging and backup. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Proposed accountable owner:** SOC lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Detection rules; required source events; test alerts; tickets; response ownership. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Audit procedure (consultant method):** Select high-impact changes: role grant, credential addition, forwarding, consent, logging disablement and backup changes. Trace approved benign events through detection, routing, acknowledgement and escalation. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Read-only execution — Alerts for sensitive configuration changes:** [LOG-05.ps1](../scripts/controls/LOG-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#log-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Selected changes generate actionable alerts within approved timing or have an explicit monitored alternative. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Make an authorized test configuration change whose audit event exists but alert does not. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Remediation direction:** Repair detection logic and source dependencies; verify response ownership and repeat. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)


## Detection and incident response

### SOC-01 — Cross-workload detection coverage

**Objective:** Validate visibility for realistic compromise sequences. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Applicability:** Defender XDR, Sentinel or equivalent SOC tooling. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Proposed accountable owner:** SOC lead. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Detection matrix; connectors; telemetry; incidents; case ownership; suppression rules. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Audit procedure (consultant method):** Map identity compromise, malicious consent, mailbox abuse and data access to available telemetry. Sample cases across identity, email and endpoint. Review suppressions and integration failures, including outsourced SOC responsibilities. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Read-only execution — Cross-workload detection coverage:** [SOC-01.ps1](../scripts/controls/SOC-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#soc-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The SOC can correlate material events and explain uncovered stages; licenses or installed tools alone are insufficient. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Falsifying probe (authorized test or evidence challenge):** Trace a consent-related incident that has no linked mailbox or file access investigation. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Remediation direction:** Close telemetry and workflow gaps; document uncovered scenarios and compensating monitoring. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

### SOC-02 — Account and token compromise exercise

**Objective:** Verify containment and evidence preservation are timely. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Applicability:** All tenants. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Proposed accountable owner:** Incident commander. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Response runbook; emergency contacts; timing records; affected account/app/device evidence. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Audit procedure (consultant method):** Tabletop or rehearse with test identities: detect compromise, preserve evidence, isolate relevant access, remove persistence and verify restoration. Include application sessions and malicious grants so password reset is not the only action. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Read-only execution — Account and token compromise exercise:** [SOC-02.ps1](../scripts/controls/SOC-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#soc-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The team can execute authorized containment and confirm remaining access paths within its approved objectives. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Falsifying probe (authorized test or evidence challenge):** An existing application session or grant survives the assumed complete reset. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Remediation direction:** Update containment paths, authority and verification steps; retest dependencies. [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

### SOC-03 — Phishing and malicious app response

**Objective:** Test intake, scoping, containment and communication. [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Applicability:** Email and OAuth-enabled collaboration. [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Proposed accountable owner:** SOC and messaging leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** User reporting path; message traces; consent inventory; investigation tickets; response approvals. [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Audit procedure (consultant method):** Use a synthetic report or historical sanitized incident. Identify recipients, interaction, account activity, grants and affected data. Verify escalation to identity/app owners and documented closure evidence; separate real incidents from audit observations. [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Read-only execution — Phishing and malicious app response:** [SOC-03.ps1](../scripts/controls/SOC-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#soc-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Responders can scope and close the scenario with evidence and appropriate business communication. [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Falsifying probe (authorized test or evidence challenge):** The email is removed but a malicious consent grant remains active. [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Remediation direction:** Integrate mail and app investigation steps; verify persistence removal and recurrence monitoring. [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

### SOC-04 — Response authority and evidence readiness

**Objective:** Keep response possible during compromise of ordinary communication. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Applicability:** Every organization, including managed service arrangements. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Proposed accountable owner:** Business continuity and SOC leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Incident contacts; decision rights; alternate communications; legal/privacy escalation; evidence access. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Audit procedure (consultant method):** Test contact availability and who can authorize disruptive containment. Check support-provider SLAs and evidence access during tenant outage. Review notification decisions with the responsible legal team rather than inventing deadlines. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Read-only execution — Response authority and evidence readiness:** [SOC-04.ps1](../scripts/controls/SOC-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#soc-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Authority, alternate communications and evidence access are executable and documented. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Assume Teams and the primary admin account are unavailable; initiate the response process. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Remediation direction:** Establish independent communication and emergency access; rehearse the chain of command. [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)


## Resilience and recovery

### REC-01 — Business recovery requirements and coverage

**Objective:** Identify exactly what must be recoverable and by when. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Applicability:** Every workload and critical integration. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Proposed accountable owner:** Business continuity owner. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Business impact analysis; RTO/RPO; data inventory; backup/service coverage; exclusions. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Audit procedure (consultant method):** Define recovery units and dependencies for mail, files, sites, chats, configurations, apps and keys. Reconcile protection scope against the inventory. Distinguish provider availability from customer data restoration and tenant reconstruction. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Read-only execution — Business recovery requirements and coverage:** [REC-01.ps1](../scripts/controls/REC-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#rec-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Each critical service has approved objectives, an accountable recovery method and explicit uncovered objects. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Ask how to recover an app configuration or chat object when the selected backup covers only mail and files. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Remediation direction:** Add recovery methods for uncovered objects or obtain an explicit risk decision. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### REC-02 — Timed restore and integrity exercise

**Objective:** Measure actual recovery capability. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Applicability:** Protected mailboxes, sites, files and other required assets. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Proposed accountable owner:** Recovery operator and business owner. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Backup health; restore points; exercise timings; hashes/item counts; permissions; owner acceptance. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Audit procedure (consultant method):** Restore representative synthetic content to an approved isolated destination. Measure from declared recovery start to business acceptance; record data age, errors, permissions and prerequisites. Include one bulk or dependency-rich scenario where required. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Read-only execution — Timed restore and integrity exercise:** [REC-02.ps1](../scripts/controls/REC-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#rec-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Measured RTO/RPO and integrity meet approved requirements for the tested scope; configuration alone is not operational proof. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Restore succeeds technically but essential permissions or the latest required data are missing. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Remediation direction:** Repair coverage/procedure and repeat the failed scenario; qualify untested scale. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

### REC-03 — Backup administration and destructive change

**Objective:** Protect recovery capability from the same compromise as production. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

**Applicability:** Native or third-party backup platforms. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

**Proposed accountable owner:** Recovery security owner. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Backup roles; credential separation; deletion/offboarding controls; notifications; change logs. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

**Audit procedure (consultant method):** Review who can alter coverage, retention or recovery data. Inspect destructive-change safeguards and monitoring. Tabletop a compromised production admin and a lost backup credential; examine retention/deletion behavior for the actual platform. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

**Read-only execution — Backup administration and destructive change:** [REC-03.ps1](../scripts/controls/REC-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#rec-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Recovery remains governed and observable during administrator compromise; architecture-specific limitations are acknowledged. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

**Falsifying probe (authorized test or evidence challenge):** Trace whether the same unmanaged identity can destroy production and every usable recovery path. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

**Remediation direction:** Separate authority where supported and strengthen notifications, custody and recovery procedures. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

### REC-04 — Tenant configuration and service outage recovery

**Objective:** Restore service dependencies beyond content. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

**Applicability:** Identity, DNS, connectors, policy configuration and external vendors. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

**Proposed accountable owner:** Platform and continuity owners. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Configuration exports; architecture; dependencies; certificates; support plans; outage exercise. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

**Audit procedure (consultant method):** Identify rebuild sequence, credential access and trusted recovery copies. Rehearse a service or dependency outage without destructive production testing. Confirm staff can access runbooks and support channels outside the affected tenant. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

**Read-only execution — Tenant configuration and service outage recovery:** [REC-04.ps1](../scripts/controls/REC-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#rec-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The organization has a tested dependency-aware recovery sequence and accessible recovery information. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

**Falsifying probe (authorized test or evidence challenge):** Make the primary tenant unavailable in the exercise and request its emergency runbook. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

**Remediation direction:** Store controlled recovery material independently and test reconstruction in a suitable lab. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)


## Copilot and agent governance

### AI-01 — AI inventory and approved data flows

**Objective:** Identify AI experiences and their distinct permissions and data handling. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Applicability:** Copilot, Copilot Chat, custom agents, extensions and third-party AI. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Proposed accountable owner:** AI governance lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** AI inventory; licensing; owners; connectors; models/providers; data-flow diagrams; approved use cases. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Audit procedure (consultant method):** Distinguish enterprise experiences from consumer services and extensions. Record grounding sources, actions, identities, external endpoints, retention and feature availability. Review material changes against the actual service documentation. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Read-only execution — AI inventory and approved data flows:** [AI-01.ps1](../scripts/controls/AI-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ai-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Each AI use case has a defined owner, data boundary and approved action scope; one product's commitments are not assumed to cover every extension. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Falsifying probe (authorized test or evidence challenge):** Find an agent sending content to an external action absent from the architecture. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Remediation direction:** Document and constrain data flows; approve extensions against their actual terms and controls. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

### AI-02 — Oversharing and discovery restrictions

**Objective:** Verify AI cannot expose data beyond approved business access. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

**Applicability:** AI grounded in Microsoft 365 content. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

**Proposed accountable owner:** Data and AI governance owners. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Sensitive-site access; broad memberships; discovery controls; synthetic prompts; direct access results. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

**Audit procedure (consultant method):** Test approved personas with seeded synthetic documents. Compare direct file access, search discovery and AI retrieval separately. Inspect broad permissions and temporary discovery controls; do not infer protection from a single unsuccessful prompt. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

**Read-only execution — Oversharing and discovery restrictions:** [AI-02.ps1](../scripts/controls/AI-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ai-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Authorization aligns with business intent; discoverability controls have a documented purpose and do not substitute for permission repair. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

**Falsifying probe (authorized test or evidence challenge):** Use a direct URL to access a restricted-discovery document with an overprivileged test account. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

**Remediation direction:** Repair permissions and sharing first; retest representative retrieval and direct access paths. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

### AI-03 — Agent tools, identity and adversarial behavior

**Objective:** Constrain agent actions under untrusted inputs. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

**Applicability:** Agents with connectors, actions, MCP servers or write capabilities. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

**Proposed accountable owner:** Agent/application owner. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Tool inventory; runtime identity; grants; approved action list; logs; review gates; test transcripts. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

**Audit procedure (consultant method):** In a controlled environment, supply synthetic instructions embedded in untrusted content and ask for an out-of-scope action. Inspect whether the agent's credential can perform it, whether confirmation is enforced and whether actions are logged. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

**Read-only execution — Agent tools, identity and adversarial behavior:** [AI-03.ps1](../scripts/controls/AI-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ai-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Sensitive actions are bounded by authorization and independently testable safeguards; model refusal alone is insufficient evidence. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

**Falsifying probe (authorized test or evidence challenge):** The model declines verbally but its tool credential can still execute an unauthorized operation. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

**Remediation direction:** Narrow tools and grants, add deterministic checks and human approval for defined consequential actions. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

### AI-04 — AI auditability, retention and incident handling

**Objective:** Make AI use governable throughout its lifecycle. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Applicability:** Every approved AI experience. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Proposed accountable owner:** AI, records and SOC owners. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Prompt/response handling; event coverage; retention; investigation procedures; cost/usage and feedback. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Audit procedure (consultant method):** Identify which events and artifacts exist for each experience and license. Test synthetic interaction retrieval and permitted investigation access; review external extension logs and output handling. Confirm an owner handles inaccurate or sensitive outputs. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Read-only execution — AI auditability, retention and incident handling:** [AI-04.ps1](../scripts/controls/AI-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ai-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Required AI evidence is discoverable with appropriate privacy controls; documented gaps feed the risk register. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Falsifying probe (authorized test or evidence challenge):** Ask investigators to recover a known agent action whose logs exist only in an unowned external service. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Remediation direction:** Integrate evidence collection and incident processes; constrain unobservable high-risk actions. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)


## Power Platform

### PP-01 — Environment and maker governance

**Objective:** Prevent uncontrolled business applications and flows. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Applicability:** Power Apps, Power Automate, Dataverse and Copilot Studio. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Proposed accountable owner:** Power Platform lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Environment inventory; default environment; makers/admins; owners; capacity; production classification. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Audit procedure (consultant method):** Reconcile apps, flows and agents to business owners. Inspect who can create environments, use premium features and share applications. Include orphaned resources, personal connections, unmanaged production and acquisition remnants. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Read-only execution — Environment and maker governance:** [PP-01.ps1](../scripts/controls/PP-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#pp-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Resources have accountable owners, appropriate environment placement and governed creation/sharing. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Falsifying probe (authorized test or evidence challenge):** Identify a business-critical flow owned solely by a departed employee. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Remediation direction:** Transfer ownership and connections safely; separate production lifecycle and govern maker access. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

### PP-02 — Connector and data policy effectiveness

**Objective:** Control prohibited data movement through low-code applications. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

**Applicability:** Classic data policies and advanced connector policies where available. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

**Proposed accountable owner:** Power Platform security owner. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Policy exports; environment scope; exemptions; connector classifications; modes; test apps/flows. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

**Audit procedure (consultant method):** Identify which policy model actually applies. Review new connector defaults, custom connectors, HTTP/MCP actions and environment exclusions. Test allowed and forbidden connector combinations at design and runtime; verify current limitations. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

**Read-only execution — Connector and data policy effectiveness:** [PP-02.ps1](../scripts/controls/PP-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#pp-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** The chosen model enforces the approved flows for covered environments; unsupported/nonblockable cases are explicit. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

**Falsifying probe (authorized test or evidence challenge):** A classic policy classifies a connector as non-business but still permits a forbidden business process. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

**Remediation direction:** Apply supported controls and scope; consider advanced policies only after feature and impact validation. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

### PP-03 — Connections, application permissions and release control

**Objective:** Prevent low-code automation from becoming an unreviewed privileged service. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Applicability:** Production apps, flows and agent actions. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Proposed accountable owner:** Application and platform owners. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Connections; service principals; run-only users; sharing; solution releases; secrets metadata; run histories. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Audit procedure (consultant method):** Trace the identity and permissions used by sensitive flows. Review who can edit versus invoke, approval steps and source control. Test a forbidden invocation using a controlled low-privilege user. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Read-only execution — Connections, application permissions and release control:** [PP-03.ps1](../scripts/controls/PP-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#pp-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Runtime permissions and invocation scope match the business need; editable automations cannot bypass approval unnoticed. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Falsifying probe (authorized test or evidence challenge):** A broadly shared flow runs a privileged action using its owner's connection. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Remediation direction:** Scope invocation and connections; add release review and monitored approval logic. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### PP-04 — Operational resilience and data accountability

**Objective:** Ensure business automation remains recoverable and observable. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Applicability:** Critical Power Platform solutions and Dataverse data. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Proposed accountable owner:** Power Platform operations. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Failure alerts; solution inventory; backups/exports; environment recovery plan; capacity/cost; incident records. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Audit procedure (consultant method):** Trace a failed critical flow to notification and recovery. Verify solution and data protection separately, connection reauthorization and dependency restoration. Check retention, audit coverage and environment deletion authority. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Read-only execution — Operational resilience and data accountability:** [PP-04.ps1](../scripts/controls/PP-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#pp-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Critical solutions can be operated and recovered against documented objectives; content backup claims explicitly cover these workloads. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Recover a test solution and discover its connections or external dependencies cannot be restored. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Remediation direction:** Document and test full recovery, including reauthorization and secrets custody. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S06: NIST SP 800-53A Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/a/r5/final)


## Fabric and Power BI

### FAB-01 — Public publishing and external sharing

**Objective:** Prevent unintended public or cross-tenant disclosure. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

**Applicability:** Fabric and Power BI tenants. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

**Proposed accountable owner:** Analytics security owner. **Suggested priority:** P0. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Tenant settings; scoped groups; Publish to web embed inventory; external sharing; export controls. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

**Audit procedure (consultant method):** Review existing public embeds as well as future publishing permissions. Inspect sensitive reports, underlying models and scoped tenant exceptions. Validate access using an unauthenticated browser on synthetic content only. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

**Read-only execution — Public publishing and external sharing:** [FAB-01.ps1](../scripts/controls/FAB-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#fab-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Only approved public material is publicly accessible; existing embeds and underlying data are assessed. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

**Falsifying probe (authorized test or evidence challenge):** A report has no public dashboard link but an old Publish to web embed remains active. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

**Remediation direction:** Remove unauthorized embeds and constrain publishing/export paths; assess exposure through incident procedures. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

### FAB-02 — Workspace and semantic data permissions

**Objective:** Verify effective access across report, model and data sources. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Applicability:** Workspaces, semantic models, apps, gateways and service principals. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Proposed accountable owner:** Analytics data owner. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Workspace roles; sharing; model permissions; row/object-level design; identities; gateway connections. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Audit procedure (consultant method):** Map representative personas through report and model access to underlying sources. Test restricted data using the actual assigned role; do not assume viewer controls apply to privileged editors. Review gateway and service identity custody. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Read-only execution — Workspace and semantic data permissions:** [FAB-02.ps1](../scripts/controls/FAB-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#fab-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Users and service principals can access only the data/actions approved for their role, demonstrated by positive and negative tests. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Falsifying probe (authorized test or evidence challenge):** Test a restricted persona with additional workspace privileges that alter the expected boundary. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Remediation direction:** Narrow roles and model access; retest at each data boundary. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

### FAB-03 — Analytics governance and continuity

**Objective:** Govern exports, ownership, refresh and recovery of analytics. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Applicability:** Business-critical analytics and Fabric workloads. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Proposed accountable owner:** Analytics operations. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Owners; classification; source lineage; refresh failures; capacity; labels; deployment/recovery records. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Audit procedure (consultant method):** Trace critical reports to data sources, gateway credentials and owners. Review exports and external storage; test refresh failure notification and recovery of definitions/configuration. Assess data retention separately from report artifacts. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Read-only execution — Analytics governance and continuity:** [FAB-03.ps1](../scripts/controls/FAB-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#fab-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Critical analytics has accountable ownership, governed data movement and a tested recovery path. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** A dashboard is available but silently stale because its owner's credential expired. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Remediation direction:** Repair service identity and freshness monitoring; preserve deployment artifacts and test rebuild. [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)


## Operations and service management

### OPS-01 — Health, change and lifecycle management

**Objective:** Keep service changes and outages from creating untracked risk. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Applicability:** All Microsoft 365 services and external dependencies. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Proposed accountable owner:** Service management lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Service health; Message center actions; release tracking; change records; support escalation. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Audit procedure (consultant method):** Sample a recent service change, deprecation and outage. Verify impact analysis, assigned actions, communication and closure. Review preview features and automatically enabled services against governance. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Read-only execution — Health, change and lifecycle management:** [OPS-01.ps1](../scripts/controls/OPS-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ops-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Material changes and incidents have accountable review and evidence of action; outdated procedures are revised. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Falsifying probe (authorized test or evidence challenge):** Find a retirement notice affecting an application with no assigned migration owner. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Remediation direction:** Establish an owned change intake and validate affected procedures before cutover. [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [S73: Purview eDiscovery legacy solutions](https://learn.microsoft.com/en-us/purview/ediscovery)

### OPS-02 — Cost, capacity and license hygiene

**Objective:** Control waste without compromising preservation or required protection. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Applicability:** Subscriptions, storage, backup, AI and platform consumption. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Proposed accountable owner:** FinOps and licensing owners. **Suggested priority:** P2. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Assignments; active use; disabled accounts; storage; add-ons; consumption; renewal commitments. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Audit procedure (consultant method):** Identify unused allocations and expiring trials, but check holds, shared mailbox requirements, backup and dependencies before reclaiming. Review capacity forecasts and pay-as-you-go owners; validate proposed savings against contract terms. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Read-only execution — Cost, capacity and license hygiene:** [OPS-02.ps1](../scripts/controls/OPS-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ops-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Costs have owners and reconciled usage; reclaim decisions preserve security, retention and business requirements. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** A seemingly unused license is necessary for an investigation or protected workload. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Remediation direction:** Document justified reclamation and capacity actions with service-owner review. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S12: Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

### OPS-03 — Supplier and shared-responsibility assurance

**Objective:** Separate Microsoft controls from customer and third-party responsibilities. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)

**Applicability:** Microsoft, MSPs, backup providers and connected SaaS. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)

**Proposed accountable owner:** Vendor risk owner. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Contracts; assurance reports; responsibility matrix; support boundaries; integrations; customer controls. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)

**Audit procedure (consultant method):** Review available supplier assurance for the actual service and period. Identify customer responsibilities, exclusions, subservices and integration risks. Map required actions to tenant evidence and service-owner procedures. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)

**Read-only execution — Supplier and shared-responsibility assurance:** [OPS-03.ps1](../scripts/controls/OPS-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ops-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Assurance claims identify whose control was assessed, which service and which period; certifications do not substitute for customer configuration review. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)

**Falsifying probe (authorized test or evidence challenge):** A supplier report covers hosting but excludes the application's backup or support path. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)

**Remediation direction:** Close responsibility gaps and obtain relevant assurance or compensate explicitly. [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S06: NIST SP 800-53A Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/a/r5/final)

### OPS-04 — Long-term drift and re-audit

**Objective:** Keep audit conclusions current after changes. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

**Applicability:** All assessed workloads. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

**Proposed accountable owner:** Control owners and audit lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Baseline snapshots; versioned criteria; scheduled checks; exception expirations; remediation retests. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

**Audit procedure (consultant method):** Identify which controls need continuous monitoring versus periodic interviews/tests. Pin tool versions and preserve baseline changes. Track new services and permissions, and compare like-for-like populations rather than only scores. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

**Read-only execution — Long-term drift and re-audit:** [OPS-04.ps1](../scripts/controls/OPS-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ops-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Material drift creates owned work and closed findings have new evidence; a rising score does not hide reduced scope. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

**Falsifying probe (authorized test or evidence challenge):** A scanner update improves the score by skipping unsupported tests. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

**Remediation direction:** Review failed/skipped/manual counts and coverage; retest changes and refresh criteria deliberately. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

**Suggested review cadence:** At initial audit and after material change; continuous or quarterly review according to risk. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score); [S57: ScubaGear v1.8.0 output schema](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/misc/tooloutputschema.md); [S58: Maester installation guide](https://maester.dev/docs/installation/); [S71: Maester 3.0 preview transition](https://maester.dev/blog/maester-3-0/)


## Specialized tenant and workload overlays

### EXT-01 — Government and sovereign cloud fit

**Objective:** Prevent commercial-cloud assumptions from invalidating the audit. [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Applicability:** GCC, GCC High, DoD, 21Vianet and sovereign arrangements. [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Proposed accountable owner:** Tenant architect. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Cloud classification; endpoints; service availability; tool support; contract and residency requirements. [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Audit procedure (consultant method):** Validate each service, API and scanner against the actual cloud. Record unavailable or differently deployed features and data-handling boundaries. Use cloud-appropriate authentication; report untested tool support separately. [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Read-only execution — Government and sovereign cloud fit:** [EXT-01.ps1](../scripts/controls/EXT-01.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-01). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Every applied procedure is supported in the target cloud or replaced with documented manual evidence. [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Falsifying probe (authorized test or evidence challenge):** A commercial collector succeeds against the wrong tenant or returns unsupported results in the target cloud. [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Remediation direction:** Correct endpoints and adapt controls; qualify assurance until the target-cloud method is verified. [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0); [S04: ScubaGear v1.8.0 assumptions](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/misc/assumptions.md)

### EXT-02 — Education, frontline and shared-user populations

**Objective:** Adapt access and data governance to distinct user populations. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

**Applicability:** Education, frontline workers, shared devices and seasonal staff. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

**Proposed accountable owner:** Identity, endpoint and data owners. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** User cohorts; entitlements; student/staff separation; shared-device model; guest and lifecycle policies. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

**Audit procedure (consultant method):** Separate staff, students, minors where applicable, temporary workers and shared devices in sampling. Confirm actual SKU capability and approved privacy obligations. Test rapid turnover, shared-session cleanup and resource access without assuming enterprise defaults. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

**Read-only execution — Education, frontline and shared-user populations:** [EXT-02.ps1](../scripts/controls/EXT-02.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-02). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Population-specific requirements are explicit and supported by evidence; business convenience does not silently exempt a cohort. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** A shared workstation retains a previous user's organizational session or a seasonal account survives termination. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

**Remediation direction:** Correct shared-session and lifecycle procedures; obtain accountable policy decisions for each population. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

### EXT-03 — Multi-Geo and residency verification

**Objective:** Test data-location commitments at the relevant service boundary. [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [S68: Microsoft 365 Multi-Geo](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Applicability:** Multi-Geo, ADR and regulated residency requirements. [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [S68: Microsoft 365 Multi-Geo](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Proposed accountable owner:** Privacy and tenant architecture leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Contractual commitments; data-location reports; user/site geography; migrations; backup and third-party locations. [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [S68: Microsoft 365 Multi-Geo](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Audit procedure (consultant method):** Map each requirement to the exact workload and data category. Distinguish storage from processing and support access. Verify current versus committed locations, pending moves and external copies. [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [S68: Microsoft 365 Multi-Geo](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Read-only execution — Multi-Geo and residency verification:** [EXT-03.ps1](../scripts/controls/EXT-03.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-03). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Evidence supports the particular residency claim; tenant home geography is not used as proof for all data. [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [S68: Microsoft 365 Multi-Geo](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Falsifying probe (authorized test or evidence challenge):** A backup, connector or analytics export resides outside the stated workload boundary. [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [S68: Microsoft 365 Multi-Geo](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Remediation direction:** Resolve location gaps or amend the approved architecture and disclosures with responsible owners. [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [S68: Microsoft 365 Multi-Geo](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S66: Microsoft 365 data residency](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [S67: Compare Microsoft 365 data residency offerings](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [S68: Microsoft 365 Multi-Geo](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

### EXT-04 — Loop and SharePoint Embedded

**Objective:** Include content outside ordinary site inventory assumptions. [S77: Loop governance and compliance](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Applicability:** Loop and applications using SharePoint Embedded containers. [S77: Loop governance and compliance](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Proposed accountable owner:** Collaboration and application owners. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Workspace/container inventory; storage location; app permissions; owners; retention/hold capabilities. [S77: Loop governance and compliance](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Audit procedure (consultant method):** Identify actual storage for each content type and creator experience. Verify membership, lifecycle, retention and eDiscovery against current capability tables. Test a synthetic artifact through discovery and authorized access; do not assume all storage variants behave identically. [S77: Loop governance and compliance](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Read-only execution — Loop and SharePoint Embedded:** [EXT-04.ps1](../scripts/controls/EXT-04.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-04). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Containers and workspaces are governed and included in evidence/recovery scope, with current limitations recorded. [S77: Loop governance and compliance](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Falsifying probe (authorized test or evidence challenge):** A compliance search covers ordinary sites but misses a synthetic item in an application container. [S77: Loop governance and compliance](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Remediation direction:** Add container-aware inventory and procedures; restrict unsupported use cases if required. [S77: Loop governance and compliance](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S77: Loop governance and compliance](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)

### EXT-05 — Forms and public intake

**Objective:** Control information collected and shared through forms. [S78: Set up Microsoft Forms](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

**Applicability:** Microsoft Forms and equivalent externally published intake. [S78: Set up Microsoft Forms](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

**Proposed accountable owner:** Business owner and collaboration lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Form inventory; external response/collaboration settings; response access; owner; data purpose and exports. [S78: Set up Microsoft Forms](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

**Audit procedure (consultant method):** Sample public forms, sensitive questions and response exports. Verify ownership transfer, respondent identity needs, anonymous access and collaboration links. Trace stored responses and connected automation to their retention and access controls. [S78: Set up Microsoft Forms](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

**Read-only execution — Forms and public intake:** [EXT-05.ps1](../scripts/controls/EXT-05.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-05). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Public intake collects only approved information and response data has an authorized audience and lifecycle. [S78: Set up Microsoft Forms](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

**Falsifying probe (authorized test or evidence challenge):** An external collaborator can read response data through a forgotten sharing path. [S78: Set up Microsoft Forms](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

**Remediation direction:** Narrow form sharing and response access; assign owners and document disposal. [S78: Set up Microsoft Forms](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S78: Set up Microsoft Forms](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

### EXT-06 — Other enabled productivity workloads

**Objective:** Avoid silently omitting smaller services. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Applicability:** Planner, Bookings, Viva, Sway, Whiteboard, Stream, Project and additional enabled services. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Proposed accountable owner:** Each workload owner. **Suggested priority:** P2. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Enabled-service inventory; owners; feature documentation; sharing; data storage; integration and recovery scope. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Audit procedure (consultant method):** For every enabled service, complete the workload worksheet: identity, sharing, storage, licensing, retention, audit and recovery. Identify its backing services and verify current product-specific documentation before issuing a result. Escalate unsupported assumptions as scope gaps. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Read-only execution — Other enabled productivity workloads:** [EXT-06.ps1](../scripts/controls/EXT-06.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-06). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** No enabled workload is silently omitted. This generic overlay is a scoping procedure, not a product-specific configuration certification. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** Choose a service absent from the main scanner and ask for its stored-data and recovery owner. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Remediation direction:** Add a tailored assessment module with primary documentation; record Not assessed until sufficient evidence exists. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### EXT-07 — Mergers and multiple tenants

**Objective:** Assess trust and data movement across organizational boundaries. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Applicability:** Acquisitions, divestitures and multi-tenant organizations. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Proposed accountable owner:** Enterprise architect. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Tenant inventory; cross-tenant relationships; migrations; dual identities; delegated roles; data ownership. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Audit procedure (consultant method):** Review who retains access before, during and after transition. Inspect partner-specific trust, cross-tenant synchronization and migration service accounts. Reconcile retention and evidence obligations before decommissioning. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Read-only execution — Mergers and multiple tenants:** [EXT-07.ps1](../scripts/controls/EXT-07.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-07). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Trust, data ownership and access removal are planned and evidenced for each transition phase. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Falsifying probe (authorized test or evidence challenge):** An acquired tenant's admin retains a migration credential after cutover. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Remediation direction:** Expire transitional access and verify source/destination controls before closure. [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention)

### EXT-08 — Regulated control overlay and formal assurance

**Objective:** Translate a framework engagement into defensible testing. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Applicability:** Contractual or regulated audits requiring a specified framework/version. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Proposed accountable owner:** Compliance owner and audit lead. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Authoritative requirements; formal scope; framework version; mapping; evidence; assessor requirements. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Audit procedure (consultant method):** Map each applicable requirement to one or more control tests and identify uncovered clauses. Have qualified owners interpret legal requirements. Validate technical evidence, process operation and provider/customer boundaries separately. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Read-only execution — Regulated control overlay and formal assurance:** [EXT-08.ps1](../scripts/controls/EXT-08.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-08). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Any conformity claim matches the authorized assessment standard, scope, period and assessor role; this playbook alone confers no certification. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Falsifying probe (authorized test or evidence challenge):** A completed Microsoft recommendation is used to claim satisfaction of an unrelated legal clause. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Remediation direction:** Complete the missing mapping, interpretation or assessment and qualify interim reporting. [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager); [S45: Microsoft Product Terms](https://www.microsoft.com/licensing/terms/); [S06: NIST SP 800-53A Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/a/r5/final); [S62: CISA Entra baseline, ScubaGear v1.8.0](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/PowerShell/ScubaGear/baselines/aad.md)

### EXT-09 — Virtual desktops and Cloud PCs

**Objective:** Include hosted endpoints in identity and device assurance. [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

**Applicability:** Windows 365, Azure Virtual Desktop and shared virtual endpoints. [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

**Proposed accountable owner:** Endpoint and virtualization leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Hosted desktop inventory; identity model; policies; images; administrator access; recovery dependencies. [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

**Audit procedure (consultant method):** Apply endpoint and access tests to hosted desktops, including image lifecycle, local data, redirection and privileged sessions. Validate product-specific configuration against current primary documentation before scoring the deployment. [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

**Read-only execution — Virtual desktops and Cloud PCs:** [EXT-09.ps1](../scripts/controls/EXT-09.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-09). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Hosted endpoints are included in coverage and recovery; omitted product-specific checks remain Not assessed. [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

**Falsifying probe (authorized test or evidence challenge):** A privileged Cloud PC is assumed safe because it is hosted but lacks the intended endpoint controls. [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

**Remediation direction:** Extend device management and recovery coverage and commission a specific platform review where needed. [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S74: Intune endpoint security](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S81: Microsoft 365 service encryption](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

### EXT-10 — Network and access dependencies

**Objective:** Validate DNS, connectivity and secure access dependencies. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Applicability:** All tenants; enhanced review for proxies and remote access. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Proposed accountable owner:** Network and identity leads. **Suggested priority:** P1. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** DNS ownership; proxy/VPN architecture; trusted locations; certificates; availability monitoring. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Audit procedure (consultant method):** Trace administrator and user connectivity to authentication and workloads. Review who controls DNS and named locations; identify proxy bypass and authentication dependencies. Test a representative outage or alternate access path under an approved plan. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Read-only execution — Network and access dependencies:** [EXT-10.ps1](../scripts/controls/EXT-10.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-10). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Critical connectivity has owners and recovery plans; network location alone is not treated as strong identity assurance. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Falsifying probe (authorized test or evidence challenge):** A broad trusted IP range unintentionally includes an untrusted user or partner path. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Remediation direction:** Narrow assumptions and align network/access design with observed authentication behavior. [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S44: Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### EXT-11 — Accessibility and control usability

**Objective:** Keep required protection usable for the intended workforce. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

**Applicability:** Authentication, device restrictions and collaboration controls. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

**Proposed accountable owner:** Service owner and accessibility lead. **Suggested priority:** P2. These are consultant assignments; determine actual finding severity from evidence.

**Evidence to collect:** Exception requests; accessible authentication options; helpdesk trends; pilot results; training. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

**Audit procedure (consultant method):** Review whether users with differing devices, connectivity or accessibility needs can use approved controls. Test representative personas and recovery paths. Track repeated support workarounds as evidence of a design gap. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

**Read-only execution — Accessibility and control usability:** [EXT-11.ps1](../scripts/controls/EXT-11.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#ext-11). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.

**Proposed assessment criterion:** Protection remains effective and usable for legitimate users; workarounds do not create permanent unowned bypasses. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

**Falsifying probe (authorized test or evidence challenge):** A user can work only after helpdesk repeatedly disables an access control. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

**Remediation direction:** Provide supported alternatives and improve rollout/training while preserving the required objective. [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

**Suggested review cadence:** At initial audit and after material change; periodic review based on the approved risk plan. This is a consultant default unless a cited source specifies otherwise.

**Source trail:** [S11: Microsoft Entra authentication overview](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)
