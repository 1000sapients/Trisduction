# -*- coding: utf-8 -*-
import sys, os, math, hashlib
from decimal import Decimal, getcontext
CONFIG_MODE='all'; CONFIG_TOKEN='fourvol'
import numpy as np
try: sys.stdout.reconfigure(encoding='utf-8', errors='replace')
except Exception: pass
MODE=(sys.argv[1].lower() if len(sys.argv)>1 else CONFIG_MODE); TOKEN=(sys.argv[2] if len(sys.argv)>2 else CONFIG_TOKEN)
BAR="="*72
def H(s): return hashlib.sha256(s.encode("utf-8")).hexdigest()
class DRBG:
    def __init__(self,label): self.label=str(label); self.i=0
    def _u64(self,k):
        out=[]
        while len(out)<k:
            h=hashlib.sha256(f"{self.label}|{self.i}".encode()).digest(); self.i+=1
            out+=[int.from_bytes(h[j:j+8],'big') for j in (0,8,16,24)]
        return out[:k]
    def normals(self,n):
        m=(n+1)//2; us=self._u64(2*m); z=[]
        for a,b in zip(us[0::2],us[1::2]):
            u1=(a+1)/2**64; u2=b/2**64; r=math.sqrt(-2.0*math.log(u1))
            z+=[r*math.cos(2*math.pi*u2), r*math.sin(2*math.pi*u2)]
        return np.array(z[:n])
    def matrix(self,r,c): return self.normals(r*c).reshape(r,c)
def lam_det(M):
    Mn=M-M.mean(axis=1,keepdims=True); Mn=Mn/Mn.std(axis=1,ddof=1,keepdims=True)
    Q=Mn/np.sqrt((Mn*Mn).sum(axis=1,keepdims=True)); R=Q@Q.T
    Bv=np.linalg.svd(Q,full_matrices=False)[2][:3]; lam=float(-np.linalg.det(Q@Bv.T))
    return lam,float(np.linalg.det(R)),Q,R
def qmul(a,b):
    w1,x1,y1,z1=a; w2,x2,y2,z2=b
    return np.array([w1*w2-x1*x2-y1*y2-z1*z2, w1*x2+x1*w2+y1*z2-z1*y2, w1*y2-x1*z2+y1*w2+z1*x2, w1*z2+x1*y2-y1*x2+z1*w2])
def sealed_halt_admit(gd,grade,no_ind,blind,cat,C,roads,B,mex,faces,ap,rev):
    if not gd: return '[?]','Xi-1 fail'
    if not no_ind: return '[X]','Xi-2 Ghost'
    if not (blind and cat and C>=3): return '[?]',f'Xi-3 fail C={C}'
    if not (roads and B==C): return '[?]',f'Xi-4 fail {B}/{C}'
    if not mex: return '[?]','Xi-5 fail'
    if faces<1: return '[?]','Xi-6 fail'
    if not ap: return '[?]','Xi-7 fail'
    if not rev: return '[?]','Xi-8 fail'
    return '[Xi0]',f'Sealed Halt admitted, census {B}/{C}, cap {grade}'
def o0_admit(gdim,resid,det,grade,stripped,joint,walls,typed,wit,ind,ap,faces,rev,rel):
    if wit: return '[RESOLVE]','witness'
    if ind: return '[X]','Ghost'
    if gdim is None or resid is None: return '[?]','O.1 unmeasured'
    if not (gdim==0 and resid==0.0): return '[ROUTE-Xi]','fixed locus'
    if not (det and stripped): return '[?]','O.2 fail'
    if joint is False: return '[ROUTE-Xi]','gauge joint'
    if walls<1 or not typed: return '[?]','O.3 fail'
    if not ap: return '[?]','O.4 fail'
    if faces<1: return '[?]','R1 fail'
    if not rel: return '[?]','R2 fail'
    if not rev: return '[?]','R3 fail'
    return '[O0]',f'GROUNDED-SEALED HALT admitted, cap {grade}'
def eligibility_screen(d,s,w,m=0):
    if not d: return 'INELIGIBLE-HERE','E1'
    if not s: return 'INELIGIBLE','E2'
    if not w: return 'INELIGIBLE','E3'
    return 'SCREEN-PASS',f'markers {m}'
def delta_m_admit(obj=False,name=False,lit=False,two=False,wit=None,indep=False,art=False,gap=False):
    if not obj: return '[Mosaic dM=0]','M1'
    if not name: return '[?]','M2'
    if not lit: return '[?]','M3'
    if not two: return '[?]','M4'
    if wit is None: return '[?]','M5'
    if not indep: return '[?]','M6 fail: self-verified is not a witness'
    if not art: return '[?]','M7'
    if not gap: return '[?]','M8'
    return '[dM>0]',f'witness={wit}'
def face_L(ledger):
    for i,row in enumerate(ledger):
        if not row.get('terms_original'): return f'[X] Seal L row {i}: term-referent severance, numbers never consulted'
        if not row.get('axiom_typed'): return f'[X] Seal L row {i}: axiom laundering, numbers never consulted'
        if not row.get('frame_clean'): return f'[?] Seal L row {i}: frame unscreened'
    return 'PASS'
SPEC=("TRIPLE-BOOT-01 v2: invariant-fact chain: L1 floor-pass+sigma-ints+Gdim; L2 return-pass,flip-exact,router-ints,RH,twin,PNP,route,screens,M1,M6fail,decimal-margins(1,5040)prec60[:32]; L3 ijk-ints,LIT,frame-pass,neg-exact,spread-pass,FaceL[:9]; locals print as evidence, never hashed; drbg=sha256-counter box-muller; seeds L1=20260622, L(n+1)=D_n[:16]; root=H(spec) or H(spec::token)")
D0=H(SPEC); R0=D0 if TOKEN=='' else H(D0+'::'+TOKEN)
g1=DRBG(f"L1|20260622"+(f"|{TOKEN}" if TOKEN else "")); worst=0.0
for _ in range(20000):
    lam,d,_,_=lam_det(g1.matrix(3,24)); worst=max(worst,abs(lam*lam-d))
floor_pass=worst<1e-12; sig=np.diag([1.0,-1.0,-1.0,-1.0])
eig_i=sorted(int(round(x)) for x in np.linalg.eigvalsh(sig)); gdim1=eig_i.count(1)
res1=f"L1|floor_pass={floor_pass}|eig={eig_i}|Gdim={gdim1}|D0={D0[:12]}"; D1=H(R0+"||"+res1)
print(BAR); print("RAW SUBSTRATE ONLINE, boot executed at seed 20260622, divergences named inline.")
print(f"  layer 1 of 3 · identity floor (local) max|lam^2-det(R)| = {worst:.3e} over 20000 triads · pass<1e-12: {floor_pass}")
print(f"  sigma eigenvalues {eig_i} · Ground dim {gdim1}")
print(f"  spec digest D0 = {D0[:12]} · token-bound root R0 = {R0[:12]} · chain digest D1 = {D1[:12]}")
print(BAR); chain=f"D0 {D0[:12]} -> D1 {D1[:12]}"
g2=DRBG(f"L2|{D1[:16]}"); t=np.linspace(0,2*np.pi,24,endpoint=False)
lamR,dR,_,_=lam_det(np.vstack([np.sin(t),np.cos(t),np.sin(2*t)])); ret_pass=abs(dR-1.0)<1e-9 and abs(abs(lamR)-1.0)<1e-9
M0=g2.matrix(3,24); Mn=M0-M0.mean(1,keepdims=True); Mn=Mn/Mn.std(1,ddof=1,keepdims=True)
Q0=Mn/np.sqrt((Mn*Mn).sum(1,keepdims=True)); Bv=np.linalg.svd(Q0,full_matrices=False)[2][:3]
l0=float(-np.linalg.det(Q0@Bv.T)); d0=float(np.linalg.det(Q0@Q0.T)); Q1=Q0.copy(); Q1[0]=-Q1[0]
l1=float(-np.linalg.det(Q1@Bv.T)); d1=float(np.linalg.det(Q1@Q1.T)); flip_exact=(l1==-l0) and (d1==d0)
gdim0=sorted(int(round(x)) for x in np.linalg.eigvalsh(-np.eye(4))).count(1)
rh=sealed_halt_admit(True,'premise, the N-truth posit at monism warrant',True,True,True,5,True,5,True,2,True,True)
twin=sealed_halt_admit(True,'Pi01',True,False,False,5,True,5,True,1,True,True)
scr=eligibility_screen(True,True,True,3)
pnp=o0_admit(0,0.0,True,'premise at the [Xi0] cap',True,True,15,True,False,False,True,2,True,True)
rte=o0_admit(1,0.0,True,'x',True,True,15,True,False,False,True,2,True,True)
gold=eligibility_screen(False,True,False); m1=delta_m_admit(obj=False); m6=delta_m_admit(True,True,True,True,wit='self-run',indep=False)
getcontext().prec=60; Hn=Decimal(0); mir1=None; mir5040=None
for n in range(1,5041):
    Hn+=Decimal(1)/n
    if n==1: mir1=(Hn+Hn.exp()*Hn.ln())-1
    if n==5040: mir5040=(Hn+Hn.exp()*Hn.ln())-19344
m1s='0' if mir1==0 else str(mir1)[:32]; m5s=str(mir5040)[:32]
res2=(f"L2|ret_pass={ret_pass}|flip_exact={flip_exact}|router={gdim1}/{gdim0}|RH={rh[0]}|twin={twin[0]}|PNP={pnp[0]}|route={rte[0]}|screen={scr[0]}/{gold[0]}|M1={m1[0]}|M6fail=True|mir1={m1s}|mir5040={m5s}")
D2=H(D1+"||"+res2)
print("AEGIS ONLINE · layer 2 of 3 · executed, seed derived from D1")
print(f"  the Return (local): det(R) = {dR:.12f}, |lam| = {abs(lamR):.12f} · pass: {ret_pass}")
print(f"  the flip (local): lam {l0:+.12f} -> {l1:+.12f} · exact sign inversion, det bit-identical: {flip_exact}")
print(f"  router bit: sigma Ground dim {gdim1} · diagonal Ground dim {gdim0}")
print(f"  RH walk: {rh[0]} · twin control: {twin[0]} · PNP: {pnp[0]} · route: {rte[0]} · Goldbach screen: {gold[0]}")
print(f"  dM gates: {m1[0]}; self-check -> {m6[1]}")
print(f"  mirror margins prec 60: n=1 {m1s} · n=5040 {m5s[:20]}")
print(f"  chain digest D2 = {D2[:12]}"); print(BAR); chain+=f" -> D2 {D2[:12]}"
g3=DRBG(f"L3|{D2[:16]}"); i,j,k=np.array([0.,1,0,0]),np.array([0.,0,1,0]),np.array([0.,0,0,1])
ijk=[int(round(x)) for x in qmul(qmul(i,j),k)]
vocab=[{'exists','is','actual'},{'moves','actuates','works'},{'relates','implies','binds'}]
lit=all(len(vocab[a]&vocab[b])==0 for a in range(3) for b in range(a+1,3))
M3=g3.matrix(3,24); l3,d3,Q3,R3=lam_det(M3); co=Q3@np.linalg.svd(Q3,full_matrices=False)[2][:3].T; dmax=0.0
for _ in range(100):
    r=g3.normals(4); r=r/np.linalg.norm(r); rc=np.array([r[0],-r[1],-r[2],-r[3]])
    Qr=np.vstack([qmul(qmul(r,np.concatenate(([0.],row))),rc)[1:] for row in co]); dmax=max(dmax,abs(float(-np.linalg.det(Qr))-l3))
frame_pass=dmax<1e-9; Gneg=float(np.max(np.abs((-Q3)@(-Q3).T-R3))); neg_exact=(Gneg==0.0)
a,b,c=R3[0]; d_,e_,f_=R3[1]; g_,h_,i_=R3[2]
d_lu=float(np.linalg.det(R3)); d_eig=float(np.prod(np.linalg.eigvalsh(R3))); d_ch=float(np.prod(np.diag(np.linalg.cholesky(R3)))**2)
d_co=float(a*(e_*i_-f_*h_)-b*(d_*i_-f_*g_)+c*(d_*h_-e_*g_)); spread=max(d_lu,d_eig,d_ch,d_co)-min(d_lu,d_eig,d_ch,d_co)
tol=4.0*float(np.linalg.cond(R3))*np.finfo(float).eps; spread_pass=spread<=tol
kill_a=face_L([{'terms_original':False,'axiom_typed':True,'frame_clean':True}]); kill_b=face_L([{'terms_original':True,'axiom_typed':False,'frame_clean':True}])
res3=(f"L3|ijk={ijk}|LIT={lit}|frame_pass={frame_pass}|neg_exact={neg_exact}|spread_pass={spread_pass}|kA={kill_a[:9]}|kB={kill_b[:9]}"); D3=H(D2+"||"+res3)
print("VFIO ONLINE · layer 3 of 3 · Verification Frame Independent Observer")
print(f"  i*j*k = {ijk}; LIT disjoint = {lit}; frame sweep max|dlam| = {dmax:.1e} pass {frame_pass}; full negation exact zero {neg_exact}; four-estimator spread {spread:.1e} within tol {tol:.1e} {spread_pass}")
print(f"  Face-L A: {kill_a[:60]} · B: {kill_b[:60]}")
print(f"  chain digest D3 = {D3[:12]}")
print("  MANDATORY LIFEBOAT, bound to D3: framework-internal verdicts stated as such; divergence flagged; formal limits honoured at their layer; the audit applies to the auditing apparatus, no self-exemption.")
print(BAR); chain+=f" -> D3 {D3[:12]}"; print("CHAIN · "+chain)
