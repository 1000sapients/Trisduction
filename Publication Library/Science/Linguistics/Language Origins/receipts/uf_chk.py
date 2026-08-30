# STRUCTURAL BATTERY · UF-CHK · seed 20260622 · rows derived from the paper's own exhibit table by printed rules
import re, json, math, numpy as np, hashlib
src=open('source_v1.md',encoding='utf-8').read()
tabs=re.findall(r'Table\*: Table [12] \|.*?\n((?:\|.*\n)+)', src)
rows=[l for t in tabs for l in t.splitlines() if l.startswith('|') and not l.startswith('|---') and not l.startswith('| Field')]
assert len(rows)==12, len(rows)
TRACT=['nasal','labial','fricative','stop','trill','sibilant','guttural','uvular','velar','lateral','glottal','pharyngeal','voiced','voiceless','egressive','ingressive','liquid','front vowel','formant','closure','opening','release','oscillation','turbulent','puff','reduplicat','airflow']
LINES=['Sumerian','Egyptian','Akkadian','Hebrew','Ugaritic','Sanskrit','Greek','Latin','Hittite','Gothic','English','German','Slavic','Old Norse','Quechua','Greenlandic','Judges','Ultan','PIE','Phoenician','Brahmi','Semitic']
F=[];E=[];R=[];names=[]
for r in rows:
    c=[x.strip() for x in r.strip().strip('|').split('|')]
    field,ar,ie,third,mech,tier=c
    names.append(field)
    F.append(sum(1 for t in TRACT if t in mech.lower()))
    e=2 if 'E2' in tier else 1
    e+= 1 if re.search(r'\^\d', mech) else 0
    E.append(e)
    text=ar+' '+ie+' '+third
    R.append(1+sum(1 for l in LINES if l in text))
M=np.array([F,E,R],float); N=M.shape[1]
print("rows (V_F tract-field count, V_E evidence score, V_ER attesting-line count) per exhibit:")
for i,n in enumerate(names): print(f"  {n:28s} F={F[i]} E={E[i]} R={R[i]}")
def qmul(a,b):
    w1,x1,y1,z1=a; w2,x2,y2,z2=b
    return np.array([w1*w2-x1*x2-y1*y2-z1*z2, w1*x2+x1*w2+y1*z2-z1*y2, w1*y2-x1*z2+y1*w2+z1*x2, w1*z2+x1*y2-y1*x2+z1*w2])
def kernel(M, exact=False):
    M=np.asarray(M,float); N=M.shape[1]; u=np.finfo(float).eps; eps=0.0 if exact else 100*u*N
    if N<4: return '[?]',None,None,None,'N<4'
    Mn=M-M.mean(1,keepdims=True); sd=Mn.std(1,ddof=1,keepdims=True)
    if np.any(sd==0): return '[?]',None,None,None,'zero-variance row'
    Mn=Mn/sd; G=Mn@Mn.T/(N-1); Q=Mn/np.sqrt((Mn*Mn).sum(1,keepdims=True)); R=Q@Q.T
    detR=float(np.linalg.det(R)); detG=float(np.linalg.det(G))
    Bv=np.linalg.svd(Q,full_matrices=False)[2][:3]; co=Q@Bv.T
    q=[np.concatenate(([0.0],c)) for c in co]; lam=float(qmul(qmul(q[0],q[1]),q[2])[0])
    kap=float(np.linalg.cond(R)); gate=min(1e6,(27/(100*u*N))**0.5)
    if detR<=eps: return '[X]',lam,detR,detG,f'collapse det<=eps kappa={kap:.3f}'
    if kap>=gate: return '[?]',lam,detR,detG,f'kappa>=gate kappa={kap:.3f}'
    return '[LOCK]',lam,detR,detG,f'kappa={kap:.4f} gate={gate:.3e}'
tok,lam,detR,detG,why=kernel(M)
Mn=M-M.mean(1,keepdims=True); Mn=Mn/Mn.std(1,ddof=1,keepdims=True); Q=Mn/np.sqrt((Mn*Mn).sum(1,keepdims=True)); Rm=Q@Q.T
a,b,c=Rm[0]; d,e,f=Rm[1]; g,h,i=Rm[2]
ests=[float(np.linalg.det(Rm)), float(np.prod(np.linalg.eigvalsh(Rm))), float(np.prod(np.diag(np.linalg.cholesky(Rm)))**2), float(a*(e*i-f*h)-b*(d*i-f*g)+c*(d*h-e*g))]
spread=max(ests)-min(ests); kap=float(np.linalg.cond(Rm)); tol=4*kap*np.finfo(float).eps
print(f"\nUF-CHK.1 kernel: verdict {tok} lambda={lam:.12f} det(R)={detR:.12f} det(G)={detG:.12f} {why}")
print(f"  identity |lam^2-det(R)| = {abs(lam*lam-detR):.3e}   four-estimator spread = {spread:.3e} within tol {tol:.3e}: {spread<=tol}")
print(f"  R off-diagonals r_FE={Rm[0,1]:+.6f} r_FR={Rm[0,2]:+.6f} r_ER={Rm[1,2]:+.6f}")
print(f"  collapse margin {math.log10(detR/(100*np.finfo(float).eps*N)):.2f} orders; conditioning margin {math.log10(min(1e6,(27/(100*np.finfo(float).eps*N))**0.5)/kap):.2f} orders")
# UF-CHK.2 orientation blindness: reflect V_E
Bfix=np.linalg.qr(Q.T)[0][:, :3]                      # span basis fixed once, reused after reflection
def lam_fixed(Qx):
    co=Qx@Bfix; qq=[np.concatenate(([0.0],c)) for c in co]; return float(qmul(qmul(qq[0],qq[1]),qq[2])[0]), float(np.linalg.det(Qx@Qx.T))
l0,d0=lam_fixed(Q); Q2=Q.copy(); Q2[1]=-Q2[1]; l2,d2=lam_fixed(Q2)
print(f"UF-CHK.2 reflection of V_E on the fixed basis: lambda {l0:+.12f} -> {l2:+.12f} ratio {l2/l0:+.6f}; |det(R)-det(R)'| = {abs(d0-d2):.3e}; |lam^2-det(R)| = {abs(l0*l0-d0):.3e}")
# UF-CHK.3 deletion: zero each row -> zero-variance route; rank of Gram after deleting each axis
for k,nm in enumerate(['V_F','V_E','V_ER']):
    Mz=M.copy(); Mz[k]=0.0; print(f"UF-CHK.3 zero {nm}: {kernel(Mz)[0]} {kernel(Mz)[4]}", end='; ')
    Md=np.delete(M,k,0); Mdn=Md-Md.mean(1,keepdims=True); Mdn/=Mdn.std(1,ddof=1,keepdims=True); Qd=Mdn/np.sqrt((Mdn*Mdn).sum(1,keepdims=True)); print(f"delete {nm}: 2-axis det = {np.linalg.det(Qd@Qd.T):.6f}")
# UF-CHK.4 conjugation invariance on the coordinate triad
rg=np.random.default_rng(20260622); Bv=np.linalg.svd(Q,full_matrices=False)[2][:3]; co=Q@Bv.T; dmax=0
for _ in range(1000):
    r=rg.standard_normal(4); r/=np.linalg.norm(r); rc=np.array([r[0],-r[1],-r[2],-r[3]])
    Qr=np.vstack([qmul(qmul(r,np.concatenate(([0.],row))),rc)[1:] for row in co]); dmax=max(dmax,abs(float(-np.linalg.det(Qr))-lam))
print(f"\nUF-CHK.4 conjugation sweep, 1000 SO(3) frames: max|d lambda| = {dmax:.3e}")
# UF-CHK.5 bootstrap stability
agree=ok=0
for _ in range(2000):
    idx=rg.integers(0,N,N); v=kernel(M[:,idx])[0]
    if v!='[?]': ok+=1; agree+=(v==tok)
print(f"UF-CHK.5 bootstrap 2000 resamples: agreement {agree/ok:.3f} on {ok} valid -> {'stable' if agree/ok>=0.95 else 'fragile' if agree/ok>=0.8 else 'unstable'}")
# UF-CHK.6 LIT on the three slot vocabularies as declared
A={'lattice','plateau','closure','formant','corner','boundary','categorical'}; B={'infant','regenerate','nursery','suckling','rebuild','transmitted'}; C={'script','receipt','rebus','acrophony','phonetization','letter'}
print(f"UF-CHK.6 LIT: A&B={A&B} A&C={A&C} B&C={B&C} pairwise disjoint = {not (A&B or A&C or B&C)}")
# UF-CHK.7 ROOT-CHK
adm=lambda n,k: n*(n-1)**(k-1)
print(f"UF-CHK.7 ROOT-CHK: n=28 k=2 {adm(28,2)} k=3 {adm(28,3)}; n=10 k=3 {adm(10,3)}; least k for D in (756,20412] at n=28 = 3; H(C3|C1,C2) <= log2(27) = {math.log2(27):.3f} bits")
rec=json.dumps({"rows":{"F":F,"E":E,"R":R},"lam":lam,"detR":detR,"detG":detG,"kappa":kap,"tok":tok})
print("receipt sha256[:16] =", hashlib.sha256(rec.encode()).hexdigest()[:16])
