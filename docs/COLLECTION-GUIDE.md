# Evidence collection guide

**Executable work program:** use the [script runner](../scripts/README.md) for the new module-check → install-if-missing → authenticate → tenant-verification → read-only-collection sequence. The snippets below are focused command explanations; use the runner for execution guards, complete step mapping and preserved error results. Every [control/step script](SCRIPT-COVERAGE.md) includes a title, description and Microsoft references.

These examples invoke the documented control scripts, including their module availability, installation and authentication preflight. They were reviewed against linked Microsoft command documentation but were not executed against a tenant. They intentionally contain no automated remediation. Authentication, consent and test actions still require the engagement's authorization. [S85: Microsoft Graph PowerShell authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0); [S86: Connect to Exchange Online PowerShell](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

## Preflight

Confirm tenant ID, cloud environment, required reader roles/scopes, approved modules and versions, permitted data, evidence destination and review window. Obtain an owner-assisted export if scope cannot be granted appropriately. Do not solve a permission error by silently requesting Global Administrator. Record the limitation. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S64: Microsoft Entra built-in roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

Use a fresh controlled session, record module versions and inspect connection context. Verify the signed-in account, tenant and environment against the charter. Module compatibility differs by tool/release; pin both engine and rule/test definitions. [S85: Microsoft Graph PowerShell authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0); [S86: Connect to Exchange Online PowerShell](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps); [S58: Maester installation guide](https://maester.dev/docs/installation/); [S71: Maester 3.0 preview transition](https://maester.dev/blog/maester-3-0/)

Keep raw output outside the repository in the approved evidence store. Use an engagement-specific directory and UTC timestamp. File writes and hashing below are **local evidence-handling examples**; their purpose is provenance, not tenant validation. See the [evidence method](../PLAYBOOK.md#5-evidence-and-collection-quality).

## Microsoft Graph: bounded Conditional Access example

**Purpose:** retrieve the full Conditional Access policy collection, preserving disabled/report-only/enforced states. The API documents Policy.Read.All and supported reader roles. This does not collect all identity controls, effective user coverage or sign-in operation. [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0); [S08: Analyze Conditional Access policy impact](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only)

The example explicitly targets the **commercial Global environment**. Adapt authentication and endpoint selection to a verified national-cloud plan. Review consent before connecting. [S85: Microsoft Graph PowerShell authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0); [S55: Graph: List Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

~~~powershell
# Title: Read Conditional Access policies
# Description: Collects policy definitions; the runner adds shared safeguards. Module setup and authentication run before collection.
# Reference: https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0
$auditParameters = @{
    ExpectedTenantId = '<approved-tenant-guid>'
    OutputRoot = 'D:/Audit/results'
    InputRoot = 'D:/Audit/inputs'
    TargetsPath = 'D:/Audit/targets.json'
}
./scripts/controls/IAM-03.ps1 @auditParameters
~~~

The shared runner follows service-provided nextLink values, preserves pages and enforces a page cap. It fails on request errors rather than reporting a successful empty population. It does **not** implement automatic retries or resumable collection; a throttled request remains incomplete. A failed run remains incomplete; record the error securely and rerun under an approved plan. Compare the count with an independent inventory. [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview)

## Exchange Online: focused read operations

Connect through the approved Exchange Online module and correct tenant/cloud context. Verify the connection before collecting. Command availability and parameters depend on assigned permissions; preserve errors as collection limitations. [S86: Connect to Exchange Online PowerShell](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

### Audit ingestion and mailbox auditing

Run ingestion verification in **Exchange Online PowerShell**. Microsoft documents that the corresponding property can return False in Security & Compliance PowerShell even when ingestion is enabled. Check organization mailbox auditing separately; required actions still need event validation. [S60: Turn auditing on or off](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable); [S20: Manage mailbox auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes)

~~~powershell
# Title: Inspect audit ingestion and mailbox auditing
# Description: Reads independent organization audit switches. Module setup and authentication run before collection.
# Reference: https://learn.microsoft.com/en-us/purview/audit-log-enable-disable
$auditParameters = @{
    ExpectedTenantId = '<approved-tenant-guid>'
    OutputRoot = 'D:/Audit/results'
    InputRoot = 'D:/Audit/inputs'
    TargetsPath = 'D:/Audit/targets.json'
}
./scripts/controls/LOG-01.ps1 @auditParameters
~~~

### SMTP AUTH settings

Inspect organization configuration and mailbox overrides together. The purpose is to identify effective exceptions, not to equate SMTP AUTH with Basic authentication. Review actual client usage and the migration timeline separately. [S70: SMTP AUTH configuration](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission); [S26: Updated SMTP AUTH Basic Authentication deprecation timeline](https://techcommunity.microsoft.com/blog/exchange/updated-exchange-online-smtp-auth-basic-authentication-deprecation-timeline/4489835)

~~~powershell
# Title: Inspect SMTP AUTH settings
# Description: Reads organization defaults and mailbox overrides. Module setup and authentication run before collection.
# Reference: https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission
$auditParameters = @{
    ExpectedTenantId = '<approved-tenant-guid>'
    OutputRoot = 'D:/Audit/results'
    InputRoot = 'D:/Audit/inputs'
    TargetsPath = 'D:/Audit/targets.json'
}
./scripts/controls/MAIL-04.ps1 @auditParameters
~~~

### Inbox rules for an approved mailbox

Use only within the agreed mailbox population. Hidden rules and forwarding/deletion actions warrant review in context; a rule name alone is not an incident finding. Preserve raw properties when investigating rather than relying only on a narrow table. [S87: Get-InboxRule](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-inboxrule?view=exchange-ps); [S25: Control external email forwarding](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-policies-external-email-forwarding); [S76: Microsoft phishing investigation playbook](https://learn.microsoft.com/en-us/security/zero-trust/security-operations-playbook-phishing)

~~~powershell
# Title: Inspect approved mailbox rules
# Description: Reads visible and hidden inbox rules for a named mailbox. Module setup and authentication run before collection.
# Reference: https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-inboxrule?view=exchange-ps
$auditParameters = @{
    ExpectedTenantId = '<approved-tenant-guid>'
    OutputRoot = 'D:/Audit/results'
    InputRoot = 'D:/Audit/inputs'
    TargetsPath = 'D:/Audit/targets.json'
}
./scripts/controls/MAIL-03.ps1 @auditParameters
~~~

### DKIM

Read tenant-provided selectors and current configuration. Verify DNS and actual signed headers for each material sending domain; do not construct selectors from an old hard-coded naming convention. [S23: Configure DKIM](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure)

~~~powershell
# Title: Inspect DKIM configuration
# Description: Reads signing state and tenant-provided DNS selectors. Module setup and authentication run before collection.
# Reference: https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure
$auditParameters = @{
    ExpectedTenantId = '<approved-tenant-guid>'
    OutputRoot = 'D:/Audit/results'
    InputRoot = 'D:/Audit/inputs'
    TargetsPath = 'D:/Audit/targets.json'
}
./scripts/controls/MAIL-01.ps1 @auditParameters
~~~

## SharePoint collection caveat

Get-SPOSite options affect which sites and property details are returned. Read the command's current limitations, include relevant OneDrive/channel/container populations through appropriate interfaces, and retrieve detailed properties for sampled sites. Do not infer complete item-level ACL coverage from a site list. [S88: Get-SPOSite](https://learn.microsoft.com/en-us/powershell/module/microsoft.online.sharepoint.powershell/get-sposite?view=sharepoint-ps); [S27: Overview of external sharing in SharePoint and OneDrive](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview); [S30: Shared channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/shared-channels); [S84: SharePoint Embedded overview](https://learn.microsoft.com/en-us/sharepoint/dev/embedded/overview)

## Audit log collection

For a small manual inquiry, use Purview Audit search with documented roles and a known UTC window. Preserve exported results, filters and search context. For programmatic bulk acquisition, follow Microsoft's Management Activity API guidance and verify prerequisites, retention, pagination and source coverage. [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search); [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

Search-UnifiedAuditLog defaults and caps can truncate evidence: the documented default is up to 100 records, and ReturnLargeSet supports iterative retrieval up to 50,000. Partition capped windows and reconcile stable identifiers. Reaching a cap does not prove completeness. Recheck the command reference at execution time. [S56: Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

## Assessment tools: use and limits

| Tool | Appropriate role | Required audit treatment |
|---|---|---|
| Microsoft Secure Score | Discover and prioritize supported recommendations | Preserve scope and limitations; not an audit opinion. [S01: Microsoft Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score) |
| CISA ScubaGear | Configuration against pinned SCuBA baselines | Validate cloud/license scope and manual/error/omission statuses. [S03: ScubaGear](https://github.com/cisagov/ScubaGear); [S04: ScubaGear v1.8.0 assumptions](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/misc/assumptions.md); [S57: ScubaGear v1.8.0 output schema](https://raw.githubusercontent.com/cisagov/ScubaGear/v1.8.0/docs/misc/tooloutputschema.md) |
| Maester | Repeatable configuration checks and custom tests | Pin engine/tests; missing connections can skip optional checks. [S58: Maester installation guide](https://maester.dev/docs/installation/); [S71: Maester 3.0 preview transition](https://maester.dev/blog/maester-3-0/) |
| ORCA | Additional email configuration analysis | Its index does not cover every configuration or audit domain. [S59: ORCA README](https://github.com/cammurray/orca/blob/master/README.md) |
| Microsoft portals/APIs | Product evidence within documented scope | Verify permissions, population, pagination and effective behavior. [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S53: Microsoft Graph paging](https://learn.microsoft.com/en-us/graph/paging); [S19: Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search) |

These tools were researched, **not installed or run against a tenant** for this playbook. For a real engagement, inspect official installation/prerequisite instructions at execution time. Automation findings require applicability, ownership and evidence review. [S03: ScubaGear](https://github.com/cisagov/ScubaGear); [S58: Maester installation guide](https://maester.dev/docs/installation/); [S59: ORCA README](https://github.com/cammurray/orca/blob/master/README.md); [S71: Maester 3.0 preview transition](https://maester.dev/blog/maester-3-0/)

## Evidence handoff and teardown

Record newly granted access and tool identities; remove temporary rights and credentials under the engagement process. Disconnect sessions, transfer custody, preserve approved workpapers and dispose of unnecessary copies according to the retention plan. These are **consultant completion procedures**, grounded in application-grant and investigation-data governance. [S13: Configure user consent to applications](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/configure-user-consent); [S54: Microsoft Graph permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview); [S39: eDiscovery features and components](https://learn.microsoft.com/en-us/purview/edisc-features-components)
