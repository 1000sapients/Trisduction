# QR-CHK · Quranic root inventory from the public morphology corpus (Quranic Arabic Corpus data, mirrored at
# github.com/mustafa0x/quran-morphology), type-level statistics, stdlib only, exact.
import re, math, collections, hashlib
lines=open('qm.txt',encoding='utf-8').read().splitlines()
roots=collections.Counter()
for l in lines:
    m=re.search(r'ROOT:([^|\t]+)', l)
    if m: roots[m.group(1)]+=1
norm=lambda r: ''.join({'إ':'أ','آ':'أ','ء':'أ','ا':'أ','ٱ':'أ','ى':'ي'}.get(c,c) for c in r)
types=collections.Counter()
for r,c in roots.items(): types[norm(r)]+=c
print("root-bearing tokens:", sum(roots.values()), " distinct roots (normalized):", len(types))
bylen=collections.Counter(len(r) for r in types)
print("root length distribution (types):", dict(sorted(bylen.items())))
tri=[r for r in types if len(r)==3]
weak=set('أوي'); 
w=[r for r in tri if any(c in weak for c in r)]; gem=[r for r in tri if r[1]==r[2] and r[1] not in weak]
print(f"triliteral types {len(tri)}: weak-radical {len(w)} ({100*len(w)/len(tri):.1f}%), geminate {len(gem)} ({100*len(gem)/len(tri):.1f}%), sound and non-geminate {len(tri)-len(w)-len(gem)} ({100*(len(tri)-len(w)-len(gem))/len(tri):.1f}%)")
def H(counter):
    n=sum(counter.values()); return -sum(c/n*math.log2(c/n) for c in counter.values())
def Hcond(pairs):   # H(Y|X) from (x,y) pairs
    joint=collections.Counter(pairs); marg=collections.Counter(x for x,_ in pairs); n=len(pairs)
    return -sum(c/n*math.log2(c/marg[x]) for (x,_),c in joint.items())
print(f"H(C1) = {H(collections.Counter(r[0] for r in tri)):.3f} bits; H(C2|C1) = {Hcond([(r[0],r[1]) for r in tri]):.3f}; H(C3|C1,C2) = {Hcond([(r[:2],r[2]) for r in tri]):.3f} bits (uniform bound log2 27 = {math.log2(27):.3f})")
# number of distinct (C1,C2) pairs and the mean number of C3 continuations per pair
pairs=collections.defaultdict(set)
for r in tri: pairs[r[:2]].add(r[2])
print(f"distinct C1C2 pairs {len(pairs)}; mean C3 continuations per pair {sum(len(v) for v in pairs.values())/len(pairs):.2f}; max {max(len(v) for v in pairs.values())}")
# homorganic adjacency, declared coarse place partition
place={'labial':'بفمو','coronal':'تثدذطظرزسشصضلن','palatal':'جي','dorsal':'كقغخ','guttural':'عحهأ'}
cls={c:k for k,v in place.items() for c in v}
adj=[(r[0],r[1]) for r in tri]+[(r[1],r[2]) for r in tri]
obs=sum(1 for a,b in adj if cls.get(a)==cls.get(b))
# expected under independence of the two positions, from the marginals of the same pairs
from itertools import product
ma=collections.Counter(a for a,_ in adj); mb=collections.Counter(b for _,b in adj); n=len(adj)
exp=sum(ma[a]*mb[b]/n for a,b in product(ma,mb) if cls.get(a)==cls.get(b))
print(f"homorganic adjacent pairs among {n} adjacencies: observed {obs}, expected under independence {exp:.1f}, O/E = {obs/exp:.3f}")
# same-consonant adjacency (identity) C1=C2 and C2=C3 separately
print("C1=C2 identical:", sum(1 for r in tri if r[0]==r[1]), " C2=C3 identical (geminate incl. weak):", sum(1 for r in tri if r[1]==r[2]))
# least sufficient length under OCP-Place with this partition: count skeletons with no same-class adjacency
inv=[c for v in place.values() for c in v]; sizes=collections.Counter(cls[c] for c in inv)
adm2=sum(1 for a in inv for b in inv if cls[a]!=cls[b]); adm3=sum(1 for a in inv for b in inv if cls[a]!=cls[b] for c in inv if cls[b]!=cls[c])
print(f"inventory {len(inv)} consonants in {len(place)} place classes {dict(sizes)}; admissible skeletons under OCP-Place: k=2 {adm2}, k=3 {adm3}; distinct Quranic roots {len(types)} -> least sufficient k = {2 if adm2>=len(types) else 3}")
rec=hashlib.sha256(f"{len(types)}|{dict(sorted(bylen.items()))}|{len(w)}|{len(gem)}|{obs}|{adm2}|{adm3}".encode()).hexdigest()[:16]
print("receipt sha256[:16] =", rec)
