"""Consolidated prosecution · all six registers' instruments run; the round declares only the pair it prosecutes. Framework-blind."""
import re,json,sys,collections,subprocess,urllib.request
D=sys.argv[1]; ROUND=sys.argv[2]
V={k:open(f'{D}/{f}',encoding='utf-8').read() for k,f in [('II','Vol_II_The_Conceded_Throne.md'),('III','Vol_III_History_of_the_Messianic_Position.md'),('IV','Vol_IV_The_Office_of_the_Messiah.md')]}
RM=open(f'{D}/README.md',encoding='utf-8').read(); CL=open(f'{D}/CHANGELOG.md',encoding='utf-8').read()
F=[]
def finding(reg,mech,sev,fals,loc): F.append(dict(register=reg,mechanism=mech,severity=sev,falsifier=fals,loc=loc))
W={'one':1,'two':2,'three':3,'four':4,'five':5,'six':6,'seven':7,'eight':8,'nine':9,'ten':10}
# ---- generic ARITH: "requires N things:" followed by bold-enumerated items in the same sentence
for vol,t in V.items():
    for m in re.finditer(r'requires (\w+) things: ([^.]*)\.',t.replace('\n',' ')):
        n=W.get(m.group(1)); k=len(re.findall(r'\*\*[^*]+\*\*',m.group(2)))
        if n and k and n!=k: finding('limit',f'Vol {vol}: "requires {m.group(1)} things" enumerates {k} bold items in the sentence','COSMETIC','count the bold items','Vol '+vol)
    for m in re.finditer(r'\b(Two|Three|Four|Five|Six|Seven|Eight) designations\b',t):
        back=t[max(0,m.start()-700):m.start()]; items=re.findall(r'\*[^*\n]{2,40}\*, ',back); n=W[m.group(1).lower()]
        if items and abs(len(items)-n)>=2: finding('limit',f'Vol {vol}: "{m.group(0)}" after {len(items)} italic items','COSMETIC','count','Vol '+vol)
    for m in re.finditer(r'\*\*And (\d{1,2}):(\d{1,3}), (\w+) verses later\.\*\*',t):
        c2,v2,word=m.groups(); n=W.get(word); heads=re.findall(r'\*\*'+re.escape(c2)+r':(\d{1,3})(?:-(\d{1,3}))?,',t[max(0,m.start()-900):m.start()])
        if n and heads:
            v1,v1b=heads[-1]; lo=int(v1b or v1); hi=int(v2)
            if not (hi-int(v1)-1<=n<=hi-int(v1)+1 or hi-lo-1<=n<=hi-lo+1): finding('kinematic',f'Vol {vol}: "{c2}:{v2}, {word} verses later" after head {c2}:{v1}','COSMETIC','subtract','Vol '+vol)
    for m in re.finditer(r'### I\. (Seven|Nine|Eight|Six|Five|Four) signs',t):
        seg=t[m.end():m.end()+1500]; n=W[m.group(1).lower()]; enum=len(re.findall(r'the (wine|official|man at the pool|feeding|walking|man born blind|raising)',seg))
        if enum and abs(enum-n)>=2: finding('limit',f'Vol {vol}: "{m.group(0)}" over {enum} signs','COSMETIC','count','Vol '+vol)
for vol,t in V.items():
    for m in re.finditer(r'\b(two|three|four|five|six|seven|eight|nine|ten|eleven|twelve) (books|sites|passages|verses|chapters): ((?:[A-Z][\w ]+?)(?:, [A-Z][\w ]+?)*)\.',t,re.I):
        n={'two':2,'three':3,'four':4,'five':5,'six':6,'seven':7,'eight':8,'nine':9,'ten':10,'eleven':11,'twelve':12}[m.group(1).lower()]; k=len(m.group(3).split(', '))
        if k>=2 and n!=k: finding('limit',f'Vol {vol}: "{m.group(1)} {m.group(2)}" over an enumeration of {k}: {m.group(3)[:60]}','COSMETIC','count the list','Vol '+vol)
# ---- generic date arithmetic from the artifact's own printed datings (Vol III: Paul vs Mark)
t3=V['III']; mp=re.search(r'written between roughly (\d+) and (\d+) CE\*\*, which places them (\w+) to (\w+) years before Mark',t3); mk=re.search(r'Mark, roughly (\d+) to (\d+) CE',t3)
if mp and mk:
    W2={'five':5,'ten':10,'fifteen':15,'twenty':20,'twenty-five':25,'thirty':30,'forty':40,'fifty':50,'sixty':60}
    p1,p2=int(mp.group(1)),int(mp.group(2)); m1,m2=int(mk.group(1)),int(mk.group(2)); lo,hi=W2.get(mp.group(3)),W2.get(mp.group(4))
    if lo is not None and (lo>m2-p1+5 or hi<m1-p2-5 or lo>m1-p2+12): finding('kinematic',f'Vol III ch.61: Paul {p1}-{p2} CE said to be {mp.group(3)} to {mp.group(4)} years before Mark, which the same volume dates {m1}-{m2} CE; the gap is {max(0,m1-p2)} to {m2-p1} years','COSMETIC','subtract the volume\'s own dates','Vol III')
# ---- generic DRIFT class: a defined position identified with its occupant
for vol,t in V.items():
    for m in re.finditer(r'position[^.]{0,40}\bis (whoever|the person who|the man who) (currently )?(fills|holds|occupies)',t):
        finding('symmetry',f'Vol {vol}: the position is identified with its occupant: …{t[max(0,m.start()-40):m.end()+30].strip()}…, against the position/occupant distinction the set rests on','STRUCTURAL','read the definition','Vol '+vol)
# ---- generic DRIFT: the volumes' defined terms in incompatible senses
DRIFT=[('II',r'the sense in which this book uses the word position',"'position' is not a term Vol II defines as a conferral; the sentence equates a conferral (an act) with the position (a seat), two objects the volume keeps apart"),
       ('II',r'passage is at the terminus|terminus of the (book|scroll|chapter)',"'terminus' as the physical end of a text against its defined sense"),
       ('III',r'terminus of the (book|scroll|chapter|gospel)|passage is at the terminus',"'terminus' as the physical end of a text against its defined sense"),
       ('II',r'\bdeficit\b[^.]{0,80}\b(supplies no|no date|gap in the record|is that it)',"'deficit' as an informational gap against the receiver-side sense"),
       ('II',r'The concession here is [A-Z][a-z]+\'s, granting',"'concession' as a rhetorical admission against the monarchy-grant sense"),
       ('III',r'sets one instrument, an act of memory[^.]*which is the instrument this book uses',"'instrument' identifying the corpus's remedy with the book's apparatus")]
for vol,pat,mech in DRIFT:
    for m in re.finditer(pat,V[vol]): finding('symmetry',f'Vol {vol}: {mech}: …{V[vol][max(0,m.start()-60):m.end()+40].strip()}…','STRUCTURAL','read the definition','Vol '+vol)
# ---- generic SCOPE: proof/universal claims on surveyed or single-verse material
SCOPE=[r'\b(proves|disproves|disproved|proven) (that )?(in|for) (all|every|the whole)\b',r'Every [\w-]+ (doctrine|tradition|claimant|corpus|reader) that has ever existed',r'proves that in the Hebrew Bible every',r'the only trigger for regrowth anywhere in the corpus',r'No passage in the Hebrew Bible has[^.]*and none could',r'prove[s]? the thesis of this Book by themselves',r'neither was messianic in any sense',r'That is the whole of the Hebrew Bible\'s royal theology']
for vol,t in V.items():
    for pat in SCOPE:
        for m in re.finditer(pat,t): finding('limit',f'Vol {vol}: universal or proof claim on surveyed material: "{t[max(0,m.start()-50):m.end()+40].strip()}"','LOAD-BEARING','the passage\'s own scope','Vol '+vol)
# ---- generic verse-range check on named citations (table of chapter lengths for the books this set cites most)
VER={"2 Samuel":{2:32,5:25,7:29,19:44,22:51},"1 Samuel":{8:22,10:27,16:23},"Numbers":{22:41,23:30,24:25},"Psalm":{2:12,95:11,110:7,72:20},"Isaiah":{6:13,9:20,11:16,42:25,49:26,53:12},"Malachi":{3:24},"Daniel":{7:28},"Judges":{8:35},"1 Kings":{8:66},"Ezekiel":{34:31,37:28},"Jeremiah":{6:30,23:40}}
rxv=re.compile(r'\b('+"|".join(re.escape(b) for b in VER)+r')\s+(\d{1,3}):(\d{1,3})')
for vol,t in V.items():
    for m in rxv.finditer(t):
        b,ch,vs=m.group(1),int(m.group(2)),int(m.group(3))
        if ch in VER[b] and vs>VER[b][ch]: finding('kinematic',f'Vol {vol}: {m.group(0)} cites verse {vs}; {b} {ch} has {VER[b][ch]} verses','COSMETIC','open the chapter','Vol '+vol)
# ---- structure, naming, labels
LISTED={"Adam","Nuh","Ibrahim","Ismāʿīl","Ishaq","Yaʿqub","Yusuf","Ayyub","Lut","Musa","Harun","Dawud","Sulayman","Ilyas","Elisha","Yunus","Zakariyya","Yahya","ʿĪsā","Maryam","Enoch","Idris"}
for vol,t,n in [('II',V['II'],166),('III',V['III'],97),('IV',V['IV'],104)]:
    body=[int(x) for x in re.findall(r'^#{1,3}\s*CHAPTER\s+(\d{1,3})\b',t,re.M)]; toc=re.search(r'#\s*CONTENTS(.*?)(?=\n#\s)',t,re.S); tn=[int(x) for x in re.findall(r'^\s*(\d{1,3})\.\s',toc.group(1),re.M)]
    ha=set(re.findall(r'^#{1,3}\s*APPENDIX\s+([A-Z]{1,2})\b',t,re.M)); ra=set(re.findall(r'[Aa]ppendix\s+([A-Z]{1,2})\b',t))
    dang=sorted(ra-ha)+sorted(set(int(x) for x in re.findall(r'[Cc]hapter\s+(\d{1,3})\b(?! of that volume)',t))-set(body))
    if len(body)!=n or set(body)!=set(tn) or dang: finding('symmetry',f'Vol {vol}: chapters {len(body)}/{n}, TOC {set(body)==set(tn)}, dangling {dang}','STRUCTURAL','recount','Vol '+vol)
    c=collections.Counter(re.findall(r'([A-Za-zʿʾĪīāūḥṣṭ\-]+)\s+AS\b',t))
    for k in ['USED','NOT','CITED','RECORDED','REPROACHES','SEAT','SEVENTH','TOMB','applies','carries','prophets','marks','it']: c.pop(k,None)
    un={k:v for k,v in c.items() if k not in LISTED}
    if vol=='II' and c: finding('symmetry',f'Vol II carries marks {dict(c)}','STRUCTURAL','grep','Vol II')
    if vol!='II' and un: finding('symmetry',f'Vol {vol} marks unlisted {un}','STRUCTURAL','grep','Vol '+vol)
    if re.findall(r'\S*AS[a-z]+\S*',t): finding('symmetry',f'Vol {vol} glued tokens','COSMETIC','grep','Vol '+vol)
    if re.findall(r'((?:[A-Zʿ][\wʿʾĪīāū]+ AS)),?\s+\1\b',t): finding('definitional',f'Vol {vol} self-gloss doublet','STRUCTURAL','grep','Vol '+vol)
stray={k:v for k,v in collections.Counter(re.findall(r'\[([A-Z][a-z]+)(?=[\]\s;,:])',V['III'])).items() if k not in ('Documented','Attested','Reconstructed','Disputed','Circumstantial','Speculative') and v>=2}
if stray: finding('definitional',f'Vol III stray labels {stray}','COSMETIC','list','Vol III')
if re.search(r'\bMalachi\s+4:\d',V['IV']): finding('definitional','Vol IV Malachi 4:x','COSMETIC','versification','Vol IV')
# ---- single-corpus: CITATIONS of excluded corpora in Vol II chapters 1-166 (names in scope declarations are licensed)
cit=re.compile(r'\b(Matthew|Mark|Luke|John|Acts|Romans|Hebrews|Revelation|Galatians|1 Corinthians|1 Enoch|4 Ezra|2 Baruch|Jubilees|1QS|4Q|11Q|CD )\s*\d+[:.]\d+|\bQ\s?\d{1,3}:\d{1,3}|\b(b\.|m\.|y\.)\s?[A-Z][a-z]+\.? \d+[ab]?\b')
body2=V['II'][V['II'].find('## CHAPTER 1 ·'):V['II'].find('## APPENDIX A')]
hits=[body2[max(0,m.start()-40):m.end()+20].replace("\n"," ") for m in cit.finditer(body2)]
if hits: finding('limit',f'Vol II chapters carry {len(hits)} excluded-corpus citations: {hits[:3]}','LOAD-BEARING','open','Vol II')
# ---- C6 components present; ch.164 pointer; Vol III closing names no occupant; Vol IV terminal form held open
for vol,t in V.items():
    body=t.split('# CONTENTS',1)[1]
    for c,pats in {'unentered':[r'not entered|never entered|un-?entered|failure of entry'],'receiver':[r'at the receiver|at reception|failure of reception|receiver-side'],'escalation':[r'escalat'],'grammar':[r'passive|the subject is God|God as subject|divine subject|conferral|conferred']}.items():
        if sum(len(re.findall(p,body,re.I)) for p in pats)<3: finding('limit',f'Vol {vol}: component {c} under 3 hits','LOAD-BEARING','grep','Vol '+vol)
if not re.search(r'^## CHAPTER 164 · The Limit Case · What Would Fall If the Figure Arrived',V['II'],re.M): finding('limit','ch.164 pointer','STRUCTURAL','read','block')
if 'This book does not name the occupant of the position' not in V['III']: finding('limit','Vol III closing no-name absent','STRUCTURAL','read','Vol III')
if 'is **held open**, and holding open is a verdict' not in V['IV']: finding('limit','Vol IV held-open verdict absent','STRUCTURAL','read','Vol IV')
# ---- discipline sentence's three rules, per volume (the named target)
blk=re.search(r'## THE FOUR VOLUMES, AND WHY THERE ARE FOUR(.*?)\n---\n',V['II'],re.S).group(1)
for rule,pats in {'inside itself':[r'from inside itself|on its own terms|read against the Hebrew scriptures before|scripture-internal'],'reader can check':[r'reader can check|check(able|ed) by a reader|a verse a reader can check'],'falsifiers before evidence':[r'[Ff]alsifi']}.items():
    for vol,t in V.items():
        n=sum(len(re.findall(p,t)) for p in pats)
        if n==0: finding('symmetry',f'block\'s shared rule "{rule}" absent from Vol {vol}','STRUCTURAL','grep','block')
for vol,t in V.items():
    first=min(m.start() for m in re.finditer(r'[Ff]alsifi',t.split('# CONTENTS',1)[1])); 
    if first>len(t)*0.25: finding('symmetry',f'Vol {vol}: first falsifier statement at {first/len(t):.0%} of the file, not before the evidence','STRUCTURAL','locate','Vol '+vol)
# ---- geometry / instrument phrasing on the block
if 'The geometry stands on its own ground' in blk or 'by the same instrument' in blk or 'carrying its grade' in blk or 'are deposited as a set' in blk or 'without having been made to' in blk: finding('symmetry','a repaired block phrase is live again','STRUCTURAL','grep','block')
# ---- weights under the stated family vs printed ranges
HB=["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","1 Samuel","2 Samuel","1 Kings","2 Kings","Isaiah","Jeremiah","Ezekiel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi","Psalms","Psalm","Proverbs","Job","Ruth","Lamentations","Ecclesiastes","Esther","Daniel","Ezra","Nehemiah","1 Chronicles","2 Chronicles","Ps","1 Chr","2 Chr","Deut","Gen","Exod","Lev","Num","Josh","Judg","1 Sam","2 Sam","1 Kgs","2 Kgs","Isa","Jer","Ezek","Hos","Zech","Mal","Dan","Mic"]
NT=["Matthew","Mark","Luke","John","Acts","Romans","Hebrews","Revelation","1 Corinthians","Galatians","Philippians","Colossians","Matt","Mk","Lk","Jn","Rom","Heb","Rev"]
def weights(t,abbr=True,bare='nearest'):
    hb=[b for b in HB if abbr or len(b)>3]; nt=[b for b in NT if abbr or len(b)>3]; ALL=sorted(hb+nt,key=len,reverse=True)
    rx=re.compile(r'(?<!\d )\b('+"|".join(re.escape(b) for b in ALL)+r')\.?\s+(\d{1,3}):(\d{1,3})'); q=re.compile(r'\bQ\s?(\d{1,3}):(\d{1,3})'); br=re.compile(r'(?<![\w:\d/.])(\d{1,3}):(\d{1,3})(?![\d:])')
    ev=sorted([(m.start(),'HB' if m.group(1) in hb else 'NT') for m in rx.finditer(t)]+[(m.start(),'Q') for m in q.finditer(t)]); spans=[(m.start(),m.end()) for m in rx.finditer(t)]+[(m.start(),m.end()) for m in q.finditer(t)]
    chs=[0]+[m.start() for m in re.finditer(r'^#{1,3}\s*CHAPTER\s+\d',t,re.M)]+[len(t)]; chap=lambda i:max(k for k,c in enumerate(chs) if c<=i)
    dom=collections.defaultdict(collections.Counter); [dom[chap(i)].update([c]) for i,c in ev]
    cnt=collections.Counter(c for _,c in ev)
    if bare:
        for m in br.finditer(t):
            if any(s<=m.start()<e for s,e in spans): continue
            prev=[c for i,c in ev if i<m.start()]
            if bare=='nearest' and prev: cnt[prev[-1]]+=1
            elif bare=='dominant': d=dom[chap(m.start())]; cnt[d.most_common(1)[0][0] if d else (prev[-1] if prev else 'HB')]+=1
    tot=sum(cnt.values()); return {k:cnt[k]/tot*100 for k in ('HB','NT','Q')}
RANGES={'II':((100,100),(0,0),(0,0)),'III':((59,63),(25,27),(11,14)),'IV':((48,57),(7,13),(31,43))}
for vol,t in V.items():
    for abbr,bare in [(False,None),(True,None),(True,'nearest'),(True,'dominant')]:
        w=weights(t,abbr,bare)
        for key,(lo,hi) in zip(('HB','NT','Q'),RANGES[vol]):
            if not (lo-0.5<=w[key]<=hi+0.5): finding('kinematic',f'Vol {vol} {key} {w[key]:.1f}% under instrument abbr={abbr} bare={bare} outside printed {lo}-{hi}','STRUCTURAL','recount','block')
# ---- overlap figures (exhaustive instrument) vs CHANGELOG
def bodyf(t):
    t=re.sub(r'## THE FOUR VOLUMES, AND WHY THERE ARE FOUR.*?\n---\n','',t,flags=re.S); return re.sub(r'# AUTHOR DISCLOSURE.*$','',t,flags=re.S)
def sh(t,k=10):
    w=re.sub(r'\*+','',t).split(); return set(" ".join(w[i:i+k]) for i in range(0,len(w)-k+1))
B={k:sh(bodyf(v)) for k,v in V.items()}; A={k:sh(v) for k,v in V.items()}
ob=[len(B[a]&B[b])/min(len(B[a]),len(B[b]))*100 for a,b in [('II','III'),('II','IV'),('III','IV')]]; oa=[len(A[a]&A[b])/min(len(A[a]),len(A[b]))*100 for a,b in [('II','III'),('II','IV'),('III','IV')]]
print(f"overlap exhaustive: bodies {min(ob):.2f}-{max(ob):.2f}  whole {min(oa):.2f}-{max(oa):.2f}")
if not (0.30<=min(ob)<=0.38 and 0.56<=max(ob)<=0.64 and 1.32<=min(oa)<=1.40 and 1.71<=max(oa)<=1.79): finding('limit',f'CHANGELOG prints 0.34-0.60 / 1.36-1.75; re-executed {min(ob):.2f}-{max(ob):.2f} / {min(oa):.2f}-{max(oa):.2f}','STRUCTURAL','recompute','CHANGELOG')
if min(ob)>=2.0: finding('limit','independence threshold breached','LOAD-BEARING','shingle','set')
# ---- live DOI
try:
    d=json.load(urllib.request.urlopen("https://zenodo.org/api/records/22243674",timeout=20))
    if d.get('doi')!="10.5281/zenodo.22243674" or d.get('conceptdoi')!="10.5281/zenodo.22243673" or d['metadata']['license']['id']!='cc-by-4.0': finding('provenance','DOI/licence mismatch with live record','STRUCTURAL','API','block')
except Exception as e: print("zenodo fetch failed:",e)
print("\nFINDINGS:",len(F))
for i,f in enumerate(F,1): print(f"  P-{i} [{f['register']}] [{f['severity']}] {f['loc']}: {f['mechanism'][:250]}")
json.dump(F,open(f'prosecution_{ROUND}.json','w'),indent=1)
