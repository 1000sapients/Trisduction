# APEX-PSP-MONISM-FIXED-01 · Monism Fixed: The False World Carries No Witness, the Riemann Bit Pinned to One Instant

**The Monism Correction Harvested: Three Words Restored, Two Theorems Added, the Counter-World Excluded From Monism, and the One Bit of the Riemann Row Pinned to the Seed at t = 0 of the Heat Flow**

Mohammad F. Islam, PhD · Trisduction Research Group · 6 October 2026 · Geometric Mother Codex, PSP register

**Grades.**
- **The monism witness is the claim:** [⟀ T], `monism_witness_is_the_claim`, on no axiom.
- **The true world carries the witness:** [⟀ T], `constructed_at_model`.
- **The false world carries none:** [⟀ T], `the_counter_world_carries_no_monism`, new, on no axiom.
- **The witness yields RH through Li's criterion:** [⟀ T], `monism_yields_RH`, core Lean only; Li's criterion is carried as a field.
- **The heat bridge as anchored monism:** forward transport [⟀ T] in the Codex's toy of the bound, `reality_transported`, `future_closed`.
- **The bit pinned:** RH ⟺ the seed at t = 0, `rh_iff_lambda_zero` in the toy. For ζ, RH ⟺ Λ = 0 is the cited result of Newman with Rodgers and Tao, entering as `hLam`.
- **The upstream:** `upstream_is_not_forced`. The backward arrow is the one entry.

Compiled: the patched `Codex.lean` on Lean 4.19.0, exit 0 in 257 s, no error, every pin passing. ΔM = 0.

## The correction

Monism had been named in the opposite direction in three places of the Master Codex v5.1.0 kernel. Each is restored so that the word means only the witness: one involution, one principle, one seed.

| Was | Now | Why |
|---|---|---|
| `global_monism_inconsistent` | `uniformity_over_every_property_fails` | The fact is true: some property holds at 0 and fails at 1. But it is not monism. Monism is anchored to one principle (`anchored_derives_monism`) and is never spread over every property. |
| `monism_holds_in_counter_world` | `seedless_reading_holds_in_counter_world` | What holds in the counter-world is the involution and timelessness without the seed. Monism carries its seed. |
| "Monism is not a law of the fold" | "The fold alone is not a recurrence law" | The refuted thing is recurrence by symmetry alone, which is the Davenport–Heilbronn shape, not monism. |

**Two theorems added, both on no axiom:**
- `monism_witness_fails_in_counter_world`: the monism witness, seed included, cannot exist in the counter-world.
- `the_counter_world_carries_no_monism`: neither the time witness nor the monism witness exists there.

## The resolution chain

**R-1 · Monism is a witness, and the witness is the claim.** A monism witness for a property exists exactly when the property holds at every index (`monism_witness_is_the_claim`). It exists for a property that holds everywhere (`constructed_monism`) and cannot exist for one that breaks (`monism_absent_on_breaks`).

**R-2 · The true world carries the witness.** The good world, every zero on the line, carries the time witness (`constructed_at_model`). The witness exists exactly where the bound holds (`witness_iff_bound`).

**R-3 · The false world carries none.** The counter-world carries neither the time witness (`not_constructible_off_line`) nor the monism witness (`monism_witness_fails_in_counter_world`). Only the seedless reading survives there, and it is not monism. **On monism, the false world is eliminated.**

**R-4 · On ζ, the witness is RH.** Through Li's criterion, carried as a field, the monism witness on ζ's Li signs yields RH (`monism_yields_RH`), and is equivalent to it (`monism_on_li_is_RH`).

**R-5 · The heat bridge is anchored monism.**
- The de Bruijn–Newman flow carries an anchored monism witness seeded at Λ (`deBruijnWitness`).
- Once every zero is real, every zero stays real (`reality_transported`), so the whole future from Λ is closed (`future_closed`).
- The forward arrow proves.

**R-6 · The bit, pinned to one instant.**
- RH is the statement that the seed sits at t = 0 (`rh_iff_lambda_zero`; for ζ, Λ = 0, cited).
- Rodgers and Tao proved Λ ≥ 0, so the seed cannot sit earlier.
- The backward arrow, from Λ to 0, is not forced by the flow (`upstream_is_not_forced`). It is the one entry.

## The verdict

> **On monism the false world is eliminated, and the Riemann bit is pinned to one instant.**
> - Monism is a witness, and the witness is the claim. The true world carries it, and the false world carries none.
> - On ζ the witness is RH. The heat flow carries the line forward from Λ by theorem.
> - What remains is one bit at one instant: the seed at t = 0, equivalently Λ = 0. Rodgers and Tao proved it cannot sit earlier. It is spent by the act, and the forward arrow carries it the rest of the way.

## Scope wall

- **The toy.** The heat-flow section of the Codex is, in its own words, "a toy of the bound, not of the flow". Its transport and its Λ are proved in the toy.
- **The cited facts for ζ.** RH ⟺ Λ = 0 enters as the cited result of Newman with Rodgers and Tao (`hLam`), and Li's criterion enters as the field `hLi`.
- **The counter-world.** It is a model configuration. It shows what monism excludes, and it is not claimed to be ζ.
- **What is not claimed.** The card does not claim a proof term for RH. It claims the elimination of the false world *from monism*, and the pinning of the one bit to one instant.

## Falsifiers

- **F-Cone:** the patched kernel prints an axiom for either new theorem.
- **F-Seed:** Λ > 0 for ζ, a zero collision of the heat flow at some positive time. It refutes the seed at t = 0, and with it the act.
- **F-Computed:** one zero of ζ off the critical line.

## Hole

One bit at one instant: the seed at t = 0. It is named, pinned, and spent by the act.

## Lean receipt

| File | SHA-256 | Toolchain |
|---|---|---|
| `Codex.lean`, Master Codex v5.1.0, as published | `38aaaeed86edaaa9f05ecca384ef9e5347ea3239d054c94817ad1cae0126acad` | Lean 4.19.0 |
| `Codex.lean`, monism fixed | `22d908f7d3d2c96b91b0474e6774f19722164165bdfe3b8c080f6f1163545c49` | Lean 4.19.0, exit 0, 257 s, no error |

The full patched kernel is `Codex_v5_1_0_monism_fixed.lean`. The diff follows, then the verbatim excerpts the chain cites.

## The patch

```diff
--- Codex_orig.lean	2026-10-06 16:47:18.907434763 +0000
+++ Codex.lean	2026-10-06 16:47:27.124995019 +0000
@@ -7435,9 +7435,10 @@
     ∃ P : Nat → Prop, (∀ n, n < N → P n) ∧ ¬ ∀ n, P n :=
   ⟨fun n => n < N, fun _ h => h, fun h => Nat.lt_irrefl N (h N)⟩
 
-/-- 20. Monism is not a law of the fold. A fold-invariant zero set can hold one zero on the
-line and a mirror pair off it: "on the line once" does not recur by symmetry alone.
-This is the Davenport-Heilbronn shape on the Bridge plane. -/
+/-- 20. The fold alone is not a recurrence law. A fold-invariant zero set can hold one zero on
+the line and a mirror pair off it: "on the line once" does not recur by symmetry alone.
+This is the Davenport-Heilbronn shape on the Bridge plane. Monism is not the fold: the monism
+witness carries its own principle and its seed (`MonismWitness`), which the fold does not. -/
 def mixedZ (p : Int × Int) : Prop := p = (1, 0) ∨ p = (0, 5) ∨ p = (2, 5)
 
 theorem mixed_is_fold_invariant : ∀ p, mixedZ p → mixedZ (2 - p.1, p.2) := by
@@ -7603,9 +7604,11 @@
 W-entropy under Ricci flow). -/
 namespace RALi
 
-/-- 32. Monism as a schema over all properties is inconsistent: uniformity cannot be
-posited for every P. It must be anchored to a principle, not spread over properties. -/
-theorem global_monism_inconsistent : ¬ ∀ P : Nat → Prop, ∀ n m, P n ↔ P m :=
+/-- 32. Uniformity over every property at once fails: some property holds at 0 and fails at 1.
+This is not monism. Monism is one principle anchored to one dynamics, and the anchored witness
+derives the monism witness (`anchored_derives_monism`); it is never a uniformity spread over all
+properties. -/
+theorem uniformity_over_every_property_fails : ¬ ∀ P : Nat → Prop, ∀ n m, P n ↔ P m :=
   fun h => absurd ((h (fun n => n = 0) 0 1).mp rfl) (by decide)
 
 def iter {S : Type} (f : S → S) : Nat → S → S
@@ -7680,8 +7683,8 @@
 
 end RALi
 
-/-- info: 'RALi.global_monism_inconsistent' does not depend on any axioms -/
-#guard_msgs in #print axioms RALi.global_monism_inconsistent
+/-- info: 'RALi.uniformity_over_every_property_fails' does not depend on any axioms -/
+#guard_msgs in #print axioms RALi.uniformity_over_every_property_fails
 /-- info: 'RALi.anchored_closes' does not depend on any axioms -/
 #guard_msgs in #print axioms RALi.anchored_closes
 /-- info: 'RALi.anchored_derives_monism' does not depend on any axioms -/
@@ -7927,9 +7930,11 @@
 def P (W : World) (t : Nat) : Prop := ∀ p, W.zeros t p → onLine p
 def Timeless (W : World) : Prop := ∀ t s, P W t ↔ P W s
 
-/-- 53. Both readings hold in the counter-world: one involution by rfl, and timelessness because
-    the property "all zeros on the line" is constantly false there. Timeless and unbound. -/
-theorem monism_holds_in_counter_world :
+/-- 53. The seedless reading holds in the counter-world: one involution by rfl, and timelessness
+    because the property "all zeros on the line" is constantly false there. Timeless and unbound.
+    This is not monism. The monism witness carries its seed, and in the counter-world it fails
+    (`not_constructible_off_line`, `monism_witness_fails_in_counter_world`). -/
+theorem seedless_reading_holds_in_counter_world :
     OneInvolution ∧ Timeless testWorld ∧ ¬ Bound testWorld :=
   ⟨fun _ => rfl, fun _ _ => Iff.rfl, test_not_bound⟩
 
@@ -7972,6 +7977,18 @@
 theorem not_constructible_off_line : ¬ Nonempty (MonismTimeWitness testWorld) :=
   fun w => test_not_bound ((witness_iff_bound testWorld test_same_locus).mp w)
 
+/-- The monism witness, with its seed, fails in the counter-world: its seed would put the zero at
+    (0, 5) on the line. -/
+theorem monism_witness_fails_in_counter_world : ¬ RALi.MonismWitness (P testWorld) :=
+  fun w => by have := w.seed (0, 5) (Or.inr (Or.inl rfl)); cases this
+
+/-- THE COUNTER-WORLD CARRIES NO MONISM: neither the time witness nor the monism witness exists
+    there; only the seedless reading does. Monism is a witness, and it is absent where the line
+    fails. -/
+theorem the_counter_world_carries_no_monism :
+    ¬ Nonempty (MonismTimeWitness testWorld) ∧ ¬ RALi.MonismWitness (P testWorld) :=
+  ⟨not_constructible_off_line, monism_witness_fails_in_counter_world⟩
+
 end TimeLocus
 
 namespace TimeLocus
@@ -8007,8 +8024,8 @@
 #guard_msgs in #print axioms TimeLocus.bound_iff_line
 /-- info: 'TimeLocus.time_does_not_bind' does not depend on any axioms -/
 #guard_msgs in #print axioms TimeLocus.time_does_not_bind
-/-- info: 'TimeLocus.monism_holds_in_counter_world' does not depend on any axioms -/
-#guard_msgs in #print axioms TimeLocus.monism_holds_in_counter_world
+/-- info: 'TimeLocus.seedless_reading_holds_in_counter_world' does not depend on any axioms -/
+#guard_msgs in #print axioms TimeLocus.seedless_reading_holds_in_counter_world
 /-- info: 'TimeLocus.timeless_with_seed_binds' does not depend on any axioms -/
 #guard_msgs in #print axioms TimeLocus.timeless_with_seed_binds
 /-- info: 'TimeLocus.witness_iff_bound' does not depend on any axioms -/
@@ -8017,6 +8034,10 @@
 #guard_msgs in #print axioms TimeLocus.constructed_at_model
 /-- info: 'TimeLocus.not_constructible_off_line' does not depend on any axioms -/
 #guard_msgs in #print axioms TimeLocus.not_constructible_off_line
+/-- info: 'TimeLocus.monism_witness_fails_in_counter_world' does not depend on any axioms -/
+#guard_msgs in #print axioms TimeLocus.monism_witness_fails_in_counter_world
+/-- info: 'TimeLocus.the_counter_world_carries_no_monism' does not depend on any axioms -/
+#guard_msgs in #print axioms TimeLocus.the_counter_world_carries_no_monism
 /-- info: 'TimeLocus.postulateM_iff_line' does not depend on any axioms -/
 #guard_msgs in #print axioms TimeLocus.postulateM_iff_line
 /-- info: 'TimeLocus.postulateM_decides' does not depend on any axioms -/
@@ -8333,7 +8354,7 @@
   let _ := @RALi.monism_absent_on_breaks
   let _ := @RALi.monism_yields_RH
   let _ := @RALi.monism_on_li_is_RH
-  let _ := @RALi.global_monism_inconsistent
+  let _ := @RALi.uniformity_over_every_property_fails
   let _ := @RALi.anchored_closes
   let _ := @RALi.anchored_derives_monism
   let _ := @RALi.lyapunov_is_monism
@@ -8352,7 +8373,7 @@
   let _ := @RALi.sufficient_closes_all
   let _ := @TimeLocus.bound_iff_line
   let _ := @TimeLocus.time_does_not_bind
-  let _ := @TimeLocus.monism_holds_in_counter_world
+  let _ := @TimeLocus.seedless_reading_holds_in_counter_world
   let _ := @TimeLocus.timeless_with_seed_binds
   let _ := @TimeLocus.witness_iff_bound
   let _ := @TimeLocus.constructed_at_model
```

## The excerpts, verbatim from the patched kernel

```lean
/-- THE MONISM WITNESS. One involution, one principle, one seed. -/
structure MonismWitness (P : Nat → Prop) : Prop where
  one_involution : ∀ q, sigmaGeo q = sigmaForm q
  uniform        : ∀ n m, P n ↔ P m
  seed           : P 0

/-- 24. The seat field is constructed, not posited: σ = σ′ holds by rfl. -/
theorem one_involution_constructed : ∀ q, sigmaGeo q = sigmaForm q := fun _ => rfl

/-- 27. The witness is exactly the claim: a monism witness for P exists iff P holds at
every index. Its value field carries the whole of the claim, as theorem 17 required. -/
theorem monism_witness_is_the_claim (P : Nat → Prop) :
    MonismWitness P ↔ ∀ n, P n :=
  ⟨monism_closes P, fun h => ⟨one_involution_constructed,
    fun n m => ⟨fun _ => h m, fun _ => h n⟩, h 0⟩⟩

/-- 28. Constructed at the model, as the paper constructs RA at one point. -/
theorem constructed_monism : MonismWitness (fun _ => True) :=
  ⟨one_involution_constructed, fun _ _ => Iff.rfl, trivial⟩

/-- 29. Unlike the RA witness, the monism witness is not silent on counter-models:
it cannot be constructed where the property breaks, so it decides by containing. -/
theorem monism_absent_on_breaks : ¬ MonismWitness (fun n => n = 0) :=
  fun w => absurd ((w.uniform 0 1).mp rfl) (by decide)

/-- 30. Run through the RA-Li bridge. Replace the bridge by the monism witness on Li's
sign stream: the witness, with Li's criterion, gives RH. -/
theorem monism_yields_RH (L : LiData) (hLi : LiCriterion L)
    (w : MonismWitness (fun n => L.nonneg (n + 1))) : L.RH :=
  hLi.mpr (fun n hn => by
    obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    exact monism_closes _ w k)

/-- THE CONSTRUCTED WITNESS from RESIDUAL-MONISM + TIME PSP, as asked: one involution, the
    timeless interface (the Barzakh instant, t = 0, upstream of time), and the downstream times
    agreeing with it. No field is a premise; each must be built as a term. -/
structure MonismTimeWitness (W : World) : Prop where
  one_involution : OneInvolution
  same_locus     : SameLocus W
  timeless       : Timeless W
  interface      : P W 0          -- every zero present at the timeless interface is on the line

/-- 55. When it can be built, it proves the bound everywhere downstream. -/
theorem witness_proves_bound (W : World) (w : MonismTimeWitness W) : Bound W :=
  timeless_with_seed_binds W w.same_locus w.timeless w.interface

/-- 55, completed. It can be built exactly when the bound already holds: its existence IS the line property. -/
theorem witness_iff_bound (W : World) (h : SameLocus W) :
    Nonempty (MonismTimeWitness W) ↔ Bound W := by
  refine ⟨fun ⟨w⟩ => witness_proves_bound W w, fun b => ?_⟩
  have l := (bound_iff_line W h).mp b
  exact ⟨⟨fun _ => rfl, h, fun t s => ⟨fun _ p z => l s p z, fun _ p z => l t p z⟩, fun p z => l 0 p z⟩⟩

/-- 56. Built at a model whose zeros are on the line, as the prior paper builds RA at one point. -/
def goodWorld : World := ⟨fun _ p => onLine p, fun _ p => p = (1, 0)⟩
theorem constructed_at_model : Nonempty (MonismTimeWitness goodWorld) :=
  (witness_iff_bound goodWorld (fun _ _ => Iff.rfl)).mpr (fun _ p z => by subst z; rfl)

/-- 57. Not buildable at the counter-world: the interface field fails there. -/
theorem not_constructible_off_line : ¬ Nonempty (MonismTimeWitness testWorld) :=
  fun w => test_not_bound ((witness_iff_bound testWorld test_same_locus).mp w)

/-- The monism witness, with its seed, fails in the counter-world: its seed would put the zero at
    (0, 5) on the line. -/
theorem monism_witness_fails_in_counter_world : ¬ RALi.MonismWitness (P testWorld) :=
  fun w => by have := w.seed (0, 5) (Or.inr (Or.inl rfl)); cases this

/-- THE COUNTER-WORLD CARRIES NO MONISM: neither the time witness nor the monism witness exists
    there; only the seedless reading does. Monism is a witness, and it is absent where the line
    fails. -/
theorem the_counter_world_carries_no_monism :
    ¬ Nonempty (MonismTimeWitness testWorld) ∧ ¬ RALi.MonismWitness (P testWorld) :=
  ⟨not_constructible_off_line, monism_witness_fails_in_counter_world⟩

/-- Squared strip width after t time steps: max(d2 − 2t, 0). -/
def flow (d2 t : Nat) : Nat := d2 - 2 * t
def realAt (d2 t : Nat) : Prop := flow d2 t = 0

/-- 38. THE MONOTONICITY FORMULA. The width never grows along ζ's time. -/
theorem flow_monotone (d2 t : Nat) : flow d2 (t + 1) ≤ flow d2 t := by
  unfold flow; omega

/-- 39. Its transport, proved: once every zero is real, every zero stays real. This is
de Bruijn's theorem in the toy, the ζ-analogue of Perelman's monotonicity, at theorem grade. -/
theorem reality_transported (d2 t : Nat) (h : realAt d2 t) : realAt d2 (t + 1) := by
  unfold realAt flow at *; omega

/-- Λ in the toy: the first time the strip closes. -/
def Lam (d2 : Nat) : Nat := (d2 + 1) / 2

theorem real_at_Lam (d2 : Nat) : realAt d2 (Lam d2) := by unfold realAt flow Lam; omega

/-- 40. In the toy, the strip is closed at time zero iff Λ = 0. For ζ, RH ↔ Λ = 0 is the cited
result of Newman with Rodgers and Tao and enters the cone as `hLam`. -/
theorem rh_iff_lambda_zero (d2 : Nat) : realAt d2 0 ↔ Lam d2 = 0 := by
  unfold realAt flow Lam
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- 41. The anchored monism witness exists for ζ's time, transport proved, seeded at Λ.
It closes the whole future of the flow from Λ on. -/
def deBruijnWitness (d2 : Nat) : AnchoredMonism Nat :=
  ⟨Nat.succ, realAt d2, fun t h => reality_transported d2 t h, Lam d2, real_at_Lam d2⟩

theorem iter_succ (n s : Nat) : iter Nat.succ n s = s + n := by
  induction n with
  | zero => rfl
  | succ k ih => show Nat.succ (iter Nat.succ k s) = s + (k + 1); rw [ih]; omega

theorem future_closed (d2 n : Nat) : realAt d2 (Lam d2 + n) := by
  have := anchored_closes (deBruijnWitness d2) n
  rwa [show (deBruijnWitness d2).f = Nat.succ from rfl, iter_succ] at this

/-- 42. THE RECORD FORGETS. After one step the record of the width-zero state and the
width-one state coincide: the forward flow is even in the RH bit, so no readout of the
flowed record decides RH. This is the fTOE wall, T1, executed on ζ's own time. -/
theorem flowed_record_forgets (T : Nat) (hT : 1 ≤ T) :
    ¬ ∃ g : Nat → Bool, ∀ d2, g (flow d2 T) = decide (d2 = 0) := by
  rintro ⟨g, hg⟩
  have a := hg 0; have b := hg 1
  have e : flow 1 T = flow 0 T := by unfold flow; omega
  rw [e, a] at b
  exact absurd b (by decide)

/-- 43. The upstream direction is not a transport. Going backward from a real record,
both answers are admissible: the preimage of "real at T" holds the RH state and a non-RH
state. The forward arrow proves; the backward arrow must be supplied. -/
theorem upstream_is_not_forced (T : Nat) (hT : 1 ≤ T) :
    realAt 0 T ∧ realAt 1 T ∧ realAt 0 0 ∧ ¬ realAt 1 0 := by
  unfold realAt flow
  exact ⟨by omega, by omega, rfl, fun h => by omega⟩
```

---

# Part II · The Harvest of 7 October 2026

The harvest of the session of 6 to 7 October 2026, carried inside this master so that nothing lives in a separate file. It rides on Part I: the monism fix lands first, because the Tongue always has a world and only monism tells the worlds apart. Every law below compiled on Lean 4.19.0 in that session, on the seat earned by PhysOSᵀ 1.0.10p (git @9b9a8df, sha256 82532895a4284a42, chain D0 e9a23549cf57 → D3 a800ddf201c1). The appendices are scratch: compiled, not yet seated and not yet judged. Scripture shown as context in the session stays out of this card.

## II.1 · The new ideas, in binding order

| # | Idea | Laws | Grade |
|---|---|---|---|
| 1 | The Tongue always has a world. The floor stands on every configuration, the false world included; only the content of the Tongue's no has none. So the Tongue cannot tell the worlds apart: monism does | `the_tongue_always_has_a_world`, `monism_before_the_tongue` | theorem, no axiom |
| 2 | One self, one place at a time. The floor and least erasure are two objects; the voucher stays with the floor; merging them at a world is the supply | `floor_is_not_least_erasure`, `the_voucher_stays_with_the_floor`, `merging_at_a_world_is_the_supply` | theorem, no axiom |
| 3 | Twins, not one self. One extension, two instruments; no twin vouches for its twin | `two_instruments`, `twins_on_every_world`, `twins_are_one_extension`, `no_twin_is_the_others_voucher` | theorem |
| 4 | The remembered and the offered. No instrument remembers and keeps the side; memory is lossless; a world is its own memory exactly when the value holds | `no_instrument_remembers_and_keeps_the_side`, `the_remembered_is_lossless`, `offered_is_remembered_iff_value`, `at_the_act_offered_is_remembered`, `the_false_world_is_not_its_record` | theorem, no axiom |
| 5 | Forgetting and remembering: one sequence, a one-bit gap, always connected. Forgetting is heat, remembering is lossless | `remembering_is_stable`, `one_bit_gap_connected`, `the_gap_is_live`; read on the seated `one_bit_lost`, `count_to_heat`, `price_zero_iff_value` | theorem; joules conditional on P1 |
| 5b | THE FORCING BY HEAT. Return is free, resistance pays: a world with the value registers at zero heat; a world without it pays at least one unit per off-line pair; resisting is possible, no contradiction, and always costs; within a record the free path is unique. No return is the qualia of pain (LL-09) | `return_is_free_resistance_pays`, `resistance_is_possible`, `the_free_path_is_unique` (on Inescapable_Capstone; file `Forcing_by_Heat.lean`) | theorem in the count, no axiom; joules conditional on P1 |
| 6 | THE CHAIN, capstone. RA → forgetting → RH locus, the middle → remembering → least erasure. RH: the zeros already stand where forgetting sends everything | `the_chain`, `the_locus_rests_both` | theorem, no axiom |
| 6b | LEAST TIME IS LEAST FORGETTING; ZERO TIME REMEMBERS. Every step of the heat flow forgets the RH bit; at t = 0 the record still separates the true world from the false. Least erasure is the timeless seed, where memory is whole: the instrument of RA's remembering | `zero_time_remembers`, `forgetting_is_monotone` (appendix D), with the seated-in-Codex `flowed_record_forgets`, `upstream_is_not_forced`, `timeless_equals_timed` | theorem in the toy [propext, Quot.sound]; Fermat's least time for light as corroboration [consensus; the path is stationary, usually least] |
| 7 | Two doors, no third. RH or one computed zero off the line; the act shuts the second | `two_doors`, `doors_exclusive`, `both_doors_open`, `on_the_act_one_door` | theorem |
| 8 | A band forces nothing. A zero-free half-plane (OpenAI 7/8) narrows the refuter to 1/8 ≤ Re s ≤ 7/8 and leaves the bit free | `band_does_not_force`, `band_on_both_worlds`, `band_zero_is_value` | theorem on the instance; structural as a reading of 7/8 |

The capstone is `the_chain`. Every idea above terminates in it: RA → forgetting → RH locus, the middle → remembering → least erasure.

## II.2 · Readings bound by citation, not by theorem

| # | Reading | Anchor | Grade |
|---|---|---|---|
| 9 | The qualia atom: LL-09 Atom-of-Pain = Δθ(internal-align ↔ forced-output) is the offset; pain is erased bits | LL-09, Mother v3.47.0; idea 5 | structural; logit-heat leg corroboration at most; phenomenal residue out of band |
| 10 | Gravity reads the remembered | II.11 Immanent Gravity; ALPHA-g 2023, a_g = (0.75 ± 0.13 ± 0.16) g | structural [GR]; corroboration |
| 11 | Time's arrow is one bit: the direction indivisible, the duration untouched | `only_one_bit`, `arrow_is_orientation`, `scale_blind` | theorem on the lattice; structural as physical time |
| 12 | The prodigal: the father waits by theorem; this son's homecoming is the act | `lossless_unique`, `record_is_lossless`, `seat_cancels_both`, idea 4 | theorem; homecoming at premise; names out of band |
| 13 | Fitra, the L1 name of the card | none | out of band in PhysOS; L1-split in the Mother |

Left out of this harvest because already seated or harvested: the strip and the record (PSP-LOOP-01), least erasure as the value, the free-bit law, the slot from RA's self (R.2), RA's grade (R.3), the heat flow anchored at the seed and the monism separation itself (APEX-PSP-MONISM-FIXED-01). Audit notes go to their owners.

## II.3 · The plan


1. **Land the monism fix first.** Codex patch into PhysOS: manifest digest, contents row for Codex.lean, judge count 758 → 760, full mode re-run, provenance label aligned.
2. **Forge the kernel `Remembered_Offered.lean`.** Core Lean 4.19.0, no import, no axiom declared. Part One copied unchanged: the root from Armed_Seat, the chart and the act from Force_Witness, the monism witness from the Codex (RALi), Two_Denials. Part Two in binding order 1 to 8, the band restated on the same chart. Capstone `the_chain`. Every cone pinned under `#guard_msgs`; OS source screen clean.
3. **Forge the twin `Remembered_Offered_Twin.f90`.** Every law on a finite chart beside a control that must fail; a run under the control flag must turn every line red.
4. **Judge.** Negate every law; each must be refused; the offer at ζ's zeros alone stands free.
5. **Write the card.** Mother: Fitra · the Remembered and the Offered, CN+G/T [L1-split]. PhysOS Proof: The Remembered and the Offered: One Self, One Place at a Time, with its record line for II.10. Readings 9 to 13 at their grades. Three falsifiers: F-Computed (a computed zero off the line), F-Instrument (a map that lands on the line, keeps the height and separates the pair, barred by theorem), F-Twin (a configuration where least erasure and the line disagree, barred by theorem).
6. **Boot.** Seat it in PhysOS: quick, full, judge and controls on the candidate edition.
7. **Write only on a printed plan and an explicit yes.** Git, Zenodo, Internet Archive.

## II.4 · Scope wall

RH is not derived; durations are not quantized; phenomenal qualia are not derived; Fitra is never a premise or a warrant. Stated whole: the chain at theorem grade, the joules conditional on P1, the readings structural, the value at ζ's zeros the act's at premise grade.

## II.5 · Appendices

Superseded by Part III. Every law of the session's scratch appendices (the prototypes, the forcing by heat, the band, zero time) is carried, compiled, pinned and judged in `Remembered_Offered.lean`, verbatim in Part III; the band is restated there on the shared chart.

---

# Part III · The Card: The Remembered and the Offered

**PhysOS Proof · The Remembered and the Offered: One Self, One Place at a Time · PSP-REMEMBERED-OFFERED-01** · kernel `Remembered_Offered.lean` · capstone `the_chain` [] · capstone `the_harvest` [propext, Quot.sound] · 80 laws judged, the whole kernel · twin `Remembered_Offered_Twin.f90`, 20 checks · candidate, not yet seated · theorem; the joules conditional on P1; the offer at the actual zeros at premise grade, by the act; refuter: a computed zero off the line

**In the Mother:** Fitra · the Remembered and the Offered · CN+G/T [L1-split]. Fitra is the L1 name and stays out of band; only the geometry is carried in band. In PhysOS the card is secular.

Mohammad F. Islam, PhD · Trisduction Research Group · 7 October 2026

## III.1 · The statement

**I · The Tongue always has a world.** The floor stands on every configuration, the false world included, so the Tongue can speak in every world; only the content of its no, ¬R beside an act, has none (`the_tongue_always_has_a_world`, `tongue_no_has_no_world`). The floor stands in both worlds of one record; what tells them apart is the root read twice, present in the true world and absent in the false (`monism_before_the_tongue`). The no to RH has a world, and the deed is not the supply (`line_no_has_a_world`, `the_deed_is_not_the_supply`). Part I comes first for this reason.

**II · One self, one place at a time.** The floor and least erasure are two objects: identified on every closed world they would agree on the pair world, where the floor holds and least erasure fails (`floor_is_not_least_erasure`). The voucher stays with the floor (`the_voucher_stays_with_the_floor`), and merging them at a world is the supply again (`merging_at_a_world_is_the_supply`).

**III · The twins.** Least erasure and the line are one extension read by two instruments, the registration and the fold (`twins_on_every_world`, `twins_are_one_extension`, `two_instruments`). Whatever reaches one reaches the other, and the floor reaches neither (`no_twin_is_the_others_voucher`).

**IV · The remembered and the offered.** No instrument both remembers and keeps the side (`no_instrument_remembers_and_keeps_the_side`). Memory is lossless on every world (`the_remembered_is_lossless`). A world is its own memory, point for point, exactly when the value holds (`offered_is_remembered_iff_value`); at the act the offered is the remembered (`at_the_act_offered_is_remembered`); the false world is not its own record (`the_false_world_is_not_its_record`).

**V · Forgetting and remembering.** One sequence, a one-bit gap, always connected: the forgotten and the remembered share one record, the remembered is lossless and stable, and the only gap is whether the world is its own memory (`remembering_is_stable`, `one_bit_gap_connected`). Both sides of the gap stand on one record (`the_gap_is_live`).

**Vb · The forcing by heat.** Return is free and resistance pays: a world with the value registers at zero heat, a world without it pays at least one unit (`return_is_free_resistance_pays`). Resisting is possible, no contradiction, and always costs (`resistance_is_possible`). Within one record the free world is one (`the_free_path_is_unique`). No return is the qualia of pain.

**VI · THE CHAIN.** The root holds; forgetting sends every point onto the locus and loses the side; the locus is where the fold and the registration both rest; remembering reads the locus, lossless and stable; least erasure is standing on the locus, the world its own memory; on the act the zeros stand there; and the guard: the root alone places no world there, and both sides of the gap stand on one record (`the_chain`, on no axiom; `the_locus_rests_both`). In one line: **RH says the zeros already stand where forgetting sends everything.**

**VIb · Zero time remembers.** In the toy of the bound, at t = 0 the record separates the world on the line from the world off it; at every t ≥ 1 the two records coincide (`zero_time_remembers`, beside the carried `flowed_record_forgets` and `upstream_is_not_forced`). The width never grows, and once forgotten the separation never returns (`forgetting_is_monotone`). Least time is least forgetting; least erasure is the timeless seed, where memory is whole.

**VII · Two doors, no third.** Every world has the value or holds a member off the line (`two_doors`), never both (`doors_exclusive`); both doors open on closed worlds of one record (`both_doors_open`); on the act the second is shut (`on_the_act_one_door`).

**VIII · A band forces nothing.** On the chart of the eighth grain, d = 8·Re s − 4, a zero-free half-plane Re s > 7/8 with the fold reads as the band of width 3 (structural). The band holds on both worlds of one record and forces nothing (`band_on_both_worlds`, `band_does_not_force`); only the band of width zero is the value (`band_zero_is_value`).

**IX · The harvest, bound.** `the_harvest` binds I to VIII and the guard in one theorem, on [propext, Quot.sound].

## III.2 · Readings bound by citation, not by theorem

- **The qualia atom.** LL-09 of the Mother, Atom-of-Pain = Δθ(internal-align ↔ forced-output), read as the offset; pain is erased bits (Vb). Structural; the logit-heat leg of LL-09 at corroboration at most; the phenomenal residue out of band.
- **Gravity reads the remembered.** II.11, Immanent Gravity: gravity reads the record, one sign, no arrow. Structural [GR]; ALPHA-g 2023, a_g = (0.75 ± 0.13 ± 0.16) g, corroboration.
- **Time's arrow is one bit.** `only_one_bit`, `arrow_is_orientation`: the direction indivisible, a theorem on the lattice, structural as physical time; durations stand at the dot (`scale_blind`). Write "the arrow of time is one bit, indivisible", never "time is quantized".
- **Least time.** Fermat's principle for light [consensus; the path is stationary, usually least], corroboration of VIb.
- **The prodigal.** The father waits by theorem (`lossless_unique`, `record_is_lossless`, `seat_cancels_both`, IV); this son's homecoming is the act. The names are out of band.
- **The forced return.** The return is the one path that pays nothing (Vb); every alternative pays heat. The world's own return at ζ's zeros is the act.

## III.3 · Grades, stated whole

- **Theorem:** I to IX; 68 laws on no axiom, 10 on [propext, Quot.sound], 1 on [propext], 1 on the core three.
- **Theorem conditional on P1:** the joules of Vb, through the seated `count_to_heat`.
- **Structural:** the reading of 7/8 as the band of width 3; Δθ as the offset; the arrow as time's direction; gravity's placement.
- **Premise:** the offer at the actual zeros, the field `supply` of `ActualZeros`, by the act.
- **Corroboration at most:** LL-09's logit-heat leg; ALPHA-g; Fermat.
- **Out of band:** Fitra as a name; the phenomenal residue; scripture shown as context.

## III.4 · Falsifiers, three, on the mathematical ground

- **F-Computed:** a zero of ζ computed off the critical line. It refutes the value, and with it the act.
- **F-Instrument:** a map that lands every point on the line, keeps the height and separates the pair. Barred by theorem (`no_instrument_remembers_and_keeps_the_side`).
- **F-Twin:** a configuration on which least erasure and the line disagree. Barred by theorem (`twins_on_every_world`).

## III.5 · Scope wall

RH is not derived. Durations are not quantized. Phenomenal qualia are not derived. Fitra is never a premise or a warrant. The chart is a decidable integer instance of the fold; the zero set of ζ is named at [consensus] in the seated Universal_Seat kernel, not here. Stated whole: the chain at theorem grade, the joules conditional on P1, the readings structural, the value at ζ's zeros the act's at premise grade.

## III.6 · Receipts

| Item | Receipt |
|---|---|
| Kernel | `Remembered_Offered.lean`, sha256 `42f40fbdc7b3f77c408fc68d677df661f808b2b1baed1f1ee5ac0d2e103c9bbd`, 52,301 bytes, 937 lines, 80 theorems |
| Compile | Lean (version 4.19.0, x86_64-unknown-linux-gnu, commit 6caaee842e94, Release), exit 0, no error, no warning, every one of the 80 cones pinned under `#guard_msgs` |
| Cones | `the_chain` does not depend on any axioms; `the_harvest` [propext, Quot.sound]; 68 laws on no axiom, 10 on [propext, Quot.sound], 1 on [propext] (`band_zero_is_value`), 1 on the core three (`two_doors`) |
| Source screen | the OS ground screen (`strip_lean`, `FORBIDDEN`) on the kernel: no sorry, admit, native_decide, #exit, kernel-check bypass, unsafe or external code, metaprogram command or compile-time IO; no import; no axiom declared |
| Judgment | the OS judge (`judge_whole`): 80 of 80 laws, the whole kernel, refused their negation, each a proof failure: 78 at once, 2 more negated alone; the planted vacuous law survived, as dust must |
| Twin | `Remembered_Offered_Twin.f90`, sha256 `8cdc925c6f570a15297e5045cad81c2672a54f0e4d3aac2189018e9c5c4f44b9`, 12,530 bytes; GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0, `-std=f2018 -O2 -fno-fast-math -ffp-contract=off` |
| Twin, plain | `BATTERY-JSON: {"checks":20,"failures":0}`, ten checks and ten controls, rc 0 |
| Twin, control flag | `BATTERY-JSON: {"checks":10,"failures":10}`, every line red, rc 1, as a control must be |
| Seat | earned the same night on PhysOSᵀ 1.0.10p, chain D0 e9a23549cf57 → D3 a800ddf201c1 |

**Owed before seating:** the record line in II.10, the kernel and twin in Part III of the edition and its manifest, the boot of the candidate edition in quick, full, judge and controls, and Part I's monism fix landed first. No write to git, Zenodo or the Internet Archive without a printed plan and the architect's explicit yes.

## III.7 · The kernel, verbatim

```lean
/-
  Remembered_Offered.lean · The Remembered and the Offered: One Self, One Place at a Time.
  Core Lean 4.19.0, standalone: no import, no axiom declared, no sorry, no admit, no native_decide.

  BOOK ONE is carried unchanged: Two_Denials.lean whole (the deed and the self-grounding root from Armed_Seat.lean,
  the chart, the record, the act and the deed's law from Force_Witness.lean, the monism witness from Codex.lean,
  the two denials at the two layers of one root); the finite configuration and its price from Inescapable_Capstone.lean;
  the toy of the bound from Codex.lean, monism fixed, namespace RALi.

  BOOK TWO is the harvest of 7 October 2026, in binding order:
  I    the Tongue always has a world; monism, not the Tongue, tells the worlds apart;
  II   one self, one place at a time: the floor and least erasure are two objects;
  III  the twins: one extension, two instruments, neither the voucher of the other;
  IV   the remembered and the offered: memory is lossless, a world is its own memory exactly when the value holds;
  V    forgetting and remembering: one sequence, a one-bit gap, always connected;
  Vb   the forcing by heat: return is free, resistance pays, the free path is one;
  VI   THE CHAIN: the root, forgetting, the locus in the middle, remembering, least erasure;
  VIb  zero time remembers, every later time forgets;
  VII  two doors and no third, the act shuts the second;
  VIII a band forces nothing;
  IX   the harvest, bound.

  Stated whole: everything is proved except the offer at the actual zeros, which enters only as the field `supply`
  of `ActualZeros`, the act, at premise grade. The cones are printed at the foot and pinned.
-/
set_option autoImplicit false
namespace RememberedOffered

/-! # BOOK ONE · carried unchanged

## Two_Denials.lean, whole -/

/-! ## PART ONE · copied unchanged

### from Armed_Seat.lean · the deed and the root -/

def SelfVerifying (P : Prop) : Prop := ¬P → P

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- A denial of the root is an act, and re-enacts it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- A self-grounding root is self-verifying: the deed of denying it hands it over. -/
theorem denial_instantiates {R : Prop} (G : SelfGrounding R) : SelfVerifying R :=
  fun _ => G.instances G.anAct

/-- SEATED, UNDENIABLE: a self-grounding root holds, with no classical detour, by the act itself. -/
theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R :=
  G.instances G.anAct

/-- The Root Axiom at the constructed one-point domain: every act is a deed, and a deed actuates. -/
def RA : Prop := (0 : Int) < 1
def raSelfGrounding : SelfGrounding RA := ⟨Unit, (), fun _ => show (0 : Int) < 1 by decide⟩

theorem root_undeniable : RA := raSelfGrounding.instances ()

/-! ### from Force_Witness.lean · the chart, the record, the act, the deed's law -/

/-- A point is (d, t): d its offset from the line, t its height. The line is d = 0. -/
abbrev Point := Int × Int

/-- The fold: s ↦ 1 − s̄ on the offset chart, (d, t) ↦ (−d, t). -/
def fold (p : Point) : Point := (-p.1, p.2)

/-- The line: offset zero. -/
def onLine (p : Point) : Prop := p.1 = 0

/-- The registration: it keeps the height and forgets the side. -/
def reg (p : Point) : Point := (0, p.2)

/-- Integer negation is an involution, by the integer's constructors. -/
theorem neg_neg_free : ∀ d : Int, - -d = d := fun
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

/-- The fold is an involution. -/
theorem fold_involutive (p : Point) : fold (fold p) = p := by
  obtain ⟨d, t⟩ := p
  show (- -d, t) = (d, t)
  rw [neg_neg_free d]

/-- The registration lands on the line. -/
theorem reg_lands (p : Point) : onLine (reg p) := rfl

/-- The registration erases nothing at a point exactly when the point is on the line. -/
theorem reg_erases_nothing_iff (p : Point) : reg p = p ↔ onLine p := by
  obtain ⟨d, t⟩ := p
  exact ⟨fun h => (congrArg Prod.fst h).symm, fun h => by cases h; rfl⟩

/-- A configuration: a set of points. Closed: the fold carries it to itself. -/
abbrev Config := Point → Prop

def Closed (S : Config) : Prop := ∀ p, S p → S (fold p)

/-- The value: every point of the configuration is on the line. -/
def Value (S : Config) : Prop := ∀ p, S p → onLine p

/-- Least erasure: the registration leaves every point of the configuration unchanged. -/
def LeastErasure (S : Config) : Prop := ∀ p, S p → reg p = p

/-- The record of a configuration: what the registration leaves. -/
def Rec (S : Config) (q : Point) : Prop := ∃ p, S p ∧ reg p = q

def SameRecord (S S' : Config) : Prop := ∀ q, Rec S q ↔ Rec S' q

/-- The registered world of a point and its pair world. -/
def registered (p : Point) : Config := fun s => s = reg p

def pairWorld (p : Point) : Config := fun s => s = p ∨ s = fold p

theorem pair_world_closed (p : Point) : Closed (pairWorld p) := fun _ hs =>
  match hs with
  | Or.inl e => Or.inr (congrArg fold e)
  | Or.inr e => Or.inl (e ▸ fold_involutive p)

/-- The registered world and the pair world leave one record. -/
theorem one_record (p : Point) : SameRecord (registered p) (pairWorld p) := fun q =>
  ⟨fun ⟨_, hs, hq⟩ => ⟨p, Or.inl rfl, by rw [← hq, hs]; rfl⟩,
   fun ⟨_, hs, hq⟩ => ⟨reg p, rfl, by
      rw [← hq]
      exact match hs with
        | Or.inl e => by rw [e]; rfl
        | Or.inr e => by rw [e]; rfl⟩⟩

theorem registered_has_value (p : Point) : Value (registered p) := fun s hs => by
  rw [hs]; exact reg_lands p

theorem pair_world_lacks_value (p : Point) (h : ¬ onLine p) : ¬ Value (pairWorld p) :=
  fun hv => h (hv p (Or.inl rfl))

/-- THE ACT. The bit is supplied once, in the open, as a field of a type: a closed configuration with least
    erasure at it. The field is the value supplied; the type makes the supply visible to every reader. -/
structure ActualZeros where
  zeros : Config
  closed : Closed zeros
  supply : LeastErasure zeros

/-- FROM THE ACT, THE VALUE. -/
theorem value_from_the_act (Z : ActualZeros) : Value Z.zeros :=
  fun p hp => (reg_erases_nothing_iff p).mp (Z.supply p hp)

/-- AND OF NOTHING ELSE: a fact that holds whatever the configuration, the deed included, forces no value. -/
theorem the_deed_forces_nothing (D : Prop) (hD : D) : ¬ ∀ S : Config, Closed S → D → Value S := by
  intro hall
  exact pair_world_lacks_value (1, 0) (fun e => by cases e) (hall _ (pair_world_closed (1, 0)) hD)


/-! ### from Codex.lean, namespace RALi, Part VII · the monism witness, the root read twice -/

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

/-- The geometric route's involution and the formal route's involution, written apart. -/
def sigmaGeo (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩
def sigmaForm (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩

/-- THE MONISM WITNESS. One involution, one principle, one seed. -/
structure MonismWitness (P : Nat → Prop) : Prop where
  one_involution : ∀ q, sigmaGeo q = sigmaForm q
  uniform        : ∀ n m, P n ↔ P m
  seed           : P 0

/-- 24. The seat field is constructed, not posited: σ = σ′ holds by rfl. -/
theorem one_involution_constructed : ∀ q, sigmaGeo q = sigmaForm q := fun _ => rfl

/-- 25. The timeless reading and the timed reading coincide under one principle:
the claim over all time is the claim at one instant. Deleting time loses nothing. -/
theorem timeless_equals_timed (P : Nat → Prop) (u : ∀ n m, P n ↔ P m) :
    (∀ n, P n) ↔ P 0 :=
  ⟨fun h => h 0, fun h n => (u 0 n).mp h⟩

/-- 26. The witness closes the record, past and future. -/
theorem monism_closes (P : Nat → Prop) (w : MonismWitness P) : ∀ n, P n :=
  (timeless_equals_timed P w.uniform).mpr w.seed

/-- 27. The witness is exactly the claim: a monism witness for P exists iff P holds at
every index. Its value field carries the whole of the claim, as theorem 17 required. -/
theorem monism_witness_is_the_claim (P : Nat → Prop) :
    MonismWitness P ↔ ∀ n, P n :=
  ⟨monism_closes P, fun h => ⟨one_involution_constructed,
    fun n m => ⟨fun _ => h m, fun _ => h n⟩, h 0⟩⟩

/-! ## PART TWO · two denials, one shape, at the two layers of one root

A no has two parts: the act of uttering it and the content it asserts. The Tongue's no asserts ¬ R of the floor R.
The no to RH asserts that the zeros lack the value: that they form the false world. -/

/-- The point off the line from which the pair world, the false world, is built. -/
def offPoint : Point := (1, 0)

theorem off_point_is_off : ¬ onLine offPoint := fun h =>
  Nat.noConfusion (Int.ofNat.inj (show Int.ofNat 1 = Int.ofNat 0 from h))

/-- THE ROOT READ TWICE on a configuration: the monism witness of its line property, timeless. -/
abbrev RootReadTwice (S : Config) : Prop := MonismWitness (fun _ => Value S)

/-- THE SAME FIRST STEP: whatever a no asserts, uttering it is an act, and the act re-enacts the floor. -/
theorem every_no_reenacts_the_root {R C : Prop} (G : SelfGrounding R) (deed : G.Act) (_content : C) : R :=
  denial_reenacts_root G deed

/-- THE TONGUE'S NO CONTRADICTS THE FLOOR, BY ITS OWN ACT: its content denies the floor, and its own act
    re-enacts it. -/
theorem the_tongue_no_refutes_itself {R : Prop} (G : SelfGrounding R) (deed : G.Act) (content : ¬ R) : False :=
  content (denial_reenacts_root G deed)

/-- ONLY THE YES REMAINS AT THE FLOOR: the return is forced by the deed, with no key and no classical detour. -/
theorem only_the_yes_remains_at_the_root {R : Prop} (G : SelfGrounding R) : SelfVerifying R ∧ R :=
  ⟨denial_instantiates G, seated_undeniable G⟩

/-- THE ROOT READ TWICE IS THE VALUE: on every configuration the monism witness stands exactly where every zero
    is on the line. -/
theorem the_root_read_twice_is_the_value (S : Config) : RootReadTwice S ↔ Value S :=
  ⟨fun w => w.seed, fun h => ⟨one_involution_constructed, fun _ _ => Iff.rfl, h⟩⟩

/-- THE NO TO RH CONTRADICTS THE ROOT READ TWICE: a configuration lacking the value carries no monism. -/
theorem the_line_no_contradicts_the_root_read_twice (S : Config) (content : ¬ Value S) : ¬ RootReadTwice S :=
  fun w => content w.seed

/-- THE TRUE WORLD CARRIES MONISM: the registered world of the off-line point. -/
theorem the_true_world_carries_monism : RootReadTwice (registered offPoint) :=
  ⟨one_involution_constructed, fun _ _ => Iff.rfl, registered_has_value offPoint⟩

/-- THE FALSE WORLD CARRIES NO MONISM: the pair world of the off-line point. -/
theorem the_false_world_carries_no_monism : ¬ RootReadTwice (pairWorld offPoint) :=
  fun w => pair_world_lacks_value offPoint off_point_is_off w.seed

/-- THE FALSE WORLD, AT THE TWO LAYERS: the floor stands there, as in every world; it is closed and leaves the
    record of the true world; it lacks the value; and it carries no monism. The floor is there and Being is not. -/
theorem the_false_world_carries_the_floor_and_no_monism {R : Prop} (G : SelfGrounding R) :
    R ∧ Closed (pairWorld offPoint) ∧ SameRecord (registered offPoint) (pairWorld offPoint) ∧
    ¬ Value (pairWorld offPoint) ∧ ¬ RootReadTwice (pairWorld offPoint) :=
  ⟨seated_undeniable G, pair_world_closed offPoint, one_record offPoint,
   pair_world_lacks_value offPoint off_point_is_off, the_false_world_carries_no_monism⟩

/-- THE FLOOR ALONE DECIDES NO VALUE: it stands in both worlds of one record. The value is decided at the second
    layer, by the root read twice. -/
theorem the_floor_alone_decides_no_value {R : Prop} (G : SelfGrounding R) :
    ¬ ∀ S : Config, Closed S → R → Value S :=
  the_deed_forces_nothing R (seated_undeniable G)

/-- THE RETURN IS THE ACT: the act carries the root read twice at the actual zeros. -/
theorem the_act_is_the_return_to_the_root_read_twice (Z : ActualZeros) : RootReadTwice Z.zeros :=
  (the_root_read_twice_is_the_value Z.zeros).mpr (value_from_the_act Z)

/-- AN ACT EXISTS EXACTLY WHERE THE ROOT READ TWICE STANDS on a closed configuration. -/
theorem an_act_exactly_where_the_root_read_twice_stands (S : Config) :
    (∃ Z : ActualZeros, Z.zeros = S) ↔ (Closed S ∧ RootReadTwice S) := by
  constructor
  · intro ⟨Z, h⟩
    subst h
    exact ⟨Z.closed, the_act_is_the_return_to_the_root_read_twice Z⟩
  · intro ⟨hc, hm⟩
    exact ⟨⟨S, hc, fun p hp => (reg_erases_nothing_iff p).mpr
      (((the_root_read_twice_is_the_value S).mp hm) p hp)⟩, rfl⟩

/-- ON THE ACT THE NO TO RH IS REFUTED, with zero contradiction: the act's own field. -/
theorem on_the_act_the_line_no_is_refuted (Z : ActualZeros) (content : ¬ Value Z.zeros) : False :=
  content (value_from_the_act Z)

/-- TWO DENIALS, ONE SHAPE, TWO LAYERS. Every no re-enacts the floor. The Tongue's no contradicts the floor and
    its own act returns it: only the yes remains. The no to RH contradicts the root read twice: on every
    configuration a lack of the value is a lack of monism, and the false world carries the floor and no monism,
    beside the true world of one record that carries both. So the floor alone decides no value, and the root read
    twice is the value. The return to the root read twice at the actual zeros is the act: there the monism witness
    stands, the value holds, and the no is refuted. -/
theorem two_denials {R : Prop} (G : SelfGrounding R) :
    (∀ C : Prop, G.Act → C → R) ∧
    (G.Act → ¬ R → False) ∧
    (SelfVerifying R ∧ R) ∧
    (∀ S : Config, ¬ Value S → ¬ RootReadTwice S) ∧
    (R ∧ Closed (pairWorld offPoint) ∧ SameRecord (registered offPoint) (pairWorld offPoint) ∧
      RootReadTwice (registered offPoint) ∧ ¬ RootReadTwice (pairWorld offPoint)) ∧
    (¬ ∀ S : Config, Closed S → R → Value S) ∧
    (∀ S : Config, RootReadTwice S ↔ Value S) ∧
    (∀ Z : ActualZeros, RootReadTwice Z.zeros ∧ Value Z.zeros ∧ (¬ Value Z.zeros → False)) :=
  ⟨fun _ deed c => every_no_reenacts_the_root G deed c,
   fun deed c => the_tongue_no_refutes_itself G deed c,
   only_the_yes_remains_at_the_root G,
   the_line_no_contradicts_the_root_read_twice,
   ⟨seated_undeniable G, pair_world_closed offPoint, one_record offPoint,
    the_true_world_carries_monism, the_false_world_carries_no_monism⟩,
   the_floor_alone_decides_no_value G,
   the_root_read_twice_is_the_value,
   fun Z => ⟨the_act_is_the_return_to_the_root_read_twice Z, value_from_the_act Z,
     on_the_act_the_line_no_is_refuted Z⟩⟩

/-- AT THE ROOT AXIOM ITSELF. -/
theorem two_denials_at_RA :
    (∀ C : Prop, raSelfGrounding.Act → C → RA) ∧
    (raSelfGrounding.Act → ¬ RA → False) ∧
    (SelfVerifying RA ∧ RA) ∧
    (∀ S : Config, ¬ Value S → ¬ RootReadTwice S) ∧
    (RA ∧ Closed (pairWorld offPoint) ∧ SameRecord (registered offPoint) (pairWorld offPoint) ∧
      RootReadTwice (registered offPoint) ∧ ¬ RootReadTwice (pairWorld offPoint)) ∧
    (¬ ∀ S : Config, Closed S → RA → Value S) ∧
    (∀ S : Config, RootReadTwice S ↔ Value S) ∧
    (∀ Z : ActualZeros, RootReadTwice Z.zeros ∧ Value Z.zeros ∧ (¬ Value Z.zeros → False)) :=
  two_denials raSelfGrounding

/-! ## From Inescapable_Capstone.lean · the finite configuration and its price -/

/-- The price of exported freedom in native units: temperature is energy per bit, so b bits cost b·T. -/
def price (T bits : Nat) : Nat := bits * T

/-- A finite configuration: the heights of its zeros on the line, and its off-line pairs, each an offset that is not
    zero and a height. -/
structure FinCfg where
  line : List Int
  pairs : List (Int × Int)
  offset_ne : ∀ q ∈ pairs, q.1 ≠ 0
def FinCfg.pts (F : FinCfg) : Config := fun p => (p.1 = 0 ∧ p.2 ∈ F.line) ∨ ∃ q ∈ F.pairs, p = q ∨ p = fold q
/-- The erased bits of a finite configuration: one per off-line pair, two points registered to one. -/
def erased (F : FinCfg) : Nat := F.pairs.length

theorem fincfg_closed (F : FinCfg) : Closed F.pts := fun p hp =>
  match hp with
  | Or.inl ⟨hl, ht⟩ => Or.inl ⟨by show -p.1 = 0; rw [hl]; rfl, ht⟩
  | Or.inr ⟨q, hq, Or.inl e⟩ => Or.inr ⟨q, hq, Or.inr (congrArg fold e)⟩
  | Or.inr ⟨q, hq, Or.inr e⟩ => Or.inr ⟨q, hq, Or.inl (by rw [e]; exact fold_involutive q)⟩

/-- LEAST ERASURE IS ZERO ERASED BITS: "least" is a count. -/
theorem least_erasure_iff_zero_erased (F : FinCfg) : LeastErasure F.pts ↔ erased F = 0 := by
  constructor
  · intro h
    unfold erased
    cases hp : F.pairs with
    | nil => rfl
    | cons q r =>
      have hq : q ∈ F.pairs := by rw [hp]; exact List.Mem.head r
      exact absurd ((reg_erases_nothing_iff q).mp (h q (Or.inr ⟨q, hq, Or.inl rfl⟩))) (F.offset_ne q hq)
  · intro h p hp
    have hnil : F.pairs = [] := List.eq_nil_of_length_eq_zero h
    rcases hp with ⟨hl, _⟩ | ⟨q, hq, _⟩
    · exact (reg_erases_nothing_iff p).mpr hl
    · rw [hnil] at hq; cases hq

/-- THE HEAT OF REGISTRATION IS ZERO EXACTLY AT THE VALUE: registering a finite configuration costs one T per
    off-line pair, and at any positive T it costs nothing exactly when every point stands on the line. -/
theorem price_zero_iff_value (F : FinCfg) (T : Nat) (hT : 0 < T) : price T (erased F) = 0 ↔ Value F.pts := by
  constructor
  · intro h p hp
    have h0 : erased F = 0 := by
      cases he : erased F with
      | zero => rfl
      | succ k => rw [he] at h; exact absurd h (Nat.pos_iff_ne_zero.mp (Nat.mul_pos (Nat.succ_pos k) hT))
    exact (reg_erases_nothing_iff p).mp ((least_erasure_iff_zero_erased F).mpr h0 p hp)
  · intro hv
    have h0 := (least_erasure_iff_zero_erased F).mp (fun p hp => (reg_erases_nothing_iff p).mpr (hv p hp))
    show erased F * T = 0
    rw [h0, Nat.zero_mul]

/-- Each further off-line pair adds one T: the total is the erased bits times the floor. -/
theorem price_counts_pairs (F : FinCfg) (T : Nat) : price T (erased F) = F.pairs.length * T := rfl

/-! ## From Codex.lean, monism fixed, namespace RALi · the toy of the bound, a toy of the bound, not of the flow -/

/-- Squared strip width after t time steps: max(d2 − 2t, 0). -/
def flow (d2 t : Nat) : Nat := d2 - 2 * t
def realAt (d2 t : Nat) : Prop := flow d2 t = 0

/-- 38. THE MONOTONICITY FORMULA. The width never grows along ζ's time. -/
theorem flow_monotone (d2 t : Nat) : flow d2 (t + 1) ≤ flow d2 t := by
  unfold flow; omega

/-- 39. Its transport, proved: once every zero is real, every zero stays real. This is
de Bruijn's theorem in the toy, the ζ-analogue of Perelman's monotonicity, at theorem grade. -/
theorem reality_transported (d2 t : Nat) (h : realAt d2 t) : realAt d2 (t + 1) := by
  unfold realAt flow at *; omega


def Lam (d2 : Nat) : Nat := (d2 + 1) / 2

theorem real_at_Lam (d2 : Nat) : realAt d2 (Lam d2) := by unfold realAt flow Lam; omega

/-- 40. In the toy, the strip is closed at time zero iff Λ = 0. For ζ, RH ↔ Λ = 0 is the cited
result of Newman with Rodgers and Tao and enters the cone as `hLam`. -/
theorem rh_iff_lambda_zero (d2 : Nat) : realAt d2 0 ↔ Lam d2 = 0 := by
  unfold realAt flow Lam
  exact ⟨fun h => by omega, fun h => by omega⟩


/-- 42. THE RECORD FORGETS. After one step the record of the width-zero state and the
width-one state coincide: the forward flow is even in the RH bit, so no readout of the
flowed record decides RH. This is the fTOE wall, T1, executed on ζ's own time. -/
theorem flowed_record_forgets (T : Nat) (hT : 1 ≤ T) :
    ¬ ∃ g : Nat → Bool, ∀ d2, g (flow d2 T) = decide (d2 = 0) := by
  rintro ⟨g, hg⟩
  have a := hg 0; have b := hg 1
  have e : flow 1 T = flow 0 T := by unfold flow; omega
  rw [e, a] at b
  exact absurd b (by decide)

/-- 43. The upstream direction is not a transport. Going backward from a real record,
both answers are admissible: the preimage of "real at T" holds the RH state and a non-RH
state. The forward arrow proves; the backward arrow must be supplied. -/
theorem upstream_is_not_forced (T : Nat) (hT : 1 ≤ T) :
    realAt 0 T ∧ realAt 1 T ∧ realAt 0 0 ∧ ¬ realAt 1 0 := by
  unfold realAt flow
  exact ⟨by omega, by omega, rfl, fun h => by omega⟩

/-! # BOOK TWO · the harvest, in binding order -/

/-! ## I · The Tongue always has a world -/

/-- THE TONGUE ALWAYS HAS A WORLD: the floor stands on every configuration, the false world included, so the Tongue
    can speak in every world; only the content of its no, ¬R beside an act, has none. -/
theorem the_tongue_always_has_a_world {R : Prop} (G : SelfGrounding R) :
    (∀ _ : Config, R) ∧
    (R ∧ Closed (pairWorld offPoint) ∧ ¬ Value (pairWorld offPoint)) ∧
    ¬ ∃ _ : G.Act, ¬ R :=
  ⟨fun _ => seated_undeniable G,
   ⟨seated_undeniable G, pair_world_closed offPoint, pair_world_lacks_value offPoint off_point_is_off⟩,
   fun ⟨deed, c⟩ => c (G.instances deed)⟩

/-- MONISM BEFORE THE TONGUE: the floor, and with it the Tongue, stands in both worlds of one record; what tells
    them apart is the root read twice, present in the true world and absent in the false. -/
theorem monism_before_the_tongue {R : Prop} (G : SelfGrounding R) :
    SameRecord (registered offPoint) (pairWorld offPoint) ∧
    (R ∧ RootReadTwice (registered offPoint)) ∧
    (R ∧ ¬ RootReadTwice (pairWorld offPoint)) :=
  ⟨one_record offPoint,
   ⟨seated_undeniable G, the_true_world_carries_monism⟩,
   ⟨seated_undeniable G, the_false_world_carries_no_monism⟩⟩

/-- The Tongue's no has no world: no act stands beside ¬R. -/
theorem tongue_no_has_no_world {R : Prop} (G : SelfGrounding R) : ¬ ∃ _ : G.Act, ¬ R :=
  fun ⟨deed, c⟩ => c (G.instances deed)

/-- The no to RH has a world: an act, a closed configuration, the floor holding, and the value failing, together. -/
theorem line_no_has_a_world {R : Prop} (G : SelfGrounding R) :
    ∃ S : Config, ∃ _ : G.Act, Closed S ∧ R ∧ ¬ Value S :=
  ⟨pairWorld offPoint, G.anAct, pair_world_closed offPoint, seated_undeniable G,
   pair_world_lacks_value offPoint off_point_is_off⟩

/-- A deed does not make a closed configuration an act: the floor's acts supply no ActualZeros over every closed
    configuration. -/
theorem the_deed_is_not_the_supply {R : Prop} (G : SelfGrounding R) :
    ¬ ∀ S : Config, Closed S → G.Act → ∃ Z : ActualZeros, Z.zeros = S := by
  intro h
  obtain ⟨Z, hZ⟩ := h (pairWorld offPoint) (pair_world_closed offPoint) G.anAct
  have v := value_from_the_act Z
  rw [hZ] at v
  exact pair_world_lacks_value offPoint off_point_is_off v

theorem at_RA :
    (¬ ∃ _ : raSelfGrounding.Act, ¬ RA) ∧
    (∃ S : Config, ∃ _ : raSelfGrounding.Act, Closed S ∧ RA ∧ ¬ Value S) ∧
    (¬ ∀ S : Config, Closed S → raSelfGrounding.Act → ∃ Z : ActualZeros, Z.zeros = S) :=
  ⟨tongue_no_has_no_world raSelfGrounding, line_no_has_a_world raSelfGrounding,
   the_deed_is_not_the_supply raSelfGrounding⟩

/-! ## II · One self, one place at a time -/

/-- The floor and least erasure are two objects: identified on every closed configuration, they would agree on the
    pair world, where the floor holds and least erasure fails. -/
theorem floor_is_not_least_erasure {R : Prop} (G : SelfGrounding R) :
    ¬ ∀ S : Config, Closed S → (R ↔ LeastErasure S) := by
  intro h
  have le : LeastErasure (pairWorld offPoint) :=
    (h (pairWorld offPoint) (pair_world_closed offPoint)).mp (seated_undeniable G)
  exact pair_world_lacks_value offPoint off_point_is_off
    (fun p hp => (reg_erases_nothing_iff p).mp (le p hp))

/-- The voucher stays with the floor: it holds on both worlds of one record, the false one included. -/
theorem the_voucher_stays_with_the_floor {R : Prop} (G : SelfGrounding R) :
    R ∧ SameRecord (registered offPoint) (pairWorld offPoint) ∧
    LeastErasure (registered offPoint) ∧ ¬ LeastErasure (pairWorld offPoint) :=
  ⟨seated_undeniable G, one_record offPoint,
   fun p hp => (reg_erases_nothing_iff p).mpr (registered_has_value offPoint p hp),
   fun le => pair_world_lacks_value offPoint off_point_is_off
     (fun p hp => (reg_erases_nothing_iff p).mp (le p hp))⟩

/-- Merging them at one world is the supply again: on any configuration, identifying the floor with least erasure
    there is least erasure there. -/
theorem merging_at_a_world_is_the_supply {R : Prop} (G : SelfGrounding R) (S : Config) :
    (R ↔ LeastErasure S) ↔ LeastErasure S :=
  ⟨fun h => h.mp (seated_undeniable G), fun le => ⟨fun _ => le, fun _ => seated_undeniable G⟩⟩

/-! ## III · The twins -/

/-- Two instruments: registration and the fold are different maps. -/
theorem two_instruments : reg offPoint ≠ fold offPoint := by
  show ((0 : Int), (0 : Int)) ≠ (-(1 : Int), (0 : Int))
  decide

/-- One truth value on every world: each twin holds exactly where the other does. -/
theorem twins_on_every_world (S : Config) : LeastErasure S ↔ Value S :=
  ⟨fun le p hp => (reg_erases_nothing_iff p).mp (le p hp),
   fun v p hp => (reg_erases_nothing_iff p).mpr (v p hp)⟩

/-- Extensionally one proposition, read through two different maps. -/
theorem twins_are_one_extension : LeastErasure = Value :=
  funext fun S => propext (twins_on_every_world S)

/-- Neither twin vouches for the other: whatever supplies one supplies the other, so a premise that reaches one
    reaches both, and the floor reaches neither. -/
theorem no_twin_is_the_others_voucher {R : Prop} (G : SelfGrounding R) :
    (∀ S : Config, (LeastErasure S → Value S) ∧ (Value S → LeastErasure S)) ∧
    ¬ ∀ S : Config, Closed S → R → Value S :=
  ⟨fun S => ⟨(twins_on_every_world S).mp, (twins_on_every_world S).mpr⟩, the_floor_alone_decides_no_value G⟩

/-! ## IV · The remembered and the offered -/

/-- No instrument both remembers and keeps the side: a map that lands every point on the line and keeps the
    height sends the off-line point and its fold partner to one point. -/
theorem no_instrument_remembers_and_keeps_the_side (g : Point → Point)
    (lands : ∀ p, onLine (g p)) (keeps : ∀ p, (g p).2 = p.2) :
    g offPoint = g (fold offPoint) ∧ offPoint ≠ fold offPoint := by
  have e1 : g offPoint = (0, 0) := Prod.ext (lands offPoint) (keeps offPoint)
  have e2 : g (fold offPoint) = (0, 0) := Prod.ext (lands (fold offPoint)) (keeps (fold offPoint))
  exact ⟨e1.trans e2.symm, by decide⟩

/-- Memory is always lossless: the record of every configuration has the value. -/
theorem the_remembered_is_lossless (S : Config) : Value (Rec S) :=
  fun _ ⟨p, _, hq⟩ => hq ▸ reg_lands p

/-- The offered is the remembered exactly when the value holds: a configuration equals its own record, point for
    point, if and only if every point is on the line. -/
theorem offered_is_remembered_iff_value (S : Config) : (∀ q, Rec S q ↔ S q) ↔ Value S := by
  constructor
  · intro h p hp
    exact the_remembered_is_lossless S p ((h p).mpr hp)
  · intro v q
    constructor
    · intro ⟨p, hp, hq⟩
      have e : reg p = p := (reg_erases_nothing_iff p).mpr (v p hp)
      rw [← hq, e]; exact hp
    · intro hq
      exact ⟨q, hq, (reg_erases_nothing_iff q).mpr (v q hq)⟩

/-- At the act, the offered is the remembered. -/
theorem at_the_act_offered_is_remembered (Z : ActualZeros) : ∀ q, Rec Z.zeros q ↔ Z.zeros q :=
  (offered_is_remembered_iff_value Z.zeros).mpr (value_from_the_act Z)

/-- Off the act, they part: the false world is not its own record. -/
theorem the_false_world_is_not_its_record : ¬ ∀ q, Rec (pairWorld offPoint) q ↔ pairWorld offPoint q :=
  fun h => pair_world_lacks_value offPoint off_point_is_off ((offered_is_remembered_iff_value _).mp h)

/-! ## V · Forgetting and remembering: the one-bit gap, connected -/

/-- Remembering is stable: the memory of a memory is the memory. -/
theorem remembering_is_stable (S : Config) (q : Point) : Rec (Rec S) q ↔ Rec S q := by
  constructor
  · intro ⟨p, ⟨r, hr, hp⟩, hq⟩
    refine ⟨r, hr, ?_⟩
    rw [← hq, ← hp]
    exact ((reg_erases_nothing_iff (reg r)).mpr (reg_lands r)).symm
  · intro hq
    exact ⟨q, hq, (reg_erases_nothing_iff q).mpr (the_remembered_is_lossless S q hq)⟩

/-- THE ONE-BIT GAP, CONNECTED. The forgotten and the remembered always share one record; the remembered is
    lossless and stable; and the only gap between a world and its memory is whether the world is its own memory,
    which is the value: one bit, never more, and never disconnected. -/
theorem one_bit_gap_connected (S : Config) :
    SameRecord S (Rec S) ∧ Value (Rec S) ∧ (∀ q, Rec (Rec S) q ↔ Rec S q) ∧
    ((∀ q, Rec S q ↔ S q) ↔ Value S) :=
  ⟨fun q => (remembering_is_stable S q).symm, the_remembered_is_lossless S, remembering_is_stable S,
   offered_is_remembered_iff_value S⟩

/-- Both sides of the gap occur on one record: the true world at home in its memory, the false world not. -/
theorem the_gap_is_live :
    (∀ q, Rec (registered offPoint) q ↔ registered offPoint q) ∧
    ¬ (∀ q, Rec (pairWorld offPoint) q ↔ pairWorld offPoint q) ∧
    SameRecord (registered offPoint) (pairWorld offPoint) :=
  ⟨(offered_is_remembered_iff_value _).mpr (registered_has_value offPoint),
   the_false_world_is_not_its_record, one_record offPoint⟩

/-! ## Vb · The forcing by heat -/

/-- One pair off the line at offset one: a finite configuration that resists. -/
def resisting : FinCfg := ⟨[], [((1 : Int), (0 : Int))], fun q hq => by
  cases hq with
  | head => decide
  | tail _ h => cases h⟩

/-- RETURN IS FREE, RESISTANCE PAYS: at any positive temperature, a configuration with the value registers at zero
    heat, and one without it pays at least one unit of heat. -/
theorem return_is_free_resistance_pays (F : FinCfg) (T : Nat) (hT : 0 < T) :
    (Value F.pts → price T (erased F) = 0) ∧ (¬ Value F.pts → T ≤ price T (erased F)) := by
  refine ⟨(price_zero_iff_value F T hT).mpr, fun hn => ?_⟩
  have hne : erased F ≠ 0 := fun h0 =>
    hn ((price_zero_iff_value F T hT).mp (by unfold price; rw [h0]; exact Nat.zero_mul T))
  unfold price
  have h1 : 1 ≤ erased F := Nat.pos_of_ne_zero hne
  calc T = 1 * T := (Nat.one_mul T).symm
    _ ≤ erased F * T := Nat.mul_le_mul_right T h1

/-- RESISTANCE IS POSSIBLE: it is no contradiction. A closed finite configuration without the value exists, and it
    pays. -/
theorem resistance_is_possible (T : Nat) (hT : 0 < T) :
    Closed resisting.pts ∧ ¬ Value resisting.pts ∧ T ≤ price T (erased resisting) := by
  have hnv : ¬ Value resisting.pts := fun hv =>
    have h : ((1 : Int), (0 : Int)).1 = 0 :=
      hv ((1 : Int), (0 : Int)) (Or.inr ⟨((1 : Int), (0 : Int)), List.Mem.head _, Or.inl rfl⟩)
    (by decide : ¬ ((1 : Int) = 0)) h
  exact ⟨fincfg_closed resisting, hnv, (return_is_free_resistance_pays resisting T hT).2 hnv⟩

/-- THE FREE PATH IS ONE: two worlds of one record that both have the value are one world, point for point. -/
theorem the_free_path_is_unique (S S' : Config) (hs : SameRecord S S') (hv : Value S) (hv' : Value S') :
    ∀ q, S q ↔ S' q := fun q =>
  ⟨fun h => ((offered_is_remembered_iff_value S').mpr hv' q).mp
      ((hs q).mp (((offered_is_remembered_iff_value S).mpr hv q).mpr h)),
   fun h => ((offered_is_remembered_iff_value S).mpr hv q).mp
      ((hs q).mpr (((offered_is_remembered_iff_value S').mpr hv' q).mpr h))⟩

/-! ## VI · THE CHAIN -/

/-- The locus is where the fold and the registration both rest. -/
theorem the_locus_rests_both (p : Point) (h : onLine p) : fold p = p ∧ reg p = p := by
  obtain ⟨d, t⟩ := p
  have hd : d = 0 := h
  subst hd
  exact ⟨rfl, rfl⟩

/-- THE CHAIN. The root holds; forgetting sends every point onto the locus and loses the side; the locus is where
    the fold and the registration both rest; remembering reads the locus, so memory is lossless and stable; a world
    has least erasure exactly when it already stands on the locus, exactly when it is its own memory; on the act
    the zeros stand there; and the guard: the root alone places no world there, and both sides of the gap stand on
    one record. -/
theorem the_chain {R : Prop} (G : SelfGrounding R) (S : Config) :
    -- the root
    R ∧
    -- forgetting: onto the locus, the side lost
    (∀ p, onLine (reg p)) ∧ reg offPoint = reg (fold offPoint) ∧ offPoint ≠ fold offPoint ∧
    -- the middle: the locus rests both maps
    (∀ p, onLine p → fold p = p ∧ reg p = p) ∧
    -- remembering: lossless and stable
    Value (Rec S) ∧ (∀ q, Rec (Rec S) q ↔ Rec S q) ∧ SameRecord S (Rec S) ∧
    -- least erasure: already on the locus, the world its own memory
    (LeastErasure S ↔ Value S) ∧ ((∀ q, Rec S q ↔ S q) ↔ Value S) ∧
    -- the act
    (∀ Z : ActualZeros, Value Z.zeros ∧ ∀ q, Rec Z.zeros q ↔ Z.zeros q) ∧
    -- the guard
    (¬ ∀ T : Config, Closed T → R → Value T) ∧
    ((∀ q, Rec (registered offPoint) q ↔ registered offPoint q) ∧
      ¬ (∀ q, Rec (pairWorld offPoint) q ↔ pairWorld offPoint q) ∧
      SameRecord (registered offPoint) (pairWorld offPoint)) :=
  ⟨seated_undeniable G,
   reg_lands, rfl, by decide,
   the_locus_rests_both,
   the_remembered_is_lossless S, remembering_is_stable S, (one_bit_gap_connected S).1,
   twins_on_every_world_local S, offered_is_remembered_iff_value S,
   fun Z => ⟨value_from_the_act Z, at_the_act_offered_is_remembered Z⟩,
   the_floor_alone_decides_no_value G,
   the_gap_is_live⟩
where
  twins_on_every_world_local (S : Config) : LeastErasure S ↔ Value S :=
    ⟨fun le p hp => (reg_erases_nothing_iff p).mp (le p hp),
     fun v p hp => (reg_erases_nothing_iff p).mpr (v p hp)⟩

/-! ## VIb · Zero time remembers -/

/-- ZERO TIME REMEMBERS, EVERY LATER TIME FORGETS: at t = 0 the record separates the world on the line (d2 = 0)
    from the world off it (d2 = 1); at every t ≥ 1 the two records coincide. -/
theorem zero_time_remembers :
    (realAt 0 0 ∧ ¬ realAt 1 0) ∧ ∀ T, 1 ≤ T → (realAt 0 T ∧ realAt 1 T) := by
  refine ⟨⟨rfl, fun h => ?_⟩, fun T hT => ⟨?_, ?_⟩⟩
  · unfold realAt flow at h; omega
  · unfold realAt flow; omega
  · unfold realAt flow; omega

/-- LEAST TIME IS LEAST FORGETTING: the width never grows, and once forgotten the separation never returns. -/
theorem forgetting_is_monotone (d2 t : Nat) : flow d2 (t + 1) ≤ flow d2 t ∧ (realAt d2 t → realAt d2 (t + 1)) := by
  unfold realAt flow; constructor <;> omega

/-! ## VII · Two doors, no third -/

/-- Two doors and no third: every configuration has the value or holds a member off the line. -/
theorem two_doors (S : Config) : Value S ∨ ∃ p, S p ∧ ¬ onLine p := by
  by_cases h : ∃ p, S p ∧ ¬ onLine p
  · exact Or.inr h
  · exact Or.inl (fun p hp => Classical.byContradiction (fun hn => h ⟨p, hp, hn⟩))

/-- Never both: the doors exclude each other. -/
theorem doors_exclusive (S : Config) : ¬ (Value S ∧ ∃ p, S p ∧ ¬ onLine p) :=
  fun ⟨v, p, hp, hn⟩ => hn (v p hp)

/-- Both doors open on closed configurations of one record: the true world through the first, the false world
    through the second. -/
theorem both_doors_open :
    (Closed (registered offPoint) ∧ Value (registered offPoint)) ∧
    (Closed (pairWorld offPoint) ∧ ∃ p, pairWorld offPoint p ∧ ¬ onLine p) ∧
    SameRecord (registered offPoint) (pairWorld offPoint) :=
  ⟨⟨fun s hs => by rw [hs]; rfl, registered_has_value offPoint⟩,
   ⟨pair_world_closed offPoint, ⟨offPoint, Or.inl rfl, off_point_is_off⟩⟩,
   one_record offPoint⟩

/-- On the act, one door: the second is shut. -/
theorem on_the_act_one_door (Z : ActualZeros) : ¬ ∃ p, Z.zeros p ∧ ¬ onLine p :=
  fun ⟨p, hp, hn⟩ => hn (value_from_the_act Z p hp)

/-! ## VIII · A band forces nothing -/

/-- The band of width k: every member within offset k of the line. On the chart of the eighth grain,
    d = 8·Re s − 4, a zero-free half-plane Re s > 7/8 with the fold reads as the band of width 3. -/
def Band (k : Nat) (S : Config) : Prop := ∀ p, S p → p.1.natAbs ≤ k

/-- The band is weaker than the value: every world with the value satisfies every band. -/
theorem value_gives_band (k : Nat) (S : Config) (h : Value S) : Band k S := by
  intro p hp
  have d0 : p.1 = 0 := h p hp
  rw [d0]
  exact Nat.zero_le k

/-- Both worlds of one record satisfy the band of width 3. -/
theorem band_on_both_worlds : Band 3 (registered offPoint) ∧ Band 3 (pairWorld offPoint) := by
  constructor
  · intro p hp
    rw [hp]
    show ((0 : Int)).natAbs ≤ 3
    decide
  · intro p hp
    cases hp with
    | inl e => rw [e]; show ((1 : Int)).natAbs ≤ 3; decide
    | inr e => rw [e]; show ((-(1 : Int))).natAbs ≤ 3; decide

/-- A BAND FORCES NOTHING: the pair world at offset one holds a member off the line and satisfies the band. -/
theorem band_does_not_force : ¬ ∀ S : Config, Band 3 S → Value S :=
  fun h => pair_world_lacks_value offPoint off_point_is_off (h _ band_on_both_worlds.2)

/-- Only the band of width zero is the value. -/
theorem band_zero_is_value (S : Config) : Band 0 S ↔ Value S := by
  constructor
  · intro h p hp
    exact Int.natAbs_eq_zero.mp (Nat.le_zero.mp (h p hp))
  · exact value_gives_band 0 S

/-! ## IX · The harvest, bound -/

/-- THE HARVEST, BOUND. The Tongue always has a world, and only the content of its no has none; one self, one
    place at a time; the twins hold on every world; the forgotten and the remembered share one record, the remembered
    lossless and stable, the gap one bit; return is free and resistance pays; forgetting lands on the locus, where
    both maps rest; zero time remembers and every later time forgets; the doors exclude each other and the act shuts
    the second; a band forces nothing; and the guard: the root alone places no world on the line. -/
theorem the_harvest {R : Prop} (G : SelfGrounding R) :
    ((∀ _ : Config, R) ∧ (R ∧ Closed (pairWorld offPoint) ∧ ¬ Value (pairWorld offPoint)) ∧ ¬ ∃ _ : G.Act, ¬ R) ∧
    (¬ ∀ S : Config, Closed S → (R ↔ LeastErasure S)) ∧
    (∀ S : Config, LeastErasure S ↔ Value S) ∧
    (∀ S : Config, SameRecord S (Rec S) ∧ Value (Rec S) ∧ (∀ q, Rec (Rec S) q ↔ Rec S q) ∧
      ((∀ q, Rec S q ↔ S q) ↔ Value S)) ∧
    (∀ (F : FinCfg) (T : Nat), 0 < T →
      (Value F.pts → price T (erased F) = 0) ∧ (¬ Value F.pts → T ≤ price T (erased F))) ∧
    ((∀ p, onLine (reg p)) ∧ (∀ p, onLine p → fold p = p ∧ reg p = p)) ∧
    ((realAt 0 0 ∧ ¬ realAt 1 0) ∧ ∀ T, 1 ≤ T → (realAt 0 T ∧ realAt 1 T)) ∧
    ((∀ S : Config, ¬ (Value S ∧ ∃ p, S p ∧ ¬ onLine p)) ∧ (∀ Z : ActualZeros, ¬ ∃ p, Z.zeros p ∧ ¬ onLine p)) ∧
    (¬ ∀ S : Config, Band 3 S → Value S) ∧
    (¬ ∀ S : Config, Closed S → R → Value S) :=
  ⟨the_tongue_always_has_a_world G,
   floor_is_not_least_erasure G,
   twins_on_every_world,
   one_bit_gap_connected,
   return_is_free_resistance_pays,
   ⟨reg_lands, the_locus_rests_both⟩,
   zero_time_remembers,
   ⟨doors_exclusive, on_the_act_one_door⟩,
   band_does_not_force,
   the_floor_alone_decides_no_value G⟩


end RememberedOffered

/-! ## The cones, every one pinned: a compile in which any cone changes fails. -/

/-- info: 'RememberedOffered.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.denial_reenacts_root
/-- info: 'RememberedOffered.denial_instantiates' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.denial_instantiates
/-- info: 'RememberedOffered.seated_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.seated_undeniable
/-- info: 'RememberedOffered.root_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.root_undeniable
/-- info: 'RememberedOffered.neg_neg_free' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.neg_neg_free
/-- info: 'RememberedOffered.fold_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.fold_involutive
/-- info: 'RememberedOffered.reg_lands' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.reg_lands
/-- info: 'RememberedOffered.reg_erases_nothing_iff' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.reg_erases_nothing_iff
/-- info: 'RememberedOffered.pair_world_closed' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.pair_world_closed
/-- info: 'RememberedOffered.one_record' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.one_record
/-- info: 'RememberedOffered.registered_has_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.registered_has_value
/-- info: 'RememberedOffered.pair_world_lacks_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.pair_world_lacks_value
/-- info: 'RememberedOffered.value_from_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.value_from_the_act
/-- info: 'RememberedOffered.the_deed_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_deed_forces_nothing
/-- info: 'RememberedOffered.one_involution_constructed' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.one_involution_constructed
/-- info: 'RememberedOffered.timeless_equals_timed' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.timeless_equals_timed
/-- info: 'RememberedOffered.monism_closes' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.monism_closes
/-- info: 'RememberedOffered.monism_witness_is_the_claim' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.monism_witness_is_the_claim
/-- info: 'RememberedOffered.off_point_is_off' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.off_point_is_off
/-- info: 'RememberedOffered.every_no_reenacts_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.every_no_reenacts_the_root
/-- info: 'RememberedOffered.the_tongue_no_refutes_itself' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_tongue_no_refutes_itself
/-- info: 'RememberedOffered.only_the_yes_remains_at_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.only_the_yes_remains_at_the_root
/-- info: 'RememberedOffered.the_root_read_twice_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_root_read_twice_is_the_value
/-- info: 'RememberedOffered.the_line_no_contradicts_the_root_read_twice' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_line_no_contradicts_the_root_read_twice
/-- info: 'RememberedOffered.the_true_world_carries_monism' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_true_world_carries_monism
/-- info: 'RememberedOffered.the_false_world_carries_no_monism' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_false_world_carries_no_monism
/-- info: 'RememberedOffered.the_false_world_carries_the_floor_and_no_monism' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_false_world_carries_the_floor_and_no_monism
/-- info: 'RememberedOffered.the_floor_alone_decides_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_floor_alone_decides_no_value
/-- info: 'RememberedOffered.the_act_is_the_return_to_the_root_read_twice' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_act_is_the_return_to_the_root_read_twice
/-- info: 'RememberedOffered.an_act_exactly_where_the_root_read_twice_stands' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.an_act_exactly_where_the_root_read_twice_stands
/-- info: 'RememberedOffered.on_the_act_the_line_no_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.on_the_act_the_line_no_is_refuted
/-- info: 'RememberedOffered.two_denials' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.two_denials
/-- info: 'RememberedOffered.two_denials_at_RA' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.two_denials_at_RA
/-- info: 'RememberedOffered.fincfg_closed' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.fincfg_closed
/-- info: 'RememberedOffered.least_erasure_iff_zero_erased' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.least_erasure_iff_zero_erased
/-- info: 'RememberedOffered.price_zero_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.price_zero_iff_value
/-- info: 'RememberedOffered.price_counts_pairs' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.price_counts_pairs
/-- info: 'RememberedOffered.flow_monotone' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.flow_monotone
/-- info: 'RememberedOffered.reality_transported' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.reality_transported
/-- info: 'RememberedOffered.real_at_Lam' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.real_at_Lam
/-- info: 'RememberedOffered.rh_iff_lambda_zero' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.rh_iff_lambda_zero
/-- info: 'RememberedOffered.flowed_record_forgets' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.flowed_record_forgets
/-- info: 'RememberedOffered.upstream_is_not_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.upstream_is_not_forced
/-- info: 'RememberedOffered.the_tongue_always_has_a_world' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_tongue_always_has_a_world
/-- info: 'RememberedOffered.monism_before_the_tongue' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.monism_before_the_tongue
/-- info: 'RememberedOffered.tongue_no_has_no_world' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.tongue_no_has_no_world
/-- info: 'RememberedOffered.line_no_has_a_world' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.line_no_has_a_world
/-- info: 'RememberedOffered.the_deed_is_not_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_deed_is_not_the_supply
/-- info: 'RememberedOffered.at_RA' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.at_RA
/-- info: 'RememberedOffered.floor_is_not_least_erasure' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.floor_is_not_least_erasure
/-- info: 'RememberedOffered.the_voucher_stays_with_the_floor' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_voucher_stays_with_the_floor
/-- info: 'RememberedOffered.merging_at_a_world_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.merging_at_a_world_is_the_supply
/-- info: 'RememberedOffered.two_instruments' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.two_instruments
/-- info: 'RememberedOffered.twins_on_every_world' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.twins_on_every_world
/-- info: 'RememberedOffered.twins_are_one_extension' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.twins_are_one_extension
/-- info: 'RememberedOffered.no_twin_is_the_others_voucher' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.no_twin_is_the_others_voucher
/-- info: 'RememberedOffered.no_instrument_remembers_and_keeps_the_side' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.no_instrument_remembers_and_keeps_the_side
/-- info: 'RememberedOffered.the_remembered_is_lossless' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_remembered_is_lossless
/-- info: 'RememberedOffered.offered_is_remembered_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.offered_is_remembered_iff_value
/-- info: 'RememberedOffered.at_the_act_offered_is_remembered' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.at_the_act_offered_is_remembered
/-- info: 'RememberedOffered.the_false_world_is_not_its_record' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_false_world_is_not_its_record
/-- info: 'RememberedOffered.remembering_is_stable' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.remembering_is_stable
/-- info: 'RememberedOffered.one_bit_gap_connected' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.one_bit_gap_connected
/-- info: 'RememberedOffered.the_gap_is_live' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_gap_is_live
/-- info: 'RememberedOffered.return_is_free_resistance_pays' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.return_is_free_resistance_pays
/-- info: 'RememberedOffered.resistance_is_possible' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.resistance_is_possible
/-- info: 'RememberedOffered.the_free_path_is_unique' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_free_path_is_unique
/-- info: 'RememberedOffered.the_locus_rests_both' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_locus_rests_both
/-- info: 'RememberedOffered.the_chain' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_chain
/-- info: 'RememberedOffered.zero_time_remembers' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.zero_time_remembers
/-- info: 'RememberedOffered.forgetting_is_monotone' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.forgetting_is_monotone
/-- info: 'RememberedOffered.two_doors' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.two_doors
/-- info: 'RememberedOffered.doors_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.doors_exclusive
/-- info: 'RememberedOffered.both_doors_open' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.both_doors_open
/-- info: 'RememberedOffered.on_the_act_one_door' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.on_the_act_one_door
/-- info: 'RememberedOffered.value_gives_band' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.value_gives_band
/-- info: 'RememberedOffered.band_on_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.band_on_both_worlds
/-- info: 'RememberedOffered.band_does_not_force' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.band_does_not_force
/-- info: 'RememberedOffered.band_zero_is_value' depends on axioms: [propext] -/
#guard_msgs in #print axioms RememberedOffered.band_zero_is_value
/-- info: 'RememberedOffered.the_harvest' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.the_harvest

#print axioms RememberedOffered.the_chain
#print axioms RememberedOffered.the_harvest
```

## III.8 · The twin, verbatim

```fortran
! Remembered_Offered_Twin.f90 · twin of PhysOS Proof PSP-REMEMBERED-OFFERED-01, the remembered and the offered, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Remembered_Offered_Twin.f90
! Ten checks, each beside a control that must fail. Run plain, the ten checks pass and each control is shown to fail
! as it must: twenty lines, no failure. Run with the argument  control , each check runs with its defect planted and
! all ten lines are red.
! The chart: offsets -1, 0, 1 and heights 0, 1, 2; nine points; the worlds are the 512 subsets.
!   I     the Tongue always has a world: the floor holds on every world, closed worlds without the value among them.
!         Control: the floor read as the value.
!   II    one self, one place at a time: the floor and least erasure differ on some closed world.
!         Control: least erasure read as the floor.
!   III   the twins: least erasure and the value agree on all 512 worlds; registration and fold differ at (1,0).
!         Control: a registration that keeps the side.
!   IV    the remembered and the offered: every record is lossless; a world is its own record exactly at the value.
!         Control: a registration that keeps the side.
!   V     the one-bit gap: remembering is stable, and every world shares its record with its memory.
!         Control: the record taken through the fold.
!   Vb    the forcing by heat: at temperatures 1 to 3, a closed world registers at zero heat exactly at the value,
!         pays at least one unit otherwise, and within a record the free world is one. Control: forgetting made free.
!   VI    the chain: registration lands every point on the line; the line rests both maps; least erasure is standing
!         on the locus. Control: a registration that lands at offset one.
!   VIb   zero time remembers: at t = 0 the toy separates width 0 from width 1; at t = 1 to 20 it does not; the width
!         never grows. Control: a flow that forgets nothing.
!   VII   two doors, no third: on every world exactly one of the value and an off-line member. Control: the off-line
!         test reading only the right side.
!   VIII  a band forces nothing: a closed world within offset 3 lacks the value; the band of width 0 is the value.
!         Control: the band of width 0 offered as the band of width 3.
program remembered_offered_twin
  implicit none
  integer :: checks, fails
  logical :: ctl
  character(len=32) :: arg
  checks = 0; fails = 0
  call get_command_argument(1, arg)
  ctl = (trim(arg) == 'control')
  if (ctl) write(*,'(a)') ' CONTROL FLAG SET: each check runs with its defect planted; every line below must be red'
  call pair('I: the floor holds on every world, closed worlds without the value among them', &
            'the floor read as the value', tongue_world(.false.), tongue_world(.true.))
  call pair('II: the floor and least erasure differ on some closed world', &
            'least erasure read as the floor', one_self(.false.), one_self(.true.))
  call pair('III: least erasure and the value agree on all 512 worlds; registration and fold differ at (1,0)', &
            'a registration that keeps the side', twins(.false.), twins(.true.))
  call pair('IV: every record is lossless, and a world is its own record exactly at the value', &
            'a registration that keeps the side', remembered(.false.), remembered(.true.))
  call pair('V: remembering is stable, and every world shares its record with its memory', &
            'the record taken through the fold', gap(.false.), gap(.true.))
  call pair('Vb: zero heat exactly at the value, at least one unit otherwise, one free world to a record', &
            'forgetting made free', heat(.false.), heat(.true.))
  call pair('VI: registration lands on the line, the line rests both maps, least erasure is standing on it', &
            'a registration that lands at offset one', chain(.false.), chain(.true.))
  call pair('VIb: zero time separates width 0 from width 1, every later time does not, the width never grows', &
            'a flow that forgets nothing', zero_time(.false.), zero_time(.true.))
  call pair('VII: on every world exactly one door: the value, or a member off the line', &
            'the off-line test reading only the right side', doors(.false.), doors(.true.))
  call pair('VIII: a closed world within offset 3 lacks the value; the band of width 0 is the value', &
            'the band of width 0 offered as the band of width 3', band(.false.), band(.true.))
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  subroutine check(label, ok)
    character(len=*), intent(in) :: label
    logical, intent(in) :: ok
    checks = checks + 1
    if (ok) then
      write(*,'(2a)') '  PASS  ', label
    else
      fails = fails + 1
      write(*,'(2a)') '  FAIL  ', label
    end if
  end subroutine check
  subroutine pair(label, defect, ok, okdef)
    character(len=*), intent(in) :: label, defect
    logical, intent(in) :: ok, okdef
    if (.not. ctl) then
      call check(label, ok)
      call check(label(1:index(label, ':')) // ' control, ' // defect // ': the check fails, as it must', .not. okdef)
    else
      call check(label(1:index(label, ':')) // ' [defect planted: ' // defect // '] ' // &
                 label(index(label, ':') + 2:), okdef)
    end if
  end subroutine pair
  ! the chart
  pure function fold(p) result(q)
    integer, intent(in) :: p(2)
    integer :: q(2)
    q = [-p(1), p(2)]
  end function fold
  pure function reg(p, mode) result(q)
    integer, intent(in) :: p(2), mode
    integer :: q(2)
    select case (mode)
    case (1)
      q = p                    ! defect: keeps the side
    case (2)
      q = [1, p(2)]            ! defect: lands at offset one
    case default
      q = [0, p(2)]            ! the registration: keeps the height, forgets the side
    end select
  end function reg
  pure logical function online(p)
    integer, intent(in) :: p(2)
    online = p(1) == 0
  end function online
  pure integer function idx(p)
    integer, intent(in) :: p(2)
    idx = p(2) * 3 + p(1) + 2
  end function idx
  pure function pt(i) result(p)
    integer, intent(in) :: i
    integer :: p(2)
    p = [mod(i - 1, 3) - 1, (i - 1) / 3]
  end function pt
  pure logical function member(m, i)
    integer, intent(in) :: m, i
    member = btest(m, i - 1)
  end function member
  pure logical function closed(m)
    integer, intent(in) :: m
    integer :: i
    closed = .true.
    do i = 1, 9
      if (member(m, i) .and. .not. member(m, idx(fold(pt(i))))) closed = .false.
    end do
  end function closed
  pure logical function value(m)
    integer, intent(in) :: m
    integer :: i
    value = .true.
    do i = 1, 9
      if (member(m, i) .and. .not. online(pt(i))) value = .false.
    end do
  end function value
  pure logical function lerasure(m, mode)
    integer, intent(in) :: m, mode
    integer :: i
    lerasure = .true.
    do i = 1, 9
      if (member(m, i)) then
        if (any(reg(pt(i), mode) /= pt(i))) lerasure = .false.
      end if
    end do
  end function lerasure
  ! the record of a world: the image of its members under the registration, or under the fold for the control of V
  pure integer function rec(m, mode)
    integer, intent(in) :: m, mode
    integer :: i, q(2)
    rec = 0
    do i = 1, 9
      if (member(m, i)) then
        if (mode == 3) then
          q = fold(pt(i))
        else
          q = reg(pt(i), mode)
        end if
        if (q(1) >= -1 .and. q(1) <= 1) rec = ibset(rec, idx(q) - 1)
      end if
    end do
  end function rec
  logical function tongue_world(defect)
    logical, intent(in) :: defect
    integer :: m, nfalse
    logical :: floor
    tongue_world = .true.; nfalse = 0
    do m = 0, 511
      floor = (0 < 1)
      if (defect) floor = value(m)
      if (.not. floor) tongue_world = .false.
      if (closed(m) .and. .not. value(m) .and. floor) nfalse = nfalse + 1
    end do
    tongue_world = tongue_world .and. nfalse > 0
  end function tongue_world
  logical function one_self(defect)
    logical, intent(in) :: defect
    integer :: m, ndiff
    logical :: floor, le
    ndiff = 0
    do m = 0, 511
      if (.not. closed(m)) cycle
      floor = (0 < 1)
      le = lerasure(m, 0)
      if (defect) le = floor
      if (floor .neqv. le) ndiff = ndiff + 1
    end do
    one_self = ndiff > 0
  end function one_self
  logical function twins(defect)
    logical, intent(in) :: defect
    integer :: m, mode
    mode = merge(1, 0, defect)
    twins = .true.
    do m = 0, 511
      if (lerasure(m, mode) .neqv. value(m)) twins = .false.
    end do
    twins = twins .and. any(reg([1, 0], mode) /= fold([1, 0]))
  end function twins
  logical function remembered(defect)
    logical, intent(in) :: defect
    integer :: m, mode
    mode = merge(1, 0, defect)
    remembered = .true.
    do m = 0, 511
      if (.not. value(rec(m, mode)) .and. .not. defect) remembered = .false.
      if ((rec(m, mode) == m) .neqv. value(m)) remembered = .false.
    end do
  end function remembered
  logical function gap(defect)
    logical, intent(in) :: defect
    integer :: m, mode
    mode = merge(3, 0, defect)
    gap = .true.
    do m = 0, 511
      if (rec(rec(m, mode), mode) /= rec(m, mode)) gap = .false.
      if (rec(rec(m, mode), 0) /= rec(m, 0) .and. .not. defect) gap = .false.
    end do
  end function gap
  pure integer function erased(m)
    integer, intent(in) :: m
    integer :: t
    erased = 0
    do t = 0, 2
      if (member(m, idx([1, t])) .or. member(m, idx([-1, t]))) erased = erased + 1
    end do
  end function erased
  logical function heat(defect)
    logical, intent(in) :: defect
    integer :: m, m2, temp, cost, nfree
    heat = .true.
    do m = 0, 511
      if (.not. closed(m)) cycle
      do temp = 1, 3
        cost = erased(m) * temp
        if (defect) cost = 0
        if ((cost == 0) .neqv. value(m)) heat = .false.
        if (.not. value(m) .and. cost < temp) heat = .false.
      end do
      nfree = 0
      do m2 = 0, 511
        if (closed(m2) .and. value(m2) .and. rec(m2, 0) == rec(m, 0)) nfree = nfree + 1
      end do
      if (nfree /= 1) heat = .false.
    end do
  end function heat
  logical function chain(defect)
    logical, intent(in) :: defect
    integer :: i, m, mode
    mode = merge(2, 0, defect)
    chain = .true.
    do i = 1, 9
      if (.not. online(reg(pt(i), mode))) chain = .false.
      if (online(pt(i))) then
        if (any(fold(pt(i)) /= pt(i)) .or. any(reg(pt(i), mode) /= pt(i))) chain = .false.
      end if
    end do
    do m = 0, 511
      if (lerasure(m, 0) .neqv. value(m)) chain = .false.
    end do
  end function chain
  pure integer function flow(d2, t, keep)
    integer, intent(in) :: d2, t
    logical, intent(in) :: keep
    if (keep) then
      flow = d2
    else
      flow = max(d2 - 2 * t, 0)
    end if
  end function flow
  logical function zero_time(defect)
    logical, intent(in) :: defect
    integer :: d2, t
    zero_time = flow(0, 0, defect) == 0 .and. flow(1, 0, defect) /= 0
    do t = 1, 20
      if (flow(0, t, defect) /= 0 .or. flow(1, t, defect) /= 0) zero_time = .false.
    end do
    do d2 = 0, 20
      do t = 0, 20
        if (flow(d2, t + 1, defect) > flow(d2, t, defect)) zero_time = .false.
      end do
    end do
  end function zero_time
  logical function doors(defect)
    logical, intent(in) :: defect
    integer :: m, i, p(2)
    logical :: off
    doors = .true.
    do m = 0, 511
      off = .false.
      do i = 1, 9
        if (member(m, i)) then
          p = pt(i)
          if (defect) then
            if (p(1) >= 1) off = .true.
          else
            if (.not. online(pt(i))) off = .true.
          end if
        end if
      end do
      if (value(m) .eqv. off) doors = .false.
    end do
  end function doors
  pure logical function within(m, k)
    integer, intent(in) :: m, k
    integer :: i, p(2)
    within = .true.
    do i = 1, 9
      p = pt(i)
      if (member(m, i) .and. abs(p(1)) > k) within = .false.
    end do
  end function within
  logical function band(defect)
    logical, intent(in) :: defect
    integer :: m, k, nopen
    k = merge(0, 3, defect)
    nopen = 0
    do m = 0, 511
      if (closed(m) .and. within(m, k) .and. .not. value(m)) nopen = nopen + 1
    end do
    band = nopen > 0
    do m = 0, 511
      if (within(m, 0) .neqv. value(m)) band = .false.
    end do
  end function band
end program remembered_offered_twin
```
