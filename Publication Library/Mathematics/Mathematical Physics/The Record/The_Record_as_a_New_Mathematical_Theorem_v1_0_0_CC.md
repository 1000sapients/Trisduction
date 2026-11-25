# The Record as a New Mathematical Theorem

## Why a Horizon Only Grows, Why No Path Returns, and Why Nothing Is Lost: The Step Law and the One Sign Proved for Every Sequence of Registrations

**Mohammad F. Islam** · 24 November 2026

*On edition 1.0.0. This paper builds one object, the record of a sequence of registrations, from the registration of Nothing Escapes, Least Erasure (Islam, 2026a), and proves for it two laws that earlier drafts of this record, carried in its engine, took as hypotheses when they stated the area theorem and chronology protection.*

## Abstract

That a record of registrations changes only by what is registered, and never decreases, is established here as a mathematical theorem, for every sequence of registrations and with no hypothesis of principle. The registration keeps the height of a state and forgets its side. We prove in core Lean 4, fifty-eight laws with no axiom declared and no use of choice, that the gain of one registration is zero or one; that it is one exactly when a state is written as one with its distinct partner under the reflection, so that a single bit is erased; that no map separates the two again; that the record of a history is the sum of its gains, which is the step law; and that the record never decreases along the order of the registrations, which is the one sign. Statements of the area theorem and of chronology protection on a record, drafted before this paper and carried in its engine, took the step law and the sign as hypotheses, and a draft of the turnover of information took their counterparts. Here all are theorems or hold by definition, and those statements are applied to the record with the hypotheses discharged: a span that holds one erasing registration ends strictly above its start, so no such span returns; a surface that only registers carries a count that never decreases; and a process that ends with the record complete passes its majority from one holder to the other once, with nothing left behind.

Three premises join these theorems to the world: a physical process is a sequence of registrations, the area of a horizon counts the registrations made on it, and a path that returns in time returns the record. The theorems are of the record; they are not theorems of spacetime, and the paper says where the line runs. The count is the same read backwards, so the direction of time is not derived. A Fortran twin runs twelve checks with zero failures: over 2000 generated histories the record never decreases, and of 40,000 spans the 495 that return hold no erasing registration; the area of the remnant of the merger GW150914 exceeds the sum of the areas of the two holes by the factor 1.567 at the central values, and by 1.029 at the corner of the published intervals least favourable to it.

## The Standing of This Work

**The step law and the one sign are established here as theorems.** A record built from registrations changes by what is registered and by nothing else, and it never decreases. Drafts of this record that stated the area theorem and chronology protection on a record took these two statements as hypotheses, and a draft of the turnover of information took their counterparts. They are hypotheses no longer.

**Nothing is added.** This work adds no field, no condition on energy and no model of a black hole, and it declares zero axioms in core Lean 4, with no use of choice. The theorems of the record carry no hypothesis of principle; the five earlier statements carried beside them in the engine keep theirs. Three premises, printed in section 1, join the theorems to horizons and paths.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | Hawking's area theorem (1971) | the area of a horizon never decreases, in general relativity, under a condition on energy | one statement, on its own assumptions, with no word on paths or on information |
| Realization | Chronology protection (Hawking, 1992), cosmic censorship (Penrose, 1969), the turnover of information (Page, 1993), holography ('t Hooft, 1993; Susskind, 1995) | four statements held apart, each on its own argument | no common root; each a conjecture or an argument on its own assumption |
| Foundation | The record as a theorem, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice; three premises join them to the world | one object from which the forms of all five follow, with the two laws they need proved |

**What the drafts assumed, this work proves.** The drafts of the area theorem and of chronology protection took a record that moves only by its gains, and gains that are never negative. Here the record is built, and both properties are proved of it. The literature holds other assumptions, which the table sets out.

| Prior position | What it held | What this work proves |
|---|---|---|
| The area theorem (Hawking, 1971) | area never decreases, given the field equations and an energy condition | the count of a surface that only registers never decreases (`area_theorem_of_the_record`), with no condition on energy; its reading as a horizon is premise P2 |
| Chronology protection (Hawking, 1992) | no closed path in time, by conjecture | a span with one erasing registration never returns the record (`chronology_protection_of_the_record`); a span that returns it did nothing (`a_closed_chain_is_idle`); its reading as a path is premise P3 |
| The turnover of information (Page, 1993) | the majority passes from the hole to the radiation, if the evolution loses nothing | the turnover, with the decline of the hole proved and completeness by the definition of its share (`page_turnover_of_the_record`); that the process ends is its definition |
| Cosmic censorship (Penrose, 1969) | the inside is not seen from outside, by conjecture | no reading of the record returns the side of a state (`no_reading_of_the_record_returns_the_side`) |
| Holography ('t Hooft, 1993; Susskind, 1995) | the content of a region is carried on its boundary, by conjecture | a history of $k$ registrations erased at most $k$ bits (`record_le_length`) |

**One lemma carries three of the five.** The area statement, the statement on paths and the turnover are one fact used three times: a sum of gains that are zero or one does not go down.

**Three warrants bound the claim.** The theorems are of the record and not of spacetime: no metric, no horizon and no causal structure is computed, and what the theorems say of the world stands on three premises. Second, the direction of time is not derived: the record of a history read backwards is the same (`record_reverse`), and the record grows along the order in which the registrations are made, which is an input. Third, the area statement is for a surface that only registers. A hole that radiates (Hawking, 1975) gives up its share, as section 6 treats, and what never decreases there is the whole record.

## The Record of Registrations

### 1. The Question, and the Rule of This Paper

Three statements about black holes and time share a shape. The area of a horizon never decreases. No path returns to its own past. What falls into a hole is not lost. Each has been stated on a record: a quantity that changes only by what is registered, with gains that are never negative. **This paper builds that record and proves both properties of it.**

The rule is that of the companion papers. Only the seat and the root are allowed. Every other step is a theorem of the engine in Appendix A. Three premises join the theorems to the world. They are not used in any proof, and each is named where it is read.

| Premise | What it says | Grade |
|---|---|---|
| P1 | A physical process is a sequence of registrations. | premise |
| P2 | The area of a horizon counts the registrations made on it, up to one measured constant. | premise; the proportion of entropy to area is from Bekenstein (1973) |
| P3 | A path that returns in time returns the record to the value it had. | premise |

The words are fixed here. A state is a pair of integers, a side and a height. The fold reflects the side about the line where it equals one. The registration sets the side to one and keeps the height. A history is a list of states in the order in which they are registered. A registration made is called an act in the engine and in the twin; the two words name one thing. The gain of a registration and the record of a history are defined in sections 2 and 3.

### 2. The Gain Is One Erased Bit

The registration fixes exactly the states on the line (`reg_fixes_iff`), and the fold fixes exactly the same states (`fold_fixes_iff`). A state and its fold partner have one registration (`reg_forgets_side`).

The gain of registering a state is one if the registration changes it and zero if it does not (`gain_pos_iff_erases`). **A gain of one is exactly a state with a distinct fold partner, written as one with it** (`a_gain_is_a_merged_pair`). What is erased is one bit, the side. **No map restores both partners from their one registration** (`an_erasing_act_cannot_be_undone`). That the registration has no left inverse, the theorem of the volume this paper stands on (Islam, 2026a), follows as a corollary (`registration_has_no_left_inverse`).

The sign of the gain is therefore not assumed. A gain counts erased bits, and a count is not negative.

### 3. The Step Law and the One Sign

The record of a history is the sum of the gains of its registrations.

**The step law.** One more registration changes the record by its gain and by nothing else (`record_step`, `step_law`).

**The one sign.** No gain is negative (`one_sign`), and the record never decreases along the order of the registrations, whatever they are (`record_never_decreases`).

A continuation that holds one erasing registration leaves the record strictly above where it was (`no_return`). A continuation that returns the record left every state it registered unchanged (`a_loop_is_idle`). The record of a history of $k$ registrations is at most $k$ (`record_le_length`).

### 4. No Path Returns

The earlier statement of chronology protection, carried unchanged in Part IV of the engine, reads: given the step law and the sign, a span that holds a positive gain ends above its start. Both hypotheses are now theorems of the record, and the statement is applied with them discharged. **For every sequence of registrations, a span in which one registration changes its state ends strictly above its start** (`chronology_protection_of_the_record`). The only hypothesis left is the case itself: that something was registered. **A span that returns the record registered nothing** (`a_closed_chain_is_idle`).

By P1 a traveller is a sequence of registrations, and by P3 a return in time returns the record. **On P1 and P3, nothing that leaves a trace returns to its own past.** What the theorem allows is a closed span on which nothing is registered: a path that no process walks.

### 5. A Surface That Only Registers Never Shrinks

Let a surface carry a count that starts at some value and grows by the record of what is registered on it. The earlier statement of the area theorem, carried unchanged in Part V, takes the step law and the sign as hypotheses. With both discharged: **over every span, the count does not decrease** (`area_theorem_of_the_record`), and every positive multiple of it does not decrease either (`entropy_shape_of_the_record`), so the statement survives the measured constant that turns a count into an area.

By P2 the area of a horizon is such a count. **On P2, the area of a horizon that only registers never decreases.** Hawking proved this in general relativity from the field equations and a condition on the energy of what falls in (Hawking, 1971). Here no condition on energy is used: the sign comes from the gain. The form for a merger, that the area of the joined horizon is at least the sum of the two, is carried in Part V on the sign as a hypothesis (`merger_area_at_least_the_sum`), and the record supplies that sign.

### 6. Nothing Is Lost

Let a total $T$ be shared between a hole and its radiation, the radiation's share being the record of what has been registered in it and the hole's share the rest. The earlier statement of the turnover took two hypotheses: that the two shares sum to $T$ at every step, and that the hole's share never grows. **Both hold of the record** (`page_hypotheses_of_the_record`): the first by the definition of the hole's share as the rest, the second because the record never decreases.

One hypothesis remains, and it is the definition of the process: evaporation ends, with the record at $T$. Then the hole holds the majority at the first step, the radiation holds it at the last, and nothing is left in the hole (`page_turnover_of_the_record`). Once the radiation holds at least half it holds at least half at every later step (`the_majority_does_not_return`), so the majority changes hands once.

Here the hole's share goes down. That is not a failure of section 5: a hole that radiates is not a surface that only registers. What never decreases is the record, and during evaporation the record is the radiation's.

### 7. The Outside Reads the Record

A reading of a state through its registration gives a state and its fold partner one value (`the_outside_cannot_read_the_side`). **No function of the registration returns the side of the state registered** (`no_reading_of_the_record_returns_the_side`). The earlier statement of censorship, carried unchanged in Part IX, takes as hypothesis that every outside reading of an inside source equals the data of the surface. A reading that passes through the registration satisfies that hypothesis by its form, and the statement applies (`every_reading_through_the_record_is_censored`).

Two histories with the same registrations give one value to every quantity read from the record (`same_registrations_same_reading`), and a registration registered again is unchanged (`registration_is_idempotent`). A boundary of $k$ sites of one bit writes $2^{k}$ names (`boundary_writes_two_pow`), and a history of $k$ registrations erased at most $k$ bits (`record_le_length`). The earlier statements of holography, carried in Part VIII, keep their hypothesis that the record of a region is a function of its boundary; this paper does not discharge it.

### 8. What Is Not Derived: the Direction

**The record of a history read backwards is the same** (`record_reverse`). The count does not know a direction. The record grows along the order in which the registrations are made, and that order is the list itself: an input of the object, not a consequence of a law. This agrees with the volume the paper stands on, which proves that a law even under reversal cannot return the arrow (Islam, 2026a). The paper proves that a record cannot be unwound. It does not prove which way the world runs.

### 9. It Is Measured

Each row is a retrodiction: the measurement stood before this work. The area of a hole of mass $m$ and spin $\chi$ is proportional to $m^{2}\left(1+\sqrt{1-\chi^{2}}\right)$. For the merger GW150914 the two holes had masses 36 and 29 in solar units, with published intervals reaching 41 and 33, and the remnant 62, reaching down to 58, with spin 0.67, reaching up to 0.72 (Abbott et al., 2016). The initial holes are taken without spin, which makes their areas largest.

| Case | Sum of the initial areas | Area of the remnant | Ratio |
|---|---|---|---|
| central values | 4274.0 | 6697.6 | 1.567 |
| the corner of the intervals least favourable to the statement | 5540.0 | 5698.5 | 1.029 |

The areas are in units of the square of the solar mass, with a common factor dropped. The corner is not a probability; it is the worst case the printed intervals allow. An analysis of the same signal that measures the two areas separately finds agreement with the area statement at 97 per cent probability (Isi et al., 2021), and the signal GW250114 confirms it to high credibility (Abac et al., 2025).

### 10. The Ledger, the Falsifier, and What Stands Open

| Claim | Carried by | Grade |
|---|---|---|
| a gain is one erased bit, and cannot be undone | `a_gain_is_a_merged_pair`, `an_erasing_act_cannot_be_undone` | theorem |
| the step law and the one sign | `record_step`, `step_law`, `one_sign`, `record_never_decreases` | theorem |
| a span with one erasing registration never returns | `chronology_protection_of_the_record`, `a_closed_chain_is_idle` | theorem |
| nothing that leaves a trace returns to its past | the same, with P1 and P3 | premise grade, on P1 and P3 |
| the count of a surface that only registers never decreases | `area_theorem_of_the_record`, `entropy_shape_of_the_record` | theorem |
| the area of a horizon that only registers never decreases | the same, with P2 | premise grade, on P2 |
| the turnover, with nothing left | `page_hypotheses_of_the_record`, `page_turnover_of_the_record`, `the_majority_does_not_return` | theorem, for a process that ends and a hole whose share is the rest of a fixed total |
| no reading of the record returns the side | `no_reading_of_the_record_returns_the_side` | theorem |
| the record of a region is a function of its boundary | none | not proved; the hypothesis of Part VIII |
| the direction of time | none | not derived (`record_reverse`) |

**F-Area.** A merger whose remnant has a smaller area than the sum of the areas of the holes that merged, beyond the uncertainty of the measurement, breaks P2 with the one sign.

**F-Return.** A signal received before it was sent, with a trace left along its path, breaks P1 or P3.

**What stands open.** The three premises. The geometry of a horizon and of a closed path, which this paper does not compute. The hypothesis of holography. The direction of time.

**The record is closed.** It moves only by what is registered and it never goes down. On three premises that is why a horizon only grows, why no path returns, and why nothing is lost.

## Author's Provenance and Method Disclosure

**Who wrote it.** The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision.

**Method.** The work stands on one seat, the fixed line of a reflection, and one root, that nothing escapes the record, both set out in Nothing Escapes, Least Erasure (Islam, 2026a). The registration of that volume is restated in Part I of the engine, and its theorem that the registration has no left inverse is proved again there as a corollary. Three premises are printed in section 1. Parts IV, V and VII to IX of the engine carry five earlier files unchanged, each theorem with the hypotheses its statement prints; Parts VI and X apply them to the record. Every theorem named in the text is declared under that name in Appendix A. The kernel line of every theorem of Appendix A is printed in Appendix B. Every measured value in the text names its source beside it.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is set out in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

**Classical sources.** That the area of a horizon never decreases is Hawking's theorem (1971), proved in general relativity from the field equations and a condition on energy. That a horizon carries an entropy proportional to its area is Bekenstein's proposal (1973). Chronology protection is Hawking's conjecture (1992), cosmic censorship Penrose's (1969), the turnover of information Page's argument (1993), and the holographic principle 't Hooft's (1993) and Susskind's (1995). This paper does not prove those statements about spacetime. It proves, for every sequence of registrations, the two laws from which their forms follow, and prints the three premises under which a horizon and a path are such sequences.

## References

1. R. Penrose, Riv. Nuovo Cimento 1 (1969) 252.
2. S. W. Hawking, Phys. Rev. Lett. 26 (1971) 1344.
3. J. D. Bekenstein, Phys. Rev. D 7 (1973) 2333.
4. S. W. Hawking, Commun. Math. Phys. 43 (1975) 199.
5. S. W. Hawking, Phys. Rev. D 46 (1992) 603.
6. D. N. Page, Phys. Rev. Lett. 71 (1993) 3743.
7. G. 't Hooft, Dimensional reduction in quantum gravity, arXiv:gr-qc/9310026 (1993).
8. L. Susskind, J. Math. Phys. 36 (1995) 6377.
9. B. P. Abbott et al. (LIGO and Virgo), Phys. Rev. Lett. 116 (2016) 061102.
10. M. Isi, W. M. Farr, M. Giesler, M. A. Scheel and S. A. Teukolsky, Phys. Rev. Lett. 127 (2021) 011103.
11. A. G. Abac et al. (LIGO, Virgo and KAGRA), Phys. Rev. Lett. 135 (2025) 111403.
12. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

## Appendix A · SPHYS_Record_Forced_CC.lean

Core Lean 4.19.0, no import, no axiom declared, no use of choice, compiled with warnings fatal, exit 0. The kernel lines follow in Appendix B.

```lean
/-
  SPHYS_Record_Forced_CC.lean · The record of acts: the step law and the one sign, proved · core Lean 4, no library.

  RATIONALE. Three drafts of the horizon group (chronology protection, the area theorem, the Page turnover) took
  two hypotheses in every theorem: the step law (the record changes by what is registered and by nothing else)
  and the one sign (no gain is negative). This file removes both. It builds the record as a concrete object from
  the registration `reg` of the seat, proves the step law and the one sign for that object in the kernel, and
  then instantiates the theorems of those files on it. The instantiated theorems carry no hypothesis of
  principle: what is left in their statements is the scenario (a span, and an act inside it that erases).

  DESIGN.
    (1) The seat: points are integer pairs, `fold` reflects the first coordinate about 1, `reg` sets it to 1.
        These are the definitions of the Arrow of Time engine, restated so the file stands alone.
    (2) An act is the registration of one state. Its gain is 1 when the registration changes the state and 0
        when it does not. `a_gain_is_a_merged_pair` proves that a gain of 1 is exactly a distinct state merged
        with its fold partner: one bit, the side, is erased. `an_erasing_act_cannot_be_undone` proves that no
        map restores both partners. The sign is therefore not assumed: a gain counts erased bits.
    (3) The record of a history (a list of states acted on, in the order of the acts) is the sum of its gains.
        `record_step` is the step law. `record_never_decreases` is monotonicity along the order of the acts.
    (4) Parts IV and V carry the chronology and area namespaces of the two source files, unchanged, and Part VI
        applies their theorems to the record with both hypotheses discharged.
    (5) Parts VII to IX carry the Page, holography and censorship namespaces, unchanged: forms, each on the
        hypotheses its statements print. Part X proves what the record gives of each: the turnover with both
        Page hypotheses discharged, a reading through the record blind to the side, and a record bounded by
        the number of acts.

  WHAT THIS FILE DOES NOT PROVE (read before editing or citing).
    (a) It does not prove that a physical clock, horizon or traveller is such a record. That identification is a
        bridge, at premise grade: a physical process is a sequence of registrations. The kernel cannot check it.
    (b) It does not derive the direction of time. `record_reverse` proves the count is the same read backwards.
        The record grows along the order in which the acts are done, and that order is an input of the object
        (the list). This agrees with the Arrow of Time engine: the law does not carry the arrow; the order of the acts does.
    (c) It computes no geometry. No metric, no horizon area in square metres, no causal structure.

  RISK. A reader may take "no hypothesis" as "chronology protection is proved for spacetime". It is proved for
  every record of acts. The header of Part VI repeats this. The theorems of Parts VII to IX keep their hypotheses,
  and Part X discharges only what its own statements say.
  NON-NEGOTIABLE. No axiom is declared. No hypothesis named `step`, `gain_nonneg` or `one_sign` may reappear in
  a theorem of Part VI or Part X. The kernel line of every theorem is printed at the end, and none may show choice.
-/
namespace SPHYS.Record

/-! ## Part I. The seat and its registration -/

abbrev Pt := Int × Int
/-- The reflection of the seat. -/
def fold (p : Pt) : Pt := (2 - p.1, p.2)
/-- The line the reflection fixes. -/
def OnLine (p : Pt) : Prop := p.1 = 1
/-- The registration: it keeps the height and forgets the side. -/
def reg (p : Pt) : Pt := (1, p.2)

instance (p : Pt) : Decidable (OnLine p) := inferInstanceAs (Decidable (p.1 = 1))

theorem reg_forgets_side (p : Pt) : reg (fold p) = reg p := rfl

theorem reg_fixes_iff (p : Pt) : reg p = p ↔ OnLine p := by
  obtain ⟨a, b⟩ := p
  show ((1 : Int), b) = (a, b) ↔ a = 1
  constructor
  · intro h; exact (congrArg Prod.fst h).symm
  · intro h; rw [h]

theorem fold_fixes_iff (p : Pt) : fold p = p ↔ OnLine p := by
  obtain ⟨a, b⟩ := p
  show ((2 : Int) - a, b) = (a, b) ↔ a = 1
  constructor
  · intro h
    have h1 : 2 - a = a := congrArg Prod.fst h
    omega
  · intro h
    have h1 : 2 - a = a := by omega
    rw [h1]

/-! ## Part II. The gain of one act is a count of erased bits -/

/-- The gain of registering the state p: 1 if the registration changes it, 0 if it does not. -/
def gain (p : Pt) : Nat := if p.1 = 1 then 0 else 1

theorem gain_le_one (p : Pt) : gain p ≤ 1 := by
  unfold gain; split <;> omega

theorem gain_pos_iff_off (p : Pt) : 0 < gain p ↔ ¬ OnLine p := by
  unfold gain OnLine
  by_cases h : p.1 = 1
  · rw [if_pos h]; exact ⟨fun h0 => absurd h0 (Nat.lt_irrefl 0), fun hn => absurd h hn⟩
  · rw [if_neg h]; exact ⟨fun _ => h, fun _ => Nat.one_pos⟩

/-- A gain is positive exactly when the registration changed the state. -/
theorem gain_pos_iff_erases (p : Pt) : 0 < gain p ↔ reg p ≠ p := by
  rw [gain_pos_iff_off]; exact not_congr (reg_fixes_iff p).symm

/-- A GAIN IS A MERGED PAIR. The gain is positive exactly when the state has a distinct fold partner, and the
    registration writes the two as one. What is erased is one bit: the side. -/
theorem a_gain_is_a_merged_pair (p : Pt) : 0 < gain p ↔ fold p ≠ p ∧ reg (fold p) = reg p := by
  rw [gain_pos_iff_off]
  constructor
  · intro h; exact ⟨fun e => h ((fold_fixes_iff p).mp e), rfl⟩
  · intro h e; exact h.1 ((fold_fixes_iff p).mpr e)

/-- AN ERASING ACT CANNOT BE UNDONE. Where the gain is positive, no map restores both partners from their
    one registration. This is the sign of the gain, proved and not read. -/
theorem an_erasing_act_cannot_be_undone (p : Pt) (hp : 0 < gain p) :
    ¬ ∃ g : Pt → Pt, g (reg p) = p ∧ g (reg (fold p)) = fold p := by
  intro ⟨g, h1, h2⟩
  rw [reg_forgets_side, h1] at h2
  exact ((a_gain_is_a_merged_pair p).mp hp).1 h2.symm

/-- The theorem of the Arrow of Time engine, here a corollary: registration has no left inverse. -/
theorem registration_has_no_left_inverse : ¬ ∃ g : Pt → Pt, ∀ p, g (reg p) = p := by
  intro ⟨g, hg⟩
  exact an_erasing_act_cannot_be_undone (0, 0) (by decide) ⟨g, hg _, hg _⟩

/-! ## Part III. The record of a history -/

/-- The record of a history: the number of bits its acts erased. -/
def record : List Pt → Nat
  | [] => 0
  | p :: h => gain p + record h

theorem record_append (h t : List Pt) : record (h ++ t) = record h + record t := by
  induction h with
  | nil => simp only [List.nil_append, record]; omega
  | cons p h ih => simp only [List.cons_append, record, ih]; omega

/-- THE STEP LAW, PROVED. One more act changes the record by that act's gain and by nothing else. -/
theorem record_step (h : List Pt) (p : Pt) : record (h ++ [p]) = record h + gain p := by
  rw [record_append]; simp only [record]; omega

/-- THE RECORD NEVER DECREASES along the order of the acts, whatever the acts are. -/
theorem record_never_decreases (h t : List Pt) : record h ≤ record (h ++ t) := by
  rw [record_append]; omega

theorem record_pos_of_erasing (t : List Pt) (p : Pt) (hm : p ∈ t) (hp : 0 < gain p) : 0 < record t := by
  induction t with
  | nil => cases hm
  | cons q t ih =>
    simp only [record]
    rcases List.mem_cons.mp hm with e | e
    · subst e; omega
    · have := ih e; omega

/-- NO RETURN. A continuation that holds one erasing act leaves the record strictly above where it was. -/
theorem no_return (h t : List Pt) (p : Pt) (hm : p ∈ t) (hp : 0 < gain p) : record h < record (h ++ t) := by
  rw [record_append]
  have := record_pos_of_erasing t p hm hp
  omega

/-- A LOOP IS IDLE. If a continuation returns the record to where it was, every act in it left its state
    unchanged: nothing was registered anywhere along it. -/
theorem a_loop_is_idle (h t : List Pt) (hloop : record (h ++ t) = record h) (p : Pt) (hm : p ∈ t) :
    reg p = p := by
  rw [record_append] at hloop
  have hg : ¬ 0 < gain p := fun hp => by
    have := record_pos_of_erasing t p hm hp
    omega
  exact (reg_fixes_iff p).mpr (Decidable.of_not_not (fun hn => hg ((gain_pos_iff_off p).mpr hn)))

/-- THE COUNT IS EVEN UNDER REVERSAL. Read backwards, a history has the same record. The record does not grow
    because of a direction written in the law; it grows along the order in which the acts are done. -/
theorem record_reverse (h : List Pt) : record h.reverse = record h := by
  induction h with
  | nil => rfl
  | cons p h ih => rw [List.reverse_cons, record_append, ih]; simp only [record]; omega

/-- A process: the state acted on at each step. Its history after n steps, its record, and its gains. -/
def pre (s : Nat → Pt) : Nat → List Pt
  | 0 => []
  | n + 1 => pre s n ++ [s n]
def recN (s : Nat → Pt) (n : Nat) : Int := ((record (pre s n) : Nat) : Int)
def gainN (s : Nat → Pt) (n : Nat) : Int := ((gain (s n) : Nat) : Int)

/-- The step law of the source files, as a theorem of the record. -/
theorem step_law (s : Nat → Pt) (n : Nat) : recN s (n + 1) = recN s n + gainN s n := by
  show ((record (pre s n ++ [s n]) : Nat) : Int) = ((record (pre s n) : Nat) : Int) + ((gain (s n) : Nat) : Int)
  rw [record_step]; omega

/-- The one sign of the source files, as a theorem of the record. -/
theorem one_sign (s : Nat → Pt) (n : Nat) : 0 ≤ gainN s n := by
  show (0 : Int) ≤ ((gain (s n) : Nat) : Int)
  omega

end SPHYS.Record

/-! ## Part IV. The chronology file, carried unchanged (its theorems take `step` and `gain_nonneg` as hypotheses) -/

namespace SPHYS.Chronology

/-- The total registered over a span of k steps starting at m. -/
def totalGain (gain : Nat → Int) (m : Nat) : Nat → Int
  | 0 => 0
  | k + 1 => totalGain gain m k + gain (m + k)

/-- THE RECORD IS ITS GAINS. After k steps the record is the starting record plus the total registered
    over the span. Proved by induction on the span. -/
theorem record_is_start_plus_gains (rec gain : Nat → Int)
    (step : ∀ n : Nat, rec (n + 1) = rec n + gain n) (m k : Nat) :
    rec (m + k) = rec m + totalGain gain m k := by
  induction k with
  | zero => simp [totalGain]
  | succ k ih =>
    have hs := step (m + k)
    have e : m + (k + 1) = m + k + 1 := by omega
    have ek : totalGain gain m (k + 1) = totalGain gain m k + gain (m + k) := by
      simp only [totalGain]
    rw [e, hs, ih, ek]
    omega

/-- THE TOTAL IS NONNEGATIVE. Registration has no inverse: every gain is nonnegative, so every span's
    total is nonnegative, and the record never returns below any earlier state. -/
theorem total_gain_nonnegative (gain : Nat → Int) (gain_nonneg : ∀ n : Nat, 0 ≤ gain n)
    (m k : Nat) : 0 ≤ totalGain gain m k := by
  induction k with
  | zero => simp [totalGain]
  | succ k ih =>
    unfold totalGain
    have h := gain_nonneg (m + k)
    omega

/-- EVERY STEP'S GAIN IS IN THE TOTAL. For j inside the span, the gain at step m + j is at most the
    span's total: the total is a sum of nonnegative terms, one of which is that gain. -/
theorem gain_le_total (gain : Nat → Int) (gain_nonneg : ∀ n : Nat, 0 ≤ gain n)
    (m k j : Nat) (hj : j < k) : gain (m + j) ≤ totalGain gain m k := by
  induction k with
  | zero => omega
  | succ k ih =>
    unfold totalGain
    have hnn := total_gain_nonnegative gain gain_nonneg m k
    have hg := gain_nonneg (m + k)
    by_cases hjk : j = k
    · subst hjk
      omega
    · have hlt : j < k := by omega
      have h := ih hlt
      omega

/-- A LOOP REGISTERS NOTHING. If a span returns the record to its starting state, every gain inside the
    span is zero: nothing was registered anywhere along it. A closed chain of registrations is silent. -/
theorem a_loop_registers_nothing (rec gain : Nat → Int)
    (step : ∀ n : Nat, rec (n + 1) = rec n + gain n) (gain_nonneg : ∀ n : Nat, 0 ≤ gain n)
    (m k j : Nat) (hj : j < k) (hloop : rec (m + k) = rec m) : gain (m + j) = 0 := by
  have hrec := record_is_start_plus_gains rec gain step m k
  have htot : totalGain gain m k = 0 := by omega
  have hle := gain_le_total gain gain_nonneg m k j hj
  have hnn := gain_nonneg (m + j)
  omega

/-- CHRONOLOGY PROTECTION, THE FORM. If any step inside a span registers positively — as the passage of
    any physical traveler does — the record at the span's end is strictly above its start. No span that
    carries a registration returns to its starting state: there is no closed registration chain, and so
    no closed timelike curve for anything that registers. -/
theorem chronology_protection (rec gain : Nat → Int)
    (step : ∀ n : Nat, rec (n + 1) = rec n + gain n) (gain_nonneg : ∀ n : Nat, 0 ≤ gain n)
    (m k j : Nat) (hj : j < k) (hpos : 0 < gain (m + j)) : rec m < rec (m + k) := by
  have hrec := record_is_start_plus_gains rec gain step m k
  have hle := gain_le_total gain gain_nonneg m k j hj
  have hnn := total_gain_nonnegative gain gain_nonneg m k
  omega

end SPHYS.Chronology

/-! ## Part V. The area file, carried unchanged (its theorems take `step` and `one_sign` as hypotheses) -/

namespace SPHYS.AreaTheorem

/-- NO STEP SHRINKS THE HORIZON. Given the step law and the one sign, at every step the area does not
    decrease: registration has no inverse and the flux has one sign. -/
theorem no_step_shrinks (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (one_sign : ∀ n : Nat, 0 ≤ flux n)
    (n : Nat) : area n ≤ area (n + 1) := by
  rw [step n]
  have h := one_sign n
  omega

/-- A STEP IS FLAT EXACTLY WHEN NOTHING CROSSES. Area is unchanged at a step if and only if the flux at
    that step is zero. -/
theorem flat_step_iff_no_flux (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (n : Nat) :
    area (n + 1) = area n ↔ flux n = 0 := by
  rw [step n]
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- THE AREA THEOREM. Over any span of steps the horizon's area does not decrease: for every start m and
    every span k, area m ≤ area (m + k). Hawking's theorem as the seat forces it — the forced law, the one
    sign, and a record with no inverse. -/
theorem area_never_decreases (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (one_sign : ∀ n : Nat, 0 ≤ flux n)
    (m k : Nat) : area m ≤ area (m + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
    have hs := step (m + k)
    have hf := one_sign (m + k)
    have e : m + (k + 1) = m + k + 1 := by omega
    rw [e]
    omega

/-- GROWTH IS STRICT WHEN ANYTHING CROSSES. If the flux at some step is positive, the area after that
    step exceeds the area before it. -/
theorem crossing_grows_the_area (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (n : Nat) (h : 0 < flux n) :
    area n < area (n + 1) := by
  rw [step n]
  omega

/-- THE MERGER FORM. Two horizons of areas a and b join; the joined horizon's area is the sum plus the
    flux of the joining step, which has the one sign. The final area is at least the sum of the two —
    the form the merger observations read. -/
theorem merger_area_at_least_the_sum (a b f : Int) (hf : 0 ≤ f) : a + b ≤ a + b + f := by
  omega

/-- AREA IS THE HORIZON'S ENTROPY SHAPE. Any reading of the horizon that is a positive multiple of the
    area is likewise non-decreasing over every span: the second law's shape survives the (measured)
    constant that turns area into entropy. -/
theorem every_positive_multiple_is_monotone (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (one_sign : ∀ n : Nat, 0 ≤ flux n)
    (c : Int) (hc : 0 < c) (m k : Nat) :
    c * area m ≤ c * area (m + k) := by
  have h := area_never_decreases area flux step one_sign m k
  have h2 : c * area (m + k) - c * area m = c * (area (m + k) - area m) := by
    rw [Int.mul_sub]
  have h3 : 0 ≤ c * (area (m + k) - area m) :=
    Int.mul_nonneg (Int.le_of_lt hc) (by omega)
  omega

end SPHYS.AreaTheorem

/-! ## Part VI. The hypotheses discharged
    Every theorem below is about the record of acts of Part III. None takes the step law or the sign as a
    hypothesis. None is a statement about a metric: see (a) to (c) of the header. -/
namespace SPHYS.Record

/-- CHRONOLOGY PROTECTION FOR EVERY RECORD OF ACTS. For any process whatever, if one act inside a span changes
    its state, the record at the end of the span is strictly above the record at its start. No hypothesis of
    principle: the step law and the sign are `step_law` and `one_sign`. -/
theorem chronology_protection_of_the_record (s : Nat → Pt) (m k j : Nat) (hj : j < k)
    (hact : reg (s (m + j)) ≠ s (m + j)) : recN s m < recN s (m + k) :=
  SPHYS.Chronology.chronology_protection (recN s) (gainN s) (step_law s) (one_sign s) m k j hj (by
    show (0 : Int) < ((gain (s (m + j)) : Nat) : Int)
    have := (gain_pos_iff_erases (s (m + j))).mpr hact
    omega)

/-- A CLOSED CHAIN IS IDLE. If a span returns the record to its start, every act inside it left its state
    unchanged. -/
theorem a_closed_chain_is_idle (s : Nat → Pt) (m k j : Nat) (hj : j < k)
    (hloop : recN s (m + k) = recN s m) : reg (s (m + j)) = s (m + j) := by
  have h0 : ((gain (s (m + j)) : Nat) : Int) = 0 :=
    SPHYS.Chronology.a_loop_registers_nothing (recN s) (gainN s) (step_law s) (one_sign s) m k j hj hloop
  have hg : ¬ 0 < gain (s (m + j)) := fun hp => by omega
  exact (reg_fixes_iff _).mpr (Decidable.of_not_not (fun hn => hg ((gain_pos_iff_off _).mpr hn)))

/-- A surface whose count is a starting value plus the record of what was registered on it. -/
def area (a0 : Int) (s : Nat → Pt) (n : Nat) : Int := a0 + recN s n

theorem area_step (a0 : Int) (s : Nat → Pt) (n : Nat) : area a0 s (n + 1) = area a0 s n + gainN s n := by
  show a0 + recN s (n + 1) = a0 + recN s n + gainN s n
  rw [step_law]; omega

/-- THE AREA THEOREM FOR EVERY REGISTRATION SURFACE. Over any span the count does not decrease. -/
theorem area_theorem_of_the_record (a0 : Int) (s : Nat → Pt) (m k : Nat) : area a0 s m ≤ area a0 s (m + k) :=
  SPHYS.AreaTheorem.area_never_decreases (area a0 s) (gainN s) (area_step a0 s) (one_sign s) m k

/-- Any positive multiple of the count is monotone too: the shape of the second law, the constant measured. -/
theorem entropy_shape_of_the_record (a0 c : Int) (hc : 0 < c) (s : Nat → Pt) (m k : Nat) :
    c * area a0 s m ≤ c * area a0 s (m + k) :=
  SPHYS.AreaTheorem.every_positive_multiple_is_monotone (area a0 s) (gainN s) (area_step a0 s) (one_sign s) c hc m k

/-- THE TWO HYPOTHESES OF THE PAGE FILE, PROVED. Let the radiation's record be the record of acts and the hole's
    be the rest of a total T. Then the record is complete at every step and the hole's share never grows. That
    evaporation ends, with the hole's share at zero, remains the definition of the process. -/
theorem page_hypotheses_of_the_record (T : Int) (s : Nat → Pt) :
    (∀ n : Nat, (T - recN s n) + recN s n = T) ∧ (∀ n : Nat, T - recN s (n + 1) ≤ T - recN s n) := by
  refine ⟨fun n => by omega, fun n => ?_⟩
  have h1 := step_law s n
  have h2 := one_sign s n
  omega

/-- THE CAPSTONE. For every process: the step law holds, no gain is negative, a gain is a merged pair that no
    map separates again, a span with one erasing act never returns, and the count is the same read backwards. -/
theorem the_record_of_acts :
    (∀ (s : Nat → Pt) (n : Nat), recN s (n + 1) = recN s n + gainN s n) ∧
    (∀ (s : Nat → Pt) (n : Nat), 0 ≤ gainN s n) ∧
    (∀ p : Pt, 0 < gain p ↔ fold p ≠ p ∧ reg (fold p) = reg p) ∧
    (∀ p : Pt, 0 < gain p → ¬ ∃ g : Pt → Pt, g (reg p) = p ∧ g (reg (fold p)) = fold p) ∧
    (∀ (s : Nat → Pt) (m k j : Nat), j < k → reg (s (m + j)) ≠ s (m + j) → recN s m < recN s (m + k)) ∧
    (∀ h : List Pt, record h.reverse = record h) :=
  ⟨step_law, one_sign, a_gain_is_a_merged_pair, an_erasing_act_cannot_be_undone,
   chronology_protection_of_the_record, record_reverse⟩

end SPHYS.Record

/-! ## Part VII. The Page file, carried unchanged (forms on the hypotheses `complete` and the two endpoints) -/

namespace SPHYS.PageCurve

/-- THE RADIATION'S RECORD NEVER SHRINKS. If the record is complete at every step and the hole's record
    never grows, then over any span of steps the radiation's record does not decrease: what has been
    registered in the radiation is never unregistered. -/
theorem radiation_record_never_shrinks (H R : Nat → Int) (T : Int)
    (complete : ∀ n : Nat, H n + R n = T)
    (hole_declines : ∀ n : Nat, H (n + 1) ≤ H n)
    (m k : Nat) : R m ≤ R (m + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
    have hs := hole_declines (m + k)
    have c1 := complete (m + k)
    have c2 := complete (m + k + 1)
    have e : m + (k + 1) = m + k + 1 := by omega
    rw [e]
    omega

/-- AT EVERY STEP ONE SIDE HOLDS THE MAJORITY. Completeness alone forces the dichotomy: at each step,
    either the radiation holds at least half the record or the hole holds more than half. There is no step
    at which the record is nowhere — the majority is always somewhere, and it can only change hands. -/
theorem majority_is_always_somewhere (H R : Nat → Int) (T : Int)
    (complete : ∀ n : Nat, H n + R n = T) (n : Nat) :
    T ≤ 2 * R n ∨ T < 2 * H n := by
  have c := complete n
  omega

/-- THE FIRST STEP'S ACCOUNTING. If the hole holds the whole record at the first step, the radiation's
    record there is zero: completeness leaves nothing unaccounted at either end. -/
theorem first_step_accounting (H R : Nat → Int) (T : Int)
    (complete : ∀ n : Nat, H n + R n = T) (hH0 : H 0 = T) : R 0 = 0 := by
  have c := complete 0
  omega

/-- NO LOSS, NO REMNANT. At the final step the radiation's record is the whole record: R N = T with
    H N = 0. Everything that was registered is in the radiation's record; nothing is destroyed, and
    nothing is left behind in a remnant. -/
theorem no_loss_no_remnant (H R : Nat → Int) (T : Int) (N : Nat)
    (complete : ∀ n : Nat, H n + R n = T) (hHN : H N = 0) : R N = T := by
  have c := complete N
  omega

/-- THE MAJORITY AT THE LAST STEP. With a nonempty record and complete evaporation, at the final step
    the radiation holds strictly more than half: T < 2 * R N. -/
theorem radiation_holds_the_majority_at_last (H R : Nat → Int) (T : Int) (N : Nat)
    (complete : ∀ n : Nat, H n + R n = T) (hHN : H N = 0) (hT : 0 < T) : T < 2 * R N := by
  have c := complete N
  omega

/-- THE MAJORITY AT THE FIRST STEP. With a nonempty record wholly in the hole at the first step, the
    hole holds strictly more than half: T < 2 * H 0. Together with the last step, the majority's change
    of hands is the turnover. -/
theorem hole_holds_the_majority_at_first (H R : Nat → Int) (T : Int)
    (complete : ∀ n : Nat, H n + R n = T) (hH0 : H 0 = T) (hT : 0 < T) : T < 2 * H 0 := by
  have c := complete 0
  omega

end SPHYS.PageCurve

/-! ## Part VIII. The holography file, carried unchanged (forms on the hypothesis that the record is a function of the boundary) -/

namespace SPHYS.Holography

/-- The names a boundary of k one-bit sites can write: the binary strings of length k. -/
def strings : Nat → List (List Bool)
  | 0 => [[]]
  | k + 1 => (strings k).map (fun s => false :: s) ++ (strings k).map (fun s => true :: s)

/-- THE BOUNDARY WRITES 2^k NAMES. The count of boundary strings doubles with each site: capacity is a
    property of the boundary's size, exponential in it, with no reference to any volume. -/
theorem boundary_writes_two_pow (k : Nat) : (strings k).length = 2 ^ k := by
  induction k with
  | zero => decide
  | succ k ih =>
    unfold strings
    rw [List.length_append, List.length_map, List.length_map, ih, Nat.pow_succ]
    omega

/-- NO BULK SURPLUS. Two regions with the same boundary reading have the same record, whatever the
    boundary-reading map Φ is: the interior holds nothing the boundary does not already say. -/
theorem no_bulk_surplus (Φ : List Int → List Int) (R₁ R₂ B : List Int)
    (h₁ : R₁ = Φ B) (h₂ : R₂ = Φ B) : R₁ = R₂ := by
  rw [h₁, h₂]

/-- EVERY INTERIOR QUANTITY IS A BOUNDARY QUANTITY. If the record factors through the boundary, then any
    quantity computed from the record is computed from the boundary: Q(R) = (Q ∘ Φ)(B). There is no
    observable of the interior that is not an observable of the boundary reading. -/
theorem every_interior_quantity_is_a_boundary_quantity (Φ : List Int → List Int)
    (Q : List Int → Int) (R B : List Int) (h : R = Φ B) : Q R = Q (Φ B) := by
  rw [h]

/-- THE COUNT FORM. A region's records, listed without repetition among the boundary's names, number at
    most 2^k for a boundary of k sites: the boundary's capacity bounds the region's content. The hypothesis
    is the fold in counting form — the records appear among the names (a sublist). -/
theorem records_bounded_by_the_boundary (L : List (List Bool)) (k : Nat)
    (h : List.Sublist L (strings k)) : L.length ≤ 2 ^ k := by
  rw [← boundary_writes_two_pow k]
  exact List.Sublist.length_le h

end SPHYS.Holography

/-! ## Part IX. The censorship file, carried unchanged (forms on the hypothesis `factors`) -/

namespace SPHYS.Censorship

/-- THE OUTSIDE READS THE SURFACE. Under the fold, an exterior reading of an interior source does not
    depend on where outside it is taken: at every exterior site it is the surface data, the same number. -/
theorem the_outside_reads_the_surface (read : Int → Int → Int) (surf : Int → Int) (h : Int)
    (factors : ∀ s x : Int, s < h → h < x → read s x = surf s)
    (s x x' : Int) (hs : s < h) (hx : h < x) (hx' : h < x') : read s x = read s x' := by
  rw [factors s x hs hx, factors s x' hs hx']

/-- NO NAKED SINGULARITY. There is no interior source and no exterior site at which the reading differs
    from the surface data: no interior is ever read directly. Nakedness is excluded by the fold alone. -/
theorem no_naked_singularity (read : Int → Int → Int) (surf : Int → Int) (h : Int)
    (factors : ∀ s x : Int, s < h → h < x → read s x = surf s) :
    ¬ ∃ s x : Int, s < h ∧ h < x ∧ read s x ≠ surf s := by
  intro hcon
  obtain ⟨s, x, hs, hx, hne⟩ := hcon
  exact hne (factors s x hs hx)

/-- THE INTERIOR IS CENSORED, NOT JUST COVERED. Two interiors with the same surface data give the same
    reading at every exterior site: the outside cannot distinguish them at all. What reaches the outside
    is the surface's data — the mass, charge and spin of the no-hair reading — and nothing else. -/
theorem same_surface_same_outside (read : Int → Int → Int) (surf : Int → Int) (h : Int)
    (factors : ∀ s x : Int, s < h → h < x → read s x = surf s)
    (s₁ s₂ x : Int) (hs₁ : s₁ < h) (hs₂ : s₂ < h) (hx : h < x) (hsurf : surf s₁ = surf s₂) :
    read s₁ x = read s₂ x := by
  rw [factors s₁ x hs₁ hx, factors s₂ x hs₂ hx, hsurf]

end SPHYS.Censorship

/-! ## Part X. What the record gives of the turnover, of censorship and of the boundary
    Every theorem below is about the record of acts and the registration of Part I. -/
namespace SPHYS.Record

theorem recN_zero (s : Nat → Pt) : recN s 0 = 0 := rfl

/-- THE TURNOVER OF THE RECORD. Let the radiation's share be the record of acts and the hole's share the rest of
    a total T. Completeness and the decline of the hole are theorems (`page_hypotheses_of_the_record`). If the
    process ends with the record at T, the hole holds the majority at the first step, the radiation holds it at
    the last, and nothing is left in the hole. That the process ends is the scenario, and stays a hypothesis. -/
theorem page_turnover_of_the_record (T : Int) (s : Nat → Pt) (N : Nat) (hT : 0 < T) (hend : recN s N = T) :
    T < 2 * (T - recN s 0) ∧ T < 2 * recN s N ∧ T - recN s N = 0 := by
  have complete : ∀ n : Nat, (fun n => T - recN s n) n + recN s n = T := fun n => by
    show T - recN s n + recN s n = T
    omega
  have h0 : (fun n => T - recN s n) 0 = T := by
    show T - recN s 0 = T
    rw [recN_zero]; omega
  have hN : (fun n => T - recN s n) N = 0 := by
    show T - recN s N = 0
    omega
  exact ⟨SPHYS.PageCurve.hole_holds_the_majority_at_first _ (recN s) T complete h0 hT,
         SPHYS.PageCurve.radiation_holds_the_majority_at_last _ (recN s) T N complete hN hT, hN⟩

/-- THE MAJORITY DOES NOT RETURN. Once the record holds at least half of a total, it holds at least half at
    every later step: the majority changes hands at most once. -/
theorem the_majority_does_not_return (T : Int) (s : Nat → Pt) (m k : Nat) (h : T ≤ 2 * recN s m) :
    T ≤ 2 * recN s (m + k) := by
  have hm := area_theorem_of_the_record 0 s m k
  unfold area at hm
  omega

/-- A reading through the record cannot tell a state from its fold partner. -/
theorem the_outside_cannot_read_the_side (f : Pt → Int) (p : Pt) : f (reg (fold p)) = f (reg p) := rfl

/-- NO READING OF THE RECORD RETURNS THE SIDE. No function of the registration gives back the first coordinate
    of the state registered. -/
theorem no_reading_of_the_record_returns_the_side : ¬ ∃ f : Pt → Int, ∀ p : Pt, f (reg p) = p.1 := by
  intro ⟨f, hf⟩
  have h1 : f (reg (0, 0)) = 0 := hf (0, 0)
  have h2 : f (reg (2, 0)) = 2 := hf (2, 0)
  have e : reg ((2 : Int), (0 : Int)) = reg ((0 : Int), (0 : Int)) := rfl
  rw [e, h1] at h2
  omega

/-- EVERY READING THROUGH THE RECORD IS CENSORED. A reading of an interior source that passes through the
    registration satisfies the hypothesis `factors` of Part IX by its form, and the theorem of that Part applies:
    no exterior site reads anything but the surface's data. -/
theorem every_reading_through_the_record_is_censored (f : Pt → Int) (h : Int) :
    ¬ ∃ s x : Int, s < h ∧ h < x ∧
      (fun (s : Int) (_ : Int) => f (reg (s, 0))) s x ≠ (fun (s : Int) => f (reg (s, 0))) s :=
  SPHYS.Censorship.no_naked_singularity _ _ h (fun _ _ _ _ => rfl)

/-- The record of a record is itself: a registration registered again is unchanged. -/
theorem registration_is_idempotent (p : Pt) : reg (reg p) = reg p := rfl

/-- THE RECORD IS BOUNDED BY THE ACTS. A history of k acts erased at most k bits. -/
theorem record_le_length (h : List Pt) : record h ≤ h.length := by
  induction h with
  | nil => exact Nat.le_refl 0
  | cons p h ih =>
    simp only [record, List.length_cons]
    have := gain_le_one p
    omega

/-- Two histories with the same registrations give the same value to every quantity read from the record. -/
theorem same_registrations_same_reading (Q : List Pt → Int) (h₁ h₂ : List Pt)
    (e : h₁.map reg = h₂.map reg) : Q (h₁.map reg) = Q (h₂.map reg) := by
  rw [e]

end SPHYS.Record

#print axioms SPHYS.Record.reg_forgets_side
#print axioms SPHYS.Record.reg_fixes_iff
#print axioms SPHYS.Record.fold_fixes_iff
#print axioms SPHYS.Record.gain_le_one
#print axioms SPHYS.Record.gain_pos_iff_off
#print axioms SPHYS.Record.gain_pos_iff_erases
#print axioms SPHYS.Record.a_gain_is_a_merged_pair
#print axioms SPHYS.Record.an_erasing_act_cannot_be_undone
#print axioms SPHYS.Record.registration_has_no_left_inverse
#print axioms SPHYS.Record.record_append
#print axioms SPHYS.Record.record_step
#print axioms SPHYS.Record.record_never_decreases
#print axioms SPHYS.Record.record_pos_of_erasing
#print axioms SPHYS.Record.no_return
#print axioms SPHYS.Record.a_loop_is_idle
#print axioms SPHYS.Record.record_reverse
#print axioms SPHYS.Record.step_law
#print axioms SPHYS.Record.one_sign
#print axioms SPHYS.Chronology.record_is_start_plus_gains
#print axioms SPHYS.Chronology.total_gain_nonnegative
#print axioms SPHYS.Chronology.gain_le_total
#print axioms SPHYS.Chronology.a_loop_registers_nothing
#print axioms SPHYS.Chronology.chronology_protection
#print axioms SPHYS.AreaTheorem.no_step_shrinks
#print axioms SPHYS.AreaTheorem.flat_step_iff_no_flux
#print axioms SPHYS.AreaTheorem.area_never_decreases
#print axioms SPHYS.AreaTheorem.crossing_grows_the_area
#print axioms SPHYS.AreaTheorem.merger_area_at_least_the_sum
#print axioms SPHYS.AreaTheorem.every_positive_multiple_is_monotone
#print axioms SPHYS.Record.chronology_protection_of_the_record
#print axioms SPHYS.Record.a_closed_chain_is_idle
#print axioms SPHYS.Record.area_step
#print axioms SPHYS.Record.area_theorem_of_the_record
#print axioms SPHYS.Record.entropy_shape_of_the_record
#print axioms SPHYS.Record.page_hypotheses_of_the_record
#print axioms SPHYS.Record.the_record_of_acts
#print axioms SPHYS.PageCurve.radiation_record_never_shrinks
#print axioms SPHYS.PageCurve.majority_is_always_somewhere
#print axioms SPHYS.PageCurve.first_step_accounting
#print axioms SPHYS.PageCurve.no_loss_no_remnant
#print axioms SPHYS.PageCurve.radiation_holds_the_majority_at_last
#print axioms SPHYS.PageCurve.hole_holds_the_majority_at_first
#print axioms SPHYS.Holography.boundary_writes_two_pow
#print axioms SPHYS.Holography.no_bulk_surplus
#print axioms SPHYS.Holography.every_interior_quantity_is_a_boundary_quantity
#print axioms SPHYS.Holography.records_bounded_by_the_boundary
#print axioms SPHYS.Censorship.the_outside_reads_the_surface
#print axioms SPHYS.Censorship.no_naked_singularity
#print axioms SPHYS.Censorship.same_surface_same_outside
#print axioms SPHYS.Record.recN_zero
#print axioms SPHYS.Record.page_turnover_of_the_record
#print axioms SPHYS.Record.the_majority_does_not_return
#print axioms SPHYS.Record.the_outside_cannot_read_the_side
#print axioms SPHYS.Record.no_reading_of_the_record_returns_the_side
#print axioms SPHYS.Record.every_reading_through_the_record_is_censored
#print axioms SPHYS.Record.registration_is_idempotent
#print axioms SPHYS.Record.record_le_length
#print axioms SPHYS.Record.same_registrations_same_reading
```

## Appendix B · Kernel lines of Appendix A

```text
'SPHYS.Record.reg_forgets_side' does not depend on any axioms
'SPHYS.Record.reg_fixes_iff' does not depend on any axioms
'SPHYS.Record.fold_fixes_iff' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.gain_le_one' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.gain_pos_iff_off' does not depend on any axioms
'SPHYS.Record.gain_pos_iff_erases' depends on axioms: [propext]
'SPHYS.Record.a_gain_is_a_merged_pair' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.an_erasing_act_cannot_be_undone' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.registration_has_no_left_inverse' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.record_append' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.record_step' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.record_never_decreases' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.record_pos_of_erasing' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.no_return' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.a_loop_is_idle' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.record_reverse' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.step_law' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.one_sign' depends on axioms: [propext, Quot.sound]
'SPHYS.Chronology.record_is_start_plus_gains' depends on axioms: [propext, Quot.sound]
'SPHYS.Chronology.total_gain_nonnegative' depends on axioms: [propext, Quot.sound]
'SPHYS.Chronology.gain_le_total' depends on axioms: [propext, Quot.sound]
'SPHYS.Chronology.a_loop_registers_nothing' depends on axioms: [propext, Quot.sound]
'SPHYS.Chronology.chronology_protection' depends on axioms: [propext, Quot.sound]
'SPHYS.AreaTheorem.no_step_shrinks' depends on axioms: [propext, Quot.sound]
'SPHYS.AreaTheorem.flat_step_iff_no_flux' depends on axioms: [propext, Quot.sound]
'SPHYS.AreaTheorem.area_never_decreases' depends on axioms: [propext, Quot.sound]
'SPHYS.AreaTheorem.crossing_grows_the_area' depends on axioms: [propext, Quot.sound]
'SPHYS.AreaTheorem.merger_area_at_least_the_sum' depends on axioms: [propext, Quot.sound]
'SPHYS.AreaTheorem.every_positive_multiple_is_monotone' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.chronology_protection_of_the_record' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.a_closed_chain_is_idle' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.area_step' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.area_theorem_of_the_record' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.entropy_shape_of_the_record' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.page_hypotheses_of_the_record' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.the_record_of_acts' depends on axioms: [propext, Quot.sound]
'SPHYS.PageCurve.radiation_record_never_shrinks' depends on axioms: [propext, Quot.sound]
'SPHYS.PageCurve.majority_is_always_somewhere' depends on axioms: [propext, Quot.sound]
'SPHYS.PageCurve.first_step_accounting' depends on axioms: [propext, Quot.sound]
'SPHYS.PageCurve.no_loss_no_remnant' depends on axioms: [propext, Quot.sound]
'SPHYS.PageCurve.radiation_holds_the_majority_at_last' depends on axioms: [propext, Quot.sound]
'SPHYS.PageCurve.hole_holds_the_majority_at_first' depends on axioms: [propext, Quot.sound]
'SPHYS.Holography.boundary_writes_two_pow' depends on axioms: [propext, Quot.sound]
'SPHYS.Holography.no_bulk_surplus' does not depend on any axioms
'SPHYS.Holography.every_interior_quantity_is_a_boundary_quantity' does not depend on any axioms
'SPHYS.Holography.records_bounded_by_the_boundary' depends on axioms: [propext, Quot.sound]
'SPHYS.Censorship.the_outside_reads_the_surface' does not depend on any axioms
'SPHYS.Censorship.no_naked_singularity' does not depend on any axioms
'SPHYS.Censorship.same_surface_same_outside' does not depend on any axioms
'SPHYS.Record.recN_zero' does not depend on any axioms
'SPHYS.Record.page_turnover_of_the_record' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.the_majority_does_not_return' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.the_outside_cannot_read_the_side' does not depend on any axioms
'SPHYS.Record.no_reading_of_the_record_returns_the_side' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.every_reading_through_the_record_is_censored' does not depend on any axioms
'SPHYS.Record.registration_is_idempotent' does not depend on any axioms
'SPHYS.Record.record_le_length' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.same_registrations_same_reading' does not depend on any axioms
```

## Appendix C · Record_Forced_Twin_CC.f90

Twelve checks, zero failures: ten scanning the engine's statements over generated histories (A to G) and two setting the area statement against a published measurement (H). One further line of the run is a reading and is not counted. The run follows in Appendix D.

```fortran
! Record_Forced_Twin_CC.f90 · numerical twin of SPHYS_Record_Forced_CC.lean
! RATIONALE. The engine proves the step law and the one sign for the record of acts. This twin scans the same
!   statements over generated histories (A to G) and sets one of them against a published measurement (H).
! DESIGN. Integers and double precision, no library. A state is a pair (x, y); it is on the line when x = 1; the
!   registration sets x to 1. A fixed linear congruential generator makes every run print the same numbers.
!   Measured inputs of H: the masses and the final spin of GW150914 with their 90 per cent intervals
!   (Abbott et al. 2016). The area of a hole of mass m and spin chi is 8 pi (G m / c**2)**2 (1 + sqrt(1 - chi**2));
!   the common factor is dropped, and the initial holes are taken without spin, which makes their areas largest.
! RISK. The scans cover generated histories only; the theorems are the engine's. H compares areas computed from
!   printed central values and from the corner of the printed intervals least favourable to the theorem; the
!   corner is not a probability.
! NON-NEGOTIABLE. Every check computes both sides. A line marked "reading" is printed and not counted.
program record_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0), L = 200, NH = 2000
  integer :: nfail, i, j, k, m, t, x(L), rec(0:L), r1, r2, cnt, turn, npass
  integer :: names(4096)
  logical :: seen(0:4095)
  integer(8) :: seed
  logical :: ok, ok2, ok3, ok4
  real(dp) :: ai, af
  nfail = 0; npass = 0; seed = 20260622_8

  ! A. the step law and the one sign, over 2000 histories of 200 acts
  ok = .true.; ok2 = .true.; ok3 = .true.; ok4 = .true.; cnt = 0
  do i = 1, NH
    call history(x)
    rec(0) = 0
    do j = 1, L
      rec(j) = rec(j-1) + gain(x(j))
      if (gain(x(j)) < 0 .or. gain(x(j)) > 1) ok = .false.
      if (rec(j) < rec(j-1)) ok2 = .false.
    end do
    if (rec(L) > L) ok4 = .false.
    ! C. the count is the same read backwards
    r1 = 0; do j = L, 1, -1; r1 = r1 + gain(x(j)); end do
    if (r1 /= rec(L)) ok3 = .false.
    cnt = cnt + rec(L)
  end do
  write(*,'(a,i0,a,i0,a)') '  ', NH, ' histories of ', L, ' acts'
  write(*,'(a,i0)') '  bits erased in all: ', cnt
  call check('A1 every gain is 0 or 1', ok)
  call check('A2 the record never decreases along the order of the acts', ok2)
  call check('C  the record of a history read backwards is the same', ok3)
  call check('E  the record is at most the number of acts', ok4)

  ! B. spans: the record returns exactly when every act in the span is idle; one erasing act and it does not
  ok = .true.; ok2 = .true.; cnt = 0
  do i = 1, NH
    call history(x)
    rec(0) = 0
    do j = 1, L; rec(j) = rec(j-1) + gain(x(j)); end do
    do t = 1, 20
      m = irand(L - 20); k = 1 + irand(20)
      r1 = 0; do j = m + 1, m + k; r1 = r1 + gain(x(j)); end do
      if (rec(m+k) == rec(m)) then
        cnt = cnt + 1
        if (r1 /= 0) ok = .false.
      else
        if (.not. (rec(m+k) > rec(m) .and. r1 > 0)) ok2 = .false.
      end if
    end do
  end do
  write(*,'(a,i0,a,i0)') '  spans tried: ', 20*NH, '; spans that returned the record: ', cnt
  call check('B1 a span that returns the record holds no erasing act', ok)
  call check('B2 a span with an erasing act ends strictly above its start', ok2)

  ! D. the registration merges each state off the line with its fold partner, and no state on it
  ok = .true.; cnt = 0
  do i = -20, 22
    if (i /= 1) then
      cnt = cnt + 1
      if (.not. (2 - i /= i .and. gain(i) == 1 .and. gain(2 - i) == 1)) ok = .false.
    else
      if (gain(i) /= 0 .or. 2 - i /= i) ok = .false.
    end if
  end do
  write(*,'(a,i0)') '  states off the line tried: ', cnt
  call check('D  a gain of 1 is a state with a distinct fold partner; a gain of 0 is a state on the line', ok)

  ! F. the turnover: an evaporation generated act by act until the record reaches the total T
  t = 1000; ok = .true.; ok2 = .true.; turn = 0; k = 0; r1 = 0; m = 0; cnt = 0
  do while (r1 < t)
    m = m + 1
    r2 = r1 + gain(irand(5) - 1)             ! the radiation's share after this act
    if (r2 < r1) ok = .false.                ! the radiation's share never shrinks
    if ((t - r2) + r2 /= t) ok = .false.     ! the record is complete
    if (m == 1) then
      if (.not. (2*(t - r1) > t)) ok2 = .false.   ! before the first act the hole holds the majority
    end if
    if (2*r1 < t .and. 2*r2 >= t) then
      turn = m; k = k + 1                    ! the majority changes hands at this act
    end if
    if (r2 == r1) cnt = cnt + 1
    r1 = r2
  end do
  write(*,'(a,i0,a,i0,a,i0)') '  evaporation of ', t, ' bits in ', m, ' acts, idle acts ', cnt
  write(*,'(a,i0,a,i0)') '  the majority changes hands at act ', turn, '; times it changes hands: ', k
  call check('F1 the record is complete at every step and the radiation never loses a bit', ok)
  call check('F2 the hole holds the majority at first, the radiation at last, it changes hands once, nothing is left', &
             ok2 .and. 2*r1 > t .and. k == 1 .and. t - r1 == 0)

  ! G. the names a boundary of k sites writes, built as the engine builds them: each name of k-1 sites, extended by 0 and by 1
  ok = .true.; names(1) = 0; cnt = 1
  do k = 1, 12
    do i = 1, cnt
      names(cnt + i) = 2*names(i) + 1; names(i) = 2*names(i)
    end do
    cnt = 2*cnt
    seen = .false.
    do i = 1, cnt
      if (seen(names(i))) ok = .false.        ! a name written twice
      seen(names(i)) = .true.
    end do
    if (cnt /= 2**k) ok = .false.
  end do
  write(*,'(a,i0)') '  names written by a boundary of 12 sites, all distinct: ', cnt
  call check('G  a boundary of k one-bit sites writes 2**k distinct names, k = 1 to 12', ok)

  ! H. measured: the area of the remnant of GW150914 against the sum of the areas of the two holes that merged
  ai = area(36.0_dp, 0.0_dp) + area(29.0_dp, 0.0_dp); af = area(62.0_dp, 0.67_dp)
  write(*,'(a,f8.1,a,f8.1,a,f6.3)') '  GW150914, central values: initial ', ai, ', final ', af, ', ratio ', af/ai
  call check('H1 the final area exceeds the sum of the initial areas at the central values', af > ai)
  ai = area(41.0_dp, 0.0_dp) + area(33.0_dp, 0.0_dp); af = area(58.0_dp, 0.72_dp)
  write(*,'(a,f8.1,a,f8.1,a,f6.3)') '  GW150914, least favourable corner: initial ', ai, ', final ', af, ', ratio ', af/ai
  call check('H2 and at the corner of the printed intervals least favourable to it', af > ai)
  write(*,'(a)') '  reading: Isi et al. (2021) find agreement with the area law at 97 per cent probability'

  write(*,'(a,i0,a,i0)') 'checks passed: ', npass, '   failures: ', nfail
contains
  integer function gain(xx)
    integer, intent(in) :: xx
    gain = 1; if (xx == 1) gain = 0
  end function
  real(dp) function area(mm, chi)
    real(dp), intent(in) :: mm, chi
    area = mm*mm*(1.0_dp + sqrt(1.0_dp - chi*chi))
  end function
  integer function irand(n)          ! 0 .. n-1
    integer, intent(in) :: n
    seed = mod(seed*6364136223846793005_8 + 1442695040888963407_8, 9223372036854775807_8)
    if (seed < 0) seed = -seed
    irand = int(mod(seed/65536_8, int(n,8)))
  end function
  subroutine history(xx)
    integer, intent(out) :: xx(L)
    integer :: jj
    do jj = 1, L
      xx(jj) = irand(5) - 1          ! -1 .. 3: one state in five is on the line
    end do
  end subroutine
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program record_twin
```

## Appendix D · Run of Appendix C

```text
  2000 histories of 200 acts
  bits erased in all: 320362
  PASS  A1 every gain is 0 or 1
  PASS  A2 the record never decreases along the order of the acts
  PASS  C  the record of a history read backwards is the same
  PASS  E  the record is at most the number of acts
  spans tried: 40000; spans that returned the record: 495
  PASS  B1 a span that returns the record holds no erasing act
  PASS  B2 a span with an erasing act ends strictly above its start
  states off the line tried: 42
  PASS  D  a gain of 1 is a state with a distinct fold partner; a gain of 0 is a state on the line
  evaporation of 1000 bits in 1283 acts, idle acts 283
  the majority changes hands at act 650; times it changes hands: 1
  PASS  F1 the record is complete at every step and the radiation never loses a bit
  PASS  F2 the hole holds the majority at first, the radiation at last, it changes hands once, nothing is left
  names written by a boundary of 12 sites, all distinct: 4096
  PASS  G  a boundary of k one-bit sites writes 2**k distinct names, k = 1 to 12
  GW150914, central values: initial   4274.0, final   6697.6, ratio  1.567
  PASS  H1 the final area exceeds the sum of the initial areas at the central values
  GW150914, least favourable corner: initial   5540.0, final   5698.5, ratio  1.029
  PASS  H2 and at the corner of the printed intervals least favourable to it
  reading: Isi et al. (2021) find agreement with the area law at 97 per cent probability
checks passed: 12   failures: 0
```
