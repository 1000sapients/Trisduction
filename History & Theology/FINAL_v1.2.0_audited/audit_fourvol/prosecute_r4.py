"""Round 4 · limit + symmetry restated (highest yield) · named targets: R3 rewordings · standing detectors."""
import re,json,sys,subprocess
D=sys.argv[1]
V={k:open(f'{D}/{f}',encoding='utf-8').read() for k,f in [('II','Vol_II_The_Conceded_Throne.md'),('III','Vol_III_History_of_the_Messianic_Position.md'),('IV','Vol_IV_The_Office_of_the_Messiah.md')]}
RM=open(f'{D}/README.md',encoding='utf-8').read(); CL=open(f'{D}/CHANGELOG.md',encoding='utf-8').read()
F=[]
def finding(reg,mech,sev,fals,loc): F.append(dict(register=reg,mechanism=mech,severity=sev,falsifier=fals,loc=loc))
W={'two':2,'three':3,'four':4,'five':5,'six':6,'seven':7,'eight':8,'nine':9,'ten':10}
# standing ARITH: "### I. N signs/sites/..." heading vs enumerated John-chapter items below it
for vol,t in V.items():
    for m in re.finditer(r'### I\. (Seven|Nine|Eight|Six|Five|Four) signs',t):
        seg=t[m.end():m.end()+1500]; items=len(set(re.findall(r'John (\d{1,2})[:\s,]',seg)))+0
        n=W[m.group(1).lower()]; enum=len(re.findall(r'the (wine|official|man at the pool|feeding|walking|man born blind|raising)',seg))
        if enum and abs(enum-n)>=2: finding('limit',f'Vol {vol}: heading "{m.group(0)}" over an enumeration of {enum} signs','COSMETIC','count the enumeration','Vol '+vol+' ch.46')
# standing DRIFT: "concession" as rhetorical admission in Vol II (defined: the grant of monarchy on demand)
for m in re.finditer(r'The concession here is Isaiah\'s, granting',V['II']):
    finding('symmetry','Vol II: "concession" used as a rhetorical admission by the prophet, against the volume\'s defined sense (Book V: the grant of monarchy on Israel\'s demand at 1 Samuel 8)','STRUCTURAL','read Book V against this use','Vol II ch.79')
# standing SCOPE: a scoped negative widened to "in any sense"
for vol,t in V.items():
    for m in re.finditer(r'neither was messianic in any sense',t):
        finding('limit',f'Vol {vol}: "{m.group(0)}" widens the chapter\'s scoped negative ("in the sense this book has been using") to an unrestricted one the chapter does not argue','LOAD-BEARING','the chapter\'s own definition of the sense','Vol '+vol+' ch.78')
# NAMED TARGET 1: the one-discipline sentence's three rules, tested per volume
blk=re.search(r'## THE FOUR VOLUMES, AND WHY THERE ARE FOUR(.*?)\n---\n',V['II'],re.S).group(1)
if 'every claim carrying its grade' in blk:
    labels={k:len(re.findall(r'\[(Documented|Attested|Reconstructed|Disputed|Circumstantial|Speculative)\]',t)) for k,t in V.items()}
    gradew={k:len(re.findall(r'\bgrade\b',t.split('# CONTENTS',1)[1])) for k,t in V.items()}
    if labels['II']==0 and gradew['II']==0:
        finding('symmetry',f'block states the shared discipline includes "every claim carrying its grade"; Vol II carries no per-claim labels (bracket labels {labels}) and the word grade does not occur in its body ({gradew}); its discipline is the removability criterion, the census, and the falsifiers; the rule is true of III and IV and false of II','STRUCTURAL','grep grade / bracket labels in Vol II body','companion block, all three volumes')
# NAMED TARGET 2: the bridge sentence vs Vol IV ch.14's own usage (must not contradict)
if 'geometry of the position' in blk and 'rather than on geometry' in V['IV']:
    pass  # bridged to 'structural reading'; ch.14 calls its structural apparatus geometry; consistent
# NAMED TARGET 3: README zone list, each named zone exists in Vol II
for z,pat in [('front-matter note',r'^## A NOTE ON WHAT THIS BOOK IS'),('Chapter 5',r'^## CHAPTER 5 ·'),('Appendix I',r'^## APPENDIX I'),('Appendix J',r'^## APPENDIX J'),('companion block',r'^## THE FOUR VOLUMES'),('bibliography absence',r'^## VII · WHAT IS ABSENT')]:
    if not re.search(pat,V['II'],re.M): finding('limit',f'README names zone "{z}" that has no heading in Vol II','STRUCTURAL','grep','README')
# NAMED TARGET 4: CHANGELOG overlap figures re-executed
def body(t):
    t=re.sub(r'## THE FOUR VOLUMES, AND WHY THERE ARE FOUR.*?\n---\n','',t,flags=re.S); return re.sub(r'# AUTHOR DISCLOSURE.*$','',t,flags=re.S)
def sh(t,k=10):
    w=re.sub(r'\*+','',t).split(); return set(" ".join(w[i:i+k]) for i in range(0,len(w)-k,3))
B={k:sh(body(v)) for k,v in V.items()}; A={k:sh(v) for k,v in V.items()}
ob=[len(B[a]&B[b])/min(len(B[a]),len(B[b]))*100 for a,b in [('II','III'),('II','IV'),('III','IV')]]
oa=[len(A[a]&A[b])/min(len(A[a]),len(A[b]))*100 for a,b in [('II','III'),('II','IV'),('III','IV')]]
print(f"overlap bodies {min(ob):.2f}-{max(ob):.2f}  whole {min(oa):.2f}-{max(oa):.2f}")
if not (0.10<=min(ob)<=0.14 and 0.30<=max(ob)<=0.34 and 0.25<=min(oa)<=0.29 and 1.00<=max(oa)<=1.05):
    finding('limit',f'CHANGELOG prints bodies 0.12-0.32 and whole 0.27-1.02; re-executed bodies {min(ob):.2f}-{max(ob):.2f}, whole {min(oa):.2f}-{max(oa):.2f}','STRUCTURAL','recompute','CHANGELOG')
# R3 battery rerun (structure, naming, single-corpus citations proper) via the R3 script's components on this copy
r=subprocess.run(['python3','prosecute_r3.py',D],capture_output=True,text=True).stdout
carried=[l for l in r.splitlines() if l.strip().startswith('P-') and ('geometry' in l or 'same instrument' in l or 'shingle' in l or 'licensed zones' in l or 'closing movement' in l or 'Six designations' in l or 'instrument this book' in l or 'royal theology' in l)]
print("R3-battery items still firing on this copy (expected: none of the repaired ones):",len(carried))
for l in carried: print("   ",l[:160])
print("\nFINDINGS:",len(F))
for i,f in enumerate(F,1): print(f"  P-{i} [{f['register']}] [{f['severity']}] {f['loc']}: {f['mechanism'][:260]} || falsifier: {f['falsifier'][:60]}")
json.dump(F,open('prosecution_r4.json','w'),indent=1)
