"""Author and render the read-only collection recipes; no tenant connection."""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'scripts'
OUT.mkdir(exist_ok=True)
controls = json.loads((ROOT / 'controls/catalog.json').read_text(encoding='utf-8-sig'))
sources = json.loads((ROOT / 'references/sources.json').read_text(encoding='utf-8-sig'))
source_map = {s['id']: s for s in sources}
ops = {}

def graph(key, path, doc, permission, target='', shape='collection', note=''):
    scopes=re.findall(r'\b[A-Za-z][A-Za-z0-9-]*\.Read[A-Za-z]*(?:\.[A-Za-z]+)*\b',permission)[:1]
    if key=='signIns': scopes=['AuditLog.Read.All','Policy.Read.All']
    ops[key] = dict(id=key, kind='graph', path=path, target=target, shape=shape,
        scopes=scopes, delegatedSupported=key!='sites',
        permission=permission, source='https://learn.microsoft.com/en-us/graph/api/' + doc + '?view=graph-rest-1.0',
        note=note or 'Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.')

graph('organization', '/organization', 'organization-list', 'Organization.Read.All')
graph('licenses', '/subscribedSkus', 'subscribedsku-list', 'LicenseAssignment.Read.All')
graph('domains', '/domains', 'domain-list', 'Domain.Read.All')
graph('users', '/users?$select=id,displayName,userPrincipalName,userType,accountEnabled,createdDateTime,assignedLicenses,onPremisesSyncEnabled', 'user-list', 'User.Read.All')
graph('groups', '/groups?$select=id,displayName,groupTypes,securityEnabled,mailEnabled,visibility,resourceProvisioningOptions', 'group-list', 'Group.Read.All')
graph('groupMembers', '/groups/{id}/transitiveMembers', 'group-list-transitivemembers', 'GroupMember.Read.All; limited properties need object read permissions; hidden members need Member.Read.Hidden', 'groupIds')
graph('groupOwners', '/groups/{id}/owners', 'group-list-owners', 'Group.Read.All', 'groupIds')
graph('roles', '/roleManagement/directory/roleAssignments', 'rbacapplication-list-roleassignments', 'RoleManagement.Read.Directory')
graph('roleDefinitions', '/roleManagement/directory/roleDefinitions', 'rbacapplication-list-roledefinitions', 'RoleManagement.Read.Directory')
graph('pimEligible', '/roleManagement/directory/roleEligibilityScheduleInstances', 'rbacapplication-list-roleeligibilityscheduleinstances', 'RoleEligibilitySchedule.Read.Directory')
graph('pimActive', '/roleManagement/directory/roleAssignmentScheduleInstances', 'rbacapplication-list-roleassignmentscheduleinstances', 'RoleAssignmentSchedule.Read.Directory')
graph('accessReviews', '/identityGovernance/accessReviews/definitions', 'accessreviewset-list-definitions', 'AccessReview.Read.All')
graph('ca', '/identity/conditionalAccess/policies', 'conditionalaccessroot-list-policies', 'Policy.Read.All')
graph('namedLocations', '/identity/conditionalAccess/namedLocations', 'conditionalaccessroot-list-namedlocations', 'Policy.Read.All')
graph('defaults', '/policies/identitySecurityDefaultsEnforcementPolicy', 'identitysecuritydefaultsenforcementpolicy-get', 'Policy.Read.All', shape='object')
graph('authPolicy', '/policies/authenticationMethodsPolicy', 'authenticationmethodspolicy-get', 'Policy.Read.AuthenticationMethod', shape='object')
graph('authMethods', '/users/{id}/authentication/methods', 'authentication-list-methods', 'UserAuthenticationMethod.Read.All; delegated role restrictions apply', 'userIds')
graph('registration', '/reports/authenticationMethods/userRegistrationDetails', 'authenticationmethodsroot-list-userregistrationdetails', 'AuditLog.Read.All; licensing and delegated role requirements apply')
graph('signIns', '/auditLogs/signIns?$filter=createdDateTime ge {start} and createdDateTime le {end}', 'signIn-list', 'AuditLog.Read.All; Policy.Read.All for Conditional Access details; licensing and roles apply')
graph('directoryAudit', '/auditLogs/directoryAudits?$filter=activityDateTime ge {start} and activityDateTime le {end}', 'directoryaudit-list', 'AuditLog.Read.All')
graph('crossDefault', '/policies/crossTenantAccessPolicy/default', 'crosstenantaccesspolicyconfigurationdefault-get', 'Policy.Read.All', shape='object')
graph('crossPartners', '/policies/crossTenantAccessPolicy/partners', 'crosstenantaccesspolicy-list-partners', 'Policy.Read.All')
graph('authorization', '/policies/authorizationPolicy', 'authorizationpolicy-get', 'Policy.Read.All', shape='object')
graph('apps', '/applications', 'application-list', 'Application.Read.All')
graph('principals', '/servicePrincipals', 'serviceprincipal-list', 'Application.Read.All')
graph('grants', '/oauth2PermissionGrants', 'oauth2permissiongrant-list', 'Directory.Read.All')
graph('appRoles', '/servicePrincipals/{id}/appRoleAssignments', 'serviceprincipal-list-approleassignments', 'Application.Read.All', 'servicePrincipalIds')
graph('appOwners', '/applications/{id}/owners', 'application-list-owners', 'Application.Read.All', 'applicationIds')
graph('federatedCredentials', '/applications/{id}/federatedIdentityCredentials', 'application-list-federatedidentitycredentials', 'Application.Read.All', 'applicationIds')
graph('federation', '/domains/{id}/federationConfiguration', 'domain-list-federationconfiguration', 'Domain-InternalFederation.Read.All', 'domainNames')
graph('delegatedAdmin', '/tenantRelationships/delegatedAdminRelationships', 'tenantrelationship-list-delegatedadminrelationships', 'DelegatedAdminRelationship.Read.All; partner/customer visibility limitations apply')
graph('riskyUsers', '/identityProtection/riskyUsers', 'riskyuser-list', 'IdentityRiskyUser.Read.All; licensing and roles apply')
graph('riskDetections', '/identityProtection/riskDetections', 'riskdetection-list', 'IdentityRiskEvent.Read.All; licensing and roles apply')
graph('devices', '/devices', 'device-list', 'Device.Read.All')
graph('managedDevices', '/deviceManagement/managedDevices', 'intune-devices-manageddevice-list', 'DeviceManagementManagedDevices.Read.All; active Intune license')
graph('compliance', '/deviceManagement/deviceCompliancePolicies', 'intune-deviceconfig-devicecompliancepolicy-list', 'DeviceManagementConfiguration.Read.All; active Intune license')
graph('complianceAssignments', '/deviceManagement/deviceCompliancePolicies/{id}/assignments', 'intune-deviceconfig-devicecompliancepolicyassignment-list', 'DeviceManagementConfiguration.Read.All', 'compliancePolicyIds')
graph('deviceConfigs', '/deviceManagement/deviceConfigurations', 'intune-deviceconfig-deviceconfiguration-list', 'DeviceManagementConfiguration.Read.All; excludes settings catalog and some endpoint security policy families')
graph('appProtection', '/deviceAppManagement/managedAppPolicies', 'intune-mam-managedapppolicy-list', 'DeviceManagementApps.Read.All; expand platform assignments separately')
graph('sites', '/sites/getAllSites', 'site-getallsites', 'APPLICATION ONLY: Sites.Read.All; delegated unsupported')
graph('site', '/sites/{id}', 'site-get', 'Sites.Read.All', 'siteIds', shape='object')
graph('drives', '/sites/{id}/drives', 'drive-list', 'Sites.Read.All', 'siteIds')
graph('itemPermissions', '/drives/{driveId}/items/{itemId}/permissions', 'driveitem-list-permissions', 'Files.Read.All or Sites.Read.All; caller-dependent permission visibility', 'driveItems')
graph('team', '/teams/{id}', 'team-get', 'Team.ReadBasic.All', 'teamIds', shape='object')
graph('channels', '/teams/{id}/channels', 'channel-list', 'Channel.ReadBasic.All', 'teamIds')
graph('teamMembers', '/teams/{id}/members', 'team-list-members', 'TeamMember.Read.All', 'teamIds')
graph('teamApps', '/teams/{id}/installedApps?$expand=teamsAppDefinition', 'team-list-installedapps', 'Delegated: TeamsAppInstallation.ReadForTeam. Application: TeamsAppInstallation.Read.Group (resource-specific consent) or TeamsAppInstallation.ReadForTeam.All for approved tenant-wide reading.', 'teamIds')
graph('incidents', '/security/incidents', 'security-list-incidents', 'SecurityIncident.Read.All')
graph('alerts', '/security/alerts_v2', 'security-list-alerts_v2', 'SecurityAlert.Read.All')
graph('secureScores', '/security/secureScores', 'security-list-securescores', 'SecurityEvents.Read.All')
graph('backupPolicies', '/solutions/backupRestore/protectionPolicies', 'backuprestoreroot-list-protectionpolicies', 'BackupRestore-Configuration.Read.All; Global cloud only')
graph('restoreSessions', '/solutions/backupRestore/restoreSessions', 'backuprestoreroot-list-restoresessions', 'BackupRestore-Restore.Read.All; Global cloud only')
graph('health', '/admin/serviceAnnouncement/healthOverviews', 'serviceannouncement-list-healthoverviews', 'ServiceHealth.Read.All')
graph('messages', '/admin/serviceAnnouncement/messages', 'serviceannouncement-list-messages', 'ServiceMessage.Read.All')
graph('cloudPCs', '/deviceManagement/virtualEndpoint/cloudPCs', 'virtualendpoint-list-cloudpcs', 'CloudPC.Read.All')

def rest(key, path, resource, host, doc, permission, target='', array='value', paging='nextLink'):
    ops[key]=dict(id=key,kind='rest',path=path,resource=resource,host=host,source='https://learn.microsoft.com/en-us/'+doc,permission=permission,target=target,array=array,paging=paging,
        note='Commercial cloud only in this adapter. Setup verifies/installs Az.Accounts and authenticates before collection, unless existing-session mode is selected. Reads use a token for this resource. Results are bounded by caller visibility. Review API request limits and preview status at the source.')
rest('ppEnvironments','/environmentmanagement/environments?api-version=2024-10-01','https://api.powerplatform.com','api.powerplatform.com','rest/api/power-platform/environmentmanagement/environments/list-environments-for-user','Power Platform API environment read permissions and existing user access; PREVIEW, user-visible environments, not guaranteed tenant-wide inventory.')
rest('fabricWorkspaces','/v1.0/myorg/admin/groups?$top=5000&$skip={skip}&$expand=reports,datasets,dashboards','https://analysis.windows.net/powerbi/api','api.powerbi.com','rest/api/power-bi/admin/groups-get-groups-as-admin','Delegated Tenant.Read.All plus Fabric administrator; service principals have separate documented tenant settings and consent restrictions.',paging='skip')
rest('fabricWorkspaceUsers','/v1.0/myorg/admin/groups/{id}/users','https://analysis.windows.net/powerbi/api','api.powerbi.com','rest/api/power-bi/admin/groups-get-group-users-as-admin','Delegated Tenant.Read.All plus Fabric administrator; service principal conditions apply.',target='workspaceIds')
rest('publicEmbeds','/v1.0/myorg/admin/widelySharedArtifacts/publishedToWeb','https://analysis.windows.net/powerbi/api','api.powerbi.com','rest/api/power-bi/admin/widely-shared-artifacts-published-to-web','Tenant.Read.All; Fabric administrator or supported service principal.',array='artifactAccessEntities',paging='token')
rest('fabricSettings','/v1/admin/tenantsettings','https://api.fabric.microsoft.com','api.fabric.microsoft.com','rest/api/fabric/admin/tenants/list-tenant-settings','Delegated Tenant.Read.All plus Fabric administrator; supported service principal or managed identity conditions apply.',paging='token')

def exchange(key, command, parameters=None, target='', purview=False, note=''):
    ops[key] = dict(id=key, kind='purview' if purview else 'exchange', command=command,
        parameters=parameters or {}, target=target, permission='Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview.',
        source=f'https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/{command.lower()}?view=exchange-ps',
        note=note or 'Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.')

for key, cmd in [('exoOrg','Get-OrganizationConfig'),('auditConfig','Get-AdminAuditLogConfig'),('transport','Get-TransportConfig'),('dkim','Get-DkimSigningConfig'),('acceptedDomains','Get-AcceptedDomain'),('remoteDomains','Get-RemoteDomain'),('inboundConnectors','Get-InboundConnector'),('outboundConnectors','Get-OutboundConnector'),('transportRules','Get-TransportRule'),('antiPhish','Get-AntiPhishPolicy'),('antiPhishRules','Get-AntiPhishRule'),('spam','Get-HostedContentFilterPolicy'),('spamRules','Get-HostedContentFilterRule'),('outboundSpam','Get-HostedOutboundSpamFilterPolicy'),('outboundSpamRules','Get-HostedOutboundSpamFilterRule'),('malware','Get-MalwareFilterPolicy'),('malwareRules','Get-MalwareFilterRule'),('safeLinks','Get-SafeLinksPolicy'),('safeLinksRules','Get-SafeLinksRule'),('safeAttachments','Get-SafeAttachmentPolicy'),('safeAttachmentsRules','Get-SafeAttachmentRule'),('presetEop','Get-EOPProtectionPolicyRule'),('presetDefender','Get-ATPProtectionPolicyRule'),('quarantine','Get-QuarantinePolicy'),('authPolicies','Get-AuthenticationPolicy')]:
    exchange(key, cmd)
exchange('mailboxes', 'Get-Mailbox', {'ResultSize':'Unlimited'})
exchange('casMailboxes', 'Get-CASMailbox', {'ResultSize':'Unlimited'})
exchange('inboxRules', 'Get-InboxRule', {'Mailbox':'{id}', 'IncludeHidden':True}, 'mailboxes')
exchange('mailboxPermissions', 'Get-MailboxPermission', {'Identity':'{id}'}, 'mailboxes')
exchange('recipientPermissions', 'Get-RecipientPermission', {'Identity':'{id}'}, 'mailboxes')
exchange('ual', 'Search-UnifiedAuditLog', {'StartDate':'{start}', 'EndDate':'{end}', 'SessionCommand':'ReturnLargeSet', 'ResultSize':5000}, note='Runner repeats a unique SessionId until an empty page. The 50,000-result limit, duplicate pages, missing ResultCount, or a count mismatch produce Partial; split the interval and rerun. This remains a source query, not proof of event generation or retention.')
for key, cmd in [('labels','Get-Label'),('labelPolicies','Get-LabelPolicy'),('dlp','Get-DlpCompliancePolicy'),('dlpRules','Get-DlpComplianceRule'),('retention','Get-RetentionCompliancePolicy'),('retentionRules','Get-RetentionComplianceRule'),('recordLabels','Get-ComplianceTag'),('ediscovery','Get-ComplianceCase'),('auditRetention','Get-UnifiedAuditLogRetentionPolicy')]:
    exchange(key, cmd, purview=True)

# Each control has a specific evidence contract. Fields are consultant-defined,
# not Microsoft API properties. They require attributable existing workpapers.
# Any missing record is an explicit evidence gap, never an inferred Pass.
rows = '''
GOV-01|organization domains licenses users groups sites|tenantBoundary workloadInventory exclusions
GOV-02|organization licenses|obligations adoptedCriteria applicability approval
GOV-03|roles roleDefinitions pimActive|responsibilityMatrix separationReview ownerAcceptance
GOV-04|ca authorization|exceptionRegister expiryReview compensatingControls
GOV-05|licenses users|entitlementMatrix purchasedLicenses featureRequirements contractReconciliation
IAM-01|roles roleDefinitions pimActive pimEligible groupMembers|privilegedPopulation nestedGroups justification approvals
IAM-02|ca defaults authPolicy registration signIns|requiredStrength personaMatrix allowedCase prohibitedCase
IAM-03|ca namedLocations defaults crossDefault signIns|coverageMatrix exclusions effectivePolicyReview
IAM-04|roles authMethods ca signIns directoryAudit|emergencyAccounts independentDependencies custody alertReceipt exerciseTiming
IAM-05|pimEligible pimActive accessReviews directoryAudit|elevationApprovals reviewDecisions expiredAssignments
IAM-06|users groups groupMembers directoryAudit signIns|hrPopulation lifecycleSamples removalTimes residualSessions
IAM-07|users crossDefault crossPartners accessReviews signIns|guestSponsors reviewDates partnerTrust lifecycleDecisions
IAM-08|authPolicy authMethods authPolicies casMailboxes signIns|recoveryProcess legacyExceptions recoveryExercises
IAM-09|riskyUsers riskDetections ca signIns|riskTriage remediations licensing effectiveEnforcement
APP-01|apps principals appOwners delegatedAdmin|applicationRegister businessOwners approvalDates
APP-02|authorization grants appRoles principals|consentApprovals permissionJustification historicGrantReview
APP-03|apps principals federatedCredentials appOwners|credentialInventory rotationRecords federationTrustReview
APP-04|appRoles grants principals itemPermissions|approvedResources allowedCase prohibitedCase effectiveScope
APP-05|delegatedAdmin apps roles directoryAudit|automationInventory partnerAccess pipelineControls offboarding
APP-06|ca signIns alerts|cloudDiscoveryExport sessionPolicyExport trafficCoverage bypassCases
HYB-01|organization users domains federation|syncServerInventory versionStatus privilegedAccess healthExport
HYB-02|inboundConnectors outboundConnectors transportRules federation|hybridTopology connectorOwners certificateExpiry failoverRecords
HYB-03|organization federation directoryAudit|sourceAuthority dependencyMap outageExercise reconciliation
MAIL-01|domains acceptedDomains dkim|senderInventory dnsRecords messageHeaders alignmentResults
MAIL-02|presetEop presetDefender antiPhish antiPhishRules spam spamRules malware malwareRules safeLinks safeLinksRules safeAttachments safeAttachmentsRules|recipientPopulation effectivePrecedence exceptions protectionObservations
MAIL-03|mailboxes inboxRules mailboxPermissions recipientPermissions outboundSpam outboundSpamRules remoteDomains transportRules|approvedForwarding effectiveDestinations deliveryEvidence delegationApprovals
MAIL-04|transport casMailboxes authPolicies signIns|smtpClients authModes oauthEvidence exceptionOwners
MAIL-05|transportRules inboundConnectors quarantine spam spamRules|bypassJustifications allowedSenders quarantineRoles releaseSamples
MAIL-06|auditConfig exoOrg mailboxes ual|auditedActions bypassAssociations knownEvents delegatedAccessReview
COL-01|sites site groups groupMembers itemPermissions|spoTenantExport siteSharingExport approvedAudience externalAccessCases
COL-02|groupMembers groupOwners itemPermissions|siteAclExport broadGroups linkInventory itemSamples actualAccess
COL-03|sites site groupOwners|siteOwners reviewDates staleSiteDisposition lifecycleApproval
COL-04|ca site signIns|spoAccessExport syncRestrictions deviceAccessCases
COL-05|users sites drives|leaverContentAssignments versionSettings recycleBinInventory restoreRecords
TEAM-01|team channels teamMembers crossDefault crossPartners|teamsFederationExport guestPolicyExport sharedChannelMembership actualAccess
TEAM-02|team channels|meetingPolicyExport policyAssignments recordingPermissions transcriptRetention
TEAM-03|teamApps apps grants appRoles|teamsAppPolicyExport botOwners runtimePermissions approvalRecords
TEAM-04|groups groupOwners team channels teamMembers|ownerCoverage channelSiteMapping telephonyPolicies emergencyCallingReview
END-01|devices managedDevices|assetRegister defenderInventory ownership reconciliationDecisions
END-02|managedDevices compliance complianceAssignments ca signIns|noPolicySetting gracePeriods effectiveAssignments accessCases
END-03|deviceConfigs managedDevices|settingsCatalogExport endpointSecurityExport assignmentStatus localAdmin encryption firewall
END-04|managedDevices alerts incidents|defenderInventory sensorHealth tamperProtection detectionReceipt
END-05|managedDevices deviceConfigs messages|updateRings installedSoftware vulnerabilityExport exceptions
END-06|appProtection ca signIns|platformPolicyExports appAssignments copySaveCases selectiveRemovalRecords
DATA-01|sites drives labels|dataMap classificationResults repositoryCoverage businessValidation
DATA-02|labels labelPolicies|labelAssignments encryptionSettings containerVsFile downloadCases
DATA-03|dlp dlpRules alerts|policyDistribution classifierSpecimen expectedTransfers observedTransfers exceptions
DATA-04|retention retentionRules recordLabels|retentionSchedule locationCoverage holds dispositionApprovals
DATA-05|ediscovery retention roles|caseAccess roleGroups preservationSearchSamples chainOfCustody
DATA-06|licenses roles|privacyRequests insiderRiskRoles caseSeparation complianceActionOwners
DATA-07|exoOrg roles directoryAudit|customerKeyExport keyAvailability lockboxRequests approvalSeparation
LOG-01|auditConfig exoOrg ual directoryAudit signIns|knownEvents ingestionDelays workloadCoverage
LOG-02|licenses auditRetention signIns ual|retentionMatrix historicalKnownEvents archiveQueries
LOG-03|signIns directoryAudit ual|sourceCounts siemCounts ingestionLatency missingIntervals
LOG-04|roles directoryAudit|evidenceRegister storageAcl immutability accessLogs custodyTransfers
LOG-05|directoryAudit alerts incidents|alertRules changeCases alertReceipt responseTimes
SOC-01|alerts incidents secureScores|detectionMatrix requiredSignals routingEvidence coverageGaps
SOC-02|signIns directoryAudit incidents|containmentTimeline sessionRevocationEvidence appAccessEvidence exerciseAcceptance
SOC-03|incidents alerts apps grants|phishingCase consentCase containmentRecords recoveredEvidence
SOC-04|roles incidents|incidentAuthority alternateCommunications legalContacts evidenceAccess exerciseAcceptance
REC-01|backupPolicies sites mailboxes|businessImpact recoveryUnits rtoSeconds rpoSeconds coverageReconciliation
REC-02|backupPolicies restoreSessions|startedUtc acceptedUtc recoveryPointUtc incidentUtc rtoSeconds rpoSeconds integrityChecks businessAcceptance
REC-03|backupPolicies roles directoryAudit|backupAdminRoles destructiveChangeControls separateApprovals compromiseExercise
REC-04|organization ca health messages|configurationExports dependencyMap outageProcedure recoveryExercise
AI-01|licenses apps principals grants|aiInventory dataFlows processingLocations approvedUse retention
AI-02|sites itemPermissions groupMembers|discoverySettings permissionSamples retrievalCases directAccessCases
AI-03|apps appRoles grants federatedCredentials|agentInventory tools endpoints approvalGates adversarialCases actionLogs
AI-04|retention ual incidents|aiEventSamples conversationRetention incidentRouting investigationCase
PP-01|licenses users ppEnvironments|environmentExport makerRoles environmentOwners lifecycleDecisions
PP-02|apps grants|dataPolicyExport connectorGroups endpointRules policyMode allowedCase prohibitedCase
PP-03|apps appRoles grants|appFlowInventory connectionOwners connectionReferences releaseApprovals effectivePermissions
PP-04|health licenses ppEnvironments|flowFailureExport dataverseCapacity continuityRecords recoveryAcceptance
FAB-01|groups users fabricSettings publicEmbeds|fabricTenantSettings publicEmbedInventory externalSharing publicAccessObservations
FAB-02|groups groupMembers apps grants fabricWorkspaces fabricWorkspaceUsers|workspaceAccess itemAccess semanticModelRoles sourceCredentials effectiveAccessCases
FAB-03|health licenses fabricWorkspaces|lineageExport refreshHistory gatewayInventory workspaceOwners continuityRecords
OPS-01|health messages|serviceOwners changeImpact lifecycleActions incidentCommunications
OPS-02|licenses users managedDevices sites|billingExports capacityReports allocationDecisions dormantLicenseReview
OPS-03|apps grants delegatedAdmin|supplierRegister sharedResponsibilities contracts assuranceReports accessReviews
OPS-04|ca roles apps licenses|priorBaseline driftReview changeApprovals retestEvidence
EXT-01|organization licenses domains|cloudServiceMatrix contractualRequirements featureAvailability prohibitedIntegrations
EXT-02|users licenses devices managedDevices|populationTypes sharedDeviceControls studentSafeguards shiftAccessCases
EXT-03|organization users sites|geoAssignments workloadResidency contractBoundary transferReview
EXT-04|sites drives apps|loopStorageMap embeddedContainers owners externalAccess retentionCoverage
EXT-05|users licenses|formsSettings formOwnerInventory externalResponses sensitiveCollectionControls
EXT-06|licenses apps|enabledServiceRegister storageMap owners auditCoverage retentionCoverage
EXT-07|organization crossPartners delegatedAdmin|tenantInventory migrationCoexistence trustApprovals exitCriteria
EXT-08|licenses roles|frameworkVersion controlCrosswalk evidencePeriod independentAssurance exclusions
EXT-09|cloudPCs managedDevices ca signIns|avdHostPools imageSecurity redirectPolicies sessionAccessCases continuity
EXT-10|domains namedLocations inboundConnectors outboundConnectors|dnsExport proxyPaths egressRules connectivityMeasurements failureDependencies
EXT-11|authPolicy ca appProtection|accessibilityRequirements userTestRecords approvedAlternatives equivalentProtection
'''
recipes = {}
for line in rows.strip().splitlines():
    cid, queries, fields = line.split('|')
    c = next(c for c in controls if c['id'] == cid)
    recipes[cid] = dict(id=cid, type='control', title=c['title'], controls=[cid], operations=queries.split(), requiredFields=fields.split(),
        objective=c['objective'], review=c['procedure'], criterion=c['criterion'], sources=[source_map[x]['url'] for x in c['sources'] if source_map[x]['publisher'].startswith('Microsoft')])

# Exact numbered runbook mapping: live reads plus step-specific historical evidence.
steps = {
'T01': [('IAM-03','ca defaults namedLocations','personaMatrix exclusions'),('IAM-02','signIns','resource client location deviceState existingClaims'),('IAM-02','signIns','allowedCase prohibitedCase correlationIds'),('IAM-03','ca crossDefault crossPartners signIns','effectivePolicyReview acceptedClaims'),('APP-04','principals appRoles grants','workloadBoundaryTests')],
'T02': [('IAM-04','roles authMethods ca','independentDependencies custody alerts'),('IAM-04','federation','exercisePlan alternateDependencies'),('IAM-04','signIns directoryAudit','custodianDemonstration alertReceipt'),('IAM-04','','timing alternateCustodian cleanupRecord')],
'T03': [('APP-01 APP-02 APP-03','apps principals grants appRoles appOwners federatedCredentials','approvedResourceScopes'),('APP-02','authorization grants appRoles','consentApprovals businessNeed'),('APP-04','appRoles grants','allowedCase prohibitedCase resource authMode'),('APP-05','directoryAudit','ownershipLossCase credentialAdditionCase decommissioningCase')],
'T04': [('COL-02','itemPermissions groupMembers','syntheticDocumentManifest intendedAudience'),('COL-01','itemPermissions','directAccessCase sharingLinkCase searchCase personas'),('AI-02','itemPermissions','retrievalPrompts groundingReferences directAccessCase'),('DATA-02','labels labelPolicies','containerLabel fileLabel downloadCase forwardingCase'),('AI-02','','restrictedSearchExport migrationDecision')],
'T05': [('MAIL-01','dkim acceptedDomains','senderPlatform headers traceIds dnsRecords alignment'),('MAIL-02','presetEop presetDefender antiPhishRules spamRules safeLinksRules safeAttachmentsRules','recipientAssignments precedenceDecision'),('MAIL-03','mailboxes inboxRules mailboxPermissions recipientPermissions remoteDomains transportRules outboundSpam','approvedForwardingDestinations'),('MAIL-03','','forwardingDeliveryCase expectedResult actualResult'),('MAIL-04','transport casMailboxes authPolicies signIns','clientInventory authModes retirementReview')],
'T06': [('LOG-01','auditConfig','exchangeSessionConfirmation'),('LOG-01','ual directoryAudit','knownEvent actor object operation occurredUtc'),('LOG-03','ual directoryAudit','rawEventFields siemArrivalUtc'),('LOG-02','ual signIns auditRetention','historicalKnownEvents licenseStrata archiveEvidence'),('LOG-03','ual signIns directoryAudit','sourceCounts exportCounts filters duplicateReview')],
'T07': [('DATA-03','','dataClass location actor destination expectedAction exception specimen'),('DATA-03','dlp dlpRules','positiveSpecimen negativeSpecimen rulePriority assignments'),('DATA-03','alerts','allowedCase prohibitedCase userExperience blockOverride alertCase'),('DATA-03','dlp dlpRules','excludedUserCase secondLocationCase policyMode'),('DATA-03','','labeledCases falsePositives missedCases testSetSize')],
'T08': [('END-01','devices managedDevices compliance complianceAssignments','testDevices defenderInventory protectionState'),('END-02','managedDevices ca signIns','compliantCase noncompliantCase unassignedCase gracePeriodCase noPolicySetting'),('END-06','appProtection','copyCase saveCase conditionalLaunchCase selectiveRemovalRecord'),('END-04','alerts incidents','validationProcedure testDevice telemetry responderReceipt')],
'T09': [('REC-01','','recoveryUnit destination knownGoodPoint expectedContent access rtoSeconds rpoSeconds acceptanceOwner'),('REC-01','backupPolicies','protectedUnits restorePoints dependencies'),('REC-02','restoreSessions','startedUtc requestUtc serviceCompletedUtc acceptedUtc destination'),('REC-02','restoreSessions','startedUtc acceptedUtc recoveryPointUtc incidentUtc rtoSeconds rpoSeconds integrityChecks businessAcceptance'),('REC-03','roles directoryAudit','backupAdminRoles destructiveChangeSafeguards compromiseExercise'),('REC-02','','cleanupApproval cleanupRecord holdReview scaleLimit')],
'T10': [('PP-03 AI-03','apps grants appRoles ppEnvironments','runtimeIdentity connectors environment tools endpoints policyMode exceptions'),('PP-02','','allowedCase prohibitedCase customConnectors nonblockableConnectors runtimeObservations'),('FAB-01','publicEmbeds fabricSettings','publicEmbedInventory approvedSyntheticPublicAccess'),('AI-03','appRoles grants','untrustedInstruction requestedAction authorizationDecision approvalEvidence'),('AI-04','ual incidents','testedAction eventIds incidentEvidence permissionChangeRetest')]
}
runbook = (ROOT / 'docs/FIELDWORK-RUNBOOKS.md').read_text(encoding='utf-8-sig')
for run, items in steps.items():
    section = re.search(r'## ' + run + r' .+?(?=\n## |\Z)', runbook, re.S).group(0)
    numbered = re.findall(r'^\d+\. (.+)', section, re.M)
    assert len(numbered) == len(items), (run,len(numbered),len(items))
    for n, (cids, queries, fields) in enumerate(items, 1):
        sid=f'{run}-{n:02}'
        # Remove generated line suffix on a rebuild.
        text=re.sub(r' \*\*Read-only script:.*$', '', numbered[n-1])
        refs=re.findall(r'\]\((https://learn.microsoft.com/[^)]+|https://techcommunity.microsoft.com/[^)]+)\)',text)
        recipes[sid]=dict(id=sid,type='fieldwork',title=f'{run} step {n}',controls=cids.split(),operations=queries.split(),requiredFields=fields.split(),objective='Collect and evaluate the existing evidence for this precise fieldwork step.',review=text,criterion='Confirm the expected and actual outcomes, scope, provenance and unresolved limitations. Active exercises are evaluated from existing records.',sources=list(dict.fromkeys(refs)))

phases = [
('Engagement model','GOV-01 GOV-02 GOV-03','charter reviewPeriod adoptedCriteria sponsorAcceptance'),
('Scope and discovery','GOV-01 GOV-05','workloadScope procurementReconciliation exclusions'),
('Delivery plan and responsibilities','GOV-03','deliveryPlan responsibilityMatrix escalationContacts'),
('Access and licensing','GOV-05 IAM-01','accessRequest roleScope licenseMatrix'),
('Evidence and collection quality','LOG-03 LOG-04','evidenceRegister custody collectionLimits'),
('Sampling and operating effectiveness','IAM-02 DATA-03 REC-02','population sampleMethod coverage operatingEvidence'),
('Control assessment rules','GOV-02 GOV-04','assessmentWorksheet evidenceLayers limitations reviewer'),
('Risk and prioritization','SOC-01 GOV-04','findingRegister impact likelihood priorities exceptions'),
('Fieldwork sequence','LOG-01 IAM-03 MAIL-02 END-02','fieldworkTracker evidenceCrossReferences unresolvedSteps'),
('Reporting and remediation','GOV-03 GOV-04','executiveReport factualReview remediationPlan accountableOwners'),
('Tenant and industry overlays','EXT-01 EXT-08','applicabilityMatrix frameworkCrosswalk featureAvailability'),
('Continuous assurance','OPS-04','baseline driftReview retestSchedule closureEvidence'),
('Limitations and handoff','LOG-04 GOV-03','limitations evidenceTransfer accessRemovalRecord ownerAcceptance')]
for n,(title,cids,fields) in enumerate(phases,1):
    sid=f'P{n:02}'
    cs=[recipes[x] for x in cids.split()]
    recipes[sid]=dict(id=sid,type='phase',title=title,controls=cids.split(),operations=list(dict.fromkeys(x for c in cs for x in c['operations'])),requiredFields=fields.split(),objective='Review the completed engagement workpapers for this phase.',review='Reconcile the named phase workpapers with collected evidence and the main playbook; record outstanding decisions.',criterion='No unsigned, missing or untraceable required workpaper; consultant review still required.',sources=list(dict.fromkeys(x for c in cs for x in c['sources'])))

assert set(c['id'] for c in controls) == {k for k,v in recipes.items() if v['type']=='control'}
assert all(k in ops for r in recipes.values() for k in r['operations'])
(OUT/'operations.json').write_text(json.dumps(ops,indent=2)+'\n',encoding='utf-8')
(OUT/'recipes.json').write_text(json.dumps(recipes,indent=2)+'\n',encoding='utf-8')
wrapper = '''#requires -Version 7.4
<#
.SYNOPSIS
__TITLE__
.DESCRIPTION
__DESCRIPTION__
Setup checks/installs missing modules, authenticates and verifies tenant context.
The audit then uses read-only commands. It writes local evidence files, screens for
review candidates and reports missing evidence. It never changes tenant settings
or assigns a control Pass. Use -Plan to inspect exact permissions and target inputs.
__LINKS__
#>
# Generated by tools/build_scripts.py. Shared engine contains the read-only boundary.
# Microsoft references and exact operations: ../recipes.json and ../operations.json.
[CmdletBinding()]
param(
    [guid]$ExpectedTenantId,
    [string]$OutputRoot,
    [string]$InputRoot,
    [string]$TargetsPath,
    [ValidateSet('Collect','Offline')][string]$Mode = 'Collect',
    [ValidateSet('Global','USGov','USGovDoD','China')][string]$GraphEnvironment = 'Global',
    [datetimeoffset]$StartUtc = [datetimeoffset]::UtcNow.AddDays(-7),
    [datetimeoffset]$EndUtc = [datetimeoffset]::UtcNow,
    [ValidateRange(1,100000)][int]$MaxPages = 1000,
    [switch]$UseExistingSessions,
    [string]$GraphClientId,
    [string]$CertificateThumbprint,
    [switch]$Plan
)
& (Join-Path $PSScriptRoot '../Invoke-M365Audit.ps1') -Id '__ID__' @PSBoundParameters
'''
for r in recipes.values():
    folder=OUT/('controls' if r['type']=='control' else 'steps')
    folder.mkdir(exist_ok=True)
    description=('Collects '+(', '.join(r['operations']) or 'existing local workpapers')+'. Reviews records for '+', '.join(r['requiredFields'])+'.')
    refs=list(dict.fromkeys(r['sources']+[ops[k]['source'] for k in r['operations']]))
    help_links='\n'.join('.LINK\n'+u for u in refs)
    rendered=wrapper.replace('__ID__',r['id']).replace('__TITLE__',r['id']+' - '+r['title']).replace('__DESCRIPTION__',description).replace('__LINKS__',help_links)
    (folder/(r['id']+'.ps1')).write_text(rendered,encoding='utf-8')

lines=['# Script coverage and evidence contracts','','Every control, numbered fieldwork step and main playbook phase has an executable entry script. Scripts collect read-only evidence and identify review candidates; completion of an evidence contract is not an audit Pass. See [execution instructions](../scripts/README.md).','','Use `-Plan` on any entry script to print exact reads, permissions, target inputs, required local records and Microsoft references without connecting or writing evidence. Reusable operations have their own [Microsoft command/API references](SCRIPT-OPERATIONS.md).','','## Controls','']
for typ, title in [('control','Controls'),('fieldwork','Numbered fieldwork steps'),('phase','Main playbook phases')]:
    if typ!='control': lines+=['',f'## {title}','']
    for r in (r for r in recipes.values() if r['type']==typ):
        folder='controls' if typ=='control' else 'steps'
        lines += [f"### {r['id']}",'',f"**{r['title']}** — [Run {r['id']}.ps1](../scripts/{folder}/{r['id']}.ps1)",'',
            '**Live read operations:** '+(', '.join(f"[`{k}`](SCRIPT-OPERATIONS.md#{k.lower()})" for k in r['operations']) or 'None for this procedural step; examine the existing records below.')+'.','',
            f"**Required local evidence:** `{r['id']}.json`, records with "+', '.join('`'+x+'`' for x in r['requiredFields'])+'. Each record also needs `id`, `observedUtc`, `owner`, and `evidenceFiles`. These are consultant workpaper fields, not API property names.','',
            '**Review:** '+r['review'],'','**Microsoft basis:** '+'; '.join(f'[Microsoft reference {n}]({u})' for n,u in enumerate(r['sources'],1)), '']
(ROOT/'docs/SCRIPT-COVERAGE.md').write_text('\n'.join(lines),encoding='utf-8')
lines=['# Read-only operation register','','Each operation is an explicit GET or an allowlisted Exchange/Purview read command. The runner never interprets shell text from input records. Permissions below are a planning starting point: the linked Microsoft page is authoritative for permission type, roles, licensing, sovereign-cloud support and returned properties. Session setup and consent are separate operator actions.','']
for k,o in ops.items():
    query='GET '+o['path'] if o['kind'] in ('graph','rest') else o['command']+' '+json.dumps(o['parameters'])
    title=o.get('command') or 'Read '+re.sub(r'(?<!^)([A-Z])',r' \1',k).lower()
    description='Retrieves the documented resource or configuration using '+('an HTTP GET' if o['kind'] in ('graph','rest') else 'the named read command')+'; preserves returned data for the controls linked in the coverage index.'
    lines += [f'## {k}','',f'**Title: {title}.** {description}','',f'`{query}`','',f"**Transport:** {o['kind']}. **Target input:** `{o['target'] or 'none'}`. **Permission:** {o['permission']}.",'',o['note'],'',f"[Microsoft API/command reference]({o['source']})",'']
(ROOT/'docs/SCRIPT-OPERATIONS.md').write_text('\n'.join(lines),encoding='utf-8')

# Attach every numbered step directly to its script. Idempotent rebuild.
run=None
new=[]
for line in runbook.splitlines():
    m=re.match(r'## (T\d{2}) ',line)
    if m: run=m.group(1)
    n=re.match(r'^(\d+)\. ',line)
    if n and run:
        line=re.sub(r' \*\*Read-only script:.*$', '',line)
        sid=f'{run}-{int(n.group(1)):02}'
        line+=f' **Read-only script:** [{sid}.ps1](../scripts/steps/{sid}.ps1); [exact evidence contract](SCRIPT-COVERAGE.md#{sid.lower()}).'
    new.append(line)
(ROOT/'docs/FIELDWORK-RUNBOOKS.md').write_text('\n'.join(new)+'\n',encoding='utf-8')
# Register exact API and command sources once, preserving the original source IDs.
registered={s['url'] for s in sources}
next_id=max(int(s['id'][1:]) for s in sources)+1
for o in ops.values():
    if o['source'] not in registered:
        sources.append(dict(id=f'S{next_id:02}',title='Microsoft reference: '+o['id'],url=o['source'],publisher='Microsoft',focus='Read-only operation syntax, permissions and limitations for '+o['id'],accessed='2026-10-12',review='Targeted API/command reference review and documented-path check; no live integration test.'))
        registered.add(o['source']); next_id+=1
(ROOT/'references/sources.json').write_text(json.dumps(sources,indent=2)+'\n',encoding='utf-8')
print(json.dumps({'operations':len(ops),'control_scripts':90,'fieldwork_scripts':48,'phase_scripts':13}))
