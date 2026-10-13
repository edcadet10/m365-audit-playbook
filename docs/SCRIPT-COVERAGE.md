# Script coverage and evidence contracts

Every control, numbered fieldwork step and main playbook phase has an executable entry script. Scripts collect read-only evidence and identify review candidates; completion of an evidence contract is not an audit Pass. See [execution instructions](../scripts/README.md).

Use `-Plan` on any entry script to print exact reads, permissions, target inputs, required local records and Microsoft references without connecting or writing evidence. Reusable operations have their own [Microsoft command/API references](SCRIPT-OPERATIONS.md).

## Controls

### GOV-01

**Tenant and workload boundary** — [Run GOV-01.ps1](../scripts/controls/GOV-01.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`domains`](SCRIPT-OPERATIONS.md#domains), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`users`](SCRIPT-OPERATIONS.md#users), [`groups`](SCRIPT-OPERATIONS.md#groups), [`sites`](SCRIPT-OPERATIONS.md#sites).

**Required local evidence:** `GOV-01.json`, records with `tenantBoundary`, `workloadInventory`, `exclusions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile finance, identity and administrator inventories. Include production, development, acquired and partner-managed tenants. Record enabled workloads, geographies, business owners, external dependencies and explicit exclusions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [Microsoft reference 2](https://www.microsoft.com/licensing/terms/); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide)

### GOV-02

**Obligations and control criteria** — [Run GOV-02.ps1](../scripts/controls/GOV-02.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`licenses`](SCRIPT-OPERATIONS.md#licenses).

**Required local evidence:** `GOV-02.json`, records with `obligations`, `adoptedCriteria`, `applicability`, `approval`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Identify mandatory obligations, contractual promises and internal targets separately. Select dated Microsoft, CISA and licensed CIS criteria. Map each adopted requirement to evidence and a control owner; mark unmapped requirements.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/compliance-manager); [Microsoft reference 2](https://www.microsoft.com/licensing/terms/)

### GOV-03

**Roles, accountability and separation** — [Run GOV-03.ps1](../scripts/controls/GOV-03.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`roleDefinitions`](SCRIPT-OPERATIONS.md#roledefinitions), [`pimActive`](SCRIPT-OPERATIONS.md#pimactive).

**Required local evidence:** `GOV-03.json`, records with `responsibilityMatrix`, `separationReview`, `ownerAcceptance`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Match operational responsibilities to actual permissions. Examine who approves their own elevation, grants consent, exports investigations and accepts risk. Review conflicts and independent oversight.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview)

### GOV-04

**Exception governance** — [Run GOV-04.ps1](../scripts/controls/GOV-04.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`authorization`](SCRIPT-OPERATIONS.md#authorization).

**Required local evidence:** `GOV-04.json`, records with `exceptionRegister`, `expiryReview`, `compensatingControls`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Join exceptions to actual users, applications, locations and policy IDs. Verify business necessity, expiration, compensating evidence and reapproval. Look for expired exclusions still active.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### GOV-05

**License and entitlement assurance** — [Run GOV-05.ps1](../scripts/controls/GOV-05.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`users`](SCRIPT-OPERATIONS.md#users).

**Required local evidence:** `GOV-05.json`, records with `entitlementMatrix`, `purchasedLicenses`, `featureRequirements`, `contractReconciliation`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Distinguish Microsoft 365 from Office 365 bundles. Match benefiting users and workloads to feature prerequisites; inspect disabled plans and trial expiration. Validate backup and AI consumption separately.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [Microsoft reference 3](https://www.microsoft.com/licensing/terms/)

### IAM-01

**Privileged role population** — [Run IAM-01.ps1](../scripts/controls/IAM-01.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`roleDefinitions`](SCRIPT-OPERATIONS.md#roledefinitions), [`pimActive`](SCRIPT-OPERATIONS.md#pimactive), [`pimEligible`](SCRIPT-OPERATIONS.md#pimeligible), [`groupMembers`](SCRIPT-OPERATIONS.md#groupmembers).

**Required local evidence:** `IAM-01.json`, records with `privilegedPopulation`, `nestedGroups`, `justification`, `approvals`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Enumerate permanent, eligible, scoped and group-derived roles. Resolve memberships and app principals. Include Exchange, SharePoint, Teams, Purview, Intune and Defender administration; compare with HR and support rosters.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [Microsoft reference 3](https://learn.microsoft.com/en-us/graph/permissions-overview)

### IAM-02

**Effective MFA and authentication strength** — [Run IAM-02.ps1](../scripts/controls/IAM-02.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`defaults`](SCRIPT-OPERATIONS.md#defaults), [`authPolicy`](SCRIPT-OPERATIONS.md#authpolicy), [`registration`](SCRIPT-OPERATIONS.md#registration), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `IAM-02.json`, records with `requiredStrength`, `personaMatrix`, `allowedCase`, `prohibitedCase`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Define required strength by role and risk. Reconcile registrations with policy scope. Test administrator, employee, guest and exception identities using fresh sessions; include trusted locations and alternate clients. Interpret token claims rather than requiring a prompt every time.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [Microsoft reference 4](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

### IAM-03

**Conditional Access coverage and interaction** — [Run IAM-03.ps1](../scripts/controls/IAM-03.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`namedLocations`](SCRIPT-OPERATIONS.md#namedlocations), [`defaults`](SCRIPT-OPERATIONS.md#defaults), [`crossDefault`](SCRIPT-OPERATIONS.md#crossdefault), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `IAM-03.json`, records with `coverageMatrix`, `exclusions`, `effectivePolicyReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Build an identity-by-resource-by-client matrix. Check exclusions, authentication strengths, grant operators and session controls. Use What If for design analysis, then corroborate with sign-ins and approved tests. Account for existing tokens and dependencies.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

### IAM-04

**Emergency administrative access** — [Run IAM-04.ps1](../scripts/controls/IAM-04.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`authMethods`](SCRIPT-OPERATIONS.md#authmethods), [`ca`](SCRIPT-OPERATIONS.md#ca), [`signIns`](SCRIPT-OPERATIONS.md#signins), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `IAM-04.json`, records with `emergencyAccounts`, `independentDependencies`, `custody`, `alertReceipt`, `exerciseTiming`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review at least two cloud-only emergency accounts, independent strong credentials, active role assignment and relevant policy exclusions against current Microsoft guidance. Observe an authorized sign-in exercise, alert delivery and secure credential recovery.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### IAM-05

**Privileged elevation and review** — [Run IAM-05.ps1](../scripts/controls/IAM-05.ps1)

**Live read operations:** [`pimEligible`](SCRIPT-OPERATIONS.md#pimeligible), [`pimActive`](SCRIPT-OPERATIONS.md#pimactive), [`accessReviews`](SCRIPT-OPERATIONS.md#accessreviews), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `IAM-05.json`, records with `elevationApprovals`, `reviewDecisions`, `expiredAssignments`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Examine approval, justification, duration and authentication requirements for sensitive roles. Sample activations and subsequent use. Check stale eligible assignments and whether approvers can be unavailable simultaneously.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### IAM-06

**Joiner, mover and leaver lifecycle** — [Run IAM-06.ps1](../scripts/controls/IAM-06.ps1)

**Live read operations:** [`users`](SCRIPT-OPERATIONS.md#users), [`groups`](SCRIPT-OPERATIONS.md#groups), [`groupMembers`](SCRIPT-OPERATIONS.md#groupmembers), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `IAM-06.json`, records with `hrPopulation`, `lifecycleSamples`, `removalTimes`, `residualSessions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Select recent leavers, movers and urgent terminations. Compare authoritative timestamps to disablement and downstream access removal. Check hybrid source, refresh tokens, application sessions, mailbox delegation and owned automations.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

### IAM-07

**External identity lifecycle and partner trust** — [Run IAM-07.ps1](../scripts/controls/IAM-07.ps1)

**Live read operations:** [`users`](SCRIPT-OPERATIONS.md#users), [`crossDefault`](SCRIPT-OPERATIONS.md#crossdefault), [`crossPartners`](SCRIPT-OPERATIONS.md#crosspartners), [`accessReviews`](SCRIPT-OPERATIONS.md#accessreviews), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `IAM-07.json`, records with `guestSponsors`, `reviewDates`, `partnerTrust`, `lifecycleDecisions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Resolve guest sponsors and resource access. Review both default and partner-specific trust, including accepted MFA/device claims. Inspect dormant identities, access packages and review decisions; reconcile shared-channel participants separately.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)

### IAM-08

**Authentication recovery and legacy access** — [Run IAM-08.ps1](../scripts/controls/IAM-08.ps1)

**Live read operations:** [`authPolicy`](SCRIPT-OPERATIONS.md#authpolicy), [`authMethods`](SCRIPT-OPERATIONS.md#authmethods), [`authPolicies`](SCRIPT-OPERATIONS.md#authpolicies), [`casMailboxes`](SCRIPT-OPERATIONS.md#casmailboxes), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `IAM-08.json`, records with `recoveryProcess`, `legacyExceptions`, `recoveryExercises`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review helpdesk identity verification, recovery credentials and method registration. Check legacy protocols and app dependencies. Test one recovery workflow with an authorized account; confirm the result does not create an undocumented bypass.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [Microsoft reference 3](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

### IAM-09

**Risk-based access and investigation** — [Run IAM-09.ps1](../scripts/controls/IAM-09.ps1)

**Live read operations:** [`riskyUsers`](SCRIPT-OPERATIONS.md#riskyusers), [`riskDetections`](SCRIPT-OPERATIONS.md#riskdetections), [`ca`](SCRIPT-OPERATIONS.md#ca), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `IAM-09.json`, records with `riskTriage`, `remediations`, `licensing`, `effectiveEnforcement`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review user and sign-in risk separately, feature entitlement and deployed policy experience. Inspect how detected risk is investigated and dismissed. Use permitted simulations or historical sanitized cases rather than provoking real account compromise.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/id-protection/howto-identity-protection-configure-risk-policies); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### APP-01

**Application and service principal inventory** — [Run APP-01.ps1](../scripts/controls/APP-01.ps1)

**Live read operations:** [`apps`](SCRIPT-OPERATIONS.md#apps), [`principals`](SCRIPT-OPERATIONS.md#principals), [`appOwners`](SCRIPT-OPERATIONS.md#appowners), [`delegatedAdmin`](SCRIPT-OPERATIONS.md#delegatedadmin).

**Required local evidence:** `APP-01.json`, records with `applicationRegister`, `businessOwners`, `approvalDates`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile registrations with service principals and business systems. Identify orphaned owners, unused high privilege, multitenant publishers and credentials. Distinguish application permissions from delegated grants and user-assigned access.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/graph/permissions-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### APP-02

**Consent and existing grants** — [Run APP-02.ps1](../scripts/controls/APP-02.ps1)

**Live read operations:** [`authorization`](SCRIPT-OPERATIONS.md#authorization), [`grants`](SCRIPT-OPERATIONS.md#grants), [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`principals`](SCRIPT-OPERATIONS.md#principals).

**Required local evidence:** `APP-02.json`, records with `consentApprovals`, `permissionJustification`, `historicGrantReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review new-consent rules and enumerate existing grants separately. Examine permissions exposing mail, files, directory roles or write capabilities. Sample approval decisions and publisher verification without equating publisher verification to trust.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [Microsoft reference 2](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [Microsoft reference 3](https://learn.microsoft.com/en-us/graph/permissions-overview)

### APP-03

**Workload identity credentials and trust** — [Run APP-03.ps1](../scripts/controls/APP-03.ps1)

**Live read operations:** [`apps`](SCRIPT-OPERATIONS.md#apps), [`principals`](SCRIPT-OPERATIONS.md#principals), [`federatedCredentials`](SCRIPT-OPERATIONS.md#federatedcredentials), [`appOwners`](SCRIPT-OPERATIONS.md#appowners).

**Required local evidence:** `APP-03.json`, records with `credentialInventory`, `rotationRecords`, `federationTrustReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inspect metadata without collecting secret values. Review owner changes, credential addition alerts and federation restrictions. Evaluate managed identities on their actual resources; workload Conditional Access coverage is not universal.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### APP-04

**Application resource boundaries** — [Run APP-04.ps1](../scripts/controls/APP-04.ps1)

**Live read operations:** [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`grants`](SCRIPT-OPERATIONS.md#grants), [`principals`](SCRIPT-OPERATIONS.md#principals), [`itemPermissions`](SCRIPT-OPERATIONS.md#itempermissions).

**Required local evidence:** `APP-04.json`, records with `approvedResources`, `allowedCase`, `prohibitedCase`, `effectiveScope`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Map app permissions through both API and workload authorization. With a controlled identity, test an allowed resource and one outside its intended scope. Review owner and credential administrators as privilege paths.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/graph/permissions-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### APP-05

**Automation and partner administration** — [Run APP-05.ps1](../scripts/controls/APP-05.ps1)

**Live read operations:** [`delegatedAdmin`](SCRIPT-OPERATIONS.md#delegatedadmin), [`apps`](SCRIPT-OPERATIONS.md#apps), [`roles`](SCRIPT-OPERATIONS.md#roles), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `APP-05.json`, records with `automationInventory`, `partnerAccess`, `pipelineControls`, `offboarding`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Trace a partner or pipeline action to a named authorization. Review expiration, offboarding, repository permissions and secret custody. Confirm automated output and logs do not expose tenant evidence publicly.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview)

### APP-06

**Cloud app discovery and session controls** — [Run APP-06.ps1](../scripts/controls/APP-06.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`signIns`](SCRIPT-OPERATIONS.md#signins), [`alerts`](SCRIPT-OPERATIONS.md#alerts).

**Required local evidence:** `APP-06.json`, records with `cloudDiscoveryExport`, `sessionPolicyExport`, `trafficCoverage`, `bypassCases`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inventory connected and unsanctioned services. Test protected browser sessions and native-client paths, content inspection limits and encrypted/large-file cases. Confirm resource apps are covered and collector credentials remain healthy.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-cloud-apps/caac-known-issues); [Microsoft reference 2](https://learn.microsoft.com/en-us/defender-cloud-apps/proxy-intro-aad); [Microsoft reference 3](https://learn.microsoft.com/en-us/graph/permissions-overview)

### HYB-01

**Identity synchronization and federation** — [Run HYB-01.ps1](../scripts/controls/HYB-01.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`users`](SCRIPT-OPERATIONS.md#users), [`domains`](SCRIPT-OPERATIONS.md#domains), [`federation`](SCRIPT-OPERATIONS.md#federation).

**Required local evidence:** `HYB-01.json`, records with `syncServerInventory`, `versionStatus`, `privilegedAccess`, `healthExport`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Identify every server, agent and trust path. Review hardening, patch support, service accounts and remote administration. Verify staging/recovery arrangements and monitor unexpected synchronization or federation changes.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### HYB-02

**Hybrid messaging and application connectors** — [Run HYB-02.ps1](../scripts/controls/HYB-02.ps1)

**Live read operations:** [`inboundConnectors`](SCRIPT-OPERATIONS.md#inboundconnectors), [`outboundConnectors`](SCRIPT-OPERATIONS.md#outboundconnectors), [`transportRules`](SCRIPT-OPERATIONS.md#transportrules), [`federation`](SCRIPT-OPERATIONS.md#federation).

**Required local evidence:** `HYB-02.json`, records with `hybridTopology`, `connectorOwners`, `certificateExpiry`, `failoverRecords`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Walk inbound and outbound paths, including bypass routes around filtering. Verify trust by endpoint and credential, renewal ownership and legacy dependencies. Test approved representative messages and application access.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [Microsoft reference 2](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure); [Microsoft reference 3](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

### HYB-03

**Source-of-authority and outage exercise** — [Run HYB-03.ps1](../scripts/controls/HYB-03.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`federation`](SCRIPT-OPERATIONS.md#federation), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `HYB-03.json`, records with `sourceAuthority`, `dependencyMap`, `outageExercise`, `reconciliation`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Tabletop loss of federation or sync and urgent termination during that outage. Identify which system accepts each change, what is cached and how reconciliations occur. Observe a non-disruptive recovery rehearsal.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### MAIL-01

**Sender authentication and domain ownership** — [Run MAIL-01.ps1](../scripts/controls/MAIL-01.ps1)

**Live read operations:** [`domains`](SCRIPT-OPERATIONS.md#domains), [`acceptedDomains`](SCRIPT-OPERATIONS.md#accepteddomains), [`dkim`](SCRIPT-OPERATIONS.md#dkim).

**Required local evidence:** `MAIL-01.json`, records with `senderInventory`, `dnsRecords`, `messageHeaders`, `alignmentResults`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile senders with business owners. Check SPF structure and lookup constraints, DKIM signing and tenant-provided selectors, and DMARC alignment. Sample each sending platform; inspect parked domains separately. Stage enforcement based on legitimate traffic evidence.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [Microsoft reference 2](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [Microsoft reference 3](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

### MAIL-02

**Threat policy coverage and precedence** — [Run MAIL-02.ps1](../scripts/controls/MAIL-02.ps1)

**Live read operations:** [`presetEop`](SCRIPT-OPERATIONS.md#preseteop), [`presetDefender`](SCRIPT-OPERATIONS.md#presetdefender), [`antiPhish`](SCRIPT-OPERATIONS.md#antiphish), [`antiPhishRules`](SCRIPT-OPERATIONS.md#antiphishrules), [`spam`](SCRIPT-OPERATIONS.md#spam), [`spamRules`](SCRIPT-OPERATIONS.md#spamrules), [`malware`](SCRIPT-OPERATIONS.md#malware), [`malwareRules`](SCRIPT-OPERATIONS.md#malwarerules), [`safeLinks`](SCRIPT-OPERATIONS.md#safelinks), [`safeLinksRules`](SCRIPT-OPERATIONS.md#safelinksrules), [`safeAttachments`](SCRIPT-OPERATIONS.md#safeattachments), [`safeAttachmentsRules`](SCRIPT-OPERATIONS.md#safeattachmentsrules).

**Required local evidence:** `MAIL-02.json`, records with `recipientPopulation`, `effectivePrecedence`, `exceptions`, `protectionObservations`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Map ordinary, executive and exception recipients to effective policy. Review impersonation targets, protections and quarantine handling. Resolve precedence before judging custom settings; use approved benign tests and policy evaluation evidence.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

### MAIL-03

**Forwarding, inbox rules and delegation** — [Run MAIL-03.ps1](../scripts/controls/MAIL-03.ps1)

**Live read operations:** [`mailboxes`](SCRIPT-OPERATIONS.md#mailboxes), [`inboxRules`](SCRIPT-OPERATIONS.md#inboxrules), [`mailboxPermissions`](SCRIPT-OPERATIONS.md#mailboxpermissions), [`recipientPermissions`](SCRIPT-OPERATIONS.md#recipientpermissions), [`outboundSpam`](SCRIPT-OPERATIONS.md#outboundspam), [`outboundSpamRules`](SCRIPT-OPERATIONS.md#outboundspamrules), [`remoteDomains`](SCRIPT-OPERATIONS.md#remotedomains), [`transportRules`](SCRIPT-OPERATIONS.md#transportrules).

**Required local evidence:** `MAIL-03.json`, records with `approvedForwarding`, `effectiveDestinations`, `deliveryEvidence`, `delegationApprovals`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review all high-risk mailboxes and a justified remaining sample. Correlate forwarding and delegates with approvals and sign-in events. Inspect outbound policies, remote domains and transport rules together; verify actual forwarding behavior.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

### MAIL-04

**SMTP AUTH and legacy dependencies** — [Run MAIL-04.ps1](../scripts/controls/MAIL-04.ps1)

**Live read operations:** [`transport`](SCRIPT-OPERATIONS.md#transport), [`casMailboxes`](SCRIPT-OPERATIONS.md#casmailboxes), [`authPolicies`](SCRIPT-OPERATIONS.md#authpolicies), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `MAIL-04.json`, records with `smtpClients`, `authModes`, `oauthEvidence`, `exceptionOwners`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Distinguish the SMTP AUTH protocol from Basic authentication. Check organization settings, mailbox overrides and actual client authentication. Recheck Microsoft's live retirement notice; identify owners and modern-authentication migration tests.

**Microsoft basis:** [Microsoft reference 1](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [Microsoft reference 2](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

### MAIL-05

**Mail-flow bypass and quarantine** — [Run MAIL-05.ps1](../scripts/controls/MAIL-05.ps1)

**Live read operations:** [`transportRules`](SCRIPT-OPERATIONS.md#transportrules), [`inboundConnectors`](SCRIPT-OPERATIONS.md#inboundconnectors), [`quarantine`](SCRIPT-OPERATIONS.md#quarantine), [`spam`](SCRIPT-OPERATIONS.md#spam), [`spamRules`](SCRIPT-OPERATIONS.md#spamrules).

**Required local evidence:** `MAIL-05.json`, records with `bypassJustifications`, `allowedSenders`, `quarantineRoles`, `releaseSamples`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Trace messages through third-party gateways and Exchange. Investigate broad allow rules, filtering bypass, unauthenticated relay and user release permissions. Sample exception creation and suspicious release events.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [Microsoft reference 2](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

### MAIL-06

**Mailbox auditing and administrative exposure** — [Run MAIL-06.ps1](../scripts/controls/MAIL-06.ps1)

**Live read operations:** [`auditConfig`](SCRIPT-OPERATIONS.md#auditconfig), [`exoOrg`](SCRIPT-OPERATIONS.md#exoorg), [`mailboxes`](SCRIPT-OPERATIONS.md#mailboxes), [`ual`](SCRIPT-OPERATIONS.md#ual).

**Required local evidence:** `MAIL-06.json`, records with `auditedActions`, `bypassAssociations`, `knownEvents`, `delegatedAccessReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Check organization-level auditing before interpreting per-mailbox flags. Review bypasses and action coverage, including licensed events. Trace a permitted test action through the audit pipeline and review mailbox-level privileged access.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-search); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

### COL-01

**External sharing boundaries** — [Run COL-01.ps1](../scripts/controls/COL-01.ps1)

**Live read operations:** [`sites`](SCRIPT-OPERATIONS.md#sites), [`site`](SCRIPT-OPERATIONS.md#site), [`groups`](SCRIPT-OPERATIONS.md#groups), [`groupMembers`](SCRIPT-OPERATIONS.md#groupmembers), [`itemPermissions`](SCRIPT-OPERATIONS.md#itempermissions).

**Required local evidence:** `COL-01.json`, records with `spoTenantExport`, `siteSharingExport`, `approvedAudience`, `externalAccessCases`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inventory permissive sites and sensitive content. Review link types, expiration, guests and direct grants. Evaluate tenant limits alongside site settings and item permissions. Test anonymous, approved guest and unrelated user access to synthetic content.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### COL-02

**Effective permissions and broad access** — [Run COL-02.ps1](../scripts/controls/COL-02.ps1)

**Live read operations:** [`groupMembers`](SCRIPT-OPERATIONS.md#groupmembers), [`groupOwners`](SCRIPT-OPERATIONS.md#groupowners), [`itemPermissions`](SCRIPT-OPERATIONS.md#itempermissions).

**Required local evidence:** `COL-02.json`, records with `siteAclExport`, `broadGroups`, `linkInventory`, `itemSamples`, `actualAccess`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Trace permissions from broad groups to sampled sensitive items, including broken inheritance. Review owner and administrator rights, inactive memberships and all-company access. Compare discovered access with the data owner's intended audience.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy)

### COL-03

**Site lifecycle and owner accountability** — [Run COL-03.ps1](../scripts/controls/COL-03.ps1)

**Live read operations:** [`sites`](SCRIPT-OPERATIONS.md#sites), [`site`](SCRIPT-OPERATIONS.md#site), [`groupOwners`](SCRIPT-OPERATIONS.md#groupowners).

**Required local evidence:** `COL-03.json`, records with `siteOwners`, `reviewDates`, `staleSiteDisposition`, `lifecycleApproval`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile site creation, guest access and ownership with projects and business units. Sample inactive and orphaned sites; inspect Teams private/shared-channel sites independently. Determine archive, retention and deletion dependencies.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/retention)

### COL-04

**Unmanaged-device and sync access** — [Run COL-04.ps1](../scripts/controls/COL-04.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`site`](SCRIPT-OPERATIONS.md#site), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `COL-04.json`, records with `spoAccessExport`, `syncRestrictions`, `deviceAccessCases`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Test approved device/browser combinations with synthetic content. Verify download, sync and session restrictions rather than judging only sign-in success. Consider app protection and permitted business exceptions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

### COL-05

**Leaver content, versioning and restoration** — [Run COL-05.ps1](../scripts/controls/COL-05.ps1)

**Live read operations:** [`users`](SCRIPT-OPERATIONS.md#users), [`sites`](SCRIPT-OPERATIONS.md#sites), [`drives`](SCRIPT-OPERATIONS.md#drives).

**Required local evidence:** `COL-05.json`, records with `leaverContentAssignments`, `versionSettings`, `recycleBinInventory`, `restoreRecords`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Sample departed owners and deleted content. Confirm approved transfer, removal of sharing and preservation obligations. Perform recovery testing on synthetic items; document what version or recycle mechanisms cannot restore.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/retention); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

### TEAM-01

**External, guest and shared-channel paths** — [Run TEAM-01.ps1](../scripts/controls/TEAM-01.ps1)

**Live read operations:** [`team`](SCRIPT-OPERATIONS.md#team), [`channels`](SCRIPT-OPERATIONS.md#channels), [`teamMembers`](SCRIPT-OPERATIONS.md#teammembers), [`crossDefault`](SCRIPT-OPERATIONS.md#crossdefault), [`crossPartners`](SCRIPT-OPERATIONS.md#crosspartners).

**Required local evidence:** `TEAM-01.json`, records with `teamsFederationExport`, `guestPolicyExport`, `sharedChannelMembership`, `actualAccess`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review federation, guest membership and shared channels as separate mechanisms. Reconcile shared-channel users with partner trust and channel sites. Test allowed and disallowed partner scenarios using controlled identities.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

### TEAM-02

**Meeting, recording and transcript exposure** — [Run TEAM-02.ps1](../scripts/controls/TEAM-02.ps1)

**Live read operations:** [`team`](SCRIPT-OPERATIONS.md#team), [`channels`](SCRIPT-OPERATIONS.md#channels).

**Required local evidence:** `TEAM-02.json`, records with `meetingPolicyExport`, `policyAssignments`, `recordingPermissions`, `transcriptRetention`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Define meeting tiers and test organizer/attendee behavior. Inspect who can join, present, record, transcribe and retrieve artifacts afterward. Reconcile retention with recording expiration; verify actual license support.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/retention); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### TEAM-03

**Applications, bots and integrations** — [Run TEAM-03.ps1](../scripts/controls/TEAM-03.ps1)

**Live read operations:** [`teamApps`](SCRIPT-OPERATIONS.md#teamapps), [`apps`](SCRIPT-OPERATIONS.md#apps), [`grants`](SCRIPT-OPERATIONS.md#grants), [`appRoles`](SCRIPT-OPERATIONS.md#approles).

**Required local evidence:** `TEAM-03.json`, records with `teamsAppPolicyExport`, `botOwners`, `runtimePermissions`, `approvalRecords`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review app approval and availability, actual grants and data transfer. Sample custom apps and bots that act across channels. Check whether removal from Teams also resolves relevant backend access and credentials.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### TEAM-04

**Team ownership, channel sites and telephony** — [Run TEAM-04.ps1](../scripts/controls/TEAM-04.ps1)

**Live read operations:** [`groups`](SCRIPT-OPERATIONS.md#groups), [`groupOwners`](SCRIPT-OPERATIONS.md#groupowners), [`team`](SCRIPT-OPERATIONS.md#team), [`channels`](SCRIPT-OPERATIONS.md#channels), [`teamMembers`](SCRIPT-OPERATIONS.md#teammembers).

**Required local evidence:** `TEAM-04.json`, records with `ownerCoverage`, `channelSiteMapping`, `telephonyPolicies`, `emergencyCallingReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review owner redundancy and project closure. Reconcile channel sites with retention and backup scope. For voice, examine number ownership, emergency-calling design, carrier dependencies and authorized toll usage with telecom specialists.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoftteams/configure-meetings-three-tiers-protection); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [Microsoft reference 4](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

### END-01

**Device population and management coverage** — [Run END-01.ps1](../scripts/controls/END-01.ps1)

**Live read operations:** [`devices`](SCRIPT-OPERATIONS.md#devices), [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices).

**Required local evidence:** `END-01.json`, records with `assetRegister`, `defenderInventory`, `ownership`, `reconciliationDecisions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Join inventories by stable identifiers and investigate unmatched assets. Separate registered, enrolled, compliant and protected states. Include macOS, mobile and Linux where deployed; identify duplicate/stale records and unsupported systems.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [Microsoft reference 3](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

### END-02

**Compliance and access enforcement** — [Run END-02.ps1](../scripts/controls/END-02.ps1)

**Live read operations:** [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices), [`compliance`](SCRIPT-OPERATIONS.md#compliance), [`complianceAssignments`](SCRIPT-OPERATIONS.md#complianceassignments), [`ca`](SCRIPT-OPERATIONS.md#ca), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `END-02.json`, records with `noPolicySetting`, `gracePeriods`, `effectiveAssignments`, `accessCases`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inspect tenant-wide treatment of devices without assigned policies, platform-specific assignments and stale-state handling. Test compliant, noncompliant, unassigned and grace-period devices against protected resources.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### END-03

**Security baseline and local privilege** — [Run END-03.ps1](../scripts/controls/END-03.ps1)

**Live read operations:** [`deviceConfigs`](SCRIPT-OPERATIONS.md#deviceconfigs), [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices).

**Required local evidence:** `END-03.json`, records with `settingsCatalogExport`, `endpointSecurityExport`, `assignmentStatus`, `localAdmin`, `encryption`, `firewall`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Sample platform and build cohorts. Reconcile baseline and other management sources; inspect effective settings on devices. Check encryption, local admin control, recovery-key custody, firewall and attack-surface rules against adopted platform requirements.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [Microsoft reference 2](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

### END-04

**Endpoint detection and response health** — [Run END-04.ps1](../scripts/controls/END-04.ps1)

**Live read operations:** [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices), [`alerts`](SCRIPT-OPERATIONS.md#alerts), [`incidents`](SCRIPT-OPERATIONS.md#incidents).

**Required local evidence:** `END-04.json`, records with `defenderInventory`, `sensorHealth`, `tamperProtection`, `detectionReceipt`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile protection inventory with devices. Inspect unhealthy sensors, broad exclusions and response access. Use an approved vendor benign validation procedure on a test endpoint and trace the alert to the assigned responder.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [Microsoft reference 2](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

### END-05

**Patch, application and browser lifecycle** — [Run END-05.ps1](../scripts/controls/END-05.ps1)

**Live read operations:** [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices), [`deviceConfigs`](SCRIPT-OPERATIONS.md#deviceconfigs), [`messages`](SCRIPT-OPERATIONS.md#messages).

**Required local evidence:** `END-05.json`, records with `updateRings`, `installedSoftware`, `vulnerabilityExport`, `exceptions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Compare deployed versions with currently supported vendor releases. Sample failed updates and long-lived exceptions. Review Office/browser extensions and document handling against the adopted baseline, including business macros.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/intune-service/protect/security-baselines-configure); [Microsoft reference 2](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies)

### END-06

**BYOD and application data protection** — [Run END-06.ps1](../scripts/controls/END-06.ps1)

**Live read operations:** [`appProtection`](SCRIPT-OPERATIONS.md#appprotection), [`ca`](SCRIPT-OPERATIONS.md#ca), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `END-06.json`, records with `platformPolicyExports`, `appAssignments`, `copySaveCases`, `selectiveRemovalRecords`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Test supported apps and platforms using synthetic data, including personal-account transfer and offline conditions. Confirm restrictions attach to the correct user and app, and assess selective removal without affecting personal content.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### DATA-01

**Data discovery and classification** — [Run DATA-01.ps1](../scripts/controls/DATA-01.ps1)

**Live read operations:** [`sites`](SCRIPT-OPERATIONS.md#sites), [`drives`](SCRIPT-OPERATIONS.md#drives), [`labels`](SCRIPT-OPERATIONS.md#labels).

**Required local evidence:** `DATA-01.json`, records with `dataMap`, `classificationResults`, `repositoryCoverage`, `businessValidation`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile automated discovery with business interviews and sampled content. Cover mail, files, chats, recordings, Power Platform and analytics. Use synthetic or minimized data to test classifiers and document uninspectable/encrypted formats.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [Microsoft reference 3](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing)

### DATA-02

**Sensitivity labels and encryption** — [Run DATA-02.ps1](../scripts/controls/DATA-02.ps1)

**Live read operations:** [`labels`](SCRIPT-OPERATIONS.md#labels), [`labelPolicies`](SCRIPT-OPERATIONS.md#labelpolicies).

**Required local evidence:** `DATA-02.json`, records with `labelAssignments`, `encryptionSettings`, `containerVsFile`, `downloadCases`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Distinguish labels on files/emails from group/site labels. Test allowed and denied recipients, offline use, supported clients and external collaboration. Check downgrade justification and access recovery procedures.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### DATA-03

**DLP effectiveness and exception handling** — [Run DATA-03.ps1](../scripts/controls/DATA-03.ps1)

**Live read operations:** [`dlp`](SCRIPT-OPERATIONS.md#dlp), [`dlpRules`](SCRIPT-OPERATIONS.md#dlprules), [`alerts`](SCRIPT-OPERATIONS.md#alerts).

**Required local evidence:** `DATA-03.json`, records with `policyDistribution`, `classifierSpecimen`, `expectedTransfers`, `observedTransfers`, `exceptions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Map scenarios to locations and rules. Use synthetic examples with required context and confidence thresholds; include negative controls. Test actions, notifications, overrides and incident routing. Review excluded identities and endpoints.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

### DATA-04

**Retention, records and disposition** — [Run DATA-04.ps1](../scripts/controls/DATA-04.ps1)

**Live read operations:** [`retention`](SCRIPT-OPERATIONS.md#retention), [`retentionRules`](SCRIPT-OPERATIONS.md#retentionrules), [`recordLabels`](SCRIPT-OPERATIONS.md#recordlabels).

**Required local evidence:** `DATA-04.json`, records with `retentionSchedule`, `locationCoverage`, `holds`, `dispositionApprovals`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Map each record class and workload to duration and trigger. Inspect overlapping controls, held content, distribution errors and locations not covered. Test a short-lived synthetic lifecycle in an approved environment; assess storage and deletion effects.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/retention); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/edisc-features-components)

### DATA-05

**eDiscovery and investigation readiness** — [Run DATA-05.ps1](../scripts/controls/DATA-05.ps1)

**Live read operations:** [`ediscovery`](SCRIPT-OPERATIONS.md#ediscovery), [`retention`](SCRIPT-OPERATIONS.md#retention), [`roles`](SCRIPT-OPERATIONS.md#roles).

**Required local evidence:** `DATA-05.json`, records with `caseAccess`, `roleGroups`, `preservationSearchSamples`, `chainOfCustody`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Run an approved synthetic case from identification to hold, search and export. Record selected custodians and workload locations, failures and export hashes. Verify unauthorized staff cannot enter the case; use the current supported experience.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/edisc-features-components); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/ediscovery)

### DATA-06

**Privacy, insider risk and compliance ownership** — [Run DATA-06.ps1](../scripts/controls/DATA-06.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`roles`](SCRIPT-OPERATIONS.md#roles).

**Required local evidence:** `DATA-06.json`, records with `privacyRequests`, `insiderRiskRoles`, `caseSeparation`, `complianceActionOwners`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review why data is collected, who can inspect it and how long it remains. Sample a request or investigation from intake to closure. Validate human review of automated indicators and separation of sensitive roles.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/edisc-features-components); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/compliance-manager); [Microsoft reference 3](https://www.microsoft.com/licensing/terms/)

### DATA-07

**Customer-managed encryption and support access** — [Run DATA-07.ps1](../scripts/controls/DATA-07.ps1)

**Live read operations:** [`exoOrg`](SCRIPT-OPERATIONS.md#exoorg), [`roles`](SCRIPT-OPERATIONS.md#roles), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `DATA-07.json`, records with `customerKeyExport`, `keyAvailability`, `lockboxRequests`, `approvalSeparation`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Determine whether the organization requires these features before assessing deployment. Distinguish service encryption, content encryption and support-access approval. Review supported workloads and recovery dependencies; tabletop key loss without deleting keys.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/customer-lockbox-requests); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### LOG-01

**Audit ingestion and event visibility** — [Run LOG-01.ps1](../scripts/controls/LOG-01.ps1)

**Live read operations:** [`auditConfig`](SCRIPT-OPERATIONS.md#auditconfig), [`exoOrg`](SCRIPT-OPERATIONS.md#exoorg), [`ual`](SCRIPT-OPERATIONS.md#ual), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `LOG-01.json`, records with `knownEvents`, `ingestionDelays`, `workloadCoverage`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Read ingestion status in the Exchange Online context. Identify required operations by workload. Trace a permitted known action using UTC time, actor and object; record ingestion delay, permissions and missing events separately.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-search); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

### LOG-02

**Retention by source, user and workload** — [Run LOG-02.ps1](../scripts/controls/LOG-02.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`auditRetention`](SCRIPT-OPERATIONS.md#auditretention), [`signIns`](SCRIPT-OPERATIONS.md#signins), [`ual`](SCRIPT-OPERATIONS.md#ual).

**Required local evidence:** `LOG-02.json`, records with `retentionMatrix`, `historicalKnownEvents`, `archiveQueries`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** For each source, document required history and actual entitlement/configuration. Review user-specific premium coverage and policy priority. Query historical known records and distinguish source retention from search-job history.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/audit-search)

### LOG-03

**Collection completeness and pipeline health** — [Run LOG-03.ps1](../scripts/controls/LOG-03.ps1)

**Live read operations:** [`signIns`](SCRIPT-OPERATIONS.md#signins), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit), [`ual`](SCRIPT-OPERATIONS.md#ual).

**Required local evidence:** `LOG-03.json`, records with `sourceCounts`, `siemCounts`, `ingestionLatency`, `missingIntervals`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile population and event counts. Follow all pages, partition capped windows and de-duplicate stable event IDs. Check throttling, connector failures, ingestion latency, authentication expiry and alerting on collector outage.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/graph/paging); [Microsoft reference 2](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

### LOG-04

**Evidence integrity and privileged access** — [Run LOG-04.ps1](../scripts/controls/LOG-04.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `LOG-04.json`, records with `evidenceRegister`, `storageAcl`, `immutability`, `accessLogs`, `custodyTransfers`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inspect raw-versus-working copies and storage permissions. Recompute a sample hash; trace transfers and modifications. Confirm collected data is proportionate and never stored in a public methodology repository.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/edisc-features-components)

### LOG-05

**Alerts for sensitive configuration changes** — [Run LOG-05.ps1](../scripts/controls/LOG-05.ps1)

**Live read operations:** [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit), [`alerts`](SCRIPT-OPERATIONS.md#alerts), [`incidents`](SCRIPT-OPERATIONS.md#incidents).

**Required local evidence:** `LOG-05.json`, records with `alertRules`, `changeCases`, `alertReceipt`, `responseTimes`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Select high-impact changes: role grant, credential addition, forwarding, consent, logging disablement and backup changes. Trace approved benign events through detection, routing, acknowledgement and escalation.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [Microsoft reference 2](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [Microsoft reference 4](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

### SOC-01

**Cross-workload detection coverage** — [Run SOC-01.ps1](../scripts/controls/SOC-01.ps1)

**Live read operations:** [`alerts`](SCRIPT-OPERATIONS.md#alerts), [`incidents`](SCRIPT-OPERATIONS.md#incidents), [`secureScores`](SCRIPT-OPERATIONS.md#securescores).

**Required local evidence:** `SOC-01.json`, records with `detectionMatrix`, `requiredSignals`, `routingEvidence`, `coverageGaps`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Map identity compromise, malicious consent, mailbox abuse and data access to available telemetry. Sample cases across identity, email and endpoint. Review suppressions and integration failures, including outsourced SOC responsibilities.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [Microsoft reference 2](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

### SOC-02

**Account and token compromise exercise** — [Run SOC-02.ps1](../scripts/controls/SOC-02.ps1)

**Live read operations:** [`signIns`](SCRIPT-OPERATIONS.md#signins), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit), [`incidents`](SCRIPT-OPERATIONS.md#incidents).

**Required local evidence:** `SOC-02.json`, records with `containmentTimeline`, `sessionRevocationEvidence`, `appAccessEvidence`, `exerciseAcceptance`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Tabletop or rehearse with test identities: detect compromise, preserve evidence, isolate relevant access, remove persistence and verify restoration. Include application sessions and malicious grants so password reset is not the only action.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [Microsoft reference 2](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

### SOC-03

**Phishing and malicious app response** — [Run SOC-03.ps1](../scripts/controls/SOC-03.ps1)

**Live read operations:** [`incidents`](SCRIPT-OPERATIONS.md#incidents), [`alerts`](SCRIPT-OPERATIONS.md#alerts), [`apps`](SCRIPT-OPERATIONS.md#apps), [`grants`](SCRIPT-OPERATIONS.md#grants).

**Required local evidence:** `SOC-03.json`, records with `phishingCase`, `consentCase`, `containmentRecords`, `recoveredEvidence`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Use a synthetic report or historical sanitized incident. Identify recipients, interaction, account activity, grants and affected data. Verify escalation to identity/app owners and documented closure evidence; separate real incidents from audit observations.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [Microsoft reference 2](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

### SOC-04

**Response authority and evidence readiness** — [Run SOC-04.ps1](../scripts/controls/SOC-04.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`incidents`](SCRIPT-OPERATIONS.md#incidents).

**Required local evidence:** `SOC-04.json`, records with `incidentAuthority`, `alternateCommunications`, `legalContacts`, `evidenceAccess`, `exerciseAcceptance`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Test contact availability and who can authorize disruptive containment. Check support-provider SLAs and evidence access during tenant outage. Review notification decisions with the responsible legal team rather than inventing deadlines.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### REC-01

**Business recovery requirements and coverage** — [Run REC-01.ps1](../scripts/controls/REC-01.ps1)

**Live read operations:** [`backupPolicies`](SCRIPT-OPERATIONS.md#backuppolicies), [`sites`](SCRIPT-OPERATIONS.md#sites), [`mailboxes`](SCRIPT-OPERATIONS.md#mailboxes).

**Required local evidence:** `REC-01.json`, records with `businessImpact`, `recoveryUnits`, `rtoSeconds`, `rpoSeconds`, `coverageReconciliation`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Define recovery units and dependencies for mail, files, sites, chats, configurations, apps and keys. Reconcile protection scope against the inventory. Distinguish provider availability from customer data restoration and tenant reconstruction.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### REC-02

**Timed restore and integrity exercise** — [Run REC-02.ps1](../scripts/controls/REC-02.ps1)

**Live read operations:** [`backupPolicies`](SCRIPT-OPERATIONS.md#backuppolicies), [`restoreSessions`](SCRIPT-OPERATIONS.md#restoresessions).

**Required local evidence:** `REC-02.json`, records with `startedUtc`, `acceptedUtc`, `recoveryPointUtc`, `incidentUtc`, `rtoSeconds`, `rpoSeconds`, `integrityChecks`, `businessAcceptance`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Restore representative synthetic content to an approved isolated destination. Measure from declared recovery start to business acceptance; record data age, errors, permissions and prerequisites. Include one bulk or dependency-rich scenario where required.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

### REC-03

**Backup administration and destructive change** — [Run REC-03.ps1](../scripts/controls/REC-03.ps1)

**Live read operations:** [`backupPolicies`](SCRIPT-OPERATIONS.md#backuppolicies), [`roles`](SCRIPT-OPERATIONS.md#roles), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `REC-03.json`, records with `backupAdminRoles`, `destructiveChangeControls`, `separateApprovals`, `compromiseExercise`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review who can alter coverage, retention or recovery data. Inspect destructive-change safeguards and monitoring. Tabletop a compromised production admin and a lost backup credential; examine retention/deletion behavior for the actual platform.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference)

### REC-04

**Tenant configuration and service outage recovery** — [Run REC-04.ps1](../scripts/controls/REC-04.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`ca`](SCRIPT-OPERATIONS.md#ca), [`health`](SCRIPT-OPERATIONS.md#health), [`messages`](SCRIPT-OPERATIONS.md#messages).

**Required local evidence:** `REC-04.json`, records with `configurationExports`, `dependencyMap`, `outageProcedure`, `recoveryExercise`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Identify rebuild sequence, credential access and trusted recovery copies. Rehearse a service or dependency outage without destructive production testing. Confirm staff can access runbooks and support channels outside the affected tenant.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

### AI-01

**AI inventory and approved data flows** — [Run AI-01.ps1](../scripts/controls/AI-01.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`apps`](SCRIPT-OPERATIONS.md#apps), [`principals`](SCRIPT-OPERATIONS.md#principals), [`grants`](SCRIPT-OPERATIONS.md#grants).

**Required local evidence:** `AI-01.json`, records with `aiInventory`, `dataFlows`, `processingLocations`, `approvedUse`, `retention`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Distinguish enterprise experiences from consumer services and extensions. Record grounding sources, actions, identities, external endpoints, retention and feature availability. Review material changes against the actual service documentation.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [Microsoft reference 2](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [Microsoft reference 3](https://www.microsoft.com/licensing/terms/)

### AI-02

**Oversharing and discovery restrictions** — [Run AI-02.ps1](../scripts/controls/AI-02.ps1)

**Live read operations:** [`sites`](SCRIPT-OPERATIONS.md#sites), [`itemPermissions`](SCRIPT-OPERATIONS.md#itempermissions), [`groupMembers`](SCRIPT-OPERATIONS.md#groupmembers).

**Required local evidence:** `AI-02.json`, records with `discoverySettings`, `permissionSamples`, `retrievalCases`, `directAccessCases`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Test approved personas with seeded synthetic documents. Compare direct file access, search discovery and AI retrieval separately. Inspect broad permissions and temporary discovery controls; do not infer protection from a single unsuccessful prompt.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [Microsoft reference 2](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery); [Microsoft reference 3](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

### AI-03

**Agent tools, identity and adversarial behavior** — [Run AI-03.ps1](../scripts/controls/AI-03.ps1)

**Live read operations:** [`apps`](SCRIPT-OPERATIONS.md#apps), [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`grants`](SCRIPT-OPERATIONS.md#grants), [`federatedCredentials`](SCRIPT-OPERATIONS.md#federatedcredentials).

**Required local evidence:** `AI-03.json`, records with `agentInventory`, `tools`, `endpoints`, `approvalGates`, `adversarialCases`, `actionLogs`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** In a controlled environment, supply synthetic instructions embedded in untrusted content and ask for an out-of-scope action. Inspect whether the agent's credential can perform it, whether confirmation is enforced and whether actions are logged.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

### AI-04

**AI auditability, retention and incident handling** — [Run AI-04.ps1](../scripts/controls/AI-04.ps1)

**Live read operations:** [`retention`](SCRIPT-OPERATIONS.md#retention), [`ual`](SCRIPT-OPERATIONS.md#ual), [`incidents`](SCRIPT-OPERATIONS.md#incidents).

**Required local evidence:** `AI-04.json`, records with `aiEventSamples`, `conversationRetention`, `incidentRouting`, `investigationCase`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Identify which events and artifacts exist for each experience and license. Test synthetic interaction retrieval and permitted investigation access; review external extension logs and output handling. Confirm an owner handles inaccurate or sensitive outputs.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/edisc-features-components)

### PP-01

**Environment and maker governance** — [Run PP-01.ps1](../scripts/controls/PP-01.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`users`](SCRIPT-OPERATIONS.md#users), [`ppEnvironments`](SCRIPT-OPERATIONS.md#ppenvironments).

**Required local evidence:** `PP-01.json`, records with `environmentExport`, `makerRoles`, `environmentOwners`, `lifecycleDecisions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile apps, flows and agents to business owners. Inspect who can create environments, use premium features and share applications. Include orphaned resources, personal connections, unmanaged production and acquisition remnants.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [Microsoft reference 2](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [Microsoft reference 3](https://www.microsoft.com/licensing/terms/)

### PP-02

**Connector and data policy effectiveness** — [Run PP-02.ps1](../scripts/controls/PP-02.ps1)

**Live read operations:** [`apps`](SCRIPT-OPERATIONS.md#apps), [`grants`](SCRIPT-OPERATIONS.md#grants).

**Required local evidence:** `PP-02.json`, records with `dataPolicyExport`, `connectorGroups`, `endpointRules`, `policyMode`, `allowedCase`, `prohibitedCase`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Identify which policy model actually applies. Review new connector defaults, custom connectors, HTTP/MCP actions and environment exclusions. Test allowed and forbidden connector combinations at design and runtime; verify current limitations.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [Microsoft reference 2](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [Microsoft reference 3](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification)

### PP-03

**Connections, application permissions and release control** — [Run PP-03.ps1](../scripts/controls/PP-03.ps1)

**Live read operations:** [`apps`](SCRIPT-OPERATIONS.md#apps), [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`grants`](SCRIPT-OPERATIONS.md#grants).

**Required local evidence:** `PP-03.json`, records with `appFlowInventory`, `connectionOwners`, `connectionReferences`, `releaseApprovals`, `effectivePermissions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Trace the identity and permissions used by sensitive flows. Review who can edit versus invoke, approval steps and source control. Test a forbidden invocation using a controlled low-privilege user.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/graph/permissions-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### PP-04

**Operational resilience and data accountability** — [Run PP-04.ps1](../scripts/controls/PP-04.ps1)

**Live read operations:** [`health`](SCRIPT-OPERATIONS.md#health), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`ppEnvironments`](SCRIPT-OPERATIONS.md#ppenvironments).

**Required local evidence:** `PP-04.json`, records with `flowFailureExport`, `dataverseCapacity`, `continuityRecords`, `recoveryAcceptance`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Trace a failed critical flow to notification and recovery. Verify solution and data protection separately, connection reauthorization and dependency restoration. Check retention, audit coverage and environment deletion authority.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### FAB-01

**Public publishing and external sharing** — [Run FAB-01.ps1](../scripts/controls/FAB-01.ps1)

**Live read operations:** [`groups`](SCRIPT-OPERATIONS.md#groups), [`users`](SCRIPT-OPERATIONS.md#users), [`fabricSettings`](SCRIPT-OPERATIONS.md#fabricsettings), [`publicEmbeds`](SCRIPT-OPERATIONS.md#publicembeds).

**Required local evidence:** `FAB-01.json`, records with `fabricTenantSettings`, `publicEmbedInventory`, `externalSharing`, `publicAccessObservations`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review existing public embeds as well as future publishing permissions. Inspect sensitive reports, underlying models and scoped tenant exceptions. Validate access using an unauthenticated browser on synthetic content only.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [Microsoft reference 2](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

### FAB-02

**Workspace and semantic data permissions** — [Run FAB-02.ps1](../scripts/controls/FAB-02.ps1)

**Live read operations:** [`groups`](SCRIPT-OPERATIONS.md#groups), [`groupMembers`](SCRIPT-OPERATIONS.md#groupmembers), [`apps`](SCRIPT-OPERATIONS.md#apps), [`grants`](SCRIPT-OPERATIONS.md#grants), [`fabricWorkspaces`](SCRIPT-OPERATIONS.md#fabricworkspaces), [`fabricWorkspaceUsers`](SCRIPT-OPERATIONS.md#fabricworkspaceusers).

**Required local evidence:** `FAB-02.json`, records with `workspaceAccess`, `itemAccess`, `semanticModelRoles`, `sourceCredentials`, `effectiveAccessCases`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Map representative personas through report and model access to underlying sources. Test restricted data using the actual assigned role; do not assume viewer controls apply to privileged editors. Review gateway and service identity custody.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview)

### FAB-03

**Analytics governance and continuity** — [Run FAB-03.ps1](../scripts/controls/FAB-03.ps1)

**Live read operations:** [`health`](SCRIPT-OPERATIONS.md#health), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`fabricWorkspaces`](SCRIPT-OPERATIONS.md#fabricworkspaces).

**Required local evidence:** `FAB-03.json`, records with `lineageExport`, `refreshHistory`, `gatewayInventory`, `workspaceOwners`, `continuityRecords`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Trace critical reports to data sources, gateway credentials and owners. Review exports and external storage; test refresh failure notification and recovery of definitions/configuration. Assess data retention separately from report artifacts.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/sensitivity-labels); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### OPS-01

**Health, change and lifecycle management** — [Run OPS-01.ps1](../scripts/controls/OPS-01.ps1)

**Live read operations:** [`health`](SCRIPT-OPERATIONS.md#health), [`messages`](SCRIPT-OPERATIONS.md#messages).

**Required local evidence:** `OPS-01.json`, records with `serviceOwners`, `changeImpact`, `lifecycleActions`, `incidentCommunications`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Sample a recent service change, deprecation and outage. Verify impact analysis, assigned actions, communication and closure. Review preview features and automatically enabled services against governance.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide); [Microsoft reference 2](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [Microsoft reference 3](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search); [Microsoft reference 4](https://learn.microsoft.com/en-us/purview/ediscovery)

### OPS-02

**Cost, capacity and license hygiene** — [Run OPS-02.ps1](../scripts/controls/OPS-02.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`users`](SCRIPT-OPERATIONS.md#users), [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices), [`sites`](SCRIPT-OPERATIONS.md#sites).

**Required local evidence:** `OPS-02.json`, records with `billingExports`, `capacityReports`, `allocationDecisions`, `dormantLicenseReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Identify unused allocations and expiring trials, but check holds, shared mailbox requirements, backup and dependencies before reclaiming. Review capacity forecasts and pay-as-you-go owners; validate proposed savings against contract terms.

**Microsoft basis:** [Microsoft reference 1](https://www.microsoft.com/licensing/terms/); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [Microsoft reference 4](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

### OPS-03

**Supplier and shared-responsibility assurance** — [Run OPS-03.ps1](../scripts/controls/OPS-03.ps1)

**Live read operations:** [`apps`](SCRIPT-OPERATIONS.md#apps), [`grants`](SCRIPT-OPERATIONS.md#grants), [`delegatedAdmin`](SCRIPT-OPERATIONS.md#delegatedadmin).

**Required local evidence:** `OPS-03.json`, records with `supplierRegister`, `sharedResponsibilities`, `contracts`, `assuranceReports`, `accessReviews`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review available supplier assurance for the actual service and period. Identify customer responsibilities, exclusions, subservices and integration risks. Map required actions to tenant evidence and service-owner procedures.

**Microsoft basis:** [Microsoft reference 1](https://www.microsoft.com/licensing/terms/); [Microsoft reference 2](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)

### OPS-04

**Long-term drift and re-audit** — [Run OPS-04.ps1](../scripts/controls/OPS-04.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`roles`](SCRIPT-OPERATIONS.md#roles), [`apps`](SCRIPT-OPERATIONS.md#apps), [`licenses`](SCRIPT-OPERATIONS.md#licenses).

**Required local evidence:** `OPS-04.json`, records with `priorBaseline`, `driftReview`, `changeApprovals`, `retestEvidence`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Identify which controls need continuous monitoring versus periodic interviews/tests. Pin tool versions and preserve baseline changes. Track new services and permissions, and compare like-for-like populations rather than only scores.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

### EXT-01

**Government and sovereign cloud fit** — [Run EXT-01.ps1](../scripts/controls/EXT-01.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`domains`](SCRIPT-OPERATIONS.md#domains).

**Required local evidence:** `EXT-01.json`, records with `cloudServiceMatrix`, `contractualRequirements`, `featureAvailability`, `prohibitedIntegrations`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Validate each service, API and scanner against the actual cloud. Record unavailable or differently deployed features and data-handling boundaries. Use cloud-appropriate authentication; report untested tool support separately.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [Microsoft reference 2](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [Microsoft reference 3](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

### EXT-02

**Education, frontline and shared-user populations** — [Run EXT-02.ps1](../scripts/controls/EXT-02.ps1)

**Live read operations:** [`users`](SCRIPT-OPERATIONS.md#users), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`devices`](SCRIPT-OPERATIONS.md#devices), [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices).

**Required local evidence:** `EXT-02.json`, records with `populationTypes`, `sharedDeviceControls`, `studentSafeguards`, `shiftAccessCases`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Separate staff, students, minors where applicable, temporary workers and shared devices in sampling. Confirm actual SKU capability and approved privacy obligations. Test rapid turnover, shared-session cleanup and resource access without assuming enterprise defaults.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/app-management/protection/overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access); [Microsoft reference 3](https://www.microsoft.com/licensing/terms/); [Microsoft reference 4](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide)

### EXT-03

**Multi-Geo and residency verification** — [Run EXT-03.ps1](../scripts/controls/EXT-03.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`users`](SCRIPT-OPERATIONS.md#users), [`sites`](SCRIPT-OPERATIONS.md#sites).

**Required local evidence:** `EXT-03.json`, records with `geoAssignments`, `workloadResidency`, `contractBoundary`, `transferReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Map each requirement to the exact workload and data category. Distinguish storage from processing and support access. Verify current versus committed locations, pending moves and external copies.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/enterprise/moving-data-to-new-datacenter-geos?view=o365-worldwide); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-multi-geo); [Microsoft reference 4](https://www.microsoft.com/licensing/terms/)

### EXT-04

**Loop and SharePoint Embedded** — [Run EXT-04.ps1](../scripts/controls/EXT-04.ps1)

**Live read operations:** [`sites`](SCRIPT-OPERATIONS.md#sites), [`drives`](SCRIPT-OPERATIONS.md#drives), [`apps`](SCRIPT-OPERATIONS.md#apps).

**Required local evidence:** `EXT-04.json`, records with `loopStorageMap`, `embeddedContainers`, `owners`, `externalAccess`, `retentionCoverage`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Identify actual storage for each content type and creator experience. Verify membership, lifecycle, retention and eDiscovery against current capability tables. Test a synthetic artifact through discovery and authorized access; do not assume all storage variants behave identically.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/loop/loop-compliance-summary?view=o365-worldwide); [Microsoft reference 2](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/edisc-features-components)

### EXT-05

**Forms and public intake** — [Run EXT-05.ps1](../scripts/controls/EXT-05.ps1)

**Live read operations:** [`users`](SCRIPT-OPERATIONS.md#users), [`licenses`](SCRIPT-OPERATIONS.md#licenses).

**Required local evidence:** `EXT-05.json`, records with `formsSettings`, `formOwnerInventory`, `externalResponses`, `sensitiveCollectionControls`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Sample public forms, sensitive questions and response exports. Verify ownership transfer, respondent identity needs, anonymous access and collaboration links. Trace stored responses and connected automation to their retention and access controls.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-forms/set-up-microsoft-forms); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/retention); [Microsoft reference 3](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy)

### EXT-06

**Other enabled productivity workloads** — [Run EXT-06.ps1](../scripts/controls/EXT-06.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`apps`](SCRIPT-OPERATIONS.md#apps).

**Required local evidence:** `EXT-06.json`, records with `enabledServiceRegister`, `storageMap`, `owners`, `auditCoverage`, `retentionCoverage`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** For every enabled service, complete the workload worksheet: identity, sharing, storage, licensing, retention, audit and recovery. Identify its backing services and verify current product-specific documentation before issuing a result. Escalate unsupported assumptions as scope gaps.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [Microsoft reference 2](https://www.microsoft.com/licensing/terms/); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### EXT-07

**Mergers and multiple tenants** — [Run EXT-07.ps1](../scripts/controls/EXT-07.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`crossPartners`](SCRIPT-OPERATIONS.md#crosspartners), [`delegatedAdmin`](SCRIPT-OPERATIONS.md#delegatedadmin).

**Required local evidence:** `EXT-07.json`, records with `tenantInventory`, `migrationCoexistence`, `trustApprovals`, `exitCriteria`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review who retains access before, during and after transition. Inspect partner-specific trust, cross-tenant synchronization and migration service accounts. Reconcile retention and evidence obligations before decommissioning.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/retention)

### EXT-08

**Regulated control overlay and formal assurance** — [Run EXT-08.ps1](../scripts/controls/EXT-08.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`roles`](SCRIPT-OPERATIONS.md#roles).

**Required local evidence:** `EXT-08.json`, records with `frameworkVersion`, `controlCrosswalk`, `evidencePeriod`, `independentAssurance`, `exclusions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Map each applicable requirement to one or more control tests and identify uncovered clauses. Have qualified owners interpret legal requirements. Validate technical evidence, process operation and provider/customer boundaries separately.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/compliance-manager); [Microsoft reference 2](https://www.microsoft.com/licensing/terms/)

### EXT-09

**Virtual desktops and Cloud PCs** — [Run EXT-09.ps1](../scripts/controls/EXT-09.ps1)

**Live read operations:** [`cloudPCs`](SCRIPT-OPERATIONS.md#cloudpcs), [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices), [`ca`](SCRIPT-OPERATIONS.md#ca), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `EXT-09.json`, records with `avdHostPools`, `imageSecurity`, `redirectPolicies`, `sessionAccessCases`, `continuity`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Apply endpoint and access tests to hosted desktops, including image lifecycle, local data, redirection and privileged sessions. Validate product-specific configuration against current primary documentation before scoring the deployment.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/device-security/endpoint-security-policies); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/microsoft-365-service-encryption)

### EXT-10

**Network and access dependencies** — [Run EXT-10.ps1](../scripts/controls/EXT-10.ps1)

**Live read operations:** [`domains`](SCRIPT-OPERATIONS.md#domains), [`namedLocations`](SCRIPT-OPERATIONS.md#namedlocations), [`inboundConnectors`](SCRIPT-OPERATIONS.md#inboundconnectors), [`outboundConnectors`](SCRIPT-OPERATIONS.md#outboundconnectors).

**Required local evidence:** `EXT-10.json`, records with `dnsExport`, `proxyPaths`, `egressRules`, `connectivityMeasurements`, `failureDependencies`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Trace administrator and user connectivity to authentication and workloads. Review who controls DNS and named locations; identify proxy bypass and authentication dependencies. Test a representative outage or alternate access path under an approved plan.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide)

### EXT-11

**Accessibility and control usability** — [Run EXT-11.ps1](../scripts/controls/EXT-11.ps1)

**Live read operations:** [`authPolicy`](SCRIPT-OPERATIONS.md#authpolicy), [`ca`](SCRIPT-OPERATIONS.md#ca), [`appProtection`](SCRIPT-OPERATIONS.md#appprotection).

**Required local evidence:** `EXT-11.json`, records with `accessibilityRequirements`, `userTestRecords`, `approvedAlternatives`, `equivalentProtection`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review whether users with differing devices, connectivity or accessibility needs can use approved controls. Test representative personas and recovery paths. Track repeated support workarounds as evidence of a design gap.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)


## Numbered fieldwork steps

### T01-01

**T01 step 1** — [Run T01-01.ps1](../scripts/steps/T01-01.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`defaults`](SCRIPT-OPERATIONS.md#defaults), [`namedLocations`](SCRIPT-OPERATIONS.md#namedlocations).

**Required local evidence:** `T01-01.json`, records with `personaMatrix`, `exclusions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Export all policy states, assignments, conditions, grant/session controls and exclusions. Record the security-defaults alternative where used. Build cases for administrators, ordinary staff, guests and exceptions. [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [S63: Security defaults in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)

### T01-02

**T01 step 2** — [Run T01-02.ps1](../scripts/steps/T01-02.ps1)

**Live read operations:** [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `T01-02.json`, records with `resource`, `client`, `location`, `deviceState`, `existingClaims`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Select a test resource/client combination per case. Include trusted/untrusted location and managed/unmanaged device cases when material. Record existing authentication claims; absence of an interactive MFA prompt does not alone prove bypass. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### T01-03

**T01 step 3** — [Run T01-03.ps1](../scripts/steps/T01-03.ps1)

**Live read operations:** [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `T01-03.json`, records with `allowedCase`, `prohibitedCase`, `correlationIds`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** In an authorized fresh session, perform an allowed attempt and a case that should fail the adopted requirement. Record correlation identifiers and actual sign-in authentication/Conditional Access details. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### T01-04

**T01 step 4** — [Run T01-04.ps1](../scripts/steps/T01-04.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`crossDefault`](SCRIPT-OPERATIONS.md#crossdefault), [`crossPartners`](SCRIPT-OPERATIONS.md#crosspartners), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `T01-04.json`, records with `effectivePolicyReview`, `acceptedClaims`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Resolve how multiple policies and accepted guest claims affected the result. Treat What If or report-only output as design evidence and corroborate operation separately. [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [S16: Cross-tenant access overview](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/external-id/cross-tenant-access-overview)

### T01-05

**T01 step 5** — [Run T01-05.ps1](../scripts/steps/T01-05.ps1)

**Live read operations:** [`principals`](SCRIPT-OPERATIONS.md#principals), [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`grants`](SCRIPT-OPERATIONS.md#grants).

**Required local evidence:** `T01-05.json`, records with `workloadBoundaryTests`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Do not apply this human-MFA test to app-only identities. Inspect supported workload controls and effective app permission boundaries instead. [S10: Conditional Access for workload identities](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/workload-identity); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview)

### T02-01

**T02 step 1** — [Run T02-01.ps1](../scripts/steps/T02-01.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`authMethods`](SCRIPT-OPERATIONS.md#authmethods), [`ca`](SCRIPT-OPERATIONS.md#ca).

**Required local evidence:** `T02-01.json`, records with `independentDependencies`, `custody`, `alerts`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review account independence, permanent active role assignment, authentication methods, policy exclusions, custody and alerts against the live emergency-access guidance. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### T02-02

**T02 step 2** — [Run T02-02.ps1](../scripts/steps/T02-02.ps1)

**Live read operations:** [`federation`](SCRIPT-OPERATIONS.md#federation).

**Required local evidence:** `T02-02.json`, records with `exercisePlan`, `alternateDependencies`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Plan a controlled exercise in which the normal phone or federation path is treated as unavailable. Do not actually disable production identity infrastructure for an audit walkthrough. This non-disruptive exercise design is **consultant method**. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [S65: Entra Connect prerequisites](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)

### T02-03

**T02 step 3** — [Run T02-03.ps1](../scripts/steps/T02-03.ps1)

**Live read operations:** [`signIns`](SCRIPT-OPERATIONS.md#signins), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `T02-03.json`, records with `custodianDemonstration`, `alertReceipt`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Have an authorized custodian demonstrate credential retrieval and sign-in from the approved secure environment; verify the resulting alert reaches its owner. [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### T02-04

**T02 step 4** — [Run T02-04.ps1](../scripts/steps/T02-04.ps1)

**Live read operations:** None for this procedural step; examine the existing records below..

**Required local evidence:** `T02-04.json`, records with `timing`, `alternateCustodian`, `cleanupRecord`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Record timing, unexpected dependencies, alternate custodian availability and cleanup. Keep credential material out of evidence exports. **Consultant handling method.** [S07: Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)

### T03-01

**T03 step 1** — [Run T03-01.ps1](../scripts/steps/T03-01.ps1)

**Live read operations:** [`apps`](SCRIPT-OPERATIONS.md#apps), [`principals`](SCRIPT-OPERATIONS.md#principals), [`grants`](SCRIPT-OPERATIONS.md#grants), [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`appOwners`](SCRIPT-OPERATIONS.md#appowners), [`federatedCredentials`](SCRIPT-OPERATIONS.md#federatedcredentials).

**Required local evidence:** `T03-01.json`, records with `approvedResourceScopes`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inventory service principals, delegated grants, app role assignments, owners and credential metadata; identify high-impact access and resource scoping. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview)

### T03-02

**T03 step 2** — [Run T03-02.ps1](../scripts/steps/T03-02.ps1)

**Live read operations:** [`authorization`](SCRIPT-OPERATIONS.md#authorization), [`grants`](SCRIPT-OPERATIONS.md#grants), [`appRoles`](SCRIPT-OPERATIONS.md#approles).

**Required local evidence:** `T03-02.json`, records with `consentApprovals`, `businessNeed`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Match grants to approval and business need. Review old grants even when new user consent is restricted. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent)

### T03-03

**T03 step 3** — [Run T03-03.ps1](../scripts/steps/T03-03.ps1)

**Live read operations:** [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`grants`](SCRIPT-OPERATIONS.md#grants).

**Required local evidence:** `T03-03.json`, records with `allowedCase`, `prohibitedCase`, `resource`, `authMode`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** With a controlled app identity, test an allowed resource/action and a prohibited resource/action. Record status, resource and authentication mode without capturing tokens. **Consultant test design.** [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/graph/permissions-overview)

### T03-04

**T03 step 4** — [Run T03-04.ps1](../scripts/steps/T03-04.ps1)

**Live read operations:** [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `T03-04.json`, records with `ownershipLossCase`, `credentialAdditionCase`, `decommissioningCase`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Tabletop ownership loss, credential addition and app decommissioning. Confirm incident procedures can revoke malicious access beyond password reset. [S14: App consent grant investigation](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [S15: Revoke user access in an emergency](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access)

### T04-01

**T04 step 1** — [Run T04-01.ps1](../scripts/steps/T04-01.ps1)

**Live read operations:** [`itemPermissions`](SCRIPT-OPERATIONS.md#itempermissions), [`groupMembers`](SCRIPT-OPERATIONS.md#groupmembers).

**Required local evidence:** `T04-01.json`, records with `syntheticDocumentManifest`, `intendedAudience`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Create approved synthetic documents representing sensitive and ordinary information. Record their intended audiences and actual group/direct permissions. **Consultant test design.** [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### T04-02

**T04 step 2** — [Run T04-02.ps1](../scripts/steps/T04-02.ps1)

**Live read operations:** [`itemPermissions`](SCRIPT-OPERATIONS.md#itempermissions).

**Required local evidence:** `T04-02.json`, records with `directAccessCase`, `sharingLinkCase`, `searchCase`, `personas`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Test access through a direct URL, existing sharing link and relevant search experience with an owner, authorized recipient, ordinary internal user and external test user. [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery)

### T04-03

**T04 step 3** — [Run T04-03.ps1](../scripts/steps/T04-03.ps1)

**Live read operations:** [`itemPermissions`](SCRIPT-OPERATIONS.md#itempermissions).

**Required local evidence:** `T04-03.json`, records with `retrievalPrompts`, `groundingReferences`, `directAccessCase`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** If Copilot is in scope, test representative retrieval prompts and inspect grounding references. Repeat direct access independently; an unsuccessful prompt does not establish a permission boundary. **Consultant interpretation.** [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S28: Restrict discovery of SharePoint sites and content](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [Microsoft reference 2](https://learn.microsoft.com/en-us/sharepoint/restricted-content-discovery)

### T04-04

**T04 step 4** — [Run T04-04.ps1](../scripts/steps/T04-04.ps1)

**Live read operations:** [`labels`](SCRIPT-OPERATIONS.md#labels), [`labelPolicies`](SCRIPT-OPERATIONS.md#labelpolicies).

**Required local evidence:** `T04-04.json`, records with `containerLabel`, `fileLabel`, `downloadCase`, `forwardingCase`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Check container labels separately from document labels. Confirm how file protection behaves after download or forwarding through supported clients. [S36: Sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/sensitivity-labels)

### T04-05

**T04 step 5** — [Run T04-05.ps1](../scripts/steps/T04-05.ps1)

**Live read operations:** None for this procedural step; examine the existing records below..

**Required local evidence:** `T04-05.json`, records with `restrictedSearchExport`, `migrationDecision`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** For older Restricted SharePoint Search deployments, inspect the current retirement/migration guidance rather than recommending new enablement unconditionally. [S48: Restricted SharePoint Search](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/sharepoint/restricted-sharepoint-search)

### T05-01

**T05 step 1** — [Run T05-01.ps1](../scripts/steps/T05-01.ps1)

**Live read operations:** [`dkim`](SCRIPT-OPERATIONS.md#dkim), [`acceptedDomains`](SCRIPT-OPERATIONS.md#accepteddomains).

**Required local evidence:** `T05-01.json`, records with `senderPlatform`, `headers`, `traceIds`, `dnsRecords`, `alignment`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Select one authorized test message from each material sending platform; capture headers and message trace identifiers. Review SPF, DKIM and DMARC alignment for the actual sender domain. [S22: Configure SPF](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [S24: Configure DMARC](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure); [Microsoft reference 2](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure); [Microsoft reference 3](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)

### T05-02

**T05 step 2** — [Run T05-02.ps1](../scripts/steps/T05-02.ps1)

**Live read operations:** [`presetEop`](SCRIPT-OPERATIONS.md#preseteop), [`presetDefender`](SCRIPT-OPERATIONS.md#presetdefender), [`antiPhishRules`](SCRIPT-OPERATIONS.md#antiphishrules), [`spamRules`](SCRIPT-OPERATIONS.md#spamrules), [`safeLinksRules`](SCRIPT-OPERATIONS.md#safelinksrules), [`safeAttachmentsRules`](SCRIPT-OPERATIONS.md#safeattachmentsrules).

**Required local evidence:** `T05-02.json`, records with `recipientAssignments`, `precedenceDecision`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Resolve the recipient's effective threat policies. Standard/Strict preset precedence can override a custom policy that looks stronger when viewed in isolation. [S21: Preset security policies](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies)

### T05-03

**T05 step 3** — [Run T05-03.ps1](../scripts/steps/T05-03.ps1)

**Live read operations:** [`mailboxes`](SCRIPT-OPERATIONS.md#mailboxes), [`inboxRules`](SCRIPT-OPERATIONS.md#inboxrules), [`mailboxPermissions`](SCRIPT-OPERATIONS.md#mailboxpermissions), [`recipientPermissions`](SCRIPT-OPERATIONS.md#recipientpermissions), [`remoteDomains`](SCRIPT-OPERATIONS.md#remotedomains), [`transportRules`](SCRIPT-OPERATIONS.md#transportrules), [`outboundSpam`](SCRIPT-OPERATIONS.md#outboundspam).

**Required local evidence:** `T05-03.json`, records with `approvedForwardingDestinations`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inspect forwarding settings, rules, delegates, remote domains and mail-flow exceptions. For an authorized forwarding exercise, use a harmless marker and a controlled destination. **Consultant test design.** [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S87: Get-InboxRule](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-inboxrule?view=exchange-ps)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [Microsoft reference 2](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-inboxrule?view=exchange-ps)

### T05-04

**T05 step 4** — [Run T05-04.ps1](../scripts/steps/T05-04.ps1)

**Live read operations:** None for this procedural step; examine the existing records below..

**Required local evidence:** `T05-04.json`, records with `forwardingDeliveryCase`, `expectedResult`, `actualResult`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Confirm whether the forwarded message is delivered or blocked, and compare with the adopted requirement. Avoid inferring the result solely from “Automatic” forwarding settings. [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding)

### T05-05

**T05 step 5** — [Run T05-05.ps1](../scripts/steps/T05-05.ps1)

**Live read operations:** [`transport`](SCRIPT-OPERATIONS.md#transport), [`casMailboxes`](SCRIPT-OPERATIONS.md#casmailboxes), [`authPolicies`](SCRIPT-OPERATIONS.md#authpolicies), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `T05-05.json`, records with `clientInventory`, `authModes`, `retirementReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review actual SMTP client authentication and mailbox overrides. Check the current retirement timeline; distinguish Basic authentication from SMTP AUTH using OAuth. [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

**Microsoft basis:** [Microsoft reference 1](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835); [Microsoft reference 2](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission)

### T06-01

**T06 step 1** — [Run T06-01.ps1](../scripts/steps/T06-01.ps1)

**Live read operations:** [`auditConfig`](SCRIPT-OPERATIONS.md#auditconfig).

**Required local evidence:** `T06-01.json`, records with `exchangeSessionConfirmation`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Verify UAL ingestion in an Exchange Online session. Do not interpret the same property from an inappropriate session as authoritative; Microsoft documents this caveat. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable)

### T06-02

**T06 step 2** — [Run T06-02.ps1](../scripts/steps/T06-02.ps1)

**Live read operations:** [`ual`](SCRIPT-OPERATIONS.md#ual), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `T06-02.json`, records with `knownEvent`, `actor`, `object`, `operation`, `occurredUtc`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Select a documented audited operation and a known authorized occurrence. Record tenant, actor, object, operation and UTC timestamp. Query a sufficient window after expected ingestion. [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/audit-search)

### T06-03

**T06 step 3** — [Run T06-03.ps1](../scripts/steps/T06-03.ps1)

**Live read operations:** [`ual`](SCRIPT-OPERATIONS.md#ual), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `T06-03.json`, records with `rawEventFields`, `siemArrivalUtc`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Confirm the raw event exists and inspect its essential fields. Compare source and SIEM arrival time if a downstream pipeline is in scope. **Consultant correlation method.** [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/audit-search); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention)

### T06-04

**T06 step 4** — [Run T06-04.ps1](../scripts/steps/T06-04.ps1)

**Live read operations:** [`ual`](SCRIPT-OPERATIONS.md#ual), [`signIns`](SCRIPT-OPERATIONS.md#signins), [`auditRetention`](SCRIPT-OPERATIONS.md#auditretention).

**Required local evidence:** `T06-04.json`, records with `historicalKnownEvents`, `licenseStrata`, `archiveEvidence`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Retrieve an older known event within the required window for each material user/license/workload stratum. Record source-retention and archive evidence separately. [S17: Microsoft Entra data retention](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [S18: Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/reference-reports-data-retention); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies)

### T06-05

**T06 step 5** — [Run T06-05.ps1](../scripts/steps/T06-05.ps1)

**Live read operations:** [`ual`](SCRIPT-OPERATIONS.md#ual), [`signIns`](SCRIPT-OPERATIONS.md#signins), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `T06-05.json`, records with `sourceCounts`, `exportCounts`, `filters`, `duplicateReview`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile pagination, caps, filters, errors and duplicates before declaring the export complete. For large programmatic acquisition, follow Microsoft's API guidance. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/graph/paging); [Microsoft reference 2](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

### T07-01

**T07 step 1** — [Run T07-01.ps1](../scripts/steps/T07-01.ps1)

**Live read operations:** None for this procedural step; examine the existing records below..

**Required local evidence:** `T07-01.json`, records with `dataClass`, `location`, `actor`, `destination`, `expectedAction`, `exception`, `specimen`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Write a scenario: data class, location, actor, destination, expected action and permitted exception. Use a synthetic test pattern with the context needed by the chosen classifier. **Consultant design.** [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)

### T07-02

**T07 step 2** — [Run T07-02.ps1](../scripts/steps/T07-02.ps1)

**Live read operations:** [`dlp`](SCRIPT-OPERATIONS.md#dlp), [`dlpRules`](SCRIPT-OPERATIONS.md#dlprules).

**Required local evidence:** `T07-02.json`, records with `positiveSpecimen`, `negativeSpecimen`, `rulePriority`, `assignments`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Include a matching positive specimen and a similar nonmatching negative specimen. Record policy state, rule priority, included locations, assignments and exclusions. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

### T07-03

**T07 step 3** — [Run T07-03.ps1](../scripts/steps/T07-03.ps1)

**Live read operations:** [`alerts`](SCRIPT-OPERATIONS.md#alerts).

**Required local evidence:** `T07-03.json`, records with `allowedCase`, `prohibitedCase`, `userExperience`, `blockOverride`, `alertCase`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Test a permitted action and a prohibited transfer on approved clients. Record user experience, block/override behavior and corresponding alert/case. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)

### T07-04

**T07 step 4** — [Run T07-04.ps1](../scripts/steps/T07-04.ps1)

**Live read operations:** [`dlp`](SCRIPT-OPERATIONS.md#dlp), [`dlpRules`](SCRIPT-OPERATIONS.md#dlprules).

**Required local evidence:** `T07-04.json`, records with `excludedUserCase`, `secondLocationCase`, `policyMode`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Review an excluded user or a second location to identify unintended coverage gaps. When enforcement is not enabled, report only what simulation demonstrates. [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [S69: DLP simulation mode](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn)

### T07-05

**T07 step 5** — [Run T07-05.ps1](../scripts/steps/T07-05.ps1)

**Live read operations:** None for this procedural step; examine the existing records below..

**Required local evidence:** `T07-05.json`, records with `labeledCases`, `falsePositives`, `missedCases`, `testSetSize`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Measure false-positive and missed-case observations only within the labeled test set; do not extrapolate a detection rate for all organizational content. **Consultant interpretation.** [S37: Data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)

### T08-01

**T08 step 1** — [Run T08-01.ps1](../scripts/steps/T08-01.ps1)

**Live read operations:** [`devices`](SCRIPT-OPERATIONS.md#devices), [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices), [`compliance`](SCRIPT-OPERATIONS.md#compliance), [`complianceAssignments`](SCRIPT-OPERATIONS.md#complianceassignments).

**Required local evidence:** `T08-01.json`, records with `testDevices`, `defenderInventory`, `protectionState`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the test devices with inventory and document platform, enrollment, last check-in, assigned policies and protection state. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding)

### T08-02

**T08 step 2** — [Run T08-02.ps1](../scripts/steps/T08-02.ps1)

**Live read operations:** [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices), [`ca`](SCRIPT-OPERATIONS.md#ca), [`signIns`](SCRIPT-OPERATIONS.md#signins).

**Required local evidence:** `T08-02.json`, records with `compliantCase`, `noncompliantCase`, `unassignedCase`, `gracePeriodCase`, `noPolicySetting`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Test an assigned compliant device, a known noncompliant device, an unassigned device and a relevant grace-period case. Inspect the tenant's no-policy setting and actual access result. [S32: Intune device compliance policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [S09: Conditional Access overview](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### T08-03

**T08 step 3** — [Run T08-03.ps1](../scripts/steps/T08-03.ps1)

**Live read operations:** [`appProtection`](SCRIPT-OPERATIONS.md#appprotection).

**Required local evidence:** `T08-03.json`, records with `copyCase`, `saveCase`, `conditionalLaunchCase`, `selectiveRemovalRecord`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** On supported BYOD applications, test copy/save to a personal location using synthetic data; verify conditional launch and approved selective-removal behavior. [S33: Intune app protection policies](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/intune/app-management/protection/overview)

### T08-04

**T08 step 4** — [Run T08-04.ps1](../scripts/steps/T08-04.ps1)

**Live read operations:** [`alerts`](SCRIPT-OPERATIONS.md#alerts), [`incidents`](SCRIPT-OPERATIONS.md#incidents).

**Required local evidence:** `T08-04.json`, records with `validationProcedure`, `testDevice`, `telemetry`, `responderReceipt`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Verify a benign endpoint detection validation produces telemetry and reaches the expected responder. Use the product's approved procedure and a test device; do not introduce malware. **Consultant exercise boundary.** [S35: Onboard devices to Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [S43: Incident response playbooks](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-endpoint/configure-machines-onboarding); [Microsoft reference 2](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks)

### T09-01

**T09 step 1** — [Run T09-01.ps1](../scripts/steps/T09-01.ps1)

**Live read operations:** None for this procedural step; examine the existing records below..

**Required local evidence:** `T09-01.json`, records with `recoveryUnit`, `destination`, `knownGoodPoint`, `expectedContent`, `access`, `rtoSeconds`, `rpoSeconds`, `acceptanceOwner`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Define recovery unit, authorized destination, known-good point, expected content, access permissions, RTO/RPO, start event and acceptance owner before testing. These metrics are **consultant/business definitions**. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

### T09-02

**T09 step 2** — [Run T09-02.ps1](../scripts/steps/T09-02.ps1)

**Live read operations:** [`backupPolicies`](SCRIPT-OPERATIONS.md#backuppolicies).

**Required local evidence:** `T09-02.json`, records with `protectedUnits`, `restorePoints`, `dependencies`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Verify actual protection coverage and available restore points. Include dependencies such as configuration, credentials and connectors that may fall outside content protection. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

### T09-03

**T09 step 3** — [Run T09-03.ps1](../scripts/steps/T09-03.ps1)

**Live read operations:** [`restoreSessions`](SCRIPT-OPERATIONS.md#restoresessions).

**Required local evidence:** `T09-03.json`, records with `startedUtc`, `requestUtc`, `serviceCompletedUtc`, `acceptedUtc`, `destination`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Restore synthetic or approved test content to an isolated destination where supported. Record declaration time, request time, service completion and business acceptance separately. [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

### T09-04

**T09 step 4** — [Run T09-04.ps1](../scripts/steps/T09-04.ps1)

**Live read operations:** [`restoreSessions`](SCRIPT-OPERATIONS.md#restoresessions).

**Required local evidence:** `T09-04.json`, records with `startedUtc`, `acceptedUtc`, `recoveryPointUtc`, `incidentUtc`, `rtoSeconds`, `rpoSeconds`, `integrityChecks`, `businessAcceptance`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Validate readable content, relevant versions, item counts or hashes, permissions and owner acceptance. Calculate observed recovery duration and data age. **Consultant validation method.** [S42: Microsoft 365 Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

### T09-05

**T09 step 5** — [Run T09-05.ps1](../scripts/steps/T09-05.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit).

**Required local evidence:** `T09-05.json`, records with `backupAdminRoles`, `destructiveChangeSafeguards`, `compromiseExercise`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Tabletop backup administrator compromise and inspect destructive-change safeguards. Do not delete recovery copies to demonstrate a risk. **Consultant exercise boundary.** [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

### T09-06

**T09 step 6** — [Run T09-06.ps1](../scripts/steps/T09-06.ps1)

**Live read operations:** None for this procedural step; examine the existing records below..

**Required local evidence:** `T09-06.json`, records with `cleanupApproval`, `cleanupRecord`, `holdReview`, `scaleLimit`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Remove test artifacts only under the approved cleanup plan and retention/hold rules; document whether the tested scale represents a wider recovery claim. [S38: Retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention); [S41: Microsoft 365 Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/retention); [Microsoft reference 2](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide)

### T10-01

**T10 step 1** — [Run T10-01.ps1](../scripts/steps/T10-01.ps1)

**Live read operations:** [`apps`](SCRIPT-OPERATIONS.md#apps), [`grants`](SCRIPT-OPERATIONS.md#grants), [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`ppEnvironments`](SCRIPT-OPERATIONS.md#ppenvironments).

**Required local evidence:** `T10-01.json`, records with `runtimeIdentity`, `connectors`, `environment`, `tools`, `endpoints`, `policyMode`, `exceptions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inventory an app/flow/agent's runtime identity, connectors, environment/workspace, tool permissions and external endpoints. Review the actual policy mode and exceptions. [S49: Power Platform data policy strategy](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy); [Microsoft reference 2](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies); [Microsoft reference 3](https://learn.microsoft.com/en-us/graph/permissions-overview)

### T10-02

**T10 step 2** — [Run T10-02.ps1](../scripts/steps/T10-02.ps1)

**Live read operations:** None for this procedural step; examine the existing records below..

**Required local evidence:** `T10-02.json`, records with `allowedCase`, `prohibitedCase`, `customConnectors`, `nonblockableConnectors`, `runtimeObservations`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Test one allowed and one prohibited synthetic data flow. Cover custom or nonblockable connectors in the active policy model; verify existing runtime behavior as well as maker experience. [S75: Power Platform connector classification](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification); [S50: Power Platform advanced connector policies](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/power-platform/admin/dlp-connector-classification); [Microsoft reference 2](https://learn.microsoft.com/en-us/power-platform/admin/advanced-connector-policies)

### T10-03

**T10 step 3** — [Run T10-03.ps1](../scripts/steps/T10-03.ps1)

**Live read operations:** [`publicEmbeds`](SCRIPT-OPERATIONS.md#publicembeds), [`fabricSettings`](SCRIPT-OPERATIONS.md#fabricsettings).

**Required local evidence:** `T10-03.json`, records with `publicEmbedInventory`, `approvedSyntheticPublicAccess`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Inspect existing public analytics embeds. A tenant restriction on future publishing is not a substitute for reviewing previously exposed content. Test public access only on approved synthetic material. **Consultant procedure.** [S51: Fabric export and sharing tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [S52: Power BI Publish to web](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-export-sharing); [Microsoft reference 2](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-publish-to-web)

### T10-04

**T10 step 4** — [Run T10-04.ps1](../scripts/steps/T10-04.ps1)

**Live read operations:** [`appRoles`](SCRIPT-OPERATIONS.md#approles), [`grants`](SCRIPT-OPERATIONS.md#grants).

**Required local evidence:** `T10-04.json`, records with `untrustedInstruction`, `requestedAction`, `authorizationDecision`, `approvalEvidence`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** For agents, place an out-of-scope instruction in untrusted synthetic content. Observe requested actions, tool authorization and required approvals. Model behavior alone is not the authorization boundary. **Consultant adversarial test.** [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview)

### T10-05

**T10 step 5** — [Run T10-05.ps1](../scripts/steps/T10-05.ps1)

**Live read operations:** [`ual`](SCRIPT-OPERATIONS.md#ual), [`incidents`](SCRIPT-OPERATIONS.md#incidents).

**Required local evidence:** `T10-05.json`, records with `testedAction`, `eventIds`, `incidentEvidence`, `permissionChangeRetest`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Verify event and incident evidence for the tested action, and repeat after any permission changes. [S47: Data, Privacy, and Security for Microsoft Copilot](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search)

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-privacy); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-search)


## Main playbook phases

### P01

**Engagement model** — [Run P01.ps1](../scripts/steps/P01.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`domains`](SCRIPT-OPERATIONS.md#domains), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`users`](SCRIPT-OPERATIONS.md#users), [`groups`](SCRIPT-OPERATIONS.md#groups), [`sites`](SCRIPT-OPERATIONS.md#sites), [`roles`](SCRIPT-OPERATIONS.md#roles), [`roleDefinitions`](SCRIPT-OPERATIONS.md#roledefinitions), [`pimActive`](SCRIPT-OPERATIONS.md#pimactive).

**Required local evidence:** `P01.json`, records with `charter`, `reviewPeriod`, `adoptedCriteria`, `sponsorAcceptance`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [Microsoft reference 2](https://www.microsoft.com/licensing/terms/); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [Microsoft reference 4](https://learn.microsoft.com/en-us/purview/compliance-manager); [Microsoft reference 5](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 6](https://learn.microsoft.com/en-us/graph/permissions-overview)

### P02

**Scope and discovery** — [Run P02.ps1](../scripts/steps/P02.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`domains`](SCRIPT-OPERATIONS.md#domains), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`users`](SCRIPT-OPERATIONS.md#users), [`groups`](SCRIPT-OPERATIONS.md#groups), [`sites`](SCRIPT-OPERATIONS.md#sites).

**Required local evidence:** `P02.json`, records with `workloadScope`, `procurementReconciliation`, `exclusions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide); [Microsoft reference 2](https://www.microsoft.com/licensing/terms/); [Microsoft reference 3](https://learn.microsoft.com/en-us/microsoft-365/enterprise/m365-dr-overview?view=o365-worldwide); [Microsoft reference 4](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [Microsoft reference 5](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies)

### P03

**Delivery plan and responsibilities** — [Run P03.ps1](../scripts/steps/P03.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`roleDefinitions`](SCRIPT-OPERATIONS.md#roledefinitions), [`pimActive`](SCRIPT-OPERATIONS.md#pimactive).

**Required local evidence:** `P03.json`, records with `deliveryPlan`, `responsibilityMatrix`, `escalationContacts`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview)

### P04

**Access and licensing** — [Run P04.ps1](../scripts/steps/P04.ps1)

**Live read operations:** [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`users`](SCRIPT-OPERATIONS.md#users), [`roles`](SCRIPT-OPERATIONS.md#roles), [`roleDefinitions`](SCRIPT-OPERATIONS.md#roledefinitions), [`pimActive`](SCRIPT-OPERATIONS.md#pimactive), [`pimEligible`](SCRIPT-OPERATIONS.md#pimeligible), [`groupMembers`](SCRIPT-OPERATIONS.md#groupmembers).

**Required local evidence:** `P04.json`, records with `accessRequest`, `roleScope`, `licenseMatrix`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies); [Microsoft reference 3](https://www.microsoft.com/licensing/terms/); [Microsoft reference 4](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 5](https://learn.microsoft.com/en-us/graph/permissions-overview)

### P05

**Evidence and collection quality** — [Run P05.ps1](../scripts/steps/P05.ps1)

**Live read operations:** [`signIns`](SCRIPT-OPERATIONS.md#signins), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit), [`ual`](SCRIPT-OPERATIONS.md#ual), [`roles`](SCRIPT-OPERATIONS.md#roles).

**Required local evidence:** `P05.json`, records with `evidenceRegister`, `custody`, `collectionLimits`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/graph/paging); [Microsoft reference 2](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/edisc-features-components)

### P06

**Sampling and operating effectiveness** — [Run P06.ps1](../scripts/steps/P06.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`defaults`](SCRIPT-OPERATIONS.md#defaults), [`authPolicy`](SCRIPT-OPERATIONS.md#authpolicy), [`registration`](SCRIPT-OPERATIONS.md#registration), [`signIns`](SCRIPT-OPERATIONS.md#signins), [`dlp`](SCRIPT-OPERATIONS.md#dlp), [`dlpRules`](SCRIPT-OPERATIONS.md#dlprules), [`alerts`](SCRIPT-OPERATIONS.md#alerts), [`backupPolicies`](SCRIPT-OPERATIONS.md#backuppolicies), [`restoreSessions`](SCRIPT-OPERATIONS.md#restoresessions).

**Required local evidence:** `P06.json`, records with `population`, `sampleMethod`, `coverage`, `operatingEvidence`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/authentication/overview-authentication); [Microsoft reference 4](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults); [Microsoft reference 5](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp); [Microsoft reference 6](https://learn.microsoft.com/en-us/purview/dlp-simulation-mode-learn); [Microsoft reference 7](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide); [Microsoft reference 8](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide)

### P07

**Control assessment rules** — [Run P07.ps1](../scripts/steps/P07.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`ca`](SCRIPT-OPERATIONS.md#ca), [`authorization`](SCRIPT-OPERATIONS.md#authorization).

**Required local evidence:** `P07.json`, records with `assessmentWorksheet`, `evidenceLayers`, `limitations`, `reviewer`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/compliance-manager); [Microsoft reference 2](https://www.microsoft.com/licensing/terms/); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### P08

**Risk and prioritization** — [Run P08.ps1](../scripts/steps/P08.ps1)

**Live read operations:** [`alerts`](SCRIPT-OPERATIONS.md#alerts), [`incidents`](SCRIPT-OPERATIONS.md#incidents), [`secureScores`](SCRIPT-OPERATIONS.md#securescores), [`ca`](SCRIPT-OPERATIONS.md#ca), [`authorization`](SCRIPT-OPERATIONS.md#authorization).

**Required local evidence:** `P08.json`, records with `findingRegister`, `impact`, `likelihood`, `priorities`, `exceptions`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/security/compass/incident-response-playbooks); [Microsoft reference 2](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent); [Microsoft reference 3](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing); [Microsoft reference 4](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### P09

**Fieldwork sequence** — [Run P09.ps1](../scripts/steps/P09.ps1)

**Live read operations:** [`auditConfig`](SCRIPT-OPERATIONS.md#auditconfig), [`exoOrg`](SCRIPT-OPERATIONS.md#exoorg), [`ual`](SCRIPT-OPERATIONS.md#ual), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit), [`signIns`](SCRIPT-OPERATIONS.md#signins), [`ca`](SCRIPT-OPERATIONS.md#ca), [`namedLocations`](SCRIPT-OPERATIONS.md#namedlocations), [`defaults`](SCRIPT-OPERATIONS.md#defaults), [`crossDefault`](SCRIPT-OPERATIONS.md#crossdefault), [`presetEop`](SCRIPT-OPERATIONS.md#preseteop), [`presetDefender`](SCRIPT-OPERATIONS.md#presetdefender), [`antiPhish`](SCRIPT-OPERATIONS.md#antiphish), [`antiPhishRules`](SCRIPT-OPERATIONS.md#antiphishrules), [`spam`](SCRIPT-OPERATIONS.md#spam), [`spamRules`](SCRIPT-OPERATIONS.md#spamrules), [`malware`](SCRIPT-OPERATIONS.md#malware), [`malwareRules`](SCRIPT-OPERATIONS.md#malwarerules), [`safeLinks`](SCRIPT-OPERATIONS.md#safelinks), [`safeLinksRules`](SCRIPT-OPERATIONS.md#safelinksrules), [`safeAttachments`](SCRIPT-OPERATIONS.md#safeattachments), [`safeAttachmentsRules`](SCRIPT-OPERATIONS.md#safeattachmentsrules), [`managedDevices`](SCRIPT-OPERATIONS.md#manageddevices), [`compliance`](SCRIPT-OPERATIONS.md#compliance), [`complianceAssignments`](SCRIPT-OPERATIONS.md#complianceassignments).

**Required local evidence:** `P09.json`, records with `fieldworkTracker`, `evidenceCrossReferences`, `unresolvedSteps`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [Microsoft reference 2](https://learn.microsoft.com/en-us/purview/audit-search); [Microsoft reference 3](https://learn.microsoft.com/en-us/purview/audit-mailboxes); [Microsoft reference 4](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only); [Microsoft reference 5](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview); [Microsoft reference 6](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0); [Microsoft reference 7](https://learn.microsoft.com/en-us/defender-office-365/preset-security-policies); [Microsoft reference 8](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview)

### P10

**Reporting and remediation** — [Run P10.ps1](../scripts/steps/P10.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`roleDefinitions`](SCRIPT-OPERATIONS.md#roledefinitions), [`pimActive`](SCRIPT-OPERATIONS.md#pimactive), [`ca`](SCRIPT-OPERATIONS.md#ca), [`authorization`](SCRIPT-OPERATIONS.md#authorization).

**Required local evidence:** `P10.json`, records with `executiveReport`, `factualReview`, `remediationPlan`, `accountableOwners`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 2](https://learn.microsoft.com/en-us/graph/permissions-overview); [Microsoft reference 3](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

### P11

**Tenant and industry overlays** — [Run P11.ps1](../scripts/steps/P11.ps1)

**Live read operations:** [`organization`](SCRIPT-OPERATIONS.md#organization), [`licenses`](SCRIPT-OPERATIONS.md#licenses), [`domains`](SCRIPT-OPERATIONS.md#domains), [`roles`](SCRIPT-OPERATIONS.md#roles).

**Required local evidence:** `P11.json`, records with `applicabilityMatrix`, `frameworkCrosswalk`, `featureAvailability`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod); [Microsoft reference 2](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-applications-service-description/office-application-and-feature-availability-in-government-plans); [Microsoft reference 3](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0); [Microsoft reference 4](https://learn.microsoft.com/en-us/purview/compliance-manager); [Microsoft reference 5](https://www.microsoft.com/licensing/terms/)

### P12

**Continuous assurance** — [Run P12.ps1](../scripts/steps/P12.ps1)

**Live read operations:** [`ca`](SCRIPT-OPERATIONS.md#ca), [`roles`](SCRIPT-OPERATIONS.md#roles), [`apps`](SCRIPT-OPERATIONS.md#apps), [`licenses`](SCRIPT-OPERATIONS.md#licenses).

**Required local evidence:** `P12.json`, records with `baseline`, `driftReview`, `retestSchedule`, `closureEvidence`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score)

### P13

**Limitations and handoff** — [Run P13.ps1](../scripts/steps/P13.ps1)

**Live read operations:** [`roles`](SCRIPT-OPERATIONS.md#roles), [`directoryAudit`](SCRIPT-OPERATIONS.md#directoryaudit), [`roleDefinitions`](SCRIPT-OPERATIONS.md#roledefinitions), [`pimActive`](SCRIPT-OPERATIONS.md#pimactive).

**Required local evidence:** `P13.json`, records with `limitations`, `evidenceTransfer`, `accessRemovalRecord`, `ownerAcceptance`. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.

**Review:** Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.

**Microsoft basis:** [Microsoft reference 1](https://learn.microsoft.com/en-us/purview/edisc-features-components); [Microsoft reference 2](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [Microsoft reference 3](https://learn.microsoft.com/en-us/graph/permissions-overview)
