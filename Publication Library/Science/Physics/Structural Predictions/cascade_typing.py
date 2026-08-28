# -*- coding: utf-8 -*-
# NECESSITY CASCADE · FULL REGISTER · seed 20260622
# Emitter mechanical, inputs hand-built and declared per the Honest Limits rule.
# 'rederiv' = the necessity is independently derivable without the source, so the
# literature is corroboration and not load-bearing (Carrying Law refinement).
SEED = 20260622

def classify(prov, sealL, gate, erl, mag, ling, negclean, cond, blast, rte, rederiv=False):
    if not sealL:            return 'X', 'Seal L fail; numbers never consulted'
    if gate:                 return 'D', f'gate {gate}: unbridged transport, out of band'
    if erl == 'chart':       return 'D', 'B.13.T: chart-manufactured magnitude'
    if mag == 'broken':      return 'X', 'magnitude broken'
    if mag != 'lock':        return 'C', 'no magnitude lock: empirical shelf'
    if ling != 'lock':       return 'B', 'Seal L open: orientation-blind, no direction'
    if prov == 'inh' and not rederiv:
        return 'C', 'inherited and load-bearing on source; E-capped by Carrying Law'
    if negclean is None:     return 'B', 'negation test not run'
    if negclean:             return 'B', 'denial also clean-locks: lean only'
    if cond < 1:             return 'B', 'unconditional necessity claim barred'
    if blast == 'L3':        return 'B', 'blast reaches the spine: demoted'
    return 'A', f'conditional necessity, {cond} condition(s), blast {blast}, route {rte}'

R = []
def E(tag, name, res, prov, blast, rte, roads, *, sealL=True, gate=None, erl='inv',
      mag='lock', ling='lock', negclean=True, cond=0, rederiv=False):
    c, w = classify(prov, sealL, gate, erl, mag, ling, negclean, cond, blast, rte, rederiv)
    R.append((tag, name, res, c, blast, rte, roads, w))

# ---------------- COLLISIONS AND SPLITS ----------------
E('1a','Dark-energy dynamism, w evolves','-','inh','L0','E3',3)
E('1b','Phantom divide never crossed, w(z)>=-1','R1','nat','L1','E3',3,negclean=False,cond=2)
E('2','a0 coevolution a0(z)=a0*H(z)/H0','R1/R6','nat','L0','E2',2,erl='chart')
E('2e','Radial-acceleration regularity, empirical','-','inh','L0','E2',4,mag='open')
E('16','Lightest neutrino mass floor 1-10 meV','R5','inh','L1','E3',4)
E('18','Neutrino ordering + delta_CP window','R5','nat','L1','E3',3,ling='open',negclean=False,cond=1)
# ---------------- NEW RESIDENCE FALSIFIERS ----------------
E('A-M','No magnetic monopole (closure dF=0)','R2','nat','L2','E1',3,negclean=False,cond=1)
E('A-Q','Purely quadrupolar GW polarization','R1+R7','nat','L2','E2',3,negclean=False,cond=1)
E('A-B','Baryon number conserved: proton decay null','R3','nat','L1','E1',3,negclean=False,cond=2)
E('A-E','No electron substructure to 20-100 TeV','R5','nat','L2','E2',3,negclean=False,cond=1)
# ---------------- REMAINDER OF THE REGISTER ----------------
E('3','Intermittency saturation exponent','-','inh','L0','E1',3)          # She-Leveque
E('4','Single-chain phonon waveguide','-','nat','L0','E1',3)
E('5','Active void pressure','-','nat','L0','E2',3)
E('6','Tetrahedral defect lock','-','inh','L0','E1',3,negclean=False,cond=1,rederiv=True)
E('7','ATP synthase efficiency','-','inh','L0','E1',3,sealL=False)
E('8','Ice growth tunneling','-','nat','L0','E1',3)
E('9','Cavitation geometry threshold','-','nat','L0','E1',3)
E('10','Bulk quantum Hall invariant','-','nat','L0','E2',3)
E('11','Enzyme proton tunneling','-','inh','L0','E1',3)
E('12','Neutron-star maximum mass','-','inh','L0','E3',3)
E('13','Bar-spiral resonance lock','-','nat','L0','E2',3)
E('14','Z2 surface-state robustness','-','inh','L0','E1',3,negclean=False,cond=1,rederiv=True)
E('15','Atmospheric-seismic diffusion lag','-','inh','L0','E1',3)
E('17','Muon g-2: space-like method decisive','-','inh','L0','E2',3)
E('19','GW memory effect','R1','inh','L1','E3',3,negclean=False,cond=1,rederiv=True)
E('20','BH information, condensate analog','-','inh','L0','E2',3)
E('21','Lithium depletion by convection','-','inh','L0','E2',3)
E('22','Cosmic-string background component','-','inh','L0','E3',3)
E('23','QCD critical point','-','inh','L0','E3',3)
E('24','Cuprate quantum criticality','-','nat','L0','E2',3)
E('25','Correlated-noise limit','-','inh','L0','E2',3)
E('26','Electron electric dipole moment','-','inh','L0','E2',3)
E('27','Gravity-induced collapse','-','inh','L0','E1',3)
E('28','Polymerase conformational proofreading','-','inh','L0','E1',3)
E('29','Discrete folding intermediates','-','nat','L0','E1',3)
E('30','Photosynthetic vibronic coherence','-','inh','L0','E1',3)
E('31','Martian inner-core threshold','-','inh','L0','E3',3)
E('32','Deep-mantle carbon reservoir','-','inh','L0','E2',3)
E('33','Oort cloud density wall','-','nat','L0','E2',3)
E('34','Pulsar glitch brittle fracture','-','nat','L0','E2',3)
E('35','Ion-channel proton tunneling','-','nat','L0','E1',3)
E('36','Phonon-superconductivity ceiling','-','inh','L0','E2',3)
E('37','Supercooled water liquid-liquid transition','-','nat','L0','E1',3)
E('38','Vacuum-energy gradient shift','R6','nat','L1','E3',3)
E('39','Tensor-to-scalar ratio','-','inh','L0','E3',3)
E('40','Cosmic birefringence','-','inh','L0','E3',3)
E('41','Gravitational slip parameter','R1','inh','L1','E3',3)
E('42','Photon-ring substructure','R7','inh','L1','E2',3,negclean=False,cond=1,rederiv=True)
E('44','Weak Gravity Conjecture relic','-','inh','L0','E3',2,gate=12)
E('45','Bekenstein bound on quark-gluon plasma','-','inh','L0','E3',2,gate=12)
E('46','Reionization percolation','-','inh','L0','E3',3)
E('47','Cosmic-string lensing','-','inh','L0','E2',3)
E('48','Primordial black-hole evaporation','-','inh','L0','E2',3)
E('49','Macroscopic superposition persistence','-','nat','L0','E2',3)
E('50','Delbruck scattering precision','-','inh','L0','E2',3)
E('51','Lunar recession inner-core coupling','-','nat','L0','E2',3)
E('52','Mantle plume stationarity','-','inh','L0','E2',3)
E('53','Casimir thermal dependence','-','inh','L0','E1',3)
E('54','Vacuum friction torque','-','inh','L0','E1',3)
E('55','Majorana quantized conductance','-','inh','L0','E1',3,negclean=False,cond=1,rederiv=True)
E('56','Cytoskeletal mechanical resonance','-','nat','L0','E1',3)
E('57','Condensate spinodal decomposition','-','inh','L0','E1',3)
E('58','Deep-focus earthquake implosion','-','inh','L0','E2',3)
E('59','Magnetar field ceiling','-','inh','L0','E3',3)
E('60','Triaxial dark halo','-','inh','L0','E3',3)
E('61','Quantum Darwinism redundancy','-','inh','L0','E1',3)
E('62','ER=EPR wormhole signature','-','inh','L0','E3',2,gate=12)
E('63','Proton radius field dependence','-','nat','L0','E2',3)
E('64','Sonoluminescence plasma state','-','nat','L0','E1',3)
E('65','Chiral-induced spin selectivity','-','inh','L0','E1',3)
E('66','Knot-topology transcription barrier','-','nat','L0','E1',3)
E('67','Subduction-CO2 coupling','-','inh','L0','E2',3)
E('68','Nanoconfined osmotic excess','-','nat','L0','E1',3)
E('69','Universal thermal scaling','-','nat','L0','E1',3)
E('70','Granular directional memory','-','nat','L0','E1',3)
E('71','Sonoluminescence energy ceiling','-','nat','L0','E1',3)
E('72','Domain-wall texture imprint','-','inh','L0','E3',3)

from collections import Counter
print("="*80)
print(f"FULL NECESSITY CASCADE · {len(R)} cards · seed {SEED}")
print("="*80)
for c in ('A','B','C','D','X'):
    rows = [r for r in R if r[3]==c]
    if not rows: continue
    print(f"\n--- CLASS {c} · {len(rows)} ---")
    for t,n,res,cl,b,rt,rd,w in rows:
        print(f"  {t:<4} {res:<7} blast {b:<3} route {rt}  {n}")
print("\n" + "-"*80)
cnt = Counter(r[3] for r in R)
print("CLASS CENSUS:", dict(sorted(cnt.items())))
anchored = [r for r in R if r[3]=='A' and r[2]!='-']
free     = [r for r in R if r[3]=='A' and r[2]=='-']
print(f"CLASS A split: framework-anchored {len(anchored)} · method-demonstrating (blast L0) {len(free)}")
print("BLAST:", dict(sorted(Counter(r[4] for r in R).items())))
print("ROUTE TIER:", dict(sorted(Counter(r[5] for r in R).items())))
e1A = [r[0] for r in R if r[3]=='A' and r[5]=='E1']
print("GATEKEEPER-PROOF CLASS A (route E1, any independent bench):", e1A)
print("MAX BLAST:", max(r[4] for r in R), "· L3 reached by: none · root unreachable (FOUNDATION-01)")
print("CENSUS: identifiers_in 72 + new 4 = 76 ; cards_out", len(R),
      "; hard deletions 0 ; splits 2 ; class-D relocations", cnt.get('D',0))
print("="*80)
