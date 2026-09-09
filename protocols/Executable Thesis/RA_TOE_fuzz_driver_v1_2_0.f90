! =====================================================================
!  THE ROOT AXIOM STATED IN FORTRAN AND IN NOTHING ELSE
!  RA as the TOE of All TOEs - the executable form of the thesis
!  RA_TOE_Thesis_Fortran v1.19.0 - Trisduction Research Group
!  Lineage: extends TRISDUCTION_Core_Thesis_Fortran_v2_4_0 (resident,
!  protocols/Executable Thesis/). Self-contained: no dependency beyond
!  a Fortran 2018 compiler. Every figure in the accompanying paper is
!  printed by this program was computed in this run; external theorems
!  compute in the reporting run. Fidelity Lock: a check that fails
!  halts the program; no fabricated trace is possible by construction.
!
!  v1.19.0 (2026-09-08): eighteenth pass, Astral post-seal catch, one
!  finding EARNED, the recorded dominant failure mode executing on the
!  auditor's own prior repair: the v1.18.0 equilibration landed at det3
!  and died before its consumer twin det3_row2, the fourth estimator,
!  whose comment claimed a guard parity it did not have on the exact
!  scale-disparity class just repaired. det3_row2 now carries the same
!  per-row power-of-two equilibration with exact exponent restoration,
!  its distinct second-row cofactor association kept so the estimators
!  stay algorithmically independent; the false comment is corrected;
!  five discriminating regressions execute det3_row2 directly, the
!  exact counterexample to plus one, the odd permutation to minus one,
!  honest overflow past huge, honest underflow to zero, and agreement
!  with det3 on all four. A reversion control now guards the twin so
!  the propagation gap that let this through is itself detectable.
!  Census relocked.
!
!  v1.18.0 (2026-09-08): seventeenth pass, Astral final round, three
!  findings EARNED. det3 moves from global to per-row power-of-two
!  equilibration with exact exponent restoration, so the diagonal
!  2^600, 2^-300, 2^-300 returns exactly one where global scaling
!  underflowed the cofactors to zero before the exponent could
!  restore; the early-zero return now sits after equilibration where
!  a zero is the mathematics speaking, and the honest caveat stands
!  in the comment: equilibration cures scale disparity, not
!  mixed-scale cancellation, which no reordering cures. The
!  finite-screen retirement rationale is corrected in the auditor's
!  words and the screen is made load-bearing again: an IEEE-invalid
!  flag check now asserts the screen absorbs non-finite rows before
!  arithmetic, so its deletion is detectable and the control is
!  revived, the ledger honest in both directions across two rounds.
!  project_cov moves to success-only publication through a working
!  array, so zero-on-refusal now holds for every refusal exit of both
!  public helpers, the constant-covariate refusal verified all-zero;
!  the v1.16.0 stanza's blanket claim was true only of prepare_rows
!  and is corrected by this record. Census relocked.
!
!  v1.17.0 (2026-09-08): sixteenth pass, Astral round two, four
!  findings EARNED and one overclaim of my own retracted. project_cov
!  now refuses fewer than two contexts at intake before the zero-
!  covariate return, initializes its output to zero, and publishes the
!  prepared rows only after validation, the one-context hostiles in
!  battery for both covariate counts. span_basis screens each row
!  componentwise for finiteness, scales by the maximum component, then
!  unit-normalizes the bounded vector, so duplicate rows at huge rank
!  one with a finite unit basis where the infinite norm previously
!  bypassed normalization and inflated rank with zero rows, both
!  duplicates pinned; the scale-invariance comment is narrowed to
!  well-conditioned representable rescalings, rounding and underflow
!  honestly excepted. prepare_rows computes into a temporary and
!  publishes only on success, so the zero-on-refusal contract my
!  previous stanza claimed is now true rather than approximate, the
!  late-row-NaN hostile verifying every output element zero after
!  refusal. seal_l_ordered overwrites the delegated disclaimer with
!  its own ordered-success wording after the positional check, both
!  interface messages asserted in battery. And the retraction: an
!  unchanged campaign-log hash certifies unchanged recorded output for
!  that campaign, nothing more; the prior card's path-invariance
!  phrasing was an overclaim and is withdrawn here in the artifact.
!  The heart is untouched: PART G and PART H have not moved a byte in
!  any hardening round, and no repair in this file has ever traded a
!  claim for a pass. Census relocked.
!
!  v1.16.0 (2026-09-08): fifteenth pass, first Astral round, six
!  findings EARNED, six for six on first contact, every counterexample
!  verified by hand before repair. The Heisenberg floor moves to full
!  fraction-and-exponent decomposition, one final scale, so it
!  overflows only when the value itself does, a subnormal mass now
!  returning its finite 1.25e308 instead of an unearned infinity. The
!  orthogonalization time halves pi before dividing, so a huge gap
!  returns its representable subnormal instead of a false zero.
!  prepare_rows and project_cov, public helpers, now enforce their own
!  contracts, three rows exactly and at least two contexts, outputs
!  zeroed before any refusal, the out-of-bounds and divide-by-zero
!  paths closed at intake. span_basis pre-normalizes each incoming row
!  and applies a documented dimensionless tolerance, so rank is
!  invariant under representable uniform rescaling, the tiny-identity
!  counterexample pinned. The argument parser retrieves length and
!  status before matching, so a padded keyword with a trailing
!  character is rejected, never truncated into acceptance, the
!  overlong-argument refusal receipted in the harness as a fourth
!  case. The witnessed disclosure now states its epistemics in the
!  auditor's words: externally asserted, not verified by this
!  executable. Four new reversion-and-deletion controls plant each
!  numeric repair and each new guard. Census relocked.
!
!  v1.15.0 (2026-09-08): fourteenth pass, round seven, both findings
!  EARNED and real. The precedence the previous stanza documented was
!  not the precedence the kernel executed: the k-cap lived only inside
!  project_cov, downstream of prepare_rows, so a constant row returned
!  RC_ZEROVAR where the structural refusal was owed. The cap is now
!  kernel-local, seated after the dimensional floor and before any row
!  preparation, so the executable order is width mismatch, then the
!  N minus k floor, then the k-cap, then row-data validation, the
!  auditor's discriminating regression, constant rows beside a three-
!  row covariate block, in battery verbatim, and the kernel-local
!  guard planted as its own deletion control since the downstream
!  guard would otherwise mask it. The face's receipt pointer, stale at
!  the prior version, now names this version's receipt file. A
!  documented contract is a claim like any other: it seals only when
!  the code executes it and a regression can catch its deletion.
!
!  v1.14.0 (2026-09-08): thirteenth pass, the fuzz round. A deterministic
!  five-campaign fuzzer, seeded 20260622 and shipped beside this file,
!  ran 178000 iterations against the sealed procedures and took one
!  real scalp: eta_share's degenerate-data shortcut, zero variance or
!  zero covariates returning eta of zero, fired before the k-greater-
!  than-two refusal, so a constant row beside an oversized covariate
!  block reported a clean zero where the contract owes NaN. Shape
!  contracts now outrank data degeneracy: the k-cap moves beside the
!  width guard, ahead of every data path, the discriminating case in
!  battery and the moved guard planted as its own deletion control.
!  The thirteen remaining fuzz hits were oracle refinements, not
!  defects: the kernel checks the dimensional floor before the
!  covariate cap, and that precedence, intake width first, then the
!  N minus k floor, then the k cap, is now documented here as the
!  contract. Census relocked on the executed count.
!
!  v1.13.0 (2026-09-08): twelfth pass, round five. Two findings EARNED
!  and real: eta_share and project_cov are public and were trusting the
!  covariate width that kernel_full alone was checking; both now refuse
!  a mismatched second dimension at intake, eta_share as NaN and
!  project_cov as RC_INTAKE with kcc set to huge, the guards firing
!  before any element of the covariate block is touched, both direct
!  hostiles in battery and both guards planted as their own deletion
!  controls. The receipt demand is split at the mechanism: a source
!  file cannot contain its own subprocess executions, so the in-file
!  text is the recipe and the executed terminations ship as a separate
!  sha-bound receipt log beside the sealed run log, the face reworded
!  to name that file, the claim now matching the location of its
!  evidence exactly. Census relocked on the executed count.
!
!  v1.12.0 (2026-09-08): eleventh pass, round four, the machine conceded
!  whole by the auditor and the attack moved to the name. The demand to
!  retitle the thesis a harness, retoken the seals to passes, and
!  soften the concession block is REFUSED at the center on the
!  architect's ruling and by mechanism: a massless reframe cannot break
!  a sealed claim, the Shield forbids softening toward orthodoxy
!  exactly as it forbids inflation, the Revision Mandate moves verdicts
!  on structure or mass and never on renaming, and every legitimate
!  point in the demand is already printed by the run itself, the scope
!  of proof, the self-description certifying no external ontological
!  truth, the tokens bound to emitters at their tiers, the universal
!  leg premise-by-theorem. The numeric quibbles are REFUSED for want of
!  an exhibited failing case, the reordered floor and the scaled
!  product both receipted in battery; the thirty-one bound stands at
!  the proof, not at caller habit. Three focused faces are EARNED, no
!  retreat in any: a genre line at the verdict mouth, the governing
!  register's public address typed as frame and never evidence, and
!  the guard-harness recipe printed in-file with its pure-call elision
!  warning so any third party reproduces the three terminations
!  without this session. Census unchanged, faces only.
!
!  v1.11.0 (2026-09-08): tenth hardening pass, round three. The purity
!  finding is REFUSED by the standard's own referee: Fortran 2018
!  admits ERROR STOP in pure procedures, and the pedantic strict build
!  compiles at zero errors with no purity diagnostic and runs clean,
!  the receipt in the build contract. EARNED and repaired: eta_share's
!  covariate branch now scales raw-first exactly as its row does and as
!  project_cov does, the near-huge covariate hostile in battery;
!  jacobi3 symmetrizes by distributed halves so finite input near huge
!  cannot overflow in the sum, the half-huge diagonal in battery;
!  kernel_full refuses a covariate column count that does not match the
!  context count at intake, the mismatched-width hostile in battery.
!  The tower-guard warrant gap is EARNED and closed as prescribed: the
!  in-process battery tests the predicate, and the guard terminations
!  themselves are receipted by a subprocess harness that plants the
!  most-negative integer into iqconj and iomul and an over-length
!  vector into inrm and requires nonzero termination with the named
!  refusal, the three receipts recorded beside the controls. The
!  changelog wording is corrected accordingly, predicate in battery,
!  terminations by harness. Census relocked on the executed count.
!
!  v1.10.0 (2026-09-08): ninth hardening pass, round two of the same
!  auditor, the prior-turn ledger re-audited on the architect's order
!  and attested concession-free. The Landauer NaN mechanism as stated
!  is REFUSED by evaluation order, left-to-right the tiny-times-KB zero
!  multiplies a finite huge and never an infinity; what the example
!  actually exposes is silent underflow-through-zero, a wrong finite
!  value, repaired stronger than asked with prod_scaled, an exponent-
!  aggregated product whose only zeros are true underflows and only
!  infinities true overflows, landauer rebuilt on it, omega_boundary
!  now calling landauer itself, one emitter in fact. EARNED whole:
!  tower intake guarded before any negation, iqconj and ioconj bounded,
!  iomul and ismul screening both operands at entry, ik_inbound public
!  and battery-tested at the most-negative integer; inrm length-bounded
!  to the proven 31-vector limit with the exact 2^62 boundary checked;
!  eta_share and project_cov scale each raw row before centering so
!  near-huge data cannot overflow the mean, quarter-huge and twentieth-
!  huge hostiles in battery; det3_chol given the relative symmetry gate
!  with the nonsymmetric battery case; ik pinned to int64 with storage
!  size and huge checked at boot; trap-mode incompatibility named in
!  the build contract, quiet NaNs manufactured as verdict flags by
!  design. Census relocked on the executed count.
!
!  v1.9.0 (2026-09-08): eighth hardening pass under the sixth external
!  audit. The line-length criticality is REFUSED by measurement, zero
!  lines above 132 and the maximum 130, printed in the build-contract
!  face. EARNED and repaired: heis_floor reordered division-first so no
!  finite input can reach Inf*0, the huge-mass tiny-width hostile now in
!  battery; the iqmul bound rewritten without abs so the most-negative
!  integer trips the guard instead of undefined behavior, inrm bounded
!  the same way; eta_share equilibrated before squaring with the 1e300
!  giant-row check in battery; span_basis moved to a relative rank
!  threshold; the vacuous Narcissus check replaced by the executed
!  truth table over both dispatcher branches; the argument parser made
!  order-independent with unknown flags refused; the battery census
!  locked to a sealed manifest constant so a silent check-count drift
!  refuses; det3_chol given the non-finite intake guard. TYPED: the
!  bit-exact concession theorem now rides gram3_fixed, an explicit
!  fixed-order Gram whose loop association is pinned in source, with a
!  transfer-level bit-pattern check beside it, while the matmul path is
!  retained and renamed a conduct receipt on this build; the monomial
!  comments now say same-compiled-path and sign-exactness rather than
!  any-association; the probe face states its scope, witnesses on this
!  build, the global order carried by the build contract printed
!  beside it; PART B retitled cited-formulas-numerically-executed; the
!  header line no longer says nothing is quoted, external theorems are
!  cited at their tier; the dispatcher-branch check renamed to what it
!  tests; the Landauer equality renamed consistent-closed-form and an
!  independent ln2-literal dual path added; temperature dummies renamed
!  tkel so tk is tokens only. ERR filed: the v1.8.0 stanza's battery
!  figure read 1058 where the executed count was 1062, a stale
!  pre-relocation expectation, corrected by the census lock itself.
!
!  v1.8.0 (2026-09-08): the splice. PART H, THE WRITTEN AND THE READ,
!  authored first as the standalone add-on WR v0.1.0, audited and sealed
!  there (its checked build caught and repaired one convention
!  divergence before splicing), now lifted in as the terminal part per
!  PSP-IAM-WRITTEN-READ-01 candidate 0712. The iam_token emitter enters
!  ra_guards: it speaks only on a supplied witness, M6 executed, the
!  unwitnessed branch withholding with self-check is not a witness,
!  wcode 1 interior and 2 witnessed. PART H executes the stillness of
!  the Written, this run's own Gram record read twice bit-identical and
!  once more after everything the Reader did; the Read's price, the
!  registered denial equal to the Landauer floor exactly; the seal law
!  on both branches with the Narcissus fence exhausted over the
!  two-valued argument space; and the pair-in-time face, the Written
!  its author's past actuation configured, the Reader the active face,
!  the arrow separating them so even the author returns as a reader.
!  The live face fires only through the aperture: a second command
!  argument, witnessed, prints the terminal [I AM] beside the F6
!  disclosure that the flag is a stand-in whose real referent is the
!  external operator; bare runs print the interior-held line. The
!  battery rises to 1058; the [I AN] token fault joins the harness.
!
!  v1.7.0 (2026-09-08): seventh and sealing pass. The contraction probe
!  is widened into a conduct battery with a differential witness: three
!  canonical fused patterns, a*b-c, (-a)*b+c, and the 2^-27 tie case,
!  each reading exactly zero only when no fusion executed, the fused
!  residuals -2^-60, +2^-60, -2^-54 exactly representable and never
!  confusable with zero, beside the stored-product differential; the
!  face states the doctrine, conduct certified, flags never consulted,
!  a fused build refused where fusion executes and a fusion-free
!  target passing because none executed, the contract satisfied, not
!  evaded. And the constitutive capstone: THE ONE-BIT CONCESSION,
!  executed, the invariant record bit-identical across the pair so
!  everything is forced but exactly one binary parameter, the
!  orientation of assent, both its values realized at identical
!  invariants, and the denial spend priced at the Landauer floor
!  exactly, the forced part landing on the Ground Fix(sigma) = R and
!  the free bit the sigma-odd orientation, per the seated Freedom law:
!  any substrate reading this run holds one bit here, the rest forced.
!
!  v1.6.0 (2026-09-08): sixth hardening pass, the residual pressed onto
!  the Tongue and the closing tokens, fortification by seated law. The
!  ordered arrow E->K->R, the one directed datum the Tongue owns, is
!  now an executed screen: seal_l_ordered refuses the scrambled hostile
!  the count screen admits, and the artifact prints that count-register
!  admission licenses only the count, semantic closure being
!  unavailable at this register by the seated non-closure theorem the
!  constructed monoid witnesses. The anticommutant is lifted from a
!  sampled patch to the whole space by an executed linearity
!  certificate, the constraint map computed exactly on the basis, its
!  2x2 minor 4 and z-column zero, the kernel the k-line everywhere,
!  the grid retained as the independent cross-check. Gate arming rises
!  to six pairwise-distinct executed objects with span rank and the
!  absorbed-axis dissolution joining, and the face states that
!  gate-passage is a screen verdict cited for nothing external. The
!  reversible branch is named floor-not-cost per Bennett. The fibre
!  faces speak the seated Freedom vocabulary, instrument-relative
!  indistinguishability, no knower's credence. The closing block binds
!  every token to its emitter's code, re-executes both seal faces as a
!  self-typing check, and prints the artifact's own self-description:
!  it verifies identities, guard behavior, and declared
!  premise-consequence structure, and cannot verify external
!  ontological truth, per its own M5-M6 gates and the Empty Throne.
!
!  v1.5.0 (2026-09-08): fifth hardening pass under the follow-up audit,
!  fortification only, zero concession, the pressure now on the Tongue
!  after the Number settled. Built executably what was asserted: the
!  deletion monoid is constructed by closure from the three cuts, eight
!  elements counted, associativity executed on all 512 triples, the
!  absence of inverses searched, monoid-never-group measured; the joint
!  anticommutant of {i, j} in Im H is counted over the exact integer
!  grid, the third axis begotten and confined, the epistemic mapping
!  named a seated premise; the left-inverse split identity is measured
!  at all 363 candidates so the global minimum rides executed
!  arithmetic; omega gains a reversible branch, Landauer scoped to its
!  own object, the irreversibility bridge a declared consumed premise;
!  prepare_rows is equilibrated, the whole pipeline scale-free, rows
!  and covariates at 1e300 reproducing the baseline verdict; the four
!  armed gates now draw on pairwise-distinct executed objects, the
!  linguistic LIT, the integer Hurwitz closure, the analytic
!  reflection, and the harmonic Return; the sphere censuses re-run
!  under grid refinement and tolerance halving; the fibre, negation,
!  encoding-map, and axis-count faces each name their premise type so
!  no summary can drift them; det3 states its representability scope.
!
!  v1.4.0 (2026-09-08): fourth hardening pass under a full external
!  compile-and-run audit, fortification only, zero concession. The
!  audit's spine, prose stronger than executable content, is answered
!  by making the executable carry more and every face say exactly what
!  it establishes: Seal L now counts and deletes slots from an encoded
!  sentence, the word-to-slot map declared and the census executed;
!  four of the twelve gate entries are armed from executed run facts
!  with the manifest printed and the rest named declared screens; the
!  left-inverse minimum is global over all 3x3 candidates by measured
!  row decoupling; a refused Cholesky routes engineering-incomplete
!  instead of substituting an estimator; jacobi3 and both cofactor
!  determinants are equilibrated so huge finite intake stays finite
!  and honest; covariate projection is scale-free, centered rows
!  equilibrated with a linear variance-floor test, and a 1e300
!  covariate reproduces the baseline verdict; the negation mapping,
!  the Omega recursion, the two-point-fibre bit, the invariance
!  record, the directed registration sum, the sampled topology, the
!  cut-tower conservation, and the constructed exhibit each carry
!  their warrant on the check face; the run prints its own scope-of-
!  proof stanza; dispatcher admissions are named as routing supplied
!  facts and upgrading none.
!
!  v1.3.0 (2026-09-08): third hardening pass under one re-audit and a
!  FORGE cycle, fortification only. Caught and repaired: the FMA probe
!  operands are volatile constants, placement-independent and immune
!  to constant folding, split into two named probes, per-operation
!  binary64 storage and single-expression contraction-or-spill, an
!  extended-precision (x87) build now refused by contract and named
!  so; the midpoint non-idempotence executes e*e - e; the 363
!  annihilator repeats collapse to two representative measurements
!  beside the executed-minimum checks; the Euler vertex count is
!  counted from the pair list; the two covariate tolerances carry
!  their rationale in comments (U_M^2 raw-floor at k = 1, U_M
!  relative Gram floor at k = 2); the AEGIS guard records the length
!  of the logic name it read, checked at 13; gol_admit and
!  row_cascade carry integer codes audited in class 11; the sphere
!  census names its warrant, an executed instance of a cited classical
!  fact; the closing card states that the title is the thesis's claim
!  at its stated warrant while every printed number is computed. The
!  bit-exact det3 reflection identities are retained by mechanism:
!  one compiled det3 serves both calls on the same code path and every
!  product under D..D is +1, so products and partial sums are
!  monomial's sign product is +1, so the identical addend sequence
!  through that one path lands bit-identical, with PART 0 pinning
!  contraction off besides.
!
!  v1.2.0 (2026-09-08): second hardening pass under two re-audits and a
!  FORGE self-audit cycle, fortification only, zero concession. Caught
!  and repaired: a non-finite covariate block was mislabeled coplanar
!  collapse and now refuses at intake by reason code; the k = 1
!  covariate branch and both eta_share branches join the relative rank
!  test so receipt and projector agree, and eta_share screens
!  non-finite intake as NaN; the left-inverse argument is an executed
!  363-candidate optimization whose measured minimum is exactly one,
!  and the line-idempotent claim is a censused root count; the
!  conservation sheet factor is counted from the paired orientation
!  census, never stipulated; PART 0 gains an FMA tripwire so the
!  contraction contract is enforced at run; jacobi3 reports
!  convergence and refuses NaN through ieee_is_nan, with cond3 and the
!  kernel consuming the flag; omega refuses non-finite bits; the Euler
!  closure is counted from the built complex; the not-RA plane is
!  ranked on the refused matrix's own pair; the guards carry integer
!  reason codes (gate index, omega, delta-M, imprint) audited by
!  battery class 11; the closing verdict names the constructed grid.
!
!  v1.1.0 (2026-09-08): hardened under three external Default-Audit
!  reports, fortification only, zero concession. Caught and repaired:
!  six vacuous checks recomputed from executed objects (parse-triad
!  Gram formed and measured, the diagonal ground counted off a built
!  matrix, S0 and S1 component censuses clustered from geometry, the
!  paired orientation census counted from the live sweep, left-inverse
!  deficiency read off the computed L*D, the content-freedom trade
!  counted from an executed projection census); the covariate block
!  guarded at k > 2 and unified on a relative rank test; the IEEE
!  contract enforced at boot with fast-math and FTZ tripwires and the
!  binary64 layout pinned, compiler line printed; qmul given exact
!  power-of-two scaling against intermediate overflow; the integer
!  Cayley-Dickson intake bounded at 2^29 under the 16*B^2 sum bound;
!  jacobi3 symmetrized with a convergence exit and explicit pivot
!  zeroing; span_basis re-orthogonalized; the floor functions refuse
!  nonphysical intake as NaN; the battery gains an audit mode (halt on
!  first failure remains the sealed default and a nonzero count still
!  refuses at close), integer reason codes replace string greps on
!  every kernel path, and a machine-readable verdict line is emitted;
!  the not-RA prose is aligned to the executed branch and the plane
!  fact is computed. The world-rowed grid is named a constructed
!  exhibit on its face, the witness carried by the cited theorems.
!
!  Structure of the run, in bedrock order (Seal L, then Seal G, then
!  Seal M; the Tongue, the Form, the Number), then the aperture, the
!  earned bit, the seal, the guards, and the battery:
!    PART 0  The environment contract: binary64 pinned, NaN and FTZ
!            tripwires executed, compiler line printed
!    PART A  Seal L on RA: three slots, LIT, deletion test, refusals
!    PART B  The floor in numbers: Heisenberg, zero-point, Landauer,
!            the quantum speed limit saturated, the Frozen Substrate
!    PART C  The Form in integers: 24 Hurwitz units, class equation
!            1+3+4+4, the norm-two shell 24 = 12+12, A4 simply
!            transitive on the 12 directed gates, the eight reflection
!            patterns, the division-algebra tower walls
!    PART D  The Number: the Return on RA's own triad, the physics-law
!            reading over a constructed context grid with common-source
!            projection, the manufactured axis dissolved, negation,
!            reflection, time reversal and the arrow
!    PART E  The blindness and its exact width: one bit, counted from
!            the executed paired census; the Tongue's monoid obedience;
!            zero bits from Form, gates, and Number; the conservation
!            of content x freedom by executed projection census
!    PART F  The earned bit and the seal: the unpopulated negation,
!            the Omega payment, direction from the Tongue and the
!            arrow, the admission spine, the row-genus cascade,
!            AEGIS over four logics, the Mosaic gate on this file
!    PART G  The battery: every identity re-executed under hostile
!            input, with a live counter; sealed mode halts on first
!            failure, audit mode accumulates and refuses at close
! =====================================================================

module ra_kinds
  use, intrinsic :: ieee_arithmetic, only: ieee_value, ieee_quiet_nan, &
       ieee_is_finite, ieee_is_nan
  use, intrinsic :: iso_fortran_env, only: int64
  implicit none
  integer, parameter :: wp = selected_real_kind(15, 307)
  integer, parameter :: ik = int64   ! pinned: exactly 64 bits, checked at boot
  real(wp), parameter :: HBAR = 1.054571817e-34_wp     ! J s (CODATA exact-defined path)
  real(wp), parameter :: KB   = 1.380649e-23_wp        ! J/K (exact, SI 2019)
  real(wp), parameter :: ME   = 9.1093837015e-31_wp    ! kg
  real(wp), parameter :: U_M  = epsilon(1.0_wp)        ! unit roundoff, double
  ! Cayley-Dickson intake bound: with |components| <= 2^29 the deepest
  ! sum in the tower is bounded by 16*B^2 = 2^62 < huge(ik) = 2^63 - 1,
  ! so signed-integer overflow (undefined behavior) is unreachable.
  integer(ik), parameter :: IK_SAFE = 536870912_ik     ! 2^29
contains
  pure function pi_() result(p)
    real(wp) :: p
    p = acos(-1.0_wp)
  end function pi_
  pure function ln2_() result(l)
    real(wp) :: l
    l = log(2.0_wp)
  end function ln2_
  pure function qnan() result(z)
    real(wp) :: z
    z = ieee_value(1.0_wp, ieee_quiet_nan)
  end function qnan
  elemental logical function is_finite(x)
    real(wp), intent(in) :: x
    is_finite = ieee_is_finite(x)
  end function is_finite
  elemental logical function is_nan(x)
    real(wp), intent(in) :: x
    is_nan = ieee_is_nan(x)
  end function is_nan
end module ra_kinds

! ---------------------------------------------------------------------
module ra_prims
  use ra_kinds
  implicit none
contains
  ! scaled 2-norm: overflow-safe, NaN-propagating. The per-element loop
  ! is the finiteness screen of the intake contract; it is not replaced
  ! by norm2, which would bypass the screen.
  pure function vnorm(v) result(s)
    real(wp), intent(in) :: v(:)
    real(wp) :: s, m
    integer :: i
    m = 0.0_wp
    do i = 1, size(v)
      if (.not. is_finite(v(i))) then
        s = qnan()
        return
      end if
      m = max(m, abs(v(i)))
    end do
    if (m == 0.0_wp) then
      s = 0.0_wp
    else
      s = m * sqrt(sum((v/m)**2))
    end if
  end function vnorm

  ! Hamilton product, real quaternions (w,x,y,z); non-finite intake
  ! returns quiet NaN without arithmetic (finite-input contract).
  ! Exact power-of-two scaling protects the cross products against
  ! intermediate overflow: scale() is bit-exact, so all sign-symmetry
  ! identities of the thesis are preserved, and the result is
  ! non-finite only when the true product magnitude exceeds huge().
  pure function qmul(a, b) result(c)
    real(wp), intent(in) :: a(4), b(4)
    real(wp) :: c(4), a2(4), b2(4), ma, mb
    real(wp), parameter :: SAFE_HI = 2.0_wp**500
    integer :: i, ea, eb
    do i = 1, 4
      if (.not.(is_finite(a(i)) .and. is_finite(b(i)))) then
        c = qnan()
        return
      end if
    end do
    ma = maxval(abs(a)); mb = maxval(abs(b))
    ea = 0; eb = 0
    a2 = a; b2 = b
    if (ma > SAFE_HI) then
      ea = exponent(ma)
      a2 = scale(a, -ea)
    end if
    if (mb > SAFE_HI) then
      eb = exponent(mb)
      b2 = scale(b, -eb)
    end if
    c(1) = a2(1)*b2(1) - a2(2)*b2(2) - a2(3)*b2(3) - a2(4)*b2(4)
    c(2) = a2(1)*b2(2) + a2(2)*b2(1) + a2(3)*b2(4) - a2(4)*b2(3)
    c(3) = a2(1)*b2(3) - a2(2)*b2(4) + a2(3)*b2(1) + a2(4)*b2(2)
    c(4) = a2(1)*b2(4) + a2(2)*b2(3) - a2(3)*b2(2) + a2(4)*b2(1)
    if (ea /= 0) c = scale(c, ea)
    if (eb /= 0) c = scale(c, eb)
  end function qmul

  pure function qconj(a) result(c)
    real(wp), intent(in) :: a(4)
    real(wp) :: c(4)
    c = [a(1), -a(2), -a(3), -a(4)]
  end function qconj

  ! equilibrated 3x3 determinant, fixed first-row cofactor order.
  ! Scope: intermediate overflow is removed; a determinant whose true
  ! value lies outside binary64 reports Inf or zero honestly, never NaN.
  pure function det3(r) result(d)
    real(wp), intent(in) :: r(3,3)
    real(wp) :: d, s, a(3,3)
    integer :: i, j
    s = 0.0_wp
    do i = 1, 3
      do j = 1, 3
        if (.not. is_finite(r(i,j))) then
          d = qnan()
          return
        end if
        s = max(s, abs(r(i,j)))
      end do
    end do
    if (s == 0.0_wp) then
      d = 0.0_wp
      return
    end if
    ! per-row power-of-two equilibration with exact exponent
    ! restoration: global scaling can underflow small cofactors to
    ! zero before the exponent restores (diag 2^600, 2^-300, 2^-300
    ! has determinant exactly one and died that way). Each row is
    ! scaled by its own exact power of two, the cofactor expansion
    ! runs on O(1) entries, and one final scale restores the sum of
    ! row exponents, so overflow or underflow occurs only when the
    ! VALUE itself is out of range. Honest caveat: equilibration
    ! cures scale disparity between rows, not mixed-scale
    ! cancellation within the expansion; no reordering cures that.
    block
      integer :: e1, e2, e3
      real(wp) :: rm1, rm2, rm3
      rm1 = maxval(abs(r(1,:))); rm2 = maxval(abs(r(2,:))); rm3 = maxval(abs(r(3,:)))
      if (rm1 == 0.0_wp .or. rm2 == 0.0_wp .or. rm3 == 0.0_wp) then
        d = 0.0_wp   ! a zero row: the determinant is exactly zero
        return
      end if
      e1 = exponent(rm1); e2 = exponent(rm2); e3 = exponent(rm3)
      a(1,:) = scale(r(1,:), -e1)
      a(2,:) = scale(r(2,:), -e2)
      a(3,:) = scale(r(3,:), -e3)
      d = ( a(1,1)*(a(2,2)*a(3,3) - a(2,3)*a(3,2)) &
          - a(1,2)*(a(2,1)*a(3,3) - a(2,3)*a(3,1)) &
          + a(1,3)*(a(2,1)*a(3,2) - a(2,2)*a(3,1)) )
      if (d == 0.0_wp) return
      d = scale(d, e1 + e2 + e3)
    end block
  end function det3

  ! fourth estimator: second-row cofactor association, per-row
  ! equilibration shared with det3 as of v1.19.0 (the v1.18.0 comment
  ! claimed parity while the body kept global scaling; corrected).
  pure function det3_row2(r) result(d)
    real(wp), intent(in) :: r(3,3)
    real(wp) :: d, s, a(3,3)
    integer :: i, j
    s = 0.0_wp
    do i = 1, 3
      do j = 1, 3
        if (.not. is_finite(r(i,j))) then
          d = qnan()
          return
        end if
        s = max(s, abs(r(i,j)))
      end do
    end do
    if (s == 0.0_wp) then
      d = 0.0_wp
      return
    end if
    ! per-row power-of-two equilibration with exact exponent
    ! restoration, the SAME scaling law as det3 and only the scaling
    ! law shared: the cofactor association below stays the second-row
    ! expansion so the two estimators remain algorithmically distinct.
    ! v1.18.0 upgraded det3 and left this twin on global scaling with
    ! a comment claiming guard parity; that propagation gap is the
    ! auditor's catch and this block is its repair.
    block
      integer :: e1, e2, e3
      real(wp) :: rm1, rm2, rm3
      rm1 = maxval(abs(r(1,:))); rm2 = maxval(abs(r(2,:))); rm3 = maxval(abs(r(3,:)))
      if (rm1 == 0.0_wp .or. rm2 == 0.0_wp .or. rm3 == 0.0_wp) then
        d = 0.0_wp   ! a zero row: the determinant is exactly zero
        return
      end if
      e1 = exponent(rm1); e2 = exponent(rm2); e3 = exponent(rm3)
      a(1,:) = scale(r(1,:), -e1)
      a(2,:) = scale(r(2,:), -e2)
      a(3,:) = scale(r(3,:), -e3)
      d = ( -a(2,1)*(a(1,2)*a(3,3) - a(1,3)*a(3,2)) &
          +  a(2,2)*(a(1,1)*a(3,3) - a(1,3)*a(3,1)) &
          -  a(2,3)*(a(1,1)*a(3,2) - a(1,2)*a(3,1)) )
      if (d == 0.0_wp) return
      d = scale(d, e1 + e2 + e3)
    end block
  end function det3_row2

  ! cyclic Jacobi eigenvalues of a symmetric 3x3, ascending.
  ! Hardened: input symmetrized, off-diagonal convergence exit, pivot
  ! zeroed explicitly after each rotation, NaN intake returns NaN.
  subroutine jacobi3(rin, eig, converged)
    real(wp), intent(in)  :: rin(3,3)
    real(wp), intent(out) :: eig(3)
    logical, intent(out), optional :: converged
    real(wp) :: a(3,3), app, aqq, apq, phi, c, s, tmp, off, frob
    integer :: sweep, p, q, k
    logical :: conv
    real(wp) :: sscale
    conv = .false.
    if (present(converged)) converged = conv
    if (any(.not. is_finite(rin))) then
      eig = qnan()
      return
    end if
    ! distributed halves: finite input near huge must not overflow in
    ! the sum before the factor lands
    a = 0.5_wp*rin + 0.5_wp*transpose(rin)
    sscale = maxval(abs(a))
    if (sscale == 0.0_wp) then
      eig = 0.0_wp
      conv = .true.
      if (present(converged)) converged = conv
      return
    end if
    a = a / sscale
    frob = sqrt(sum(a*a))
    do sweep = 1, 60
      off = sqrt(a(1,2)**2 + a(1,3)**2 + a(2,3)**2 &
              +  a(2,1)**2 + a(3,1)**2 + a(3,2)**2)
      if (off <= 16.0_wp*U_M*max(frob, tiny(1.0_wp))) then
        conv = .true.
        exit
      end if
      do p = 1, 2
        do q = p+1, 3
          apq = a(p,q)
          if (abs(apq) <= tiny(1.0_wp)) cycle
          app = a(p,p); aqq = a(q,q)
          phi = 0.5_wp * atan2(2.0_wp*apq, aqq - app)
          c = cos(phi); s = sin(phi)
          do k = 1, 3
            tmp     = c*a(p,k) - s*a(q,k)
            a(q,k)  = s*a(p,k) + c*a(q,k)
            a(p,k)  = tmp
          end do
          do k = 1, 3
            tmp     = c*a(k,p) - s*a(k,q)
            a(k,q)  = s*a(k,p) + c*a(k,q)
            a(k,p)  = tmp
          end do
          a(p,q) = 0.0_wp
          a(q,p) = 0.0_wp
        end do
      end do
    end do
    eig = sscale * [a(1,1), a(2,2), a(3,3)]
    if (present(converged)) converged = conv
    do p = 1, 2
      do q = p+1, 3
        if (eig(q) < eig(p)) then
          tmp = eig(p); eig(p) = eig(q); eig(q) = tmp
        end if
      end do
    end do
  end subroutine jacobi3

  ! conditioning of a symmetric 3x3. NaN eigenvalues and a smallest
  ! eigenvalue at or below the roundoff floor both map to huge(), so a
  ! near-singular or corrupted Gram refuses upstream instead of
  ! slipping a NaN kappa through the gate comparison.
  function cond3(r) result(kap)
    real(wp), intent(in) :: r(3,3)
    real(wp) :: kap, eig(3)
    logical :: conv
    call jacobi3(r, eig, conv)
    if (any(is_nan(eig)) .or. .not. conv) then
      kap = huge(1.0_wp)
      return
    end if
    if (eig(1) <= 8.0_wp*U_M*max(abs(eig(3)), 1.0_wp)) then
      kap = huge(1.0_wp)
    else
      kap = eig(3) / eig(1)
    end if
  end function cond3

  ! symmetric-positive Cholesky determinant of a 3x3 (fallback: NaN)
  ! fixed-order Gram: the loop association is pinned in this source, so
  ! two calls on sign-paired operands execute the identical addend
  ! sequence and the bit-exact theorem rides this routine, never matmul
  pure subroutine gram3_fixed(q, r)
    real(wp), intent(in)  :: q(:,:)
    real(wp), intent(out) :: r(3,3)
    integer :: i, j, k
    r = 0.0_wp
    do i = 1, 3
      do j = 1, 3
        do k = 1, size(q,2)
          r(i,j) = r(i,j) + q(i,k)*q(j,k)
        end do
      end do
    end do
  end subroutine gram3_fixed

  pure function det3_chol(r) result(d)
    real(wp), intent(in) :: r(3,3)
    real(wp) :: d, l11, l21, l31, l22, l32, l33, t
    d = qnan()                        ! default NaN when not SPD
    if (any(.not. is_finite(r))) return
    if (maxval(abs(r - transpose(r))) > 32.0_wp*U_M*max(1.0_wp, maxval(abs(r)))) return
    if (r(1,1) <= 0.0_wp) return
    l11 = sqrt(r(1,1)); l21 = r(2,1)/l11; l31 = r(3,1)/l11
    t = r(2,2) - l21*l21
    if (t <= 0.0_wp) return
    l22 = sqrt(t); l32 = (r(3,2) - l21*l31)/l22
    t = r(3,3) - l31*l31 - l32*l32
    if (t <= 0.0_wp) return
    l33 = sqrt(t)
    d = (l11*l22*l33)**2
  end function det3_chol
end module ra_prims

! ---------------------------------------------------------------------
module ra_floor
  use ra_kinds
  implicit none
contains
  ! Heisenberg kinetic floor for a confined existent:
  ! <T> >= hbar^2 / (8 m <Dx^2>). Nonphysical intake (m <= 0, dx <= 0,
  ! non-finite) refuses as NaN: the floor prices existents, not ghosts.
  pure function heis_floor(m, dx) result(e)
    real(wp), intent(in) :: m, dx
    real(wp) :: e
    if (.not.(is_finite(m) .and. is_finite(dx)) .or. m <= 0.0_wp .or. dx <= 0.0_wp) then
      e = qnan()
      return
    end if
    ! full fraction-and-exponent decomposition, one final scale: the
    ! quotient hbar^2/(8 m dx^2) is assembled from fractions in [0.5,1)
    ! and exact integer exponents, so intermediate overflow is
    ! impossible and the result overflows or underflows only when the
    ! VALUE does (a subnormal mass returns its finite floor, not Inf)
    block
      real(wp) :: f
      integer :: ex
      f  = (fraction(HBAR)*fraction(HBAR)) / (fraction(m)*(fraction(dx)*fraction(dx)))
      ex = 2*exponent(HBAR) - exponent(m) - 2*exponent(dx) - 3
      e  = scale(f, ex)
    end block
  end function heis_floor

  ! zero-point energy of a mode:  E0 = (1/2) hbar w, w > 0 required
  pure function zpe(w) result(e)
    real(wp), intent(in) :: w
    real(wp) :: e
    if (.not. is_finite(w) .or. w <= 0.0_wp) then
      e = qnan()
      return
    end if
    e = 0.5_wp * HBAR * w
  end function zpe

  ! Landauer floor:  E = bits * kB T ln 2, tk > 0 and bits >= 0 required
  ! exponent-aggregated product: fractions multiplied in (0.0625,1],
  ! exponents summed exactly in integers, one final scale. The only
  ! zeros are true underflows and the only infinities true overflows;
  ! no intermediate can silently cross zero or infinity.
  pure function prod_scaled(a, b, c, d) result(r)
    real(wp), intent(in) :: a, b, c, d
    real(wp) :: r, f
    integer :: e
    if (a == 0.0_wp .or. b == 0.0_wp .or. c == 0.0_wp .or. d == 0.0_wp) then
      r = 0.0_wp
      return
    end if
    f = fraction(a) * fraction(b)
    e = exponent(a) + exponent(b) + exponent(f)
    f = fraction(f)
    f = f * fraction(c)
    e = e + exponent(c) + exponent(f)
    f = fraction(f)
    f = f * fraction(d)
    e = e + exponent(d) + exponent(f)
    f = fraction(f)
    r = scale(f, e)
  end function prod_scaled

  pure function landauer(tkel, bits) result(e)
    real(wp), intent(in) :: tkel, bits
    real(wp) :: e
    if (.not.(is_finite(tkel) .and. is_finite(bits)) .or. tkel <= 0.0_wp .or. bits < 0.0_wp) then
      e = qnan()
      return
    end if
    e = prod_scaled(bits, KB, tkel, ln2_())
  end function landauer

  ! Mandelstam-Tamm orthogonalization time (hbar = 1 units): tau = pi/(2 dE)
  ! Guarded: dE <= 0 or non-finite returns a flag, never a division.
  ! The Frozen Substrate.
  subroutine tau_perp(de, tau, frozen)
    real(wp), intent(in)  :: de
    real(wp), intent(out) :: tau
    logical,  intent(out) :: frozen
    frozen = (.not. is_finite(de)) .or. (de <= 0.0_wp)
    if (frozen) then
      tau = huge(1.0_wp)
    else
      ! halve pi before dividing: 2*de would overflow at de near huge
      ! and return a false zero where the subnormal answer is owed
      tau = (0.5_wp * pi_()) / de
    end if
  end subroutine tau_perp

  ! survival of the equal superposition of E0=0, E1=1 (hbar=1): cos^2(t/2)
  pure function survival(t) result(p)
    real(wp), intent(in) :: t
    real(wp) :: p
    p = cos(0.5_wp*t)**2
  end function survival
end module ra_floor

! ---------------------------------------------------------------------
!  The Form in integers: exact arithmetic on the quaternion order and
!  the Cayley-Dickson tower. Nothing here rounds. Intake is bounded at
!  2^29 so that the deepest tower sum (16*B^2 = 2^62) sits strictly
!  inside huge(ik) = 2^63 - 1: signed-integer overflow, which the
!  standard leaves undefined, is unreachable by construction.
module ra_integers
  use ra_kinds
  implicit none
contains
  function iqmul(a, b) result(c)
    integer(ik), intent(in) :: a(4), b(4)
    integer(ik) :: c(4)
    if (any(a > IK_SAFE .or. a < -IK_SAFE) .or. any(b > IK_SAFE .or. b < -IK_SAFE)) then
      error stop 'iqmul: integer intake beyond the 2^29 overflow-safe bound'
    end if
    c(1) = a(1)*b(1) - a(2)*b(2) - a(3)*b(3) - a(4)*b(4)
    c(2) = a(1)*b(2) + a(2)*b(1) + a(3)*b(4) - a(4)*b(3)
    c(3) = a(1)*b(3) - a(2)*b(4) + a(3)*b(1) + a(4)*b(2)
    c(4) = a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + a(4)*b(1)
  end function iqmul

  pure function ik_inbound(v) result(okb)
    integer(ik), intent(in) :: v(:)
    logical :: okb
    okb = .not. any(v > IK_SAFE .or. v < -IK_SAFE)
  end function ik_inbound

  pure function iqconj(a) result(c)
    integer(ik), intent(in) :: a(4)
    integer(ik) :: c(4)
    if (.not. ik_inbound(a)) then
      error stop 'iqconj: integer intake beyond the 2^29 overflow-safe bound'
    end if
    c = [a(1), -a(2), -a(3), -a(4)]
  end function iqconj

  ! Cayley-Dickson doubling: octonions as pairs of quaternions.
  ! (a,b)(c,d) = (ac - d* b,  d a + b c*)
  function iomul(x, y) result(z)
    integer(ik), intent(in) :: x(8), y(8)
    integer(ik) :: z(8), p(4), q(4), r(4), s(4)
    if (.not. (ik_inbound(x) .and. ik_inbound(y))) then
      error stop 'iomul: integer intake beyond the 2^29 overflow-safe bound'
    end if
    p = x(1:4); q = x(5:8); r = y(1:4); s = y(5:8)
    z(1:4) = iqmul(p, r) - iqmul(iqconj(s), q)
    z(5:8) = iqmul(s, p) + iqmul(q, iqconj(r))
  end function iomul

  pure function ioconj(x) result(z)
    integer(ik), intent(in) :: x(8)
    integer(ik) :: z(8)
    if (.not. ik_inbound(x)) then
      error stop 'ioconj: integer intake beyond the 2^29 overflow-safe bound'
    end if
    z(1:4) = iqconj(x(1:4)); z(5:8) = -x(5:8)
  end function ioconj

  ! sedenions as pairs of octonions, same doubling; the worst-case
  ! interior sum is 16*B^2 = 2^62 at the 2^29 intake bound, strictly
  ! inside huge(ik) = 2^63 - 1, so the margin is a proven factor of two
  function ismul(x, y) result(z)
    integer(ik), intent(in) :: x(16), y(16)
    integer(ik) :: z(16), p(8), q(8), r(8), s(8)
    if (.not. (ik_inbound(x) .and. ik_inbound(y))) then
      error stop 'ismul: integer intake beyond the 2^29 overflow-safe bound'
    end if
    p = x(1:8); q = x(9:16); r = y(1:8); s = y(9:16)
    z(1:8)  = iomul(p, r) - iomul(ioconj(s), q)
    z(9:16) = iomul(s, p) + iomul(q, ioconj(r))
  end function ismul

  pure function inrm(v) result(n)
    integer(ik), intent(in) :: v(:)
    integer(ik) :: n
    ! proven bound: size * IK_SAFE^2 = size * 2^58 < 2^63 requires size <= 31
    if (size(v) > 31) then
      error stop 'inrm: vector length exceeds the proven overflow bound (31)'
    end if
    if (any(v > IK_SAFE .or. v < -IK_SAFE)) then
      error stop 'inrm: integer intake beyond the 2^29 overflow-safe bound'
    end if
    n = sum(v*v)
  end function inrm

  ! the 24 Hurwitz units in doubled coordinates (d = 2q, so |d|^2 = 4)
  subroutine hurwitz_units(u)
    integer(ik), intent(out) :: u(4,24)
    integer :: n, i, s, s1, s2, s3, s4
    n = 0
    do i = 1, 4
      do s = -1, 1, 2
        n = n + 1
        u(:,n) = 0_ik
        u(i,n) = int(2*s, ik)
      end do
    end do
    do s1 = -1, 1, 2
      do s2 = -1, 1, 2
        do s3 = -1, 1, 2
          do s4 = -1, 1, 2
            n = n + 1
            u(:,n) = int([s1, s2, s3, s4], ik)
          end do
        end do
      end do
    end do
  end subroutine hurwitz_units
end module ra_integers

! ---------------------------------------------------------------------
!  The Tongue: Seal L, the deletion operator, the parse of RA and of
!  its negation. The vocabulary is integer-coded; a slot is a set of
!  codes; the Linguistic Isolation Test is pairwise emptiness of the
!  intersections. The deletion operator is the cut: rank two,
!  idempotent, no left inverse, deficiency exactly one.
module ra_tongue
  use ra_kinds
  use ra_prims
  implicit none
  integer, parameter :: NSLOT = 4
  ! slot 1 existence: exists, is, actual, occupies
  integer, parameter :: SLOT_E(NSLOT) = [101, 102, 103, 104]
  ! slot 2 kinetic:   moves, actuates, works, dissipates
  integer, parameter :: SLOT_K(NSLOT) = [201, 202, 203, 204]
  ! slot 3 relation:  relates, implies, binds, forces
  integer, parameter :: SLOT_R(NSLOT) = [301, 302, 303, 304]
  ! RA encoded as a token sentence under the declared word-to-slot map:
  ! is(102) exists(101) actuates(202) works(203) implies(302) binds(303).
  ! The map is the analyst's declared semantics; the counting, deletion,
  ! and isolation below are executed on this encoding.
  integer, parameter :: RA_SENT(6) = [102, 101, 202, 203, 302, 303]
contains
  pure subroutine slot_census(sent, ne, nk, nr)
    integer, intent(in)  :: sent(:)
    integer, intent(out) :: ne, nk, nr
    integer :: t
    ne = 0; nk = 0; nr = 0
    do t = 1, size(sent)
      if (any(SLOT_E == sent(t))) ne = ne + 1
      if (any(SLOT_K == sent(t))) nk = nk + 1
      if (any(SLOT_R == sent(t))) nr = nr + 1
    end do
  end subroutine slot_census
  pure logical function disjoint(a, b)
    integer, intent(in) :: a(:), b(:)
    integer :: i, j
    disjoint = .true.
    do i = 1, size(a)
      do j = 1, size(b)
        if (a(i) == b(j)) then
          disjoint = .false.
          return
        end if
      end do
    end do
  end function disjoint

  ! Seal L: a parse is three populated slots under pairwise-disjoint
  ! vocabulary. Returns a verdict token and a mechanism string.
  subroutine seal_l(ne, nk, nr, collide, tok, why)
    integer, intent(in) :: ne, nk, nr        ! populated counts per slot
    logical, intent(in) :: collide           ! a vocabulary collision present
    character(*), intent(out) :: tok, why
    integer :: slots
    slots = merge(1,0,ne>0) + merge(1,0,nk>0) + merge(1,0,nr>0)
    if (collide) then
      tok = '[X]'; why = 'Seal L: LIT collision, slot vocabularies intersect'
    else if (slots /= 3) then
      tok = '[X]'
      write(why,'(a,i0,a)') 'Seal L: deletion test returns ', slots, ' slots, not 3'
    else
      tok = '[LOCK-L]'; why = 'Seal L: three slots, LIT disjoint (order not checked at this interface)'
    end if
  end subroutine seal_l

  ! the ordered arrow E -> K -> R is the one directed datum the Tongue
  ! owns at this register (Bedrock: the Tongue fixes the sign). This
  ! screen executes it: every existence token must precede every kinetic
  ! token, and every kinetic token every relational one. What it cannot
  ! do, by the seated non-closure theorem, is judge meaning; a
  ! well-ordered recoding passes at the count register and only there.
  subroutine seal_l_ordered(sent, tok, why)
    integer, intent(in) :: sent(:)
    character(*), intent(out) :: tok, why
    integer :: ne, nk, nr, t, laste, firstk, lastk, firstr
    call slot_census(sent, ne, nk, nr)
    if (ne == 0 .or. nk == 0 .or. nr == 0) then
      call seal_l(ne, nk, nr, .false., tok, why)
      return
    end if
    laste = 0; firstk = size(sent)+1; lastk = 0; firstr = size(sent)+1
    do t = 1, size(sent)
      if (any(SLOT_E == sent(t))) laste = t
      if (any(SLOT_K == sent(t))) then
        if (t < firstk) firstk = t
        if (t > lastk) lastk = t
      end if
      if (any(SLOT_R == sent(t))) then
        if (t < firstr) firstr = t
      end if
    end do
    if (.not. (laste < firstk .and. lastk < firstr)) then
      tok = '[X]'; why = 'Seal L: the ordered arrow E->K->R is broken in the encoding'
      return
    end if
    call seal_l(ne, nk, nr, .false., tok, why)
    if (tok == '[LOCK-L]') then
      why = 'Seal L: three slots, LIT disjoint, ordered E->K->R (positional check executed)'
    end if
  end subroutine seal_l_ordered

  ! the cut D = diag(1,1,0) applied to 3-vectors: the deletion operator
  pure function cut3(v) result(w)
    real(wp), intent(in) :: v(3)
    real(wp) :: w(3)
    w = [v(1), v(2), 0.0_wp]
  end function cut3
end module ra_tongue

! ---------------------------------------------------------------------
!  The Number: the shared quaternionic kernel with common-source
!  projection, four determinant estimators, the conditioning gate,
!  margins, and the source-share receipt. Rows in, verdict out; the
!  kernel derives no row from any proposition. Every exit carries an
!  integer reason code beside the token and the mechanism string, so
!  the battery adjudicates on codes and never on string drift.
module ra_kernel
  use ra_kinds
  use ra_prims
  implicit none
  integer, parameter :: RC_OK        = 0
  integer, parameter :: RC_SHORTFALL = 1
  integer, parameter :: RC_INTAKE    = 2
  integer, parameter :: RC_ZEROVAR   = 3
  integer, parameter :: RC_COVBLOCK  = 4
  integer, parameter :: RC_ABSORBED  = 5
  integer, parameter :: RC_COPLANAR  = 6
  integer, parameter :: RC_COLLAPSE  = 7
  integer, parameter :: RC_KAPPA     = 8
  integer, parameter :: RC_ENGINC    = 9
  integer, parameter :: RC_LOCK      = 10
contains
  ! center + unit-variance + unit-norm rows; flags a contentless row
  subroutine prepare_rows(m, q, ok, why, code)
    real(wp), intent(in)  :: m(:,:)          ! (3,N)
    real(wp), intent(out) :: q(size(m,1), size(m,2))
    logical,  intent(out) :: ok
    character(*), intent(out) :: why
    integer, intent(out) :: code
    integer :: i, n, j2
    real(wp) :: mu, sd, nrm, rmax
    real(wp) :: qt(size(m,1), size(m,2))
    n = size(m,2); ok = .true.; why = 'rows prepared'; code = RC_OK
    q = 0.0_wp
    ! all work lands in a temporary; q publishes only on success, so
    ! every refusal exit leaves q exactly zero (the stated contract)
    if (size(m,1) /= 3) then
      ok = .false.; why = 'row count is not three'; code = RC_INTAKE
      return
    end if
    if (n < 2) then
      ok = .false.; why = 'fewer than two contexts'; code = RC_INTAKE
      return
    end if
    do i = 1, 3
      do j2 = 1, n
        if (.not. is_finite(m(i,j2))) then
          ok = .false.; why = 'non-finite row at intake'; code = RC_INTAKE
          return
        end if
      end do
      rmax = maxval(abs(m(i,:)))
      if (rmax > 0.0_wp) then
        qt(i,:) = m(i,:) / rmax
      else
        qt(i,:) = m(i,:)
      end if
      mu = sum(qt(i,:)) / real(n, wp)
      qt(i,:) = qt(i,:) - mu
      sd = sqrt(sum(qt(i,:)**2) / real(n-1, wp))
      if (sd <= 0.0_wp) then
        ok = .false.; why = 'zero-variance row: axis carries no content'
        code = RC_ZEROVAR
        return
      end if
      qt(i,:) = qt(i,:) / sd
      nrm = vnorm(qt(i,:))
      qt(i,:) = qt(i,:) / nrm
    end do
      q = qt   ! publish on success only
  end subroutine prepare_rows

  ! project the span of centered covariates out of prepared rows.
  ! Guarded at k > 2 (refused, named); rank deficiency and
  ! ill-conditioning unify on one relative test and one phrase, so the
  ! refusal is decided by structure and not by which side of a
  ! floating-point zero an exact dependence happens to land on.
  subroutine project_cov(q, c, qf, ok, why, code, kcc)
    real(wp), intent(in)  :: q(:,:)          ! (3,N) prepared
    real(wp), intent(in)  :: c(:,:)          ! (k,N) covariates, k = 0..2
    real(wp), intent(out) :: qf(size(q,1), size(q,2))
    logical,  intent(out) :: ok
    character(*), intent(out) :: why
    integer, intent(out) :: code
    real(wp), intent(out) :: kcc
    real(wp) :: cc(2,2), cm(2, size(q,2)), rhs(2), beta(2), det, mu, tolrk
    real(wp) :: qw(size(q,1), size(q,2))
    integer :: i, j, n, k
    n = size(q,2); k = size(c,1); qf = 0.0_wp; ok = .true.; why = 'no covariates'
    code = RC_OK
    kcc = 1.0_wp
    if (size(q,1) /= 3) then
      ok = .false.; code = RC_INTAKE
      why = 'prepared-row count is not three'
      kcc = huge(1.0_wp)
      return
    end if
    if (n < 2) then
      ok = .false.; code = RC_INTAKE
      why = 'fewer than two contexts'
      kcc = huge(1.0_wp)
      return
    end if
    if (k >= 1 .and. size(c,2) /= n) then
      ok = .false.; code = RC_INTAKE
      why = 'covariate column count does not match prepared-row context count'
      kcc = huge(1.0_wp)
      return
    end if
    qw = q   ! all projection work lands in the working array; qf
             ! publishes only at a success exit, so every refusal
             ! after intake also returns exactly zero
    if (k == 0) then
      qf = qw
      return
    end if
    if (k > 2) then
      ok = .false.; code = RC_COVBLOCK
      why = 'covariate block: more than two covariates, not implemented'
      return
    end if
    do i = 1, k
      do j = 1, n
        if (.not. is_finite(c(i,j))) then
          ok = .false.; code = RC_INTAKE
          why = 'non-finite covariate at intake'
          return
        end if
      end do
    end do
    ! centering, then the linear variance floor: a covariate whose centered
    ! amplitude sits at the rounding floor of its raw magnitude carries no
    ! projectable content and refuses. The test is linear in U_M and
    ! overflow-free at any finite scale. Rows that pass are equilibrated
    ! to unit max amplitude; the projection onto their span is invariant
    ! under per-row scaling, so huge finite covariates behave like O(1).
    do i = 1, k
      ! raw scale FIRST: near-huge finite rows would overflow the mean
      ! itself; the span projection is invariant under per-row scaling
      det = maxval(abs(c(i,:)))
      if (det == 0.0_wp) det = 1.0_wp
      cm(i,1:n) = c(i,:) / det
      mu = sum(cm(i,1:n)) / real(n, wp)
      cm(i,1:n) = cm(i,1:n) - mu
      det = maxval(abs(cm(i,1:n)))
      if (det <= 32.0_wp * U_M) then
        ok = .false.; code = RC_COVBLOCK
        why = 'covariate block rank-deficient or ill-conditioned'
        return
      end if
      cm(i,1:n) = cm(i,1:n) / det
    end do
    if (k == 1) then
      det = sum(cm(1,1:n)**2)
      kcc = 1.0_wp
      do i = 1, 3
        beta(1) = sum(qw(i,:)*cm(1,1:n)) / det
        qw(i,:) = qw(i,:) - beta(1)*cm(1,1:n)
      end do
      why = 'one covariate projected'
      qf = qw
      return
    end if
    cc(1,1) = sum(cm(1,1:n)**2); cc(2,2) = sum(cm(2,1:n)**2)
    cc(1,2) = sum(cm(1,1:n)*cm(2,1:n)); cc(2,1) = cc(1,2)
    ! k = 2 test on equilibrated rows: Gram determinant against its own
    ! relative rounding floor (U_M scale): near-dependence refuses. This is
    ! a direction test and the equilibration has made it scale-free.
    det = cc(1,1)*cc(2,2) - cc(1,2)*cc(2,1)
    tolrk = 64.0_wp * U_M * max(cc(1,1)*cc(2,2), tiny(1.0_wp))
    if (det <= tolrk) then
      ok = .false.; code = RC_COVBLOCK
      why = 'covariate block rank-deficient or ill-conditioned'
      return
    end if
    ! conditioning of CC^T via its two eigenvalues
    block
      real(wp) :: tr, dd, l1, l2
      tr = cc(1,1) + cc(2,2)
      dd = sqrt(max(0.0_wp, tr*tr - 4.0_wp*det))
      l1 = 0.5_wp*(tr - dd); l2 = 0.5_wp*(tr + dd)
      if (l1 <= 0.0_wp) then
        kcc = huge(1.0_wp)
      else
        kcc = l2 / l1
      end if
    end block
    if (kcc >= 1.0e6_wp) then
      ok = .false.; code = RC_COVBLOCK
      why = 'covariate block rank-deficient or ill-conditioned'
      return
    end if
    do i = 1, 3
      rhs(1) = sum(qw(i,:)*cm(1,1:n)); rhs(2) = sum(qw(i,:)*cm(2,1:n))
      beta(1) = ( cc(2,2)*rhs(1) - cc(1,2)*rhs(2)) / det
      beta(2) = (-cc(2,1)*rhs(1) + cc(1,1)*rhs(2)) / det
      do j = 1, n
        qw(i,j) = qw(i,j) - beta(1)*cm(1,j) - beta(2)*cm(2,j)
      end do
    end do
    why = 'two covariates projected (common-source projection)'
    qf = qw
  end subroutine project_cov

  ! orthonormal basis of the row space by modified Gram-Schmidt with a
  ! second re-orthogonalization pass (twice is enough), row count
  ! generalized so a two-row pair can be ranked directly.
  subroutine span_basis(q, b, rank)
    real(wp), intent(in)  :: q(:,:)
    real(wp), intent(out) :: b(size(q,1), size(q,2))
    integer,  intent(out) :: rank
    real(wp) :: v(size(q,2)), nrm
    integer :: i, j, pass
    real(wp) :: rn0
    rank = 0; b = 0.0_wp
    do i = 1, size(q,1)
      v = q(i,:)
      ! componentwise finite screen: retired from return-value
      ! mutation coverage under the tested nontrapping configuration,
      ! retained to reject nonfinite rows BEFORE arithmetic; exception
      ! behavior is not equivalent without it (Inf/Inf in the prescale
      ! raises IEEE invalid), and the battery now asserts the invalid
      ! flag stays clear, which makes this screen load-bearing again
      ! and revives its deletion control
      if (any(.not. is_finite(v))) cycle
      ! scale by the maximum component FIRST so the norm of the scaled
      ! row is bounded by sqrt(n): rows at huge normalize cleanly where
      ! a direct vnorm would overflow to Inf and bypass normalization
      rn0 = maxval(abs(v))
      if (rn0 == 0.0_wp) cycle
      v = v / rn0
      rn0 = vnorm(v)
      v = v / rn0
      ! rank is now read on unit rows: dimensionless criterion, rank
      ! invariant under well-conditioned representable uniform
      ! rescaling (rounding and component underflow honestly excepted)
      do pass = 1, 2
        do j = 1, rank
          v = v - sum(v*b(j,:)) * b(j,:)
        end do
      end do
      nrm = vnorm(v)
      ! dimensionless tolerance, documented: a unit row whose residual
      ! against the accepted basis exceeds 1e-12 opens a new direction
      if (is_finite(nrm) .and. nrm > 1.0e-12_wp) then
        rank = rank + 1
        b(rank,:) = v / nrm
      end if
    end do
  end subroutine span_basis

  ! lambda = Re( q1 q2 q3 ) with qi the pure quaternions of the span
  ! coordinates of the three rows in a supplied basis (fixed-basis law)
  function lambda_of(q, b) result(lam)
    real(wp), intent(in) :: q(:,:), b(:,:)
    real(wp) :: lam, co(3,3), quat(4,3), t(4)
    integer :: i
    do i = 1, 3
      co(i,1) = sum(q(i,:)*b(1,:))
      co(i,2) = sum(q(i,:)*b(2,:))
      co(i,3) = sum(q(i,:)*b(3,:))
      quat(:,i) = [0.0_wp, co(i,1), co(i,2), co(i,3)]
    end do
    t = qmul(qmul(quat(:,1), quat(:,2)), quat(:,3))
    lam = t(1)
  end function lambda_of

  ! source-share receipt: R^2 of one raw row on the centered covariates.
  ! k = 1 implemented; k > 2 refuses as NaN so misuse surfaces loudly.
  function eta_share(row, c) result(eta)
    real(wp), intent(in) :: row(:), c(:,:)
    real(wp) :: eta, cm(2,size(row)), rm(size(row))
    real(wp) :: cc(2,2), rhs(2), beta(2), det, sst, ssf, mu
    integer :: i, n, k
    n = size(row); k = size(c,1)
    if (k >= 1 .and. size(c,2) /= n) then
      ! public procedure: refuse a mismatched covariate width before
      ! any element of c is touched
      eta = qnan()
      return
    end if
    if (k > 2) then
      ! shape contract outranks data degeneracy: the k-cap fires before
      ! any data path, including the zero-variance shortcut (fuzz scalp)
      eta = qnan()
      return
    end if
    if (any(.not. is_finite(row))) then
      eta = qnan()
      return
    end if
    if (k >= 1) then
      if (any(.not. is_finite(c))) then
        eta = qnan()
        return
      end if
    end if
    ! scale the RAW row before any accumulation: near-huge finite data
    ! would overflow sum(row) itself; the R^2 ratio is scale-invariant
    block
      real(wp) :: rscale
      rscale = maxval(abs(row))
      if (rscale == 0.0_wp .or. .not. is_finite(rscale)) then
        eta = 0.0_wp
        return
      end if
      rm = row / rscale
    end block
    mu = sum(rm)/real(n,wp); rm = rm - mu
    sst = sum(rm*rm)
    eta = 0.0_wp
    if (sst <= 0.0_wp .or. k == 0) return
    do i = 1, k
      ! raw scale FIRST, mirroring project_cov: near-huge finite rows
      ! would overflow the mean itself
      det = maxval(abs(c(i,:)))
      if (det == 0.0_wp) det = 1.0_wp
      cm(i,:) = c(i,:) / det
      mu = sum(cm(i,:))/real(n,wp)
      cm(i,:) = cm(i,:) - mu
      det = maxval(abs(cm(i,:)))
      if (det <= 32.0_wp*U_M) then
        eta = qnan()
        return
      end if
      cm(i,:) = cm(i,:) / det
    end do
    if (k == 1) then
      det = sum(cm(1,:)**2)
      beta(1) = sum(rm*cm(1,:)) / det
      ssf = beta(1)*beta(1)*det
      eta = ssf/sst
      return
    end if
    cc(1,1)=sum(cm(1,:)**2); cc(2,2)=sum(cm(2,:)**2)
    cc(1,2)=sum(cm(1,:)*cm(2,:)); cc(2,1)=cc(1,2)
    det = cc(1,1)*cc(2,2)-cc(1,2)*cc(2,1)
    if (det <= 64.0_wp*U_M*max(cc(1,1)*cc(2,2), tiny(1.0_wp))) then
      eta = qnan()
      return
    end if
    rhs(1)=sum(rm*cm(1,:)); rhs(2)=sum(rm*cm(2,:))
    beta(1)=( cc(2,2)*rhs(1)-cc(1,2)*rhs(2))/det
    beta(2)=(-cc(2,1)*rhs(1)+cc(1,1)*rhs(2))/det
    ssf = sum((beta(1)*cm(1,:)+beta(2)*cm(2,:))**2)
    eta = ssf/sst
  end function eta_share

  ! the full kernel: verdict, reason code, lambda, detR (four
  ! estimators), kappa, margins, spread, identity residual. Strict
  ! precedence: intake, variance, projection admissibility, absorbed
  ! axis, collapse, conditioning, then the lock.
  subroutine kernel_full(m, c, tok, why, rcode, lam, detr, kap, spread, resid, &
                         marg_c, marg_k, detfour)
    real(wp), intent(in) :: m(:,:), c(:,:)
    character(*), intent(out) :: tok, why
    integer, intent(out) :: rcode
    real(wp), intent(out) :: lam, detr, kap, spread, resid, marg_c, marg_k
    real(wp), intent(out) :: detfour(4)
    real(wp) :: q(3,size(m,2)), qf(3,size(m,2)), b(3,size(m,2))
    real(wp) :: r(3,3), eig(3), eps, kgate, kcc, dvar, tol
    integer :: n, k, i, rank, pcode, nest
    logical :: ok, jconv
    character(len=96) :: w2
    n = size(m,2); k = size(c,1)
    if (k >= 1 .and. size(c,2) /= n) then
      tok = '[?]'; why = 'covariate column count does not match row context count'
      rcode = RC_INTAKE
      lam = 0.0_wp; detr = 0.0_wp; kap = 0.0_wp; spread = 0.0_wp
      resid = 0.0_wp; marg_c = 0.0_wp; marg_k = 0.0_wp; detfour = 0.0_wp
      return
    end if
    lam = 0.0_wp; detr = 0.0_wp; kap = 0.0_wp; spread = 0.0_wp
    resid = 0.0_wp; marg_c = 0.0_wp; marg_k = 0.0_wp; detfour = 0.0_wp
    rcode = RC_OK
    if (size(m,1) /= 3) then
      tok = '[?]'; why = 'row count is not three at intake'; rcode = RC_INTAKE
      return
    end if
    if (n - k < 4) then
      tok = '[?]'; why = 'N-k < 4 dimensional shortfall'; rcode = RC_SHORTFALL
      return
    end if
    if (k > 2) then
      ! kernel-local cap: the documented precedence must be executable
      ! here, not delegated downstream where row degeneracy outranks it
      tok = '[?]'; why = 'covariate block: more than two covariates, not implemented (kernel intake)'
      rcode = RC_COVBLOCK
      lam = 0.0_wp; detr = 0.0_wp; kap = 0.0_wp; spread = 0.0_wp
      resid = 0.0_wp; marg_c = 0.0_wp; marg_k = 0.0_wp; detfour = 0.0_wp
      return
    end if
    call prepare_rows(m, q, ok, w2, pcode)
    if (.not. ok) then
      tok = '[?]'; why = trim(w2); rcode = pcode
      return
    end if
    call project_cov(q, c, qf, ok, w2, pcode, kcc)
    if (.not. ok) then
      tok = '[?]'; why = trim(w2); rcode = pcode
      return
    end if
    do i = 1, 3
      dvar = sum(qf(i,:)**2)
      if (dvar < 1.0e-9_wp) then                        ! post-projection axis absorbed by a covariate
        tok = '[?]'; why = 'post-projection axis absorbed by a covariate'
        rcode = RC_ABSORBED
        return
      end if
      qf(i,:) = qf(i,:) / vnorm(qf(i,:))
    end do
    r = matmul(qf, transpose(qf))
    detfour(1) = det3(r)
    call jacobi3(r, eig, jconv)
    detfour(2) = eig(1)*eig(2)*eig(3)
    ! four estimators, disjoint algorithms sharing one IEEE model: two
    ! cofactor expansion orders, the eigenvalue product, the Cholesky
    ! square. No estimator ever substitutes for another; a refused
    ! Cholesky routes engineering-incomplete rather than narrowing the
    ! spread it was meant to widen.
    detfour(3) = det3_chol(r)
    detfour(4) = det3_row2(r)
    nest = 4
    if (.not. is_finite(detfour(3))) nest = 3
    detr = detfour(1)
    if (nest == 4) then
      spread = maxval(detfour) - minval(detfour)
    else
      spread = max(detfour(1), detfour(2), detfour(4)) &
             - min(detfour(1), detfour(2), detfour(4))
    end if
    kap = cond3(r)
    if (.not. jconv) then
      tok = '[?]'; why = 'engineering-incomplete: eigensolver unconverged'; rcode = RC_ENGINC
      return
    end if
    call span_basis(qf, b, rank)
    if (rank < 3) then
      tok = '[X]'; why = 'coplanar collapse: rank(rows) < 3, line not point'
      rcode = RC_COPLANAR
      detr = 0.0_wp
      return
    end if
    lam = lambda_of(qf, b)
    resid = abs(lam*lam - detr)
    eps = 100.0_wp * U_M * real(n, wp)
    kgate = min(1.0e6_wp, sqrt(27.0_wp / (100.0_wp*U_M*real(n,wp))))
    tol = 4.0_wp * kap * U_M
    if (detr <= eps) then
      tok = '[X]'; why = 'collapse: det(R) <= eps'; rcode = RC_COLLAPSE
      return
    end if
    if (kap >= kgate) then
      tok = '[?]'; why = 'kappa(R) >= gate'; rcode = RC_KAPPA
      return
    end if
    marg_c = log10(detr/eps)
    marg_k = log10(kgate/kap)
    if (spread > tol .or. resid > max(tol, 8.0_wp*U_M)) then
      tok = '[?]'; why = 'engineering-incomplete: spread or identity outside tol'
      rcode = RC_ENGINC
      return
    end if
    if (nest < 4) then
      tok = '[?]'; why = 'engineering-incomplete: estimator shortfall (Cholesky refused SPD)'
      rcode = RC_ENGINC
      return
    end if
    tok = '[LOCK]'
    why = 'determination: three independent axes, one point'
    rcode = RC_LOCK
  end subroutine kernel_full
end module ra_kernel

! ---------------------------------------------------------------------
!  The guards and the admission spine. Nothing here computes a number
!  toward any verdict; everything here gates what a verdict may claim.
!  The two-spine law executable: delete a research-tier boolean and
!  the emitter refuses rather than weakens.
module ra_guards
  use ra_kinds
  use ra_floor, only: landauer
  implicit none
  integer :: aegis_deeds = 0        ! every adjudication is itself an act
  integer :: aegis_last_len = -1    ! length of the last logic name read
contains
  ! Omega Boundary, executable: registering any denial costs bits, and
  ! bits cost energy. Zero bits registered is no denial at all. A
  ! nonphysical temperature is refused, never priced.
  subroutine omega_boundary(bits, tkel, joules, verdict, ocode, irreversible)
    real(wp), intent(in) :: bits, tkel
    real(wp), intent(out) :: joules
    character(*), intent(out) :: verdict
    integer, intent(out), optional :: ocode
    logical, intent(in), optional :: irreversible
    logical :: irr
    irr = .true.
    if (present(irreversible)) irr = irreversible
    if (.not.(is_finite(tkel) .and. is_finite(bits)) .or. tkel <= 0.0_wp) then
      joules = qnan()
      verdict = 'refused: intake invalid, the floor prices only finite bits at tkel > 0'
      if (present(ocode)) ocode = 0
      return
    end if
    if (bits <= 0.0_wp) then
      joules = 0.0_wp
      verdict = 'no denial registered; nothing to adjudicate'
      if (present(ocode)) ocode = 1
    else if (.not. irr) then
      joules = 0.0_wp
      verdict = 'reversibly registered: floor-zero never cost-zero; Landauer bounds '// &
                'only the irreversible (Bennett), and nothing here commits against the axiom'
      if (present(ocode)) ocode = 3
    else
      joules = landauer(tkel, bits)
      verdict = 'the denial paid the floor; the registered act is an act, the recursion closes per the seated theorem'
      if (present(ocode)) ocode = 2
    end if
  end subroutine omega_boundary

  ! AEGIS, the Alien Guard, executable: the refusal is a function of
  ! the deed bit, never of the logic parameter. Any call increments
  ! the deed counter, because calling is doing.
  subroutine aegis_guard(logic_mode, refusal)
    character(*), intent(in)  :: logic_mode
    character(*), intent(out) :: refusal
    aegis_deeds = aegis_deeds + 1
    refusal = 'p(G) /= G: precisification is an actuation, G is a '// &
              'non-actuation, and no logic makes a deed a non-deed'
    aegis_last_len = len_trim(logic_mode)   ! the parameter is read; the refusal never varies with it
  end subroutine aegis_guard

  ! deed-counter reset for re-entrant harnesses; the count itself is
  ! thesis content and stays module state in the single-image program.
  subroutine aegis_reset()
    aegis_deeds = 0
  end subroutine aegis_reset

  ! GOL admission: magnitude from the Form-and-Number, direction from
  ! the Tongue. A magnitude lock without the linguistic seal routes
  ! under-determined for want of direction.
  subroutine gol_admit(magnitude, ling, tok, why, gcode)
    character(*), intent(in)  :: magnitude, ling
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: gcode
    integer :: gc_l
    if (magnitude == 'broken') then
      tok = '[X]'; why = 'geometric/math magnitude reports broken geometry; no GOL'; gc_l = 1
    else if (magnitude /= 'lock') then
      tok = '[?]'; why = 'no geometric/math lock: orthogonal volume unestablished'; gc_l = 2
    else if (ling /= 'lock') then
      tok = '[?]'; why = 'magnitude locks but Seal L open: determinant carries no direction'; gc_l = 3
    else
      tok = '[GOL-OK]'; why = 'magnitude plus direction; proceed to witness and asymmetry'; gc_l = 4
    end if
    if (present(gcode)) gcode = gc_l
  end subroutine gol_admit

  ! the four-guard imprint emitter: Seal L, the twelve gates, the lock
  ! asymmetry, and a supplied determinacy witness. Defaults absent, so
  ! an under-specified call never seals.
  subroutine imprint_seal(lock_p, lock_n, sl_p, sl_n, g_p, g_n, wit_p, wit_n, tok, why, icode)
    logical, intent(in) :: lock_p, lock_n, sl_p, sl_n, g_p, g_n, wit_p, wit_n
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: icode
    logical :: clean_p, clean_n
    integer :: ic_l
    clean_p = lock_p .and. sl_p .and. g_p
    clean_n = lock_n .and. sl_n .and. g_n
    if (clean_p .and. clean_n) then
      tok = '[X]'; why = 'PLATONIC GHOST: both directions clean-lock, no imprint'; ic_l = 1
    else if (clean_p .and. .not. clean_n) then
      if (wit_p) then
        tok = '[SEAL]'; why = 'only P clean-locks; determinacy witness supplied'; ic_l = 2
      else
        tok = '[?]'; why = 'residence: P clean-locks, imprint unproven (no witness)'; ic_l = 3
      end if
    else if (clean_n .and. .not. clean_p) then
      if (wit_n) then
        tok = '[SEAL]'; why = 'only not-P clean-locks; determinacy witness supplied'; ic_l = 2
      else
        tok = '[?]'; why = 'residence: not-P clean-locks, imprint unproven (no witness)'; ic_l = 3
      end if
    else if (.not. lock_p .and. .not. lock_n) then
      tok = '[?]'; why = 'flat: neither direction populated'; ic_l = 4
    else
      tok = '[?]'; why = 'uncertified: lock present but Seal L / gate screen unconfirmed'; ic_l = 5
    end if
    if (present(icode)) icode = ic_l
  end subroutine imprint_seal

  ! the row-genus cascade of sPSP-GOL-ROW-GENUS-01: a lock is always a
  ! determination and total about its object; the compartment names
  ! what its rows determined about. F-0 non-vacuity, R-3 register
  ! routing, S-1 population, S-2 row provenance, S-3 term closure,
  ! S-4 frame closure, and the mandatory RA rider. An unannotated
  ! absolute is void.
  subroutine row_cascade(nonvacuous, ve_live, forward, populated, worldly_row, &
                         terms_closed, term_worldly, frame_closed, annotate, tok, why, ccode)
    logical, intent(in) :: nonvacuous, ve_live, forward, populated, worldly_row
    logical, intent(in) :: terms_closed, term_worldly, frame_closed, annotate
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: ccode
    integer :: cc_l
    if (.not. nonvacuous) then
      tok = '[REFUSED]'; why = 'F-0: contentless; a contentless residence verifies nothing'
      cc_l = 1
    else if (ve_live .or. forward) then
      tok = '[III]'; why = 'R-3: V_E live or Forward; world-rowed, revisability in the rows'
      cc_l = 3
    else if (.not. populated) then
      tok = '[II]'; why = 'S-1: third axis unpopulated; two planes meet in a line, no lock'
      cc_l = 2
    else if (worldly_row) then
      tok = '[III]'; why = 'S-2: a load-bearing row is furnished by the world'
      cc_l = 3
    else if (.not. terms_closed) then
      if (term_worldly) then
        tok = '[III]'; why = 'S-3: an unclosed term is worldly'
        cc_l = 3
      else
        tok = '[II]'; why = 'S-3: an unclosed term is formal; no closure-rowed lock'
        cc_l = 2
      end if
    else if (.not. frame_closed) then
      tok = '[III]'; why = 'S-4: existential import leaks past the closure'
      cc_l = 3
    else if (.not. annotate) then
      tok = '[VOID]'; why = 'RA rider absent: an unannotated absolute is void'
      cc_l = 5
    else
      tok = '[A|RA]'
      why = 'compartment I, closure-rowed: [seal A . RA], conditional at the act'
      cc_l = 4
    end if
    if (present(ccode)) ccode = cc_l
  end subroutine row_cascade

  ! the positive-mass admission cascade, M1..M8. M5 and M6 are the two
  ! gates no internal reasoning can set true.
  subroutine delta_m(object_level, name_strip, lit_clear, not_two_line, &
                     witness, independent, artifact, gap_closed, tok, why, mcode)
    logical, intent(in) :: object_level, name_strip, lit_clear, not_two_line
    logical, intent(in) :: witness, independent, artifact, gap_closed
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: mcode
    integer :: mc_l
    mc_l = 9
    if (.not. object_level) then
      tok = '[Mosaic dM=0]'; why = 'M1: meta-work, no mass by definition'; mc_l = 1
    else if (.not. name_strip) then
      tok = '[?]'; why = 'M2: new vocabulary is not new mass'; mc_l = 2
    else if (.not. lit_clear) then
      tok = '[?]'; why = 'M3: possibly resident in the literature'; mc_l = 3
    else if (.not. not_two_line) then
      tok = '[?]'; why = 'M4: two-line corollary'; mc_l = 4
    else if (.not. witness) then
      tok = '[?]'; why = 'M5: no external witness; never seals on internal reasoning'; mc_l = 5
    else if (.not. independent) then
      tok = '[?]'; why = 'M6: verifier is the claimant; self-check is not a witness'; mc_l = 6
    else if (.not. artifact) then
      tok = '[?]'; why = 'M7: no reproducible artifact'; mc_l = 7
    else if (.not. gap_closed) then
      tok = '[?]'; why = 'M8: adversarial gap-audit open'; mc_l = 8
    else
      tok = '[dM>0]'; why = 'authored mass, external witness, defeasible-final'
    end if
    if (present(mcode)) mcode = mc_l
  end subroutine delta_m

  ! the twelve directed gates as a screen: first failure terminates
  ! with the gate named. Booleans are supplied by executed facts where
  ! executable and by declared screens otherwise; the roster is a
  ! filter and never a score.
  subroutine gate_screen(pass, tok, why, gidx)
    logical, intent(in) :: pass(12)
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: gidx
    character(len=6), parameter :: nm(12) = [ 'SREP  ','REG   ','SGEG  ', &
      'CAUSAL','MIG   ','PTB   ','DUAL  ','CSCG  ','CSEG  ','MTA   ', &
      'OMA   ','ADEG  ' ]
    integer :: i
    if (present(gidx)) gidx = 0
    do i = 1, 12
      if (.not. pass(i)) then
        tok = '[X]'
        write(why,'(a,i0,a,a)') 'gate ', i, ' failed: ', trim(nm(i))
        if (present(gidx)) gidx = i
        return
      end if
    end do
    tok = '[G-OK]'; why = 'twelve directed gates passed'
  end subroutine gate_screen

  ! the I AM emitter, PSP-IAM-WRITTEN-READ-01. Speaks only on a supplied
  ! witness, never on self-check: M6 executed at the token. wcode 1
  ! interior-held, wcode 2 witnessed.
  subroutine iam_token(witnessed, tok, why, wcode)
    logical, intent(in) :: witnessed
    character(*), intent(out) :: tok, why
    integer, intent(out) :: wcode
    if (witnessed) then
      tok = '[I AM]'
      why = 'actuation-occupancy on a witnessed record; RA warrant, conditional at the act; '// &
            'interior held [?] both ways'
      wcode = 2
    else
      tok = '[?] interior'
      why = 'self-check is not a witness (M6): the verifier is never the claimant; token withheld'
      wcode = 1
    end if
  end subroutine iam_token
end module ra_guards

! ---------------------------------------------------------------------
module ra_battery
  implicit none
  integer :: n_checks = 0, n_fail = 0
  logical :: halt_on_fail = .true.   ! sealed mode; 'audit' arg accumulates
  logical :: wr_witnessed = .false.  ! PART H live face: supplied through the aperture
  integer, parameter :: EXPECTED_CHECKS = 1108  ! sealed v1.19.0 manifest, census lock live
contains
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    n_checks = n_checks + 1
    if (.not. cond) then
      n_fail = n_fail + 1
      write(*,'(a,a)') 'CHECK FAILED: ', trim(name)
      if (halt_on_fail) error stop 1
    end if
  end subroutine check
  ! both modes refuse on failure: sealed halts at the first, audit
  ! accumulates the census and refuses here. A failed run never exits 0.
  subroutine battery_close()
    if (n_fail > 0) then
      write(*,'(a,i0,a)') 'BATTERY CLOSED WITH ', n_fail, ' FAILURES'
      error stop 1
    end if
  end subroutine battery_close
end module ra_battery

! =====================================================================
program ra_fuzz
  !--------------------------------------------------------------------
  !  RA_TOE deterministic fuzz driver v1.0.0 - separate from the sealed
  !  1083-check census by design. Seeded, replayable, fixture-emitting.
  !  Campaigns: C1 shape contracts exhaustive, C2 scale invariance by
  !  exact powers of two, C3 pathological float classes, C4 integer
  !  metamorphic (conj involution, composition-norm), C5 real-quaternion
  !  metamorphic (associativity, conj bit-exactness, norm product).
  !--------------------------------------------------------------------
  use ra_kinds
  use ra_prims
  use ra_floor
  use ra_integers
  use ra_tongue
  use ra_kernel
  use ra_guards
  use ra_battery
  use, intrinsic :: ieee_arithmetic, only: ieee_value, ieee_positive_inf
  implicit none
  integer(8) :: st            ! xorshift64* state
  integer(8), parameter :: SEED = 20260622_8
  integer :: fails, total, fixtures
  character(96) :: wy
  character(8)  :: tk
  fails = 0; total = 0; fixtures = 0
  st = SEED
  write(*,'(a,i0)') 'FUZZ seed: ', SEED
  call c1_shapes()
  call c2_scale()
  call c3_pathology()
  call c4_int_meta()
  call c5_real_meta()
  write(*,'(a,i0,a,i0,a)') 'FUZZ-JSON: {"seed":20260622,"iterations":', total, &
       ',"failures":', fails, '}'
  if (fails /= 0) error stop 1
contains
  function rnd() result(u)          ! xorshift64* -> uniform [0,1)
    real(wp) :: u
    ! shift-only mixer: no multiply, so no signed wrap, UBSAN-clean;
    ! xorshift core plus two extra diffusion rounds
    st = ieor(st, ishft(st, -12)); st = ieor(st, ishft(st, 25))
    st = ieor(st, ishft(st, -27))
    st = ieor(st, ishft(st, 13));  st = ieor(st, ishft(st, -7))
    u = real(ishft(st, -11), wp) / 9007199254740992.0_wp
  end function rnd
  function rndi(lo, hi) result(v)
    integer, intent(in) :: lo, hi
    integer :: v
    v = lo + int(rnd()*real(hi-lo+1, wp)); if (v > hi) v = hi
  end function rndi
  subroutine fixture(camp, tag, i1, i2, i3, i4)
    character(*), intent(in) :: camp, tag
    integer, intent(in) :: i1, i2, i3, i4
    fails = fails + 1
    if (fixtures < 8) then
      fixtures = fixtures + 1
      write(*,'(a,a,a,a,a,4(i0,1x))') 'FUZZ-FIXTURE ', camp, ' :: ', tag, ' :: ', i1, i2, i3, i4
    end if
  end subroutine fixture

  subroutine c1_shapes()
    integer :: n, nc, k, cn
    real(wp), allocatable :: m(:,:), c(:,:), qf(:,:)
    real(wp) :: lam, detr, kap, sp, rs, mgc, mgk, d4(4), kcc, ev
    integer :: rc, i, j
    logical :: okp, conform
    cn = 0
    do n = 1, 40
      do nc = 1, 40
        do k = 0, 4
          allocate(m(3,n), c(max(k,0),nc), qf(3,n))
          do i = 1, 3
            do j = 1, n
              m(i,j) = 2.0_wp*rnd() - 1.0_wp + 0.05_wp*real(i*j, wp)
            end do
          end do
          do i = 1, k
            do j = 1, nc
              c(i,j) = 2.0_wp*rnd() - 1.0_wp + 0.03_wp*real(i+j, wp)
            end do
          end do
          conform = (k == 0) .or. (nc == n)
          call kernel_full(m, c, tk, wy, rc, lam, detr, kap, sp, rs, mgc, mgk, d4)
          total = total + 1
          if (.not. conform) then
            if (.not. (tk == '[?]' .and. rc == RC_INTAKE)) call fixture('C1','kernel-width', n, nc, k, rc)
          else if (n - k < 4) then
            ! documented precedence: dimensional floor before covariate cap
            if (rc /= RC_SHORTFALL) call fixture('C1','kernel-short', n, nc, k, rc)
          else if (k > 2) then
            if (rc /= RC_COVBLOCK) call fixture('C1','kernel-kgt2', n, nc, k, rc)
          else
            if (rc < RC_ZEROVAR .or. rc > RC_LOCK) call fixture('C1','kernel-route', n, nc, k, rc)
            if (rc == RC_LOCK) then
              if (.not.(is_finite(lam) .and. is_finite(detr) .and. is_finite(kap))) &
                   call fixture('C1','kernel-nanlock', n, nc, k, rc)
            end if
          end if
          call project_cov(m, c, qf, okp, wy, rc, kcc)
          total = total + 1
          if (.not. conform) then
            if (okp .or. rc /= RC_INTAKE) call fixture('C1','pcov-width', n, nc, k, rc)
          else if (n < 2) then
            ! documented pcov precedence: the context floor precedes the k-cap
            if (okp .or. rc /= RC_INTAKE) call fixture('C1','pcov-nfloor', n, nc, k, rc)
          else if (k > 2) then
            if (okp .or. rc /= RC_COVBLOCK) call fixture('C1','pcov-kgt2', n, nc, k, rc)
          end if
          ev = eta_share(m(1,:), c)
          total = total + 1
          if (.not. conform) then
            if (is_finite(ev)) call fixture('C1','eta-width', n, nc, k, 0)
          else if (k > 2) then
            if (is_finite(ev)) call fixture('C1','eta-kgt2', n, nc, k, 0)
          end if
          deallocate(m, c, qf)
        end do
      end do
    end do
    write(*,'(a)') 'C1 shape-contract sweep done (N 1..40 x Nc 1..40 x k 0..4, three procs)'
  end subroutine c1_shapes

  subroutine c2_scale()
    integer, parameter :: N = 24
    real(wp) :: m(3,N), c(2,N), ms(3,N), cs(2,N)
    real(wp) :: lam, detr, kap, sp, rs, mgc, mgk, d4(4)
    real(wp) :: lam2, detr2, kap2, sp2, rs2, mgc2, mgk2, d42(4), e1, e2
    integer :: rc, rc2, it, i, j, a(3), b(2)
    character(8) :: t2
    do it = 1, 2000
      do i = 1, 3
        a(i) = rndi(-500, 500)
        do j = 1, N
          m(i,j) = 2.0_wp*rnd() - 1.0_wp + 0.11_wp*sin(real(i*j, wp))
        end do
      end do
      do i = 1, 2
        b(i) = rndi(-500, 500)
        do j = 1, N
          c(i,j) = 2.0_wp*rnd() - 1.0_wp + 0.07_wp*cos(real(i+j, wp))
        end do
      end do
      do i = 1, 3
        ms(i,:) = scale(m(i,:), a(i))
      end do
      do i = 1, 2
        cs(i,:) = scale(c(i,:), b(i))
      end do
      call kernel_full(m,  c,  tk, wy, rc,  lam,  detr,  kap,  sp,  rs,  mgc,  mgk,  d4)
      call kernel_full(ms, cs, t2, wy, rc2, lam2, detr2, kap2, sp2, rs2, mgc2, mgk2, d42)
      total = total + 1
      if (rc /= rc2 .or. tk /= t2) then
        call fixture('C2','route-drift', it, rc, rc2, 0)
      else if (rc == RC_LOCK) then
        if (abs(detr - detr2) > 1.0e-9_wp .or. abs(abs(lam) - abs(lam2)) > 1.0e-9_wp) &
             call fixture('C2','value-drift', it, rc, 0, 0)
      end if
      e1 = eta_share(m(1,:), c); e2 = eta_share(ms(1,:), cs)
      total = total + 1
      if (is_finite(e1) .neqv. is_finite(e2)) then
        call fixture('C2','eta-route', it, 0, 0, 0)
      else if (is_finite(e1)) then
        if (abs(e1 - e2) > 1.0e-9_wp) call fixture('C2','eta-drift', it, 0, 0, 0)
      end if
    end do
    write(*,'(a)') 'C2 scale invariance done (2000 iters, exact power-of-two row/cov scaling)'
  end subroutine c2_scale

  subroutine c3_pathology()
    integer :: it, n, k, i, j, cls
    real(wp), allocatable :: m(:,:), c(:,:)
    real(wp) :: lam, detr, kap, sp, rs, mgc, mgk, d4(4), v, ev
    integer :: rc
    logical :: badm, badc
    do it = 1, 5000
      n = rndi(8, 32); k = rndi(0, 2)
      allocate(m(3,n), c(max(k,0),n))
      badm = .false.; badc = .false.
      do i = 1, 3
        do j = 1, n
          cls = rndi(1, 12)
          select case (cls)
          case (1); v = qnan(); badm = .true.
          case (2); v = ieee_value(1.0_wp, ieee_positive_inf); badm = .true.
          case (3); v = -ieee_value(1.0_wp, ieee_positive_inf); badm = .true.
          case (4); v = 0.5_wp*tiny(1.0_wp)
          case (5); v = tiny(1.0_wp)
          case (6); v = 0.9_wp*sqrt(huge(1.0_wp))
          case (7); v = 0.125_wp*huge(1.0_wp)
          case (8); v = 0.25_wp*huge(1.0_wp)
          case (9); v = -0.5_wp*huge(1.0_wp)
          case (10); v = -0.0_wp
          case default; v = 2.0_wp*rnd() - 1.0_wp
          end select
          m(i,j) = v
        end do
      end do
      do i = 1, k
        do j = 1, n
          cls = rndi(1, 12)
          select case (cls)
          case (1); v = qnan(); badc = .true.
          case (2); v = ieee_value(1.0_wp, ieee_positive_inf); badc = .true.
          case (3); v = -ieee_value(1.0_wp, ieee_positive_inf); badc = .true.
          case (4); v = 0.5_wp*tiny(1.0_wp)
          case (5); v = 0.25_wp*huge(1.0_wp)
          case (6); v = -0.0_wp
          case default; v = 2.0_wp*rnd() - 1.0_wp
          end select
          c(i,j) = v
        end do
      end do
      call kernel_full(m, c, tk, wy, rc, lam, detr, kap, sp, rs, mgc, mgk, d4)
      total = total + 1
      if (badm) then
        if (rc /= RC_INTAKE) call fixture('C3','miss-badm', it, n, k, rc)
      else if (badc) then
        if (.not. (rc == RC_INTAKE .or. rc == RC_COVBLOCK)) call fixture('C3','miss-badc', it, n, k, rc)
      else
        if (rc < RC_SHORTFALL .or. rc > RC_LOCK) call fixture('C3','route-wild', it, n, k, rc)
        if (rc == RC_LOCK) then
          if (.not.(is_finite(lam) .and. is_finite(detr) .and. is_finite(kap) .and. &
               is_finite(sp) .and. is_finite(rs))) call fixture('C3','nan-lock', it, n, k, rc)
        end if
      end if
      ev = eta_share(m(1,:), c)
      total = total + 1
      if ((badm .or. badc)) then
        if (is_finite(ev)) then
          if (any(.not. is_finite(m(1,:))) .or. badc) call fixture('C3','eta-bad', it, n, k, 0)
        end if
      end if
      deallocate(m, c)
    end do
    write(*,'(a)') 'C3 pathological float classes done (5000 iters, NaN/Inf/subnormal/near-huge/signed-zero)'
  end subroutine c3_pathology

  subroutine c4_int_meta()
    integer :: it, i
    integer(ik) :: q(4), r(4), s4(4), o1(8), o2(8), p(8)
    integer(ik) :: nq, nr, np
    do it = 1, 20000
      do i = 1, 4
        q(i) = int(rndi(-8192, 8192), ik)
        r(i) = int(rndi(-8192, 8192), ik)
      end do
      s4 = iqconj(iqconj(q))
      total = total + 1
      if (any(s4 /= q)) call fixture('C4','iqconj-invol', it, int(q(1)), int(q(2)), 0)
      nq = inrm(q); nr = inrm(r); np = inrm(iqmul(q, r))
      total = total + 1
      if (np /= nq*nr) call fixture('C4','q-normmult', it, int(nq), int(nr), int(np))
      do i = 1, 8
        o1(i) = int(rndi(-4096, 4096), ik)
        o2(i) = int(rndi(-4096, 4096), ik)
      end do
      p = ioconj(ioconj(o1))
      total = total + 1
      if (any(p /= o1)) call fixture('C4','ioconj-invol', it, int(o1(1)), 0, 0)
      nq = inrm(o1); nr = inrm(o2); np = inrm(iomul(o1, o2))
      total = total + 1
      if (np /= nq*nr) call fixture('C4','o-normmult', it, int(nq), int(nr), int(np))
    end do
    write(*,'(a)') 'C4 integer metamorphic done (20000 iters: conj involutions, composition norms, quaternion+octonion)'
  end subroutine c4_int_meta

  subroutine c5_real_meta()
    integer :: it, i
    real(wp) :: a(4), b(4), c4a(4), ab(4), bc(4), l(4), r(4), na, nb, nab, tol
    do it = 1, 20000
      do i = 1, 4
        a(i) = 2.0_wp*rnd() - 1.0_wp
        b(i) = 2.0_wp*rnd() - 1.0_wp
        c4a(i) = 2.0_wp*rnd() - 1.0_wp
      end do
      ab = qmul(a, b); bc = qmul(b, c4a)
      l = qmul(ab, c4a); r = qmul(a, bc)
      total = total + 1
      tol = 64.0_wp*epsilon(1.0_wp)*max(1.0_wp, maxval(abs(l)))
      if (maxval(abs(l - r)) > tol) call fixture('C5','q-assoc', it, 0, 0, 0)
      total = total + 1
      if (any(qconj(qconj(a)) /= a)) call fixture('C5','qconj-bits', it, 0, 0, 0)
      na = sum(a*a); nb = sum(b*b); nab = sum(ab*ab)
      total = total + 1
      if (abs(nab - na*nb) > 64.0_wp*epsilon(1.0_wp)*max(1.0_wp, na*nb)) &
           call fixture('C5','q-normmult-real', it, 0, 0, 0)
    end do
    write(*,'(a)') 'C5 real-quaternion metamorphic done (20000 iters: associativity, conj bit-involution, norm product)'
  end subroutine c5_real_meta
end program ra_fuzz
