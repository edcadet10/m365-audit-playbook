"""Render human-readable controls and references from the authored source data."""
import csv
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sources = json.loads((ROOT / 'references/sources.json').read_text(encoding='utf-8-sig'))
controls = json.loads((ROOT / 'controls/catalog.json').read_text(encoding='utf-8-sig'))
by_id = {s['id']: s for s in sources}

def links(ids):
    return '; '.join(f"[{i}: {by_id[i]['title']}]({by_id[i]['url']})" for i in ids)

lines = ['# Microsoft 365 control catalog', '',
    f"{len(controls)} consultant-authored controls across {len(set(c['domain'] for c in controls))} domains. Research reviewed 12 October 2026.", '',
    'The Microsoft references beside each procedure explain its product basis. The procedures, priorities, owners and acceptance criteria are proposed consultant methodology, not text issued by Microsoft. Adopt and tailor them in the engagement charter. Source links support product facts and context; they do not imply Microsoft mandates every test, sample or organizational decision.', '',
    'All controls start as **Not assessed**. The catalog does not report any real tenant findings. Every active test requires engagement authorization. Use [the playbook](../PLAYBOOK.md), [fieldwork runbooks](../docs/FIELDWORK-RUNBOOKS.md) and [assessment worksheet](../templates/control-assessment.csv) together.', '',
    '## Domain index', '']
for domain, count in Counter(c['domain'] for c in controls).items():
    anchor = domain.lower().replace(' ', '-').replace('/', '')
    lines.append(f'- [{domain}](#{anchor}) — {count} controls')
for domain in dict.fromkeys(c['domain'] for c in controls):
    lines += ['', f'## {domain}', '']
    for c in (c for c in controls if c['domain'] == domain):
        refs = links(c['sources'])
        ms = links([i for i in c['sources'] if by_id[i]['publisher'].startswith('Microsoft')])
        lines += [f"### {c['id']} — {c['title']}", '',
            f"**Objective:** {c['objective']} {ms}", '',
            f"**Applicability:** {c['applicability']} {ms}", '',
            f"**Proposed accountable owner:** {c['owner']}. **Suggested priority:** {c['priority']}. These are consultant assignments; determine actual finding severity from evidence.", '',
            f"**Evidence to collect:** {c['evidence']} {ms}", '',
            f"**Audit procedure (consultant method):** {c['procedure']} {ms}", '',
            f"**Read-only execution — {c['title']}:** [{c['id']}.ps1](../scripts/controls/{c['id']}.ps1) collects the mapped live evidence and checks this control's existing workpapers. [Exact operations, required fields and Microsoft references](../docs/SCRIPT-COVERAGE.md#{c['id'].lower()}). Use `-Plan` to inspect its reads and permissions before execution; [execution guide](../scripts/README.md). Missing evidence remains incomplete; the script does not implement the remediation below.", '',
            f"**Proposed assessment criterion:** {c['criterion']} {ms}", '',
            f"**Falsifying probe (authorized test or evidence challenge):** {c['falsification']} {ms}", '',
            f"**Remediation direction:** {c['remediation']} {ms}", '',
            f"**Suggested review cadence:** {c['cadence']} This is a consultant default unless a cited source specifies otherwise.", '',
            f"**Source trail:** {refs}", '']
(ROOT / 'controls/CONTROL-CATALOG.md').write_text('\n'.join(lines), encoding='utf-8')

fields = list(controls[0]) + ['read_only_script','script_evidence_contract']
with (ROOT / 'controls/control-catalog.csv').open('w', newline='', encoding='utf-8-sig') as f:
    writer = csv.DictWriter(f, fieldnames=fields)
    writer.writeheader()
    for c in controls:
        writer.writerow({**c, 'sources': '; '.join(by_id[i]['url'] for i in c['sources']),
            'read_only_script':f"scripts/controls/{c['id']}.ps1", 'script_evidence_contract':f"docs/SCRIPT-COVERAGE.md#{c['id'].lower()}"})

lines = ['# Source register', '',
    'Access/research date: **12 October 2026**. Sources are living documents unless a version is pinned. Links are cited at the point of use in the playbook and control catalog. Read current documentation again before an engagement, especially for licensing, rollouts and retirement dates.', '',
    'Review scope: targeted sections relevant to the cited claims; this is not a claim that every linked document was exhaustively reviewed. The CIS entry is a public catalog only. Product Terms is an authoritative entry point: individual customer contracts and licensing programs were not supplied. Product documentation is distinguished from original consultant testing and prioritization.', '']
for s in sources:
    lines += [f"## {s['id']}", '', f"**[{s['title']}]({s['url']})**", '',
        f"Publisher: {s['publisher']}. Accessed: {s['accessed']}.", '',
        f"Used for: {s['focus']}", '', f"Review: {s['review']}", '']
(ROOT / 'references/SOURCES.md').write_text('\n'.join(lines), encoding='utf-8')

assessment_fields = ['control_id','title','applicability_decision','requirement','assessment_layer','review_period','population','sample','evidence_ids','result','observation','confidence','exception_id','finding_id','owner','reviewer','assessed_utc','limitation','microsoft_references']
with (ROOT / 'templates/control-assessment.csv').open('w', newline='', encoding='utf-8-sig') as f:
    w = csv.DictWriter(f, fieldnames=assessment_fields)
    w.writeheader()
    for c in controls:
        w.writerow({'control_id':c['id'], 'title':c['title'], 'result':'Not assessed', 'owner':c['owner'],
            'microsoft_references':'; '.join(by_id[i]['url'] for i in c['sources'] if by_id[i]['publisher'].startswith('Microsoft'))})
print(json.dumps({'controls':len(controls),'domains':len(set(c['domain'] for c in controls)),'sources':len(sources)}))
