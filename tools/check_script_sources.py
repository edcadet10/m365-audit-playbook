"""Script reference verification: check Microsoft API paths and read-command docs.

Fetches official pages, compares selected documented request syntax, and stores
status/hash metadata. This is not an integration test. Reference:
https://learn.microsoft.com/en-us/graph/overview
"""
import concurrent.futures
import hashlib
import html
import json
import re
import urllib.request
from datetime import datetime, timezone
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
ops=json.loads((ROOT/'scripts/operations.json').read_text())
def fetch(o):
    r={'id':o['id'],'url':o['source']}
    try:
        with urllib.request.urlopen(urllib.request.Request(o['source'],headers={'User-Agent':'Mozilla/5.0 Audit-Reference-Review'}),timeout=30) as response:
            raw=response.read(4000000)
            r.update(status=response.status,finalUrl=response.url,sha256=hashlib.sha256(raw).hexdigest())
        body=html.unescape(re.sub('<[^>]+>',' ',raw.decode('utf-8','replace')))
        body=re.sub(r'\s+',' ',body)
        if o['kind'] in ('graph','rest'):
            path=o['path'].split('?')[0]
            pattern=re.escape(path).replace(re.escape('{id}'),r'\{[^}]+\}').replace(re.escape('{driveId}'),r'\{[^}]+\}').replace(re.escape('{itemId}'),r'\{[^}]+\}')
            r['documentedPathMatch']=bool(re.search(pattern,body,re.I))
        else: r['documentedCommandMatch']=o['command'].lower() in body.lower()
        # Extract only small factual permission-table fragments for review, not entire pages.
        m=re.search(r'Delegated \(work or school account\)(.{0,180})',body)
        if m: r['delegatedPermissionExcerpt']=m.group(1).strip()
    except Exception as e: r.update(status='Unverified',error=str(e))
    return r
with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool: results=list(pool.map(fetch,ops.values()))
report={'checkedUtc':datetime.now(timezone.utc).isoformat(),'operations':results,'liveTenantTested':False}
(ROOT/'research/script-source-checks.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps({'checked':len(results),'http200':sum(r['status']==200 for r in results),'review':[r for r in results if r['status']!=200 or r.get('documentedPathMatch') is False or r.get('documentedCommandMatch') is False]},indent=2))
