"""Check reference accessibility and five preregistered documentary counterexamples.

Stores status, hashes and term-match results only, never complete third-party pages.
These are documentary probes, not tests of a Microsoft 365 tenant.
"""
import concurrent.futures
import hashlib
import html
import json
import re
import urllib.error
import urllib.request
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sources = json.loads((ROOT / 'references/sources.json').read_text(encoding='utf-8-sig'))

def fetch(source):
    result = {'id':source['id'], 'url':source['url']}
    try:
        req = urllib.request.Request(source['url'], headers={'User-Agent':'Mozilla/5.0 M365-Audit-Reference-Review/1.0'})
        with urllib.request.urlopen(req, timeout=25) as response:
            data = response.read(8000000)
            result.update(status=response.status, final_url=response.url, bytes=len(data), sha256=hashlib.sha256(data).hexdigest())
        body = data.decode('utf-8', errors='replace')
        body = re.sub(r'<(script|style)\b[^>]*>.*?</\1>', ' ', body, flags=re.S | re.I)
        body = html.unescape(re.sub(r'<[^>]+>', ' ', body))
        body = re.sub(r'\s+', ' ', body).lower().replace('\u2019', "'")
        return result, body
    except Exception as exc:
        result.update(status='Unverified', error=f'{type(exc).__name__}: {exc}')
        return result, ''

with concurrent.futures.ThreadPoolExecutor(max_workers=10) as pool:
    results = list(pool.map(fetch, sources))
bodies = {record['id']: body for record, body in results}
probes = [
    ('D01', 'Secure Score substitutes for audit assurance', 'S01', ["isn't an absolute measurement", "don't cover all the attack surfaces"]),
    ('D02', 'Report-only policy establishes enforcement', 'S08', ["doesn't enforce", "aren't prompted"]),
    ('D03', 'Audit history has one universal retention period', 'S17', ['seven days', '30 days', 'separate from']),
    ('D04', 'A scanner completes every audit check', 'S57', ['manual checks needed', 'not able to be assessed automatically']),
    ('D05', 'Legal holds establish mass restore capability', 'S42', ['optimized for export', 'not for mass restore']),
]
probe_results = []
for probe_id, claim, source_id, terms in probes:
    matched = [term for term in terms if term in bodies[source_id]]
    killed = len(matched) == len(terms)
    probe_results.append({'id':probe_id, 'claim':claim, 'source':source_id,
        'test':'All selected documentary counterexample terms present; claim-level kill criteria were preregistered',
        'required_matches':len(terms), 'observed_matches':len(matched),
        'result':'Claim rejected' if killed else 'Needs manual review',
        'limitation':'Text matching confirms a located counterexample; it does not validate live tenant controls.'})
report = {'checked_utc':datetime.now(timezone.utc).isoformat(),
    'sources': [record for record, _ in results], 'documentary_probes':probe_results}
(ROOT / 'research').mkdir(exist_ok=True)
(ROOT / 'research/source-checks.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
unverified = [r for r,_ in results if r.get('status') != 200]
print(json.dumps({'sources':len(results), 'http_200':len(results)-len(unverified),
    'unverified':unverified, 'documentary_probes':probe_results}, indent=2))
