"""Round 2 prosecution · registers: parameter, provenance · plus the standing ARITH/DRIFT/SCOPE detectors. Framework-blind. Named targets: the R1 additions (instrument-family sentences)."""
import re,json,sys,collections,urllib.request
D=sys.argv[1]
V={k:open(f'{D}/{f}',encoding='utf-8').read() for k,f in [('II','Vol_II_The_Conceded_Throne.md'),('III','Vol_III_History_of_the_Messianic_Position.md'),('IV','Vol_IV_The_Office_of_the_Messiah.md')]}
RM=open(f'{D}/README.md',encoding='utf-8').read(); CL=open(f'{D}/CHANGELOG.md',encoding='utf-8').read()
F=[]
def finding(reg,mech,sev,fals,loc): F.append(dict(register=reg,mechanism=mech,severity=sev,falsifier=fals,loc=loc))

# ---- standing ARITH detector (sharpened: first pass matched single-line only): "N verses later" against the nearest preceding verse head in the same chapter
W={'one':1,'two':2,'three':3,'four':4,'five':5,'six':6,'seven':7,'eight':8,'nine':9,'ten':10,'eleven':11,'twelve':12,'thirteen':13,'fourteen':14,'fifteen':15,'sixteen':16,'twenty':20,'thirty':30,'forty':40,'fifty':50}
for vol,t in V.items():
    for m in re.finditer(r'\*\*And (\d{1,2}):(\d{1,3}), (\w+) verses later\.\*\*',t):
        c2,v2,word=m.groups(); n=W.get(word)
        back=t[max(0,m.start()-900):m.start()]
        heads=re.findall(r'\*\*'+re.escape(c2)+r':(\d{1,3})(?:-(\d{1,3}))?,',back)
        if n and heads:
            v1,v1b=heads[-1]; lo=int(v1b or v1); hi=int(v2)
            if not (hi-int(v1)-1 <= n <= hi-int(v1)+1 or hi-lo-1 <= n <= hi-lo+1):
                finding('parameter',f'Vol {vol}: "{c2}:{v2}, {word} verses later" follows the head {c2}:{v1}{"-"+v1b if v1b else ""}; the printed verse numbers give {hi-int(v1)} or {hi-lo} verses, not {n}','COSMETIC','subtract the verse numbers','Vol '+vol+' ch.156')
# ---- standing DRIFT detector: defined term "deficit" (Vol II: the receiver-side failure of reception) used as "gap in the record"
for m in re.finditer(r'\bdeficit\b[^.]{0,80}\b(supplies no|lacks|no date|gap in the record|is that it)',V['II']):
    finding('provenance',f'Vol II: "deficit" used as an informational gap: …{V["II"][m.start()-40:m.end()+60].strip()}… against the volume\'s defined sense, the receiver-side failure (Chapter 3 / Book IV)','STRUCTURAL','read Book IV\'s definition against this use','Vol II ch.33')
# ---- standing SCOPE detector: proof-claims on labelled exhibits
for vol,t in V.items():
    for m in re.finditer(r'prove[s]? the thesis[^.]*by themselves|prove[s]? the thesis of this Book',t):
        ctx=t[max(0,m.start()-200):m.end()+300]
        if '[Documented]' in ctx: finding('parameter',f'Vol {vol}: "{m.group(0)}" asserts proof over material the same passage labels [Documented] (a citation grade, not a proof grade); the volume\'s own strength rule caps a conclusion at its weakest label','LOAD-BEARING','apply the strength rule of the Reading Conventions to this sentence','Vol '+vol+' ch.40')

# ---- PARAMETER: C7 falsifier loop per volume (stated in advance and returned)
loops={'II':(r'CHAPTER 6 · The Three Falsifiers, Stated in Advance',r'CHAPTER 163 · Falsification · The Three Criteria and Their Results'),
       'III':(r'\*\*Falsifier one\.',r'The third falsifier, answered'),
       'IV':(r'### The falsifier, stated in advance',r'A study that states no falsifiers is a description')}
for vol,(a,b) in loops.items():
    if not (re.search(a,V[vol]) and re.search(b,V[vol])): finding('parameter',f'Vol {vol}: falsifier loop open: stated={bool(re.search(a,V[vol]))} returned={bool(re.search(b,V[vol]))}','LOAD-BEARING','locate both','Vol '+vol)
# refuting-observation named?  every falsifier statement must name an observation
for vol,t in V.items():
    for m in re.finditer(r'\*\*Falsifier (one|two|three)\.\s*([^*]+)\*\*',t):
        if not re.search(r'text|passage|case|verse|corpus|source',m.group(2)): finding('parameter',f'Vol {vol}: falsifier {m.group(1)} names no observable: "{m.group(2)[:80]}"','STRUCTURAL','name the observation','Vol '+vol)

# ---- PROVENANCE: named targets, the R1 additions
blk=re.search(r'## THE FOUR VOLUMES, AND WHY THERE ARE FOUR(.*?)\n---\n',V['IV'],re.S).group(1)
for phrase,mech in [("without having been made to","the block asserts the three readings converge 'without having been made to'; the disclosures state one author set the direction of all three and that the thesis is stated in advance (Vol III: 'the thesis is stated once, in Book I'); textual independence is measured (C3) but evidential independence of readings authored by one hand to one thesis is not shown by the artifacts, and the sentence claims it"),
                    ("are deposited as a set","the block asserts Volumes II, III, and IV 'are deposited as a set' while the README in the same folder lists all three as pending on both surfaces and the live registry carries no record for them; a deposit-state assertion contradicted by the set's own README")]:
    if phrase in blk: finding('provenance',mech,'STRUCTURAL',f'the sentence "{phrase}" against README deposit table and the disclosures','companion block, all three volumes')
# instrument-family sentence: does the stated family reproduce the printed range? (re-executed by the Defense; here the prosecutor checks the family is actually stated, not merely named)
if not re.search(r'full or standardly abbreviated',blk) or not re.search(r'nearest named book',blk): finding('provenance','instrument family named but not stated','STRUCTURAL','read the note','companion block')

# ---- PROVENANCE: C8 counts and DOIs against the live record
try:
    d=json.load(urllib.request.urlopen("https://zenodo.org/api/records/22243674",timeout=20)); doi=d.get('doi'); cdoi=d.get('conceptdoi'); lic=d['metadata']['license']['id']
except Exception as e: doi=cdoi=lic=None; print("zenodo fetch failed:",e)
for vol,t in V.items():
    for want,got,lab in [("10.5281/zenodo.22243674",doi,"version DOI"),("10.5281/zenodo.22243673",cdoi,"concept DOI")]:
        if want in t and got and got!=want: finding('provenance',f'Vol {vol} companion block {lab} {want} vs live {got}','STRUCTURAL','API','block')
    if 'CC BY 4.0' in t and lic and lic!='cc-by-4.0': finding('provenance',f'licence printed CC BY 4.0, live {lic}','STRUCTURAL','API','block')
print("live record: doi",doi,"concept",cdoi,"licence",lic)
# README deposit table vs block
if 'pending' in RM and 'are deposited as a set' in blk: pass  # already filed above
# ---- PROVENANCE: circular validation in disclosures (self-certified verification claims without external witness named)
for vol,t in V.items():
    m=re.search(r'# AUTHOR DISCLOSURE(.*)',t,re.S)
    if m and re.search(r'verified (clean|independently)|independent(ly)? (re-executed|audited)',m.group(1)) and not re.search(r'external|referee|second reader',m.group(1)):
        finding('provenance',f'Vol {vol} disclosure claims independent verification without naming an external witness','STRUCTURAL','name the witness','disclosure')

print("\nFINDINGS:",len(F))
for i,f in enumerate(F,1): print(f"  P-{i} [{f['register']}] [{f['severity']}] {f['loc']}: {f['mechanism'][:230]} || falsifier: {f['falsifier'][:90]}")
json.dump(F,open('prosecution_r2.json','w'),indent=1)
