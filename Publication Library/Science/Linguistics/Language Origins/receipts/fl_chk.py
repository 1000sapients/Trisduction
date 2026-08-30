# FL-CHK · the floor ladder battery on PHOIBLE · seed 20260622 · stdlib + numpy
import csv, collections, numpy as np, math, hashlib, sys
csv.field_size_limit(10**9)
inv=collections.defaultdict(lambda: collections.Counter()); segs=collections.defaultdict(set); langs={}
with open('phoible.csv',encoding='utf-8') as f:
    r=csv.DictReader(f)
    for row in r:
        i=row['InventoryID']; inv[i][row['SegmentClass']]+=1; segs[i].add(row['Phoneme']); langs[i]=row['Glottocode']
N=len(inv); print("inventories:", N, "distinct glottocodes:", len(set(langs.values())))
C=np.array([inv[i]['consonant'] for i in inv],float); V=np.array([inv[i]['vowel'] for i in inv],float); T=np.array([inv[i]['tone'] for i in inv],float)
print(f"consonant count median {np.median(C):.0f} mean {C.mean():.1f}; vowel median {np.median(V):.0f} mean {V.mean():.1f}; tonal inventories {int((T>0).sum())} ({100*(T>0).mean():.1f}%), tone count mean among tonal {T[T>0].mean():.2f}")
def qmul(a,b):
    w1,x1,y1,z1=a; w2,x2,y2,z2=b
    return np.array([w1*w2-x1*x2-y1*y2-z1*z2, w1*x2+x1*w2+y1*z2-z1*y2, w1*y2-x1*z2+y1*w2+z1*x2, w1*z2+x1*y2-y1*x2+z1*w2])
def kernel(M):
    M=np.asarray(M,float); n=M.shape[1]; u=np.finfo(float).eps; eps=100*u*n
    Mn=M-M.mean(1,keepdims=True); sd=Mn.std(1,ddof=1,keepdims=True)
    if np.any(sd==0): return '[?]',None,None,None,None
    Mn/=sd; Q=Mn/np.sqrt((Mn*Mn).sum(1,keepdims=True)); R=Q@Q.T; detR=float(np.linalg.det(R)); kap=float(np.linalg.cond(R))
    B=np.linalg.qr(Q.T)[0][:, :3]; co=Q@B; q=[np.concatenate(([0.0],c)) for c in co]; lam=float(qmul(qmul(q[0],q[1]),q[2])[0])
    gate=min(1e6,(27/(100*u*n))**0.5); tok='[X]' if detR<=eps else '[?]' if kap>=gate else '[LOCK]'
    return tok,lam,detR,kap,R
M=np.vstack([C,V,T]); tok,lam,detR,kap,R=kernel(M); n=M.shape[1]; u=np.finfo(float).eps
a,b,c=R[0]; d,e,f=R[1]; g,h,i=R[2]
ests=[detR,float(np.prod(np.linalg.eigvalsh(R))),float(np.prod(np.diag(np.linalg.cholesky(R)))**2),float(a*(e*i-f*h)-b*(d*i-f*g)+c*(d*h-e*g))]
print(f"\nFL-CHK.1 three generators across {n} inventories: {tok} lambda={lam:.12f} det(R)={detR:.12f} |lam^2-det|={abs(lam*lam-detR):.3e} spread={max(ests)-min(ests):.3e} kappa={kap:.4f} gate={min(1e6,(27/(100*u*n))**0.5):.3e}")
print(f"  r(C,V)={R[0,1]:+.4f} r(C,T)={R[0,2]:+.4f} r(V,T)={R[1,2]:+.4f}; collapse margin {math.log10(detR/(100*u*n)):.2f} orders; conditioning margin {math.log10(min(1e6,(27/(100*u*n))**0.5)/kap):.2f} orders")
Mn=M-M.mean(1,keepdims=True); Mn/=Mn.std(1,ddof=1,keepdims=True); Q=Mn/np.sqrt((Mn*Mn).sum(1,keepdims=True)); B=np.linalg.qr(Q.T)[0][:, :3]
def lamf(Qx): co=Qx@B; q=[np.concatenate(([0.0],c)) for c in co]; return float(qmul(qmul(q[0],q[1]),q[2])[0]), float(np.linalg.det(Qx@Qx.T))
l0,d0=lamf(Q); Q2=Q.copy(); Q2[2]=-Q2[2]; l2,d2=lamf(Q2)
print(f"FL-CHK.2 reflection of the tone row on the fixed basis: lambda ratio {l2/l0:+.6f}, |ddet| = {abs(d0-d2):.3e}")
rg=np.random.default_rng(20260622); ok=agree=0
for _ in range(1000):
    idx=rg.integers(0,n,n); t=kernel(M[:,idx])[0]
    if t!='[?]': ok+=1; agree+=(t==tok)
print(f"FL-CHK.3 bootstrap 1000: agreement {agree/ok:.3f} on {ok} valid")
# language-level dedupe: one inventory per glottocode (first), re-run
seen={}; keep=[]
for k,i in enumerate(inv):
    if langs[i] not in seen: seen[langs[i]]=1; keep.append(k)
Md=M[:,keep]; tokd,lamd,detd,kapd,Rd=kernel(Md)
print(f"FL-CHK.4 one inventory per glottocode, {Md.shape[1]} languages: {tokd} det(R)={detd:.6f} kappa={kapd:.4f} r(C,V)={Rd[0,1]:+.4f} r(C,T)={Rd[0,2]:+.4f} r(V,T)={Rd[1,2]:+.4f}")
# FL-CHK.5 the vowel corners and the quantal core
def frac(sym): return 100*sum(1 for i in inv if sym in segs[i])/N
print(f"FL-CHK.5 prevalence across inventories: i {frac('i'):.1f}%  u {frac('u'):.1f}%  a {frac('a'):.1f}%  (ɑ {frac('ɑ'):.1f}%)  all three of i,u,a {100*sum(1 for i in inv if {'i','u','a'}<=segs[i])/N:.1f}%  i,u and a-or-ɑ {100*sum(1 for i in inv if {'i','u'}<=segs[i] and ({'a'}<=segs[i] or {'ɑ'}<=segs[i]))/N:.1f}%")
core=['m','n','k','p','t','s','j','w','l','ŋ','b','d','ɡ','h','ʔ']
print("  consonant core prevalence:", ", ".join(f"{s} {frac(s):.0f}%" for s in core))
# FL-CHK.6 place lattice: fraction of inventories with at least one labial, coronal, dorsal, laryngeal consonant, from feature columns
have=collections.defaultdict(set)
with open('phoible.csv',encoding='utf-8') as f:
    r=csv.DictReader(f)
    for row in r:
        if row['SegmentClass']!='consonant': continue
        i=row['InventoryID']
        if row['labial']=='+': have[i].add('labial')
        if row['coronal']=='+': have[i].add('coronal')
        if row['dorsal']=='+': have[i].add('dorsal')
        if row['Phoneme'] in ('ʔ','h','ɦ','ħ','ʕ'): have[i].add('laryngeal')
print("FL-CHK.6 place-class presence:", ", ".join(f"{p} {100*sum(1 for i in inv if p in have[i])/N:.1f}%" for p in ['labial','coronal','dorsal','laryngeal']), f"; all four {100*sum(1 for i in inv if {'labial','coronal','dorsal','laryngeal'}<=have[i])/N:.1f}%")
sha=hashlib.sha256(open('phoible.csv','rb').read()).hexdigest()[:16]; print("phoible.csv sha256[:16]", sha)
rec=hashlib.sha256(f"{N}|{detR:.12f}|{lam:.12f}|{detd:.6f}".encode()).hexdigest()[:16]; print("receipt", rec)
