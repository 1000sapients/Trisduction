"""Round 3 prosecution · registers: limit, symmetry · standing ARITH/DRIFT/SCOPE detectors · named targets: R2 rewordings in the companion block."""
import re,json,sys,collections
D=sys.argv[1]
V={k:open(f'{D}/{f}',encoding='utf-8').read() for k,f in [('II','Vol_II_The_Conceded_Throne.md'),('III','Vol_III_History_of_the_Messianic_Position.md'),('IV','Vol_IV_The_Office_of_the_Messiah.md')]}
F=[]
def finding(reg,mech,sev,fals,loc): F.append(dict(register=reg,mechanism=mech,severity=sev,falsifier=fals,loc=loc))
W={'two':2,'three':3,'four':4,'five':5,'six':6,'seven':7,'eight':8}
# ---- standing ARITH: "N designations/sites/verbs" counted against the italic enumeration immediately before
for vol,t in V.items():
    for m in re.finditer(r'\b(Two|Three|Four|Five|Six|Seven|Eight) designations\b',t):
        back=t[max(0,m.start()-700):m.start()]; items=re.findall(r'\*[^*\n]{2,40}\*, ',back)
        n=W[m.group(1).lower()]
        if items and abs(len(items)-n)>=2: finding('limit',f'Vol {vol}: "{m.group(0)}" after an italic enumeration of {len(items)} items','COSMETIC','count the italic items','Vol '+vol+' ch.34')
# ---- standing DRIFT: "instrument" carrying two senses in one sentence (the corpus's memory-act vs the book's evidentiary instrument)
for vol,t in V.items():
    for m in re.finditer(r'sets one instrument, an act of memory[^.]*which is the instrument this book uses',t):
        finding('symmetry',f'Vol {vol}: one sentence uses "instrument" for the corpus\'s own remedy (the act of memory) and for this book\'s evidentiary apparatus; the two are different objects and the sentence identifies them','STRUCTURAL','read the Reading Conventions\' definition of the evidence labels against zakhor','Vol '+vol+' ch.10')
# ---- standing SCOPE: quantifier widening from a Book to the whole corpus
for vol,t in V.items():
    for m in re.finditer(r'That is the whole of the Hebrew Bible\'s royal theology in the first verse',t):
        finding('limit',f'Vol {vol}: "{m.group(0)}" states as the whole corpus\'s royal theology what the chapter had scoped to Book VI\'s finding; Psalm 72:1 cannot carry the corpus','LOAD-BEARING','the chapter\'s own scope sentence one paragraph up','Vol '+vol+' ch.103')

# ---- LIMIT L1: C6, the four components present in each volume's own text (not by pointer)
comp={'unentered terminus':[r'not entered|never entered|un-?entered|failed to enter|failure of entry|did not enter'],
      'receiver-located deficit':[r'located at the receiver|located at reception|failure of reception|receiver-side|at the receiver'],
      'escalation of the figure':[r'escalat'],
      'passive grammar of receipt':[r'passive|the subject is God|God as subject|divine subject|conferral|conferred']}
for vol,t in V.items():
    body=t.split('# CONTENTS',1)[1]
    for c,pats in comp.items():
        n=sum(len(re.findall(p,body,re.I)) for p in pats)
        if n<3: finding('limit',f'Vol {vol}: component "{c}" appears {n}× in the body beyond the companion block','LOAD-BEARING','grep the body','Vol '+vol)
    print(f"L1 Vol {vol}:",{c:sum(len(re.findall(p,body,re.I)) for p in pats) for c,pats in comp.items()})
# ---- LIMIT L2: the block's pointer to Vol II Chapter 164 and to closing movements
c164=re.search(r'^## CHAPTER 164 ·(.*)$',V['II'],re.M)
if not (c164 and re.search(r'nothing|fall',c164.group(1),re.I)): finding('limit',f'block points at Vol II Chapter 164 for the arrival clause; heading reads: {c164.group(1) if c164 else None}','STRUCTURAL','read ch.164','block')
for vol in ('III','IV'):
    tail=V[vol][-60000:]
    if not re.search(r'name a man|names a man|name one|supply a name|non-arrival|arrives tomorrow|arrival',tail,re.I): finding('limit',f'Vol {vol}: block says the closing movement states the no-name/no-arrival clause; not found in the last 60k chars','STRUCTURAL','read the closing movement','Vol '+vol)
# ---- LIMIT L3: C1 single-corpus re-run on this version (licensed zones: Ch1, App J, companion block, bibliography absence declaration)
t=V['II']; L=t.split("\n")
def zone(i):
    return any(a<=i<b for a,b in Z)
def lf(pat):
    r=[k for k,l in enumerate(L) if re.search(pat,l)]; return r[0] if r else None
Z=[(lf(r'^## THE FOUR VOLUMES'),lf(r'^# CONTENTS')),(lf(r'^## CHAPTER 1 ·'),lf(r'^## CHAPTER 2 ·')),(lf(r'^## APPENDIX J'),lf(r'^## APPENDIX K')),(lf(r'^## VII · WHAT IS ABSENT'),lf(r'^## VIII · WHAT WAS NOT SEARCHED')),(lf(r'^# AUTHOR DISCLOSURE'),len(L))]
Z=[(a,b) for a,b in Z if a is not None and b is not None]
NTQ=re.compile(r'\b(Matthew|Mark|Luke|John|Acts|Romans|Hebrews|Revelation|Galatians|Corinthians)\s+\d+:\d+|\bQ\s?\d{1,3}:\d{1,3}|New Testament|Qurʾān|Talmud|Mishnah|Josephus|Qumran|Enoch|Jubilees|Targum')
hits=[(i+1,l[:90]) for i,l in enumerate(L) if NTQ.search(l) and not zone(i)]
# exclude Excursus XIII Septuagint apparatus and Appendix I correction stanza
hits=[(i,l) for i,l in hits if not re.search(r'Septuagint|1QIsa|EXCURSUS XIII',l)]
print("L3 unlicensed non-Hebrew-corpus lines in Vol II:",len(hits),hits[:6])
for i,l in hits: finding('limit',f'Vol II line {i}: non-Hebrew corpus reference outside the licensed zones: {l}','LOAD-BEARING','open the line','Vol II')
# ---- LIMIT L4: C3 independence
def sh(t,k=10):
    w=re.sub(r'\*+','',t).split(); return set(" ".join(w[i:i+k]) for i in range(0,len(w)-k,3))
S={k:sh(v) for k,v in V.items()}
for a,b in [('II','III'),('II','IV'),('III','IV')]:
    ov=len(S[a]&S[b])/min(len(S[a]),len(S[b]))*100; print(f"L4 overlap {a}/{b}: {ov:.3f}%")
    if ov>=0.2: finding('limit',f'{a}/{b} shingle overlap {ov:.2f}% at or above 0.2%','LOAD-BEARING','shingle','set')
# ---- SYMMETRY S1: the block's bridge terms
blk=re.search(r'## THE FOUR VOLUMES, AND WHY THERE ARE FOUR(.*?)\n---\n',V['II'],re.S).group(1)
if 'The geometry stands on its own ground' in blk:
    finding('symmetry','the block says "The geometry stands on its own ground"; Vol II and Vol III never use the term in their bodies, and Vol IV uses it once to name its structural apparatus while stating that Chapters 9 to 13 rest "on lexical distribution and citation rather than on geometry"; the term has no bridge in two volumes and a narrow one in the third','STRUCTURAL','grep "geometr" in each body','companion block, all three volumes')
if 'by the same instrument' in blk:
    inst={'II':'removab' in V['II'],'III':'removab' in V['III'],'IV':'removab' in V['IV']}
    finding('symmetry',f'the block says the three readings are made "by the same instrument"; the removability criterion that is Vol II\'s and Vol IV\'s instrument does not appear in Vol III (removability present: {inst}), whose instrument is the six evidence labels and the strength rule; what is shared is a discipline, not an instrument','STRUCTURAL','grep removability / strength rule per volume','companion block, all three volumes')
# ---- SYMMETRY S2: C4 naming invariance on this version
LISTED={"Adam","Nuh","Ibrahim","Ismāʿīl","Ishaq","Yaʿqub","Yusuf","Ayyub","Lut","Musa","Harun","Dawud","Sulayman","Ilyas","Elisha","Yunus","Zakariyya","Yahya","ʿĪsā","Maryam","Enoch","Idris"}
for vol,t in V.items():
    c=collections.Counter(re.findall(r'([A-Za-zʿʾĪīāūḥṣṭ\-]+)\s+AS\b',t))
    for k in ['USED','NOT','CITED','RECORDED','REPROACHES','SEAT','SEVENTH','TOMB','applies','carries','prophets','marks','it']: c.pop(k,None)
    un={k:v for k,v in c.items() if k not in LISTED}
    if vol=='II' and c: finding('symmetry',f'Vol II carries honorific marks {dict(c)} against its declared suspension','STRUCTURAL','grep',' Vol II')
    if vol!='II' and un: finding('symmetry',f'Vol {vol} marks unlisted names {un}','STRUCTURAL','grep','Vol '+vol)
    dmg=sorted(set(re.findall(r'\S*AS[a-z]+\S*',t)))
    if dmg: finding('symmetry',f'Vol {vol} glued tokens {dmg}','COSMETIC','grep','Vol '+vol)
# ---- SYMMETRY S3: C5 structure on this version
for vol,t,n in [('II',V['II'],166),('III',V['III'],97),('IV',V['IV'],104)]:
    body=[int(x) for x in re.findall(r'^#{1,3}\s*CHAPTER\s+(\d{1,3})\b',t,re.M)]
    toc=re.search(r'#\s*CONTENTS(.*?)(?=\n#\s)',t,re.S); tn=[int(x) for x in re.findall(r'^\s*(\d{1,3})\.\s',toc.group(1),re.M)]
    ha=set(re.findall(r'^#{1,3}\s*APPENDIX\s+([A-Z]{1,2})\b',t,re.M)); ra=set(re.findall(r'[Aa]ppendix\s+([A-Z]{1,2})\b',t))
    dang=sorted(ra-ha)+sorted(set(int(x) for x in re.findall(r'[Cc]hapter\s+(\d{1,3})\b(?! of that volume)',t))-set(body))
    if len(body)!=n or set(body)!=set(tn) or dang: finding('symmetry',f'Vol {vol}: chapters {len(body)}/{n}, TOC match {set(body)==set(tn)}, dangling {dang}','STRUCTURAL','recount','Vol '+vol)
print("\nFINDINGS:",len(F))
for i,f in enumerate(F,1): print(f"  P-{i} [{f['register']}] [{f['severity']}] {f['loc']}: {f['mechanism'][:250]} || falsifier: {f['falsifier'][:70]}")
json.dump(F,open('prosecution_r3.json','w'),indent=1)
