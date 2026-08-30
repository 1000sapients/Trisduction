# QR-CHK.8 · reflective-register frame on the 28 consonants from the Quranic root set, three measured rows
import re, math, collections, numpy as np
exec(open('qroot.py',encoding='utf-8').read().split("def H(")[0])   # reuse parsing: types, tri
place={'labial':'بفمو','coronal':'تثدذطظرزسشصضلن','palatal':'جي','dorsal':'كقغخ','guttural':'عحهأ'}
cls={c:k for k,v in place.items() for c in v}; inv=[c for v in place.values() for c in v]
VF=[28-len(place[cls[c]]) for c in inv]                                  # formal: admissible partners under OCP-Place
VE=[sum(types[r] for r in tri if r[0]==c) for c in inv]                  # empirical: token frequency as first radical
VER=[len({r[1] for r in tri if r[0]==c}) for c in inv]                   # registrational: distinct attested second-radical partners
M=np.array([VF,VE,VER],float); N=M.shape[1]
Mn=M-M.mean(1,keepdims=True); Mn/=Mn.std(1,ddof=1,keepdims=True); Q=Mn/np.sqrt((Mn*Mn).sum(1,keepdims=True)); R=Q@Q.T
def qmul(a,b):
    w1,x1,y1,z1=a; w2,x2,y2,z2=b
    return np.array([w1*w2-x1*x2-y1*y2-z1*z2, w1*x2+x1*w2+y1*z2-z1*y2, w1*y2-x1*z2+y1*w2+z1*x2, w1*z2+x1*y2-y1*x2+z1*w2])
B=np.linalg.qr(Q.T)[0][:, :3]; co=Q@B; q=[np.concatenate(([0.0],c)) for c in co]; lam=float(qmul(qmul(q[0],q[1]),q[2])[0])
detR=float(np.linalg.det(R)); kap=float(np.linalg.cond(R)); u=np.finfo(float).eps; eps=100*u*N
a,b,c=R[0]; d,e,f=R[1]; g,h,i=R[2]
ests=[detR,float(np.prod(np.linalg.eigvalsh(R))),float(np.prod(np.diag(np.linalg.cholesky(R)))**2),float(a*(e*i-f*h)-b*(d*i-f*g)+c*(d*h-e*g))]
tok='[X]' if detR<=eps else ('[?]' if kap>=1e6 else '[LOCK]')
print(f"QR-CHK.8 consonant frame N={N}: {tok} lambda={lam:.12f} det(R)={detR:.12f} |lam^2-det|={abs(lam*lam-detR):.3e} spread={max(ests)-min(ests):.3e} kappa={kap:.4f}")
print(f"  r(VF,VE)={R[0,1]:+.4f} r(VF,VER)={R[0,2]:+.4f} r(VE,VER)={R[1,2]:+.4f}")
Q2=Q.copy(); Q2[1]=-Q2[1]; co2=Q2@B; q2=[np.concatenate(([0.0],x)) for x in co2]; l2=float(qmul(qmul(q2[0],q2[1]),q2[2])[0])
print(f"  reflection of VE: lambda ratio {l2/lam:+.6f}, |ddet| = {abs(float(np.linalg.det(Q2@Q2.T))-detR):.3e}")
rg=np.random.default_rng(20260622); ok=agree=0
for _ in range(2000):
    idx=rg.integers(0,N,N); Mb=M[:,idx]
    if np.any(Mb.std(1,ddof=1)==0): continue
    Mb=(Mb-Mb.mean(1,keepdims=True))/Mb.std(1,ddof=1,keepdims=True); Qb=Mb/np.sqrt((Mb*Mb).sum(1,keepdims=True)); Rb=Qb@Qb.T; db=float(np.linalg.det(Rb)); kb=float(np.linalg.cond(Rb))
    ok+=1; agree+=(('[X]' if db<=eps else '[?]' if kb>=1e6 else '[LOCK]')==tok)
print(f"  bootstrap 2000: agreement {agree/ok:.3f} on {ok} valid")
# closed form for the least sufficient length under the adjacency constraint
k=lambda D,n: 1+math.ceil(math.log(D/n)/math.log(n-1)) if D>n else 1
print("closed form k(D,n)=1+ceil(ln(D/n)/ln(n-1)):", "k(1651,28)=",k(1651,28), "k(6000,28)=",k(6000,28), "k(1651,10)=",k(1651,10), "k(1651,42)=",k(1651,42))
