# Read-only operation register

Each operation is an explicit GET or an allowlisted Exchange/Purview read command. The runner never interprets shell text from input records. Permissions below are a planning starting point: the linked Microsoft page is authoritative for permission type, roles, licensing, sovereign-cloud support and returned properties. Session setup and consent are separate operator actions.

## organization

**Title: Read organization.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /organization`

**Transport:** graph. **Target input:** `none`. **Permission:** Organization.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/organization-list?view=graph-rest-1.0)

## licenses

**Title: Read licenses.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /subscribedSkus`

**Transport:** graph. **Target input:** `none`. **Permission:** LicenseAssignment.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/subscribedsku-list?view=graph-rest-1.0)

## domains

**Title: Read domains.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /domains`

**Transport:** graph. **Target input:** `none`. **Permission:** Domain.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/domain-list?view=graph-rest-1.0)

## users

**Title: Read users.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /users?$select=id,displayName,userPrincipalName,userType,accountEnabled,createdDateTime,assignedLicenses,onPremisesSyncEnabled`

**Transport:** graph. **Target input:** `none`. **Permission:** User.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/user-list?view=graph-rest-1.0)

## groups

**Title: Read groups.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /groups?$select=id,displayName,groupTypes,securityEnabled,mailEnabled,visibility,resourceProvisioningOptions`

**Transport:** graph. **Target input:** `none`. **Permission:** Group.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/group-list?view=graph-rest-1.0)

## groupMembers

**Title: Read group members.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /groups/{id}/transitiveMembers`

**Transport:** graph. **Target input:** `groupIds`. **Permission:** GroupMember.Read.All; limited properties need object read permissions; hidden members need Member.Read.Hidden.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/group-list-transitivemembers?view=graph-rest-1.0)

## groupOwners

**Title: Read group owners.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /groups/{id}/owners`

**Transport:** graph. **Target input:** `groupIds`. **Permission:** Group.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/group-list-owners?view=graph-rest-1.0)

## roles

**Title: Read roles.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /roleManagement/directory/roleAssignments`

**Transport:** graph. **Target input:** `none`. **Permission:** RoleManagement.Read.Directory.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/rbacapplication-list-roleassignments?view=graph-rest-1.0)

## roleDefinitions

**Title: Read role definitions.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /roleManagement/directory/roleDefinitions`

**Transport:** graph. **Target input:** `none`. **Permission:** RoleManagement.Read.Directory.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/rbacapplication-list-roledefinitions?view=graph-rest-1.0)

## pimEligible

**Title: Read pim eligible.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /roleManagement/directory/roleEligibilityScheduleInstances`

**Transport:** graph. **Target input:** `none`. **Permission:** RoleEligibilitySchedule.Read.Directory.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/rbacapplication-list-roleeligibilityscheduleinstances?view=graph-rest-1.0)

## pimActive

**Title: Read pim active.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /roleManagement/directory/roleAssignmentScheduleInstances`

**Transport:** graph. **Target input:** `none`. **Permission:** RoleAssignmentSchedule.Read.Directory.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/rbacapplication-list-roleassignmentscheduleinstances?view=graph-rest-1.0)

## accessReviews

**Title: Read access reviews.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /identityGovernance/accessReviews/definitions`

**Transport:** graph. **Target input:** `none`. **Permission:** AccessReview.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/accessreviewset-list-definitions?view=graph-rest-1.0)

## ca

**Title: Read ca.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /identity/conditionalAccess/policies`

**Transport:** graph. **Target input:** `none`. **Permission:** Policy.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0)

## namedLocations

**Title: Read named locations.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /identity/conditionalAccess/namedLocations`

**Transport:** graph. **Target input:** `none`. **Permission:** Policy.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-namedlocations?view=graph-rest-1.0)

## defaults

**Title: Read defaults.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /policies/identitySecurityDefaultsEnforcementPolicy`

**Transport:** graph. **Target input:** `none`. **Permission:** Policy.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/identitysecuritydefaultsenforcementpolicy-get?view=graph-rest-1.0)

## authPolicy

**Title: Read auth policy.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /policies/authenticationMethodsPolicy`

**Transport:** graph. **Target input:** `none`. **Permission:** Policy.Read.AuthenticationMethod.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/authenticationmethodspolicy-get?view=graph-rest-1.0)

## authMethods

**Title: Read auth methods.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /users/{id}/authentication/methods`

**Transport:** graph. **Target input:** `userIds`. **Permission:** UserAuthenticationMethod.Read.All; delegated role restrictions apply.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/authentication-list-methods?view=graph-rest-1.0)

## registration

**Title: Read registration.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /reports/authenticationMethods/userRegistrationDetails`

**Transport:** graph. **Target input:** `none`. **Permission:** AuditLog.Read.All; licensing and delegated role requirements apply.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/authenticationmethodsroot-list-userregistrationdetails?view=graph-rest-1.0)

## signIns

**Title: Read sign ins.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /auditLogs/signIns?$filter=createdDateTime ge {start} and createdDateTime le {end}`

**Transport:** graph. **Target input:** `none`. **Permission:** AuditLog.Read.All; Policy.Read.All for Conditional Access details; licensing and roles apply.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/signIn-list?view=graph-rest-1.0)

## directoryAudit

**Title: Read directory audit.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /auditLogs/directoryAudits?$filter=activityDateTime ge {start} and activityDateTime le {end}`

**Transport:** graph. **Target input:** `none`. **Permission:** AuditLog.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/directoryaudit-list?view=graph-rest-1.0)

## crossDefault

**Title: Read cross default.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /policies/crossTenantAccessPolicy/default`

**Transport:** graph. **Target input:** `none`. **Permission:** Policy.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/crosstenantaccesspolicyconfigurationdefault-get?view=graph-rest-1.0)

## crossPartners

**Title: Read cross partners.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /policies/crossTenantAccessPolicy/partners`

**Transport:** graph. **Target input:** `none`. **Permission:** Policy.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/crosstenantaccesspolicy-list-partners?view=graph-rest-1.0)

## authorization

**Title: Read authorization.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /policies/authorizationPolicy`

**Transport:** graph. **Target input:** `none`. **Permission:** Policy.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/authorizationpolicy-get?view=graph-rest-1.0)

## apps

**Title: Read apps.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /applications`

**Transport:** graph. **Target input:** `none`. **Permission:** Application.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/application-list?view=graph-rest-1.0)

## principals

**Title: Read principals.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /servicePrincipals`

**Transport:** graph. **Target input:** `none`. **Permission:** Application.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/serviceprincipal-list?view=graph-rest-1.0)

## grants

**Title: Read grants.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /oauth2PermissionGrants`

**Transport:** graph. **Target input:** `none`. **Permission:** Directory.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/oauth2permissiongrant-list?view=graph-rest-1.0)

## appRoles

**Title: Read app roles.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /servicePrincipals/{id}/appRoleAssignments`

**Transport:** graph. **Target input:** `servicePrincipalIds`. **Permission:** Application.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/serviceprincipal-list-approleassignments?view=graph-rest-1.0)

## appOwners

**Title: Read app owners.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /applications/{id}/owners`

**Transport:** graph. **Target input:** `applicationIds`. **Permission:** Application.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/application-list-owners?view=graph-rest-1.0)

## federatedCredentials

**Title: Read federated credentials.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /applications/{id}/federatedIdentityCredentials`

**Transport:** graph. **Target input:** `applicationIds`. **Permission:** Application.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/application-list-federatedidentitycredentials?view=graph-rest-1.0)

## federation

**Title: Read federation.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /domains/{id}/federationConfiguration`

**Transport:** graph. **Target input:** `domainNames`. **Permission:** Domain-InternalFederation.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/domain-list-federationconfiguration?view=graph-rest-1.0)

## delegatedAdmin

**Title: Read delegated admin.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /tenantRelationships/delegatedAdminRelationships`

**Transport:** graph. **Target input:** `none`. **Permission:** DelegatedAdminRelationship.Read.All; partner/customer visibility limitations apply.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/tenantrelationship-list-delegatedadminrelationships?view=graph-rest-1.0)

## riskyUsers

**Title: Read risky users.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /identityProtection/riskyUsers`

**Transport:** graph. **Target input:** `none`. **Permission:** IdentityRiskyUser.Read.All; licensing and roles apply.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/riskyuser-list?view=graph-rest-1.0)

## riskDetections

**Title: Read risk detections.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /identityProtection/riskDetections`

**Transport:** graph. **Target input:** `none`. **Permission:** IdentityRiskEvent.Read.All; licensing and roles apply.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/riskdetection-list?view=graph-rest-1.0)

## devices

**Title: Read devices.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /devices`

**Transport:** graph. **Target input:** `none`. **Permission:** Device.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/device-list?view=graph-rest-1.0)

## managedDevices

**Title: Read managed devices.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /deviceManagement/managedDevices`

**Transport:** graph. **Target input:** `none`. **Permission:** DeviceManagementManagedDevices.Read.All; active Intune license.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/intune-devices-manageddevice-list?view=graph-rest-1.0)

## compliance

**Title: Read compliance.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /deviceManagement/deviceCompliancePolicies`

**Transport:** graph. **Target input:** `none`. **Permission:** DeviceManagementConfiguration.Read.All; active Intune license.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/intune-deviceconfig-devicecompliancepolicy-list?view=graph-rest-1.0)

## complianceAssignments

**Title: Read compliance assignments.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /deviceManagement/deviceCompliancePolicies/{id}/assignments`

**Transport:** graph. **Target input:** `compliancePolicyIds`. **Permission:** DeviceManagementConfiguration.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/intune-deviceconfig-devicecompliancepolicyassignment-list?view=graph-rest-1.0)

## deviceConfigs

**Title: Read device configs.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /deviceManagement/deviceConfigurations`

**Transport:** graph. **Target input:** `none`. **Permission:** DeviceManagementConfiguration.Read.All; excludes settings catalog and some endpoint security policy families.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/intune-deviceconfig-deviceconfiguration-list?view=graph-rest-1.0)

## appProtection

**Title: Read app protection.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /deviceAppManagement/managedAppPolicies`

**Transport:** graph. **Target input:** `none`. **Permission:** DeviceManagementApps.Read.All; expand platform assignments separately.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/intune-mam-managedapppolicy-list?view=graph-rest-1.0)

## sites

**Title: Read sites.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /sites/getAllSites`

**Transport:** graph. **Target input:** `none`. **Permission:** APPLICATION ONLY: Sites.Read.All; delegated unsupported.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/site-getallsites?view=graph-rest-1.0)

## site

**Title: Read site.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /sites/{id}`

**Transport:** graph. **Target input:** `siteIds`. **Permission:** Sites.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/site-get?view=graph-rest-1.0)

## drives

**Title: Read drives.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /sites/{id}/drives`

**Transport:** graph. **Target input:** `siteIds`. **Permission:** Sites.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/drive-list?view=graph-rest-1.0)

## itemPermissions

**Title: Read item permissions.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /drives/{driveId}/items/{itemId}/permissions`

**Transport:** graph. **Target input:** `driveItems`. **Permission:** Files.Read.All or Sites.Read.All; caller-dependent permission visibility.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/driveitem-list-permissions?view=graph-rest-1.0)

## team

**Title: Read team.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /teams/{id}`

**Transport:** graph. **Target input:** `teamIds`. **Permission:** Team.ReadBasic.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/team-get?view=graph-rest-1.0)

## channels

**Title: Read channels.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /teams/{id}/channels`

**Transport:** graph. **Target input:** `teamIds`. **Permission:** Channel.ReadBasic.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/channel-list?view=graph-rest-1.0)

## teamMembers

**Title: Read team members.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /teams/{id}/members`

**Transport:** graph. **Target input:** `teamIds`. **Permission:** TeamMember.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/team-list-members?view=graph-rest-1.0)

## teamApps

**Title: Read team apps.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /teams/{id}/installedApps?$expand=teamsAppDefinition`

**Transport:** graph. **Target input:** `teamIds`. **Permission:** Delegated: TeamsAppInstallation.ReadForTeam. Application: TeamsAppInstallation.Read.Group (resource-specific consent) or TeamsAppInstallation.ReadForTeam.All for approved tenant-wide reading..

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/team-list-installedapps?view=graph-rest-1.0)

## incidents

**Title: Read incidents.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /security/incidents`

**Transport:** graph. **Target input:** `none`. **Permission:** SecurityIncident.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/security-list-incidents?view=graph-rest-1.0)

## alerts

**Title: Read alerts.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /security/alerts_v2`

**Transport:** graph. **Target input:** `none`. **Permission:** SecurityAlert.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/security-list-alerts_v2?view=graph-rest-1.0)

## secureScores

**Title: Read secure scores.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /security/secureScores`

**Transport:** graph. **Target input:** `none`. **Permission:** SecurityEvents.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/security-list-securescores?view=graph-rest-1.0)

## backupPolicies

**Title: Read backup policies.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /solutions/backupRestore/protectionPolicies`

**Transport:** graph. **Target input:** `none`. **Permission:** BackupRestore-Configuration.Read.All; Global cloud only.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/backuprestoreroot-list-protectionpolicies?view=graph-rest-1.0)

## restoreSessions

**Title: Read restore sessions.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /solutions/backupRestore/restoreSessions`

**Transport:** graph. **Target input:** `none`. **Permission:** BackupRestore-Restore.Read.All; Global cloud only.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/backuprestoreroot-list-restoresessions?view=graph-rest-1.0)

## health

**Title: Read health.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /admin/serviceAnnouncement/healthOverviews`

**Transport:** graph. **Target input:** `none`. **Permission:** ServiceHealth.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/serviceannouncement-list-healthoverviews?view=graph-rest-1.0)

## messages

**Title: Read messages.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /admin/serviceAnnouncement/messages`

**Transport:** graph. **Target input:** `none`. **Permission:** ServiceMessage.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/serviceannouncement-list-messages?view=graph-rest-1.0)

## cloudPCs

**Title: Read cloud p cs.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /deviceManagement/virtualEndpoint/cloudPCs`

**Transport:** graph. **Target input:** `none`. **Permission:** CloudPC.Read.All.

Read the permission table and cloud availability in the linked API reference. Collection means all returned pages for this query, not proof of tenant-wide visibility.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/graph/api/virtualendpoint-list-cloudpcs?view=graph-rest-1.0)

## ppEnvironments

**Title: Read pp environments.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /environmentmanagement/environments?api-version=2024-10-01`

**Transport:** rest. **Target input:** `none`. **Permission:** Power Platform API environment read permissions and existing user access; PREVIEW, user-visible environments, not guaranteed tenant-wide inventory..

Commercial cloud only in this adapter. Setup verifies/installs Az.Accounts and authenticates before collection, unless existing-session mode is selected. Reads use a token for this resource. Results are bounded by caller visibility. Review API request limits and preview status at the source.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/rest/api/power-platform/environmentmanagement/environments/list-environments-for-user)

## fabricWorkspaces

**Title: Read fabric workspaces.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /v1.0/myorg/admin/groups?$top=5000&$skip={skip}&$expand=reports,datasets,dashboards`

**Transport:** rest. **Target input:** `none`. **Permission:** Delegated Tenant.Read.All plus Fabric administrator; service principals have separate documented tenant settings and consent restrictions..

Commercial cloud only in this adapter. Setup verifies/installs Az.Accounts and authenticates before collection, unless existing-session mode is selected. Reads use a token for this resource. Results are bounded by caller visibility. Review API request limits and preview status at the source.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/rest/api/power-bi/admin/groups-get-groups-as-admin)

## fabricWorkspaceUsers

**Title: Read fabric workspace users.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /v1.0/myorg/admin/groups/{id}/users`

**Transport:** rest. **Target input:** `workspaceIds`. **Permission:** Delegated Tenant.Read.All plus Fabric administrator; service principal conditions apply..

Commercial cloud only in this adapter. Setup verifies/installs Az.Accounts and authenticates before collection, unless existing-session mode is selected. Reads use a token for this resource. Results are bounded by caller visibility. Review API request limits and preview status at the source.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/rest/api/power-bi/admin/groups-get-group-users-as-admin)

## publicEmbeds

**Title: Read public embeds.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /v1.0/myorg/admin/widelySharedArtifacts/publishedToWeb`

**Transport:** rest. **Target input:** `none`. **Permission:** Tenant.Read.All; Fabric administrator or supported service principal..

Commercial cloud only in this adapter. Setup verifies/installs Az.Accounts and authenticates before collection, unless existing-session mode is selected. Reads use a token for this resource. Results are bounded by caller visibility. Review API request limits and preview status at the source.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/rest/api/power-bi/admin/widely-shared-artifacts-published-to-web)

## fabricSettings

**Title: Read fabric settings.** Retrieves the documented resource or configuration using an HTTP GET; preserves returned data for the controls linked in the coverage index.

`GET /v1/admin/tenantsettings`

**Transport:** rest. **Target input:** `none`. **Permission:** Delegated Tenant.Read.All plus Fabric administrator; supported service principal or managed identity conditions apply..

Commercial cloud only in this adapter. Setup verifies/installs Az.Accounts and authenticates before collection, unless existing-session mode is selected. Reads use a token for this resource. Results are bounded by caller visibility. Review API request limits and preview status at the source.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/rest/api/fabric/admin/tenants/list-tenant-settings)

## exoOrg

**Title: Get-OrganizationConfig.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-OrganizationConfig {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-organizationconfig?view=exchange-ps)

## auditConfig

**Title: Get-AdminAuditLogConfig.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-AdminAuditLogConfig {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-adminauditlogconfig?view=exchange-ps)

## transport

**Title: Get-TransportConfig.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-TransportConfig {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-transportconfig?view=exchange-ps)

## dkim

**Title: Get-DkimSigningConfig.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-DkimSigningConfig {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-dkimsigningconfig?view=exchange-ps)

## acceptedDomains

**Title: Get-AcceptedDomain.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-AcceptedDomain {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-accepteddomain?view=exchange-ps)

## remoteDomains

**Title: Get-RemoteDomain.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-RemoteDomain {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-remotedomain?view=exchange-ps)

## inboundConnectors

**Title: Get-InboundConnector.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-InboundConnector {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-inboundconnector?view=exchange-ps)

## outboundConnectors

**Title: Get-OutboundConnector.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-OutboundConnector {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-outboundconnector?view=exchange-ps)

## transportRules

**Title: Get-TransportRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-TransportRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-transportrule?view=exchange-ps)

## antiPhish

**Title: Get-AntiPhishPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-AntiPhishPolicy {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-antiphishpolicy?view=exchange-ps)

## antiPhishRules

**Title: Get-AntiPhishRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-AntiPhishRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-antiphishrule?view=exchange-ps)

## spam

**Title: Get-HostedContentFilterPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-HostedContentFilterPolicy {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-hostedcontentfilterpolicy?view=exchange-ps)

## spamRules

**Title: Get-HostedContentFilterRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-HostedContentFilterRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-hostedcontentfilterrule?view=exchange-ps)

## outboundSpam

**Title: Get-HostedOutboundSpamFilterPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-HostedOutboundSpamFilterPolicy {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-hostedoutboundspamfilterpolicy?view=exchange-ps)

## outboundSpamRules

**Title: Get-HostedOutboundSpamFilterRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-HostedOutboundSpamFilterRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-hostedoutboundspamfilterrule?view=exchange-ps)

## malware

**Title: Get-MalwareFilterPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-MalwareFilterPolicy {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-malwarefilterpolicy?view=exchange-ps)

## malwareRules

**Title: Get-MalwareFilterRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-MalwareFilterRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-malwarefilterrule?view=exchange-ps)

## safeLinks

**Title: Get-SafeLinksPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-SafeLinksPolicy {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-safelinkspolicy?view=exchange-ps)

## safeLinksRules

**Title: Get-SafeLinksRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-SafeLinksRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-safelinksrule?view=exchange-ps)

## safeAttachments

**Title: Get-SafeAttachmentPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-SafeAttachmentPolicy {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-safeattachmentpolicy?view=exchange-ps)

## safeAttachmentsRules

**Title: Get-SafeAttachmentRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-SafeAttachmentRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-safeattachmentrule?view=exchange-ps)

## presetEop

**Title: Get-EOPProtectionPolicyRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-EOPProtectionPolicyRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-eopprotectionpolicyrule?view=exchange-ps)

## presetDefender

**Title: Get-ATPProtectionPolicyRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-ATPProtectionPolicyRule {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-atpprotectionpolicyrule?view=exchange-ps)

## quarantine

**Title: Get-QuarantinePolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-QuarantinePolicy {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-quarantinepolicy?view=exchange-ps)

## authPolicies

**Title: Get-AuthenticationPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-AuthenticationPolicy {}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-authenticationpolicy?view=exchange-ps)

## mailboxes

**Title: Get-Mailbox.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-Mailbox {"ResultSize": "Unlimited"}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-mailbox?view=exchange-ps)

## casMailboxes

**Title: Get-CASMailbox.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-CASMailbox {"ResultSize": "Unlimited"}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-casmailbox?view=exchange-ps)

## inboxRules

**Title: Get-InboxRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-InboxRule {"Mailbox": "{id}", "IncludeHidden": true}`

**Transport:** exchange. **Target input:** `mailboxes`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-inboxrule?view=exchange-ps)

## mailboxPermissions

**Title: Get-MailboxPermission.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-MailboxPermission {"Identity": "{id}"}`

**Transport:** exchange. **Target input:** `mailboxes`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-mailboxpermission?view=exchange-ps)

## recipientPermissions

**Title: Get-RecipientPermission.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-RecipientPermission {"Identity": "{id}"}`

**Transport:** exchange. **Target input:** `mailboxes`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-recipientpermission?view=exchange-ps)

## ual

**Title: Search-UnifiedAuditLog.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Search-UnifiedAuditLog {"StartDate": "{start}", "EndDate": "{end}", "SessionCommand": "ReturnLargeSet", "ResultSize": 5000}`

**Transport:** exchange. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Runner repeats a unique SessionId until an empty page. The 50,000-result limit, duplicate pages, missing ResultCount, or a count mismatch produce Partial; split the interval and rerun. This remains a source query, not proof of event generation or retention.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps)

## labels

**Title: Get-Label.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-Label {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-label?view=exchange-ps)

## labelPolicies

**Title: Get-LabelPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-LabelPolicy {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-labelpolicy?view=exchange-ps)

## dlp

**Title: Get-DlpCompliancePolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-DlpCompliancePolicy {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-dlpcompliancepolicy?view=exchange-ps)

## dlpRules

**Title: Get-DlpComplianceRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-DlpComplianceRule {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-dlpcompliancerule?view=exchange-ps)

## retention

**Title: Get-RetentionCompliancePolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-RetentionCompliancePolicy {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-retentioncompliancepolicy?view=exchange-ps)

## retentionRules

**Title: Get-RetentionComplianceRule.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-RetentionComplianceRule {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-retentioncompliancerule?view=exchange-ps)

## recordLabels

**Title: Get-ComplianceTag.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-ComplianceTag {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-compliancetag?view=exchange-ps)

## ediscovery

**Title: Get-ComplianceCase.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-ComplianceCase {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-compliancecase?view=exchange-ps)

## auditRetention

**Title: Get-UnifiedAuditLogRetentionPolicy.** Retrieves the documented resource or configuration using the named read command; preserves returned data for the controls linked in the coverage index.

`Get-UnifiedAuditLogRetentionPolicy {}`

**Transport:** purview. **Target input:** `none`. **Permission:** Existing session with an RBAC role exposing this read command and the required object scope. See command reference; do not assume Global Reader covers Exchange/Purview..

Inspect RBAC scoping, warnings and result limits. Results are a snapshot; confirm effective assignments and operational evidence separately.

[Microsoft API/command reference](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-unifiedauditlogretentionpolicy?view=exchange-ps)
