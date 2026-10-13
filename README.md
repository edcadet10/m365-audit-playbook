# Microsoft 365 Audit Playbook

**A comprehensive, evidence-based work program for Microsoft 365 security, governance, compliance readiness, resilience and operations.**

Prepared for Jeff Cadet. Version 1.0. Research reviewed **12 October 2026**.

**[Read the playbook →](PLAYBOOK.md)**

The toolkit contains **90 controls across 17 domains**, **10 fieldwork runbooks**, **16 engagement templates**, and **88 references—including 78 Microsoft sources**. Microsoft documentation is linked beside product claims and procedures. Consultant-defined tests, priorities, sample sizes and deadlines are clearly distinguished from Microsoft's guidance.

| Start here | What it provides |
|---|---|
| [Main playbook](PLAYBOOK.md) | Engagement planning, scope, roles, licensing, evidence, sampling, ratings, reporting and remediation |
| [Control catalog](controls/CONTROL-CATALOG.md) | Objectives, applicability, evidence, procedures, criteria, falsifying probes, remediation and sources |
| [Spreadsheet control catalog](controls/control-catalog.csv) | Portable work program for filtering and assignment |
| [Fieldwork runbooks](docs/FIELDWORK-RUNBOOKS.md) | Practical tests for access, apps, sharing, email, logs, DLP, devices, recovery and agents |
| [Collection guide](docs/COLLECTION-GUIDE.md) | Permission planning, scoped read examples, completeness checks and tool limitations |
| [Engagement templates](templates/README.md) | Charter, evidence, findings, remediation, exceptions, executive report and assessment worksheets |
| [Source register](references/SOURCES.md) | Direct links, provenance, access date and the use of each source |
| [Disconfirmation report](research/DISCONFIRMATION.md) | Claims rejected by evidence, actual check results and remaining limitations |

## Coverage

Governance; Entra identity and privileged access; applications and automation; hybrid infrastructure; Exchange; SharePoint and OneDrive; Teams; endpoints; information protection; audit logging; incident response; recovery; Copilot and agents; Power Platform; Fabric and Power BI; operations; and specialized tenant/workload overlays.

The approach follows Microsoft's [Zero Trust deployment guidance](https://learn.microsoft.com/en-us/microsoft-365/security/microsoft-365-zero-trust?view=o365-worldwide), with explicit attention to documented limits in [Secure Score](https://learn.microsoft.com/en-us/defender-xdr/microsoft-secure-score), [Graph authorization](https://learn.microsoft.com/en-us/graph/permissions-overview), [audit evidence](https://learn.microsoft.com/en-us/purview/audit-search) and [recovery](https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide). CISA, NIST, CIS and tool-maintainer sources provide additional perspectives.

## Using the toolkit

1. Complete the charter and workload inventory; adopt the requirements for the actual tenant and review period.
2. Confirm licenses, permissions, evidence custody and authorized tests.
3. Work through the controls and record real evidence in a restricted engagement copy.
4. Challenge apparent passes with the runbooks; report coverage gaps explicitly.
5. Deliver findings, decisions and remediation; retest before closing issues.

These steps are the consultant methodology explained and sourced in the [main playbook](PLAYBOOK.md). All assessment worksheet rows begin **Not assessed**.

## Verification and boundaries

The documentary review rejected five misleading shortcuts. The eight synthetic evidence cases returned their intended non-Pass classifications. All 88 registered references returned HTTP 200 during source checking. See the [actual results and limitations](research/DISCONFIRMATION.md).

**No live tenant was audited.** This repository contains methodology, blank workpapers and synthetic verification cases. Collection examples were not run against Microsoft 365. Completed tenant exports, credentials and sensitive client reports belong in a controlled evidence store.

The full CIS benchmark was not obtained; no complete CIS conformity claim or proprietary benchmark reproduction is made. This playbook is not a Microsoft publication or certification. Referenced materials remain governed by their publishers' terms.

## Maintaining the repository

Requires Python 3.10+ for the local document utilities; no additional Python packages are required.

```powershell
python tools/build.py
python tools/validate.py
```

To recheck external references and documentary counterexamples, run:

```powershell
python tools/check_sources.py
```

The network check records current source hashes and status; it does not connect to a tenant. Revisit licensing, cloud availability, preview features and retirement dates before each engagement. The [source register](references/SOURCES.md) identifies the original research boundary.
