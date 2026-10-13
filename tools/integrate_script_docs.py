"""Update script navigation and inline help without connecting to Microsoft 365.

The generated comment help follows Microsoft's format:
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help
"""
import json
import re
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]

# Add titles, brief descriptions and primary references to reusable code functions.
helper_refs={
'Write-AuditJson':('Write local JSON evidence','Serializes evidence to a local file with explicit depth.','https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-json'),
'Get-AuditGraphContext':('Read Graph session context','Reads the currently authenticated tenant and cloud.','https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.authentication/get-mgcontext'),
'Invoke-AuditGraphGet':('Send an authorized Graph GET','Uses the Graph SDK transport with the HTTP method fixed to GET.','https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.authentication/invoke-mggraphrequest'),
'Read-AuditGraphPages':('Collect Graph pages','Retains pages and marks interrupted or unsafe pagination incomplete.','https://learn.microsoft.com/en-us/graph/paging'),
'Get-AuditExchangeConnection':('Verify the workload session','Checks tenant, connection count and Exchange versus Purview session type.','https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps'),
'Read-AuditExchange':('Collect Exchange and Purview read results','Preserves command results and reconciles UAL pagination and counts.','https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps'),
'Get-AuditRestToken':('Acquire a resource token from the verified context','Uses the selected existing Az context and retains the token only in memory.','https://learn.microsoft.com/en-us/powershell/module/az.accounts/get-azaccesstoken'),
'Invoke-AuditRestGet':('Send a fixed-method workload GET','Uses a secure bearer token and disables automatic HTTP redirects.','https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest'),
'Read-AuditLocalEvidence':('Validate existing workpaper evidence','Checks record fields, tenant binding and file references, and hashes source files.','https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash'),
'Get-AuditCandidates':('Screen collected evidence for review','Identifies consultant review candidates, reconciles devices and calculates recovery metrics.','https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide'),
'Initialize-AuditModule':('Make a required module available','Checks availability, installs a missing supported version, then imports it.','https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/install-psresource?view=powershellget-3.x'),
'Initialize-AuditSessions':('Authenticate before audit commands','Prepares modules, connects selected services and verifies the expected tenant.','https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0'),
}
for name in ('M365Audit.psm1','SessionSetup.ps1'):
    path=ROOT/'scripts'/name
    text=path.read_text(encoding='utf-8-sig')
    # Idempotent generated function help (file-level help is authored separately).
    text=re.sub(r'# BEGIN GENERATED FUNCTION HELP\n.*?# END GENERATED FUNCTION HELP\n','',text,flags=re.S)
    def annotate(m):
        function=m.group(1)
        title,description,url=helper_refs.get(function,(re.sub(r'(?<!^)([A-Z])',r' \1',function).replace('-',' ').strip(),'Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.','https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions'))
        return '# BEGIN GENERATED FUNCTION HELP\n<#\n.SYNOPSIS\n'+title+'\n.DESCRIPTION\n'+description+'\n.LINK\n'+url+'\n#>\n# END GENERATED FUNCTION HELP\n'+m.group(0)
    text=re.sub(r'^function ([\w-]+)',annotate,text,flags=re.M)
    text=text.replace('https://login.microsoftonline.us/common','https://login.microsoftonline.us/organizations').replace('https://login.chinacloudapi.cn/common','https://login.chinacloudapi.cn/organizations')
    text=text.replace('No remediation, new access test, restore, consent, module installation or tenant configuration change was performed.','The acquisition stage performs no remediation, new access test, restore or tenant configuration change. Setup may install local modules and authenticate; see session-setup.json.')
    path.write_text(text,encoding='utf-8')

play=ROOT/'PLAYBOOK.md'; text=play.read_text(encoding='utf-8-sig').replace('**Version 1.0','**Version 1.1')
text=re.sub(r'\n\*\*Phase evidence script:\*\*[^\n]+\n','\n',text)
text=re.sub(r'^(## (\d+)\. [^\n]+)\n',lambda m:m[1]+f"\n\n**Phase evidence script:** [P{int(m[2]):02}.ps1](scripts/steps/P{int(m[2]):02}.ps1) checks this phase's workpapers and collects mapped evidence. [Title, description, evidence requirements and Microsoft references](docs/SCRIPT-COVERAGE.md#p{int(m[2]):02}).\n",text,flags=re.M)
play.write_text(text,encoding='utf-8')
run=ROOT/'docs/FIELDWORK-RUNBOOKS.md'; text=run.read_text(encoding='utf-8-sig')
intro='**Read-only execution:** every numbered step below links to its own titled, documented script. Run the script to collect available configuration/events and inspect existing records for that precise step. Where a procedure describes creating content, signing in as a test persona, restoring or cleaning up, the read-only script reviews prior exercise evidence and reports a gap if none exists; it does not perform that separate change-producing exercise. See [setup and execution](../scripts/README.md) and [exact contracts](SCRIPT-COVERAGE.md). Product distinctions are documented by [Microsoft audit search](https://learn.microsoft.com/en-us/purview/audit-search) and [Microsoft 365 Backup](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-overview?view=o365-worldwide).'
if intro not in text: text=text.replace('# Fieldwork runbooks\n','# Fieldwork runbooks\n\n'+intro+'\n',1)
run.write_text(text,encoding='utf-8')

guide=ROOT/'docs/COLLECTION-GUIDE.md'; text=guide.read_text(encoding='utf-8-sig')
notice='**Executable work program:** use the [script runner](../scripts/README.md) for the new module-check → install-if-missing → authenticate → tenant-verification → read-only-collection sequence. The snippets below are focused command explanations; use the runner for execution guards, complete step mapping and preserved error results. Every [control/step script](SCRIPT-COVERAGE.md) includes a title, description and Microsoft references.'
if notice not in text: text=text.replace('# Evidence collection guide\n','# Evidence collection guide\n\n'+notice+'\n',1)
# Explain and reference every old copyable example inside its code block too.
titles=[('Read Conditional Access policies','Collects policy definitions; the runner adds shared safeguards.','https://learn.microsoft.com/en-us/graph/api/conditionalaccessroot-list-policies?view=graph-rest-1.0'),('Inspect audit ingestion and mailbox auditing','Reads independent organization audit switches.','https://learn.microsoft.com/en-us/purview/audit-log-enable-disable'),('Inspect SMTP AUTH settings','Reads organization defaults and mailbox overrides.','https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission'),('Inspect approved mailbox rules','Reads visible and hidden inbox rules for a named mailbox.','https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-inboxrule?view=exchange-ps'),('Inspect DKIM configuration','Reads signing state and tenant-provided DNS selectors.','https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure')]
i=iter(zip(titles,['IAM-03','LOG-01','MAIL-04','MAIL-03','MAIL-01']))
def code_help(m):
    (title,desc,url),control=next(i)
    body="""$auditParameters = @{
    ExpectedTenantId = '<approved-tenant-guid>'
    OutputRoot = 'D:/Audit/results'
    InputRoot = 'D:/Audit/inputs'
    TargetsPath = 'D:/Audit/targets.json'
}
"""+f'./scripts/controls/{control}.ps1 @auditParameters\n'
    return '~~~powershell\n# Title: '+title+'\n# Description: '+desc+' Module setup and authentication run before collection.\n# Reference: '+url+'\n'+body+'~~~'
text=re.sub(r'~~~powershell\n(.*?)~~~',code_help,text,flags=re.S)
text=text.replace('These examples are a **reference workbench**, not a complete tenant collector.','These examples invoke the documented control scripts, including their module availability, installation and authentication preflight.')
text=text.replace('The loop follows service-provided nextLink values.','The shared runner follows service-provided nextLink values, preserves pages and enforces a page cap.')
text=text.replace('It does **not** implement a production retry, timeout, throttling or resumable-collection strategy.','It does **not** implement automatic retries or resumable collection; a throttled request remains incomplete.')
guide.write_text(text,encoding='utf-8')

readme=ROOT/'README.md'; text=readme.read_text(encoding='utf-8-sig').replace('Version 1.0','Version 1.1')
sources=json.loads((ROOT/'references/sources.json').read_text(encoding='utf-8-sig'))
text=text.replace('**88 references—including 78 Microsoft sources**',f"**{len(sources)} references—including {sum(s['publisher'].startswith('Microsoft') for s in sources)} Microsoft sources**")
newrow='| [Read-only audit scripts](scripts/README.md) | 151 control/step/phase entry scripts, 100 documented reads, module setup, authentication, evidence reports and limitations |'
if newrow not in text: text=text.replace('| [Source register]',newrow+'\n| [Source register]',1)
text=text.replace('Collection examples were not run against Microsoft 365.','Scripts were tested locally with synthetic data and mocked transports; no live integration test was performed. Each script includes a title, description and Microsoft documentation references. Default setup checks/installs required modules, authenticates and verifies the tenant before read-only collection. See [measured script checks](research/SCRIPT-DISCONFIRMATION.md).')
text=text.replace('All 88 registered references returned HTTP 200 during source checking.','All 88 original methodology references returned HTTP 200 during the v1.0 source check; the 100 collector operation references were independently checked for v1.1.')
text=text.replace('python tools/build.py\npython tools/validate.py','''# Title: Rebuild the documented audit toolkit
# Description: Regenerate scripts, references and navigation; validate local documents.
# Reference: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help
python tools/build_scripts.py
python tools/build.py
python tools/integrate_script_docs.py
python tools/validate.py
pwsh -NoProfile -File tests/Test-ReadOnly.ps1''') if 'python tools/build_scripts.py' not in text else text
text=text.replace('python tools/check_sources.py\n','''# Title: Verify Microsoft reference accessibility
# Description: Fetch cited source pages and record status, hashes and targeted checks.
# Reference: https://learn.microsoft.com/en-us/graph/overview
python tools/check_sources.py
python tools/check_script_sources.py
''') if 'python tools/check_script_sources.py' not in text else text
readme.write_text(text,encoding='utf-8')

guide=ROOT/'scripts/README.md'; text=guide.read_text(encoding='utf-8')
text=text.replace('Scripts do not install modules, establish connections, grant consent, change configuration,','The acquisition stage does not change configuration,')
text=text.replace('Use PowerShell 7.2+','Use PowerShell 7.4+')
text=text.replace('Preinstall and approve only the modules needed for selected operations. A pre-existing session must have the read permissions and roles documented for each operation.','The default setup checks the modules required by the selected operations, installs a missing supported version for CurrentUser from the official PowerShell Gallery, imports it, authenticates each service and checks the tenant before audit reads. Authentication may display sign-in, MFA or consent prompts; any organizational consent/role prerequisites remain governed by the tenant. No role assignment or permission-grant API is called. Existing sufficient module versions are reused. Module versions are recorded in session-setup.json. A setup failure stops collection and produces setup-failure.json.')
text=text.replace('Uses the existing sessions and approved target/evidence files.','Prepares modules and authenticated sessions, then uses the approved target/evidence files.')
text=text.replace('It does not combine all permissions or establish a new session.','Setup requests only the scopes required by the selected recipes. A full AllControls run therefore requests a broad set of reader permissions; use selected controls when access is scoped.')
text=text.replace('This setup stage is separate from read-only tenant collection.','This setup stage is separate from read-only tenant collection.')
addition='''
## Module installation and authentication sequence

Every Collect entry script follows **check modules → install missing supported modules → import → authenticate → verify tenant/cloud → run read-only commands**. Setup is implemented in [SessionSetup.ps1](SessionSetup.ps1). It uses CurrentUser installation from the verified official PSGallery URL; it does not replace a sufficient installed version. Microsoft documents [Install-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/install-psresource?view=powershellget-3.x), [Graph authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0), [Exchange connection](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps), [Purview connection](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-scc-powershell?view=exchange-ps), and [Az authentication](https://learn.microsoft.com/en-us/powershell/module/az.accounts/connect-azaccount).

Plan and Offline modes perform no module downloads or authentication. `-UseExistingSessions` checks module availability and existing context but never installs or initiates sign-in; use it for a pre-provisioned workstation. Tenant mismatch or ambiguous Exchange/Purview sessions stop collection. Start a fresh process and authenticate to the intended tenant instead of mixing workload sessions. The setup floor is Microsoft.Graph.Authentication 2.0.0, ExchangeOnlineManagement 3.9.0, and Az.Accounts 4.0.0; these are implementation compatibility choices, not a claim that the minimum versions have been integration-tested. Installed versions and exact tenant behavior still require a pilot. [Connection metadata](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps).

Graph defaults to interactive delegated authentication. APIs such as `sites/getAllSites` require application permissions; the API's limitation remains an evidence gap in a delegated run. For an already approved certificate-backed application, supply both `-GraphClientId` and `-CertificateThumbprint`, or use a pre-existing verified application context. The scripts do not create an app, certificate, role assignment or consent grant. Certificate authentication is for Graph; establish any required workload application session separately and use existing-session mode. [Graph certificate authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0), [getAllSites permissions](https://learn.microsoft.com/en-us/graph/api/site-getallsites?view=graph-rest-1.0).

'''
if '## Module installation and authentication sequence' not in text: text=text.replace('## Plan the selected control',addition+'## Plan the selected control')
guide.write_text(text,encoding='utf-8')
