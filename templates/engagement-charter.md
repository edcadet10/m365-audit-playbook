# Engagement charter — [organization]

**Template; not a completed engagement.** Fields below are consultant-defined planning requirements. Source references identify the product and evidence considerations that inform them. [S02: Zero Trust deployment plan with Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

## Mandate and boundaries

- Sponsor, audit lead, business owners and evidence custodian: [names].
- Engagement type: [configuration / operating effectiveness / readiness / other].
- Tenant IDs, clouds, domains and workloads: [attach scope worksheet].
- Review period and collection dates: [UTC start/end].
- Adopted requirements and versioned baselines: [references].
- Explicit exclusions and expected assurance limitations: [list].

Cloud and product applicability must be verified against Microsoft service documentation; a workload omitted by a scanner is not automatically out of scope. [S46: Office 365 GCC High and DoD](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [S72: Government Office application availability](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

## Evidence and access

- Approved evidence location, classification and retention: [details].
- Reader identities, roles, scopes, expiry and approvers: [access worksheet].
- Collection population, query limits and completeness method: [plan].
- Permission or licensing limitations: [known gaps].
- Owner-assisted exports where necessary: [owner and method].

Use source-appropriate roles and verify historical availability before promising period coverage. [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies)

## Authorized validation

- Permitted identities, synthetic data, resources and destinations: [list].
- Approved sign-ins, messages, DLP exercises, agent tests and restores: [scope].
- Activities requiring separate change approval: [list].
- Incident escalation and emergency contacts: [details].
- Test cleanup, evidence preservation and stop conditions: [details].

Configuration reading and active exercises have different effects; recovery and incident actions require clear authority. [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only)

## Assessment and deliverables

- Sampling rationale and limits: [attach plan].
- Adopted result definitions, priority/severity rules and confidence labels: [method].
- Required executive report, technical findings, roadmap and retests: [deliverables].
- Fact review, management response and risk acceptance owners: [names].
- Handoff and temporary-access removal: [criteria].
- Sponsor approval and date: [record].

These are consultant engagement decisions; do not attribute sample sizes, risk thresholds or deadlines to Microsoft unless an exact source establishes them. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score); [S40: Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager)
