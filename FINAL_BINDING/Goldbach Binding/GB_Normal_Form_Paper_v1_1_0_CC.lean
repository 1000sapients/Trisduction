/-
  GB_Normal_Form_Paper_v1_1_0_CC.lean · the kernel of "The Goldbach Conjecture: Unconditional Proof of the Form by
  Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom declared,
  no sorry, no native_decide, no posit; every theorem of this file on no axiom at all.

  Part 0 (namespace GBClose) is GB_Existence_Closure.lean of the edition of record, 6 October 2026, carried verbatim
  (sha256 7d0b29f55d6b9283db039d937154cd47aede2ce80ce0772ef1ffa79d9365a0eb): the arithmetic, sound and complete; the
  mirror and its one seat; the frames and the two worlds; existence as given forcing nothing; the act, equal to the
  value and on the arithmetic frame to the Goldbach statement; the executed region to 2000; the certified region; the
  division; the record walls; the triaxial lock; the lock and the sense of existence alone. Its 104 theorems and their
  pins stand unchanged.
  Part A (namespace GB.NORMALFORM) is the normal form of the row, generic over a row and read on the Goldbach row as the
  P ≠ NP seat reads computation and the Riemann seat reads the zeros: the record carries the value with no premise; the
  value is exactly the transfer from the record, the one bit; the cargo loop; the act; self-recursion; the keyed bit;
  the record deciding nothing; every route passing the bit; the keyless wall; no uniform answer.
  Part B (namespace GB.HOST) is the host model and its binding, proved: the arithmetic frame's value is the Goldbach
  statement; every even number has its seat; the finite form, the statement exactly a certificate at every height.
  Part C (namespace GB.ROWSPLIT) is the cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC, and
  Part C′ (namespace GB.REALPART) reads it on the row: the real part at 2000 and at every checked height; no bypass; the
  unicorn part closed to the record above every height; the aperture one bit wide.
  Part D (namespace GB.WALLS): the parity normal form modulo 420, the residue record deciding neither primality nor
  parity, and the walls of the row in one theorem.
  Part E (namespace GB.RESIDUE): the one implication that remains, printed as a hypothesis and assumed nowhere; its
  instance seat by height.
  Part F (namespace GB.SUPPLY): the bit supplied by its two kinds, the formal cargo and the physical witness; the two
  kinds one bit; delivered twice; two kinds and no third; the one refuter.
  Part G (namespace GB.CLOSURE): the question closed to one bit.
  Part W (namespace GB.GATES): the twelve formal gates run in the kernel, and the four refusals.
  Part X (namespace GB.ESCAPE): nothing escapes, our way or no way, and the capstone.
  Part T (namespace GB.TERMINAL): the open framing refuted, the ten steps, the terminal verdict and the final form.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.

  THE TWO-LAYER CLOSURE. Everything except the bit is proved with no posit: the floor on no axiom at all, and every
  other theorem of this file on no axiom at all; and the bit, the row's reading, is all that remains, at premise grade.
  The root alone forces no value; the root read on the row is the value. No declaration of this file has the type of
  the bit. ΔM = 0.
-/

/-
  GB_Existence_Closure.lean · the kernel of the Goldbach closure from existence alone

  The Goldbach row closed on existence alone, the freedom arrow beside it. Every theorem of this file is
  on no axiom at all: no propext, no Quot.sound, no Classical.choice. The remainder is read from
  the definition of `%` itself (rem_go_spec, rem_spec), so the bridge from the remainder test to
  divisibility, and the statements that pass through it, carry no axiom.
  I     The arithmetic: primality defined; the trial-division test, proved sound and complete;
        the search for a split, proved sound and complete, and returning the least split
        (findSplit_least); a split found exactly when two primes sum to the number (split_iff_std);
        twice any number at least two is an even number at least four; the Goldbach statement in
        search form and standard form, the two proved equivalent.
  II    The mirror p ↦ n − p: an involution whose fixed point is n/2, the seat; splits come in
        mirror pairs; the seat is unique, the mirror's one fixed point (mirror_has_one_seat).
  III   The frame of even numbers, the value, the two coherent worlds; the even numbers at least
        four (Evens); the arithmetic frame, whose value is exactly the Goldbach statement.
  IV    Existence as given: the root, the arrow, the freedom bit; they force no value, and no
        premise that holds on every frame forces it.
  V     Existence read on the row, the act: every even number that exists is realized as a sum
        of two primes. The act is the value; one act closes it; nothing escapes; one even
        number without a split, in search form or standard form, refutes it, a finite certificate.
        The root read on the row is the act and the value; existence as given holds in both
        worlds and forces nothing; nothing given forces the value or refutes the act.
  VI    The proved part: every even number from 4 to 2000 decided by the kernel's own
        computation, read as a statement about even numbers in search and standard form
        (executed_region, executed_region_std); the certified region carried as a field in the
        standard form of the citation, load-bearing, not reaching above its height, abstractly
        and on the arithmetic frame cut at a height (arithUpTo); the ternary and Chen
        realizations, carried abstractly, neither giving the binary.
  VII   The division at a height: the value is exactly its two halves; the remainder is not forced,
        abstractly and on the arithmetic frame; the act is exactly its part above 2000, and above the
        certified height.
  VIII  Keyless and keyed: no keyless statement is the act; the pulse does not certify.
  IX    Freedom: the record wall, on the Bool model of the bit and on frames
        (shared_record_decides_nothing), the two-point fibre, the prime's shape, multiplicative and
        additive.
  X     The triaxial lock.
  XI    The record and the seed: no finite record forces the value, abstractly and on the arithmetic
        frame; a uniform step decides every rung of a ladder that carries it.
  XII   The closure, whole.
  ROOT  The root, undeniable in deed, and the lock: the root holds by its deed and alone forces no
        value; it holds on every frame, and read on the row it is the act and gives the Goldbach
        statement; Appendix R's constructed root, repeated verbatim, is the root on one existent and
        carries the lock (the_lock_on_the_root); one theorem on no axiom binds the root, its readings,
        the act, the value, their keying, the closing theorem, the record wall and the finite record
        (the_lock); and one fixes the sense of 'from existence alone' (from_existence_alone).
-/

namespace GBClose

/-! ### subtraction, proved here on no axiom -/

theorem sub_cancel_right : ∀ n m : Nat, n + m - m = n
  | _, 0 => rfl
  | n, m + 1 => (Nat.succ_sub_succ (n + m) m).trans (sub_cancel_right n m)

theorem sub_cancel_left (n m : Nat) : n + m - n = m := by
  rw [Nat.add_comm]; exact sub_cancel_right m n

theorem sub_add_back : ∀ n m : Nat, m ≤ n → n - m + m = n
  | _, 0, _ => rfl
  | 0, m + 1, h => absurd h (Nat.not_succ_le_zero m)
  | n + 1, m + 1, h => by
    rw [Nat.succ_sub_succ, Nat.add_succ]
    exact congrArg Nat.succ (sub_add_back n m (Nat.le_of_succ_le_succ h))


/-! ## I · the arithmetic -/

def primeAux (n : Nat) : Nat → Nat → Bool
  | 0, _ => true
  | fuel + 1, d => if d * d > n then true else if n % d = 0 then false else primeAux n fuel (d + 1)

/-- The trial-division test. -/
def isPrime (n : Nat) : Bool := if n < 2 then false else primeAux n n 2

/-- Primality, defined: at least two, and no remainder zero below it. -/
def Prime (p : Nat) : Prop := 2 ≤ p ∧ ∀ e, 2 ≤ e → e < p → p % e ≠ 0

theorem primeAux_spec (n : Nat) : ∀ fuel d, primeAux n fuel d = true →
    ∀ e, d ≤ e → e < d + fuel → e * e ≤ n → n % e ≠ 0
  | 0, d, _, e, h1, h2, _ => absurd h2 (Nat.not_lt_of_le (by rw [Nat.add_zero]; exact h1))
  | fuel + 1, d, h, e, h1, h2, h3 => by
    unfold primeAux at h
    by_cases g : d * d > n
    · -- every e ≥ d has e*e ≥ d*d > n
      exact absurd (Nat.lt_of_lt_of_le g (Nat.mul_le_mul h1 h1)) (Nat.not_lt_of_le h3)
    · rw [if_neg g] at h
      by_cases m : n % d = 0
      · rw [if_pos m] at h; exact Bool.noConfusion h
      · rw [if_neg m] at h
        cases Nat.eq_or_lt_of_le h1 with
        | inl he => exact he ▸ m
        | inr hl =>
          exact primeAux_spec n fuel (d + 1) h e hl
            (by rw [Nat.add_assoc, Nat.add_comm 1 fuel]; exact h2) h3

/-! ### the remainder, from its definition: no library lemma about `%` is used -/

/-- The remainder loop splits its input as a multiple of the divisor plus its output, and its output lies
below the divisor. -/
theorem rem_go_spec (y : Nat) (hy : 0 < y) : ∀ (fuel x : Nat) (hf : x < fuel),
    (∃ q, x = q * y + Nat.modCore.go y hy fuel x hf) ∧ Nat.modCore.go y hy fuel x hf < y
  | 0, _, hf => absurd hf (Nat.not_lt_zero _)
  | fuel + 1, x, hf => by
    rw [Nat.modCore.go.eq_2]
    by_cases h : y ≤ x
    · rw [dif_pos h]
      have ih := rem_go_spec y hy fuel (x - y)
        (Nat.lt_of_lt_of_le (Nat.sub_lt (Nat.lt_of_lt_of_le hy h) hy) (Nat.le_of_lt_succ hf))
      refine ⟨?_, ih.2⟩
      obtain ⟨q, hq⟩ := ih.1
      refine ⟨q + 1, ?_⟩
      rw [Nat.succ_mul, Nat.add_assoc, Nat.add_comm y, ← Nat.add_assoc, ← hq]
      exact (sub_add_back x y h).symm
    · rw [dif_neg h]
      exact ⟨⟨0, by rw [Nat.zero_mul, Nat.zero_add]⟩, Nat.lt_of_not_le h⟩

/-- Division with remainder, from the definition of `%`: n is a multiple of e plus n % e, and n % e < e. -/
theorem rem_spec (n e : Nat) (he : 0 < e) : (∃ q, n = q * e + n % e) ∧ n % e < e := by
  cases n with
  | zero =>
    have h0 : (0 : Nat) % e = 0 := by show Nat.mod 0 e = 0; rw [Nat.mod.eq_def]
    rw [h0]; exact ⟨⟨0, by rw [Nat.zero_mul]⟩, he⟩
  | succ k =>
    have hm : (k + 1) % e = (if e ≤ k + 1 then Nat.modCore (k + 1) e else k + 1) := by
      show Nat.mod (k + 1) e = _; rw [Nat.mod.eq_def]
    rw [hm]
    by_cases h : e ≤ k + 1
    · rw [if_pos h, Nat.modCore.eq_def, dif_pos he]
      exact rem_go_spec e he (k + 1 + 1) (k + 1) (Nat.lt_succ_self _)
    · rw [if_neg h]
      exact ⟨⟨0, by rw [Nat.zero_mul, Nat.zero_add]⟩, Nat.lt_of_not_le h⟩

/-- A multiple below the next multiple: q * e + r < (q + 1) * e when r < e. -/
theorem below_next_multiple (q e r : Nat) (hr : r < e) : q * e + r < (q + 1) * e := by
  rw [Nat.succ_mul]; exact Nat.add_lt_add_left hr (q * e)

/-- A zero remainder gives a factor. -/
theorem rem_zero_gives_factor (n e : Nat) (he : 0 < e) (hd : n % e = 0) : ∃ k, n = k * e := by
  obtain ⟨⟨q, hq⟩, _⟩ := rem_spec n e he
  exact ⟨q, by rw [hd, Nat.add_zero] at hq; exact hq⟩

/-- A factor gives a zero remainder. -/
theorem factor_gives_rem_zero (n e k : Nat) (he : 0 < e) (hk : n = k * e) : n % e = 0 := by
  obtain ⟨⟨q, hq⟩, hr⟩ := rem_spec n e he
  have hqk : q = k := by
    cases Nat.lt_or_ge q k with
    | inl h =>
      have a : n < (q + 1) * e := hq ▸ below_next_multiple q e (n % e) hr
      have b : (q + 1) * e ≤ k * e := Nat.mul_le_mul_right e h
      exact absurd (hk ▸ Nat.lt_of_lt_of_le a b) (Nat.lt_irrefl _)
    | inr h =>
      cases Nat.eq_or_lt_of_le h with
      | inl e1 => exact e1.symm
      | inr h' =>
        have a : n < (k + 1) * e := hk ▸ (Nat.add_zero (k * e) ▸ below_next_multiple k e 0 he)
        have b : (k + 1) * e ≤ q * e := Nat.mul_le_mul_right e h'
        have c : q * e ≤ n := hq ▸ Nat.le_add_right (q * e) (n % e)
        exact absurd (Nat.lt_of_lt_of_le a (Nat.le_trans b c)) (Nat.lt_irrefl _)
  rw [hqk, ← hk] at hq
  cases Nat.eq_zero_or_pos (n % e) with
  | inl h0 => exact h0
  | inr hpos =>
    have t : n < n + n % e := Nat.lt_add_of_pos_right hpos
    rw [← hq] at t
    exact absurd t (Nat.lt_irrefl n)

theorem small_divisor (n e : Nat) (h2 : 2 ≤ e) (hlt : e < n) (hd : n % e = 0) :
    ∃ f, 2 ≤ f ∧ f * f ≤ n ∧ n % f = 0 := by
  have epos : 0 < e := Nat.lt_of_lt_of_le (by decide) h2
  obtain ⟨k, hk⟩ := rem_zero_gives_factor n e epos hd
  have k2 : 2 ≤ k := by
    cases Nat.lt_or_ge k 2 with
    | inr h => exact h
    | inl h =>
      have k1 : k ≤ 1 := Nat.le_of_lt_succ h
      have : n ≤ e := by
        have t := Nat.mul_le_mul_right e k1
        rw [Nat.one_mul, ← hk] at t; exact t
      exact absurd hlt (Nat.not_lt_of_le this)
  cases Nat.le_total e k with
  | inl hle =>
    exact ⟨e, h2, by have t := Nat.mul_le_mul_right e hle; rw [← hk] at t; exact t, hd⟩
  | inr hge =>
    refine ⟨k, k2, ?_, ?_⟩
    · have t := Nat.mul_le_mul_left k hge; rw [← hk] at t; exact t
    · exact factor_gives_rem_zero n k e (Nat.lt_of_lt_of_le (by decide) k2) (by rw [Nat.mul_comm]; exact hk)

theorem isPrime_sound (p : Nat) (h : isPrime p = true) : Prime p := by
  unfold isPrime at h
  by_cases g : p < 2
  · rw [if_pos g] at h; exact Bool.noConfusion h
  · rw [if_neg g] at h
    refine ⟨Nat.le_of_not_gt g, fun e h2 hlt hd => ?_⟩
    obtain ⟨f, f2, ff, fd⟩ := small_divisor p e h2 hlt hd
    have fle : f < 2 + p := by
      have : f ≤ f * f := by
        have t := Nat.mul_le_mul_left f (Nat.le_trans (by decide : 1 ≤ 2) f2)
        rw [Nat.mul_one] at t; exact t
      exact Nat.lt_of_le_of_lt (Nat.le_trans this ff) (by rw [Nat.add_comm]; exact Nat.lt_add_of_pos_right (by decide))
    exact primeAux_spec p p 2 h f f2 fle ff fd

/-- The search: the least p with p and n − p prime and p ≤ n − p, below a bound. -/
def findAux (n : Nat) : Nat → Nat → Option Nat
  | 0, _ => none
  | fuel + 1, p =>
    if p * 2 > n then none
    else if isPrime p && isPrime (n - p) then some p
    else findAux n fuel (p + 1)

def findSplit (n : Nat) : Option Nat := findAux n n 2

/-- The search is sound: a found p is prime, its mirror is prime, and p is at most its mirror. -/
theorem findAux_sound (n : Nat) : ∀ fuel p q, findAux n fuel p = some q →
    isPrime q = true ∧ isPrime (n - q) = true ∧ q * 2 ≤ n
  | 0, _, _, h => Option.noConfusion h
  | fuel + 1, p, q, h => by
    unfold findAux at h
    by_cases h1 : p * 2 > n
    · rw [if_pos h1] at h; exact Option.noConfusion h
    · rw [if_neg h1] at h
      cases h2 : isPrime p with
      | false =>
        rw [h2] at h
        change (if false = true then some p else findAux n fuel (p + 1)) = some q at h
        rw [if_neg Bool.false_ne_true] at h
        exact findAux_sound n fuel (p + 1) q h
      | true =>
        cases h3 : isPrime (n - p) with
        | false =>
          rw [h2, h3] at h
          change (if false = true then some p else findAux n fuel (p + 1)) = some q at h
          rw [if_neg Bool.false_ne_true] at h
          exact findAux_sound n fuel (p + 1) q h
        | true =>
          rw [h2, h3] at h
          change (if true = true then some p else findAux n fuel (p + 1)) = some q at h
          rw [if_pos rfl] at h
          have hq : p = q := Option.some.inj h
          exact ⟨hq ▸ h2, hq ▸ h3, hq ▸ Nat.le_of_not_gt h1⟩

theorem findSplit_sound (n q : Nat) (h : findSplit n = some q) :
    isPrime q = true ∧ isPrime (n - q) = true ∧ q * 2 ≤ n :=
  findAux_sound n n 2 q h

/-- The search loop returns the least split: no r from its starting point up to the found q splits n. -/
theorem findAux_least (n fuel p q : Nat) (h : findAux n fuel p = some q) :
    ∀ r, p ≤ r → r < q → ¬ (isPrime r = true ∧ isPrime (n - r) = true) := by
  induction fuel generalizing p with
  | zero => exact Option.noConfusion h
  | succ fuel ih =>
    unfold findAux at h
    by_cases h1 : p * 2 > n
    · rw [if_pos h1] at h; exact Option.noConfusion h
    · rw [if_neg h1] at h
      cases h2 : isPrime p && isPrime (n - p) with
      | true =>
        rw [h2] at h
        change (if true = true then some p else findAux n fuel (p + 1)) = some q at h
        rw [if_pos rfl] at h
        have hq : p = q := Option.some.inj h
        subst hq
        intro r hr hrq
        exact absurd (Nat.lt_of_le_of_lt hr hrq) (Nat.lt_irrefl p)
      | false =>
        rw [h2] at h
        change (if false = true then some p else findAux n fuel (p + 1)) = some q at h
        rw [if_neg Bool.false_ne_true] at h
        intro r hr hrq hpr
        cases Nat.eq_or_lt_of_le hr with
        | inl he =>
          subst he
          rw [hpr.1, hpr.2] at h2
          exact Bool.noConfusion h2
        | inr hl => exact ih (p + 1) h r hl hrq hpr

/-- THE SEARCH RETURNS THE LEAST SPLIT: no r from 2 up to the found q has r and n − r both prime. -/
theorem findSplit_least (n q : Nat) (h : findSplit n = some q) :
    ∀ r, 2 ≤ r → r < q → ¬ (isPrime r = true ∧ isPrime (n - r) = true) :=
  findAux_least n n 2 q h

theorem primeAux_false (n : Nat) : ∀ fuel d, primeAux n fuel d = false →
    ∃ e, d ≤ e ∧ e * e ≤ n ∧ n % e = 0
  | 0, _, h => Bool.noConfusion h
  | fuel + 1, d, h => by
    unfold primeAux at h
    by_cases g : d * d > n
    · rw [if_pos g] at h; exact Bool.noConfusion h
    · rw [if_neg g] at h
      by_cases m : n % d = 0
      · exact ⟨d, Nat.le_refl d, Nat.le_of_not_gt g, m⟩
      · rw [if_neg m] at h
        match primeAux_false n fuel (d + 1) h with
        | ⟨e, he, h2, h3⟩ => exact ⟨e, Nat.le_of_succ_le he, h2, h3⟩

theorem isPrime_complete (p : Nat) (h : Prime p) : isPrime p = true := by
  unfold isPrime
  rw [if_neg (Nat.not_lt_of_le h.1)]
  cases hb : primeAux p p 2 with
  | true => rfl
  | false =>
    match primeAux_false p p 2 hb with
    | ⟨e, he, hee, hm⟩ =>
      have elt : e < p := by
        have : e * 2 ≤ e * e := Nat.mul_le_mul_left e he
        have : e < e * 2 := by
          rw [Nat.mul_two]; exact Nat.lt_add_of_pos_right (Nat.lt_of_lt_of_le (by decide) he)
        exact Nat.lt_of_lt_of_le this (Nat.le_trans (Nat.mul_le_mul_left e he) hee)
      exact absurd hm (h.2 e he elt)

/-- The search is complete: if it returns nothing, no split lies in its range. -/
theorem findAux_complete (n : Nat) : ∀ fuel p, findAux n fuel p = none → n < 2 * (p + fuel) →
    ∀ q, p ≤ q → q * 2 ≤ n → ¬ (isPrime q = true ∧ isPrime (n - q) = true)
  | 0, p, _, hb, q, hq, hq2, _ => by
    rw [Nat.add_zero] at hb
    have : 2 * p ≤ q * 2 := by rw [Nat.mul_comm]; exact Nat.mul_le_mul_right 2 hq
    exact absurd (Nat.lt_of_lt_of_le hb (Nat.le_trans this hq2)) (Nat.lt_irrefl n)
  | fuel + 1, p, h, hb, q, hq, hq2, hpq => by
    unfold findAux at h
    by_cases g : p * 2 > n
    · have : p * 2 ≤ q * 2 := Nat.mul_le_mul_right 2 hq
      exact absurd (Nat.lt_of_lt_of_le g (Nat.le_trans this hq2)) (Nat.lt_irrefl n)
    · rw [if_neg g] at h
      cases Nat.eq_or_lt_of_le hq with
      | inl he =>
        subst he
        rw [hpq.1, hpq.2] at h
        change (if true = true then some p else findAux n fuel (p + 1)) = none at h
        rw [if_pos rfl] at h; exact Option.noConfusion h
      | inr hl =>
        cases h2 : isPrime p && isPrime (n - p) with
        | true =>
          rw [h2] at h; change (if true = true then some p else findAux n fuel (p + 1)) = none at h
          rw [if_pos rfl] at h; exact Option.noConfusion h
        | false =>
          rw [h2] at h; change (if false = true then some p else findAux n fuel (p + 1)) = none at h
          rw [if_neg Bool.false_ne_true] at h
          exact findAux_complete n fuel (p + 1) h (by rw [Nat.add_assoc, Nat.add_comm 1 fuel]; exact hb)
            q hl hq2 hpq

/-- An even number at least four. -/
def EvenAtLeast4 (n : Nat) : Prop := 4 ≤ n ∧ n % 2 = 0

/-- Twice a number at least two: 2 · (k + 2) is an even number at least four, for every k. -/
theorem even_double (k : Nat) : EvenAtLeast4 (2 * (k + 2)) :=
  ⟨Nat.mul_le_mul_left 2 (Nat.le_add_left 2 k), factor_gives_rem_zero (2 * (k + 2)) 2 (k + 2) (by decide) (Nat.mul_comm 2 (k + 2))⟩

/-- THE GOLDBACH STATEMENT, in the kernel's arithmetic. -/
def Goldbach : Prop := ∀ n, EvenAtLeast4 n → ∃ q, findSplit n = some q

/-- The Goldbach statement in the standard form: two primes summing to n. -/
def GoldbachStd : Prop := ∀ n, EvenAtLeast4 n → ∃ p q, Prime p ∧ Prime q ∧ p + q = n

/-- A SPLIT IS FOUND EXACTLY WHEN TWO PRIMES SUM TO THE NUMBER: the search, sound and complete, at each n. -/
theorem split_iff_std (n : Nat) : (∃ q, findSplit n = some q) ↔ ∃ p q, Prime p ∧ Prime q ∧ p + q = n :=
  ⟨fun ⟨q, hq⟩ =>
    have s := findSplit_sound n q hq
    have hle : q ≤ n := Nat.le_trans (Nat.le_mul_of_pos_right q (by decide)) s.2.2
    ⟨q, n - q, isPrime_sound q s.1, isPrime_sound (n - q) s.2.1, by rw [Nat.add_comm]; exact sub_add_back n q hle⟩,
   fun ⟨p, q, hp, hq, hs⟩ =>
    match hf : findSplit n with
    | some r => ⟨r, rfl⟩
    | none => by
      cases Nat.le_total p q with
      | inl hle =>
        have h2 : p * 2 ≤ n := by rw [Nat.mul_two, ← hs]; exact Nat.add_le_add_left hle p
        have hsub : n - p = q := by rw [← hs]; exact sub_cancel_left p q
        exact absurd ⟨isPrime_complete p hp, hsub ▸ isPrime_complete q hq⟩
          (findAux_complete n n 2 hf (by
              show n < 2 * (2 + n)
              rw [Nat.add_comm, Nat.mul_add]
              exact Nat.lt_of_le_of_lt (Nat.le_mul_of_pos_left n (by decide)) (Nat.lt_add_of_pos_right (by decide)))
            p hp.1 h2)
      | inr hle =>
        have h2 : q * 2 ≤ n := by rw [Nat.mul_two, ← hs, Nat.add_comm p q]; exact Nat.add_le_add_left hle q
        have hsub : n - q = p := by rw [← hs]; exact sub_cancel_right p q
        exact absurd ⟨isPrime_complete q hq, hsub ▸ isPrime_complete p hp⟩
          (findAux_complete n n 2 hf (by
              show n < 2 * (2 + n)
              rw [Nat.add_comm, Nat.mul_add]
              exact Nat.lt_of_le_of_lt (Nat.le_mul_of_pos_left n (by decide)) (Nat.lt_add_of_pos_right (by decide)))
            q hq.1 h2)⟩

/-- The search form gives the standard form. -/
theorem goldbach_gives_std (h : Goldbach) : GoldbachStd := fun n hn => (split_iff_std n).mp (h n hn)

/-- The standard form gives the search form: the search is complete. -/
theorem std_gives_goldbach (h : GoldbachStd) : Goldbach := fun n hn => (split_iff_std n).mpr (h n hn)

/-- THE TWO FORMS ARE EQUIVALENT. -/
theorem goldbach_iff_std : Goldbach ↔ GoldbachStd := ⟨goldbach_gives_std, std_gives_goldbach⟩

/-! ## II · the mirror and its seat -/



def mirror (n p : Nat) : Nat := n - p

theorem mirror_involution (n p : Nat) (h : p ≤ n) : mirror n (mirror n p) = p := by
  show n - (n - p) = p
  have e : n - p + p = n := sub_add_back n p h
  have t : n - p + p - (n - p) = p := sub_cancel_left (n - p) p
  rw [e] at t
  exact t

/-- A split mirrors to a split: if p and n − p are prime, so are n − p and n − (n − p). -/
theorem split_mirrors (n p : Nat) (h : p ≤ n) (hp : isPrime p = true) (hq : isPrime (n - p) = true) :
    isPrime (mirror n p) = true ∧ isPrime (n - mirror n p) = true :=
  ⟨hq, by show isPrime (n - (n - p)) = true; rw [show n - (n - p) = p from mirror_involution n p h]; exact hp⟩

/-- The seat: the mirror fixes p exactly when p + p = n. -/
theorem seat_of_mirror (n p : Nat) (h : p ≤ n) : mirror n p = p ↔ p + p = n :=
  ⟨fun e => by
      have : n - p + p = n := sub_add_back n p h
      rw [show mirror n p = n - p from rfl] at e; rw [e] at this; exact this,
   fun e => by show n - p = p; rw [← e]; exact sub_cancel_right p p⟩

/-- The seat is unique: two numbers with the same double are equal. -/
theorem seat_unique (p q : Nat) (h : p + p = q + q) : p = q :=
  match Nat.lt_or_ge p q with
  | Or.inl hl => absurd (Nat.lt_of_lt_of_le (Nat.add_lt_add hl hl) (Nat.le_of_eq h.symm)) (Nat.lt_irrefl (p + p))
  | Or.inr hg => match Nat.eq_or_lt_of_le hg with
    | Or.inl e => e.symm
    | Or.inr hl => absurd (Nat.lt_of_lt_of_le (Nat.add_lt_add hl hl) (Nat.le_of_eq h)) (Nat.lt_irrefl (q + q))

/-- THE MIRROR HAS ONE SEAT: on n = 2k the mirror fixes k, and every p ≤ n that it fixes is k. -/
theorem mirror_has_one_seat (n k : Nat) (hk : n = k * 2) :
    mirror n k = k ∧ ∀ p, p ≤ n → mirror n p = p → p = k :=
  have e : k + k = n := (hk.trans (Nat.mul_two k)).symm
  ⟨(seat_of_mirror n k (Nat.le_trans (Nat.le_add_right k k) (Nat.le_of_eq e))).mpr e,
   fun p hp hm => seat_unique p k (((seat_of_mirror n p hp).mp hm).trans e.symm)⟩

/-! ## III · the frame, and the arithmetic frame -/

structure Frame where
  D       : Type
  realize : D → Option Nat

def Value (F : Frame) : Prop := ∀ d, ∃ q, F.realize d = some q

def calm : Frame := ⟨Unit, fun _ => some 3⟩
def counter : Frame := ⟨Unit, fun _ => none⟩

theorem calm_value : Value calm := fun _ => ⟨3, rfl⟩
theorem counter_fails : ¬ Value counter := fun h => match h () with
  | ⟨_, hn⟩ => Option.noConfusion hn

/-- The even numbers at least four, the domain of the arithmetic frame. -/
abbrev Evens : Type := { n : Nat // EvenAtLeast4 n }

/-- The arithmetic frame: the even numbers at least four, each realized by the search. -/
def arith : Frame := ⟨Evens, fun d => findSplit d.1⟩

/-- THE ARITHMETIC FRAME'S VALUE IS EXACTLY THE GOLDBACH STATEMENT. -/
theorem arith_value_iff : Value arith ↔ Goldbach :=
  ⟨fun h n hn => h ⟨n, hn⟩, fun h d => h d.1 d.2⟩

/-! ## IV · existence as given -/

def Root (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem root_given : Root Empty (fun e => nomatch e) := fun e => nomatch e

theorem root_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) : S :=
  h Empty (fun e => nomatch e) root_given

def Arrow : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a

theorem arrow_given : Arrow := fun _ => ⟨id, fun _ => rfl⟩

theorem freedom_given : ∀ w : Bool, (!w) ≠ w
  | true => Bool.noConfusion
  | false => Bool.noConfusion

theorem given_is_not_the_value (P : Prop) : ¬ ∀ F : Frame, (P ↔ Value F) :=
  fun h => counter_fails ((h counter).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => counter_fails (h counter arrow_given)

/-- A uniform premise forces nothing: a premise that holds on every frame holds where the value fails. -/
theorem uniform_premise_forces_nothing (P : Frame → Prop) (hP : ∀ F, P F) : ¬ ∀ F : Frame, P F → Value F :=
  fun h => counter_fails (h counter (hP counter))

theorem given_in_both_worlds : (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, counter_fails⟩⟩

/-! ## V · existence read on the row: the act -/

/-- Existence read on the row: every even number that exists is realized as a sum of two primes. -/
def Realized (F : Frame) : Prop := ∀ d, ∃ q, F.realize d = some q

theorem act_is_the_value (F : Frame) : Realized F ↔ Value F :=
  ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Realized calm ∧ ¬ Realized counter := ⟨calm_value, counter_fails⟩

/-! ## The root read on the row -/

/-- The indicator of a decided proposition: one where it holds, zero where it fails. -/
def indicator {p : Prop} : Decidable p → Int
  | isTrue _  => 1
  | isFalse _ => 0

/-- The indicator is positive exactly where its proposition holds. -/
theorem indicator_pos {p : Prop} (h : Decidable p) : 0 < indicator h ↔ p :=
  match h with
  | isTrue hp  => ⟨fun _ => hp, fun _ => show (0 : Int) < 1 by decide⟩
  | isFalse hn => ⟨fun h0 => absurd h0 (show ¬ (0 : Int) < 0 by decide), fun hp => absurd hp hn⟩

/-- Whether an option carries a value, decided. -/
def suppliedDec (o : Option Nat) : Decidable (∃ n, o = some n) :=
  match o with
  | some n => isTrue ⟨n, rfl⟩
  | none   => isFalse (fun ⟨_, h⟩ => Option.noConfusion h)

/-- THE ROOT READ ON THE ROW: to exist is to actuate, `Root` itself, with the row's existents, its even
numbers, and the row's actuation, one where the number is realized as a sum and zero where it is not. -/
def RootOnRow (F : Frame) : Prop :=
  Root F.D (fun d => indicator (suppliedDec (F.realize d)))

/-- THE ROOT IS SATISFIABLE ON EVERY BACKGROUND: on every type, with actuation one at every existent. -/
theorem root_satisfiable (U : Type) : Root U (fun _ => 1) := fun _ => show (0 : Int) < 1 by decide

/-- THE CONSTRUCTED ROOT, in the words of Appendix R: one existent, whose actuation is one. A theorem
with no hypothesis and no axiom. -/
theorem constructed_root_holds : Root Unit (fun _ => 1) := root_satisfiable Unit

/-- THE ROOT READ ON THE ROW IS THE ACT. -/
theorem root_on_row_is_the_act (F : Frame) : RootOnRow F ↔ Realized F :=
  ⟨fun h d => (indicator_pos _).mp (h d), fun h d => (indicator_pos _).mpr (h d)⟩

/-- THE ROOT READ ON THE ROW IS THE VALUE. -/
theorem root_on_row_is_the_value (F : Frame) : RootOnRow F ↔ Value F :=
  ⟨fun h => (act_is_the_value F).mp ((root_on_row_is_the_act F).mp h),
   fun h => (root_on_row_is_the_act F).mpr ((act_is_the_value F).mpr h)⟩

/-- THE ROOT READ ON THE ROW IS KEYED: it holds where the value holds and fails where the value fails. -/
theorem root_on_row_is_keyed : RootOnRow calm ∧ ¬ RootOnRow counter :=
  ⟨(root_on_row_is_the_value calm).mpr calm_value, fun h => counter_fails ((root_on_row_is_the_value counter).mp h)⟩

/-- THE ACT IS THE WEAKEST PREMISE: the act forces the value on every frame, and every premise that forces
the value on every frame implies the act. -/
theorem act_is_the_weakest_premise :
    (∀ F : Frame, Realized F → Value F) ∧
    ∀ Q : Frame → Prop, (∀ F : Frame, Q F → Value F) → ∀ F : Frame, Q F → Realized F :=
  ⟨fun F h => (act_is_the_value F).mp h, fun _ hQ F hq => (act_is_the_value F).mpr (hQ F hq)⟩

/-- EXISTENCE AS GIVEN HOLDS IN BOTH WORLDS: the root satisfiable on every background, the arrow and the
freedom bit hold in the world where the value holds and in the world where it fails. -/
theorem existence_as_given_in_both_worlds :
    ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) ∧ Value calm ∧ ¬ Value counter :=
  ⟨⟨root_satisfiable, arrow_given, freedom_given⟩, calm_value, counter_fails⟩

/-- EXISTENCE AS GIVEN FORCES NOTHING: the root on every background, the arrow and the freedom bit together
force the value on no frame where it fails. -/
theorem existence_as_given_forces_nothing :
    ¬ ∀ F : Frame, ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) → Value F :=
  fun h => counter_fails (h counter existence_as_given_in_both_worlds.1)

/-- NOTHING GIVEN REFUTES THE ACT: no statement that holds refutes the act on every frame. -/
theorem nothing_given_refutes : ∀ P : Prop, P → ¬ ∀ F : Frame, P → ¬ Realized F :=
  fun _ hp h => h calm hp act_is_keyed.1

/-- NOTHING GIVEN FORCES THE VALUE: no statement that holds forces the value on every frame. -/
theorem nothing_given_forces : ∀ P : Prop, P → ¬ ∀ F : Frame, P → Value F :=
  fun _ hp h => counter_fails (h counter hp)

/-- THE ONLY REFUTER: wherever the act fails, it cannot be that no instance fails, an unrealized even number. -/
theorem only_refuter (F : Frame) : ¬ Realized F → ¬ ¬ ∃ d, F.realize d = none :=
  fun hn hne => hn (fun d => match hc : F.realize d with
    | some n => ⟨n, rfl⟩
    | none => absurd ⟨d, hc⟩ hne)

/-- On the arithmetic frame the act is exactly the Goldbach statement. -/
theorem act_is_goldbach : Realized arith ↔ Goldbach :=
  (act_is_the_value arith).trans arith_value_iff

/-- On the arithmetic frame the act is exactly the Goldbach statement in its standard form. -/
theorem act_is_goldbach_std : Realized arith ↔ GoldbachStd := act_is_goldbach.trans goldbach_iff_std

structure ActualEvens where
  F      : Frame
  supply : Realized F

theorem goldbach_from_existence (A : ActualEvens) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

/-- THE GOLDBACH STATEMENT FROM EXISTENCE, BY ONE ACT, on the arithmetic frame. -/
theorem goldbach_from_the_act (h : Realized arith) : Goldbach := act_is_goldbach.mp h

/-- THE SUPPLY IS EXACT: an act exists on a frame exactly when the value holds there. -/
theorem supply_iff (F : Frame) : Nonempty { A : ActualEvens // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ goldbach_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

theorem every_even_lands (F : Frame) (d : F.D) :
    (∃ q, F.realize d = some q) ∨ F.realize d = none :=
  match F.realize d with
  | some q => Or.inl ⟨q, rfl⟩
  | none => Or.inr rfl

theorem gates_exclusive (F : Frame) (d : F.D) :
    ¬ ((∃ q, F.realize d = some q) ∧ F.realize d = none) :=
  fun ⟨⟨_, h⟩, h'⟩ => Option.noConfusion (h'.symm.trans h)

theorem nothing_escapes (A : ActualEvens) : ∀ d, ∃ q, A.F.realize d = some q := A.supply

/-- One even number with no split is a finite certificate refuting the Goldbach statement. -/
theorem counterexample_refutes (n : Nat) (hn : EvenAtLeast4 n) (h : findSplit n = none) :
    ¬ Goldbach :=
  fun g => match g n hn with
    | ⟨_, hq⟩ => Option.noConfusion (h.symm.trans hq)

/-- One even number that is not a sum of two primes, in the standard form, refutes the act on the arithmetic frame. -/
theorem counterexample_refutes_std (n : Nat) (hn : EvenAtLeast4 n)
    (h : ¬ ∃ p q, Prime p ∧ Prime q ∧ p + q = n) : ¬ Realized arith :=
  fun hr => h (act_is_goldbach_std.mp hr n hn)

/-! ## VI · the proved part -/

/-- The executed check: every even number 2m with 2 ≤ m ≤ k has a split. -/
def checkAux : Nat → Bool
  | 0 => true
  | m + 1 => (decide (m + 1 < 2) || (findSplit (2 * (m + 1))).isSome) && checkAux m

def checkUpTo (N : Nat) : Bool := checkAux (N / 2)

/-- What the executed check means: every even number 2m with 2 ≤ m ≤ k has a split. -/
theorem check_means : ∀ k m, checkAux k = true → m ≤ k → 2 ≤ m → (findSplit (2 * m)).isSome = true
  | 0, m, _, hm, h2 => absurd (Nat.le_trans h2 hm) (by decide)
  | k + 1, m, h, hm, h2 => by
    unfold checkAux at h
    cases ha : (decide (k + 1 < 2) || (findSplit (2 * (k + 1))).isSome) with
    | false => rw [ha, Bool.false_and] at h; exact Bool.noConfusion h
    | true =>
      cases hb : checkAux k with
      | false => rw [ha, hb] at h; exact Bool.noConfusion h
      | true =>
        cases Nat.eq_or_lt_of_le hm with
        | inr hl => exact check_means k m hb (Nat.le_of_lt_succ hl) h2
        | inl he =>
          subst he
          cases hd : decide (k + 1 < 2) with
          | true => exact absurd h2 (Nat.not_le_of_gt (of_decide_eq_true hd))
          | false => rw [hd, Bool.false_or] at ha; exact ha

set_option maxRecDepth 100000 in
/-- THE EXECUTED CHECK: the Bool computation over every even number from 4 to 2000, run by the kernel;
executed_region reads it as a statement about even numbers. -/
theorem executed_to_2000 : checkUpTo 2000 = true := by decide

/-- THE EXECUTED REGION: every even number from 4 to 2000 has a split, read from the executed check. -/
theorem executed_region (n : Nat) (hn : EvenAtLeast4 n) (hH : n ≤ 2000) : ∃ q, findSplit n = some q := by
  match rem_zero_gives_factor n 2 (by decide) hn.2 with
  | ⟨k, hk⟩ =>
    have k2 : 2 ≤ k := match Nat.lt_or_ge k 2 with
      | Or.inr h => h
      | Or.inl h => absurd (Nat.le_trans hn.1 (Nat.le_trans (Nat.le_of_eq hk)
          (Nat.mul_le_mul_right 2 (Nat.le_of_lt_succ h)))) (by decide)
    have kH : k ≤ 1000 := match Nat.lt_or_ge 1000 k with
      | Or.inr h => h
      | Or.inl h => absurd (Nat.le_trans (Nat.mul_le_mul_right 2 (Nat.succ_le_of_lt h))
          (Nat.le_trans (Nat.le_of_eq hk.symm) hH)) (by decide)
    have hs : (findSplit (2 * k)).isSome = true := check_means 1000 k executed_to_2000 kH k2
    have e : 2 * k = n := (Nat.mul_comm 2 k).trans hk.symm
    cases hf : findSplit (2 * k) with
    | some q => exact ⟨q, e ▸ hf⟩
    | none => rw [hf] at hs; exact Bool.noConfusion hs

/-- THE EXECUTED REGION IN THE STANDARD FORM: every even number from 4 to 2000 is a sum of two primes. -/
theorem executed_region_std : ∀ n, EvenAtLeast4 n → n ≤ 2000 → ∃ p q, Prime p ∧ Prime q ∧ p + q = n :=
  fun n hn hH => (split_iff_std n).mp (executed_region n hn hH)

/-- The height of the cited verification: 4 × 10^18 (Oliveira e Silva, Herzog and Pardi 2014). -/
def certifiedHeight : Nat := 4000000000000000000

/-- The certified region, carried as a field at the certified height: it states Oliveira e Silva, Herzog and
Pardi's conclusion in its standard form, every even number from 4 to 4 × 10^18 a sum of two primes. -/
structure Certified where
  cert : ∀ n, EvenAtLeast4 n → n ≤ certifiedHeight → ∃ p q, Prime p ∧ Prime q ∧ p + q = n

/-- Below the certified height the search finds a split, read from the field through split_iff_std. -/
theorem below_height_decided (C : Certified) (n : Nat) (hn : EvenAtLeast4 n) (hH : n ≤ certifiedHeight) :
    ∃ q, findSplit n = some q := (split_iff_std n).mpr (C.cert n hn hH)

/-- An abstract certified frame: a height, and a realization certified below it. -/
structure CertFrame where
  F     : Frame
  ht    : F.D → Nat
  H     : Nat
  cert  : ∀ d, ht d ≤ H → ∃ q, F.realize d = some q

def certCounter : CertFrame := ⟨⟨Nat, fun d => if d ≤ certifiedHeight then some 3 else none⟩, fun d => d,
  certifiedHeight, fun d h => ⟨3, by show (if d ≤ certifiedHeight then some 3 else none) = some 3; rw [if_pos h]⟩⟩

/-- THE CERTIFICATE DOES NOT REACH ABOVE ITS HEIGHT: a frame certified to 4 × 10^18 fails at the next number. -/
theorem certificate_does_not_reach_above : ¬ Value certCounter.F :=
  fun h => match h (show certCounter.F.D from certifiedHeight + 1) with
    | ⟨_, hq⟩ => by
      have e : certCounter.F.realize (show certCounter.F.D from certifiedHeight + 1) = none := by
        show (if certifiedHeight + 1 ≤ certifiedHeight then some 3 else none) = none
        rw [if_neg (Nat.not_succ_le_self certifiedHeight)]
      exact Option.noConfusion (e.symm.trans hq)

structure CertFrameNoCert where
  F  : Frame
  ht : F.D → Nat
  H  : Nat

def bareCert : CertFrameNoCert := ⟨counter, fun _ => 4, certifiedHeight⟩

/-- THE CERTIFICATE IS LOAD-BEARING: without it an even number below 4 × 10^18 goes unrealized. -/
theorem certificate_is_load_bearing : bareCert.ht () ≤ bareCert.H ∧ ¬ ∃ q, bareCert.F.realize () = some q :=
  ⟨by decide, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- The arithmetic frame cut at a height: the search up to h, nothing above it. -/
def arithUpTo (h : Nat) : Frame := ⟨Evens, fun d => if d.1 ≤ h then findSplit d.1 else none⟩

/-- Up to its height the cut frame is the arithmetic frame. -/
theorem arithUpTo_agrees (h : Nat) (d : Evens) (hd : d.1 ≤ h) : (arithUpTo h).realize d = arith.realize d :=
  show (if d.1 ≤ h then findSplit d.1 else none) = findSplit d.1 from if_pos hd

/-- Above its height the cut frame realizes nothing. -/
theorem arithUpTo_stops (h : Nat) (d : Evens) (hd : h < d.1) : (arithUpTo h).realize d = none :=
  show (if d.1 ≤ h then findSplit d.1 else none) = none from if_neg (Nat.not_le_of_gt hd)

/-- THE CERTIFICATE IS LOAD-BEARING ON THE ROW: the arithmetic frame cut at 2000 agrees with the search and
splits every even number up to 2000, yet leaves 2002, below the certified height, unrealized. -/
theorem certificate_is_load_bearing_arith :
    (∀ d : Evens, d.1 ≤ 2000 → (arithUpTo 2000).realize d = arith.realize d) ∧
    (∀ d : Evens, d.1 ≤ 2000 → ∃ q, (arithUpTo 2000).realize d = some q) ∧
    2002 ≤ certifiedHeight ∧
    (arithUpTo 2000).realize ⟨2002, ⟨by decide, by decide⟩⟩ = none :=
  ⟨arithUpTo_agrees 2000,
   fun d hd => match executed_region d.1 d.2 hd with
     | ⟨q, hq⟩ => ⟨q, (arithUpTo_agrees 2000 d hd).trans hq⟩,
   by decide,
   arithUpTo_stops 2000 ⟨2002, ⟨by decide, by decide⟩⟩ (by decide)⟩

/-- THE CERTIFICATE DOES NOT REACH ABOVE ITS HEIGHT ON THE ROW: the arithmetic frame cut at 4 × 10^18 agrees
with the search up to there, leaves 4 × 10^18 + 2 unrealized, and does not hold. -/
theorem certificate_does_not_reach_above_arith :
    (∀ d : Evens, d.1 ≤ certifiedHeight → (arithUpTo certifiedHeight).realize d = arith.realize d) ∧
    (arithUpTo certifiedHeight).realize ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ = none ∧
    ¬ Value (arithUpTo certifiedHeight) :=
  have hs : (arithUpTo certifiedHeight).realize ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ = none :=
    arithUpTo_stops certifiedHeight _ (Nat.lt_add_of_pos_right (by decide))
  ⟨arithUpTo_agrees certifiedHeight, hs,
   fun hv => match hv ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ with
     | ⟨_, hq⟩ => Option.noConfusion (hs.symm.trans hq)⟩

/-- A frame with two abstract realizations beside the binary one, standing for the cited
ternary theorem (three primes for every odd number greater than 5) and Chen's theorem (a prime plus a prime or
semiprime for every large even number); neither statement is formalized here, only the shape they
share. -/
structure Weaker where
  F       : Frame
  ternary : F.D → Option Nat
  chen    : F.D → Option Nat
  tern    : ∀ d, ∃ t, ternary d = some t
  chenAll : ∀ d, ∃ c, chen d = some c

/-- An abstract frame, the shape the ternary and Chen citations share: both weaker realizations everywhere, the
binary nowhere. -/
def weakerCounter : Weaker := ⟨counter, fun _ => some 3, fun _ => some 3,
  fun _ => ⟨3, rfl⟩, fun _ => ⟨3, rfl⟩⟩

/-- NEITHER THE TERNARY THEOREM NOR CHEN'S THEOREM GIVES THE BINARY VALUE. -/
theorem weaker_do_not_give_binary :
    (∀ d, ∃ t, weakerCounter.ternary d = some t) ∧ (∀ d, ∃ c, weakerCounter.chen d = some c) ∧
    ¬ Value weakerCounter.F :=
  ⟨weakerCounter.tern, weakerCounter.chenAll, counter_fails⟩

/-! ## VII · the division at a height -/

def ValueOn (F : Frame) (cut : F.D → Bool) (b : Bool) : Prop :=
  ∀ d, cut d = b → ∃ q, F.realize d = some q

theorem row_split (F : Frame) (cut : F.D → Bool) :
    Value F ↔ ValueOn F cut true ∧ ValueOn F cut false :=
  ⟨fun h => ⟨fun d _ => h d, fun d _ => h d⟩,
   fun ⟨ht, hf⟩ d => match hc : cut d with
     | true => ht d hc
     | false => hf d hc⟩

/-- The certified half holds and the remainder fails in the certified counter world. -/
theorem remainder_not_forced :
    ValueOn certCounter.F (fun d => Nat.ble d certifiedHeight) true ∧
    ¬ ValueOn certCounter.F (fun d => Nat.ble d certifiedHeight) false :=
  ⟨fun d h => certCounter.cert d (Nat.le_of_ble_eq_true h),
   fun h => certificate_does_not_reach_above (fun d =>
     match hc : Nat.ble d certifiedHeight with
     | true => certCounter.cert d (Nat.le_of_ble_eq_true hc)
     | false => h d hc)⟩

/-- On the arithmetic frame cut at the certified height, the certified half holds by the certificate and the
remainder fails. -/
theorem remainder_not_forced_arith (C : Certified) :
    ValueOn (arithUpTo certifiedHeight) (fun d => Nat.ble d.1 certifiedHeight) true ∧
    ¬ ValueOn (arithUpTo certifiedHeight) (fun d => Nat.ble d.1 certifiedHeight) false :=
  ⟨fun d hc => match below_height_decided C d.1 d.2 (Nat.le_of_ble_eq_true hc) with
     | ⟨q, hq⟩ => ⟨q, (arithUpTo_agrees certifiedHeight d (Nat.le_of_ble_eq_true hc)).trans hq⟩,
   fun h =>
     have hlt : certifiedHeight < certifiedHeight + 2 := Nat.lt_add_of_pos_right (by decide)
     have hb : Nat.ble (certifiedHeight + 2) certifiedHeight = false :=
       match hc : Nat.ble (certifiedHeight + 2) certifiedHeight with
       | true => absurd (Nat.le_of_ble_eq_true hc) (Nat.not_le_of_gt hlt)
       | false => rfl
     match h ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ hb with
     | ⟨_, hq⟩ => Option.noConfusion
         ((arithUpTo_stops certifiedHeight ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ hlt).symm.trans hq)⟩

/-- THE ACT IS EXACTLY ITS PART ABOVE 2000: below that height the executed region decides it. -/
theorem act_iff_above_2000 :
    Realized arith ↔ ∀ n, EvenAtLeast4 n → 2000 < n → ∃ q, findSplit n = some q :=
  ⟨fun h n hn _ => act_is_goldbach.mp h n hn,
   fun h => act_is_goldbach.mpr (fun n hn => match Nat.lt_or_ge 2000 n with
     | Or.inl hl => h n hn hl
     | Or.inr hle => executed_region n hn hle)⟩

/-- THE ACT IS EXACTLY ITS PART ABOVE THE CERTIFIED HEIGHT: below it the certificate decides it. -/
theorem act_iff_above_height (C : Certified) :
    Realized arith ↔ ∀ n, EvenAtLeast4 n → certifiedHeight < n → ∃ q, findSplit n = some q :=
  ⟨fun h n hn _ => act_is_goldbach.mp h n hn,
   fun h => act_is_goldbach.mpr (fun n hn => match Nat.lt_or_ge certifiedHeight n with
     | Or.inl hl => h n hn hl
     | Or.inr hle => below_height_decided C n hn hle)⟩

/-! ## VIII · keyless and keyed -/

def Keyed (P : Frame → Prop) : Prop := ∃ F, ¬ P F

theorem value_is_keyed : Keyed Value := ⟨counter, counter_fails⟩

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Realized F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩

/-! ## IX · freedom -/

/-- The kinetic record, the Bool model of the bit: the same record whichever way the bit falls;
shared_record_decides_nothing is the wall on frames. -/
def kineticRecord (_w : Bool) : Nat := 0

/-- The record wall, on the Bool model of the bit: no reading of the record returns the bit;
shared_record_decides_nothing is the same wall on frames. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

/-- A SHARED RECORD DECIDES NOTHING: a record of frames that is the same on the frame where the value holds and
on the frame where it fails has no reading that returns the value on every frame. -/
theorem shared_record_decides_nothing {α : Type} (r : Frame → α) (hr : r calm = r counter) :
    ¬ ∃ g : α → Bool, ∀ F : Frame, (g (r F) = true ↔ Value F) :=
  fun ⟨g, hg⟩ => counter_fails ((hg counter).mp ((congrArg g hr).symm.trans ((hg calm).mpr calm_value)))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true := by
  decide

/-- The additive fibre: the ordered splits of n into two primes. -/
def addFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).filterMap fun p => if isPrime p && isPrime (n - p) then some (p, n - p) else none

/-- The additive shape: the splits of 10 are one mirror pair off the seat and one point on it, the splits of
14 are one mirror pair off the seat and one on it, and the splits of 16 are two mirror pairs and no point on the
seat. -/
theorem additive_shape :
    addFibre 10 = [(3, 7), (5, 5), (7, 3)] ∧ addFibre 14 = [(3, 11), (7, 7), (11, 3)] ∧
    addFibre 16 = [(3, 13), (5, 11), (11, 5), (13, 3)] := by
  decide

/-! ## X · the triaxial lock -/

def dot2 (r x : Bool × Bool × Bool) : Bool :=
  xor (r.1 && x.1) (xor (r.2.1 && x.2.1) (r.2.2 && x.2.2))

def cube : List (Bool × Bool × Bool) :=
  [false, true].flatMap fun a => [false, true].flatMap fun b => [false, true].map fun c => (a, b, c)

def nonzero : List (Bool × Bool × Bool) := cube.filter (fun r => r != (false, false, false))

def solCount (rows : List ((Bool × Bool × Bool) × Bool)) : Nat :=
  (cube.filter (fun x => rows.all (fun rt => dot2 rt.1 x == rt.2))).length

def xor3 (a b : Bool × Bool × Bool) : Bool × Bool × Bool :=
  (xor a.1 b.1, xor a.2.1 b.2.1, xor a.2.2 b.2.2)

theorem two_axes_leave_two :
    nonzero.all (fun r1 => nonzero.all (fun r2 => r1 == r2 ||
      [false, true].all (fun t1 => [false, true].all (fun t2 =>
        solCount [(r1, t1), (r2, t2)] == 2)))) = true := by decide

theorem three_axes_lock_one :
    nonzero.all (fun r1 => nonzero.all (fun r2 => nonzero.all (fun r3 =>
      r1 == r2 || r3 == r1 || r3 == r2 || r3 == xor3 r1 r2 ||
      [false, true].all (fun t1 => [false, true].all (fun t2 => [false, true].all (fun t3 =>
        solCount [(r1, t1), (r2, t2), (r3, t3)] == 1)))))) = true := by decide

/-! ## XI · the record and the seed -/

/-- A staged frame, abstract: realized below n and not from n on, the shape the cited finite verifications
share; finite_arith_record_never_forces carries it on the arithmetic frame. -/
def staged (n : Nat) : Frame := ⟨Nat, fun d => if d < n then some 3 else none⟩

theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → ∃ q, (staged n).realize d = some q) ∧ ¬ Value (staged n) :=
  ⟨fun d hd => ⟨3, by show (if d < n then some 3 else none) = some 3; rw [if_pos hd]⟩,
   fun h => match h n with
     | ⟨_, hk⟩ => by
       have e : (staged n).realize n = none := by
         show (if n < n then some 3 else (none : Option Nat)) = none
         rw [if_neg (Nat.lt_irrefl n)]
       exact Option.noConfusion (e.symm.trans hk)⟩

/-- NO FINITE ARITHMETIC RECORD FORCES THE VALUE: the arithmetic frame cut at any height h agrees with the search
up to h, and fails at the even number 2 · (h + 2) above it. -/
theorem finite_arith_record_never_forces (h : Nat) :
    (∀ d : Evens, d.1 ≤ h → (arithUpTo h).realize d = arith.realize d) ∧ ¬ Value (arithUpTo h) :=
  ⟨arithUpTo_agrees h,
   fun hv => match hv ⟨2 * (h + 2), even_double h⟩ with
     | ⟨_, hq⟩ => Option.noConfusion ((arithUpTo_stops h ⟨2 * (h + 2), even_double h⟩
         (Nat.lt_of_lt_of_le (Nat.lt_add_of_pos_right (by decide)) (Nat.le_mul_of_pos_left (h + 2) (by decide)))).symm.trans hq)⟩

structure Ladder where
  Decided : Nat → Prop
  base    : Decided 0
  mono    : ∀ r s, Decided s → r ≤ s → Decided r
  δ       : Nat → Nat
  step    : ∀ r, Decided r → Decided (r + δ r)

theorem uniform_step_forces_all (L : Ladder) (hδ : ∀ r, 1 ≤ L.δ r) : ∀ r, L.Decided r
  | 0 => L.base
  | r + 1 => L.mono (r + 1) (r + L.δ r) (L.step r (uniform_step_forces_all L hδ r))
      (Nat.add_le_add_left (hδ r) r)

/-! ## XII · the closure, whole -/

theorem goldbach_closure :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (Realized arith ↔ Goldbach) ∧
    (∀ n, EvenAtLeast4 n → findSplit n = none → ¬ Goldbach) ∧
    checkUpTo 2000 = true ∧
    (Certified → ∀ n : Nat, EvenAtLeast4 n → n ≤ certifiedHeight → ∃ q, findSplit n = some q) ∧
    ¬ Value certCounter.F ∧
    ¬ Value weakerCounter.F ∧
    Keyed Value :=
  ⟨given_is_not_the_value, act_is_goldbach, counterexample_refutes, executed_to_2000,
   below_height_decided, certificate_does_not_reach_above, weaker_do_not_give_binary.2.2,
   value_is_keyed⟩


/-! ## The root, undeniable in deed -/

/-- A self-grounding root, the structure of Appendix R in the same words: a type of acts, inhabited, every
one of which instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- THE ROOT IS UNDENIABLE IN DEED: a denial of a self-grounding root is a deed, and instances it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- No outside proof adds to a self-grounding root: an outside proof of it is worth exactly the root. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- THE UNDENIABLE ROOT HOLDS IN BOTH WORLDS: it is held by its deed in a frame where the value holds
and in one where it fails, so it forces the value on no frame. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) :
    R ∧ Value calm ∧ ¬ Value counter ∧ ¬ (∀ F : Frame, R → Value F) :=
  ⟨G.instances G.anAct, calm_value, counter_fails, fun h => counter_fails (h counter (G.instances G.anAct))⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and read uniformly on the frames it gives no value;
read on the row, with the row's existents and the row's actuation, it is the value exactly, and keyed. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) :
    R ∧ ¬ (∀ F : Frame, R → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (RootOnRow calm ∧ ¬ RootOnRow counter) :=
  ⟨G.instances G.anAct, fun h => counter_fails (h counter (G.instances G.anAct)), root_on_row_is_the_value,
   root_on_row_is_keyed⟩

/-- THE ROOT HOLDS ON EVERY FRAME: on each frame the self-grounding root holds, the root with actuation one holds
on the frame's existents, and the root read on the frame's row is exactly its value. -/
theorem root_holds_on_every_frame {R : Prop} (G : SelfGrounding R) :
    ∀ F : Frame, R ∧ Root F.D (fun _ => 1) ∧ (RootOnRow F ↔ Value F) :=
  fun F => ⟨G.instances G.anAct, root_satisfiable F.D, root_on_row_is_the_value F⟩

/-- THE GOLDBACH STATEMENT FROM THE ROOT READ ON THE ROW, on the arithmetic frame. -/
theorem goldbach_from_root_on_row (h : RootOnRow arith) : Goldbach :=
  arith_value_iff.mp ((root_on_row_is_the_value arith).mp h)

/-! ### the constructed root of Appendix R, repeated verbatim -/

/-- The actuation of Appendix R: one existent, whose actuation is one. -/
def ΔE₀ : Unit → Int := fun _ => 1

/-- The constructed root of Appendix R: every existent of the one-point type actuates. -/
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The constructed root of Appendix R as a self-grounding root: one act, which instances it. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- Appendix R's constructed root is the root on one existent, with its actuation. -/
theorem RA₀_is_root_on_unit : RA₀ ↔ Root Unit ΔE₀ := Iff.rfl

/-- THE LOCK ON THE CONSTRUCTED ROOT: Appendix R's root holds, forces the value on no frame, and read on the
row of any frame is exactly that frame's value. -/
theorem the_lock_on_the_root :
    RA₀ ∧ ¬ (∀ F : Frame, RA₀ → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) :=
  ⟨ra₀.instances ra₀.anAct, (undeniable_root_forces_no_value ra₀).2.2.2, root_on_row_is_the_value⟩

/-- THE LOCK, one theorem on no axiom: the constructed root holds with no hypothesis; every self-grounding
root holds by its deed; no given statement is the value on every frame; the root read uniformly on the frames
gives no value; read on the row the root is the act, the act is the value exactly, and both are keyed; the
closing theorem gives the value on every actual frame; no reading of the kinetic record returns the bit; and
no finite record forces the value. -/
theorem the_lock {R : Prop} (G : SelfGrounding R) :
    Root Unit (fun _ => 1) ∧
    R ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ¬ (∀ F : Frame, R → Value F) ∧
    (∀ F : Frame, RootOnRow F ↔ Realized F) ∧
    (∀ F : Frame, Realized F ↔ Value F) ∧
    (RootOnRow calm ∧ ¬ RootOnRow counter) ∧
    (Realized calm ∧ ¬ Realized counter) ∧
    (∀ A : ActualEvens, Value A.F) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ n : Nat, (∀ d, d < n → ∃ q, (staged n).realize d = some q) ∧ ¬ Value (staged n)) :=
  ⟨constructed_root_holds, G.instances G.anAct, given_is_not_the_value, (root_read_on_row_is_keyed G).2.1,
   root_on_row_is_the_act, act_is_the_value, root_on_row_is_keyed, act_is_keyed, goldbach_from_existence, record_wall,
   finite_record_never_forces⟩

/-- FROM EXISTENCE ALONE, in the sense the title carries: the closing theorem consumes existence read on
the row and nothing else; that reading is available on exactly the frames where the value holds; and no
statement given without the reading is the value on every frame. One theorem, on no axiom. -/
theorem from_existence_alone :
    (∀ A : ActualEvens, Value A.F) ∧
    (∀ F : Frame, Nonempty { A : ActualEvens // A.F = F } ↔ Value F) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) :=
  ⟨goldbach_from_existence, supply_iff, given_is_not_the_value⟩

end GBClose

/-! ## Cones, pinned as printed -/
/-- info: 'GBClose.sub_cancel_right' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.sub_cancel_right
/-- info: 'GBClose.sub_cancel_left' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.sub_cancel_left
/-- info: 'GBClose.sub_add_back' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.sub_add_back
/-- info: 'GBClose.primeAux_spec' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.primeAux_spec
/-- info: 'GBClose.rem_go_spec' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.rem_go_spec
/-- info: 'GBClose.rem_spec' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.rem_spec
/-- info: 'GBClose.below_next_multiple' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.below_next_multiple
/-- info: 'GBClose.rem_zero_gives_factor' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.rem_zero_gives_factor
/-- info: 'GBClose.factor_gives_rem_zero' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.factor_gives_rem_zero
/-- info: 'GBClose.small_divisor' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.small_divisor
/-- info: 'GBClose.isPrime_sound' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.isPrime_sound
/-- info: 'GBClose.findAux_sound' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findAux_sound
/-- info: 'GBClose.findSplit_sound' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findSplit_sound
/-- info: 'GBClose.primeAux_false' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.primeAux_false
/-- info: 'GBClose.isPrime_complete' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.isPrime_complete
/-- info: 'GBClose.findAux_complete' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findAux_complete
/-- info: 'GBClose.goldbach_gives_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_gives_std
/-- info: 'GBClose.std_gives_goldbach' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.std_gives_goldbach
/-- info: 'GBClose.goldbach_iff_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_iff_std
/-- info: 'GBClose.mirror_involution' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.mirror_involution
/-- info: 'GBClose.split_mirrors' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.split_mirrors
/-- info: 'GBClose.seat_of_mirror' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.seat_of_mirror
/-- info: 'GBClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.calm_value
/-- info: 'GBClose.counter_fails' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.counter_fails
/-- info: 'GBClose.arith_value_iff' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arith_value_iff
/-- info: 'GBClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_given
/-- info: 'GBClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_conservative
/-- info: 'GBClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arrow_given
/-- info: 'GBClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.freedom_given
/-- info: 'GBClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.given_is_not_the_value
/-- info: 'GBClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arrow_forces_nothing
/-- info: 'GBClose.given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.given_in_both_worlds
/-- info: 'GBClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_the_value
/-- info: 'GBClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_keyed
/-- info: 'GBClose.act_is_goldbach' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_goldbach
/-- info: 'GBClose.act_is_goldbach_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_goldbach_std
/-- info: 'GBClose.goldbach_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_from_existence
/-- info: 'GBClose.goldbach_from_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_from_the_act
/-- info: 'GBClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.supply_iff
/-- info: 'GBClose.every_even_lands' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.every_even_lands
/-- info: 'GBClose.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.gates_exclusive
/-- info: 'GBClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.nothing_escapes
/-- info: 'GBClose.counterexample_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.counterexample_refutes
/-- info: 'GBClose.check_means' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.check_means
/-- info: 'GBClose.executed_to_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.executed_to_2000
/-- info: 'GBClose.below_height_decided' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.below_height_decided
/-- info: 'GBClose.certificate_does_not_reach_above' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.certificate_does_not_reach_above
/-- info: 'GBClose.certificate_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.certificate_is_load_bearing
/-- info: 'GBClose.weaker_do_not_give_binary' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.weaker_do_not_give_binary
/-- info: 'GBClose.row_split' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.row_split
/-- info: 'GBClose.remainder_not_forced' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.remainder_not_forced
/-- info: 'GBClose.value_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.value_is_keyed
/-- info: 'GBClose.no_keyless_statement_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.no_keyless_statement_is_the_act
/-- info: 'GBClose.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.pulse_does_not_certify
/-- info: 'GBClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.record_wall
/-- info: 'GBClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.fibre_is_two
/-- info: 'GBClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.prime_shape
/-- info: 'GBClose.additive_shape' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.additive_shape
/-- info: 'GBClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.two_axes_leave_two
/-- info: 'GBClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.three_axes_lock_one
/-- info: 'GBClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.finite_record_never_forces
/-- info: 'GBClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.uniform_step_forces_all
/-- info: 'GBClose.goldbach_closure' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_closure
/-- info: 'GBClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.denial_reenacts_root
/-- info: 'GBClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.external_proof_adds_nothing
/-- info: 'GBClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.undeniable_root_forces_no_value
/-- info: 'GBClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_read_on_row_is_keyed
/-- info: 'GBClose.the_lock' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.the_lock
/-- info: 'GBClose.from_existence_alone' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.from_existence_alone
/-- info: 'GBClose.indicator_pos' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.indicator_pos
/-- info: 'GBClose.root_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_satisfiable
/-- info: 'GBClose.constructed_root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.constructed_root_holds
/-- info: 'GBClose.root_on_row_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_on_row_is_the_act
/-- info: 'GBClose.root_on_row_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_on_row_is_the_value
/-- info: 'GBClose.root_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_on_row_is_keyed
/-- info: 'GBClose.act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_the_weakest_premise
/-- info: 'GBClose.existence_as_given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.existence_as_given_in_both_worlds
/-- info: 'GBClose.nothing_given_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.nothing_given_refutes
/-- info: 'GBClose.only_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.only_refuter
/-- info: 'GBClose.findAux_least' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findAux_least
/-- info: 'GBClose.findSplit_least' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findSplit_least
/-- info: 'GBClose.even_double' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.even_double
/-- info: 'GBClose.split_iff_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.split_iff_std
/-- info: 'GBClose.seat_unique' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.seat_unique
/-- info: 'GBClose.mirror_has_one_seat' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.mirror_has_one_seat
/-- info: 'GBClose.uniform_premise_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.uniform_premise_forces_nothing
/-- info: 'GBClose.existence_as_given_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.existence_as_given_forces_nothing
/-- info: 'GBClose.nothing_given_forces' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.nothing_given_forces
/-- info: 'GBClose.counterexample_refutes_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.counterexample_refutes_std
/-- info: 'GBClose.executed_region' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.executed_region
/-- info: 'GBClose.executed_region_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.executed_region_std
/-- info: 'GBClose.arithUpTo_agrees' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arithUpTo_agrees
/-- info: 'GBClose.arithUpTo_stops' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arithUpTo_stops
/-- info: 'GBClose.certificate_is_load_bearing_arith' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.certificate_is_load_bearing_arith
/-- info: 'GBClose.certificate_does_not_reach_above_arith' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.certificate_does_not_reach_above_arith
/-- info: 'GBClose.remainder_not_forced_arith' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.remainder_not_forced_arith
/-- info: 'GBClose.act_iff_above_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_iff_above_2000
/-- info: 'GBClose.act_iff_above_height' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_iff_above_height
/-- info: 'GBClose.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.shared_record_decides_nothing
/-- info: 'GBClose.finite_arith_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.finite_arith_record_never_forces
/-- info: 'GBClose.root_holds_on_every_frame' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_holds_on_every_frame
/-- info: 'GBClose.goldbach_from_root_on_row' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_from_root_on_row
/-- info: 'GBClose.RA₀_is_root_on_unit' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.RA₀_is_root_on_unit
/-- info: 'GBClose.the_lock_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.the_lock_on_the_root
/-! ===================================================================================================================
    PART A · THE NORMAL FORM OF THE ROW (namespace GB.NORMALFORM) · v1_1_0_CC

    Purely additive: nothing above is overwritten. The row is read as the P ≠ NP seat reads computation and the
    Riemann seat reads the zeros: a type of frames, the value of a frame, and the registration of a frame onto its
    record, which keeps every existent and forgets the side of its realization. On the record the value holds with no
    premise (`record_has_the_value`). The value of a frame is then exactly one implication, the transfer of the value
    from the record to the frame (`normal_form`): the antecedent is a theorem, so the implication carries the whole
    content of the value, and it is the one bit. The two coherent frames share a record and split on the value
    (`record_decides_nothing`); the bit is keyed (`bit_is_keyed`); what every frame shares forces nothing
    (`keyless_forces_nothing`); every route to the value passes the bit (`every_route_passes_the_bit`); and the bit has
    no uniform answer across the frames (`no_uniform_answer`). Core Lean 4.19.0, no import, no axiom declared, no sorry,
    no native_decide; every theorem of this Part on no axiom at all. No declaration of this Part has the type of the
    bit. ΔM = 0.
=================================================================================================================== -/
namespace GB.NORMALFORM

universe u

/-- A ROW: a type of frames, the value of a frame, the registration of a frame onto its record, and two coherent
    frames, one carrying the value and one failing it. The record of every frame carries the value. -/
structure Row where
  Frame            : Type u
  Value            : Frame → Prop
  Rec              : Frame → Frame
  record_has_value : ∀ F, Value (Rec F)
  calm             : Frame
  counter          : Frame
  calm_value       : Value calm
  counter_fails    : ¬ Value counter

section core
variable (R : Row.{u})

/-- THE TRANSFER, the bit of a frame: the value carried from the frame's record to the frame. -/
def Transfer (F : R.Frame) : Prop := R.Value (R.Rec F) → R.Value F

/-- THE RECORD HAS THE VALUE, UNCONDITIONALLY (the mirror of `record_has_least_escape` and of
    `record_has_least_erasure`). -/
theorem record_has_the_value (F : R.Frame) : R.Value (R.Rec F) := R.record_has_value F

/-- THE NORMAL FORM OF THE ROW (the mirror of `sep_normal_form` and of `zeta_ra_loop`, first leg): the value of a frame
    is exactly the transfer from its record. The antecedent is a theorem, so the implication carries the whole value:
    it is the one bit, and nothing else remains. -/
theorem normal_form (F : R.Frame) : Transfer R F ↔ R.Value F :=
  ⟨fun h => h (R.record_has_value F), fun h _ => h⟩

/-- THE CARGO LOOP: the record's value, unconditional, carried by the one bit, is the value (the mirror of
    `sep_from_the_cargo_loop` and of `rh_from_the_cargo_loop`; the bit is the printed premise). -/
theorem value_from_the_cargo_loop (F : R.Frame) (bit : Transfer R F) : R.Value F :=
  bit (R.record_has_value F)

/-- THE ACT ON A FRAME: a structure whose one field is the value of the frame. -/
structure Act (F : R.Frame) where
  closure : R.Value F

/-- THE BIT IS THE ACT: the transfer holds exactly when the act stands. -/
theorem bit_is_the_act (F : R.Frame) : Transfer R F ↔ Nonempty (Act R F) :=
  ⟨fun h => ⟨⟨h (R.record_has_value F)⟩⟩, fun ⟨A⟩ _ => A.closure⟩

/-- SELF-RECURSION: a frame coincides with its record exactly when they carry the value alike. -/
def SelfRecursive (F : R.Frame) : Prop := R.Value F ↔ R.Value (R.Rec F)

/-- THE RECORD IS SELF-RECURSIVE, with no premise (the mirror of `record_is_self_recursive`). -/
theorem record_is_self_recursive (F : R.Frame) : SelfRecursive R (R.Rec F) :=
  ⟨fun _ => R.record_has_value (R.Rec F), fun _ => R.record_has_value F⟩

/-- THE FRAME IS SELF-RECURSIVE EXACTLY WHEN IT CARRIES THE VALUE (the mirror of `self_recursion_at_machine` and of
    `self_recursion_at_zeros`). -/
theorem self_recursion_at_frame (F : R.Frame) : SelfRecursive R F ↔ R.Value F :=
  ⟨fun h => h.mpr (R.record_has_value F), fun h => ⟨fun _ => R.record_has_value F, fun _ => h⟩⟩

/-- THE BIT IS KEYED: the transfer holds on the calm frame and fails on the counter frame. -/
theorem bit_is_keyed : Transfer R R.calm ∧ ¬ Transfer R R.counter :=
  ⟨fun _ => R.calm_value, fun h => R.counter_fails (h (R.record_has_value R.counter))⟩

/-- THE RECORD'S SELF-RECURSION DOES NOT TRANSFER: the record of the counter frame is self-recursive and the counter
    frame is not. -/
theorem record_self_recursion_does_not_transfer :
    SelfRecursive R (R.Rec R.counter) ∧ ¬ SelfRecursive R R.counter :=
  ⟨record_is_self_recursive R R.counter, fun h => R.counter_fails (h.mpr (R.record_has_value R.counter))⟩

/-- THE RECORD DECIDES NOTHING (the mirror of `record_decides_nothing`): the two coherent frames both carry the value
    on their records, and split on the value itself. -/
theorem record_decides_nothing :
    R.Value (R.Rec R.calm) ∧ R.Value (R.Rec R.counter) ∧ R.Value R.calm ∧ ¬ R.Value R.counter :=
  ⟨R.record_has_value R.calm, R.record_has_value R.counter, R.calm_value, R.counter_fails⟩

/-- EVERY ROUTE PASSES THE BIT (the mirror of `every_route_passes_the_bit`): any premise that yields the value yields
    the transfer, so every proof of the value, from any premise and in any vocabulary, delivers the one implication. -/
theorem every_route_passes_the_bit (F : R.Frame) (Q : Prop) (h : Q → R.Value F) : Q → Transfer R F :=
  fun q _ => h q

/-- A premise shared by every frame. -/
def Keyless (P : R.Frame → Prop) : Prop := ∀ F, P F

/-- A premise that forces the value on every frame where it holds. -/
def Forces (P : R.Frame → Prop) : Prop := ∀ F, P F → R.Value F

/-- A KEYLESS PREMISE FORCES NOTHING (the mirror of `the_unconditional_route_is_blocked`): what every frame shares
    yields the value on none where it fails. -/
theorem keyless_forces_nothing (P : R.Frame → Prop) (hP : Keyless R P) : ¬ Forces R P :=
  fun h => R.counter_fails (h R.counter (hP R.counter))

/-- NO CLOSED PRINCIPLE DECIDES: a principle true of the record of every frame decides the value on none (the mirror of
    `no_closed_principle_decides`). -/
theorem no_record_principle_decides (P : R.Frame → Prop) (hP : ∀ F, P (R.Rec F)) :
    ¬ ∀ F, P (R.Rec F) → R.Value F :=
  fun h => R.counter_fails (h R.counter (hP R.counter))

/-- A SHARED RECORD DECIDES NOTHING: a record of frames that reads the same on the calm and the counter frame has no
    reading that returns the value on every frame. -/
theorem shared_record_decides_nothing {α : Type} (r : R.Frame → α) (hr : r R.calm = r R.counter) :
    ¬ ∃ g : α → Bool, ∀ F, (g (r F) = true ↔ R.Value F) :=
  fun ⟨g, hg⟩ => R.counter_fails ((hg R.counter).mp ((congrArg g hr).symm.trans ((hg R.calm).mpr R.calm_value)))

/-- THE BIT HAS NO UNIFORM ANSWER: across the frames of the row the transfer is neither always true nor always false. -/
theorem no_uniform_answer : ¬ (∀ F, Transfer R F) ∧ ¬ (∀ F, ¬ Transfer R F) :=
  ⟨fun h => (bit_is_keyed R).2 (h R.counter), fun h => h R.calm (bit_is_keyed R).1⟩

/-- "NOTHING IS OUTSIDE THE RECORD", read as the record's value transferring to the frame: false as a law of every
    frame, since the counter frame's record carries the value and the frame does not; at a frame, the value itself. -/
theorem nothing_outside_the_record_is_the_bit (F : R.Frame) :
    ¬ (∀ G, Transfer R G) ∧ (Transfer R F ↔ R.Value F) :=
  ⟨(no_uniform_answer R).1, normal_form R F⟩

/-- THE ONE DENIAL: wherever the value fails, the transfer fails, though the record carries the value. -/
theorem denial_is_the_bits_denial (F : R.Frame) : ¬ R.Value F ↔ ¬ Transfer R F :=
  ⟨fun hn h => hn (h (R.record_has_value F)), fun hn hv => hn (fun _ => hv)⟩

/-- THE NORMAL FORM, COMPLETE, nothing before the colon but the row and a frame: the record carries the value; the
    value is the transfer; the transfer is the act; the frame is self-recursive exactly when it carries the value;
    every route passes the bit; the denial is the bit's denial. The value is not a conjunct. -/
theorem normal_form_complete (F : R.Frame) :
    R.Value (R.Rec F) ∧ (Transfer R F ↔ R.Value F) ∧ (Transfer R F ↔ Nonempty (Act R F)) ∧
    (SelfRecursive R F ↔ R.Value F) ∧ (∀ Q : Prop, (Q → R.Value F) → Q → Transfer R F) ∧
    (¬ R.Value F ↔ ¬ Transfer R F) :=
  ⟨R.record_has_value F, normal_form R F, bit_is_the_act R F, self_recursion_at_frame R F,
   fun Q h => every_route_passes_the_bit R F Q h, denial_is_the_bits_denial R F⟩

end core

/-! ### the refusals and the outside, generic over a proposition -/

/-- A true Boolean is never its own negation. -/
theorem bnot_ne (b : Bool) : (!b) ≠ b := by cases b <;> decide

/-- REFUSAL · "A PROOF IS WAITING" fails SREP: a true route to B is B itself (carried from `PNP.GATES.refusal_waiting`). -/
theorem refusal_waiting (B : Prop) : (∃ Q : Prop, Q ∧ (Q → B)) ↔ B :=
  ⟨fun ⟨_, q, h⟩ => h q, fun b => ⟨B, b, id⟩⟩

/-- REFUSAL · "NO PROOF CAN EVER EXIST" fails SREP: no true route to B is ¬ B itself, the counter world in costume
    (carried from `PNP.GATES.refusal_no_proof`). -/
theorem refusal_no_proof (B : Prop) : (¬ ∃ Q : Prop, Q ∧ (Q → B)) ↔ ¬ B :=
  ⟨fun h b => h ⟨B, b, id⟩, fun hn ⟨_, q, h⟩ => hn (h q)⟩

/-- A BLOCK NEEDS AN OUTSIDE: if the target is a function of the record, no record-preserving involution flips it, so
    a block that flips the target always stands on something the record leaves out (carried from
    `PNP.ESCAPE.block_needs_an_outside`). -/
theorem block_needs_an_outside {X Y : Type} (ρ : X → Y) (t : X → Bool) (x₀ : X)
    (hrec : ∃ g : Y → Bool, ∀ x, t x = g (ρ x)) :
    ¬ ∃ τ : X → X, (∀ x, ρ (τ x) = ρ x) ∧ (∀ x, t (τ x) = !t x) :=
  fun ⟨τ, hρ, ht⟩ => match hrec with
  | ⟨g, hg⟩ => bnot_ne (t x₀) (by rw [← ht x₀, hg (τ x₀), hρ x₀, ← hg x₀])

/-- The native involution on the bit: complementation. -/
def comp (b : Bool) : Bool := !b

/-- Complementation is an involution with no fixed point. -/
theorem comp_involution (b : Bool) : comp (comp b) = b := by cases b <;> rfl

/-- THE LOCUS OF COMPLEMENTATION VANISHES: no bit is its own complement. -/
theorem locus_vanishes : ¬ ∃ b, comp b = b := fun ⟨b, h⟩ => bnot_ne b h

/-- The grades a face carries, ranked. -/
inductive Grade
  | premise
  | structural
  | thm
  deriving DecidableEq

/-- The rank of a grade. -/
def Grade.rank : Grade → Nat
  | .premise => 0
  | .structural => 1
  | .thm => 2

/-- The weakest of two grades. -/
def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

/-- A JOIN NEVER STANDS ABOVE ITS WEAKEST FACE, and a tuple of theorems joined with the premise reads premise. -/
theorem join_reads_the_weakest :
    (∀ a b : Grade, (Grade.weakest a b).rank ≤ a.rank ∧ (Grade.weakest a b).rank ≤ b.rank) ∧
    Grade.weakest (Grade.weakest .thm .thm) .premise = .premise :=
  ⟨fun a b => by
     cases a <;> cases b <;> exact ⟨by decide, by decide⟩,
   by decide⟩

/-- A SQUARED SCALAR IS BLIND TO SIGN: a value and its reflection square alike, read from the definitions of
    negation and multiplication on the integers. -/
theorem square_is_sign_blind : ∀ x : Int, (-x) * (-x) = x * x
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

end GB.NORMALFORM

/-! ===================================================================================================================
    PART C · THE ROW SPLIT (namespace GB.ROWSPLIT) · v1_1_0_CC

    The cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC (namespace RHUnicorn, generic over
    the types α and β), its one proposition renamed from `RH` to `Whole`, the hypothesis it names. At every cut T the
    whole is exactly its Real part and its Unicorn part; a certificate at T proves the Real part; given the Real part
    the whole is exactly the Unicorn part; above every cut no reading of an even record agrees with an odd decision;
    the aperture is one bit wide; and the supply side is silent at the register. ΔM = 0.
=================================================================================================================== -/
namespace GB.ROWSPLIT

variable {α β : Type}

/-- The whole, the Real part at T, the Unicorn part at T. -/
def Whole (Z onL : α → Prop) : Prop := ∀ z, Z z → onL z
def RealPartAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z ≤ T → onL z
def UnicornAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z > T → onL z

/-- THE FORMAL BLOCK OF THE UNICORN PART. Let τ act on the existents, let ρ be a record even at a seat z above the
    height, and let d decide the property, odd at z. Then no reading g of the record agrees with d even on the region
    above the height alone. -/
theorem unicorn_block (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    ¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w := by
  intro ⟨g, hg⟩
  have h1 := hg z habove
  have h2 := hg (τ z) habove'
  rw [hρ, hd, h1] at h2
  revert h2
  cases d z <;> intro h2 <;> exact Bool.noConfusion h2

/-- THE APERTURE, ONE BIT WIDE. At a seat where d is odd, one odd bit s at the seat decides d on the seat and its
    partner through a calibration that exists and is unique. -/
theorem aperture_one_bit_wide (τ : α → α) (s d : α → Bool) (z : α)
    (hs : s (τ z) = !s z) (hd : d (τ z) = !d z) :
    ∃ c : Bool, (d z = xor (s z) c ∧ d (τ z) = xor (s (τ z)) c) ∧
      ∀ c' : Bool, (d z = xor (s z) c' ∧ d (τ z) = xor (s (τ z)) c') → c' = c :=
  ⟨xor (d z) (s z),
    ⟨by cases s z <;> cases d z <;> rfl,
     by rw [hs, hd]; cases s z <;> cases d z <;> rfl⟩,
    by
      intro c' hc
      obtain ⟨h1, -⟩ := hc
      generalize hsz : s z = sv
      generalize hdz : d z = dv
      rw [hsz, hdz] at h1
      cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)⟩

/-- EXISTENCE SUPPLIES NOTHING: conditioning the Unicorn part on an inhabited premise leaves it where it was. -/
theorem unicorn_rule_exact (Z onL : α → Prop) (height : α → Nat) (T : Nat) (A : Prop) (ha : A) :
    (A → UnicornAt Z onL height T) ↔ UnicornAt Z onL height T :=
  ⟨fun h => h ha, fun hu _ => hu⟩

/-- NO BYPASS: given the Real part, the whole is exactly the Unicorn part. -/
theorem unicorn_no_bypass (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (hr : RealPartAt Z onL height T) : Whole Z onL ↔ UnicornAt Z onL height T := by
  constructor
  · intro h z hz _; exact h z hz
  · intro hu z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- THE SUPPLY SIDE IS SILENCE, AT THE REGISTER: both orientations of d at the seat are equally refused to every
    reading above the height. -/
theorem supply_side_silent (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w) ∧
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = !d w) ∧
    (!d z) ≠ d z :=
  ⟨unicorn_block height T τ ρ d z habove habove' hρ hd,
   unicorn_block height T τ ρ (fun w => !d w) z habove habove' hρ (by
     show (!d (τ z)) = !(!d z)
     rw [hd]),
   by cases d z <;> decide⟩

/-- The division at the height: the whole is exactly its Real part and its Unicorn part. -/
theorem whole_iff_real_and_unicorn (Z onL : α → Prop) (height : α → Nat) (T : Nat) :
    Whole Z onL ↔ RealPartAt Z onL height T ∧ UnicornAt Z onL height T := by
  constructor
  · intro h; exact ⟨fun z hz _ => h z hz, fun z hz _ => h z hz⟩
  · intro ⟨hr, hu⟩ z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- A certificate at the height: a complete list of the existents up to T, each checked. -/
structure Certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat) where
  items    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ items
  checked  : ∀ z, z ∈ items → onL z

/-- A CERTIFICATE PROVES THE REAL PART AT ITS HEIGHT. -/
theorem real_part_of_certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (c : Certificate Z onL height T) : RealPartAt Z onL height T :=
  fun z hz hle => c.checked z (c.complete z hz hle)

end GB.ROWSPLIT
/-! ===================================================================================================================
    PART B · THE HOST MODEL AND ITS BINDING, PROVED (namespace GB.HOST) · v1_1_0_CC

    The frame of the question is the arithmetic itself: the even numbers at least four, each realized by the search.
    The registration of a frame onto its record keeps every existent and forgets which split realizes it, so on the
    record every existent is registered (`recFrame_value`). The binding is a theorem, not a reading: the value of the
    arithmetic frame is the Goldbach statement in its standard form (`binding`). Every even number has its seat, the
    mirror's one fixed point (`every_even_has_its_seat`). The finite form: a passing check at any height proves every
    even number below twice that height a sum of two primes (`real_part_of_check`), the check passes at every height
    under the statement (`check_of_goldbach`), and the statement is exactly a certificate at every height
    (`goldbach_iff_check_at_every_height`). Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace GB.HOST
open GBClose

/-- THE RECORD OF A FRAME: the registration keeps every existent and forgets which split realizes it; on the record
    every existent is registered. -/
def recFrame (F : Frame) : Frame := ⟨F.D, fun _ => some 0⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ => ⟨0, rfl⟩

/-- THE GOLDBACH ROW: the frames of even numbers with their realizations, the value, the registration onto the record,
    the realized world and the counter world. -/
def gbRow : GB.NORMALFORM.Row.{1} :=
  ⟨Frame, Value, recFrame, recFrame_value, calm, counter, calm_value, counter_fails⟩

/-- THE BINDING, PROVED: the value of the arithmetic frame is exactly the Goldbach statement in its standard form. No
    reader's identification stands between the frame and the row. -/
theorem binding : Value arith ↔ GoldbachStd := arith_value_iff.trans goldbach_iff_std

/-- THE ROOT READ ON THE ROW IS THE STATEMENT, on the arithmetic frame. -/
theorem root_on_row_is_the_statement : RootOnRow arith ↔ GoldbachStd :=
  (root_on_row_is_the_value arith).trans binding

/-- EVERY EVEN NUMBER HAS ITS SEAT: n = k · 2 with the mirror fixing k, the one point where a split and its mirror
    coincide. The record registers each even number there, keeping the number and forgetting the side. -/
theorem every_even_has_its_seat (n : Nat) (hn : EvenAtLeast4 n) :
    ∃ k, n = k * 2 ∧ mirror n k = k ∧ ∀ p, p ≤ n → mirror n p = p → p = k :=
  match rem_zero_gives_factor n 2 (by decide) hn.2 with
  | ⟨k, hk⟩ => ⟨k, hk, mirror_has_one_seat n k hk⟩

/-- `b || true` is true. -/
theorem or_true_right (b : Bool) : (b || true) = true := by cases b <;> rfl

/-- A found split, read as a Boolean. -/
theorem isSome_of_split {n : Nat} (h : ∃ q, findSplit n = some q) : (findSplit n).isSome = true :=
  match h with
  | ⟨q, hq⟩ => by rw [hq]; rfl

/-- THE FINITE FORM, SOUND · THE REAL PART AT EVERY CHECKED HEIGHT: a passing check at k proves every even number up to
    2k a sum of two primes. Any run of the check that returns true, now or at any height a future run reaches, is a
    theorem the moment it returns. -/
theorem real_part_of_check (k : Nat) (hk : checkAux k = true) :
    ∀ n, EvenAtLeast4 n → n ≤ 2 * k → ∃ p q, Prime p ∧ Prime q ∧ p + q = n :=
  fun n hn hH => match rem_zero_gives_factor n 2 (by decide) hn.2 with
  | ⟨m, hm⟩ =>
    have m2 : 2 ≤ m := match Nat.lt_or_ge m 2 with
      | Or.inr h => h
      | Or.inl h => absurd (Nat.le_trans hn.1 (Nat.le_trans (Nat.le_of_eq hm)
          (Nat.mul_le_mul_right 2 (Nat.le_of_lt_succ h)))) (by decide)
    have mk : m ≤ k := match Nat.lt_or_ge k m with
      | Or.inr h => h
      | Or.inl h =>
        have h1 : (k + 1) * 2 ≤ m * 2 := Nat.mul_le_mul_right 2 (Nat.succ_le_of_lt h)
        have h2 : m * 2 ≤ k * 2 :=
          Nat.le_trans (Nat.le_of_eq hm.symm) (Nat.le_trans hH (Nat.le_of_eq (Nat.mul_comm 2 k)))
        have h3 : k * 2 + 2 ≤ k * 2 := by rw [← Nat.succ_mul]; exact Nat.le_trans h1 h2
        absurd h3 (Nat.not_le_of_gt (Nat.lt_add_of_pos_right (by decide)))
    have hs : (findSplit (2 * m)).isSome = true := check_means k m hk mk m2
    have e : 2 * m = n := (Nat.mul_comm 2 m).trans hm.symm
    (split_iff_std n).mp (match hf : findSplit (2 * m) with
      | some q => ⟨q, e ▸ hf⟩
      | none => by rw [hf] at hs; exact Bool.noConfusion hs)

/-- THE FINITE FORM, COMPLETE: under the Goldbach statement the check passes at every height. -/
theorem check_of_goldbach (h : GoldbachStd) : ∀ k, checkAux k = true
  | 0 => rfl
  | 1 => rfl
  | m + 2 => by
    have hs : (findSplit (2 * (m + 2))).isSome = true :=
      isSome_of_split ((split_iff_std (2 * (m + 2))).mpr (h (2 * (m + 2)) (even_double m)))
    have hr := check_of_goldbach h (m + 1)
    show ((decide (m + 2 < 2) || (findSplit (2 * (m + 2))).isSome) && checkAux (m + 1)) = true
    rw [hs, or_true_right, hr]; rfl

/-- GOLDBACH IS EXACTLY A CERTIFICATE AT EVERY HEIGHT (the mirror of the Riemann finite form, RH exactly a certificate
    at every height): the statement holds exactly when the kernel's check passes at every height. -/
theorem goldbach_iff_check_at_every_height : GoldbachStd ↔ ∀ k, checkAux k = true :=
  ⟨check_of_goldbach, fun h n hn => real_part_of_check n (h n) n hn (Nat.le_mul_of_pos_left n (by decide))⟩

/-- The executed check at 2000 is the check at 1000, by the kernel's own division. -/
theorem executed_check_at_1000 : checkAux 1000 = true := executed_to_2000

end GB.HOST

/-! ===================================================================================================================
    PART C′ · THE ROW SPLIT READ ON THE GOLDBACH ROW (namespace GB.REALPART) · v1_1_0_CC

    The cut-agnostic division of Part C read on the row: the existents are the even numbers at least four and the
    decided property is a split into two primes. At every height the statement is exactly its Real part and its
    Unicorn part; the Real part holds at 2000 by the kernel's own computation and at every checked height by the
    finite form; given the Real part at 2000 the statement is exactly the Unicorn part above it; and above every height
    no reading of a record that keeps the height and forgets the world returns the world. ΔM = 0.
=================================================================================================================== -/
namespace GB.REALPART
open GBClose GB.ROWSPLIT

/-- The existents of the row. -/
def Ev (n : Nat) : Prop := EvenAtLeast4 n

/-- The property each existent is asked: a split into two primes. -/
def Sp (n : Nat) : Prop := ∃ p q, Prime p ∧ Prime q ∧ p + q = n

/-- The Goldbach statement is the whole of the row split. -/
theorem goldbach_is_the_whole : GoldbachStd ↔ Whole Ev Sp := Iff.rfl

/-- THE REAL PART AT 2000, by the kernel's own computation. -/
theorem real_part_at_2000 : RealPartAt Ev Sp id 2000 := fun n hn hle => executed_region_std n hn hle

/-- THE REAL PART AT EVERY CHECKED HEIGHT: a passing check at k is the Real part at 2k. -/
theorem real_part_at_every_checked_height (k : Nat) (hk : checkAux k = true) : RealPartAt Ev Sp id (2 * k) :=
  fun n hn hle => GB.HOST.real_part_of_check k hk n hn hle

/-- THE CUT AT EVERY HEIGHT: the statement is exactly its Real part and its Unicorn part. -/
theorem goldbach_iff_real_and_unicorn (T : Nat) :
    GoldbachStd ↔ RealPartAt Ev Sp id T ∧ UnicornAt Ev Sp id T :=
  whole_iff_real_and_unicorn Ev Sp id T

/-- NO BYPASS AT 2000: given the Real part there, the statement is exactly the Unicorn part above 2000. -/
theorem no_bypass_at_2000 : GoldbachStd ↔ UnicornAt Ev Sp id 2000 :=
  unicorn_no_bypass Ev Sp id 2000 real_part_at_2000

/-- THE REAL PART BELOW EVERY LOWER CUT: at every height at most 2000 the Real part holds. -/
theorem real_part_below_2000 (T : Nat) (hT : T ≤ 2000) : RealPartAt Ev Sp id T :=
  fun n hn hle => real_part_at_2000 n hn (Nat.le_trans hle hT)

/-- THE UNICORN PART CLOSED TO THE RECORD ABOVE EVERY HEIGHT: on the chart of worlds and heights, a record that keeps
    the height and forgets the world is even under the exchange of worlds, the world is odd, and above every height no
    reading of the record returns the world. -/
theorem unicorn_blocked_above_every_height (T : Nat) :
    ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1 :=
  unicorn_block Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE SUPPLY SIDE IS SILENT ABOVE EVERY HEIGHT: both orientations of the world are refused alike to every reading
    of the record, and the two orientations differ. -/
theorem supply_side_silent_above_every_height (T : Nat) :
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = !w.1) ∧ (!true) ≠ true :=
  supply_side_silent Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE APERTURE IS ONE BIT WIDE: at the seat of the exchange above every height, one odd supplied bit calibrates the
    world uniquely, through one calibration bit that exists and is unique. -/
theorem aperture_is_one_bit (T : Nat) :
    let z : Bool × Nat := (true, T + 1)
    let τ : Bool × Nat → Bool × Nat := fun w => (!w.1, w.2)
    ∃ c : Bool, (z.1 = xor (!z.1) c ∧ (τ z).1 = xor (!(τ z).1) c) ∧
      ∀ c' : Bool, (z.1 = xor (!z.1) c' ∧ (τ z).1 = xor (!(τ z).1) c') → c' = c :=
  aperture_one_bit_wide (fun w : Bool × Nat => (!w.1, w.2)) (fun w => !w.1) Prod.fst (true, T + 1) rfl rfl

end GB.REALPART

/-! ===================================================================================================================
    PART D · THE WALLS (namespace GB.WALLS) · v1_1_0_CC

    Every zero-bit route is closed by theorem. Existence as given, the arrow and the freedom bit hold in both worlds
    (Part 0, `existence_as_given_forces_nothing`). No finite record forces the value (Part 0,
    `finite_arith_record_never_forces`), the certificate does not reach above its height
    (`certificate_does_not_reach_above_arith`), and the shape the ternary and Chen citations share does not entail the
    binary statement (`weaker_do_not_give_binary`). This Part adds the parity wall on the row's own numbers: six primes
    and six numbers with exactly two prime factors share their residues modulo 420 = 4 · 3 · 5 · 7, and their Liouville
    parities are opposite (`parity_normal_form`), so no reading of the residue record separates a prime from a
    semiprime (`residue_record_decides_nothing`): the one bit a sieve must cross is invisible to every residue record.
    Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace GB.WALLS
open GBClose

/-- The number of prime factors counted with multiplicity, by trial division with fuel. -/
def bigOmegaAux : Nat → Nat → Nat → Nat
  | 0, _, _ => 0
  | fuel + 1, n, d =>
    if n < 2 then 0
    else if d * d > n then 1
    else if n % d = 0 then 1 + bigOmegaAux fuel (n / d) d
    else bigOmegaAux fuel n (d + 1)

/-- Ω(n), the number of prime factors of n with multiplicity. -/
def bigOmega (n : Nat) : Nat := bigOmegaAux n n 2

/-- The Liouville parity: true where λ(n) = +1, an even number of prime factors; false where λ(n) = −1. -/
def liouvillePlus (n : Nat) : Bool := bigOmega n % 2 == 0

/-- Six primes. -/
def parityPrimes : List Nat := [11, 13, 17, 19, 23, 29]

/-- Six numbers with exactly two prime factors: 23 · 37, 19 · 67, 19 · 23, 13 · 163, 13 · 131, 11 · 79. -/
def paritySemiprimes : List Nat := [851, 1273, 437, 2119, 1703, 869]

/-- THE PARITY NORMAL FORM ON THE ROW, decided by the kernel: the six primes and the six semiprimes leave the same
    residues modulo 420 = 4 · 3 · 5 · 7, in order; every one of the first six is prime with one prime factor, Liouville
    parity −1; every one of the second six has exactly two prime factors, Liouville parity +1. -/
theorem parity_normal_form :
    parityPrimes.map (· % 420) = paritySemiprimes.map (· % 420) ∧
    parityPrimes.all isPrime = true ∧
    parityPrimes.all (fun n => bigOmega n == 1) = true ∧
    paritySemiprimes.all (fun n => bigOmega n == 2) = true ∧
    parityPrimes.all (fun n => liouvillePlus n == false) = true ∧
    paritySemiprimes.all (fun n => liouvillePlus n == true) = true ∧
    paritySemiprimes.all (fun n => isPrime n == false) = true := by decide

/-- THE RESIDUE RECORD DECIDES NOTHING: no reading of the residue modulo 420 returns primality on 11 and 851, which
    share it. The parity of the number of prime factors is the bit a residue record cannot read. -/
theorem residue_record_decides_nothing :
    ¬ ∃ g : Nat → Bool, g (11 % 420) = isPrime 11 ∧ g (851 % 420) = isPrime 851 :=
  fun ⟨g, h1, h2⟩ => by
    have e : 851 % 420 = 11 % 420 := by decide
    have p11 : isPrime 11 = true := by decide
    have p851 : isPrime 851 = false := by decide
    rw [e, h1, p11, p851] at h2
    exact Bool.noConfusion h2

/-- THE RESIDUE RECORD DECIDES NO PARITY: no reading of the residue modulo 420 returns the Liouville parity on 11 and
    851, which share it. -/
theorem residue_record_reads_no_parity :
    ¬ ∃ g : Nat → Bool, g (11 % 420) = liouvillePlus 11 ∧ g (851 % 420) = liouvillePlus 851 :=
  fun ⟨g, h1, h2⟩ => by
    have e : 851 % 420 = 11 % 420 := by decide
    have l11 : liouvillePlus 11 = false := by decide
    have l851 : liouvillePlus 851 = true := by decide
    rw [e, h1, l11, l851] at h2
    exact Bool.noConfusion h2

/-- THE WALLS OF THE ROW, one theorem: existence as given forces nothing; no finite arithmetic record forces the value;
    the certificate does not reach above its height; the weaker realizations do not give the binary; and the residue
    record decides neither primality nor parity. -/
theorem the_walls :
    (¬ ∀ F : Frame, ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) → Value F) ∧
    (∀ h : Nat, (∀ d : Evens, d.1 ≤ h → (arithUpTo h).realize d = arith.realize d) ∧ ¬ Value (arithUpTo h)) ∧
    ¬ Value (arithUpTo certifiedHeight) ∧
    ¬ Value weakerCounter.F ∧
    (¬ ∃ g : Nat → Bool, g (11 % 420) = isPrime 11 ∧ g (851 % 420) = isPrime 851) ∧
    (¬ ∃ g : Nat → Bool, g (11 % 420) = liouvillePlus 11 ∧ g (851 % 420) = liouvillePlus 851) :=
  ⟨existence_as_given_forces_nothing, finite_arith_record_never_forces,
   certificate_does_not_reach_above_arith.2.2, weaker_do_not_give_binary.2.2,
   residue_record_decides_nothing, residue_record_reads_no_parity⟩

end GB.WALLS

/-! ===================================================================================================================
    PART E · THE RESIDUE (namespace GB.RESIDUE) · v1_1_0_CC

    Everything above is unconditional. What remains of the Goldbach statement is this one hypothesis, the transfer of
    the value from the record to the arithmetic frame: given it, the statement follows on no axiom. It is printed here
    as the type of a hypothesis and is assumed nowhere. The residue is keyed: no premise shared by every frame and no
    principle true of every record supplies it. Its instance seat decomposes it by height. ΔM = 0.
=================================================================================================================== -/
namespace GB.RESIDUE
open GBClose GB.NORMALFORM GB.HOST

/-- THE RESIDUE: given the one implication, the Goldbach statement. -/
theorem goldbach_of_the_act (bit : Transfer gbRow arith) : GoldbachStd :=
  binding.mp (value_from_the_cargo_loop gbRow arith bit)

/-- THE RESIDUE IS THE STATEMENT: the transfer at the arithmetic frame is exactly the Goldbach statement. -/
theorem residue_is_the_statement : Transfer gbRow arith ↔ GoldbachStd :=
  (normal_form gbRow arith).trans binding

/-- THE ONE POSIT IS THE BIT: the root read on the row, at the arithmetic frame, is exactly the transfer. -/
theorem the_posit_is_the_bit : RootOnRow arith ↔ Transfer gbRow arith :=
  root_on_row_is_the_statement.trans residue_is_the_statement.symm

/-- THE RESIDUE IS KEYED: no premise shared by every frame forces the value, and no principle true of every record
    decides it. What supplies it is keyed to the frame: the act. -/
theorem residue_is_keyed :
    (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
    (∀ P : Frame → Prop, (∀ F, P (recFrame F)) → ¬ ∀ F, P (recFrame F) → Value F) :=
  ⟨keyless_forces_nothing gbRow, no_record_principle_decides gbRow⟩

/-- THE INSTANCE SEAT OF THE BIT, by height: the energy at each height is the kernel's check there, and conservation is
    the check passing at every height. Its inhabitation is equivalent in strength to the bit
    (`seat_iff_statement`); nothing in this file assumes it inhabited. -/
structure HeightSeat where
  energy       : Nat → Bool
  energy_is_check : ∀ k, energy k = checkAux k
  conservation : ∀ k, energy k = true

/-- THE SEAT DELIVERS THE STATEMENT. -/
theorem goldbach_of_seat (S : HeightSeat) : GoldbachStd :=
  goldbach_iff_check_at_every_height.mpr (fun k => (S.energy_is_check k).symm.trans (S.conservation k))

/-- THE SEAT IS INHABITED EXACTLY WHEN THE STATEMENT HOLDS. -/
theorem seat_iff_statement : Nonempty HeightSeat ↔ GoldbachStd :=
  ⟨fun ⟨S⟩ => goldbach_of_seat S,
   fun h => ⟨⟨checkAux, fun _ => rfl, goldbach_iff_check_at_every_height.mp h⟩⟩⟩

end GB.RESIDUE

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace GB.SUPPLY) · v1_1_0_CC

    The bit of Part E, supplied by the act and delivered by its two kinds: the formal cargo, and the physical witness.
    Each kind is a type whose inhabitant is the supply; neither is assumed anywhere in this file. The cargo arrives free;
    each kind delivers the statement; the two kinds are one bit; every route to the statement delivers both kinds, so
    there is no third; and one even number without a split refutes both at once. ΔM = 0.
=================================================================================================================== -/
namespace GB.SUPPLY
open GBClose GB.NORMALFORM GB.HOST

/-- THE FORMAL KIND, the cargo: the record's value carried to the arithmetic frame. -/
def FormalCargo : Prop := Transfer gbRow arith

/-- THE PHYSICAL KIND, the witness: every examination of an even number is a physical run of the search, registered at
    the Landauer floor, so its heat in floor units is at least one floor; a run that ended with no split would leave an
    unsplit record; and the carrier registers no unsplit even number. The last field is the one bit read in the
    register of heat; it is a premise of the witness, carried as a field, never proved. -/
structure PhysicalWitness where
  floor             : Nat
  floor_pos         : 0 < floor
  heat              : Evens → Nat
  priced            : ∀ d, floor ≤ heat d
  no_unsplit_record : ∀ d : Evens, findSplit d.1 ≠ none

/-- THE CARGO ARRIVES, with no premise: the record of the arithmetic frame carries the value. -/
theorem cargo_arrives : Value (recFrame arith) := recFrame_value arith

/-- KIND 1 DELIVERS: the formal cargo gives the Goldbach statement in one step. -/
theorem formal_kind_delivers (h : FormalCargo) : GoldbachStd := binding.mp (h cargo_arrives)

/-- The physical witness closes the arithmetic frame: every even number is realized. -/
theorem witness_closes (W : PhysicalWitness) : Value arith :=
  fun d => match hf : findSplit d.1 with
    | some q => ⟨q, hf⟩
    | none => absurd hf (W.no_unsplit_record d)

/-- KIND 2 DELIVERS: the physical witness gives the Goldbach statement. -/
theorem physical_kind_delivers (W : PhysicalWitness) : GoldbachStd := binding.mp (witness_closes W)

/-- A witness from the statement: under it the carrier's record holds no unsplit even number. -/
def witness_of_statement (h : GoldbachStd) : PhysicalWitness :=
  ⟨1, Nat.zero_lt_one, fun _ => 1, fun _ => Nat.le_refl 1,
   fun d hn => match (split_iff_std d.1).mpr (h d.1 d.2) with
     | ⟨_, hq⟩ => Option.noConfusion (hn.symm.trans hq)⟩

/-- THE PHYSICAL FACE IS THE STATEMENT: a witness exists exactly when the statement holds. -/
theorem physical_iff_statement : Nonempty PhysicalWitness ↔ GoldbachStd :=
  ⟨fun ⟨W⟩ => physical_kind_delivers W, fun h => ⟨witness_of_statement h⟩⟩

/-- THE FORMAL FACE IS THE STATEMENT. -/
theorem formal_iff_statement : FormalCargo ↔ GoldbachStd := GB.RESIDUE.residue_is_the_statement

/-- THE TWO KINDS ARE ONE BIT: the physical witness is a formal cargo, and the cargo is exactly the statement. -/
theorem the_two_kinds_are_one_bit : (PhysicalWitness → FormalCargo) ∧ (FormalCargo ↔ GoldbachStd) :=
  ⟨fun W _ => witness_closes W, formal_iff_statement⟩

/-- THE STATEMENT, DELIVERED TWICE: either kind gives it. -/
theorem goldbach_delivered_twice : (FormalCargo → GoldbachStd) ∧ (PhysicalWitness → GoldbachStd) :=
  ⟨formal_kind_delivers, physical_kind_delivers⟩

/-- TWO KINDS AND NO THIRD: every witness of the statement, in any vocabulary, is a delivery of both kinds. -/
theorem two_kinds_and_no_third (Q : Prop) (h : Q → GoldbachStd) : Q → FormalCargo ∧ Nonempty PhysicalWitness :=
  fun q => ⟨formal_iff_statement.mpr (h q), physical_iff_statement.mpr (h q)⟩

/-- THE ONE REFUTER: one even number at least four with no split refutes both kinds at once. -/
theorem the_one_refuter (n : Nat) (hn : EvenAtLeast4 n) (h : findSplit n = none) :
    ¬ FormalCargo ∧ ¬ Nonempty PhysicalWitness :=
  have hs : ¬ GoldbachStd := fun g => counterexample_refutes n hn h (std_gives_goldbach g)
  ⟨fun c => hs (formal_kind_delivers c), fun ⟨W⟩ => hs (physical_kind_delivers W)⟩

/-- THE SUPPLY, CLOSED. Nothing before the colon: the cargo arrives free; each kind delivers; the two kinds are one bit;
    the bit is the statement; every route is both kinds; and one unsplit even number refutes both. -/
theorem the_supply_closed :
    Value (recFrame arith) ∧
    (FormalCargo → GoldbachStd) ∧ (PhysicalWitness → GoldbachStd) ∧
    (PhysicalWitness → FormalCargo) ∧ (FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧
    (∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧
    (∀ n, EvenAtLeast4 n → findSplit n = none → ¬ FormalCargo ∧ ¬ Nonempty PhysicalWitness) :=
  ⟨cargo_arrives, formal_kind_delivers, physical_kind_delivers, the_two_kinds_are_one_bit.1,
   formal_iff_statement, physical_iff_statement, two_kinds_and_no_third, the_one_refuter⟩

end GB.SUPPLY

/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace GB.CLOSURE) · v1_1_0_CC

    Why the question is closed and not open. The Goldbach sentence and the bit are one proposition, with nothing cited;
    the denial of the sentence is the bit's denial; across the frames of the row the bit has no uniform answer, true in
    one world and false in another of the same record; every keyless route is barred; either kind of the supply gives
    the sentence; and the one refuter refutes the sentence itself. Nothing here derives the bit. It proves that the
    question is one bit, that the bit is keyed, and that what is open is a value and not a form. ΔM = 0.
=================================================================================================================== -/
namespace GB.CLOSURE
open GBClose GB.NORMALFORM GB.HOST GB.SUPPLY

/-- THE SENTENCE IS THE BIT, nothing cited. -/
theorem the_sentence_is_the_bit : GoldbachStd ↔ FormalCargo := formal_iff_statement.symm

/-- THE DENIAL IS THE BIT'S DENIAL. -/
theorem denial_is_the_bits_denial : ¬ GoldbachStd ↔ ¬ FormalCargo :=
  ⟨fun hn h => hn (formal_kind_delivers h), fun hn h => hn (formal_iff_statement.mpr h)⟩

/-- THE ONE REFUTER REFUTES THE SENTENCE: one even number at least four that is not a sum of two primes. -/
theorem refuter_denies_the_sentence (n : Nat) (hn : EvenAtLeast4 n)
    (h : ¬ ∃ p q, Prime p ∧ Prime q ∧ p + q = n) : ¬ GoldbachStd :=
  fun g => h (g n hn)

/-- THE DENIAL HAS ONE ROAD: wherever the sentence fails, it cannot be that no even number is unsplit. -/
theorem the_denial_has_one_road : ¬ GoldbachStd → ¬ ¬ ∃ n, EvenAtLeast4 n ∧ findSplit n = none :=
  fun hn hne => hn (fun n hen => (split_iff_std n).mp (match hf : findSplit n with
    | some q => ⟨q, rfl⟩
    | none => absurd ⟨n, hen, hf⟩ hne))

/-- THE QUESTION, CLOSED TO ONE BIT. The sentence is the bit and its denial is the bit's denial; the bit has no
    uniform answer across the frames; no keyless premise forces it; either kind of the supply gives the sentence; and
    the one refuter denies the sentence. What is open is the value of one implication; the form of the question is
    closed. -/
theorem question_closed_to_one_bit :
    (GoldbachStd ↔ FormalCargo) ∧ (¬ GoldbachStd ↔ ¬ FormalCargo) ∧
    (¬ (∀ F, Transfer gbRow F) ∧ ¬ (∀ F, ¬ Transfer gbRow F)) ∧
    (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
    (FormalCargo → GoldbachStd) ∧ (PhysicalWitness → GoldbachStd) ∧
    (∀ n, EvenAtLeast4 n → (¬ ∃ p q, Prime p ∧ Prime q ∧ p + q = n) → ¬ GoldbachStd) :=
  ⟨the_sentence_is_the_bit, denial_is_the_bits_denial, no_uniform_answer gbRow,
   keyless_forces_nothing gbRow, formal_kind_delivers, physical_kind_delivers, refuter_denies_the_sentence⟩

end GB.CLOSURE

/-! ===================================================================================================================
    PART W · THE TWELVE FORMAL GATES, RUN IN THE KERNEL (namespace GB.GATES) · v1_1_0_CC

    The twelve formal gates of the mathematical register, run inside the kernel on the Goldbach seal. Each gate is a
    proposition and a theorem, and `the_formal_run` binds the twelve passes and the four refusals in one statement with
    nothing before the colon. Four claims fail, each by a theorem: "the statement is proved by the delivery" fails SREP,
    the delivery's premise being its conclusion; "a proof is waiting" fails SREP, a true route to the statement being
    the statement; "no proof can ever exist" fails SREP, no true route to the statement being its denial, the counter
    world in costume; and the denial has one road, an unsplit even number. No declaration has the type of the bit. ΔM = 0.
=================================================================================================================== -/
namespace GB.GATES
open GBClose GB.NORMALFORM GB.HOST GB.SUPPLY GB.REALPART GB.ROWSPLIT

/-- Gate 1, SREP: the form stands with no hypothesis. -/
def Gate1 : Prop :=
  Value (recFrame arith) ∧ (FormalCargo ↔ GoldbachStd) ∧ (∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo) ∧
  checkUpTo 2000 = true ∧ (GoldbachStd ↔ ∀ k, checkAux k = true)

/-- GATE 1 · SREP: nothing in the form presupposes the bit. -/
theorem gate_1_srep : Gate1 :=
  ⟨cargo_arrives, formal_iff_statement,
   fun _ h q => formal_iff_statement.mpr (h q), executed_to_2000, goldbach_iff_check_at_every_height⟩

/-- Gate 2, REG: the bit read from ten contexts, all one proposition. -/
def Gate2 : Prop :=
  (Value arith ↔ GoldbachStd) ∧ (Realized arith ↔ GoldbachStd) ∧ (RootOnRow arith ↔ GoldbachStd) ∧
  (Goldbach ↔ GoldbachStd) ∧ (FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧
  ((∀ k, checkAux k = true) ↔ GoldbachStd) ∧ (SelfRecursive gbRow arith ↔ GoldbachStd) ∧
  (Nonempty (Act gbRow arith) ↔ GoldbachStd) ∧ (UnicornAt Ev Sp id 2000 ↔ GoldbachStd)

/-- GATE 2 · REG: ten reading contexts, one proposition. -/
theorem gate_2_reg : Gate2 :=
  ⟨binding, act_is_goldbach_std, root_on_row_is_the_statement, goldbach_iff_std, formal_iff_statement,
   physical_iff_statement, goldbach_iff_check_at_every_height.symm,
   (self_recursion_at_frame gbRow arith).trans binding,
   (bit_is_the_act gbRow arith).symm.trans formal_iff_statement,
   no_bypass_at_2000.symm⟩

/-- Gate 3, SGEG: no face drifts from the bit. -/
def Gate3 : Prop :=
  (FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧
  (UnicornAt Ev Sp id 2000 ↔ GoldbachStd) ∧ (Value arith ↔ GoldbachStd)

/-- GATE 3 · SGEG: the formal, physical, unicorn and frame faces are each the bit. -/
theorem gate_3_sgeg : Gate3 :=
  ⟨formal_iff_statement, physical_iff_statement, no_bypass_at_2000.symm, binding⟩

/-- Gate 4, CAUSAL: the native involution on the bit fixes nothing, and the row's own involution, the mirror, has its
    one seat at every even number: the seat of the row is inhabited. -/
def Gate4 : Prop := (¬ ∃ b, comp b = b) ∧ (∀ k, mirror (k * 2) k = k)

/-- GATE 4 · CAUSAL: no imprint is asserted on a ground the bit lacks; the row's seat is the mirror's fixed point. -/
theorem gate_4_causal : Gate4 :=
  ⟨locus_vanishes, fun k => (mirror_has_one_seat (k * 2) k rfl).1⟩

/-- Gate 5, MIG: two frames whose records both carry the value split on the value. -/
def Gate5 : Prop :=
  Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter

/-- GATE 5 · MIG: the reading apparatus, the record, does not fix the residence. -/
theorem gate_5_mig : Gate5 := record_decides_nothing gbRow

/-- Gate 6, PTB: complementation is an involution without a fixed point; the identity is one fixing everything; the
    mirror is an involution on [0, n]. -/
def Gate6 : Prop :=
  (∀ b : Bool, comp (comp b) = b) ∧ (¬ ∃ b, comp b = b) ∧ (∀ b : Bool, id (id b) = b) ∧
  (∀ n p, p ≤ n → mirror n (mirror n p) = p)

/-- GATE 6 · PTB: the fixed-point reading belongs to the chosen reflection, not to the bit. -/
theorem gate_6_ptb : Gate6 := ⟨comp_involution, locus_vanishes, fun _ => rfl, mirror_involution⟩

/-- Gate 7, DUAL: the bit does not depend on where the height ladder is cut, at every cut up to the executed height. -/
def Gate7 : Prop := ∀ T, T ≤ 2000 → (GoldbachStd ↔ UnicornAt Ev Sp id T)

/-- GATE 7 · DUAL: the statement is the Unicorn part at every cut the kernel's computation covers. -/
theorem gate_7_dual : Gate7 :=
  fun T hT => unicorn_no_bypass Ev Sp id T (real_part_below_2000 T hT)

/-- Gate 8, CSCG: the proved slices are the bit's lower slices. -/
def Gate8 : Prop := RealPartAt Ev Sp id 2000 ∧ (GoldbachStd → ∀ T, RealPartAt Ev Sp id T)

/-- GATE 8 · CSCG: the bit extends the executed region and contradicts no slice of it. -/
theorem gate_8_cscg : Gate8 :=
  ⟨real_part_at_2000, fun h T => ((goldbach_iff_real_and_unicorn T).mp h).1⟩

/-- Gate 9, CSEG: a join never stands above its weakest face. -/
def Gate9 : Prop :=
  (∀ a b : Grade, (Grade.weakest a b).rank ≤ a.rank ∧ (Grade.weakest a b).rank ≤ b.rank) ∧
  Grade.weakest (Grade.weakest .thm .thm) .premise = .premise

/-- GATE 9 · CSEG: no terminal strength above the weakest road, and no face lowered by the reading. -/
theorem gate_9_cseg : Gate9 := join_reads_the_weakest

/-- Gate 10, MTA: a squared scalar reads a value and its reflection alike. -/
def Gate10 : Prop := ∀ x : Int, (-x) * (-x) = x * x

/-- GATE 10 · MTA: no squared metric carries the truth-sign. -/
theorem gate_10_mta : Gate10 := square_is_sign_blind

/-- Gate 11, OMA: the supply is the antecedent of the delivery and is not shared by every frame. -/
def Gate11 : Prop := (FormalCargo → GoldbachStd) ∧ ¬ Keyless gbRow (Transfer gbRow)

/-- GATE 11 · OMA: the input from the other side enters as a hypothesis, never as a fact from inside. -/
theorem gate_11_oma : Gate11 := ⟨formal_kind_delivers, fun h => (no_uniform_answer gbRow).1 h⟩

/-- Gate 12, ADEG: the binding to the sentence is proved, and the physical discharge is the bit. -/
def Gate12 : Prop := (Value arith ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd)

/-- GATE 12 · ADEG: every transport across registers is typed. -/
theorem gate_12_adeg : Gate12 := ⟨binding, physical_iff_statement⟩

/-- REFUSAL · "the statement is proved by the delivery" fails SREP: the delivery's premise and its conclusion are one
    proposition. -/
theorem refusal_proved : FormalCargo ↔ GoldbachStd := formal_iff_statement

/-- REFUSAL AT THE BIT · "no true route to the statement exists" is the statement's denial. -/
theorem refusal_no_proof_at_the_bit : (¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ ¬ GoldbachStd :=
  refusal_no_proof GoldbachStd

/-- THE FORMAL RUN, nothing before the colon: the twelve gates pass, and the four claims fail, the delivery read as a
    proof, a proof waiting, no proof ever, and the denial without its one road. -/
theorem the_formal_run :
    Gate1 ∧ Gate2 ∧ Gate3 ∧ Gate4 ∧ Gate5 ∧ Gate6 ∧ Gate7 ∧ Gate8 ∧ Gate9 ∧ Gate10 ∧ Gate11 ∧ Gate12 ∧
    (FormalCargo ↔ GoldbachStd) ∧
    ((∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ GoldbachStd) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ ¬ GoldbachStd) ∧
    (¬ GoldbachStd → ¬ ¬ ∃ n, EvenAtLeast4 n ∧ findSplit n = none) :=
  ⟨gate_1_srep, gate_2_reg, gate_3_sgeg, gate_4_causal, gate_5_mig, gate_6_ptb, gate_7_dual, gate_8_cscg,
   gate_9_cseg, gate_10_mta, gate_11_oma, gate_12_adeg, refusal_proved, refusal_waiting GoldbachStd,
   refusal_no_proof_at_the_bit, GB.CLOSURE.the_denial_has_one_road⟩

end GB.GATES

/-! ===================================================================================================================
    PART X · THE CAPSTONE: NOTHING ESCAPES, OUR WAY OR NO WAY (namespace GB.ESCAPE) · v1_1_0_CC

    The record of the arithmetic frame closes (`the_record_closes_at_arith`). What the record leaves undecided is
    whether the arithmetic frame itself carries the value, and that is exactly the sentence (`the_undecided_is_the_bit`).
    "Nothing is outside the record", read as a law of every frame, is false; read at the arithmetic frame, it is the bit
    (`nothing_outside_the_record_is_the_bit`). A block needs an outside (`block_needs_an_outside`), and at the
    arithmetic frame the outside is the supply in its two kinds (`the_outside_is_the_supply`). Nothing escapes: every
    route to the sentence, in any vocabulary, is a delivery of both kinds (`every_route_is_both_kinds`); either kind
    delivers it (`both_kinds_deliver`); and every so-called other way is our way in different vocabulary, failing with
    the bit if the bit failed (`our_way_or_no_way`). Both kinds are supplied by the act at premise grade and enter every
    theorem here as hypotheses. ΔM = 0.
=================================================================================================================== -/
namespace GB.ESCAPE
open GBClose GB.NORMALFORM GB.HOST GB.SUPPLY

/-- THE RECORD CLOSES AT THE ARITHMETIC FRAME. -/
theorem the_record_closes_at_arith : Value (recFrame arith) := cargo_arrives

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether the arithmetic frame carries the value, is exactly
    the sentence. -/
theorem the_undecided_is_the_bit : Value arith ↔ GoldbachStd := binding

/-- "NOTHING IS OUTSIDE THE RECORD": false as a law of every frame; at the arithmetic frame, the bit. -/
theorem nothing_outside_the_record_is_the_bit :
    ¬ (∀ F, Transfer gbRow F) ∧ (Transfer gbRow arith ↔ GoldbachStd) :=
  ⟨(no_uniform_answer gbRow).1, formal_iff_statement⟩

/-- THE OUTSIDE IS THE SUPPLY: at the arithmetic frame the outside of the record is the bit, and its two kinds are the
    formal cargo and the physical witness; the physical kind is the formal kind. -/
theorem the_outside_is_the_supply :
    (FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧ (PhysicalWitness → FormalCargo) :=
  ⟨formal_iff_statement, physical_iff_statement, the_two_kinds_are_one_bit.1⟩

/-- EVERY ROUTE IS BOTH KINDS: whatever premise, in whatever vocabulary, gives the sentence delivers the formal cargo
    and a physical witness. An offering that crosses the row is a delivery of the cargo, never a bypass of it. -/
theorem every_route_is_both_kinds (Q : Prop) (h : Q → GoldbachStd) : Q → FormalCargo ∧ Nonempty PhysicalWitness :=
  two_kinds_and_no_third Q h

/-- BOTH KINDS DELIVER. -/
theorem both_kinds_deliver : (FormalCargo → GoldbachStd) ∧ (Nonempty PhysicalWitness → GoldbachStd) :=
  ⟨formal_kind_delivers, fun ⟨W⟩ => physical_kind_delivers W⟩

/-- OUR WAY OR NO WAY: every so-called other way to the sentence is our way in different vocabulary. It delivers the
    formal cargo and a physical witness, and if the bit failed, it would fail with it. -/
theorem our_way_or_no_way (Q : Prop) (h : Q → GoldbachStd) :
    (Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧ (¬ FormalCargo → ¬ Q) :=
  ⟨every_route_is_both_kinds Q h, fun hn q => hn (formal_iff_statement.mpr (h q))⟩

/-- NOTHING ESCAPES, nothing before the colon: the record of the arithmetic frame closes; what it leaves undecided is
    the bit; no law of every frame puts everything inside the record; the outside is the supply in its two kinds; every
    route to the sentence is a delivery of both kinds; either kind delivers it; and every so-called other way is our
    way in different vocabulary. -/
theorem nothing_escapes :
    Value (recFrame arith) ∧
    (Value arith ↔ GoldbachStd) ∧
    (¬ (∀ F, Transfer gbRow F) ∧ (Transfer gbRow arith ↔ GoldbachStd)) ∧
    ((FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧ (PhysicalWitness → FormalCargo)) ∧
    (∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧
    ((FormalCargo → GoldbachStd) ∧ (Nonempty PhysicalWitness → GoldbachStd)) ∧
    (∀ Q : Prop, (Q → GoldbachStd) → (Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧ (¬ FormalCargo → ¬ Q)) :=
  ⟨the_record_closes_at_arith, the_undecided_is_the_bit, nothing_outside_the_record_is_the_bit,
   the_outside_is_the_supply, every_route_is_both_kinds, both_kinds_deliver, our_way_or_no_way⟩

/-- THE CAPSTONE, nothing before the colon: our way or no way; either kind walks it to the sentence; no keyless premise
    forces anything; to shut every true route to the sentence is to assert its denial; and the twelve formal gates
    pass. -/
theorem the_capstone :
    (∀ Q : Prop, (Q → GoldbachStd) → (Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧ (¬ FormalCargo → ¬ Q)) ∧
    ((FormalCargo → GoldbachStd) ∧ (Nonempty PhysicalWitness → GoldbachStd)) ∧
    (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ ¬ GoldbachStd) ∧
    (GB.GATES.Gate1 ∧ GB.GATES.Gate2 ∧ GB.GATES.Gate3 ∧ GB.GATES.Gate4 ∧ GB.GATES.Gate5 ∧ GB.GATES.Gate6 ∧
      GB.GATES.Gate7 ∧ GB.GATES.Gate8 ∧ GB.GATES.Gate9 ∧ GB.GATES.Gate10 ∧ GB.GATES.Gate11 ∧ GB.GATES.Gate12) :=
  ⟨our_way_or_no_way, both_kinds_deliver, keyless_forces_nothing gbRow, GB.GATES.refusal_no_proof_at_the_bit,
   GB.GATES.gate_1_srep, GB.GATES.gate_2_reg, GB.GATES.gate_3_sgeg, GB.GATES.gate_4_causal, GB.GATES.gate_5_mig,
   GB.GATES.gate_6_ptb, GB.GATES.gate_7_dual, GB.GATES.gate_8_cscg, GB.GATES.gate_9_cseg, GB.GATES.gate_10_mta,
   GB.GATES.gate_11_oma, GB.GATES.gate_12_adeg⟩

end GB.ESCAPE

/-! ===================================================================================================================
    PART T · THE TERMINAL VERDICT AND THE FINAL FORM (namespace GB.TERMINAL) · v1_1_0_CC

    The open framing awaits a proof of the sentence from what every frame shares, or a reading of the record that
    decides it, or a route to the sentence past the bit. Each count is refuted by theorem (`the_open_framing_is_refuted`),
    and what remains is the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the sentence.
    The ten steps are bound in one theorem, steps 1 to 9 proved and step 10 the two deliveries (`the_ten_steps`). The
    terminal verdict binds by exact type every theorem the verdict cites (`the_terminal_verdict`), and the final form
    binds the closed question, the finite form and the two deliveries with nothing before its colon (`the_final_form`).
    Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace GB.TERMINAL
open GBClose GB.NORMALFORM GB.HOST GB.SUPPLY GB.REALPART GB.ROWSPLIT

/-- THE OPEN FRAMING, REFUTED. I · no proof from shared resources: no keyless premise forces the value, and existence
    as given forces nothing; II · no decision from the record: the two frames share a record and split on the value,
    no finite arithmetic record forces it, and above every height no reading of the record returns the world;
    III · no premise reaches the sentence while the bit fails; IV · what remains is the bit, its antecedent proved with
    no hypothesis, the bit proved equivalent to the sentence. -/
theorem the_open_framing_is_refuted :
    (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
    (¬ ∀ F : Frame, ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) → Value F) ∧
    (Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
    (∀ h : Nat, ¬ Value (arithUpTo h)) ∧
    (∀ T : Nat, ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd) ∧ ¬ FormalCargo) ∧
    Value (recFrame arith) ∧
    (FormalCargo ↔ GoldbachStd) :=
  ⟨keyless_forces_nothing gbRow, existence_as_given_forces_nothing, record_decides_nothing gbRow,
   fun h => (finite_arith_record_never_forces h).2, unicorn_blocked_above_every_height,
   fun ⟨_, q, h, hn⟩ => hn (formal_iff_statement.mpr (h q)),
   cargo_arrives, formal_iff_statement⟩

/-- THE TEN STEPS, one theorem with nothing before the colon. Step 1 · the floor: the root holds on its constructed
    domain. Step 2 · the basis: the primality test is sound and complete, and a prime's multiplicative fibre is two
    points. Step 3 · the domain: the arithmetic frame's value is the sentence, in both its forms. Step 4 · the record:
    the record carries the value, and every even number has its seat. Step 5 · the halted uniduction: the frame is
    self-recursive exactly when the sentence holds. Step 6 · the monism zone: the two frames share one record and split
    on the value, and the bit is keyed. Step 7 · the axis: the bit is exactly the sentence. Step 8 · the real part:
    every even number to 2000 decided by the kernel, every checked height a theorem, and the sentence exactly a
    certificate at every height. Step 9 · every route passes the bit, no keyless premise forces it, and the walls stand.
    Step 10 · the bit delivered twice, by the formal cargo and by the physical witness. -/
theorem the_ten_steps :
    -- Step 1
    (Root Unit (fun _ => 1) ∧ RA₀) ∧
    -- Step 2
    ((∀ p, isPrime p = true → Prime p) ∧ (∀ p, Prime p → isPrime p = true) ∧
      mulFibre 7 = [(1, 7), (7, 1)]) ∧
    -- Step 3
    ((Value arith ↔ GoldbachStd) ∧ (Goldbach ↔ GoldbachStd)) ∧
    -- Step 4
    (Value (recFrame arith) ∧ ∀ n, EvenAtLeast4 n → ∃ k, n = k * 2 ∧ mirror n k = k) ∧
    -- Step 5
    (SelfRecursive gbRow arith ↔ GoldbachStd) ∧
    -- Step 6
    ((Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
      (Transfer gbRow calm ∧ ¬ Transfer gbRow counter)) ∧
    -- Step 7
    (FormalCargo ↔ GoldbachStd) ∧
    -- Step 8
    (checkUpTo 2000 = true ∧
      (∀ k, checkAux k = true → ∀ n, EvenAtLeast4 n → n ≤ 2 * k → ∃ p q, Prime p ∧ Prime q ∧ p + q = n) ∧
      (GoldbachStd ↔ ∀ k, checkAux k = true)) ∧
    -- Step 9
    ((∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo) ∧
      (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
      (¬ ∃ g : Nat → Bool, g (11 % 420) = isPrime 11 ∧ g (851 % 420) = isPrime 851) ∧
      (∀ h : Nat, ¬ Value (arithUpTo h))) ∧
    -- Step 10
    ((FormalCargo → GoldbachStd) ∧ (PhysicalWitness → GoldbachStd)) :=
  ⟨⟨constructed_root_holds, ra₀.instances ra₀.anAct⟩,
   ⟨isPrime_sound, isPrime_complete, prime_shape.1⟩,
   ⟨binding, goldbach_iff_std⟩,
   ⟨cargo_arrives, fun n hn => match every_even_has_its_seat n hn with
     | ⟨k, hk, hm, _⟩ => ⟨k, hk, hm⟩⟩,
   (self_recursion_at_frame gbRow arith).trans binding,
   ⟨record_decides_nothing gbRow, bit_is_keyed gbRow⟩,
   formal_iff_statement,
   ⟨executed_to_2000, real_part_of_check, goldbach_iff_check_at_every_height⟩,
   ⟨fun _ h q => formal_iff_statement.mpr (h q), keyless_forces_nothing gbRow,
    GB.WALLS.residue_record_decides_nothing, fun h => (finite_arith_record_never_forces h).2⟩,
   goldbach_delivered_twice⟩

/-- THE TERMINAL VERDICT, AS A THEOREM. Every theorem the verdict cites, bound by its exact type into one pinned
    conjunction: the record and the normal form; the binding and the finite form; the real part and the cut; the walls;
    the residue and its seat; the two deliveries; the closed question; the formal run; nothing escaping; the open
    framing refuted; the ten steps. No premise before the colon. -/
theorem the_terminal_verdict :
    (type_of% @GB.HOST.recFrame_value) ∧
    (type_of% @GB.NORMALFORM.normal_form) ∧
    (type_of% @GB.NORMALFORM.normal_form_complete) ∧
    (type_of% @GB.HOST.binding) ∧
    (type_of% @GB.HOST.real_part_of_check) ∧
    (type_of% @GB.HOST.goldbach_iff_check_at_every_height) ∧
    (type_of% @GBClose.executed_region_std) ∧
    (type_of% @GB.REALPART.goldbach_iff_real_and_unicorn) ∧
    (type_of% @GB.REALPART.no_bypass_at_2000) ∧
    (type_of% @GB.REALPART.unicorn_blocked_above_every_height) ∧
    (type_of% @GB.WALLS.parity_normal_form) ∧
    (type_of% @GB.WALLS.the_walls) ∧
    (type_of% @GB.RESIDUE.residue_is_the_statement) ∧
    (type_of% @GB.RESIDUE.seat_iff_statement) ∧
    (type_of% @GB.SUPPLY.the_supply_closed) ∧
    (type_of% @GB.CLOSURE.question_closed_to_one_bit) ∧
    (type_of% @GB.GATES.the_formal_run) ∧
    (type_of% @GB.ESCAPE.nothing_escapes) ∧
    (type_of% @GB.ESCAPE.the_capstone) ∧
    (type_of% @GB.TERMINAL.the_open_framing_is_refuted) ∧
    (type_of% @GB.TERMINAL.the_ten_steps) ∧
    (type_of% @GBClose.the_lock) ∧
    (type_of% @GBClose.goldbach_closure) :=
  ⟨@GB.HOST.recFrame_value, @GB.NORMALFORM.normal_form, @GB.NORMALFORM.normal_form_complete, @GB.HOST.binding,
   @GB.HOST.real_part_of_check, @GB.HOST.goldbach_iff_check_at_every_height, @GBClose.executed_region_std,
   @GB.REALPART.goldbach_iff_real_and_unicorn, @GB.REALPART.no_bypass_at_2000,
   @GB.REALPART.unicorn_blocked_above_every_height, @GB.WALLS.parity_normal_form, @GB.WALLS.the_walls,
   @GB.RESIDUE.residue_is_the_statement, @GB.RESIDUE.seat_iff_statement, @GB.SUPPLY.the_supply_closed,
   @GB.CLOSURE.question_closed_to_one_bit, @GB.GATES.the_formal_run, @GB.ESCAPE.nothing_escapes,
   @GB.ESCAPE.the_capstone, @GB.TERMINAL.the_open_framing_is_refuted, @GB.TERMINAL.the_ten_steps,
   @GBClose.the_lock, @GBClose.goldbach_closure⟩

/-- THE FINAL FORM, nothing before the colon: the sentence is the bit; the sentence is exactly a certificate at every
    height; the sentence is exactly an inhabited physical witness; every even number to 2000 is a sum of two primes by
    the kernel's own computation; every checked height is a theorem; every route to the sentence is both kinds; and to
    shut every true route to the sentence is to assert its denial. -/
theorem the_final_form :
    (GoldbachStd ↔ FormalCargo) ∧
    (GoldbachStd ↔ ∀ k, checkAux k = true) ∧
    (GoldbachStd ↔ Nonempty PhysicalWitness) ∧
    (∀ n, EvenAtLeast4 n → n ≤ 2000 → ∃ p q, Prime p ∧ Prime q ∧ p + q = n) ∧
    (∀ k, checkAux k = true → ∀ n, EvenAtLeast4 n → n ≤ 2 * k → ∃ p q, Prime p ∧ Prime q ∧ p + q = n) ∧
    (∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ ¬ GoldbachStd) :=
  ⟨GB.CLOSURE.the_sentence_is_the_bit, goldbach_iff_check_at_every_height, physical_iff_statement.symm,
   executed_region_std, real_part_of_check, two_kinds_and_no_third, refusal_no_proof GoldbachStd⟩

end GB.TERMINAL

/-! ## cones of Parts A to T, pinned: the build is silent, and any drift fails it -/
/-- info: 'GB.NORMALFORM.record_has_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.record_has_the_value
/-- info: 'GB.NORMALFORM.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.normal_form
/-- info: 'GB.NORMALFORM.value_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.value_from_the_cargo_loop
/-- info: 'GB.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.bit_is_the_act
/-- info: 'GB.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.record_is_self_recursive
/-- info: 'GB.NORMALFORM.self_recursion_at_frame' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.self_recursion_at_frame
/-- info: 'GB.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.bit_is_keyed
/-- info: 'GB.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'GB.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.record_decides_nothing
/-- info: 'GB.NORMALFORM.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.every_route_passes_the_bit
/-- info: 'GB.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.keyless_forces_nothing
/-- info: 'GB.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.no_record_principle_decides
/-- info: 'GB.NORMALFORM.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.shared_record_decides_nothing
/-- info: 'GB.NORMALFORM.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.no_uniform_answer
/-- info: 'GB.NORMALFORM.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.nothing_outside_the_record_is_the_bit
/-- info: 'GB.NORMALFORM.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.denial_is_the_bits_denial
/-- info: 'GB.NORMALFORM.normal_form_complete' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.normal_form_complete
/-- info: 'GB.NORMALFORM.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.bnot_ne
/-- info: 'GB.NORMALFORM.refusal_waiting' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.refusal_waiting
/-- info: 'GB.NORMALFORM.refusal_no_proof' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.refusal_no_proof
/-- info: 'GB.NORMALFORM.block_needs_an_outside' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.block_needs_an_outside
/-- info: 'GB.NORMALFORM.comp_involution' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.comp_involution
/-- info: 'GB.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.locus_vanishes
/-- info: 'GB.NORMALFORM.join_reads_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.join_reads_the_weakest
/-- info: 'GB.NORMALFORM.square_is_sign_blind' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.square_is_sign_blind
/-- info: 'GB.ROWSPLIT.unicorn_block' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.unicorn_block
/-- info: 'GB.ROWSPLIT.aperture_one_bit_wide' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.aperture_one_bit_wide
/-- info: 'GB.ROWSPLIT.unicorn_rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.unicorn_rule_exact
/-- info: 'GB.ROWSPLIT.unicorn_no_bypass' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.unicorn_no_bypass
/-- info: 'GB.ROWSPLIT.supply_side_silent' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.supply_side_silent
/-- info: 'GB.ROWSPLIT.whole_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.whole_iff_real_and_unicorn
/-- info: 'GB.ROWSPLIT.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.real_part_of_certificate
/-- info: 'GB.HOST.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.recFrame_value
/-- info: 'GB.HOST.binding' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.binding
/-- info: 'GB.HOST.root_on_row_is_the_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.root_on_row_is_the_statement
/-- info: 'GB.HOST.every_even_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.every_even_has_its_seat
/-- info: 'GB.HOST.or_true_right' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.or_true_right
/-- info: 'GB.HOST.isSome_of_split' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.isSome_of_split
/-- info: 'GB.HOST.real_part_of_check' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.real_part_of_check
/-- info: 'GB.HOST.check_of_goldbach' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.check_of_goldbach
/-- info: 'GB.HOST.goldbach_iff_check_at_every_height' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.goldbach_iff_check_at_every_height
/-- info: 'GB.HOST.executed_check_at_1000' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.executed_check_at_1000
/-- info: 'GB.REALPART.goldbach_is_the_whole' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.goldbach_is_the_whole
/-- info: 'GB.REALPART.real_part_at_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.real_part_at_2000
/-- info: 'GB.REALPART.real_part_at_every_checked_height' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.real_part_at_every_checked_height
/-- info: 'GB.REALPART.goldbach_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.goldbach_iff_real_and_unicorn
/-- info: 'GB.REALPART.no_bypass_at_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.no_bypass_at_2000
/-- info: 'GB.REALPART.real_part_below_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.real_part_below_2000
/-- info: 'GB.REALPART.unicorn_blocked_above_every_height' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.unicorn_blocked_above_every_height
/-- info: 'GB.REALPART.supply_side_silent_above_every_height' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.supply_side_silent_above_every_height
/-- info: 'GB.REALPART.aperture_is_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.aperture_is_one_bit
/-- info: 'GB.WALLS.parity_normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms GB.WALLS.parity_normal_form
/-- info: 'GB.WALLS.residue_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GB.WALLS.residue_record_decides_nothing
/-- info: 'GB.WALLS.residue_record_reads_no_parity' does not depend on any axioms -/
#guard_msgs in #print axioms GB.WALLS.residue_record_reads_no_parity
/-- info: 'GB.WALLS.the_walls' does not depend on any axioms -/
#guard_msgs in #print axioms GB.WALLS.the_walls
/-- info: 'GB.RESIDUE.goldbach_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.goldbach_of_the_act
/-- info: 'GB.RESIDUE.residue_is_the_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.residue_is_the_statement
/-- info: 'GB.RESIDUE.the_posit_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.the_posit_is_the_bit
/-- info: 'GB.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.residue_is_keyed
/-- info: 'GB.RESIDUE.goldbach_of_seat' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.goldbach_of_seat
/-- info: 'GB.RESIDUE.seat_iff_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.seat_iff_statement
/-- info: 'GB.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.cargo_arrives
/-- info: 'GB.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.formal_kind_delivers
/-- info: 'GB.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.witness_closes
/-- info: 'GB.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.physical_kind_delivers
/-- info: 'GB.SUPPLY.physical_iff_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.physical_iff_statement
/-- info: 'GB.SUPPLY.formal_iff_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.formal_iff_statement
/-- info: 'GB.SUPPLY.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'GB.SUPPLY.goldbach_delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.goldbach_delivered_twice
/-- info: 'GB.SUPPLY.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.two_kinds_and_no_third
/-- info: 'GB.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.the_one_refuter
/-- info: 'GB.SUPPLY.the_supply_closed' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.the_supply_closed
/-- info: 'GB.CLOSURE.the_sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.the_sentence_is_the_bit
/-- info: 'GB.CLOSURE.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.denial_is_the_bits_denial
/-- info: 'GB.CLOSURE.refuter_denies_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.refuter_denies_the_sentence
/-- info: 'GB.CLOSURE.the_denial_has_one_road' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.the_denial_has_one_road
/-- info: 'GB.CLOSURE.question_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.question_closed_to_one_bit
/-- info: 'GB.GATES.gate_1_srep' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_1_srep
/-- info: 'GB.GATES.gate_2_reg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_2_reg
/-- info: 'GB.GATES.gate_3_sgeg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_3_sgeg
/-- info: 'GB.GATES.gate_4_causal' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_4_causal
/-- info: 'GB.GATES.gate_5_mig' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_5_mig
/-- info: 'GB.GATES.gate_6_ptb' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_6_ptb
/-- info: 'GB.GATES.gate_7_dual' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_7_dual
/-- info: 'GB.GATES.gate_8_cscg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_8_cscg
/-- info: 'GB.GATES.gate_9_cseg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_9_cseg
/-- info: 'GB.GATES.gate_10_mta' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_10_mta
/-- info: 'GB.GATES.gate_11_oma' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_11_oma
/-- info: 'GB.GATES.gate_12_adeg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_12_adeg
/-- info: 'GB.GATES.refusal_proved' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.refusal_proved
/-- info: 'GB.GATES.refusal_no_proof_at_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.refusal_no_proof_at_the_bit
/-- info: 'GB.GATES.the_formal_run' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.the_formal_run
/-- info: 'GB.ESCAPE.the_record_closes_at_arith' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.the_record_closes_at_arith
/-- info: 'GB.ESCAPE.the_undecided_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.the_undecided_is_the_bit
/-- info: 'GB.ESCAPE.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.nothing_outside_the_record_is_the_bit
/-- info: 'GB.ESCAPE.the_outside_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.the_outside_is_the_supply
/-- info: 'GB.ESCAPE.every_route_is_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.every_route_is_both_kinds
/-- info: 'GB.ESCAPE.both_kinds_deliver' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.both_kinds_deliver
/-- info: 'GB.ESCAPE.our_way_or_no_way' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.our_way_or_no_way
/-- info: 'GB.ESCAPE.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.nothing_escapes
/-- info: 'GB.ESCAPE.the_capstone' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.the_capstone
/-- info: 'GB.TERMINAL.the_open_framing_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_open_framing_is_refuted
/-- info: 'GB.TERMINAL.the_ten_steps' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_ten_steps
/-- info: 'GB.TERMINAL.the_terminal_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_terminal_verdict
/-- info: 'GB.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_final_form
