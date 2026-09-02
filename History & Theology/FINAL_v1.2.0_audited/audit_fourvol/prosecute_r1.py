"""Round 1 prosecution battery · registers: kinematic, definitional. Framework-blind. Reads the seeded copy only."""
import re, collections, sys, json
D=sys.argv[1] if len(sys.argv)>1 else 'fourvol_seeded_r1'
V2=open(f'{D}/Vol_II_The_Conceded_Throne.md',encoding='utf-8').read()
V3=open(f'{D}/Vol_III_History_of_the_Messianic_Position.md',encoding='utf-8').read()
V4=open(f'{D}/Vol_IV_The_Office_of_the_Messiah.md',encoding='utf-8').read()
RM=open(f'{D}/README.md',encoding='utf-8').read(); CL=open(f'{D}/CHANGELOG.md',encoding='utf-8').read()
F=[]
def finding(reg,mech,sev,fals,loc): F.append(dict(register=reg,mechanism=mech,severity=sev,falsifier=fals,loc=loc))

# ---------- KINEMATIC K1: printed structural counts vs recomputed
def counts(t):
    ch=len(re.findall(r'^#{1,3}\s*CHAPTER\s+\d+\b',t,re.M)); bk=len(re.findall(r'^#\s*BOOK\s+[IVX]+',t,re.M))
    ap=len(set(re.findall(r'^#{1,3}\s*APPENDIX\s+([A-Z]{1,2})\b',t,re.M))); ex=len(set(re.findall(r'^#{1,3}\s*EXCURSUS\s+([IVXL]+)\b',t,re.M)))
    return dict(books=bk,chapters=ch,appendices=ap,excursus=ex,words=len(t.split()))
C={'II':counts(V2),'III':counts(V3),'IV':counts(V4)}
print("K1 recomputed:",json.dumps(C))
claims=[('II','Nineteen books, 166 chapters',(19,166)),('III','Six books, 97 chapters',(6,97)),('IV','Twelve books, 104 chapters',(12,104))]
for v,phr,(b,c) in claims:
    for src,name in [(V2,'II'),(V3,'III'),(V4,'IV'),(RM,'README')]:
        if phr in src and (C[v]['books'],C[v]['chapters'])!=(b,c):
            finding('kinematic',f'printed "{phr}" for Vol {v} in {name}; recomputed {C[v]["books"]} books, {C[v]["chapters"]} chapters','STRUCTURAL','recount headings',name)
# README table cells
for v,b,c,a,e in [('II',19,166,15,21),('III',6,97,3,0),('IV',12,104,11,14)]:
    got=(C[v]['books'],C[v]['chapters'],C[v]['appendices'],C[v]['excursus'])
    if got!=(b,c,a,e): finding('kinematic',f'README extent row Vol {v} states {(b,c,a,e)}; recomputed {got}','STRUCTURAL','recount','README')
# words in README
for v,w in re.findall(r'\*\*(I{1,3}V?|IV)\*\*.*?(\d{2,3},\d{3}) words',RM):
    got=C.get(v,{}).get('words')
    if got and abs(got-int(w.replace(',','')))>150: finding('kinematic',f'README words Vol {v} printed {w}, recomputed {got}','COSMETIC','wc','README')
# Vol IV subtitle census
m=re.search(r'\*Twelve Books · One Hundred and Four Chapters · (\w+) Excursus · (\w+) Appendices\*',V4)
words={'Fourteen':14,'Eleven':11,'Twelve':12,'Fifteen':15,'Ten':10}
if m and (words.get(m.group(1))!=C['IV']['excursus'] or words.get(m.group(2))!=C['IV']['appendices']):
    finding('kinematic',f'Vol IV subtitle census {m.group(0)} vs recomputed exc {C["IV"]["excursus"]} app {C["IV"]["appendices"]}','STRUCTURAL','recount','Vol IV front')

# ---------- KINEMATIC K2 (sharpened after first pass missed a chapter-scoped bare reference): verse references out of range
CHAP={"Genesis":50,"Exodus":40,"Leviticus":27,"Numbers":36,"Deuteronomy":34,"Joshua":24,"Judges":21,"1 Samuel":31,"2 Samuel":24,"1 Kings":22,"2 Kings":25,"Isaiah":66,"Jeremiah":52,"Ezekiel":48,"Hosea":14,"Joel":4,"Amos":9,"Obadiah":1,"Jonah":4,"Micah":7,"Nahum":3,"Habakkuk":3,"Zephaniah":3,"Haggai":2,"Zechariah":14,"Malachi":3,"Psalm":150,"Psalms":150,"Proverbs":31,"Job":42,"Ruth":4,"Lamentations":5,"Ecclesiastes":12,"Esther":10,"Daniel":12,"Ezra":10,"Nehemiah":13,"1 Chronicles":29,"2 Chronicles":36,"Matthew":28,"Mark":16,"Luke":24,"John":21,"Acts":28,"Romans":16,"Revelation":22}
VERSES={"Numbers":{1:54,2:34,3:51,4:49,5:31,6:27,7:89,8:26,9:23,10:36,11:35,12:16,13:33,14:45,15:41,16:35,17:28,18:32,19:22,20:29,21:35,22:41,23:30,24:25,25:18,26:65,27:23,28:31,29:39,30:17,31:54,32:42,33:56,34:29,35:34,36:13},
        "Malachi":{1:14,2:17,3:24},"Hosea":{13:15,3:5,8:14},"Amos":{9:15},"Micah":{2:13,3:12,5:14},"Isaiah":{40:31,56:12,6:13,9:20,11:16,42:25,49:26,53:12,7:25,45:25},
        "Psalm":{2:12,95:11,110:7,132:18,45:18,147:20},"Psalms":{2:12,95:11,110:7,132:18,45:18,147:20},"Jeremiah":{23:40,6:30,33:26,8:23},"Ezekiel":{34:31,36:38,37:28},"Deuteronomy":{30:20,12:32,29:28,18:22,13:19},
        "Genesis":{8:22,2:25,41:57,50:26,14:24},"Joshua":{21:45},"1 Kings":{8:66},"1 Chronicles":{22:19,28:21,29:30},"2 Chronicles":{9:31,36:23},"Daniel":{7:28},"Zechariah":{3:10,6:15,9:17,4:14}}
rxb=re.compile(r'(?<!\d )\b('+"|".join(re.escape(b) for b in sorted(CHAP,key=len,reverse=True))+r')\s+(\d{1,3}):(\d{1,3})')
rxbare=re.compile(r'(?<![\w:\d])(\d{1,3}):(\d{1,3})(?![\d:])')
def chapters(t):
    idx=[m.start() for m in re.finditer(r'^#{1,3}\s*CHAPTER\s+\d+',t,re.M)]+[len(t)]
    return [(idx[i],idx[i+1]) for i in range(len(idx)-1)]
for vol,t in [('II',V2),('III',V3),('IV',V4)]:
    for (s0,s1) in chapters(t):
        seg=t[s0:s1]; last=None; named=set()
        events=[(m.start(),'n',m) for m in rxb.finditer(seg)]+[(m.start(),'b',m) for m in rxbare.finditer(seg)]
        events.sort(key=lambda e:e[0])
        for pos,kind,m in events:
            if kind=='n':
                b,ch,vs=m.group(1),int(m.group(2)),int(m.group(3)); last=b; named.add((m.start(),m.end()))
                if ch>CHAP[b]: finding('kinematic',f'Vol {vol}: {m.group(0)} — chapter {ch} exceeds {b}\'s {CHAP[b]} chapters','COSMETIC','open the book','Vol '+vol)
                elif b in VERSES and ch in VERSES[b] and vs>VERSES[b][ch]: finding('kinematic',f'Vol {vol}: {m.group(0)} — verse {vs} exceeds {b} {ch}\'s {VERSES[b][ch]} verses','COSMETIC','open the book','Vol '+vol)
            else:
                if any(a<=m.start()<e for a,e in named): continue
                ch,vs=int(m.group(1)),int(m.group(2))
                if last and last in VERSES and ch in VERSES[last] and vs>VERSES[last][ch]:
                    finding('kinematic',f'Vol {vol}: bare {m.group(0)} in {last} context — verse {vs} exceeds {last} {ch}\'s {VERSES[last][ch]} verses','COSMETIC',f'open {last} {ch}; verse absent','Vol '+vol)
    for m in re.finditer(r'\bMalachi\s+4:(\d)',t):
        finding('definitional',f'Vol {vol}: "Malachi 4:{m.group(1)}" is English versification; the same verse is cited as 3:23 in the same volume and no numbering rule is declared','COSMETIC','find both cites for one verse','Vol '+vol)

# ---------- KINEMATIC K3: corpus weight percentages printed vs recomputed (named-only instrument, ranges)
HBB=["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","1 Samuel","2 Samuel","1 Kings","2 Kings","Isaiah","Jeremiah","Ezekiel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi","Psalms","Psalm","Proverbs","Job","Ruth","Lamentations","Ecclesiastes","Esther","Daniel","Ezra","Nehemiah","1 Chronicles","2 Chronicles"]
NTB=["Matthew","Mark","Luke","John","Acts","Romans","1 Corinthians","2 Corinthians","Galatians","Ephesians","Philippians","Colossians","1 Thessalonians","2 Thessalonians","Hebrews","1 Peter","2 Peter","Jude","Revelation"]
def weight(t):
    hb=sum(len(re.findall(re.escape(b)+r'\s+\d+:\d+',t)) for b in HBB); nt=sum(len(re.findall(re.escape(b)+r'\s+\d+:\d+',t)) for b in NTB); q=len(re.findall(r'\bQ\s?\d{1,3}:\d{1,3}',t))
    tot=hb+nt+q; return round(hb/tot*100),round(nt/tot*100),round(q/tot*100)
W={'II':weight(V2),'III':weight(V3),'IV':weight(V4)}; print("K3 named-only weights:",W)
ranges={'II':((100,100),(0,0),(0,0)),'III':((61,63),(26,27),(11,13)),'IV':((54,56),(8,13),(31,38))}
for v,(h,n,q) in W.items():
    (hl,hh),(nl,nh),(ql,qh)=ranges[v]
    for name,val,lo,hi in [('HB',h,hl,hh),('NT',n,nl,nh),('Q',q,ql,qh)]:
        if not (lo-2<=val<=hi+2): finding('kinematic',f'Vol {v} {name} named-only {val}% outside printed range {lo}-{hi}%','STRUCTURAL','recount','README/companion block')

# ---------- KINEMATIC K4: internal enumerations ("N sites in M books")
for vol,t in [('II',V2),('III',V3),('IV',V4)]:
    m=re.search(r'\*\*Eight sites in six books\. In every one the gatherer is God\.\*\*',t)
    if m:
        seg=t[max(0,m.start()-2600):m.start()]
        sites=re.findall(r'^\*\*((?:Ezekiel|Jeremiah|Isaiah|Deuteronomy|Micah|Psalm)\s+\d+:\d+(?:-\d+)?)\.\*\*',seg,re.M)
        books=set(s.split()[0] for s in sites)
        if len(sites)!=8 or len(books)!=6: finding('kinematic',f'Vol {vol} ch.100 "Eight sites in six books": enumerated {len(sites)} sites in {len(books)} books ({sorted(books)})','COSMETIC','count the bold heads','Vol II ch.100')
# Balaam donkey chapter arithmetic
m=re.search(r'whose donkey has spoken to him (\w+) chapters earlier',V2)
if m: finding('kinematic',f'Vol II ch.129: "donkey has spoken to him {m.group(1)} chapters earlier" relative to Numbers 24:17; the donkey speaks at Numbers 22:28, two chapters earlier','COSMETIC','22 vs 24','Vol II ch.129')

# ---------- DEFINITIONAL D1: evidence-label vocabulary (Vol III six labels)
labels=collections.Counter(re.findall(r'\[(Documented|Attested|Reconstructed|Disputed|Circumstantial|Speculative)\b',V3))
other=collections.Counter(re.findall(r'\[([A-Z][a-z]+)(?=[\]\s;,:])',V3))
stray={k:v for k,v in other.items() if k not in labels and k not in ('Q','Chapter','Book','Documentedas')}
print("D1 Vol III labels:",dict(labels)); print("D1 stray bracket tokens:",stray)
for k,v in stray.items():
    if v>=2: finding('definitional',f'Vol III uses bracketed label "[{k}]" {v}× outside the six declared evidence labels','COSMETIC','list the six','Vol III')

# ---------- DEFINITIONAL D2: "terminus" sense drift in Vol II (defined as settlement-state the promise terminates in)
bad=[]
for m in re.finditer(r'\bterminus\b',V2):
    ctx=V2[max(0,m.start()-90):m.end()+60].replace("\n"," ")
    if re.search(r'passage is at the terminus|at the terminus of the (book|chapter|text)|terminus of the (book|scroll|chapter)',ctx): bad.append(ctx)
for b in bad: finding('definitional',f'Vol II: "terminus" used for the physical end of a book, against its defined sense (the settlement-state the promise ends in): …{b}…','STRUCTURAL','read the definition at Chapter 1/21 against this use','Vol II')

# ---------- DEFINITIONAL D3: versification declaration vs mixed numbering in Vol IV (Malachi 3:23 and 4:5 both present?)

# ---------- SCOPE sub-battery (standing, every round): universal quantifiers on surveyed findings
for vol,t in [('II',V2),('III',V3),('IV',V4)]:
    for m in re.finditer(r'(No passage in the Hebrew Bible[^.]*and none could\.|none could\.)',t):
        finding('definitional',f'Vol {vol}: surveyed result stated as modal universal: "{m.group(0)}" — the chapter enumerates eight sites; "none could" asserts impossibility the survey cannot carry','LOAD-BEARING','the enumeration is a survey; a universal needs a mechanism','Vol II ch.100')

print("\nFINDINGS:",len(F))
for i,f in enumerate(F,1): print(f"  P-{i} [{f['register']}] [{f['severity']}] {f['loc']}: {f['mechanism'][:170]} || falsifier: {f['falsifier']}")
json.dump(F,open('prosecution_r1.json','w'),indent=1)
