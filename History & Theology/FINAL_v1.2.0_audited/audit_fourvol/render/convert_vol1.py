import re,sys
from html.parser import HTMLParser
t=open(sys.argv[1],encoding='utf-8').read()
def to_boxes(head_line,rows_lines,vol):
    head=[c.strip().strip('*').strip() for c in head_line.strip().strip('|').split('|')]; out=[]
    for l in rows_lines:
        r=[c.strip() for c in l.strip().strip('|').split('|')]
        if len(r)!=len(head): return None
        out.append(f":::box {vol} Summary\n"+"\n\n".join(f"**{h}.** {v}" for h,v in zip(head,r) if v)+"\n:::")
    return "\n\n".join(out)
lines=t.split('\n'); out=[]; i=0; vol='0'
while i<len(lines):
    ln=lines[i]; mv=re.match(r'^### VOLUME (\d+)',ln)
    if mv: vol=mv.group(1)
    if ln.strip()=='#### Summary':
        j=i+1
        while j<len(lines) and not lines[j].strip(): j+=1
        if j+1<len(lines) and lines[j].lstrip().startswith('|') and re.match(r'^\|[\s\-:|]+\|\s*$',lines[j+1]):
            k=j+2; rows=[]
            while k<len(lines) and lines[k].lstrip().startswith('|'): rows.append(lines[k]); k+=1
            bx=to_boxes(lines[j],rows,vol)
            if bx: out+=['#### Summary','',bx]; i=k; continue
    out.append(ln); i+=1
t2='\n'.join(out)
class P(HTMLParser):
    def __init__(s): super().__init__(); s.rows=[]; s.cur=None; s.cell=None
    def handle_starttag(s,tag,a):
        if tag=='tr': s.cur=[]
        elif tag in('th','td'): s.cell=[]
        elif s.cell is not None and tag=='strong': s.cell.append('**')
        elif s.cell is not None and tag=='em': s.cell.append('*')
        elif s.cell is not None and tag=='p' and s.cell: s.cell.append(' · ')
        elif s.cell is not None and tag=='br': s.cell.append(' ')
    def handle_endtag(s,tag):
        if s.cell is not None and tag=='strong': s.cell.append('**')
        elif s.cell is not None and tag=='em': s.cell.append('*')
        elif tag in('th','td') and s.cur is not None:
            txt=re.sub(r'\s+',' ',''.join(s.cell)).strip().replace('|','/')
            txt=re.sub(r'\*\*\s+([^*]+?)\s+\*\*',r'**\1**',txt); txt=re.sub(r'(?<!\*)\*\s+([^*]+?)\s+\*(?!\*)',r'*\1*',txt)
            s.cur.append(txt); s.cell=None
        elif tag=='tr' and s.cur is not None: s.rows.append(s.cur); s.cur=None
    def handle_data(s,d):
        if s.cell is not None: s.cell.append(d)
n=[0]
def html_to_pipe(m):
    n[0]+=1; p=P(); p.feed(m.group(0)); rows=[r for r in p.rows if r]; w=max(len(r) for r in rows); rows=[r+['']*(w-len(r)) for r in rows]
    return "\n".join([f"Table*: Table F.{n[0]} | Comprehensive Geopolitical Event Log, part {n[0]}","| "+" | ".join(rows[0])+" |","|"+"|".join(['---']*w)+"|"]+["| "+" | ".join(r)+" |" for r in rows[1:]])+"\n"
t3=re.sub(r'<table>.*?</table>',html_to_pipe,t2,flags=re.S)
open(sys.argv[2],'w',encoding='utf-8').write(t3); print("vol1 conversions: summary boxes",t3.count(':::box'),"html tables",n[0])
