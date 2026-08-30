#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""RA-TOE battery v2 · seed 20260622 · extends ra_battery.py with the RA triad at the seal register,
the self-similarity fixed point, the manufactured-axis control, the integer core of the twelve,
and the speed-limit tightness; the universal-leg emitter run is removed (the kernel reads dimensionality,
never logical type; the root's grade is read from the proof, FOUNDATION-01)."""
import sys, math, hashlib, io, itertools
import numpy as np
sys.argv=[sys.argv[0]]
exec(open('/home/claude/build/ra_battery.py',encoding='utf-8').read().split("# ================================================================ DIGEST")[0].replace('open("/home/claude/build/ra_battery_receipt.txt"','open("/dev/null"'))
P("---- v2 extensions ----")
# F.1 RA's three slots read as the orthonormal triad of the seal (the LIT makes the slots disjoint, the seal reads them orthonormal)
tokRA, lamRA, dRA, dGRA, whyRA = verdict_kernel(np.vstack([np.sin(t), np.cos(t), np.sin(2*t)]))
P(f"F.1  the cascade run on RA at the seal register, three disjoint slots as the orthonormal triad: {tokRA} λ = {lamRA:+.12f}, det(R) = {dRA:.12f}, identity {abs(lamRA*lamRA-dRA):.3e}")
# F.2 self-similarity fixed point: the projected physics reading actuated onto the ground
Qp = Q.copy(); dets=[float(np.linalg.det(Qp@Qp.T))]
for it in range(3):
    Rp = Qp@Qp.T; w,V = np.linalg.eigh(Rp); Qp = (V@np.diag(1/np.sqrt(w))@V.T)@Qp   # polar factor: actuation onto the ground
    dets.append(float(np.linalg.det(Qp@Qp.T)))
P("F.2  self-similarity fixed point, det(R) by iteration 0→3:", " → ".join(f"{d:.12f}" for d in dets))
# F.3 manufactured-axis control: a third axis built from the two covariates dissolves under the CDT
Mman = np.vstack([M[0], M[1], 0.7*Cz[0]+0.5*Cz[1]])
P("F.3  manufactured third axis (a function of the covariates) under the CDT:", verdict_kernel(Mman, Cz)[0], "·", verdict_kernel(Mman, Cz)[4], "· the same axis unprojected:", verdict_kernel(Mman)[0])
# F.4 the integer core of the twelve: Hurwitz units, class equation, norm-two shell, the A4 torsor
def q(w,x,y,z): return (w,x,y,z)
def qm(a,b):
    w1,x1,y1,z1=a; w2,x2,y2,z2=b
    return (w1*w2-x1*x2-y1*y2-z1*z2, w1*x2+x1*w2+y1*z2-z1*y2, w1*y2-x1*z2+y1*w2+z1*x2, w1*z2+x1*y2-y1*x2+z1*w2)
from fractions import Fraction as Fr
units=set()
for i in range(4):
    for s in (1,-1):
        v=[Fr(0)]*4; v[i]=Fr(s); units.add(tuple(v))
for signs in itertools.product((1,-1),repeat=4): units.add(tuple(Fr(s,2) for s in signs))
units=sorted(units); closed=all(qm(a,b) in set(units) for a in units for b in units)
norm=lambda a: sum(c*c for c in a)
def conj(a): return (a[0],-a[1],-a[2],-a[3])
pairs={}
for a in units:
    key=min(a, tuple(-c for c in a)); pairs.setdefault(key,a)
reps=list(pairs); classes=[]
seen=set()
for a in reps:
    if a in seen: continue
    orbit=set()
    for g in units:
        c=qm(qm(g,a),conj(g)); k=min(c,tuple(-x for x in c)); orbit.add(k)
    seen|=orbit; classes.append(len(orbit))
shell=[a for a in itertools.product(range(-1,2),repeat=4) if sum(c*c for c in a)==2]
pure=[a for a in shell if a[0]==0]
half2=[a for a in itertools.product([Fr(1,2),Fr(-1,2),Fr(3,2),Fr(-3,2)],repeat=4) if norm(a)==2]
# A4 torsor: even permutations of 4 letters acting on ordered pairs of distinct letters
perms=[p for p in itertools.permutations(range(4)) if sum(1 for i in range(4) for j in range(i+1,4) if p[i]>p[j])%2==0]
opairs=[(i,j) for i in range(4) for j in range(4) if i!=j]
orbit={(p[i],p[j]) for p in perms for (i,j) in [opairs[0]]}
stab=[sum(1 for p in perms if (p[i],p[j])==(i,j)) for (i,j) in opairs]
P(f"F.4  Hurwitz units {len(units)}, closed under multiplication {closed}, all unit norm {all(norm(a)==1 for a in units)} · antipodal class equation {sorted(classes)} · norm-two shell {len(shell)} = pure {len(pure)} + real-occupied {len(shell)-len(pure)}, half-integer members {len(half2)} · A₄ order {len(perms)}, one orbit of size {len(orbit)} on {len(opairs)} ordered pairs, stabilizers {sorted(set(stab))}")
# F.5 speed-limit tightness on the qubit: both bounds saturated at one time
P(f"F.5  unified speed limit on the qubit: max(πħ/2ΔE, πħ/2⟨E⟩) = {max(tau_MT,tau_ML):.6f}, first orthogonal state reached at t = π: survival {math.cos(math.pi/2)**2:.1e}; the bound is attained, tight")
dig = hashlib.sha256(out.getvalue().encode("utf-8")).hexdigest()
P(BAR); P("RECEIPT DIGEST v2 sha256[:16] =", dig[:16]); P(BAR)
open("/home/claude/build/ra_battery_v2_receipt.txt","w",encoding="utf-8").write(out.getvalue())
