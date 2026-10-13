"""Document integrity and synthetic decision-rule checks. No tenant access."""
import csv
import json
import re
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]
controls = json.loads((ROOT / 'controls/catalog.json').read_text(encoding='utf-8-sig'))
sources = json.loads((ROOT / 'references/sources.json').read_text(encoding='utf-8-sig'))
source_map = {s['id']:s for s in sources}
errors = []
required = ['id','domain','title','objective','applicability','owner','priority','evidence','procedure','criterion','falsification','remediation','sources','cadence']
if len({c['id'] for c in controls}) != len(controls): errors.append('Duplicate control ID')
if len(source_map) != len(sources): errors.append('Duplicate source ID')
for c in controls:
    for field in required:
        if not c.get(field): errors.append(f"{c['id']}: missing {field}")
    for source_id in c['sources']:
        if source_id not in source_map: errors.append(f"{c['id']}: unknown source {source_id}")
    if not any(source_map.get(i,{}).get('publisher','').startswith('Microsoft') for i in c['sources']):
        errors.append(f"{c['id']}: no Microsoft source")

def anchors(text):
    found = set()
    counts = {}
    for title in re.findall(r'^#{1,6}\s+(.+)$', text, re.M):
        title = re.sub(r'<[^>]+>', '', title)
        slug = re.sub(r'[^\w\- ]', '', title.lower()).replace(' ', '-')
        count = counts.get(slug, 0)
        counts[slug] = count + 1
        found.add(slug + (f'-{count}' if count else ''))
    return found

md_files = list(ROOT.rglob('*.md'))
link_count = 0
for path in md_files:
    content = path.read_text(encoding='utf-8-sig')
    if '{{S' in content: errors.append(f'{path.relative_to(ROOT)}: unresolved citation marker')
    for source_id in re.findall(r'\[(S\d+):', content):
        if source_id not in source_map: errors.append(f'{path.name}: unknown citation {source_id}')
    for target in re.findall(r'\]\(([^)]+)\)', content):
        if target.startswith(('https://','http://','mailto:')): continue
        link_count += 1
        parts = urlsplit(target)
        dest = (path.parent / unquote(parts.path)).resolve() if parts.path else path
        if not dest.exists(): errors.append(f'{path.relative_to(ROOT)}: missing {target}')
        elif parts.fragment and dest.suffix == '.md':
            if unquote(parts.fragment) not in anchors(dest.read_text(encoding='utf-8-sig')):
                errors.append(f'{path.relative_to(ROOT)}: missing anchor {target}')

with (ROOT / 'templates/control-assessment.csv').open(encoding='utf-8-sig', newline='') as f:
    rows = list(csv.DictReader(f))
    if len(rows) != len(controls): errors.append('Assessment row count differs from control count')
    if any(r['result'] != 'Not assessed' for r in rows): errors.append('Template falsely asserts an assessed tenant result')

def decide(case):
    # Literal implementation of the playbook's evidence taxonomy, not a tenant auditor.
    if case.get('applicable') is False: return 'Not applicable'
    if case.get('access_denied') or case.get('manual_unfinished') or case.get('capability_unavailable'):
        return 'Not assessed'
    if case.get('prohibited_access') or (case.get('enforcement_required') and case.get('report_only')):
        return 'Fail'
    if case.get('coverage_gap'): return 'Partially implemented'
    if not case.get('operating_evidence'): return 'Not assessed'
    return 'Pass'

cases = [
    {'name':'Report-only MFA', 'enforcement_required':True, 'report_only':True, 'expected':'Fail'},
    {'name':'Excluded ordinary administrator', 'coverage_gap':True, 'operating_evidence':True, 'expected':'Partially implemented'},
    {'name':'Registered MFA without enforcement evidence', 'operating_evidence':False, 'expected':'Not assessed'},
    {'name':'Log access denied misread as no activity', 'access_denied':True, 'expected':'Not assessed'},
    {'name':'Premium capability unavailable and alternative not assessed', 'capability_unavailable':True, 'expected':'Not assessed'},
    {'name':'Existing prohibited grant survives sharing restriction', 'prohibited_access':True, 'expected':'Fail'},
    {'name':'Backup configured without restore evidence', 'operating_evidence':False, 'expected':'Not assessed'},
    {'name':'Scanner manual check unfinished', 'manual_unfinished':True, 'expected':'Not assessed'},
]
for case in cases:
    case['actual'] = decide(case)
    case['matched'] = case['actual'] == case['expected']
    if not case['matched']: errors.append('Synthetic classification mismatch: ' + case['name'])

report = {'checked_utc':datetime.now(timezone.utc).isoformat(), 'controls':len(controls),
    'domains':len(set(c['domain'] for c in controls)), 'sources':len(sources),
    'microsoft_sources':sum(s['publisher'].startswith('Microsoft') for s in sources),
    'markdown_files':len(md_files), 'local_links_checked':link_count,
    'synthetic_cases_passed':sum(c['matched'] for c in cases), 'synthetic_cases':cases,
    'errors':errors, 'limitations':['Structural and synthetic checks only. No real tenant, tool integration or security control was validated.']}
(ROOT / 'research/validation-results.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
print(json.dumps(report, indent=2))
raise SystemExit(1 if errors else 0)
