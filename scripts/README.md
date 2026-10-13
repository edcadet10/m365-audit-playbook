# Read-only Microsoft 365 audit scripts

**Version 1.1.** Run evidence collection for **90 controls, 48 numbered fieldwork steps and 13 engagement phases**. Every entry script has a title, short description and Microsoft documentation links in PowerShell comment-based help. The engine provides **100 explicit read operations**. [Coverage and exact evidence contracts](../docs/SCRIPT-COVERAGE.md) · [API/command references and permissions](../docs/SCRIPT-OPERATIONS.md). Help format: [Microsoft about_Comment_Based_Help](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help).

The scripts take audit action: collect configuration and activity evidence, preserve raw pages, hash evidence, reconcile Entra/Intune device identifiers, flag selected configuration conditions, compare recorded expected/actual outcomes, and calculate recovery duration/data age against supplied RTO/RPO. The screening rules are consultant methods; a review candidate is not automatically a finding. Microsoft distinguishes configuration, effective permissions and operational evidence. [Graph permissions](https://learn.microsoft.com/en-us/graph/permissions-overview), [Conditional Access report-only behavior](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only), [Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide).

## What read-only means here

Remote operations are Microsoft Graph GET requests, allowlisted Exchange/Purview read commands, and GET requests to fixed Power Platform/Fabric/Power BI endpoints. The acquisition stage does not change configuration, send test messages, revoke sessions, create synthetic content, start restores or delete artifacts. They write **local** evidence and report files. Authentication providers may refresh an existing token; the service may log reads. These are not claims of zero observable activity. [Graph authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0), [Exchange connections](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps), [Get-AzAccessToken](https://learn.microsoft.com/en-us/powershell/module/az.accounts/get-azaccesstoken).

An audit includes evidence review and professional judgment. A script cannot conduct an interview, create a business approval or demonstrate a new restore while remaining read-only. Those steps have scripts that inspect **existing, attributable evidence**, report missing records, and calculate what can be calculated. The fieldwork runbooks retain the separate exercise procedure for cases where a future change-producing test is authorized. Missing operation evidence remains **Incomplete**, never a presumed Pass. [Audit search](https://learn.microsoft.com/en-us/purview/audit-search), [Backup overview](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide).

## Prerequisites and session boundaries

Use PowerShell 7.4+ in a controlled audit workstation and keep the repository unmodified during a run. The default setup checks the modules required by the selected operations, installs a missing supported version for CurrentUser from the official PowerShell Gallery, imports it, authenticates each service and checks the tenant before audit reads. Authentication may display sign-in, MFA or consent prompts; any organizational consent/role prerequisites remain governed by the tenant. No role assignment or permission-grant API is called. Existing sufficient module versions are reused. Module versions are recorded in session-setup.json. A setup failure stops collection and produces setup-failure.json. `-Plan` needs no connection. Reader scopes do not automatically supply delegated roles, licenses, workload RBAC, hidden memberships or resource-specific consent. [Permissions overview](https://learn.microsoft.com/en-us/graph/permissions-overview), [operation register](../docs/SCRIPT-OPERATIONS.md).

| Transport | Session requirement | Tenant and scope checks | Microsoft reference |
|---|---|---|---|
| Graph | Microsoft.Graph.Authentication; existing Graph context | Expected tenant and environment must match before every operation. Pagination stays on HTTPS, port 443, the selected Graph host and v1.0. | [Authentication/context](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0), [paging](https://learn.microsoft.com/en-us/graph/paging) |
| Exchange | ExchangeOnlineManagement; existing REST session | Exactly one connected Exchange session; expected TenantID; no delegated organization or prefix; command must bind to its imported session module. | [Get-ConnectionInformation](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps) |
| Purview | Existing REST Security & Compliance session | Same checks, selecting `IsEopSession = true`. UAL ingestion configuration is collected in Exchange. | [Connection metadata](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps), [audit ingestion caveat](https://learn.microsoft.com/en-us/purview/audit-log-enable-disable) |
| Power Platform | Az.Accounts; existing commercial Azure context | Expected tenant, AzureCloud and token TenantId; user-visible environments API is **preview** and may not establish tenant-wide inventory. | [Authentication](https://learn.microsoft.com/en-us/power-platform/admin/programmability-authentication-v2), [list environments](https://learn.microsoft.com/en-us/rest/api/power-platform/environmentmanagement/environments/list-environments-for-user) |
| Fabric / Power BI | Az.Accounts; existing commercial context with resource permissions | Expected tenant and token TenantId; fixed API host/path; Fabric administrator or supported application requirements apply. Expanded workspace users are deliberately not used: a separate documented users API collects the selected workspace ACLs. | [Workspace inventory](https://learn.microsoft.com/en-us/rest/api/power-bi/admin/groups-get-groups-as-admin), [workspace users](https://learn.microsoft.com/en-us/rest/api/power-bi/admin/groups-get-group-users-as-admin) |

The Graph adapter supports Global, USGov, USGovDoD and China endpoint selection. **This does not mean every API exists in every cloud.** Backup APIs here are Global-only. The non-Graph REST adapter is commercial-only. Unsupported endpoints, insufficient licenses or inaccessible data produce a collection limitation. No automatic permission escalation occurs. [National cloud deployments](https://learn.microsoft.com/en-us/graph/deployments), [backup policy API availability](https://learn.microsoft.com/en-us/graph/api/backuprestoreroot-list-protectionpolicies?view=graph-rest-1.0).


## Module installation and authentication sequence

Every Collect entry script follows **check modules → install missing supported modules → import → authenticate → verify tenant/cloud → run read-only commands**. Setup is implemented in [SessionSetup.ps1](SessionSetup.ps1). It uses CurrentUser installation from the verified official PSGallery URL; it does not replace a sufficient installed version. Microsoft documents [Install-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/install-psresource?view=powershellget-3.x), [Graph authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0), [Exchange connection](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps), [Purview connection](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-scc-powershell?view=exchange-ps), and [Az authentication](https://learn.microsoft.com/en-us/powershell/module/az.accounts/connect-azaccount).

Plan and Offline modes perform no module downloads or authentication. `-UseExistingSessions` checks module availability and existing context but never installs or initiates sign-in; use it for a pre-provisioned workstation. Tenant mismatch or ambiguous Exchange/Purview sessions stop collection. Start a fresh process and authenticate to the intended tenant instead of mixing workload sessions. The setup floor is Microsoft.Graph.Authentication 2.0.0, ExchangeOnlineManagement 3.9.0, and Az.Accounts 4.0.0; these are implementation compatibility choices, not a claim that the minimum versions have been integration-tested. Installed versions and exact tenant behavior still require a pilot. [Connection metadata](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps).

Graph defaults to interactive delegated authentication. APIs such as `sites/getAllSites` require application permissions; the API's limitation remains an evidence gap in a delegated run. For an already approved certificate-backed application, supply both `-GraphClientId` and `-CertificateThumbprint`, or use a pre-existing verified application context. The scripts do not create an app, certificate, role assignment or consent grant. Certificate authentication is for Graph; establish any required workload application session separately and use existing-session mode. [Graph certificate authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0), [getAllSites permissions](https://learn.microsoft.com/en-us/graph/api/site-getallsites?view=graph-rest-1.0).

## Plan the selected control

**Title: inspect the Conditional Access collection plan.** Prints the script's title, exact operations, source links, permissions, target inputs and supplemental workpaper fields without tenant access or output files. The policy read is based on [Microsoft's Conditional Access list API](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0).

```powershell
# Title: Inspect the Conditional Access audit plan
# Description: Print required reads and evidence contracts without connecting.
# Reference: https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0
./scripts/controls/IAM-03.ps1 -Plan | ConvertTo-Json -Depth 30
Get-Help ./scripts/controls/IAM-03.ps1 -Full
```

Use [targets.example.json](targets.example.json) as the structure for a **local** target file. Replace tenantId; populate approved samples or the explicitly adopted complete population. Use directory object IDs for `applicationIds` and `servicePrincipalIds`, not application/client IDs. `driveItems` contains objects shaped as `{"driveId":"…","itemId":"…"}`. Other arrays contain strings. Empty target arrays produce `MissingTarget`. The collector never silently substitutes “all objects.” [Application resource](https://learn.microsoft.com/en-us/graph/api/resources/application?view=graph-rest-1.0), [item permissions](https://learn.microsoft.com/en-us/graph/api/driveitem-list-permissions?view=graph-rest-1.0).

## Prepare attributable existing workpapers

**Title: create blank evidence contracts locally.** Creates new JSON files for selected controls/steps in an external evidence folder. It does not overwrite existing files or query Microsoft 365. Required fields start empty and therefore cannot satisfy collection. This is consultant evidence handling using [Microsoft's JSON serialization command](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-json).

```powershell
# Title: Create local evidence contracts
# Description: Generate blank control and fieldwork workpapers without tenant access.
# Reference: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-json
$auditTenant = '<approved-tenant-guid>'
./scripts/New-EvidenceTemplate.ps1 -Id IAM-03,T01-03 -ExpectedTenantId $auditTenant -InputRoot 'D:/Audit/inputs'
```

Each `<ID>.json` package needs its matching `id`, `tenantId`, and a nonempty `records` array. Each record needs `id`, `owner`, ISO 8601 `observedUtc`, `evidenceFiles` (relative paths under InputRoot), and the named fields in its [exact contract](../docs/SCRIPT-COVERAGE.md). Field values can be structured JSON. Reference actual exports, signed workpapers, case records or test receipts; do not replace evidence with “done.” File references are checked for existence and hashed. These are consultant provenance checks using [Get-FileHash](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash); hashing does not authenticate the underlying claim.

Optional `comparisons` records contain `requirement`, `expected`, and `actual`. Unequal JSON values produce `RequirementMismatch`. This is an exact recorded-value comparison, not semantic policy evaluation. REC-02 and T09-04 records provide `startedUtc`, `acceptedUtc`, `recoveryPointUtc`, `incidentUtc`, `rtoSeconds`, and `rpoSeconds`; the engine calculates duration and data age and identifies exceeded objectives. Inspect integrity and acceptance evidence separately. **Consultant calculations**, supported by the recovery evidence boundary in [Microsoft's Backup FAQ](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide).

## Execute evidence collection

**Title: collect Conditional Access evidence.** Prepares modules and authenticated sessions, then uses the approved target/evidence files. The default activity query window is the previous seven days; explicitly set the review window for an actual audit. The runner records all errors and writes outside the public repository. [Conditional Access policies](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0), [sign-in logs](https://learn.microsoft.com/en-us/graph/api/signin-list?view=graph-rest-1.0).

```powershell
# Title: Collect Conditional Access configuration and sign-in evidence
# Description: Read configured policies and the approved activity window; validate existing workpapers.
# References: https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0
# https://learn.microsoft.com/en-us/graph/api/signin-list?view=graph-rest-1.0
$auditOptions = @{
    ExpectedTenantId = '<approved-tenant-guid>'
    OutputRoot = 'D:/Audit/results'
    InputRoot = 'D:/Audit/inputs'
    TargetsPath = 'D:/Audit/targets.json'
    StartUtc = '2026-09-01T00:00:00Z'
    EndUtc = '2026-10-01T00:00:00Z'
}
./scripts/controls/IAM-03.ps1 @auditOptions
```

**Title: run a fieldwork step or the whole control work program.** Step wrappers select their exact evidence contract. Batch mode deduplicates identical operations across controls within a run. Setup requests only the scopes required by the selected recipes. A full AllControls run therefore requests a broad set of reader permissions; use selected controls when access is scoped. [Permission boundaries](https://learn.microsoft.com/en-us/graph/permissions-overview), [paging](https://learn.microsoft.com/en-us/graph/paging).

```powershell
# Title: Run selected fieldwork or the full control collection
# Description: Reuse the approved auditOptions above; each result retains limitations.
# Reference: https://learn.microsoft.com/en-us/graph/permissions-overview
./scripts/steps/T01-03.ps1 @auditOptions
./scripts/Invoke-M365Audit.ps1 -Id AllControls @auditOptions
```

**Title: review local workpapers without tenant access.** `Offline` validates and hashes supplied files and evaluates existing comparisons/recovery measurements. Live operations remain `NotCollected`, so controls needing live evidence remain incomplete. JSON handling uses [ConvertFrom-Json](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertfrom-json).

```powershell
# Title: Validate existing recovery evidence offline
# Description: Hash source receipts and calculate supplied recovery metrics; issue no tenant reads.
# Reference: https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide
./scripts/controls/REC-02.ps1 @auditOptions -Mode Offline
```

## Interpret the output

| File/status | Meaning |
|---|---|
| Operation `page-*.json` | Raw returned pages; preserves successful earlier pages if later acquisition fails. |
| Operation `result.json` | Operation, target, count, page count, scope, status, error and Microsoft source. |
| `<ID>.json` | Specific control/step evidence, missing requirements, review candidates and criteria. |
| `report.json`, `coverage.csv`, `candidates.json` | Engagement collection coverage and review candidates. Every `controlResult` remains `Not assessed` until a reviewer reaches a supported conclusion in the assessment worksheet. |
| `manifest.json` | SHA-256 for generated evidence/report files. The manifest does not hash itself. Preserve it in controlled storage. |
| `Collected` | The implemented query completed, within API/RBAC visibility. Does not prove population completeness, event generation, or control effectiveness. |
| `Partial`, `Failed`, `MissingTarget`, `NotCollected` | Material collection limitations. These cannot become `Collected` because of an empty result. |
| `EvidencePresent` | Required local fields and files were present and parseable. Contents still require review. |
| `Incomplete` | One or more required reads or local evidence requirements remain unresolved. |
| `NeedsReview` | Required evidence contracts are present and requested reads completed; reviewer judgment is outstanding. |

These statuses are **consultant conventions** grounded in Microsoft's scoped [Graph authorization](https://learn.microsoft.com/en-us/graph/permissions-overview), [paging](https://learn.microsoft.com/en-us/graph/paging), and [audit search behavior](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps).

## Completeness and remaining work

Graph nextLink loops stop on request errors, malformed responses, unsafe URLs, repeated links and a page cap. No automatic retry is implemented; a 429 leaves Partial/Failed and requires a controlled rerun after the service's retry interval. Preserve the failed run and reconcile duplicate records across reruns. The default MaxPages is 1,000 and is a consultant resource bound. [Paging](https://learn.microsoft.com/en-us/graph/paging), [throttling guidance](https://learn.microsoft.com/en-us/graph/throttling).

UAL reads repeat ReturnLargeSet under a unique SessionId until an empty page, reject repeated/missing identities, and compare returned counts with ResultCount. A 50,000-row ceiling, inconsistent count or page cap produces Partial. Split the review interval and reconcile stable identifiers at boundaries. Empty success only establishes that the source returned no matching events in that query. [Search-UnifiedAuditLog](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps).

The 100 operations are substantial evidence collectors, **not complete automation of all Microsoft 365 interfaces**. Teams tenant policies, SharePoint tenant sharing settings, newer Intune policy families, Power Platform connector/maker configuration, Forms, Defender device inventory, supplier controls, contracts and industry overlays require the specific owner exports or workpapers named by each contract. Inventory APIs do not replace these exports. No portal-scraping workaround or write API is used. Follow the linked source for the exact export and record limitations. [SharePoint tenant properties](https://learn.microsoft.com/en-us/powershell/module/microsoft.online.sharepoint.powershell/get-spotenant?view=sharepoint-ps), [Intune endpoint security](https://learn.microsoft.com/en-us/intune/intune-service/protect/endpoint-security), [Power Platform data policies](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/dlp-strategy), [Forms administration](https://learn.microsoft.com/en-us/microsoft-forms/administrator-settings-microsoft-forms).

Before rating a control, review applicability, targets, license/cloud availability, sampling, RBAC visibility, requested period versus retained history, supplemental evidence and conflicting observations. Exported settings or a populated JSON form alone do not satisfy an operating-effectiveness opinion. Follow the original [playbook assessment rules](../PLAYBOOK.md#7-control-assessment-rules).

## Verification boundary

See the [script disconfirmation report](../research/SCRIPT-DISCONFIRMATION.md) and [measured test results](../research/script-test-results.json). Tests run locally with synthetic data and mocked transports; **no tenant was connected or audited while authoring**. Live compatibility, tenant permissions and workload version behavior remain unverified. Session-module binding deliberately fails if it cannot be established. Titles and Microsoft links identify the source basis, not a Microsoft endorsement of this code.
