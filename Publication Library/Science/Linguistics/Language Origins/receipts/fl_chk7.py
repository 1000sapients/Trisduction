import csv, collections, numpy as np, hashlib, math
csv.field_size_limit(10**9)
fam={}
with open('glottolog_languages.csv',encoding='utf-8') as f:
    for row in csv.DictReader(f):
        fam[row.get('Glottocode') or row.get('ID')]= (row.get('Family_ID') or '') 
inv=collections.defaultdict(collections.Counter); glot={}
with open('phoible.csv',encoding='utf-8') as f:
    for row in csv.DictReader(f):
        inv[row['InventoryID']][row['SegmentClass']]+=1; glot[row['InventoryID']]=row['Glottocode']
ids=list(inv); C=np.array([inv[i]['consonant'] for i in ids],float); V=np.array([inv[i]['vowel'] for i in ids],float); T=np.array([inv[i]['tone'] for i in ids],float)
F=[fam.get(glot[i],'') for i in ids]; F=[x if x else 'ISOLATE:'+glot[i] for x,i in zip(F,ids)]
print("inventories", len(ids), "mapped to families", sum(1 for x in F if not x.startswith('ISOLATE')), "families", len(set(x for x in F if not x.startswith('ISOLATE'))))
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
# family-demeaned residuals (descent projection), families with >= 2 inventories retained
cnt=collections.Counter(F); keep=[k for k,x in enumerate(F) if cnt[x]>=2 and not x.startswith('ISOLATE')]
M=np.vstack([C,V,T]); Mk=M[:,keep]; Fk=[F[k] for k in keep]
means={}
for j,x in enumerate(Fk): means.setdefault(x,[]).append(j)
Mres=Mk.copy()
for x,js in means.items(): Mres[:,js]-=Mk[:,js].mean(1,keepdims=True)
tok,lam,detR,kap,R=kernel(Mres); n=Mres.shape[1]; u=np.finfo(float).eps
a,b,c=R[0]; d,e,f=R[1]; g,h,i=R[2]
ests=[detR,float(np.prod(np.linalg.eigvalsh(R))),float(np.prod(np.diag(np.linalg.cholesky(R)))**2),float(a*(e*i-f*h)-b*(d*i-f*g)+c*(d*h-e*g))]
print(f"FL-CHK.7 family-demeaned residuals, {n} inventories in {len(means)} families: {tok} lambda={lam:.12f} det(R)={detR:.12f} |lam^2-det|={abs(lam*lam-detR):.3e} spread={max(ests)-min(ests):.3e} kappa={kap:.4f}")
print(f"  within-family r(C,V)={R[0,1]:+.4f} r(C,T)={R[0,2]:+.4f} r(V,T)={R[1,2]:+.4f}")
# between-family frame: family means, one row per family
Mf=np.array([[Mk[r,js].mean() for x,js in means.items()] for r in range(3)]); tokf,lamf,detf,kapf,Rf=kernel(Mf)
print(f"FL-CHK.7b family means, {Mf.shape[1]} families: {tokf} det(R)={detf:.6f} kappa={kapf:.4f} r(C,V)={Rf[0,1]:+.4f} r(C,T)={Rf[0,2]:+.4f} r(V,T)={Rf[1,2]:+.4f}")
# largest families individually
for x,js in sorted(means.items(), key=lambda kv:-len(kv[1]))[:6]:
    t=kernel(Mk[:,js])
    print(f"  family {x} n={len(js)}: {t[0]} det(R)={t[2]:.4f}" if t[2] is not None else f"  family {x} n={len(js)}: {t[0]}")
rg=np.random.default_rng(20260622); ok=agree=0
for _ in range(1000):
    idx=rg.integers(0,n,n); t=kernel(Mres[:,idx])[0]
    if t!='[?]': ok+=1; agree+=(t==tok)
print(f"  bootstrap 1000 on the residual frame: agreement {agree/ok:.3f}")
print("glottolog languages.csv sha256[:16]", hashlib.sha256(open('glottolog_languages.csv','rb').read()).hexdigest()[:16])
print("receipt", hashlib.sha256(f"{n}|{len(means)}|{detR:.12f}|{detf:.6f}".encode()).hexdigest()[:16])
