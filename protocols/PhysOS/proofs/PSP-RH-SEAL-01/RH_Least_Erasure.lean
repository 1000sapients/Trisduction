/-
  EVERY PRIME · 3.1.1
  Core Lean 4.19.0, standalone: no library, no import, no axiom declared, no sorry.
  Every theorem prints its axiom cone at the foot of the file; 174 cones are pinned under
  #guard_msgs, so a compile in which any pinned cone changes fails.

  The file proves, on one chart, what a formal system can prove about the Riemann Hypothesis
  and locates the one thing it cannot: a single bit, which is the hypothesis itself, and which
  every proof of the hypothesis supplies rather than derives.

  THE CHART. A point is (x, t) with x the doubled real part and t the height; the critical line
  is x = 1. The fold (x, t) ↦ (2 − x, t) is s ↦ 1 − s̄. Registration (x, t) ↦ (1, t) lands
  every point on the line and keeps the height. A world is a set of points, a zero set. The
  record of a world is its image under registration. Two worlds with the same record are
  twins of one record. A world is fold-closed when the fold maps it into itself.

  TERMS USED IN THIS FILE.
  seat            the fixed set of an involution: the line under the fold; 1 under multiplication.
  orbit           the two points a fold-closed world carries off the line, exchanged by the fold;
                  at a prime p, the two ordered factorizations (1, p) and (p, 1).
  reading of the record   a predicate on worlds that takes one value on all twins of one record.
  keyless, keyed  a predicate on worlds true on every world; true on some world and false on another.
  admissible      keyless, or a reading of the record.
  coalition       a Boolean combination of premises, of any depth.
  forces          a premise forces the line when every fold-closed world satisfying it satisfies RH.
  least erasure   a world every twin of which has a point off the line whenever it has one.
  posit, act      an assumption written as the field of a structure; an inhabitant of a
                  self-grounding structure, whose existence is equivalent to the proposition.
                  The one posit of the file is least erasure at the actual zero set.
  supply, spend   to provide the posit. The supplied bit is the sign of the posit.
  arrow           a sign function: the identity on a type, or λ(n) = (−1)^Ω(n).
  displacement, side   for a point, x − 1; for a point off the line, the sign of x − 1.
  setting         a hypothesis with a provability predicate, Σ₁-complete and sound on the denial.

  SECTIONS AND THEIR MAIN THEOREMS.
  I      the identity arrow; a bit is two distinct values (aperture_one_bit_wide)
  II     every prime is one fibre of exactly two (prime_fibre, freedom_is_exactly_two)
  III    completely additive functions are determined at the primes (determined_by_primes)
  IV     the p-adic valuation as a free assignment; Euclid's lemma from first principles
         (euclid_lemma, prime_freedom_independent, primes_base_of_freedom)
  V      the sign arrow of an additive count is completely multiplicative (arrow_multiplicative);
         no finite stage decides a universal (finite_never_forces)
  VI     the chart: no registered point lies off the line; no reading of the record decides
         the hypothesis; keyless premises force nothing (unicorn_never_registered,
         record_decides_nothing, keyless_forces_nothing)
  VII    least erasure is the hypothesis (least_erasure_is_the_value)
  VII-bis the fold never crosses the line; a second symmetry; the record blind at every scale
  VIII   a self-grounding supply exists exactly when the proposition holds (supply_iff);
         the five faces of the hypothesis (faces_are_one)
  IX     primes, the free basis and the identity arrow are keyless and force nothing
  X      the explicit formula as a structure; least erasure is Weil positivity
         (least_erasure_is_positivity); positivity is keyed (positivity_is_keyed)
  XI     the posit as a structure field (rh_from_the_act, acts_are_one)
  XII    the block with no axiom (record_decides_nothing_free)
  XIII   the hypothesis on the supplied bit (prime_arc_sealed)
  XIV    the hypothesis is the weakest forcing premise (rh_is_the_weakest_forcing_premise);
         the Li and de Bruijn–Newman coordinates (li_prefix_never_forces, rh_iff_the_sign)
  XV     four faces in time, exactly one keyed (exactly_one_face_is_keyed)
  XVI    the eigenstructure of the fold; the side bit and its calibration
         (record_never_reads_the_side, colocation_is_a_calibration)
  XVII   admissible coalitions force nothing; no certified height forces; the heat flow on
         polynomials; the Liouville arrow computed; five readings agree; no reader index
  XVIII  a theory placed on three strata; the root crosses no keyed sentence; the two can'ts;
         the round trip; the ladder blocked (the_road)
  XIX    the vocabulary law; the even coalition; the triaxial cut; the ladder's proof; the
         route ledger (the_front)
  XX     least erasure affirmed: the record, the ledger, the price, the one form, the act
         (least_erasure_affirmed)

  TWO THINGS ARE PROVED AT ONCE. Least erasure is equivalent to the hypothesis on every world
  (least_erasure_is_the_value), so the hypothesis follows from the posit. No reading of the
  record, and no Boolean combination of readings and keyless premises, agrees with the
  hypothesis on every fold-closed world (no_coalition_decides), so nothing in the file supplies
  the posit. The file proves neither the hypothesis nor its denial.
-/
namespace PrimeFreedom

/-! ## I · The identity arrow, and a bit as two distinct values -/

/-- The identity arrow on a type. -/
def arrow (α : Type) : α → α := id

theorem arrow_exists (α : Type) : ∃ f : α → α, ∀ a, f a = a := ⟨id, fun _ => rfl⟩

/-- A Boolean takes one of two values. -/
theorem orientation_two_valued : ∀ b : Bool, b = true ∨ b = false := by
  intro b
  cases b
  · exact Or.inr rfl
  · exact Or.inl rfl

/-- The two orientations are distinct. -/
theorem orientations_distinct : (true : Bool) ≠ false := fun h => Bool.noConfusion h

/-- A bit is two values, and they differ. -/
theorem aperture_one_bit_wide : (∀ b : Bool, b = true ∨ b = false) ∧ (true : Bool) ≠ false :=
  ⟨orientation_two_valued, orientations_distinct⟩

/-! ## II · Every prime is one fibre of exactly two -/

def isPrime (p : Nat) : Prop := 2 ≤ p ∧ ∀ d, d ∣ p → d = 1 ∨ d = p

/-- The fixed point of multiplication. -/
def mul_seat : Nat := 1

/-- The multiplicative orbit over n: the pairs that multiply to n. -/
def mul_orbit (n : Nat) (a b : Nat) : Prop := a * b = n

theorem seat_is_one : mul_seat = 1 := rfl

/-- The fibre of multiplication over a prime is the pair (1, p), (p, 1). -/
theorem prime_fibre (p : Nat) (hp : isPrime p) (a b : Nat) :
    mul_orbit p a b ↔ (a = 1 ∧ b = p) ∨ (a = p ∧ b = 1) := by
  constructor
  · intro h
    have hdvd : a ∣ p := ⟨b, h.symm⟩
    cases hp.2 a hdvd with
    | inl h1 =>
      subst h1
      have h' : 1 * b = p := h
      rw [Nat.one_mul] at h'
      exact Or.inl ⟨rfl, h'⟩
    | inr hp_eq =>
      subst hp_eq
      have h2a : 2 ≤ a := hp.1
      have hb : b = 1 := by
        have h_pos : 0 < a := by omega
        exact Nat.eq_of_mul_eq_mul_left h_pos (by rw [show a * b = a from h, Nat.mul_one])
      exact Or.inr ⟨rfl, hb⟩
  · rintro (⟨ha1, hbp⟩ | ⟨hap, hb1⟩)
    · rw [ha1, hbp]
      exact Nat.one_mul p
    · rw [hap, hb1]
      exact Nat.mul_one p

/-- No a satisfies a · a = p for a prime p. -/
theorem prime_off_seat (p : Nat) (hp : isPrime p) : ¬ ∃ a, mul_orbit p a a := by
  rintro ⟨a, ha⟩
  have h2p : 2 ≤ p := hp.1
  cases (prime_fibre p hp a a).mp ha with
  | inl h1 => omega
  | inr h2 => omega

/-- The fibre over a prime is exactly the ordered pair and its reverse, and the two are distinct. -/
theorem freedom_is_exactly_two (p : Nat) (hp : isPrime p) :
    (∀ a b, mul_orbit p a b ↔ (a = 1 ∧ b = p) ∨ (a = p ∧ b = 1)) ∧ (1 : Nat) ≠ p :=
  ⟨prime_fibre p hp, by intro h; have := hp.1; omega⟩

/-! ## III · Completely additive functions are determined at the primes -/

/-- A completely additive measure on the multiplicative monoid of the positive integers. -/
def CompletelyAdditive (f : Nat → Int) : Prop :=
  ∀ a b, a > 0 → b > 0 → f (a * b) = f a + f b

/-- A completely additive function vanishes at 1. -/
theorem seat_is_zero (f : Nat → Int) (hf : CompletelyAdditive f) : f 1 = 0 := by
  have h := hf 1 1 (by decide) (by decide)
  rw [Nat.mul_one] at h
  omega

/-- Least witness search, with fuel. -/
def findLeastFrom (P : Nat → Prop) [DecidablePred P] (start : Nat) : Nat → Nat
  | 0 => start
  | fuel + 1 => if P start then start else findLeastFrom P (start + 1) fuel

theorem findLeastFrom_correct (P : Nat → Prop) [DecidablePred P] (start fuel m : Nat)
    (hlo : start ≤ m) (hhi : m ≤ start + fuel) (hm : P m) :
    P (findLeastFrom P start fuel) ∧ findLeastFrom P start fuel ≤ m := by
  induction fuel generalizing start with
  | zero =>
    have h : m = start := by omega
    subst h
    exact ⟨hm, Nat.le_refl m⟩
  | succ fuel ih =>
    show P (if P start then start else findLeastFrom P (start + 1) fuel) ∧
      (if P start then start else findLeastFrom P (start + 1) fuel) ≤ m
    rcases Decidable.em (P start) with h | h
    · rw [if_pos h]
      exact ⟨h, hlo⟩
    · rw [if_neg h]
      have hne : m ≠ start := fun he => h (he ▸ hm)
      exact ih (start + 1) (by omega) (by omega)


/-- The least divisor of n at least 2, found by bounded search from 2 with fuel n. -/
def leastDivisor (n : Nat) : Nat := findLeastFrom (fun d => 2 ≤ d ∧ d ∣ n) 2 n

theorem leastDivisor_spec (n : Nat) (hn : 2 ≤ n) :
    (2 ≤ leastDivisor n ∧ leastDivisor n ∣ n) ∧ leastDivisor n ≤ n ∧
      (∀ m, 2 ≤ m → m ∣ n → leastDivisor n ≤ m) := by
  have hbase := findLeastFrom_correct (fun d => 2 ≤ d ∧ d ∣ n) 2 n n hn (by omega)
    ⟨hn, Nat.dvd_refl n⟩
  refine ⟨hbase.1, hbase.2, fun m hm2 hm => ?_⟩
  have hmn : m ≤ n := Nat.le_of_dvd (by omega) hm
  exact (findLeastFrom_correct (fun d => 2 ≤ d ∧ d ∣ n) 2 n m hm2 (by omega) ⟨hm2, hm⟩).2

/-- The least divisor at least 2 is prime: any divisor of it divides n, and the search's
    minimality bounds it from below. -/
theorem leastDivisor_prime (n : Nat) (hn : 2 ≤ n) : isPrime (leastDivisor n) := by
  obtain ⟨⟨hd2, hdvd⟩, hdle, hmin⟩ := leastDivisor_spec n hn
  refine ⟨hd2, fun m hm => ?_⟩
  have hdpos : 0 < leastDivisor n := by omega
  have hmle : m ≤ leastDivisor n := Nat.le_of_dvd hdpos hm
  rcases Decidable.em (m = 1) with h1 | h1
  · exact Or.inl h1
  · right
    have hmne0 : m ≠ 0 := by
      intro h0
      rw [h0] at hm
      obtain ⟨c, hc⟩ := hm
      rw [Nat.zero_mul] at hc
      omega
    have hm2 : 2 ≤ m := by omega
    have hle := hmin m hm2 (Nat.dvd_trans hm hdvd)
    omega

/-- Every integer greater than one has a prime divisor: the least divisor at least 2, found by
    bounded search. No classical axiom. -/
theorem exists_prime_dvd (n : Nat) (h0 : 0 < n) (h1 : n ≠ 1) : ∃ p, isPrime p ∧ p ∣ n := by
  have hn : 2 ≤ n := by omega
  exact ⟨leastDivisor n, leastDivisor_prime n hn, (leastDivisor_spec n hn).1.2⟩

/-- Two completely additive functions that agree at every prime agree everywhere, by bounded
    induction peeling one prime divisor at each step. -/
theorem determined_by_primes (f g : Nat → Int) (hf : CompletelyAdditive f)
    (hg : CompletelyAdditive g) (h_agree : ∀ p, isPrime p → f p = g p) :
    ∀ n, 0 < n → f n = g n := by
  suffices h : ∀ fuel n, n ≤ fuel → 0 < n → f n = g n from fun n hn => h n n (Nat.le_refl n) hn
  intro fuel
  induction fuel with
  | zero => intro n hle h0; omega
  | succ fuel ih =>
    intro n hle h0
    if h1 : n = 1 then
      subst h1
      rw [seat_is_zero f hf, seat_is_zero g hg]
    else
      obtain ⟨p, hp, hpd⟩ := exists_prime_dvd n h0 h1
      obtain ⟨k, hk⟩ := hpd
      have hk0 : 0 < k := by
        rcases Nat.eq_zero_or_pos k with hkc | hkc
        · exfalso
          rw [hkc, Nat.mul_zero] at hk
          omega
        · exact hkc
      have hp2 : 2 ≤ p := hp.1
      have hlt : k < n := by
        obtain ⟨d, hd⟩ := Nat.exists_eq_add_of_le hp2
        rw [hk, hd, Nat.add_mul]
        omega
      have hpf : f (p * k) = f p + f k := hf p k (by omega) hk0
      have hpg : g (p * k) = g p + g k := hg p k (by omega) hk0
      rw [hk, hpf, hpg, h_agree p hp, ih k (by omega) hk0]

/-! ## IV · The p-adic valuation as a free assignment; Euclid's lemma from first principles -/

/-- Remainder descent: if p divides m * b and x * b, with x = m * q + r, then p divides r * b. -/
theorem dvd_remainder_mul (p b m q r x : Nat) (hpm : p ∣ m * b) (hx : p ∣ x * b)
    (hqr : m * q + r = x) : p ∣ r * b := by
  have h2 : p ∣ (m * q) * b := by
    obtain ⟨c, hc⟩ := hpm
    exact ⟨c * q, by
      calc (m * q) * b = (m * b) * q := Nat.mul_right_comm m q b
        _ = (p * c) * q := by rw [hc]
        _ = p * (c * q) := Nat.mul_assoc p c q⟩
  have h3 : (m * q) * b + r * b = x * b := by rw [← Nat.add_mul, hqr]
  obtain ⟨u, hu⟩ := hx
  obtain ⟨v, hv⟩ := h2
  have hY : r * b = x * b - (m * q) * b := by
    calc r * b = (m * q) * b + r * b - (m * q) * b := (Nat.add_sub_cancel_left _ _).symm
      _ = x * b - (m * q) * b := by rw [h3]
  exact ⟨u - v, by rw [Nat.mul_sub, ← hu, ← hv]; exact hY⟩

/-- The least positive m with p ∣ m * b, found by search from 0 with fuel p. -/
def leastMulDvd (p b : Nat) : Nat := findLeastFrom (fun m => 0 < m ∧ p ∣ m * b) 0 p

theorem leastMulDvd_spec (p b : Nat) (hwit : 0 < p ∧ p ∣ p * b) :
    (0 < leastMulDvd p b ∧ p ∣ leastMulDvd p b * b) ∧ leastMulDvd p b ≤ p ∧
      (∀ k, k ≤ p → 0 < k ∧ p ∣ k * b → leastMulDvd p b ≤ k) :=
  ⟨(findLeastFrom_correct (fun m => 0 < m ∧ p ∣ m * b) 0 p p (Nat.zero_le p) (by omega)
      hwit).1,
   (findLeastFrom_correct (fun m => 0 < m ∧ p ∣ m * b) 0 p p (Nat.zero_le p) (by omega)
      hwit).2,
   fun k hk hPk =>
     (findLeastFrom_correct (fun m => 0 < m ∧ p ∣ m * b) 0 p k (Nat.zero_le k) (by omega)
       hPk).2⟩

/-- Euclid's lemma: a prime dividing a product divides one of the factors. Proved by least-witness
    search, the division algorithm and descent on the remainder. -/
theorem euclid_lemma (p a b : Nat) (hp : isPrime p) (hab : p ∣ a * b) : p ∣ a ∨ p ∣ b := by
  rcases Decidable.em (p ∣ a) with hpa | hpa
  · exact Or.inl hpa
  · right
    have hp0 : 0 < p := by have := hp.1; omega
    obtain ⟨⟨hm0, hmdvd⟩, hmle, hmin'⟩ :=
      leastMulDvd_spec p b ⟨hp0, Nat.dvd_mul_right p b⟩
    have hmp : leastMulDvd p b ∣ p := by
      apply Nat.dvd_of_mod_eq_zero
      have hc : p % leastMulDvd p b = 0 ∨ 0 < p % leastMulDvd p b := by omega
      rcases hc with h0 | hpos
      · exact h0
      · have hlt : p % leastMulDvd p b < leastMulDvd p b := Nat.mod_lt p hm0
        have hdvd' : p ∣ (p % leastMulDvd p b) * b :=
          dvd_remainder_mul p b (leastMulDvd p b) (p / leastMulDvd p b)
            (p % leastMulDvd p b) p hmdvd (Nat.dvd_mul_right p b)
            (Nat.div_add_mod p (leastMulDvd p b))
        have hle := hmin' (p % leastMulDvd p b) (by omega) ⟨hpos, hdvd'⟩
        omega
    have hma : leastMulDvd p b ∣ a := by
      apply Nat.dvd_of_mod_eq_zero
      have hc : a % leastMulDvd p b = 0 ∨ 0 < a % leastMulDvd p b := by omega
      rcases hc with h0 | hpos
      · exact h0
      · have hlt : a % leastMulDvd p b < leastMulDvd p b := Nat.mod_lt a hm0
        have hdvd' : p ∣ (a % leastMulDvd p b) * b :=
          dvd_remainder_mul p b (leastMulDvd p b) (a / leastMulDvd p b)
            (a % leastMulDvd p b) a hmdvd hab (Nat.div_add_mod a (leastMulDvd p b))
        have hle := hmin' (a % leastMulDvd p b) (by omega) ⟨hpos, hdvd'⟩
        omega
    rcases hp.2 _ hmp with h | h
    · rw [h] at hmdvd
      rwa [Nat.one_mul] at hmdvd
    · rw [h] at hma
      exact absurd hma hpa

/-- Greatest witness at or below the bound, by downward search; P 0 always holds here. -/
def findGt (P : Nat → Prop) [DecidablePred P] : Nat → Nat
  | 0 => 0
  | n + 1 => if P (n + 1) then n + 1 else findGt P n

theorem findGt_spec (P : Nat → Prop) [DecidablePred P] (n : Nat) (h0 : P 0) :
    P (findGt P n) := by
  induction n with
  | zero => exact h0
  | succ n ih =>
    show P (if P (n + 1) then n + 1 else findGt P n)
    rcases Decidable.em (P (n + 1)) with h | h
    · rw [if_pos h]; exact h
    · rw [if_neg h]; exact ih

theorem findGt_max (P : Nat → Prop) [DecidablePred P] (n k : Nat) (hk : k ≤ n) (hPk : P k) :
    k ≤ findGt P n := by
  induction n with
  | zero =>
    have h : k = 0 := by omega
    subst h
    exact Nat.le_refl _
  | succ n ih =>
    show k ≤ (if P (n + 1) then n + 1 else findGt P n)
    rcases Decidable.em (P (n + 1)) with h | h
    · rw [if_pos h]; exact hk
    · rw [if_neg h]
      have hne : k ≠ n + 1 := fun hkk => h (hkk ▸ hPk)
      have hkn : k ≤ n := by omega
      exact ih hkn

/-- The p-adic valuation: the exponent of p in n, as the greatest k with p ^ k ∣ n. -/
def pExp (p n : Nat) : Nat := findGt (fun k => p ^ k ∣ n) n

theorem pExp_dvd (p n : Nat) : p ^ pExp p n ∣ n :=
  findGt_spec (fun k => p ^ k ∣ n) n (by
    show p ^ 0 ∣ n
    rw [Nat.pow_zero]
    exact Nat.one_dvd n)

/-- Exponents of two outrun their index. -/
theorem two_pow_ge (k : Nat) : k + 1 ≤ 2 ^ k := by
  induction k with
  | zero => decide
  | succ k ih => rw [Nat.pow_succ]; omega

/-- A power of p ≥ 2 dividing a positive n is bounded by n. -/
theorem pow_dvd_bound (p n k : Nat) (hp : 2 ≤ p) (hn : 0 < n) (h : p ^ k ∣ n) : k ≤ n := by
  have h1 : p ^ k ≤ n := Nat.le_of_dvd hn h
  have h2 : k + 1 ≤ 2 ^ k := two_pow_ge k
  have h3 : 2 ^ k ≤ p ^ k := Nat.pow_le_pow_left hp k
  omega

theorem pExp_le_of_dvd (p n k : Nat) (hk : k ≤ n) (h : p ^ k ∣ n) : k ≤ pExp p n :=
  findGt_max (fun k => p ^ k ∣ n) n k hk h

/-- Four factors rearranged. -/
theorem mul_mul_mul_comm_nat (a b c d : Nat) : (a * b) * (c * d) = (a * c) * (b * d) := by
  calc (a * b) * (c * d) = a * (b * c) * d := by
        rw [Nat.mul_assoc, ← Nat.mul_assoc b c d, Nat.mul_assoc a (b * c) d]
    _ = a * (c * b) * d := by rw [Nat.mul_comm b c]
    _ = (a * c) * (b * d) := by
        rw [Nat.mul_assoc, Nat.mul_assoc c b d, Nat.mul_assoc a c (b * d)]

/-- The p-adic valuation is additive over products. -/
theorem pExp_mul (p a b : Nat) (hp : isPrime p) (ha : 0 < a) (hb : 0 < b) :
    pExp p (a * b) = pExp p a + pExp p b := by
  have hp2 : 2 ≤ p := hp.1
  have hp0 : 0 < p := by omega
  have hia : p ^ pExp p a ∣ a := pExp_dvd p a
  have hjb : p ^ pExp p b ∣ b := pExp_dvd p b
  obtain ⟨a', ha'⟩ := hia
  obtain ⟨b', hb'⟩ := hjb
  have hpa' : ¬ p ∣ a' := by
    intro hdiv
    obtain ⟨c, hc⟩ := hdiv
    have hbig : p ^ (pExp p a + 1) ∣ a :=
      ⟨c, by
        calc a = p ^ pExp p a * a' := ha'
          _ = p ^ pExp p a * (p * c) := by rw [hc]
          _ = p ^ (pExp p a + 1) * c := by rw [Nat.pow_add, Nat.pow_one, Nat.mul_assoc]⟩
    have hle := pExp_le_of_dvd p a (pExp p a + 1)
      (pow_dvd_bound p a _ hp2 ha hbig) hbig
    omega
  have hpb' : ¬ p ∣ b' := by
    intro hdiv
    obtain ⟨c, hc⟩ := hdiv
    have hbig : p ^ (pExp p b + 1) ∣ b :=
      ⟨c, by
        calc b = p ^ pExp p b * b' := hb'
          _ = p ^ pExp p b * (p * c) := by rw [hc]
          _ = p ^ (pExp p b + 1) * c := by rw [Nat.pow_add, Nat.pow_one, Nat.mul_assoc]⟩
    have hle := pExp_le_of_dvd p b (pExp p b + 1)
      (pow_dvd_bound p b _ hp2 hb hbig) hbig
    omega
  have hprodeq : a * b = p ^ (pExp p a + pExp p b) * (a' * b') := by
    have e1 : a * b = (p ^ pExp p a * a') * b := congrArg (fun x => x * b) ha'
    have e2 : (p ^ pExp p a * a') * b = (p ^ pExp p a * a') * (p ^ pExp p b * b') :=
      congrArg (fun x => (p ^ pExp p a * a') * x) hb'
    have e3 : (p ^ pExp p a * a') * (p ^ pExp p b * b') =
        (p ^ pExp p a * p ^ pExp p b) * (a' * b') := mul_mul_mul_comm_nat _ _ _ _
    have e4 : (p ^ pExp p a * p ^ pExp p b) * (a' * b') =
        p ^ (pExp p a + pExp p b) * (a' * b') :=
      congrArg (fun x => x * (a' * b')) (Nat.pow_add p _ _).symm
    exact e1.trans (e2.trans (e3.trans e4))
  have hup : p ^ (pExp p a + pExp p b) ∣ a * b := ⟨a' * b', hprodeq⟩
  have hdown : ¬ p ^ (pExp p a + pExp p b + 1) ∣ a * b := by
    intro hbig
    have hdecomp : p ^ (pExp p a + pExp p b + 1) = p ^ (pExp p a + pExp p b) * p := by
      rw [Nat.pow_add, Nat.pow_one]
    have hdiv : p ∣ a' * b' := by
      have h' : p ^ (pExp p a + pExp p b) * p ∣ p ^ (pExp p a + pExp p b) * (a' * b') := by
        rw [← hprodeq, ← hdecomp]
        exact hbig
      exact Nat.dvd_of_mul_dvd_mul_left (Nat.pow_pos hp0) h'
    rcases euclid_lemma p a' b' hp hdiv with h | h
    · exact hpa' h
    · exact hpb' h
  have hle1 : pExp p a + pExp p b ≤ pExp p (a * b) :=
    pExp_le_of_dvd p (a * b) _ (pow_dvd_bound p (a * b) _ hp2 (Nat.mul_pos ha hb) hup) hup
  have hle2 : pExp p (a * b) ≤ pExp p a + pExp p b := by
    have hK : p ^ pExp p (a * b) ∣ a * b := pExp_dvd p (a * b)
    rcases Decidable.em (pExp p a + pExp p b + 1 ≤ pExp p (a * b)) with hgt | hgt
    · exact absurd (Nat.dvd_trans (Nat.pow_dvd_pow p hgt) hK) hdown
    · omega
  omega

/-- The valuation of p at itself is one. -/
theorem pExp_self (p : Nat) (hp : isPrime p) : pExp p p = 1 := by
  have hp2 : 2 ≤ p := hp.1
  have hp0 : 0 < p := by omega
  have h1 : p ^ (1 : Nat) ∣ p := by rw [Nat.pow_one]; exact Nat.dvd_refl p
  have h1le : 1 ≤ pExp p p := pExp_le_of_dvd p p 1 (by omega) h1
  have hnot2 : ¬ p ^ (1 + 1 : Nat) ∣ p := by
    intro h
    have hle : p ^ (1 + 1) ≤ p := Nat.le_of_dvd hp0 h
    rw [Nat.pow_add, Nat.pow_one] at hle
    have hge : 2 * p ≤ p * p := by
      obtain ⟨d, hd⟩ := Nat.exists_eq_add_of_le hp2
      rw [hd, Nat.add_mul]
      exact Nat.le_add_right _ _
    omega
  rcases Decidable.em (2 ≤ pExp p p) with h | h
  · exact absurd (Nat.dvd_trans (Nat.pow_dvd_pow p h) (pExp_dvd p p)) hnot2
  · omega

/-- The valuation vanishes where p does not divide. -/
theorem pExp_eq_zero_of_not_dvd (p n : Nat) (h : ¬ p ∣ n) : pExp p n = 0 := by
  rcases Decidable.em (1 ≤ pExp p n) with hpos | hneg
  · have hpow : p ^ (1 : Nat) ∣ p ^ pExp p n := Nat.pow_dvd_pow p hpos
    rw [Nat.pow_one] at hpow
    exact absurd (Nat.dvd_trans hpow (pExp_dvd p n)) h
  · omega

/-- The valuation at one is zero. -/
theorem pExp_one (p : Nat) (hp : isPrime p) : pExp p 1 = 0 := by
  apply pExp_eq_zero_of_not_dvd
  intro hd
  have h1 := Nat.le_of_dvd (by decide) hd
  have h2 := hp.1
  omega

/-- The valuation at a different prime is zero. -/
theorem pExp_other (p q : Nat) (hp : isPrime p) (hq : isPrime q) (hpq : p ≠ q) :
    pExp p q = 0 := by
  apply pExp_eq_zero_of_not_dvd
  intro hd
  rcases hq.2 p hd with h | h
  · have := hp.1; omega
  · exact hpq h

/-- The p-adic valuation as an integer-valued function. -/
def padicMeasure (p : Nat) (n : Nat) : Int := (pExp p n : Int)

theorem padicMeasure_additive (p : Nat) (hp : isPrime p) :
    CompletelyAdditive (padicMeasure p) := by
  intro a b ha hb
  show ((pExp p (a * b) : Nat) : Int) = (pExp p a : Int) + (pExp p b : Int)
  rw [pExp_mul p a b hp ha hb, Int.ofNat_add]

/-- For distinct primes p and q there is a completely additive function equal to 1 at p and 0 at q:
    the p-adic valuation. -/
theorem prime_freedom_independent (p q : Nat) (hp : isPrime p) (hq : isPrime q) (hpq : p ≠ q) :
    ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0 :=
  ⟨padicMeasure p, padicMeasure_additive p hp,
   by show ((pExp p p : Nat) : Int) = 1; rw [pExp_self p hp]; rfl,
   by show ((pExp p q : Nat) : Int) = 0; rw [pExp_other p q hp hq hpq]; rfl,
   by show ((pExp p 1 : Nat) : Int) = 0; rw [pExp_one p hp]; rfl⟩

/-- Uniqueness and independence together: a completely additive function is determined by its
    values at the primes, and those values are freely assignable. -/
theorem primes_base_of_freedom :
    (∀ f g : Nat → Int, CompletelyAdditive f → CompletelyAdditive g →
      (∀ p, isPrime p → f p = g p) → ∀ n, 0 < n → f n = g n) ∧
    (∀ p q : Nat, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) :=
  ⟨determined_by_primes, prime_freedom_independent⟩

/-! ## V · The sign arrow of an additive count -/

/-- An additive count: Ω(ab) = Ω(a) + Ω(b) for positive a and b. -/
def AdditiveCount (Om : Nat → Nat) : Prop := ∀ a b, a > 0 → b > 0 → Om (a * b) = Om a + Om b

/-- The sign arrow of a count: +1 on an even count, −1 on an odd one. -/
def signArrow (k : Nat) : Int := if k % 2 = 0 then 1 else -1

/-- The sign of a sum is the product of the signs. -/
theorem signArrow_add (m n : Nat) :
    signArrow (m + n) = signArrow m * signArrow n := by
  unfold signArrow
  rw [Nat.add_mod]
  rcases Nat.mod_two_eq_zero_or_one m with hm | hm <;>
    rcases Nat.mod_two_eq_zero_or_one n with hn | hn <;>
    rw [hm, hn] <;> decide

/-- The sign arrow of an additive count is completely multiplicative, as λ(n) = (−1)^Ω(n) is. -/
theorem arrow_multiplicative (Om : Nat → Nat) (hOm : AdditiveCount Om)
    (a b : Nat) (ha : a > 0) (hb : 0 < b) :
    signArrow (Om (a * b)) = signArrow (Om a) * signArrow (Om b) := by
  rw [hOm a b ha hb, signArrow_add]

/-- At a prime the count is one and the sign is −1. -/
theorem arrow_at_prime (Om : Nat → Nat) (p : Nat) (_hp : isPrime p) (hOm : Om p = 1) :
    signArrow (Om p) = -1 := by
  rw [hOm]
  decide

/-! ## V-bis · No finite stage decides a universal -/

/-- For every N there is a property true below N and false at N. -/
theorem finite_never_forces (N : Nat) :
    ∃ P : Nat → Prop, (∀ n, n < N → P n) ∧ ¬ ∀ n, P n :=
  ⟨fun n => n < N, fun _ h => h, fun h => Nat.lt_irrefl N (h N)⟩

/-- A property with counterexamples past every stage is not universal:
    no finite census decides the limit. -/
theorem limit_not_forced (P : Nat → Prop) (h_finite : ∀ N, ∃ n > N, ¬ P n) : ¬ (∀ n, P n) := by
  intro h
  obtain ⟨n, _, hn_not⟩ := h_finite 0
  exact hn_not (h n)

/-! ## VI · The chart: the fold, registration, the record -/

/-- A point of the chart: the doubled real part x and the height t.
    The critical line is x = 1; the fold s ↦ 1 − s̄ sends x to 2 − x;
    registration keeps the height and lands on the line. -/
structure Pt where
  x : Int
  t : Nat
  deriving DecidableEq

def onLine (z : Pt) : Prop := z.x = 1
instance (z : Pt) : Decidable (onLine z) := inferInstanceAs (Decidable (z.x = 1))
def fold (z : Pt) : Pt := ⟨2 - z.x, z.t⟩
def reg (z : Pt) : Pt := ⟨1, z.t⟩

theorem fold_fixed_iff (z : Pt) : fold z = z ↔ onLine z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 - x) t = Pt.mk x t ↔ x = 1
    constructor
    · intro h
      have hx := congrArg Pt.x h
      change 2 - x = x at hx
      omega
    · intro h
      subst h
      rfl

theorem reg_fixes_line (z : Pt) (h : onLine z) : reg z = z := by
  cases z with
  | mk x t =>
    have hx : x = 1 := h
    subst hx
    rfl

/-- No registered point lies off the line. -/
theorem unicorn_never_registered (z : Pt) (h : ¬ onLine z) : ∀ w, reg w ≠ z := by
  intro w hw
  apply h
  rw [← hw]
  exact rfl

/-- Every point is on the line, fixed by the fold and by registration, or off the line, moved by
    the fold, sharing its record with its partner, and registered by no point. -/
theorem nothing_escapes_one_cut (z : Pt) :
    (onLine z ∧ fold z = z ∧ reg z = z) ∨
    (¬ onLine z ∧ fold z ≠ z ∧ reg (fold z) = reg z ∧ ∀ w, reg w ≠ z) :=
  if h : z.x = 1 then Or.inl ⟨h, (fold_fixed_iff z).mpr h, reg_fixes_line z h⟩
  else Or.inr ⟨h, fun hf => h ((fold_fixed_iff z).mp hf), rfl, unicorn_never_registered z h⟩

/-- A world is a zero set on the chart. -/
abbrev World := Pt → Prop
def FoldClosed (Z : World) : Prop := ∀ z, Z z → Z (fold z)
/-- The hypothesis, on the chart: every zero lies on the line. -/
def RH (Z : World) : Prop := ∀ z, Z z → onLine z
def Left (Z : World) : Prop := ∃ z, Z z ∧ z.x < 1
def Right (Z : World) : Prop := ∃ z, Z z ∧ 1 < z.x

/-- On a fold-closed world some zero lies left of the line exactly when some zero lies right of it. -/
theorem sides_together (Z : World) (hZ : FoldClosed Z) : Left Z ↔ Right Z :=
  ⟨fun ⟨z, hz, hx⟩ => ⟨fold z, hZ z hz, show 1 < 2 - z.x by omega⟩,
   fun ⟨z, hz, hx⟩ => ⟨fold z, hZ z hz, show 2 - z.x < 1 by omega⟩⟩

/-- On a fold-closed world the hypothesis holds exactly when no zero lies left of the line. -/
theorem rh_iff_no_left (Z : World) (hZ : FoldClosed Z) : RH Z ↔ ¬ Left Z := by
  constructor
  · intro h ⟨z, hz, hx⟩
    have e : z.x = 1 := h z hz
    omega
  · intro h z hz
    if hx : z.x = 1 then exact hx
    else
      exfalso
      apply h
      if hl : z.x < 1 then exact ⟨z, hz, hl⟩
      else exact ⟨fold z, hZ z hz, show 2 - z.x < 1 by omega⟩

/-- The record of a world: its zeros registered. -/
def recordOf (Z : World) : World := fun r => ∃ s, Z s ∧ reg s = r
def SameRecord (Z Z' : World) : Prop := ∀ r, recordOf Z r ↔ recordOf Z' r
/-- A reading respects the record when two worlds of one record read alike. -/
def RespectsRecord (g : World → Prop) : Prop := ∀ Z Z', SameRecord Z Z' → (g Z ↔ g Z')

/-- The on-line world at height 14, and the off-line pair at offset k about the same height. -/
abbrev W1 : World := fun z => z = ⟨1, 14⟩
abbrev pairAt (k : Int) : World := fun z => z = ⟨1 - k, 14⟩ ∨ z = ⟨1 + k, 14⟩
abbrev W2 : World := pairAt 1

theorem W1_closed : FoldClosed W1 := by
  intro z hz
  have h : z = ⟨1, 14⟩ := hz
  subst h
  show fold ⟨1, 14⟩ = ⟨1, 14⟩
  decide

theorem W1_rh : RH W1 := by
  intro z hz
  have h : z = ⟨1, 14⟩ := hz
  subst h
  exact rfl

theorem pair_closed (k : Int) : FoldClosed (pairAt k) := by
  intro z hz
  rcases hz with h | h
  · subst h
    apply Or.inr
    show Pt.mk (2 - (1 - k)) 14 = Pt.mk (1 + k) 14
    congr 1
    omega
  · subst h
    apply Or.inl
    show Pt.mk (2 - (1 + k)) 14 = Pt.mk (1 - k) 14
    congr 1
    omega

theorem pair_not_rh (k : Int) (hk : k ≠ 0) : ¬ RH (pairAt k) := by
  intro h
  have e : (1 : Int) - k = 1 := h ⟨1 - k, 14⟩ (Or.inl rfl)
  omega

theorem pair_same_record (k : Int) : SameRecord W1 (pairAt k) := by
  intro r
  constructor
  · intro ⟨s, hs, hr⟩
    have h : s = ⟨1, 14⟩ := hs
    subst h
    exact ⟨⟨1 - k, 14⟩, Or.inl rfl, hr⟩
  · intro ⟨s, hs, hr⟩
    rcases hs with h | h <;> subst h <;> exact ⟨⟨1, 14⟩, rfl, hr⟩

theorem W2_closed : FoldClosed W2 := pair_closed 1
theorem W2_not_rh : ¬ RH W2 := pair_not_rh 1 (by decide)
theorem same_record_12 : SameRecord W1 W2 := pair_same_record 1

/-- Distinct positive offsets give distinct fold-closed worlds with the record of W1, none
    satisfying the hypothesis. -/
theorem fibre_is_infinite (k k' : Int) (hk : 0 < k) (hk' : 0 < k') (hne : k ≠ k') :
    SameRecord W1 (pairAt k) ∧ ¬ RH (pairAt k) ∧ pairAt k ⟨1 - k, 14⟩ ∧ ¬ pairAt k' ⟨1 - k, 14⟩ := by
  refine ⟨pair_same_record k, pair_not_rh k (by omega), Or.inl rfl, ?_⟩
  intro h
  rcases h with h | h
  · have e : (1 : Int) - k = 1 - k' := congrArg Pt.x h
    omega
  · have e : (1 : Int) - k = 1 + k' := congrArg Pt.x h
    omega

/-- Two worlds with the same record that both satisfy the hypothesis are equal. -/
theorem lossless_unique (Z Z' : World) (h : SameRecord Z Z') (hZ : RH Z) (hZ' : RH Z') :
    ∀ z, Z z ↔ Z' z := by
  intro z
  constructor
  · intro hz
    obtain ⟨s, hs, hsr⟩ := (h z).mp ⟨z, hz, reg_fixes_line z (hZ z hz)⟩
    have e : reg s = s := reg_fixes_line s (hZ' s hs)
    rw [← hsr, e]
    exact hs
  · intro hz
    obtain ⟨s, hs, hsr⟩ := (h z).mpr ⟨z, hz, reg_fixes_line z (hZ' z hz)⟩
    have e : reg s = s := reg_fixes_line s (hZ s hs)
    rw [← hsr, e]
    exact hs

/-- No reading of the record agrees with the hypothesis on every fold-closed world. -/
theorem record_decides_nothing (g : World → Prop) (hg : RespectsRecord g) :
    ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z) := fun h =>
  W2_not_rh ((h W2 W2_closed).mp ((hg W1 W2 same_record_12).mp ((h W1 W1_closed).mpr W1_rh)))

/-- record_decides_nothing, under a second name. -/
theorem unicorn_block (g : World → Prop) (hg : RespectsRecord g) :
    ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z) := record_decides_nothing g hg

/-- A premise is keyless when it holds on every world. -/
def Keyless (A : World → Prop) : Prop := ∀ Z, A Z
/-- A premise forces the line when every fold-closed world it holds on satisfies the hypothesis. -/
def Forces (A : World → Prop) : Prop := ∀ Z, FoldClosed Z → A Z → RH Z

/-- A keyless premise forces nothing: it holds on W2, which is fold-closed and fails the
    hypothesis. -/
theorem keyless_forces_nothing (A : World → Prop) (hA : Keyless A) : ¬ Forces A :=
  fun h => W2_not_rh (h W2 W2_closed (hA W2))

/-- The hypothesis separates W1 from W2, which share one record. -/
theorem sentence_separates_record_does_not : (RH W1 ∧ ¬ RH W2) ∧ SameRecord W1 W2 :=
  ⟨⟨W1_rh, W2_not_rh⟩, same_record_12⟩

/-! ## VII · Least erasure is the value -/

def OffLine (Z : World) : Prop := ∃ z, Z z ∧ ¬ onLine z
/-- Least erasure in the fibre: if the world erases, every world of its record erases. -/
def LeastErasure (Z : World) : Prop := ∀ Z', SameRecord Z Z' → OffLine Z → OffLine Z'

theorem record_is_lossless (Z : World) : ¬ OffLine (recordOf Z) := by
  intro ⟨r, ⟨s, _, hsr⟩, hoff⟩
  apply hoff
  rw [← hsr]
  exact rfl

theorem record_same (Z : World) : SameRecord Z (recordOf Z) := by
  intro r
  constructor
  · intro ⟨s, hs, hsr⟩
    exact ⟨reg s, ⟨s, hs, rfl⟩, hsr⟩
  · intro ⟨s', ⟨s, hs, hss'⟩, hs'r⟩
    subst hss'
    exact ⟨s, hs, hs'r⟩

/-- Least erasure holds on a world exactly when the hypothesis does. -/
theorem least_erasure_is_the_value (Z : World) : LeastErasure Z ↔ RH Z := by
  constructor
  · intro hle z hz
    if h : z.x = 1 then exact h
    else exact absurd (hle (recordOf Z) (record_same Z) ⟨z, hz, h⟩) (record_is_lossless Z)
  · intro hrh _ _ ⟨z, hz, hoff⟩
    exact absurd (hrh z hz) hoff

/-- Least erasure is not a reading of the record: it holds on W1 and fails on W2, which share one
    record. -/
theorem least_erasure_reads_past_the_record : ¬ RespectsRecord LeastErasure := fun h =>
  W2_not_rh ((least_erasure_is_the_value W2).mp
    ((h W1 W2 same_record_12).mp ((least_erasure_is_the_value W1).mpr W1_rh)))

/-- Any premise that forces the line and is forced by it is the line, on every fold-closed
    world. -/
theorem posit_is_the_value (A : World → Prop) (h : Forces A)
    (h' : ∀ Z, FoldClosed Z → RH Z → A Z) : ∀ Z, FoldClosed Z → (A Z ↔ RH Z) :=
  fun Z hZ => ⟨h Z hZ, h' Z hZ⟩

/-! ## VII-bis · The fold never crosses the line; a second symmetry; the record blind at every scale -/

/-- The fold lands on the line exactly where the point already was: folding never crosses. -/
theorem fold_onLine_iff (z : Pt) : onLine (fold z) ↔ onLine z := by
  show (2 - z.x = 1) ↔ (z.x = 1)
  constructor <;> intro h <;> omega

theorem fold_preserves_offline (z : Pt) : ¬ onLine (fold z) ↔ ¬ onLine z := by
  rw [fold_onLine_iff]

theorem fold_ne_of_offline (z : Pt) (h : ¬ onLine z) : fold z ≠ z :=
  fun hf => h ((fold_fixed_iff z).mp hf)

/-- A second involution on the chart, commuting with the fold and preserving the line. -/
structure ConjSymmetry where
  conj : Pt → Pt
  invol : ∀ z, conj (conj z) = z
  commutes : ∀ z, conj (fold z) = fold (conj z)
  preserves_line : ∀ z, onLine (conj z) ↔ onLine z

/-- Under both symmetries one off-line zero forces its reflection, its conjugate and their
    composite into the world, all off the line. -/
theorem offline_zero_quadruple (Z : World) (hF : FoldClosed Z) (C : ConjSymmetry)
    (hC : ∀ z, Z z → Z (C.conj z)) (z : Pt) (hz : Z z) (hoff : ¬ onLine z) :
    Z (fold z) ∧ Z (C.conj z) ∧ Z (C.conj (fold z)) ∧
      ¬ onLine (fold z) ∧ ¬ onLine (C.conj z) ∧ ¬ onLine (C.conj (fold z)) ∧ fold z ≠ z :=
  ⟨hF z hz, hC z hz, hC (fold z) (hF z hz),
   (fold_preserves_offline z).mpr hoff,
   fun h => hoff ((C.preserves_line z).mp h),
   fun h => hoff ((fold_onLine_iff z).mp ((C.preserves_line (fold z)).mp h)),
   fold_ne_of_offline z hoff⟩

/-- If the hypothesis fails on a world, some zero of it lies off the line. Classical. -/
theorem not_rh_has_offline_witness (Z : World) (h : ¬ RH Z) : OffLine Z := by
  apply Classical.byContradiction
  intro hno
  apply h
  intro z hz
  apply Classical.byContradiction
  intro hoff
  exact hno ⟨z, hz, hoff⟩

/-- Denying the hypothesis on a world with both symmetries posits a whole off-line orbit of four
    points. -/
theorem denial_posits_the_orbit (Z : World) (hF : FoldClosed Z) (C : ConjSymmetry)
    (hC : ∀ z, Z z → Z (C.conj z)) (h : ¬ RH Z) :
    ∃ z, Z z ∧ ¬ onLine z ∧ Z (fold z) ∧ Z (C.conj z) ∧ Z (C.conj (fold z)) := by
  obtain ⟨z, hz, hoff⟩ := not_rh_has_offline_witness Z h
  exact ⟨z, hz, hoff, hF z hz, hC z hz, hC (fold z) (hF z hz)⟩

/-- For every nonzero offset the pair world is fold-closed, fails the hypothesis, and shares the
    record of W1. -/
theorem record_blind_at_every_scale (k : Int) (hk : k ≠ 0) :
    RH W1 ∧ FoldClosed (pairAt k) ∧ ¬ RH (pairAt k) ∧ SameRecord W1 (pairAt k) :=
  ⟨W1_rh, pair_closed k, pair_not_rh k hk, pair_same_record k⟩

/-! ## VIII · Self-grounding supplies, and the five faces of the hypothesis -/

/-- A proposition with a type of acts, each of which yields it. -/
structure SelfGrounding (root : Prop) where
  Act : Type
  spend : Act → root

/-- A self-grounding supply of a proposition, with an act, exists exactly when the proposition
    holds. -/
theorem supply_iff (root : Prop) : (∃ G : SelfGrounding root, Nonempty G.Act) ↔ root := by
  constructor
  · intro ⟨G, ⟨a⟩⟩
    exact G.spend a
  · intro hr
    exact ⟨⟨Unit, fun _ => hr⟩, ⟨()⟩⟩

/-- The five faces of the hypothesis. The equivalences are fields, carried as hypotheses and not
    proved here: the critical line (Riemann 1859), Λ = 0 (Newman 1976; Rodgers and Tao 2020), the
    faithfulness of the Liouville function (Landau 1899), and Weil positivity (Weil 1952). -/
structure Faces where
  line : Prop
  lamZero : Prop
  faithful : Prop
  weil : Prop
  least : Prop
  line_iff_least : line ↔ least
  lam_iff_least : lamZero ↔ least
  faith_iff_least : faithful ↔ least
  weil_iff_least : weil ↔ least

/-- Any one face implies all five. -/
theorem faces_are_one (H : Faces) :
    (H.line ↔ H.least) ∧ (H.lamZero ↔ H.least) ∧ (H.faithful ↔ H.least) ∧ (H.weil ↔ H.least) :=
  ⟨H.line_iff_least, H.lam_iff_least, H.faith_iff_least, H.weil_iff_least⟩

/-- Given a self-grounding supply of the least-erasure face with an act, all five faces hold. -/
theorem rh_from_the_act_generic (H : Faces) (G : SelfGrounding H.least) (a : G.Act) :
    H.line ∧ H.lamZero ∧ H.faithful ∧ H.weil ∧ H.least :=
  let le := G.spend a
  ⟨H.line_iff_least.mpr le, H.lam_iff_least.mpr le, H.faith_iff_least.mpr le,
   H.weil_iff_least.mpr le, le⟩


/-! ## IX · Primes, the free basis and the identity arrow are keyless and force nothing -/

/-- Primes exist. -/
theorem primes_exist : ∃ p, isPrime p :=
  let ⟨p, hp, _⟩ := exists_prime_dvd 2 (by decide) (by decide)
  ⟨p, hp⟩

/-- The existence of primes holds on every world. -/
theorem primes_exist_keyless : Keyless (fun _ => ∃ p, isPrime p) := fun _ => primes_exist

/-- The free basis at the primes holds on every world. -/
theorem prime_freedom_keyless :
    Keyless (fun _ => ∀ p q, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) :=
  fun _ => prime_freedom_independent

/-- The identity arrow exists on every world. -/
theorem arrow_keyless : Keyless (fun _ => ∃ f : Nat → Nat, ∀ a, f a = a) :=
  fun _ => arrow_exists Nat

/-- The existence of primes forces nothing. -/
theorem primes_exist_forces_nothing : ¬ Forces (fun _ => ∃ p, isPrime p) :=
  keyless_forces_nothing _ primes_exist_keyless

/-- The free basis at the primes forces nothing. -/
theorem prime_freedom_forces_nothing :
    ¬ Forces (fun _ => ∀ p q, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) :=
  keyless_forces_nothing _ prime_freedom_keyless

/-- The existence of the identity arrow forces nothing. -/
theorem arrow_forces_nothing : ¬ Forces (fun _ => ∃ f : Nat → Nat, ∀ a, f a = a) :=
  keyless_forces_nothing _ arrow_keyless

/-- The free basis holds, and a fold-closed world failing the hypothesis exists. -/
theorem free_basis_coexists_with_offline_world :
    (∀ p q : Nat, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) ∧
    ∃ Z, FoldClosed Z ∧ ¬ RH Z :=
  ⟨prime_freedom_independent, W2, W2_closed, W2_not_rh⟩

/-- An off-line point folds to a distinct off-line point, which no point registers to. -/
theorem fold_off_line_stays_off (z : Pt) (h : ¬ onLine z) :
    ¬ onLine (fold z) ∧ fold z ≠ reg z ∧ fold z ≠ z :=
  ⟨(fold_preserves_offline z).mpr h,
   fun e => unicorn_never_registered (fold z) ((fold_preserves_offline z).mpr h) z e.symm,
   fold_ne_of_offline z h⟩

/-! ## X · The explicit formula as a structure; least erasure is Weil positivity -/

structure ExplicitFormula where
  /-- The value type of the two sides, with its order and its zero. -/
  V : Type
  le : V → V → Prop
  zero : V
  /-- The admissible test functions, their adjoint g ↦ g~, and their convolution. -/
  T : Type
  adj : T → T
  conv : T → T → T
  /-- The arithmetic side: the archimedean term with the sum over the primes. -/
  primeSide : T → V
  /-- The zero side: the sum over the zeros. -/
  zeroSide : T → V
  /-- The zeros, as a world on the chart. -/
  zeros : World
  /-- The explicit formula: the zero side of every test function equals its arithmetic side. Carried
    as a hypothesis (Guinand 1948; Weil 1952). -/
  identity : ∀ g, zeroSide g = primeSide g
  /-- Weil's criterion: the arithmetic side is non-negative on every g ⋆ g̃ exactly when the zeros
    lie on the line. Carried as a hypothesis (Weil 1952; Bombieri 2000). -/
  positivity_iff_line : (∀ g, le zero (primeSide (conv g (adj g)))) ↔ RH zeros

/-- Weil positivity, stated on the prime side. -/
def WeilPositive (E : ExplicitFormula) : Prop :=
  ∀ g, E.le E.zero (E.primeSide (E.conv g (E.adj g)))

/-- Through the identity, positivity reads the same on the zero side. -/
theorem positivity_on_zero_side (E : ExplicitFormula) :
    WeilPositive E ↔ ∀ g, E.le E.zero (E.zeroSide (E.conv g (E.adj g))) := by
  constructor
  · intro h g
    rw [E.identity]
    exact h g
  · intro h g
    rw [← E.identity]
    exact h g

/-- Least erasure of the zeros of an explicit formula is Weil positivity of its arithmetic side. -/
theorem least_erasure_is_positivity (E : ExplicitFormula) :
    LeastErasure E.zeros ↔ WeilPositive E :=
  (least_erasure_is_the_value E.zeros).trans E.positivity_iff_line.symm

/-- A self-grounding supply of Weil positivity exists exactly when the zeros lie on the line. -/
theorem prime_witness_iff (E : ExplicitFormula) :
    (∃ G : SelfGrounding (WeilPositive E), Nonempty G.Act) ↔ RH E.zeros :=
  (supply_iff (WeilPositive E)).trans E.positivity_iff_line

/-- Weil positivity implies the hypothesis for the zeros of the explicit formula. -/
theorem rh_from_prime_witness (E : ExplicitFormula) (h : WeilPositive E) : RH E.zeros :=
  E.positivity_iff_line.mp h

/-- The positive instance: one test function, arithmetic side zero, zeros on the line. -/
def positiveInstance : ExplicitFormula where
  V := Int
  le := fun a b => a ≤ b
  zero := 0
  T := Unit
  adj := id
  conv := fun _ _ => ()
  primeSide := fun _ => 0
  zeroSide := fun _ => 0
  zeros := W1
  identity := fun _ => rfl
  positivity_iff_line := ⟨fun _ => W1_rh, fun _ _ => Int.le_refl 0⟩

/-- The negative instance: one test function, arithmetic side minus one, zeros off the line. -/
def negativeInstance : ExplicitFormula where
  V := Int
  le := fun a b => a ≤ b
  zero := 0
  T := Unit
  adj := id
  conv := fun _ _ => ()
  primeSide := fun _ => -1
  zeroSide := fun _ => -1
  zeros := W2
  identity := fun _ => rfl
  positivity_iff_line :=
    ⟨fun h => absurd (h ()) (by decide : ¬ ((0 : Int) ≤ -1)), fun h => absurd h W2_not_rh⟩

/-- Two explicit formulas satisfy every field, one positive with its zeros on the line and one not
    positive with its zeros off the line: no field decides positivity. -/
theorem positivity_is_keyed : WeilPositive positiveInstance ∧ ¬ WeilPositive negativeInstance :=
  ⟨fun _ => Int.le_refl 0, fun h => absurd (h ()) (by decide : ¬ ((0 : Int) ≤ -1))⟩

/-- The free basis holds in both instances. -/
theorem freedom_does_not_pick_the_sign :
    (∀ p q : Nat, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) ∧
    WeilPositive positiveInstance ∧ ¬ WeilPositive negativeInstance :=
  ⟨prime_freedom_independent, positivity_is_keyed⟩

/-- Section X, whole: the free basis; least erasure as the hypothesis and as positivity; the block;
    keyless premises forcing nothing; positivity keyed. -/
theorem prime_witness_ledger :
    (∀ f g : Nat → Int, CompletelyAdditive f → CompletelyAdditive g →
      (∀ p, isPrime p → f p = g p) → ∀ n, 0 < n → f n = g n) ∧
    (∀ p q : Nat, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) ∧
    (∀ Z : World, LeastErasure Z ↔ RH Z) ∧
    (∀ E : ExplicitFormula, LeastErasure E.zeros ↔ WeilPositive E) ∧
    (∀ g : World → Prop, RespectsRecord g → ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z)) ∧
    (¬ Forces (fun _ => ∃ p, isPrime p)) ∧
    (¬ Forces (fun _ => ∀ p q, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0)) ∧
    (¬ Forces (fun _ => ∃ f : Nat → Nat, ∀ a, f a = a)) ∧
    (WeilPositive positiveInstance ∧ ¬ WeilPositive negativeInstance) :=
  ⟨determined_by_primes, prime_freedom_independent, least_erasure_is_the_value,
   least_erasure_is_positivity, unicorn_block, primes_exist_forces_nothing,
   prime_freedom_forces_nothing, arrow_forces_nothing, positivity_is_keyed⟩

/-! ## XI · The posit as a structure field -/

/-- A zero set with its fold-closure and the one posit, least erasure. -/
structure ActualZeros where
  /-- The zero set, as a world on the chart. -/
  zeros : World
  /-- The zero set is fold-closed (the functional equation, Riemann 1859). -/
  fold_closed : FoldClosed zeros
  /-- The posit: least erasure of the zero set. By least_erasure_is_the_value this field is the
    hypothesis. -/
  supply : LeastErasure zeros

/-- From the posit, the hypothesis. -/
theorem rh_from_the_act (A : ActualZeros) : RH A.zeros :=
  (least_erasure_is_the_value A.zeros).mp A.supply

/-- The type of the posit is equivalent to the hypothesis. -/
theorem posit_is_the_conclusion (A : ActualZeros) : LeastErasure A.zeros ↔ RH A.zeros :=
  least_erasure_is_the_value A.zeros

/-- From the posit: the line, least erasure, every zero fixed by the fold and by registration, and
    no off-line orbit. -/
theorem rh_ground_closure_complete (A : ActualZeros) :
    RH A.zeros ∧ LeastErasure A.zeros ∧ (∀ z, A.zeros z → fold z = z) ∧
    (∀ z, A.zeros z → reg z = z) ∧ ¬ Left A.zeros :=
  ⟨rh_from_the_act A, A.supply,
   fun z hz => (fold_fixed_iff z).mpr (rh_from_the_act A z hz),
   fun z hz => reg_fixes_line z (rh_from_the_act A z hz),
   (rh_iff_no_left A.zeros A.fold_closed).mp (rh_from_the_act A)⟩

/-- An explicit formula for fold-closed zeros, with positivity posited. -/
structure PrimeAct where
  E : ExplicitFormula
  fold_closed : FoldClosed E.zeros
  /-- The posit on the prime side: Weil positivity. -/
  positive : WeilPositive E

/-- A prime act is a least-erasure act. -/
def PrimeAct.toActual (P : PrimeAct) : ActualZeros :=
  ⟨P.E.zeros, P.fold_closed, (least_erasure_is_positivity P.E).mpr P.positive⟩

/-- From positivity posited, the hypothesis. -/
theorem rh_from_prime_act (P : PrimeAct) : RH P.E.zeros := rh_from_the_act P.toActual

/-- For an explicit formula with fold-closed zeros, a positivity posit exists exactly when a
    least-erasure posit exists for its zeros. -/
theorem acts_are_one (E : ExplicitFormula) (hF : FoldClosed E.zeros) :
    (∃ P : PrimeAct, P.E = E) ↔ ∃ A : ActualZeros, A.zeros = E.zeros := by
  constructor
  · intro ⟨P, hP⟩
    subst hP
    exact ⟨P.toActual, rfl⟩
  · intro ⟨A, hA⟩
    refine ⟨⟨E, hF, (least_erasure_is_positivity E).mp ?_⟩, rfl⟩
    rw [← hA]
    exact A.supply


/-! ## XII · The block with no axiom: the pair world written out -/

/-- The pair world at offset one, written out. -/
abbrev W2f : World := fun z => z = ⟨0, 14⟩ ∨ z = ⟨2, 14⟩

theorem W2f_closed : FoldClosed W2f := by
  intro z hz
  rcases hz with h | h
  · subst h; exact Or.inr rfl
  · subst h; exact Or.inl rfl

theorem W2f_not_rh : ¬ RH W2f :=
  fun h => absurd (h ⟨0, 14⟩ (Or.inl rfl)) (by decide : ¬ ((0 : Int) = 1))

theorem same_record_f : SameRecord W1 W2f := by
  intro r
  constructor
  · intro ⟨s, hs, hr⟩
    have h : s = ⟨1, 14⟩ := hs
    subst h
    exact ⟨⟨0, 14⟩, Or.inl rfl, hr⟩
  · intro ⟨s, hs, hr⟩
    rcases hs with h | h <;> subst h <;> exact ⟨⟨1, 14⟩, rfl, hr⟩

/-- record_decides_nothing, with no axiom. -/
theorem record_decides_nothing_free (g : World → Prop) (hg : RespectsRecord g) :
    ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z) := fun h =>
  W2f_not_rh ((h W2f W2f_closed).mp ((hg W1 W2f same_record_f).mp ((h W1 W1_closed).mpr W1_rh)))

/-- unicorn_block, with no axiom. -/
theorem unicorn_block_free (g : World → Prop) (hg : RespectsRecord g) :
    ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z) := record_decides_nothing_free g hg

/-- keyless_forces_nothing, with no axiom. -/
theorem keyless_forces_nothing_free (A : World → Prop) (hA : Keyless A) : ¬ Forces A :=
  fun h => W2f_not_rh (h W2f W2f_closed (hA W2f))

/-- arrow_forces_nothing, with no axiom. -/
theorem arrow_forces_nothing_free : ¬ Forces (fun _ => ∃ f : Nat → Nat, ∀ a, f a = a) :=
  keyless_forces_nothing_free _ arrow_keyless

/-- least_erasure_reads_past_the_record, with no axiom. -/
theorem least_erasure_reads_past_the_record_free : ¬ RespectsRecord LeastErasure := fun h =>
  W2f_not_rh ((least_erasure_is_the_value W2f).mp
    ((h W1 W2f same_record_f).mp ((least_erasure_is_the_value W1).mpr W1_rh)))

/-- The negative instance on the explicit pair world. -/
def negativeInstanceF : ExplicitFormula where
  V := Int
  le := fun a b => a ≤ b
  zero := 0
  T := Unit
  adj := id
  conv := fun _ _ => ()
  primeSide := fun _ => -1
  zeroSide := fun _ => -1
  zeros := W2f
  identity := fun _ => rfl
  positivity_iff_line :=
    ⟨fun h => absurd (h ()) (by decide : ¬ ((0 : Int) ≤ -1)), fun h => absurd h W2f_not_rh⟩

/-- positivity_is_keyed, with no axiom. -/
theorem positivity_is_keyed_free : WeilPositive positiveInstance ∧ ¬ WeilPositive negativeInstanceF :=
  ⟨fun _ => Int.le_refl 0, fun h => absurd (h ()) (by decide : ¬ ((0 : Int) ≤ -1))⟩


/-! ## XIII · The hypothesis on the supplied bit -/

/-- For every explicit formula, Weil positivity is equivalent to the hypothesis for its zeros. -/
theorem spend_is_the_line (E : ExplicitFormula) : WeilPositive E ↔ RH E.zeros :=
  E.positivity_iff_line

/-- The free basis holds, and an explicit formula exists on which positivity fails: the free basis
    and positivity are distinct. -/
theorem spend_is_not_the_free_basis :
    (∀ p q : Nat, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) ∧
    ∃ E : ExplicitFormula, ¬ WeilPositive E :=
  ⟨prime_freedom_independent, negativeInstanceF, positivity_is_keyed_free.2⟩

/-- From positivity posited: the line, least erasure, positivity, every zero fixed by the fold and
    by registration, and no off-line orbit. -/
theorem rh_on_the_spent_bit (P : PrimeAct) :
    RH P.E.zeros ∧ LeastErasure P.E.zeros ∧ WeilPositive P.E ∧
    (∀ z, P.E.zeros z → fold z = z) ∧ (∀ z, P.E.zeros z → reg z = z) ∧ ¬ Left P.E.zeros :=
  let c := rh_ground_closure_complete P.toActual
  ⟨c.1, c.2.1, P.positive, c.2.2.1, c.2.2.2.1, c.2.2.2.2⟩

/-- Sections X to XIII, whole. -/
theorem prime_arc_sealed :
    (∀ f g : Nat → Int, CompletelyAdditive f → CompletelyAdditive g →
      (∀ p, isPrime p → f p = g p) → ∀ n, 0 < n → f n = g n) ∧
    (∀ p q : Nat, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) ∧
    (∀ Z : World, LeastErasure Z ↔ RH Z) ∧
    (∀ E : ExplicitFormula, LeastErasure E.zeros ↔ WeilPositive E) ∧
    (∀ E : ExplicitFormula, WeilPositive E ↔ RH E.zeros) ∧
    (∀ g : World → Prop, RespectsRecord g → ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z)) ∧
    (∀ A : World → Prop, Keyless A → ¬ Forces A) ∧
    (WeilPositive positiveInstance ∧ ¬ WeilPositive negativeInstanceF) ∧
    (∃ E : ExplicitFormula, ¬ WeilPositive E) ∧
    (∀ P : PrimeAct, RH P.E.zeros) :=
  ⟨determined_by_primes, prime_freedom_independent, least_erasure_is_the_value,
   least_erasure_is_positivity, spend_is_the_line, record_decides_nothing_free,
   keyless_forces_nothing_free, positivity_is_keyed_free, spend_is_not_the_free_basis.2,
   rh_from_prime_act⟩


/-! ## XIV · The weakest forcing premise; the Li and de Bruijn–Newman coordinates -/

/-- The hypothesis forces the line, and every premise that forces the line implies the hypothesis
    on every fold-closed world. -/
theorem rh_is_the_weakest_forcing_premise :
    Forces RH ∧ ∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → RH Z :=
  ⟨fun _ _ h => h, fun A hA Z hZ ha => hA Z hZ ha⟩

/-- A premise that holds at some fold-closed world where the hypothesis fails does not force. -/
theorem weaker_never_forces (A : World → Prop) (Z : World) (hZ : FoldClosed Z) (ha : A Z)
    (hn : ¬ RH Z) : ¬ Forces A :=
  fun h => hn (h Z hZ ha)

/-- A premise true on W2f forces nothing. -/
theorem weaker_at_the_twin_never_forces (A : World → Prop) (ha : A W2f) : ¬ Forces A :=
  weaker_never_forces A W2f W2f_closed ha W2f_not_rh

/-- A zero set with the signs of its Li coefficients: the hypothesis holds exactly when every
    coefficient is non-negative. Carried as a hypothesis (Li 1997; Bombieri and Lagarias 1999). -/
structure LiStream where
  zeros : World
  nonneg : Nat → Prop
  li : RH zeros ↔ ∀ n, 1 ≤ n → nonneg n

theorem rh_from_li (L : LiStream) (h : ∀ n, 1 ≤ n → L.nonneg n) : RH L.zeros := L.li.mpr h

theorem li_is_the_bit_stream (L : LiStream) : (∀ n, 1 ≤ n → L.nonneg n) ↔ RH L.zeros := L.li.symm

/-- For every N there is a Li stream non-negative below N whose zero set lies off the line. -/
theorem li_prefix_never_forces (N : Nat) :
    ∃ L : LiStream, (∀ n, n < N → L.nonneg n) ∧ ¬ RH L.zeros :=
  ⟨⟨W2f, fun n => n < N,
    ⟨fun h => absurd h W2f_not_rh,
     fun h => absurd (h (N + 1) (Nat.succ_pos N))
       (fun c => Nat.lt_irrefl N (Nat.lt_trans (Nat.lt_succ_self N) c))⟩⟩,
   fun _ h => h, W2f_not_rh⟩

/-- The de Bruijn–Newman constant over an ordered type: Λ and its zero, the order's reflexivity and
    antisymmetry, 0 ≤ Λ (Rodgers and Tao 2020), and the hypothesis exactly when Λ = 0 (Newman
    1976). Every field is carried as a hypothesis. -/
structure DBN (V : Type) [LE V] where
  zeros : World
  lam : V
  zero : V
  refl : ∀ a : V, a ≤ a
  antisymm : ∀ a b : V, a ≤ b → b ≤ a → a = b
  lower : zero ≤ lam
  rh_iff : RH zeros ↔ lam = zero

/-- From Λ ≤ 0 and the cited 0 ≤ Λ, the hypothesis. -/
theorem rh_from_the_sign {V : Type} [LE V] (D : DBN V) (h : D.lam ≤ D.zero) : RH D.zeros :=
  D.rh_iff.mpr (D.antisymm _ _ h D.lower)

/-- The hypothesis is equivalent to Λ ≤ 0. -/
theorem rh_iff_the_sign {V : Type} [LE V] (D : DBN V) : RH D.zeros ↔ D.lam ≤ D.zero :=
  ⟨fun h => by rw [D.rh_iff.mp h]; exact D.refl _, rh_from_the_sign D⟩

/-- On one zero set, Weil positivity and Λ ≤ 0 are equivalent. -/
theorem spends_are_one {V : Type} [LE V] (P : PrimeAct) (D : DBN V) (same : D.zeros = P.E.zeros) :
    (D.lam ≤ D.zero) ↔ WeilPositive P.E :=
  (rh_iff_the_sign D).symm.trans (by rw [same]; exact (spend_is_the_line P.E).symm)

/-- Λ = 0 is realized over W1 and Λ = 1 over W2f: the sign is a property of the world. -/
theorem sign_realized_both_ways :
    (∃ D : DBN Int, D.zeros = W1 ∧ D.lam = D.zero) ∧
    (∃ D : DBN Int, D.zeros = W2f ∧ ¬ D.lam ≤ D.zero) :=
  ⟨⟨⟨W1, 0, 0, fun a => Int.le_refl a, fun a b => Int.le_antisymm, Int.le_refl 0,
      ⟨fun _ => rfl, fun _ => W1_rh⟩⟩, rfl, rfl⟩,
   ⟨⟨W2f, 1, 0, fun a => Int.le_refl a, fun a b => Int.le_antisymm, by decide,
      ⟨fun h => absurd h W2f_not_rh, fun h => absurd h (by decide)⟩⟩, rfl, by decide⟩⟩

/-- A self-grounding supply of 0 < 1, with the unit act. -/
def rootSelfGrounding : SelfGrounding ((0 : Int) < 1) := ⟨Unit, fun _ => by decide⟩

theorem root_has_an_act : Nonempty rootSelfGrounding.Act := ⟨()⟩

/-- No self-grounding supply of the hypothesis on W2f has an act: W2f fails the hypothesis. -/
theorem line_not_self_grounding : ¬ ∃ G : SelfGrounding (RH W2f), Nonempty G.Act :=
  fun ⟨G, ⟨a⟩⟩ => W2f_not_rh (G.spend a)

/-- Section XIV, whole. -/
theorem the_vestigial_posit :
    (Forces RH ∧ ∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → RH Z) ∧
    (∀ A : World → Prop, A W2f → ¬ Forces A) ∧
    (∀ L : LiStream, (∀ n, 1 ≤ n → L.nonneg n) ↔ RH L.zeros) ∧
    (∀ N, ∃ L : LiStream, (∀ n, n < N → L.nonneg n) ∧ ¬ RH L.zeros) ∧
    (∀ (V : Type) [LE V] (D : DBN V), RH D.zeros ↔ D.lam ≤ D.zero) ∧
    ((∃ D : DBN Int, D.zeros = W1 ∧ D.lam = D.zero) ∧
      (∃ D : DBN Int, D.zeros = W2f ∧ ¬ D.lam ≤ D.zero)) ∧
    (∀ (V : Type) [LE V] (P : PrimeAct) (D : DBN V), D.zeros = P.E.zeros →
      ((D.lam ≤ D.zero) ↔ WeilPositive P.E)) ∧
    Nonempty rootSelfGrounding.Act ∧
    ¬ ∃ G : SelfGrounding (RH W2f), Nonempty G.Act :=
  ⟨rh_is_the_weakest_forcing_premise, weaker_at_the_twin_never_forces, li_is_the_bit_stream,
   li_prefix_never_forces, fun _ _ D => rh_iff_the_sign D, sign_realized_both_ways,
   fun _ _ P D same => spends_are_one P D same, root_has_an_act, line_not_self_grounding⟩


/-! ## XV · Four faces in time, exactly one keyed -/

/-- A world in time: the zero set at each instant. -/
abbrev TWorld := Nat → World

/-- The same locus at every instant: the line. -/
def SameLocus (W : TWorld) : Prop := ∀ t z, W t z → (fold z = z ↔ onLine z)
/-- The fold acts at every instant. -/
def FoldInvT (W : TWorld) : Prop := ∀ t, FoldClosed (W t)
/-- The record at every instant lands on the line and forgets the side. -/
def RecordT (W : TWorld) : Prop := ∀ t z, W t z → onLine (reg z) ∧ reg (fold z) = reg z
/-- The arrow at every instant: the free bit is present. -/
def ArrowT (_W : TWorld) : Prop := ∀ _t : Nat, ∃ f : Nat → Nat, ∀ a, f a = a
/-- Timeless: whether the zeros sit on the line does not vary in time. -/
def TimelessT (W : TWorld) : Prop := ∀ t s, RH (W t) ↔ RH (W s)
/-- Bound: the closure at every instant. -/
def BoundT (W : TWorld) : Prop := ∀ t, RH (W t)

/-- The on-line world, constant in time, and the twin, constant in time. -/
abbrev WOn : TWorld := fun _ => W1
abbrev WTwin : TWorld := fun _ => W2f

/-- The fold face holds on every world in time. -/
theorem fold_face_keyless (W : TWorld) : SameLocus W := fun _ z _ => fold_fixed_iff z
theorem fold_face_on_twin : FoldInvT WTwin := fun _ => W2f_closed
theorem fold_face_on_line : FoldInvT WOn := fun _ => W1_closed

/-- The record face holds on every world in time. -/
theorem record_face_keyless (W : TWorld) : RecordT W := fun _ _ _ => ⟨rfl, rfl⟩

/-- The arrow face holds on every world in time. -/
theorem arrow_face_keyless (W : TWorld) : ArrowT W := fun _ => arrow_exists Nat

/-- The closure face holds on WOn. -/
theorem closure_face_on_line : BoundT WOn := fun _ => W1_rh
theorem closure_face_fails_on_twin : ¬ BoundT WTwin := fun h => W2f_not_rh (h 0)

/-- WTwin carries the fold, the record and the arrow at every instant and is timeless, and it is
    not bound: of the four faces only the closure is keyed. -/
theorem exactly_one_face_is_keyed :
    (SameLocus WTwin ∧ FoldInvT WTwin ∧ RecordT WTwin ∧ ArrowT WTwin ∧ TimelessT WTwin) ∧
    ¬ BoundT WTwin ∧
    (SameLocus WOn ∧ FoldInvT WOn ∧ RecordT WOn ∧ ArrowT WOn ∧ TimelessT WOn) ∧ BoundT WOn :=
  ⟨⟨fold_face_keyless _, fold_face_on_twin, record_face_keyless _, arrow_face_keyless _,
    fun _ _ => Iff.rfl⟩, closure_face_fails_on_twin,
   ⟨fold_face_keyless _, fold_face_on_line, record_face_keyless _, arrow_face_keyless _,
    fun _ _ => Iff.rfl⟩, closure_face_on_line⟩

/-- The arrow, the fold and the record hold on WTwin at every instant while the line fails there:
    the arrow is not the line. -/
theorem arrow_is_not_the_line :
    ArrowT WTwin ∧ FoldInvT WTwin ∧ RecordT WTwin ∧ ¬ BoundT WTwin :=
  ⟨arrow_face_keyless _, fold_face_on_twin, record_face_keyless _, closure_face_fails_on_twin⟩

/-- A timeless world is bound exactly when it is bound at instant 0. -/
theorem template_binds_iff_seed (W : TWorld) (u : TimelessT W) : BoundT W ↔ RH (W 0) :=
  ⟨fun h => h 0, fun s t => (u 0 t).mp s⟩

/-- For a timeless world, bound at instant 0 is the hypothesis at instant 0; WTwin has the three
    keyless faces and fails the hypothesis at every instant. -/
theorem the_seed_is_the_spend :
    (∀ W : TWorld, TimelessT W → (BoundT W ↔ RH (W 0))) ∧
    TimelessT WTwin ∧ ArrowT WTwin ∧ FoldInvT WTwin ∧ RecordT WTwin ∧ ¬ RH (WTwin 0) :=
  ⟨template_binds_iff_seed, fun _ _ => Iff.rfl, arrow_face_keyless _, fold_face_on_twin,
   record_face_keyless _, W2f_not_rh⟩

/-- Section XV, whole. -/
theorem the_template_plugged_in :
    ((SameLocus WTwin ∧ FoldInvT WTwin ∧ RecordT WTwin ∧ ArrowT WTwin ∧ TimelessT WTwin) ∧
      ¬ BoundT WTwin ∧
      (SameLocus WOn ∧ FoldInvT WOn ∧ RecordT WOn ∧ ArrowT WOn ∧ TimelessT WOn) ∧ BoundT WOn) ∧
    (ArrowT WTwin ∧ FoldInvT WTwin ∧ RecordT WTwin ∧ ¬ BoundT WTwin) ∧
    (∀ W : TWorld, TimelessT W → (BoundT W ↔ RH (W 0))) ∧
    (∀ W : TWorld, BoundT W → ∀ t, LeastErasure (W t)) :=
  ⟨exactly_one_face_is_keyed, arrow_is_not_the_line, template_binds_iff_seed,
   fun W h t => (least_erasure_is_the_value (W t)).mpr (h t)⟩


/-! ## XVI · The eigenstructure of the fold: the side bit and its calibration -/

/-- The displacement x − 1. -/
def oddPart (z : Pt) : Int := z.x - 1

/-- The fold negates the displacement and fixes the height. -/
theorem fold_negates_odd (z : Pt) : oddPart (fold z) = - oddPart z := by
  show 2 - z.x - 1 = -(z.x - 1)
  rw [Int.neg_sub, Int.sub_sub, Int.add_comm, ← Int.sub_sub]; rfl

theorem fold_keeps_even (z : Pt) : (fold z).t = z.t := rfl

/-- The fold acts as −1 on the displacement. -/
theorem residence_orientation_reversing (z : Pt) : oddPart (fold z) = (-1) * oddPart z := by
  rw [fold_negates_odd, Int.neg_one_mul]

/-- Registration sends the displacement to 0, keeps the height, and is idempotent. -/
theorem reg_kills_odd (_z : Pt) : oddPart (reg _z) = 0 := rfl
theorem reg_keeps_even (z : Pt) : (reg z).t = z.t := rfl
theorem reg_idempotent (z : Pt) : reg (reg z) = reg z := rfl

/-- A point is on the line exactly when its displacement is 0. -/
theorem onLine_iff_odd_zero (z : Pt) : onLine z ↔ oddPart z = 0 := Int.sub_eq_zero.symm

/-- The hypothesis: every zero has displacement 0. -/
theorem rh_iff_even_eigenspace (Z : World) : RH Z ↔ ∀ z, Z z → oddPart z = 0 :=
  ⟨fun h z hz => (onLine_iff_odd_zero z).mp (h z hz), fun h z hz => (onLine_iff_odd_zero z).mpr (h z hz)⟩

/-- Every function of the registered point takes one value on a point and its fold-partner. -/
theorem record_blind_to_odd {β : Type} (g : Pt → β) (z : Pt) : g (reg (fold z)) = g (reg z) := rfl

/-- Off the line a point and its fold-partner have opposite nonzero displacements. -/
theorem odd_pair_opposite (z : Pt) (h : ¬ onLine z) :
    oddPart (fold z) = - oddPart z ∧ oddPart z ≠ 0 :=
  ⟨fold_negates_odd z, fun e => h ((onLine_iff_odd_zero z).mpr e)⟩

/-- The side bit: whether the displacement is negative. -/
def side (z : Pt) : Bool := decide (oddPart z < 0)

/-- Off the line the fold flips the side bit. -/
theorem side_odd_off_line (z : Pt) (h : ¬ onLine z) : side (fold z) = !side z := by
  have hne : oddPart z ≠ 0 := (odd_pair_opposite z h).2
  unfold side
  rw [fold_negates_odd]
  exact (Int.decLt (oddPart z) 0).byCases
    (fun hl =>
      have hp : ¬ (-(oddPart z) < 0) := fun c => Int.lt_irrefl _ (Int.lt_trans c (Int.neg_pos_of_neg hl))
      by rw [decide_eq_true hl, decide_eq_false hp]; rfl)
    (fun hr =>
      have hp : -(oddPart z) < 0 :=
        Int.neg_neg_of_pos (Int.lt_iff_le_and_ne.mpr ⟨Int.not_lt.mp hr, Ne.symm hne⟩)
      by rw [decide_eq_false hr, decide_eq_true hp]; rfl)

/-- A function invariant under the fold differs from any function that the fold flips at some
    point. -/
theorem wall_on_the_chart (f d : Pt → Bool) (z : Pt) (he : ∀ w, f (fold w) = f w)
    (ho : d (fold z) ≠ d z) : f ≠ d := by
  intro h; subst h; exact ho (he z)

/-- No function of the registered point equals the side bit at an off-line point. -/
theorem record_never_reads_the_side (g : Pt → Bool) (z : Pt) (h : ¬ onLine z) :
    (fun w => g (reg w)) ≠ side :=
  wall_on_the_chart (fun w => g (reg w)) side z (fun _ => rfl)
    (by rw [side_odd_off_line z h]; cases side z <;> decide)

/-- Given the side bit at an off-line point, any function flipped by the fold at that point is
    fixed on the orbit by one calibration bit, which exists and is unique. -/
theorem colocation_is_a_calibration (d : Pt → Bool) (z : Pt) (h : ¬ onLine z)
    (hd : d (fold z) = !d z) :
    ∃ c : Bool, (d z = xor (side z) c ∧ d (fold z) = xor (side (fold z)) c) ∧
      ∀ c', (d z = xor (side z) c' ∧ d (fold z) = xor (side (fold z)) c') → c' = c := by
  have hs := side_odd_off_line z h
  refine ⟨xor (d z) (side z),
    ⟨by cases side z <;> cases d z <;> rfl, by rw [hs, hd]; cases side z <;> cases d z <;> rfl⟩, ?_⟩
  intro c' hc; obtain ⟨h1, -⟩ := hc
  generalize hsx : side z = sv at h1; generalize hdx : d z = dv at h1
  cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)

/-- Both calibration values are realized off the line, by the side bit and by its complement. -/
theorem calibration_realized_both_ways (z : Pt) (h : ¬ onLine z) :
    (side (fold z) = !side z ∧ side z = xor (side z) false) ∧
    ((!side (fold z)) = !(!side z) ∧ (!side z) = xor (side z) true) :=
  ⟨⟨side_odd_off_line z h, by cases side z <;> rfl⟩,
   ⟨by rw [side_odd_off_line z h], by cases side z <;> rfl⟩⟩

/-- A proposition implied by its own negation. -/
def SelfVerifyingP (P : Prop) : Prop := ¬P → P

/-- The hypothesis on a world implies its self-verification there. -/
theorem value_is_recursion (Z : World) (h : RH Z) : SelfVerifyingP (RH Z) := fun _ => h
theorem recursion_is_value (Z : World) (h : SelfVerifyingP (RH Z)) : ¬¬ RH Z := fun n => n (h n)

/-- Self-verification of the hypothesis holds on W1 and fails on W2f. -/
theorem recursion_on_the_line : SelfVerifyingP (RH W1) := fun _ => W1_rh
theorem recursion_fails_on_the_twin : ¬ SelfVerifyingP (RH W2f) := fun h => W2f_not_rh (h W2f_not_rh)

/-- Self-verification of 0 < 1. -/
theorem root_recursion : SelfVerifyingP ((0 : Int) < 1) := fun _ => by decide

/-- Least erasure on a world implies self-verification of the hypothesis there, and conversely up
    to double negation. -/
theorem least_erasure_is_the_recursion (Z : World) :
    (LeastErasure Z → SelfVerifyingP (RH Z)) ∧ (SelfVerifyingP (RH Z) → ¬¬ LeastErasure Z) :=
  ⟨fun h => value_is_recursion Z ((least_erasure_is_the_value Z).mp h),
   fun h n => recursion_is_value Z h (fun r => n ((least_erasure_is_the_value Z).mpr r))⟩

/-- Section XVI, whole. -/
theorem the_mirror_at_minus_one :
    (∀ z, oddPart (fold z) = (-1) * oddPart z ∧ (fold z).t = z.t) ∧
    (∀ z, oddPart (reg z) = 0 ∧ (reg z).t = z.t ∧ reg (reg z) = reg z) ∧
    (∀ Z : World, RH Z ↔ ∀ z, Z z → oddPart z = 0) ∧
    (∀ (g : Pt → Bool) (z : Pt), ¬ onLine z → (fun w => g (reg w)) ≠ side) ∧
    (∀ (d : Pt → Bool) (z : Pt), ¬ onLine z → d (fold z) = !d z →
      ∃ c : Bool, (d z = xor (side z) c ∧ d (fold z) = xor (side (fold z)) c) ∧
        ∀ c', (d z = xor (side z) c' ∧ d (fold z) = xor (side (fold z)) c') → c' = c) ∧
    (SelfVerifyingP (RH W1) ∧ ¬ SelfVerifyingP (RH W2f) ∧ SelfVerifyingP ((0 : Int) < 1)) ∧
    (∀ Z : World, (LeastErasure Z → SelfVerifyingP (RH Z)) ∧ (SelfVerifyingP (RH Z) → ¬¬ LeastErasure Z)) :=
  ⟨fun z => ⟨residence_orientation_reversing z, fold_keeps_even z⟩,
   fun z => ⟨reg_kills_odd z, reg_keeps_even z, reg_idempotent z⟩,
   rh_iff_even_eigenspace, record_never_reads_the_side, colocation_is_a_calibration,
   ⟨recursion_on_the_line, recursion_fails_on_the_twin, root_recursion⟩,
   least_erasure_is_the_recursion⟩

/-! ## XVII · Admissible coalitions, the certified height, the heat flow, the Liouville arrow, five readings, the reader index -/

/-! ### XVII.a · Admissible coalitions -/

/-- A premise is admissible when it is keyless or a reading of the record. -/
def Admissible (A : World → Prop) : Prop := Keyless A ∨ RespectsRecord A

/-- An admissible premise that holds on W1 holds on W2f. -/
theorem admissible_transfers (A : World → Prop) (h : Admissible A) (h1 : A W1) : A W2f := by
  rcases h with k | r
  · exact k W2f
  · exact (r W1 W2f same_record_f).mp h1

/-- Three admissible premises true on W1 are true on W2f, so their conjunction forces nothing. -/
theorem no_admissible_triad_forces (A B C : World → Prop)
    (hA : Admissible A) (hB : Admissible B) (hC : Admissible C) (h : A W1 ∧ B W1 ∧ C W1) :
    ¬ Forces (fun Z => A Z ∧ B Z ∧ C Z) :=
  fun f => W2f_not_rh (f W2f W2f_closed
    ⟨admissible_transfers A hA h.1, admissible_transfers B hB h.2.1, admissible_transfers C hC h.2.2⟩)

/-- A list of admissible premises true on W1 forces nothing. -/
theorem no_admissible_coalition_forces (L : List (World → Prop))
    (hL : ∀ A ∈ L, Admissible A) (h1 : ∀ A ∈ L, A W1) :
    ¬ Forces (fun Z => ∀ A ∈ L, A Z) :=
  fun f => W2f_not_rh (f W2f W2f_closed (fun A hA => admissible_transfers A (hL A hA) (h1 A hA)))

/-- Least erasure is not admissible: it fails on W2f and is not a reading of the record. -/
theorem spend_is_not_admissible : ¬ Admissible LeastErasure := by
  intro h
  rcases h with k | r
  · exact W2f_not_rh ((least_erasure_is_the_value W2f).mp (k W2f))
  · exact least_erasure_reads_past_the_record_free r

/-- Three predicates on a point: the freedom axis, always true; the seat axis, the point is fixed
    by the fold; the collapse axis, the displacement equals its own negative. -/
def freedomAxis (_ : Pt) : Prop := True
def ramAxis (z : Pt) : Prop := fold z = z
def collapseAxis (z : Pt) : Prop := oddPart z = - oddPart z

/-- All three axes hold at a point exactly when it lies on the line. -/
theorem three_axis_lock (z : Pt) : (freedomAxis z ∧ ramAxis z ∧ collapseAxis z) ↔ onLine z := by
  constructor
  · intro ⟨_, h, _⟩
    exact (fold_fixed_iff z).mp h
  · intro h
    refine ⟨trivial, (fold_fixed_iff z).mpr h, ?_⟩
    have e : oddPart z = 0 := (onLine_iff_odd_zero z).mp h
    unfold collapseAxis
    omega

/-- The freedom axis holds at an off-line point. -/
theorem freedom_alone_open : freedomAxis ⟨0, 14⟩ ∧ ¬ onLine ⟨0, 14⟩ :=
  ⟨trivial, by decide⟩

/-! ### XVII.b · The certified height -/

/-- The zeros certified on the line up to height T. -/
def LineBelow (T : Nat) : World := fun z => z.x = 1 ∧ z.t ≤ T
/-- The same zeros, with one off-line pair just above the certified height. -/
def TwinAbove (T : Nat) : World := fun z => (z.x = 1 ∧ z.t ≤ T) ∨ (z = ⟨0, T+1⟩ ∨ z = ⟨2, T+1⟩)

/-- For every T the world certified to T lies on the line, and a fold-closed world agrees with it
    at every height up to T and carries an off-line pair above T. The certificate of Platt and
    Trudgian (2021) to height 3·10¹² is such a T. -/
theorem certified_height_never_forces (T : Nat) :
    RH (LineBelow T) ∧ FoldClosed (TwinAbove T) ∧ ¬ RH (TwinAbove T) ∧
    ∀ z, z.t ≤ T → (TwinAbove T z ↔ LineBelow T z) := by
  refine ⟨fun z hz => hz.1, ?_, ?_, ?_⟩
  · intro z hz
    rcases hz with ⟨h1, h2⟩ | h | h
    · exact Or.inl ⟨show 2 - z.x = 1 by omega, h2⟩
    · subst h
      exact Or.inr (Or.inr rfl)
    · subst h
      exact Or.inr (Or.inl rfl)
  · intro h
    have h0 : (0 : Int) = 1 := h ⟨0, T+1⟩ (Or.inr (Or.inl rfl))
    exact absurd h0 (by decide)
  · intro z hz
    constructor
    · intro h
      rcases h with h | h | h
      · exact h
      · subst h
        have : T + 1 ≤ T := hz
        omega
      · subst h
        have : T + 1 ≤ T := hz
        omega
    · intro h
      exact Or.inl h

/-- Below T the certified world and its twin have the same record. -/
theorem certified_worlds_share_the_record_below (T : Nat) (r : Pt) (hr : r.t ≤ T) :
    recordOf (LineBelow T) r ↔ recordOf (TwinAbove T) r := by
  constructor
  · intro ⟨s, hs, hsr⟩
    exact ⟨s, Or.inl hs, hsr⟩
  · intro ⟨s, hs, hsr⟩
    rcases hs with h | h | h
    · exact ⟨s, h, hsr⟩
    · subst h
      have e : (T + 1 : Nat) = r.t := congrArg Pt.t hsr
      omega
    · subst h
      have e : (T + 1 : Nat) = r.t := congrArg Pt.t hsr
      omega

/-! ### XVII.c · The heat flow on polynomials: under ∂ₜH = −∂ₓ²H the constant term of z² + bz + c moves to c − 2t and the discriminant rises by 8t -/

namespace HeatFlow

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  cases Int.le_total 0 x with
  | inl h => exact Int.mul_nonneg h h
  | inr h =>
    have hn : 0 ≤ -x := by omega
    have := Int.mul_nonneg hn hn
    rw [Int.neg_mul_neg] at this
    exact this

theorem cube_diff (u k : Int) :
    u*u*u - (u-k)*(u-k)*(u-k) = 3*(u*u*k) - 3*(u*k*k) + k*k*k := by
  simp only [Int.sub_mul, Int.mul_sub, Int.mul_assoc]
  simp only [Int.mul_comm k u, Int.mul_left_comm k u]
  omega

/-- Discriminant of z² + bz + c. -/
def disc (b c : Int) : Int := b*b - 4*c
/-- The flow on the constant term: exp(−tD²)(z² + bz + c) = z² + bz + (c − 2t). -/
def flowC (c t : Int) : Int := c - 2*t
/-- Real-rooted at time t: the flowed discriminant is nonnegative. -/
def RR (b c t : Int) : Prop := 0 ≤ disc b (flowC c t)
instance (b c t : Int) : Decidable (RR b c t) := inferInstanceAs (Decidable (0 ≤ disc b (flowC c t)))

/-- disc(t) = disc(0) + 8t. -/
theorem disc_flow (b c t : Int) : disc b (flowC c t) = disc b c + 8*t := by
  unfold disc flowC; omega

/-- Real-rootedness is preserved forward in time. -/
theorem forward_preserves (b c s t : Int) (hst : s ≤ t) (h : RR b c s) : RR b c t := by
  unfold RR at *; rw [disc_flow] at *; omega

/-- Every quadratic is real-rooted after some finite time. -/
theorem erasure_finite (b c : Int) : ∃ t, 0 ≤ t ∧ RR b c t :=
  ⟨(disc b c).natAbs, by omega, by unfold RR; rw [disc_flow]; omega⟩

/-- The least erasure time, Λ of the quadratic: 0 if already real-rooted, else ⌈−disc/8⌉. -/
def lam (b c : Int) : Int := if 0 ≤ disc b c then 0 else (7 - disc b c) / 8

theorem lam_nonneg (b c : Int) : 0 ≤ lam b c := by
  unfold lam; split <;> omega

/-- At time Λ the quadratic is real-rooted. -/
theorem real_at_lam (b c : Int) : RR b c (lam b c) := by
  unfold RR lam; rw [disc_flow]; split <;> omega

/-- If Λ > 0, the quadratic is not real-rooted at time Λ − 1. -/
theorem lam_least (b c : Int) (h : 0 < lam b c) : ¬ RR b c (lam b c - 1) := by
  unfold RR; rw [disc_flow]; unfold lam at *; split at * <;> omega

/-- Λ = 0 exactly when the quadratic is real-rooted at time 0. -/
theorem lam_zero_iff_real (b c : Int) : lam b c = 0 ↔ RR b c 0 := by
  unfold RR lam; rw [disc_flow]; split <;> omega

/-- For z² + c the squared imaginary part of the roots is max(c − 2t, 0): de Bruijn's bound holds
    with equality. -/
def imSq (c t : Int) : Int := max (flowC c t) 0
theorem de_bruijn_tight (c t : Int) (ht : 0 ≤ t) : imSq c t = max (imSq c 0 - 2*t) 0 := by
  unfold imSq flowC; omega

/-- For z² + 2k the roots are ±√(2t − 2k): at t = k they meet at 0. -/
def rootSq (c t : Int) : Int := 2*t - c
theorem collision (k t : Int) :
    rootSq (2*k) k = 0 ∧ (t < k → rootSq (2*k) t < 0) ∧ (k < t → 0 < rootSq (2*k) t) ∧
    rootSq (2*k) (t+1) = rootSq (2*k) t + 2 := by
  unfold rootSq; omega

/-- Discriminant of z³ + pz + q. -/
def disc3 (p q : Int) : Int := -4*(p*p*p) - 27*(q*q)
/-- The flow on the linear coefficient: exp(−tD²)(z³ + pz + q) = z³ + (p − 6t)z + q. -/
def flowP (p t : Int) : Int := p - 6*t

/-- One time step raises the cubic discriminant by 72((u − 3)² + 3), u the current linear
    coefficient. -/
theorem disc3_step (p q t : Int) :
    disc3 (flowP p (t+1)) q - disc3 (flowP p t) q = 72*((p - 6*t - 3)*(p - 6*t - 3) + 3) := by
  have key : ∀ u k : Int, u*u*u - (u-k)*(u-k)*(u-k) = 3*(u*u*k) - 3*(u*k*k) + k*k*k := by
    intro u k
    simp only [Int.sub_mul, Int.mul_sub, Int.mul_assoc]
    simp only [Int.mul_comm k u, Int.mul_left_comm k u]
    omega
  have h := key (p - 6*t) 6
  have e0 : flowP p (t+1) = (p - 6*t) - 6 := by unfold flowP; omega
  have e1 : (p - 6*t)*(p - 6*t)*6 = 6*((p - 6*t)*(p - 6*t)) := Int.mul_comm _ _
  have e2 : (p - 6*t)*6*6 = 36*(p - 6*t) := by rw [Int.mul_assoc, Int.mul_comm]; rfl
  have e3 : (p - 6*t - 3)*(p - 6*t - 3) = (p - 6*t)*(p - 6*t) - 6*(p - 6*t) + 9 := by
    generalize p - 6*t = u
    simp only [Int.sub_mul, Int.mul_sub]; rw [Int.mul_comm 3 u]; omega
  have e4 : (6:Int)*6*6 = 216 := by decide
  rw [e1, e2, e4] at h
  unfold disc3; rw [e0, e3]
  have e5 : flowP p t = p - 6*t := rfl
  rw [e5]
  omega

/-- The cubic discriminant strictly increases with time. -/
theorem disc3_strict (p q t : Int) : disc3 (flowP p t) q < disc3 (flowP p (t+1)) q := by
  have h := disc3_step p q t
  have := sq_nonneg (p - 6*t - 3)
  omega

/-- Over any number of steps the cubic discriminant never falls. -/
theorem disc3_monotone_rec (p q : Int) : ∀ n : Nat, disc3 (flowP p 0) q ≤ disc3 (flowP p n) q := by
  intro n
  induction n with
  | zero => exact Int.le_refl _
  | succ n ih =>
    have st := disc3_strict p q (n : Int)
    have e : ((n + 1 : Nat) : Int) = (n : Int) + 1 := by omega
    rw [e]; omega

/-- disc3_monotone_rec, restated. -/
theorem disc3_monotone (p q : Int) (n : Nat) : disc3 (flowP p 0) q ≤ disc3 (flowP p n) q :=
  disc3_monotone_rec p q n

theorem cubic_forward_preserves (p q : Int) (h : 0 ≤ disc3 (flowP p 0) q) (n : Nat) :
    0 ≤ disc3 (flowP p n) q := Int.le_trans h (disc3_monotone_rec p q n)

/-- The flow is injective on the constant term: the polynomial at time t determines the polynomial
    at time 0. -/
theorem flow_injective (c c' t : Int) (h : flowC c t = flowC c' t) : c = c' := by
  unfold flowC at h; omega

/-- At every positive time there are two quadratics real-rooted at t, one real-rooted at 0 and one
    not. -/
theorem certificate_two_worlds (t : Int) (ht : 0 < t) :
    RR 0 0 t ∧ RR 0 t t ∧ RR 0 0 0 ∧ ¬ RR 0 t 0 := by
  unfold RR; simp only [disc_flow]; unfold disc; omega

/-- No function of real-rootedness at time t returns real-rootedness at time 0 on every quadratic. -/
theorem certificate_decides_nothing (t : Int) (ht : 0 < t) :
    ¬ ∃ g : Bool → Bool, ∀ b c : Int, g (decide (RR b c t)) = decide (RR b c 0) := by
  intro ⟨g, hg⟩
  have ⟨h1, h2, h3, h4⟩ := certificate_two_worlds t ht
  have a := hg 0 0
  have b := hg 0 t
  rw [decide_eq_true h1, decide_eq_true h3] at a
  rw [decide_eq_true h2, decide_eq_false h4] at b
  rw [a] at b
  exact Bool.noConfusion b

/-- For every t > 0 some quadratic is real-rooted from t on and not at 0, with Λ > 0. -/
theorem certification_never_forces (t : Int) (ht : 0 < t) :
    ∃ c : Int, (∀ s, t ≤ s → RR 0 c s) ∧ ¬ RR 0 c 0 ∧ 0 < lam 0 c :=
  ⟨t, fun s hs => forward_preserves 0 t t s hs (certificate_two_worlds t ht).2.1,
   (certificate_two_worlds t ht).2.2.2,
   by unfold lam disc; split <;> omega⟩

/-- A double root is real-rooted at 0 with Λ = 0, and not real-rooted at any earlier time. -/
theorem zero_slack (a : Int) :
    RR (2*a) (a*a) 0 ∧ lam (2*a) (a*a) = 0 ∧ ∀ s, 0 < s → ¬ RR (2*a) (a*a) (-s) := by
  have hd : disc (2*a) (a*a) = 0 := by
    unfold disc; rw [Int.mul_assoc, Int.mul_left_comm a 2 a]; omega
  refine ⟨?_, ?_, ?_⟩
  · unfold RR; rw [disc_flow, hd]; omega
  · unfold lam; rw [hd]; simp
  · intro s hs; unfold RR; rw [disc_flow, hd]; omega

/-- A quadratic real-rooted at time 1 may or may not be real-rooted at time 0: z² − 2 is, z² + 2 is
    not. -/
theorem backward_not_forced : RR 0 (-2) 1 ∧ RR 0 2 1 ∧ RR 0 (-2) 0 ∧ ¬ RR 0 2 0 := by
  unfold RR; simp only [disc_flow]; unfold disc; decide

/-- The largest Λ over a family of quadratics. -/
def famLam : List (Int × Int) → Int
  | [] => 0
  | (b, c) :: r => max (lam b c) (famLam r)

theorem famLam_nonneg_rec : ∀ F : List (Int × Int), 0 ≤ famLam F := by
  intro F
  induction F with
  | nil => exact Int.le_refl 0
  | cons m r ih =>
    obtain ⟨b, c⟩ := m
    unfold famLam; omega

theorem family_least_erasure_rec :
    ∀ F : List (Int × Int), famLam F = 0 ↔ ∀ m ∈ F, RR m.1 m.2 0 := by
  intro F
  induction F with
  | nil => simp [famLam]
  | cons m r ih =>
    obtain ⟨b, c⟩ := m
    have hn := famLam_nonneg_rec r
    have hl := lam_nonneg b c
    have hz := lam_zero_iff_real b c
    constructor
    · intro h m hm
      unfold famLam at h
      cases hm with
      | head => exact hz.mp (by omega)
      | tail _ hm' => exact ih.mp (by omega) m hm'
    · intro h
      have h1 : lam b c = 0 := hz.mpr (h (b, c) (List.Mem.head r))
      have h2 : famLam r = 0 := ih.mpr (fun m hm => h m (List.Mem.tail _ hm))
      unfold famLam; omega

/-- The family's Λ is 0 exactly when every member is real-rooted at time 0. -/
theorem family_least_erasure (F : List (Int × Int)) : famLam F = 0 ↔ ∀ m ∈ F, RR m.1 m.2 0 :=
  family_least_erasure_rec F

end HeatFlow

/-- Real-rootedness at time 0 is exactly Λ ≤ 0, since 0 ≤ Λ. -/
theorem heat_bit_is_one_inequality (b c : Int) : HeatFlow.RR b c 0 ↔ HeatFlow.lam b c ≤ 0 := by
  have h1 := HeatFlow.lam_nonneg b c
  have h2 := HeatFlow.lam_zero_iff_real b c
  constructor
  · intro h
    have := h2.mpr h
    omega
  · intro h
    exact h2.mp (by omega)

/-- Over a family, every member is real-rooted at time 0 exactly when the family's Λ ≤ 0. -/
theorem family_bit_is_one_inequality (F : List (Int × Int)) :
    (∀ m ∈ F, HeatFlow.RR m.1 m.2 0) ↔ HeatFlow.famLam F ≤ 0 := by
  have h1 := HeatFlow.famLam_nonneg_rec F
  have h2 := HeatFlow.family_least_erasure F
  constructor
  · intro h
    have := h2.mpr h
    omega
  · intro h
    exact h2.mp (by omega)

/-- The de Bruijn–Newman structure and the quadratic model satisfy the same equivalences, the model
    with its lower bound proved. -/
theorem heat_model_reads_as_the_carrier {V : Type} [LE V] (D : DBN V) (b c : Int) :
    (RH D.zeros ↔ D.lam ≤ D.zero) ∧ (HeatFlow.RR b c 0 ↔ HeatFlow.lam b c ≤ 0) ∧
    (0 ≤ HeatFlow.lam b c) :=
  ⟨rh_iff_the_sign D, heat_bit_is_one_inequality b c, HeatFlow.lam_nonneg b c⟩

/-! ### XVII.d · The Liouville arrow λ(n) = (−1)^Ω(n), computed -/

namespace Liouville

/-- Ω, the number of prime factors with multiplicity, by trial division. -/
def omegaF : Nat → Nat → Nat → Nat
  | 0, _, _ => 0
  | fuel + 1, n, d =>
    if n ≤ 1 then 0
    else if d * d > n then 1
    else if n % d = 0 then 1 + omegaF fuel (n / d) d
    else omegaF fuel n (d + 1)
def bigOmega (n : Nat) : Nat := omegaF (2 * n + 2) n 2
/-- The arrow λ(n) = (−1)^Ω(n). -/
def lam (n : Nat) : Int := if bigOmega n % 2 = 0 then 1 else -1

/-- λ(ab) = λ(a)λ(b) on 1..40 × 1..40. -/
theorem lam_mult : ((List.range 40).all fun a => (List.range 40).all fun b =>
      lam ((a+1)*(b+1)) == lam (a+1) * lam (b+1)) = true := by decide

/-- λ(p) = −1 for every prime p below 100. -/
theorem lam_flips_at_primes :
    ([2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97].all fun p => lam p == -1) = true := by
  decide

def L : Nat → Int
  | 0 => 0
  | n + 1 => L n + lam (n + 1)

/-- L(x) = Σ_{n ≤ x} λ(n) ≤ 0 for 2 ≤ x ≤ 200. The inequality fails at x = 906,150,257 (Haselgrove
    1958; Tanaka 1980). -/
theorem polya_holds_to_200 : ((List.range 199).all fun k => decide (L (k + 2) ≤ 0)) = true := by decide

end Liouville

/-- λ is the sign arrow of the computed count Ω. -/
theorem liouville_is_the_sign_arrow (n : Nat) : Liouville.lam n = signArrow (Liouville.bigOmega n) := rfl

/-- A zero set with the faithfulness of λ: the hypothesis holds exactly when L(x) = O(x^{1/2+ε})
    for every ε > 0. Carried as a hypothesis (Landau 1899). -/
structure LiouvilleFace where
  zeros : World
  faithful : Prop
  faithful_iff : RH zeros ↔ faithful

theorem rh_from_faithful (F : LiouvilleFace) (h : F.faithful) : RH F.zeros := F.faithful_iff.mpr h
theorem faithful_is_the_bit (F : LiouvilleFace) : F.faithful ↔ RH F.zeros := F.faithful_iff.symm

/-- On one zero set, Weil positivity, Λ ≤ 0, the non-negativity of the Li stream and the
    faithfulness of λ are equivalent, each cited equivalence entering as a field. -/
theorem the_posit_in_every_coordinate {V : Type} [LE V] (P : PrimeAct) (D : DBN V) (Li : LiStream)
    (F : LiouvilleFace) (hD : D.zeros = P.E.zeros) (hL : Li.zeros = P.E.zeros)
    (hF : F.zeros = P.E.zeros) :
    (WeilPositive P.E ↔ D.lam ≤ D.zero) ∧ (WeilPositive P.E ↔ ∀ n, 1 ≤ n → Li.nonneg n) ∧
    (WeilPositive P.E ↔ F.faithful) := by
  have hW : WeilPositive P.E ↔ RH P.E.zeros := spend_is_the_line P.E
  refine ⟨?_, ?_, ?_⟩
  · rw [hW, ← hD]
    exact rh_iff_the_sign D
  · rw [hW, ← hL]
    exact (li_is_the_bit_stream Li).symm
  · rw [hW, ← hF]
    exact F.faithful_iff

/-! ### XVII.e · Five readings, one proposition -/

/-- Lossless registration: every zero is fixed by registration. -/
def Lossless (Z : World) : Prop := ∀ z, Z z → reg z = z
/-- Every zero has displacement 0. -/
def DepthZero (Z : World) : Prop := ∀ z, Z z → oddPart z = 0
/-- The Li mode of a zero, in the chart's own scale: |ρ − 1|² and |ρ|² doubled. -/
def N1 (z : Pt) : Int := (z.x - 2)*(z.x - 2) + 4*((z.t : Int)*(z.t : Int))
def N0 (z : Pt) : Int := z.x*z.x + 4*((z.t : Int)*(z.t : Int))
/-- Stability: no Li mode grows. -/
def Stable (Z : World) : Prop := ∀ z, Z z → N1 z ≤ N0 z

theorem modes (z : Pt) : N1 z - N0 z = 4 - 4 * z.x := by
  simp only [N1, N0, Int.sub_mul, Int.mul_sub]
  omega

/-- Registration fixes a zero exactly when the zero lies on the line. -/
theorem lossless_iff_rh (Z : World) : Lossless Z ↔ RH Z := by
  constructor
  · intro h z hz
    have e := congrArg Pt.x (h z hz)
    exact e.symm
  · intro h z hz
    exact reg_fixes_line z (h z hz)

/-- On a fold-closed world, stability of every Li mode is the line: a mode below the line grows,
    and its fold-partner stands above. -/
theorem stable_iff_rh (Z : World) (hZ : FoldClosed Z) : Stable Z ↔ RH Z := by
  constructor
  · intro h z hz
    have a := h z hz
    have b := h (fold z) (hZ z hz)
    have ea := modes z
    have eb := modes (fold z)
    have ex : (fold z).x = 2 - z.x := rfl
    rw [ex] at eb
    show z.x = 1
    omega
  · intro h z hz
    have e : z.x = 1 := h z hz
    have := modes z
    omega

/-- On every fold-closed world the line, lossless registration, displacement zero, no left zero,
    the stability of every Li mode and least erasure are equivalent. -/
theorem five_readings_agree (Z : World) (hZ : FoldClosed Z) :
    (RH Z ↔ Lossless Z) ∧ (RH Z ↔ DepthZero Z) ∧ (RH Z ↔ ¬ Left Z) ∧
    (RH Z ↔ Stable Z) ∧ (RH Z ↔ LeastErasure Z) :=
  ⟨(lossless_iff_rh Z).symm, rh_iff_even_eigenspace Z, rh_iff_no_left Z hZ,
   (stable_iff_rh Z hZ).symm, (least_erasure_is_the_value Z).symm⟩

/-- And no record-respecting reading returns any of the five, since each is the hypothesis. -/
theorem no_record_reading_returns_any_face (g : World → Prop) (hg : RespectsRecord g) :
    ¬ (∀ Z, FoldClosed Z → (g Z ↔ Lossless Z)) ∧ ¬ (∀ Z, FoldClosed Z → (g Z ↔ Stable Z)) := by
  constructor
  · intro h
    exact record_decides_nothing_free g hg (fun Z hZ => (h Z hZ).trans (lossless_iff_rh Z))
  · intro h
    exact record_decides_nothing_free g hg (fun Z hZ => (h Z hZ).trans (stable_iff_rh Z hZ))

/-! ### XVII.f · The supply has no reader index -/

/-- A proposition indexed by a type of readers, constant. -/
def Requirement (Reader : Type) (V : Prop) : Reader → Prop := fun _ => V

/-- Every reader faces the same proposition. -/
theorem same_for_every_reader {Reader : Type} (V : Prop) (a b : Reader) :
    Requirement Reader V a ↔ Requirement Reader V b := Iff.rfl

/-- A requirement that differs between two readers is not the fixed value. -/
theorem no_private_bit {Reader : Type} (V : Prop) (R : Reader → Prop) (hR : ∀ r, R r ↔ V)
    (a b : Reader) : R a ↔ R b := (hR a).trans (hR b).symm

/-- A reader-indexed requirement equal to Weil positivity for every reader is the same for all
    readers. -/
theorem spend_has_no_reader {Reader : Type} (P : PrimeAct) (R : Reader → Prop)
    (hR : ∀ r, R r ↔ WeilPositive P.E) (a b : Reader) : R a ↔ R b :=
  no_private_bit (WeilPositive P.E) R hR a b

/-! ### XVII.g · Section XVII, whole -/

/-- Section XVII, whole. -/
theorem the_harvest :
    (∀ (L : List (World → Prop)), (∀ A ∈ L, Admissible A) → (∀ A ∈ L, A W1) →
      ¬ Forces (fun Z => ∀ A ∈ L, A Z)) ∧
    ¬ Admissible LeastErasure ∧
    (∀ T : Nat, RH (LineBelow T) ∧ FoldClosed (TwinAbove T) ∧ ¬ RH (TwinAbove T)) ∧
    (∀ b c : Int, (HeatFlow.RR b c 0 ↔ HeatFlow.lam b c ≤ 0) ∧ 0 ≤ HeatFlow.lam b c) ∧
    (∀ t : Int, 0 < t → ¬ ∃ g : Bool → Bool, ∀ b c : Int,
      g (decide (HeatFlow.RR b c t)) = decide (HeatFlow.RR b c 0)) ∧
    (∀ n : Nat, Liouville.lam n = signArrow (Liouville.bigOmega n)) ∧
    (∀ Z : World, FoldClosed Z →
      (RH Z ↔ Lossless Z) ∧ (RH Z ↔ DepthZero Z) ∧ (RH Z ↔ ¬ Left Z) ∧
      (RH Z ↔ Stable Z) ∧ (RH Z ↔ LeastErasure Z)) ∧
    (∀ {Reader : Type} (P : PrimeAct) (R : Reader → Prop),
      (∀ r, R r ↔ WeilPositive P.E) → ∀ a b : Reader, R a ↔ R b) :=
  ⟨no_admissible_coalition_forces, spend_is_not_admissible,
   fun T => ⟨(certified_height_never_forces T).1, (certified_height_never_forces T).2.1,
     (certified_height_never_forces T).2.2.1⟩,
   fun b c => ⟨heat_bit_is_one_inequality b c, HeatFlow.lam_nonneg b c⟩,
   HeatFlow.certificate_decides_nothing, liouville_is_the_sign_arrow, five_readings_agree,
   fun P R hR a b => spend_has_no_reader P R hR a b⟩


/-! ## XVIII · A theory placed on three strata; the root; the two can'ts; the round trip; the ladder blocked -/

/-! ### XVIII.a · Placement: computation, provability, truth -/

/-- A theory: its sentences, what it proves, what finite computation settles, what holds in its
    intended model. -/
structure Theory where
  Sent  : Type
  Prov  : Sent → Prop
  Comp  : Sent → Prop
  True_ : Sent → Prop

/-- Σ₁-completeness, abstractly: what finite computation settles, the theory proves. -/
def RungOnLadder (T : Theory) : Prop := ∀ s, T.Comp s → T.Prov s
/-- Soundness: what the theory proves holds in its intended model. -/
def Sound (T : Theory) : Prop := ∀ s, T.Prov s → T.True_ s

/-- Under Σ₁-completeness and soundness: what computation settles the theory proves, what the
    theory proves holds, and what computation settles holds. -/
theorem placement (T : Theory) (hR : RungOnLadder T) (hS : Sound T) :
    (∀ s, T.Comp s → T.Prov s) ∧ (∀ s, T.Prov s → T.True_ s) ∧ (∀ s, T.Comp s → T.True_ s) :=
  ⟨hR, hS, fun s h => hS s (hR s h)⟩

/-- An unsound theory: it proves everything and its model refutes half of it. -/
def unsound : Theory := ⟨Bool, fun _ => True, fun _ => False, fun b => b = true⟩

/-- The unsound theory is Σ₁-complete and not sound. -/
theorem soundness_is_load_bearing : RungOnLadder unsound ∧ ¬ Sound unsound := by
  refine ⟨fun _ h => h.elim, fun h => ?_⟩
  have := h false trivial
  cases this

/-- A sound incomplete theory: true on both sentences, proving one. -/
def incomplete : Theory := ⟨Bool, fun b => b = true, fun _ => False, fun _ => True⟩

/-- A sound theory can leave a truth unproved. -/
theorem ground_exceeds_ladder :
    Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false :=
  ⟨fun _ _ => trivial, trivial, fun h => Bool.noConfusion h⟩

/-- Independent axioms are separate bits: every combination of two values is realized. -/
theorem independent_axioms_are_separate_bits :
    ∀ a b : Bool, ∃ w : Bool × Bool, w.1 = a ∧ w.2 = b :=
  fun a b => ⟨(a, b), rfl, rfl⟩

/-! ### XVIII.b · The root crosses every keyless sentence and no keyed one -/

/-- Over any type of worlds: a sentence is keyless when every world has it, keyed when some world
    lacks it. -/
def KeylessOn {W : Type} (P : W → Prop) : Prop := ∀ w, P w
def KeyedOn {W : Type} (P : W → Prop) : Prop := ∃ w, ¬ P w

/-- The root proposition, 0 < 1. -/
def RootAct : Prop := (0 : Int) < 1
theorem root_act : RootAct := show (0 : Int) < 1 by decide

/-- The root is keyless over every type of worlds. -/
theorem root_is_keyless {W : Type} : KeylessOn (fun _ : W => RootAct) := fun _ => root_act

/-- The root implies every keyless sentence on every world. -/
theorem keyless_crosses {W : Type} (P : W → Prop) (hP : KeylessOn P) : ∀ w, RootAct → P w :=
  fun w _ => hP w

/-- The root does not imply a keyed sentence on every world. -/
theorem root_decides_no_keyed {W : Type} (P : W → Prop) (hK : KeyedOn P) :
    ¬ ∀ w, RootAct → P w :=
  fun h => hK.elim (fun w hw => hw (h w root_act))

/-- Choice over ZF as a keyed sentence: two worlds, one each way (Gödel 1938; Cohen 1963). -/
def choiceHolds : Bool → Prop := fun w => w = true
theorem choice_is_keyed : KeyedOn choiceHolds := ⟨false, fun h => Bool.noConfusion h⟩
theorem root_does_not_cross_choice :
    (∀ _w : Bool, RootAct) ∧ choiceHolds true ∧ ¬ choiceHolds false :=
  ⟨fun _ => root_act, rfl, fun h => Bool.noConfusion h⟩

/-- The hypothesis is keyed over the worlds of the chart. -/
theorem line_is_keyed_over_worlds : KeyedOn RH ∧ ∃ Z, FoldClosed Z ∧ RH Z :=
  ⟨⟨W2f, W2f_not_rh⟩, ⟨W1, W1_closed, W1_rh⟩⟩

/-- The root does not imply the hypothesis on every world. -/
theorem root_does_not_cross_the_line : ¬ ∀ Z : World, RootAct → RH Z :=
  root_decides_no_keyed RH line_is_keyed_over_worlds.1

/-! ### XVIII.c · The two can'ts of a foundation are not mirror images -/

/-- A hypothesis with a provability predicate, Σ₁-completeness on the denial (a false Π⁰₁
    hypothesis has a finite witness, which the theory proves: Davis, Matiyasevich and Robinson
    1976; Lagarias 2002) and soundness on the denial, both carried as hypotheses. -/
structure Setting where
  hyp       : Prop
  Prov      : Prop → Prop
  sigma1    : ¬ hyp → Prov (¬ hyp)
  sound_neg : Prov (¬ hyp) → ¬ hyp

/-- On the chart one off-line zero refutes the hypothesis. -/
theorem refutation_is_one_point (Z : World) (z : Pt) (hz : Z z) (h : ¬ onLine z) : ¬ RH Z :=
  fun r => h (r z hz)

/-- If the theory cannot refute the hypothesis, the hypothesis holds. -/
theorem cant_refute_seals (S : Setting) (h : ¬ S.Prov (¬ S.hyp)) : S.hyp :=
  Classical.byContradiction (fun n => h (S.sigma1 n))

theorem cant_refute_seals_dec (S : Setting) [Decidable S.hyp] (h : ¬ S.Prov (¬ S.hyp)) : S.hyp :=
  Decidable.byContradiction (fun n => h (S.sigma1 n))

/-- Under soundness on the denial, the hypothesis holds exactly when the foundation cannot refute it. -/
theorem rh_iff_cant_refute (S : Setting) [Decidable S.hyp] : S.hyp ↔ ¬ S.Prov (¬ S.hyp) :=
  ⟨fun r p => S.sound_neg p r, cant_refute_seals_dec S⟩

/-- A hypothesis the theory neither proves nor refutes holds. -/
theorem independence_forces_truth (S : Setting) (_hp : ¬ S.Prov S.hyp) (hn : ¬ S.Prov (¬ S.hyp)) :
    S.hyp :=
  cant_refute_seals S hn

/-- A setting in which the hypothesis holds and is not provable. -/
def independentTrue : Setting := ⟨True, fun _ => False, fun n => absurd trivial n, fun p => p.elim⟩

theorem cant_prove_does_not_seal_false :
    independentTrue.hyp ∧ ¬ independentTrue.Prov independentTrue.hyp :=
  ⟨trivial, id⟩

/-- Cannot-refute implies the hypothesis; cannot-prove is consistent with it. -/
theorem cant_asymmetry :
    (∀ S : Setting, ¬ S.Prov (¬ S.hyp) → S.hyp) ∧ (∃ S : Setting, S.hyp ∧ ¬ S.Prov S.hyp) :=
  ⟨cant_refute_seals, ⟨independentTrue, cant_prove_does_not_seal_false⟩⟩

/-! ### XVIII.d · The round trip is the identity -/

/-- A sentence conjoined with the root. -/
def viaRoot {W : Type} (P : W → Prop) : W → Prop := fun w => RootAct ∧ P w

/-- Conjoining the root changes no sentence's value. -/
theorem round_trip_identity {W : Type} (P : W → Prop) (w : W) : viaRoot P w ↔ P w :=
  ⟨fun h => h.2, fun h => ⟨root_act, h⟩⟩

/-- An absolute sentence, the same in every world, returns unchanged. -/
theorem absolute_returns_unchanged {W : Type} (P : W → Prop) (hAbs : ∀ w v, P w ↔ P v) (w : W) :
    ∀ v, viaRoot P v ↔ P w :=
  fun v => (round_trip_identity P v).trans (hAbs v w)

/-- The trip adds presence and nothing else: it returns identically for a sentence and its denial. -/
theorem trip_adds_presence_only {W : Type} (P : W → Prop) (w : W) :
    RootAct ∧ (viaRoot P w ↔ P w) ∧ (viaRoot (fun v => ¬ P v) w ↔ ¬ P w) :=
  ⟨root_act, round_trip_identity P w, round_trip_identity (fun v => ¬ P v) w⟩

/-- For any true Q, (Q → RH Z) ↔ RH Z. -/
theorem massless_arrow (Q : Prop) (hq : Q) (Z : World) : (Q → RH Z) ↔ RH Z :=
  ⟨fun f => f hq, fun h _ => h⟩

/-- Any true premise satisfies the three properties of the root. -/
theorem any_true_premise_serves (R : Prop) (hR : R) {W : Type} (P : W → Prop) :
    ((∀ w, P w) → ∀ w, R → P w) ∧ ((∃ w, ¬ P w) → ¬ ∀ w, R → P w) ∧ (∀ w, (R ∧ P w) ↔ P w) :=
  ⟨fun hP w _ => hP w, fun h₁ h => h₁.elim (fun w hw => hw (h w hR)),
   fun _ => ⟨fun h => h.2, fun h => ⟨hR, h⟩⟩⟩

/-- Conjoined with the root, the hypothesis is itself on W1 and on W2f. -/
theorem the_line_round_trips :
    (∀ Z : World, viaRoot RH Z ↔ RH Z) ∧ viaRoot RH W1 ∧ ¬ viaRoot RH W2f :=
  ⟨fun Z => round_trip_identity RH Z, ⟨root_act, W1_rh⟩, fun h => W2f_not_rh h.2⟩

/-! ### XVIII.e · The ladder blocked, five ways -/

/-- No reading of the record, no keyless premise, no admissible coalition, no certified height and
    no independence verdict decides the hypothesis; the one premise that forces the line is the
    hypothesis. -/
theorem ladder_blocked :
    (∀ g : World → Prop, RespectsRecord g → ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z)) ∧
    (∀ A : World → Prop, Keyless A → ¬ Forces A) ∧
    (∀ L : List (World → Prop), (∀ A ∈ L, Admissible A) → (∀ A ∈ L, A W1) →
      ¬ Forces (fun Z => ∀ A ∈ L, A Z)) ∧
    (¬ ∀ Z : World, RootAct → RH Z) ∧
    (∃ S : Setting, S.hyp ∧ ¬ S.Prov S.hyp) ∧
    (Forces RH ∧ ∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → RH Z) :=
  ⟨record_decides_nothing_free, keyless_forces_nothing_free, no_admissible_coalition_forces,
   root_does_not_cross_the_line, ⟨independentTrue, cant_prove_does_not_seal_false⟩,
   rh_is_the_weakest_forcing_premise⟩

/-- Section XVIII, whole. -/
theorem the_road :
    (∀ T : Theory, RungOnLadder T → Sound T → ∀ s, T.Comp s → T.True_ s) ∧
    (RungOnLadder unsound ∧ ¬ Sound unsound) ∧
    (Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false) ∧
    (∀ {W : Type} (P : W → Prop), KeylessOn P → ∀ w, RootAct → P w) ∧
    (∀ {W : Type} (P : W → Prop), KeyedOn P → ¬ ∀ w, RootAct → P w) ∧
    (KeyedOn choiceHolds ∧ KeyedOn RH) ∧
    (∀ S : Setting, ¬ S.Prov (¬ S.hyp) → S.hyp) ∧
    (∃ S : Setting, S.hyp ∧ ¬ S.Prov S.hyp) ∧
    (∀ {W : Type} (P : W → Prop) (w : W), viaRoot P w ↔ P w) ∧
    (∀ (Q : Prop), Q → ∀ Z : World, (Q → RH Z) ↔ RH Z) ∧
    (∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → RH Z) :=
  ⟨fun T hR hS => (placement T hR hS).2.2, soundness_is_load_bearing, ground_exceeds_ladder,
   fun P hP => keyless_crosses P hP, fun P hK => root_decides_no_keyed P hK,
   ⟨choice_is_keyed, line_is_keyed_over_worlds.1⟩,
   cant_refute_seals, ⟨independentTrue, cant_prove_does_not_seal_false⟩,
   fun P w => round_trip_identity P w, massless_arrow, rh_is_the_weakest_forcing_premise.2⟩

/-! ## XIX · The vocabulary law, the even coalition, the triaxial cut, the ladder's proof, the route ledger -/

/-! ### XIX.a · The vocabulary law -/

/-- On every world, a consequence of the hypothesis is a consequence of least erasure and
    conversely, and a premise entailing one entails the other. -/
theorem vocabulary_law (Z : World) (P : Prop) :
    ((RH Z → P) ↔ (LeastErasure Z → P)) ∧ ((P → RH Z) ↔ (P → LeastErasure Z)) :=
  ⟨⟨fun h l => h ((least_erasure_is_the_value Z).mp l),
    fun h r => h ((least_erasure_is_the_value Z).mpr r)⟩,
   ⟨fun h p => (least_erasure_is_the_value Z).mpr (h p),
    fun h p => (least_erasure_is_the_value Z).mp (h p)⟩⟩

/-- A consequence of any one face is a consequence of the least-erasure face. -/
theorem every_face_proves_every_face (H : Faces) (P : Prop) :
    ((H.line → P) ↔ (H.least → P)) ∧ ((H.lamZero → P) ↔ (H.least → P)) ∧
    ((H.faithful → P) ↔ (H.least → P)) ∧ ((H.weil → P) ↔ (H.least → P)) :=
  ⟨⟨fun h l => h (H.line_iff_least.mpr l), fun h r => h (H.line_iff_least.mp r)⟩,
   ⟨fun h l => h (H.lam_iff_least.mpr l), fun h r => h (H.lam_iff_least.mp r)⟩,
   ⟨fun h l => h (H.faith_iff_least.mpr l), fun h r => h (H.faith_iff_least.mp r)⟩,
   ⟨fun h l => h (H.weil_iff_least.mpr l), fun h r => h (H.weil_iff_least.mp r)⟩⟩

/-- On every fold-closed world a consequence of any of the four chart readings is a consequence of
    least erasure. -/
theorem chart_faces_prove_each_other (Z : World) (hZ : FoldClosed Z) (P : Prop) :
    ((Lossless Z → P) ↔ (LeastErasure Z → P)) ∧ ((DepthZero Z → P) ↔ (LeastErasure Z → P)) ∧
    ((¬ Left Z → P) ↔ (LeastErasure Z → P)) ∧ ((Stable Z → P) ↔ (LeastErasure Z → P)) :=
  ⟨⟨fun h l => h ((lossless_iff_rh Z).mpr ((least_erasure_is_the_value Z).mp l)),
    fun h r => h ((least_erasure_is_the_value Z).mpr ((lossless_iff_rh Z).mp r))⟩,
   ⟨fun h l => h ((rh_iff_even_eigenspace Z).mp ((least_erasure_is_the_value Z).mp l)),
    fun h r => h ((least_erasure_is_the_value Z).mpr ((rh_iff_even_eigenspace Z).mpr r))⟩,
   ⟨fun h l => h ((rh_iff_no_left Z hZ).mp ((least_erasure_is_the_value Z).mp l)),
    fun h r => h ((least_erasure_is_the_value Z).mpr ((rh_iff_no_left Z hZ).mpr r))⟩,
   ⟨fun h l => h ((stable_iff_rh Z hZ).mpr ((least_erasure_is_the_value Z).mp l)),
    fun h r => h ((least_erasure_is_the_value Z).mpr ((stable_iff_rh Z hZ).mp r))⟩⟩

/-! ### XIX.b · The even coalition: closed under every combination, blind to the value -/

/-- The fold is an involution. -/
theorem fold_fold (z : Pt) : fold (fold z) = z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 - (2 - x)) t = Pt.mk x t
    congr 1
    omega

/-- The fold law is keyless. -/
theorem fold_law_admissible : Admissible (fun _ : World => ∀ z, fold (fold z) = z) :=
  Or.inl (fun _ => fold_fold)

/-- Two worlds of one record have one record. -/
theorem same_record_eq (Z Z' : World) (h : SameRecord Z Z') : recordOf Z = recordOf Z' :=
  funext (fun r => propext (h r))

/-- A function of the record is a reading of the record. -/
theorem record_reading_admissible (h : World → Prop) : Admissible (fun Z => h (recordOf Z)) :=
  Or.inr (fun Z Z' hs => by
    show h (recordOf Z) ↔ h (recordOf Z')
    rw [same_record_eq Z Z' hs])

/-- A constant premise is admissible. -/
theorem admissible_const (P : Prop) : Admissible (fun _ : World => P) :=
  Or.inr (fun _ _ _ => Iff.rfl)

/-- The denial of a keyless premise respects the record: it is false everywhere. -/
theorem keyless_denial_respects (A : World → Prop) (hA : Keyless A) :
    RespectsRecord (fun Z => ¬ A Z) :=
  fun Z Z' _ => ⟨fun n => absurd (hA Z) n, fun n => absurd (hA Z') n⟩

/-- Admissible premises are closed under negation. -/
theorem admissible_not (A : World → Prop) (hA : Admissible A) : Admissible (fun Z => ¬ A Z) := by
  rcases hA with k | r
  · exact Or.inr (keyless_denial_respects A k)
  · exact Or.inr (fun Z Z' h => ⟨fun n a => n ((r Z Z' h).mpr a), fun n a => n ((r Z Z' h).mp a)⟩)

/-- Admissible premises are closed under conjunction. -/
theorem admissible_and (A B : World → Prop) (hA : Admissible A) (hB : Admissible B) :
    Admissible (fun Z => A Z ∧ B Z) := by
  rcases hA with ka | ra <;> rcases hB with kb | rb
  · exact Or.inl (fun Z => ⟨ka Z, kb Z⟩)
  · exact Or.inr (fun Z Z' h =>
      ⟨fun ⟨_, b⟩ => ⟨ka Z', (rb Z Z' h).mp b⟩, fun ⟨_, b⟩ => ⟨ka Z, (rb Z Z' h).mpr b⟩⟩)
  · exact Or.inr (fun Z Z' h =>
      ⟨fun ⟨a, _⟩ => ⟨(ra Z Z' h).mp a, kb Z'⟩, fun ⟨a, _⟩ => ⟨(ra Z Z' h).mpr a, kb Z⟩⟩)
  · exact Or.inr (fun Z Z' h =>
      ⟨fun ⟨a, b⟩ => ⟨(ra Z Z' h).mp a, (rb Z Z' h).mp b⟩,
       fun ⟨a, b⟩ => ⟨(ra Z Z' h).mpr a, (rb Z Z' h).mpr b⟩⟩)

/-- Admissible premises are closed under disjunction. -/
theorem admissible_or (A B : World → Prop) (hA : Admissible A) (hB : Admissible B) :
    Admissible (fun Z => A Z ∨ B Z) := by
  rcases hA with ka | ra <;> rcases hB with kb | rb
  · exact Or.inl (fun Z => Or.inl (ka Z))
  · exact Or.inl (fun Z => Or.inl (ka Z))
  · exact Or.inl (fun Z => Or.inr (kb Z))
  · exact Or.inr (fun Z Z' h =>
      ⟨fun o => o.elim (fun a => Or.inl ((ra Z Z' h).mp a)) (fun b => Or.inr ((rb Z Z' h).mp b)),
       fun o => o.elim (fun a => Or.inl ((ra Z Z' h).mpr a)) (fun b => Or.inr ((rb Z Z' h).mpr b))⟩)

/-- No admissible premise agrees with the hypothesis on every fold-closed world. -/
theorem admissible_never_decides (A : World → Prop) (hA : Admissible A) :
    ¬ ∀ Z, FoldClosed Z → (A Z ↔ RH Z) := by
  intro h
  rcases hA with k | r
  · exact W2f_not_rh ((h W2f W2f_closed).mp (k W2f))
  · exact record_decides_nothing_free A r h

/-- A coalition: any Boolean combination of atomic premises, however deep. -/
inductive Coalition (ι : Type) where
  | atom : ι → Coalition ι
  | top : Coalition ι
  | bot : Coalition ι
  | not : Coalition ι → Coalition ι
  | and : Coalition ι → Coalition ι → Coalition ι
  | or : Coalition ι → Coalition ι → Coalition ι

/-- The premise a coalition asserts, given its atoms. -/
def Coalition.eval {ι : Type} (at_ : ι → World → Prop) : Coalition ι → World → Prop
  | .atom i => at_ i
  | .top => fun _ => True
  | .bot => fun _ => False
  | .not c => fun Z => ¬ Coalition.eval at_ c Z
  | .and c d => fun Z => Coalition.eval at_ c Z ∧ Coalition.eval at_ d Z
  | .or c d => fun Z => Coalition.eval at_ c Z ∨ Coalition.eval at_ d Z

/-- Every coalition of admissible atoms is admissible. -/
theorem coalition_admissible {ι : Type} (at_ : ι → World → Prop) (h : ∀ i, Admissible (at_ i)) :
    ∀ c : Coalition ι, Admissible (Coalition.eval at_ c) := by
  intro c
  induction c with
  | atom i => exact h i
  | top => exact admissible_const True
  | bot => exact admissible_const False
  | not c ih =>
    show Admissible (fun Z => ¬ Coalition.eval at_ c Z)
    exact admissible_not _ ih
  | and c d ihc ihd =>
    show Admissible (fun Z => Coalition.eval at_ c Z ∧ Coalition.eval at_ d Z)
    exact admissible_and _ _ ihc ihd
  | or c d ihc ihd =>
    show Admissible (fun Z => Coalition.eval at_ c Z ∨ Coalition.eval at_ d Z)
    exact admissible_or _ _ ihc ihd

/-- No coalition of admissible atoms agrees with the hypothesis on every fold-closed world. -/
theorem no_coalition_decides {ι : Type} (at_ : ι → World → Prop) (h : ∀ i, Admissible (at_ i))
    (c : Coalition ι) : ¬ ∀ Z, FoldClosed Z → (Coalition.eval at_ c Z ↔ RH Z) :=
  admissible_never_decides _ (coalition_admissible at_ h c)

/-! ### XIX.c · The triaxial cut, irreducible -/

/-- The fold law and every reading of the record are admissible; admissible premises are closed
    under Boolean combination; no admissible premise decides the hypothesis; off the line one
    supplied side bit fixes any fold-flipped target by a unique calibration, both values realized;
    least erasure is not admissible; and nothing weaker than the hypothesis forces the line. -/
theorem triaxial_cut_irreducible :
    Admissible (fun _ : World => ∀ z, fold (fold z) = z) ∧
    (∀ h : World → Prop, Admissible (fun Z => h (recordOf Z))) ∧
    (∀ (ι : Type) (at_ : ι → World → Prop), (∀ i, Admissible (at_ i)) →
      ∀ c : Coalition ι, Admissible (Coalition.eval at_ c)) ∧
    (∀ A : World → Prop, Admissible A → ¬ ∀ Z, FoldClosed Z → (A Z ↔ RH Z)) ∧
    (∀ (d : Pt → Bool) (z : Pt), ¬ onLine z → d (fold z) = !d z →
      ∃ c : Bool, (d z = xor (side z) c ∧ d (fold z) = xor (side (fold z)) c) ∧
        ∀ c', (d z = xor (side z) c' ∧ d (fold z) = xor (side (fold z)) c') → c' = c) ∧
    (∀ z : Pt, ¬ onLine z →
      (side (fold z) = !side z ∧ side z = xor (side z) false) ∧
      ((!side (fold z)) = !(!side z) ∧ (!side z) = xor (side z) true)) ∧
    ¬ Admissible LeastErasure ∧
    (Forces RH ∧ ∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → RH Z) :=
  ⟨fold_law_admissible, record_reading_admissible,
   fun _ at_ h c => coalition_admissible at_ h c, admissible_never_decides,
   colocation_is_a_calibration, calibration_realized_both_ways,
   spend_is_not_admissible, rh_is_the_weakest_forcing_premise⟩

/-! ### XIX.d · The ladder's proof lands on least erasure; no foundation is claimed closed -/

/-- A reading of a theory's sentences on the chart: each sentence names a world, and the sentence
    holds in the intended model exactly when that world satisfies the hypothesis. -/
structure ReadsAsLine (T : Theory) where
  world : T.Sent → World
  reads : ∀ s, T.True_ s ↔ RH (world s)

/-- If a sound theory proves a sentence that reads as the hypothesis on a world, that world has
    least erasure. -/
theorem ladder_proof_lands_on_least_erasure (T : Theory) (hS : Sound T) (R : ReadsAsLine T)
    (s : T.Sent) (hp : T.Prov s) : LeastErasure (R.world s) :=
  (least_erasure_is_the_value (R.world s)).mpr ((R.reads s).mp (hS s hp))

/-- Where the theory also proves the sentence whenever it holds, its proof is exactly least
    erasure on the world the sentence names. -/
theorem ladder_proof_iff_least_erasure (T : Theory) (hS : Sound T) (R : ReadsAsLine T)
    (s : T.Sent) (hc : T.True_ s → T.Prov s) : T.Prov s ↔ LeastErasure (R.world s) :=
  ⟨ladder_proof_lands_on_least_erasure T hS R s,
   fun l => hc ((R.reads s).mpr ((least_erasure_is_the_value (R.world s)).mp l))⟩

/-- A sound theory with one sentence, proved, reading as the line world. -/
def lineTheory : Theory := ⟨Unit, fun _ => True, fun _ => False, fun _ => True⟩
theorem lineTheory_sound : Sound lineTheory := fun _ _ => trivial
def lineTheoryReads : ReadsAsLine lineTheory :=
  ⟨fun _ => W1, fun _ => ⟨fun _ => W1_rh, fun _ => trivial⟩⟩

/-- A sound theory proving a sentence that reads as the hypothesis exists, and its proof lands on
    least erasure. -/
theorem a_sound_theory_may_prove_the_line :
    Sound lineTheory ∧ lineTheory.Prov () ∧ LeastErasure (lineTheoryReads.world ()) :=
  ⟨lineTheory_sound, trivial,
   ladder_proof_lands_on_least_erasure lineTheory lineTheory_sound lineTheoryReads () trivial⟩

/-! ### XIX.e · The route ledger, computed -/

/-- Six routes to the hypothesis. -/
inductive Route where
  | ladderFromRecord | foundationAsSystem | placement | groundByAct | independence | realPartCertified
  deriving DecidableEq, Repr

/-- A route's status: blocked by a theorem of this file; closed by the act; carried on a cited
    theorem; or open, with no closure claimed. -/
inductive RouteStatus where
  | blocked | closedByAct | cited | open
  deriving DecidableEq, Repr

/-- A status is a function of three recorded bits: a theorem of this file blocks the route; the act
    closes it; a cited theorem carries it. -/
def routeStatus (blocked byAct cited : Bool) : RouteStatus :=
  if blocked then .blocked else if byAct then .closedByAct else if cited then .cited else .open

structure RouteEntry where
  route : Route
  blocked : Bool
  byAct : Bool
  cited : Bool
  printed : RouteStatus

/-- The ledger: the ladder from the record, blocked (unicorn_block); the foundation as a system,
    open (a_sound_theory_may_prove_the_line); placement, on the two cited premises (placement);
    the ground closed by the act (rh_from_the_act); independence, blocked, since it would force
    truth (independence_forces_truth); the real part to the certified height, cited (Platt and
    Trudgian 2021, certified_height_never_forces). -/
def routeLedger : List RouteEntry :=
  [⟨.ladderFromRecord, true, false, false, .blocked⟩,
   ⟨.foundationAsSystem, false, false, false, .open⟩,
   ⟨.placement, false, false, true, .cited⟩,
   ⟨.groundByAct, false, true, false, .closedByAct⟩,
   ⟨.independence, true, false, false, .blocked⟩,
   ⟨.realPartCertified, false, false, true, .cited⟩]

/-- Every printed status is the computed one. -/
theorem route_ledger_is_computed :
    routeLedger.all (fun e => routeStatus e.blocked e.byAct e.cited == e.printed) = true := by
  decide

/-- Six routes: two blocked, one closed by the act, two cited, one open. -/
theorem route_ledger_counts :
    routeLedger.length = 6 ∧
    (routeLedger.filter (fun e => e.printed == .blocked)).length = 2 ∧
    (routeLedger.filter (fun e => e.printed == .closedByAct)).length = 1 ∧
    (routeLedger.filter (fun e => e.printed == .cited)).length = 2 ∧
    (routeLedger.filter (fun e => e.printed == .open)).length = 1 := by
  decide

/-- Nothing escapes the ledger: every status is one of the four. -/
theorem route_status_total : ∀ a b c : Bool,
    routeStatus a b c = .blocked ∨ routeStatus a b c = .closedByAct ∨
    routeStatus a b c = .cited ∨ routeStatus a b c = .open := by
  decide

/-- A route is blocked exactly when a theorem blocks it: no other bit produces the verdict. -/
theorem blocked_iff_theorem : ∀ a b c : Bool, routeStatus a b c = .blocked ↔ a = true := by
  decide

/-! ### XIX.f · The two-part reading -/

/-- (a) From the posit the hypothesis follows. (b) No reading of the record supplies the posit. (c)
    The posit is the hypothesis. (d) Nothing weaker forces. -/
theorem reader_frame :
    (∀ A : ActualZeros, RH A.zeros) ∧
    (∀ g : World → Prop, RespectsRecord g → ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z)) ∧
    (∀ Z : World, LeastErasure Z ↔ RH Z) ∧
    (Forces RH ∧ ∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → RH Z) :=
  ⟨rh_from_the_act, record_decides_nothing_free, least_erasure_is_the_value,
   rh_is_the_weakest_forcing_premise⟩

/-- Section XIX, whole. -/
theorem the_front :
    (∀ (Z : World) (P : Prop), ((RH Z → P) ↔ (LeastErasure Z → P)) ∧
      ((P → RH Z) ↔ (P → LeastErasure Z))) ∧
    (∀ (H : Faces) (P : Prop), ((H.line → P) ↔ (H.least → P)) ∧ ((H.lamZero → P) ↔ (H.least → P)) ∧
      ((H.faithful → P) ↔ (H.least → P)) ∧ ((H.weil → P) ↔ (H.least → P))) ∧
    (∀ (ι : Type) (at_ : ι → World → Prop), (∀ i, Admissible (at_ i)) →
      ∀ c : Coalition ι, ¬ ∀ Z, FoldClosed Z → (Coalition.eval at_ c Z ↔ RH Z)) ∧
    ¬ Admissible LeastErasure ∧
    (Forces RH ∧ ∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → RH Z) ∧
    (∀ (T : Theory), Sound T → ∀ (R : ReadsAsLine T) (s : T.Sent), T.Prov s →
      LeastErasure (R.world s)) ∧
    (Sound lineTheory ∧ lineTheory.Prov () ∧ LeastErasure (lineTheoryReads.world ())) ∧
    routeLedger.all (fun e => routeStatus e.blocked e.byAct e.cited == e.printed) = true ∧
    ((∀ A : ActualZeros, RH A.zeros) ∧
     (∀ g : World → Prop, RespectsRecord g → ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z)) ∧
     (∀ Z : World, LeastErasure Z ↔ RH Z)) :=
  ⟨vocabulary_law, every_face_proves_every_face,
   fun _ at_ h c => no_coalition_decides at_ h c, spend_is_not_admissible,
   rh_is_the_weakest_forcing_premise,
   fun T hS R s hp => ladder_proof_lands_on_least_erasure T hS R s hp,
   a_sound_theory_may_prove_the_line, route_ledger_is_computed,
   ⟨rh_from_the_act, record_decides_nothing_free, least_erasure_is_the_value⟩⟩

/-! ## XX · Least erasure affirmed: the record, the ledger, the price, the one form, the act -/

/-! ### XX.a · The record is carried by a least-erasure world, and by only one -/

/-- Registration lands on the line. -/
theorem reg_on_line (z : Pt) : onLine (reg z) := rfl

/-- The record of every world satisfies the hypothesis. -/
theorem record_rh (Z : World) : RH (recordOf Z) := by
  intro r ⟨s, _, hsr⟩
  rw [← hsr]
  exact rfl

/-- The record of every world has least erasure. -/
theorem record_has_least_erasure (Z : World) : LeastErasure (recordOf Z) :=
  (least_erasure_is_the_value (recordOf Z)).mpr (record_rh Z)

/-- The record of every world is fold-closed: it lies on the line, which the fold fixes. -/
theorem record_closed (Z : World) : FoldClosed (recordOf Z) := by
  intro r ⟨s, hs, hsr⟩
  rw [← hsr]
  exact ⟨s, hs, ((fold_fixed_iff (reg s)).mpr rfl).symm⟩

/-- The record of Z shares the record of Z, has least erasure, and every least-erasure world with
    that record equals it pointwise. -/
theorem record_carried_by_least_erasure (Z : World) :
    SameRecord Z (recordOf Z) ∧ LeastErasure (recordOf Z) ∧
    ∀ Z', SameRecord Z Z' → LeastErasure Z' → ∀ z, Z' z ↔ recordOf Z z := by
  refine ⟨record_same Z, record_has_least_erasure Z, ?_⟩
  intro Z' hs hle z
  have h1 : SameRecord Z' (recordOf Z) := fun r => (hs r).symm.trans (record_same Z r)
  exact lossless_unique Z' (recordOf Z) h1 ((least_erasure_is_the_value Z').mp hle) (record_rh Z) z

/-! ### XX.b · Every reading of the record holds on a least-erasure world -/

/-- An admissible premise that holds on a world holds on that world's record, which has least
    erasure. -/
theorem admissible_holds_on_the_lossless_world (A : World → Prop) (hA : Admissible A) (Z : World)
    (h : A Z) : A (recordOf Z) ∧ LeastErasure (recordOf Z) := by
  refine ⟨?_, record_has_least_erasure Z⟩
  rcases hA with k | r
  · exact k (recordOf Z)
  · exact (r Z (recordOf Z) (record_same Z)).mp h

/-- Every reading of the record that holds on a world holds on that world's record. -/
theorem every_reading_holds_on_the_lossless_world (g : World → Prop) (hg : RespectsRecord g)
    (Z : World) (h : g Z) : g (recordOf Z) ∧ LeastErasure (recordOf Z) := by
  refine ⟨(hg Z (recordOf Z) (record_same Z)).mp h, record_has_least_erasure Z⟩

/-- Every coalition of admissible atoms that holds on a world holds on that world's record. -/
theorem every_coalition_holds_on_the_lossless_world {ι : Type} (at_ : ι → World → Prop)
    (h : ∀ i, Admissible (at_ i)) (c : Coalition ι) (Z : World) (hc : Coalition.eval at_ c Z) :
    Coalition.eval at_ c (recordOf Z) ∧ LeastErasure (recordOf Z) := by
  refine ⟨?_, record_has_least_erasure Z⟩
  rcases coalition_admissible at_ h c with k | r
  · exact k (recordOf Z)
  · exact (r Z (recordOf Z) (record_same Z)).mp hc

/-- An admissible premise that denies least erasure on every fold-closed world holds on no world. -/
theorem record_never_testifies_against (A : World → Prop) (hA : Admissible A)
    (hdeny : ∀ Z, FoldClosed Z → A Z → ¬ LeastErasure Z) : ∀ Z, ¬ A Z := by
  intro Z h
  rcases hA with k | r
  · exact hdeny (recordOf Z) (record_closed Z) (k (recordOf Z)) (record_has_least_erasure Z)
  · exact hdeny (recordOf Z) (record_closed Z) ((r Z (recordOf Z) (record_same Z)).mp h)
      (record_has_least_erasure Z)

/-! ### XX.c · The erasure ledger: one bit per off-line pair, zero exactly at least erasure -/

/-- An off-line pair at offset k is two distinct points, exchanged by the fold, with one registered
    point. -/
theorem pair_two_points_one_record (k : Int) (h : Nat) (hk : k ≠ 0) :
    (⟨1 - k, h⟩ : Pt) ≠ ⟨1 + k, h⟩ ∧ reg ⟨1 - k, h⟩ = reg ⟨1 + k, h⟩ ∧
    fold ⟨1 - k, h⟩ = ⟨1 + k, h⟩ := by
  refine ⟨?_, rfl, ?_⟩
  · intro e
    have := congrArg Pt.x e
    change 1 - k = 1 + k at this
    omega
  · show Pt.mk (2 - (1 - k)) h = Pt.mk (1 + k) h
    congr 1
    omega

/-- A finite configuration: the heights of its on-line zeros, and its off-line pairs, each an
    offset with a height. An offset of zero is no pair. -/
structure FinCfg where
  online : List Nat
  pairs : List (Int × Nat)

/-- The world a finite configuration names on the chart. -/
def FinCfg.world (C : FinCfg) : World := fun z =>
  (z.x = 1 ∧ z.t ∈ C.online) ∨
  ∃ p ∈ C.pairs, p.1 ≠ 0 ∧ (z = ⟨1 - p.1, p.2⟩ ∨ z = ⟨1 + p.1, p.2⟩)

/-- The off-line pairs, counted. -/
def offCount : List (Int × Nat) → Nat
  | [] => 0
  | p :: ps => (if p.1 = 0 then 0 else 1) + offCount ps

/-- Erased bits: the number of off-line pairs. -/
def FinCfg.erasedBits (C : FinCfg) : Nat := offCount C.pairs

theorem offCount_zero_iff (ps : List (Int × Nat)) : offCount ps = 0 ↔ ∀ p ∈ ps, p.1 = 0 := by
  induction ps with
  | nil => exact ⟨fun _ p hp => (nomatch hp), fun _ => rfl⟩
  | cons p ps ih =>
    show (if p.1 = 0 then 0 else 1) + offCount ps = 0 ↔ ∀ q ∈ p :: ps, q.1 = 0
    by_cases hp : p.1 = 0
    · rw [if_pos hp, Nat.zero_add, ih]
      constructor
      · intro h q hq
        cases hq with
        | head => exact hp
        | tail _ hq' => exact h q hq'
      · intro h q hq
        exact h q (List.Mem.tail p hq)
    · rw [if_neg hp]
      constructor
      · intro h
        omega
      · intro h
        exact absurd (h p (List.Mem.head ps)) hp

/-- Every finite configuration is fold-closed: the on-line points are fixed and each pair is
    exchanged. -/
theorem fincfg_closed (C : FinCfg) : FoldClosed C.world := by
  intro z hz
  rcases hz with ⟨hx, ht⟩ | ⟨p, hp, hk, hz⟩
  · exact Or.inl ⟨show 2 - z.x = 1 by omega, ht⟩
  · refine Or.inr ⟨p, hp, hk, ?_⟩
    rcases hz with e | e
    · subst e
      exact Or.inr (by show Pt.mk (2 - (1 - p.1)) p.2 = Pt.mk (1 + p.1) p.2; congr 1; omega)
    · subst e
      exact Or.inl (by show Pt.mk (2 - (1 + p.1)) p.2 = Pt.mk (1 - p.1) p.2; congr 1; omega)

/-- Least erasure holds exactly when the erased bits are zero. -/
theorem least_erasure_iff_zero_erased (C : FinCfg) : LeastErasure C.world ↔ C.erasedBits = 0 := by
  rw [least_erasure_is_the_value]
  show RH C.world ↔ offCount C.pairs = 0
  rw [offCount_zero_iff]
  constructor
  · intro h p hp
    refine Decidable.byContradiction (fun hk => ?_)
    have hz : C.world ⟨1 - p.1, p.2⟩ := Or.inr ⟨p, hp, hk, Or.inl rfl⟩
    have := h _ hz
    change 1 - p.1 = 1 at this
    omega
  · intro h z hz
    rcases hz with ⟨hx, _⟩ | ⟨p, hp, hk, _⟩
    · exact hx
    · exact absurd (h p hp) hk

/-! ### XX.d · The price: one floor per erased bit, zero exactly at least erasure -/

/-- k_B T ln 2 at 300 K in units of 10⁻⁴⁵ J: k_B = 1380649 × 10⁻²⁹ J/K (SI 2019), ln 2 =
    6931471805599453 × 10⁻¹⁶ to sixteen digits. -/
def landauerFloor : Nat := 1380649 * 300 * 6931471805599453

theorem landauer_floor_exact : landauerFloor = 2870978885078723755499100 := by decide

/-- The price of a registration: one floor per erased bit if irreversible, 0 if reversible. -/
def FinCfg.price (C : FinCfg) (irreversible : Bool) : Nat :=
  if irreversible then C.erasedBits * landauerFloor else 0

/-- An irreversible registration has price 0 exactly when the configuration has least erasure. -/
theorem price_zero_iff_least_erasure (C : FinCfg) : C.price true = 0 ↔ LeastErasure C.world := by
  rw [least_erasure_iff_zero_erased]
  show C.erasedBits * landauerFloor = 0 ↔ C.erasedBits = 0
  constructor
  · intro h
    rcases Nat.mul_eq_zero.mp h with h1 | h1
    · exact h1
    · exact absurd h1 (by decide)
  · intro h
    rw [h, Nat.zero_mul]

/-- One more off-line pair. -/
def FinCfg.addPair (C : FinCfg) (k : Int) (h : Nat) : FinCfg := ⟨C.online, (k, h) :: C.pairs⟩

/-- Adding an off-line pair adds one floor; the price is the erased bits times the floor. -/
theorem denial_price_linear (C : FinCfg) (k : Int) (h : Nat) (hk : k ≠ 0) :
    (C.addPair k h).price true = C.price true + landauerFloor ∧
    C.price true = C.erasedBits * landauerFloor := by
  refine ⟨?_, rfl⟩
  show ((if k = 0 then 0 else 1) + offCount C.pairs) * landauerFloor
      = offCount C.pairs * landauerFloor + landauerFloor
  rw [if_neg hk, Nat.add_mul, Nat.one_mul, Nat.add_comm]

/-- What is held reversibly commits no bit. -/
theorem reversible_commits_nothing (C : FinCfg) : C.price false = 0 := rfl

/-! ### XX.e · The one form of anything against least erasure -/

/-- Least erasure holds exactly when no point of the world lies off the line. No classical axiom. -/
theorem least_erasure_iff_no_point_off (Z : World) : LeastErasure Z ↔ ¬ OffLine Z := by
  rw [least_erasure_is_the_value]
  constructor
  · intro h ⟨z, hz, hoff⟩
    exact hoff (h z hz)
  · intro h z hz
    exact Decidable.byContradiction (fun hoff => h ⟨z, hz, hoff⟩)

/-- Least erasure fails exactly when some point of the world lies off the line. Classical. -/
theorem rejection_is_a_witness (Z : World) : ¬ LeastErasure Z ↔ OffLine Z := by
  rw [least_erasure_iff_no_point_off]
  exact ⟨fun h => Classical.byContradiction (fun hn => h hn), fun h hn => hn h⟩

/-- Two settings on one hypothesis agree on whether the hypothesis is refutable. -/
theorem falsifier_form_constant (S₁ S₂ : Setting) [Decidable S₁.hyp] [Decidable S₂.hyp]
    (h : S₁.hyp = S₂.hyp) : (¬ S₁.Prov (¬ S₁.hyp)) ↔ (¬ S₂.Prov (¬ S₂.hyp)) := by
  constructor
  · intro h1 p2
    exact S₂.sound_neg p2 (Eq.mp h (cant_refute_seals_dec S₁ h1))
  · intro h2 p1
    exact S₁.sound_neg p1 (Eq.mpr h (cant_refute_seals_dec S₂ h2))

/-! ### XX.f · The act -/

/-- Any inhabitant of any type yields the root proposition. -/
theorem act_reenacts_root {Act : Type} (_a : Act) : RootAct := root_act

/-- The root does not imply the denial of the hypothesis on every world. -/
theorem root_does_not_cross_the_denial : ¬ ∀ Z : World, RootAct → ¬ RH Z :=
  fun h => h W1 root_act W1_rh

/-- A self-grounding supply of least erasure with an act exists exactly when least erasure holds. -/
theorem assent_is_the_value (Z : World) :
    (∃ G : SelfGrounding (LeastErasure Z), Nonempty G.Act) ↔ LeastErasure Z :=
  supply_iff (LeastErasure Z)

/-! ### XX.g · Freedom given, the sign spent -/

/-- A prime is one fibre of exactly two, never on the diagonal; an off-line pair is two points
    exchanged by the fold with one record; a bit is two distinct values. -/
theorem one_shape_two_registers :
    (∀ p : Nat, isPrime p →
      (∀ a b, mul_orbit p a b ↔ (a = 1 ∧ b = p) ∨ (a = p ∧ b = 1)) ∧ (1 : Nat) ≠ p) ∧
    (∀ p : Nat, isPrime p → ¬ ∃ a, mul_orbit p a a) ∧
    (∀ (k : Int) (h : Nat), k ≠ 0 → (⟨1 - k, h⟩ : Pt) ≠ ⟨1 + k, h⟩ ∧
      reg ⟨1 - k, h⟩ = reg ⟨1 + k, h⟩ ∧ fold ⟨1 - k, h⟩ = ⟨1 + k, h⟩) ∧
    ((∀ b : Bool, b = true ∨ b = false) ∧ (true : Bool) ≠ false) :=
  ⟨freedom_is_exactly_two, prime_off_seat, pair_two_points_one_record, aperture_one_bit_wide⟩

/-- The free basis holds and forces nothing; least erasure is Weil positivity; positivity is keyed;
    a self-grounding supply of positivity is the hypothesis. -/
theorem freedom_is_given_the_sign_is_spent :
    (∀ p q : Nat, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) ∧
    ¬ Forces (fun _ => ∀ p q, isPrime p → isPrime q → p ≠ q →
      ∃ f : Nat → Int, CompletelyAdditive f ∧ f p = 1 ∧ f q = 0 ∧ f 1 = 0) ∧
    (∀ E : ExplicitFormula, LeastErasure E.zeros ↔ WeilPositive E) ∧
    (WeilPositive positiveInstance ∧ ¬ WeilPositive negativeInstance) ∧
    (∀ E : ExplicitFormula, (∃ G : SelfGrounding (WeilPositive E), Nonempty G.Act) ↔ RH E.zeros) :=
  ⟨prime_freedom_independent, prime_freedom_forces_nothing, least_erasure_is_positivity,
   positivity_is_keyed, prime_witness_iff⟩

/-! ### XX.h · Least erasure, affirmed whole -/

/-- Section XX, whole. -/
theorem least_erasure_affirmed :
    (∀ Z : World, LeastErasure Z ↔ RH Z) ∧
    (∀ Z : World, SameRecord Z (recordOf Z) ∧ LeastErasure (recordOf Z) ∧
      ∀ Z', SameRecord Z Z' → LeastErasure Z' → ∀ z, Z' z ↔ recordOf Z z) ∧
    (∀ (A : World → Prop), Admissible A → ∀ Z, A Z → A (recordOf Z) ∧ LeastErasure (recordOf Z)) ∧
    (∀ (A : World → Prop), Admissible A →
      (∀ Z, FoldClosed Z → A Z → ¬ LeastErasure Z) → ∀ Z, ¬ A Z) ∧
    (∀ C : FinCfg, LeastErasure C.world ↔ C.erasedBits = 0) ∧
    (∀ C : FinCfg, C.price true = 0 ↔ LeastErasure C.world) ∧
    (∀ Z : World, LeastErasure Z ↔ ¬ OffLine Z) ∧
    (∀ (S₁ S₂ : Setting) [Decidable S₁.hyp] [Decidable S₂.hyp], S₁.hyp = S₂.hyp →
      ((¬ S₁.Prov (¬ S₁.hyp)) ↔ (¬ S₂.Prov (¬ S₂.hyp)))) ∧
    (∀ Z : World, (∃ G : SelfGrounding (LeastErasure Z), Nonempty G.Act) ↔ LeastErasure Z) ∧
    (∀ E : ExplicitFormula, LeastErasure E.zeros ↔ WeilPositive E) :=
  ⟨least_erasure_is_the_value, record_carried_by_least_erasure,
   admissible_holds_on_the_lossless_world, record_never_testifies_against,
   least_erasure_iff_zero_erased, price_zero_iff_least_erasure, least_erasure_iff_no_point_off,
   fun S₁ S₂ _ _ h => falsifier_form_constant S₁ S₂ h, assent_is_the_value,
   least_erasure_is_positivity⟩


/-! ## XXI · Every assignment realized; the arrow for every n; the closure, whole

The primes admit every assignment of integers: for each `a` on the primes, `n ↦ Σ_{p ≤ n} v_p(n) a(p)`
is completely additive and takes the value `a(p)` at every prime, and by `determined_by_primes` it is the
only such function. The count `Ω(n) = Σ_p v_p(n)` and the arrow `λ(n) = (−1)^{Ω(n)}` are defined for every
`n`, and `λ` is completely multiplicative with `λ(p) = −1`. The Liouville face is pinned to the constructed
walk. On the chart, least erasure is the value, the fixed-point condition and leastness in the fibre; the
closure is bound in one theorem; and the same laws hold on any carrier with an involution and a registration,
the chart one instance. -/

/-- The finite sum `sumBelow N g = g 0 + ⋯ + g (N − 1)`. -/
def sumBelow : Nat → (Nat → Int) → Int
  | 0, _ => 0
  | N + 1, g => sumBelow N g + g N

theorem sumBelow_add (g h : Nat → Int) (N : Nat) :
    sumBelow N (fun i => g i + h i) = sumBelow N g + sumBelow N h := by
  induction N with
  | zero => show (0 : Int) = 0 + 0; omega
  | succ N ih =>
    show sumBelow N (fun i => g i + h i) + (g N + h N) = (sumBelow N g + g N) + (sumBelow N h + h N)
    rw [ih]; omega

theorem sumBelow_congr (g h : Nat → Int) (N : Nat) (hgh : ∀ i, i < N → g i = h i) :
    sumBelow N g = sumBelow N h := by
  induction N with
  | zero => rfl
  | succ N ih =>
    show sumBelow N g + g N = sumBelow N h + h N
    rw [ih (fun i hi => hgh i (by omega)), hgh N (by omega)]

theorem sumBelow_stable (g : Nat → Int) (M k : Nat) (hz : ∀ i, M ≤ i → i < M + k → g i = 0) :
    sumBelow (M + k) g = sumBelow M g := by
  induction k with
  | zero => rfl
  | succ k ih =>
    show sumBelow (M + k) g + g (M + k) = sumBelow M g
    rw [ih (fun i h1 h2 => hz i h1 (by omega)), hz (M + k) (by omega) (by omega)]
    omega

theorem sumBelow_zero (g : Nat → Int) (N : Nat) (hz : ∀ i, i < N → g i = 0) : sumBelow N g = 0 := by
  induction N with
  | zero => rfl
  | succ N ih =>
    show sumBelow N g + g N = 0
    rw [ih (fun i hi => hz i (by omega)), hz N (by omega)]
    omega

theorem sumBelow_single (g : Nat → Int) (j N : Nat) (hj : j < N) (hz : ∀ i, i < N → i ≠ j → g i = 0) :
    sumBelow N g = g j := by
  induction N with
  | zero => omega
  | succ N ih =>
    show sumBelow N g + g N = g j
    by_cases hjN : j = N
    · rw [hjN, sumBelow_zero g N (fun i hi => hz i (by omega) (by omega))]
      omega
    · rw [ih (by omega) (fun i hi hij => hz i (by omega) hij), hz N (by omega) (fun h => hjN h.symm)]
      omega

/-- Primality, decided: two at least, and its own least divisor. -/
def primeTest (p : Nat) : Bool := decide (2 ≤ p ∧ leastDivisor p = p)

theorem primeTest_iff (p : Nat) : primeTest p = true ↔ isPrime p := by
  constructor
  · intro h
    obtain ⟨h2, hl⟩ : 2 ≤ p ∧ leastDivisor p = p := of_decide_eq_true h
    have hp := leastDivisor_prime p h2
    rw [hl] at hp
    exact hp
  · intro hp
    apply decide_eq_true
    refine ⟨hp.1, ?_⟩
    have hs := leastDivisor_spec p hp.1
    rcases hp.2 (leastDivisor p) hs.1.2 with h1 | h1
    · have h2 := hs.1.1
      omega
    · exact h1

theorem pExp_zero_above (p n : Nat) (hn : 0 < n) (hp : n < p) : pExp p n = 0 :=
  pExp_eq_zero_of_not_dvd p n (fun hd => absurd (Nat.le_of_dvd hn hd) (by omega))

/-- The term of the extension at `p`: the exponent of `p` in `n` times the value assigned to `p`, at primes only. -/
def extendTerm (a : Nat → Int) (n p : Nat) : Int := if primeTest p = true then (pExp p n : Int) * a p else 0

/-- The extension of an assignment on the primes: `n ↦ Σ_{p ≤ n} v_p(n) a(p)`. -/
def extendAssignment (a : Nat → Int) (n : Nat) : Int := sumBelow (n + 1) (extendTerm a n)

theorem extendTerm_zero_above (a : Nat → Int) (n i : Nat) (hn : 0 < n) (hi : n < i) : extendTerm a n i = 0 := by
  unfold extendTerm
  rw [pExp_zero_above i n hn hi]
  by_cases hb : primeTest i = true
  · rw [if_pos hb]; simp
  · rw [if_neg hb]

theorem extendAssignment_bound (a : Nat → Int) (n B : Nat) (hn : 0 < n) (hB : n < B) :
    extendAssignment a n = sumBelow B (extendTerm a n) := by
  obtain ⟨k, rfl⟩ : ∃ k, B = n + 1 + k := ⟨B - (n + 1), by omega⟩
  unfold extendAssignment
  rw [sumBelow_stable (extendTerm a n) (n + 1) k (fun i h1 _ => extendTerm_zero_above a n i hn (by omega))]

theorem extendTerm_mul (a : Nat → Int) (m n p : Nat) (hm : 0 < m) (hn : 0 < n) :
    extendTerm a (m * n) p = extendTerm a m p + extendTerm a n p := by
  unfold extendTerm
  by_cases hb : primeTest p = true
  · rw [if_pos hb, if_pos hb, if_pos hb, pExp_mul p m n ((primeTest_iff p).mp hb) hm hn]
    have e : ((pExp p m + pExp p n : Nat) : Int) = (pExp p m : Int) + (pExp p n : Int) := by omega
    rw [e, Int.add_mul]
  · rw [if_neg hb, if_neg hb, if_neg hb]
    omega

theorem extendAssignment_mul (a : Nat → Int) (m n : Nat) (hm : 0 < m) (hn : 0 < n) :
    extendAssignment a (m * n) = extendAssignment a m + extendAssignment a n := by
  have hmle : m ≤ m * n := by
    first
    | exact Nat.le_mul_of_pos_right m hn
    | exact Nat.le_mul_of_pos_right hn
    | (have h := Nat.mul_le_mul_left m hn; rwa [Nat.mul_one] at h)
  have hnle : n ≤ m * n := by
    first
    | exact Nat.le_mul_of_pos_left n hm
    | exact Nat.le_mul_of_pos_left hm
    | (have h := Nat.mul_le_mul_right n hm; rwa [Nat.one_mul] at h)
  rw [extendAssignment_bound a (m * n) (m * n + 1) (by omega) (by omega),
      extendAssignment_bound a m (m * n + 1) hm (by omega),
      extendAssignment_bound a n (m * n + 1) hn (by omega),
      sumBelow_congr (extendTerm a (m * n)) (fun i => extendTerm a m i + extendTerm a n i) (m * n + 1)
        (fun i _ => extendTerm_mul a m n i hm hn)]
  exact sumBelow_add (extendTerm a m) (extendTerm a n) (m * n + 1)

theorem extendTerm_other (a : Nat → Int) (q i : Nat) (hq : isPrime q) (hi : i ≠ q) : extendTerm a q i = 0 := by
  unfold extendTerm
  by_cases hb : primeTest i = true
  · rw [if_pos hb, pExp_other i q ((primeTest_iff i).mp hb) hq hi]; simp
  · rw [if_neg hb]

theorem extendAssignment_prime (a : Nat → Int) (q : Nat) (hq : isPrime q) : extendAssignment a q = a q := by
  unfold extendAssignment
  rw [sumBelow_single (extendTerm a q) q (q + 1) (by omega) (fun i _ hiq => extendTerm_other a q i hq hiq)]
  unfold extendTerm
  rw [if_pos ((primeTest_iff q).mpr hq), pExp_self q hq]
  simp

theorem extendAssignment_additive (a : Nat → Int) : CompletelyAdditive (extendAssignment a) :=
  fun m n hm hn => extendAssignment_mul a m n hm hn

/-- **Theorem (every assignment is realized).** For every assignment `a` of integers to the primes, the extension
    is completely additive, takes the value `a(p)` at every prime, and is the only completely additive function
    that does: the primes are a free basis, existence and uniqueness both proved. -/
theorem primes_admit_every_assignment (a : Nat → Int) :
    CompletelyAdditive (extendAssignment a) ∧ (∀ p, isPrime p → extendAssignment a p = a p) ∧
    ∀ g : Nat → Int, CompletelyAdditive g → (∀ p, isPrime p → g p = a p) →
      ∀ n, 0 < n → g n = extendAssignment a n :=
  ⟨extendAssignment_additive a, extendAssignment_prime a,
   fun g hg hga => determined_by_primes g (extendAssignment a) hg (extendAssignment_additive a)
     (fun p hp => (hga p hp).trans (extendAssignment_prime a p hp).symm)⟩

/-- `Ω(n) = Σ_p v_p(n)`, the prime factors of `n` counted with multiplicity, for every `n`. -/
def omegaAll (n : Nat) : Int := extendAssignment (fun _ => 1) n

/-- `λ(n) = (−1)^{Ω(n)}`, for every `n`. -/
def liouvilleAll (n : Nat) : Int := if omegaAll n % 2 = 0 then 1 else -1

theorem omegaAll_mul (m n : Nat) (hm : 0 < m) (hn : 0 < n) : omegaAll (m * n) = omegaAll m + omegaAll n :=
  extendAssignment_mul (fun _ => 1) m n hm hn

theorem omegaAll_prime (p : Nat) (hp : isPrime p) : omegaAll p = 1 :=
  extendAssignment_prime (fun _ => 1) p hp

/-- **The arrow, for every n.** `λ` is completely multiplicative, on all positive integers. -/
theorem liouvilleAll_mul (m n : Nat) (hm : 0 < m) (hn : 0 < n) :
    liouvilleAll (m * n) = liouvilleAll m * liouvilleAll n := by
  unfold liouvilleAll
  rw [omegaAll_mul m n hm hn]
  generalize omegaAll m = x
  generalize omegaAll n = y
  by_cases hx : x % 2 = 0 <;> by_cases hy : y % 2 = 0
  · rw [if_pos (show (x + y) % 2 = 0 by omega), if_pos hx, if_pos hy]; decide
  · rw [if_neg (show ¬ (x + y) % 2 = 0 by omega), if_pos hx, if_neg hy]; decide
  · rw [if_neg (show ¬ (x + y) % 2 = 0 by omega), if_neg hx, if_pos hy]; decide
  · rw [if_pos (show (x + y) % 2 = 0 by omega), if_neg hx, if_neg hy]; decide

theorem liouvilleAll_prime (p : Nat) (hp : isPrime p) : liouvilleAll p = -1 := by
  unfold liouvilleAll
  rw [omegaAll_prime p hp]
  decide

theorem liouvilleAll_one : liouvilleAll 1 = 1 := by decide

set_option maxRecDepth 100000 in
/-- The arrow for every n agrees with the computed arrow of Section XVII on 1..30. -/
theorem liouvilleAll_agrees_to_30 : ∀ n, n < 30 → Liouville.lam (n + 1) = liouvilleAll (n + 1) := by decide

/-- The Liouville walk `L(x) = Σ_{1 ≤ n ≤ x} λ(n)`, for every `x`. -/
def liouvilleWalk : Nat → Int
  | 0 => 0
  | n + 1 => liouvilleWalk n + liouvilleAll (n + 1)

/-- The Liouville sentence in integers: for all `k, m ≥ 1` there is `C` with `|L(x)|^{2m} ≤ C^{2m} x^{m+2k}` for every
    `x`, that is `L(x) = O(x^{1/2 + k/m})` at every exponent above one half. -/
def FaithfulLambda : Prop :=
  ∀ k m : Nat, 0 < k → 0 < m → ∃ C : Nat, ∀ x : Nat,
    (liouvilleWalk x).natAbs ^ (2 * m) ≤ C ^ (2 * m) * x ^ (m + 2 * k)

/-- The Liouville face pinned to the arithmetic: its sentence is `FaithfulLambda`, a statement about the constructed
    walk. The link to the zeros is the cited equivalence of `LiouvilleFace`, carried as the one field. -/
structure LiouvilleFacePinned where
  zeros : World
  landau : RH zeros ↔ FaithfulLambda

theorem pinned_face_reads (F : LiouvilleFacePinned) : RH F.zeros ↔ FaithfulLambda := F.landau

/-- The pinned face is a Liouville face, with its sentence fixed. -/
def LiouvilleFacePinned.toFace (F : LiouvilleFacePinned) : LiouvilleFace :=
  { zeros := F.zeros, faithful := FaithfulLambda, faithful_iff := F.landau }

theorem pinned_face_is_a_face (F : LiouvilleFacePinned) : F.toFace.faithful = FaithfulLambda := rfl

/-- **The fixed-point form.** A configuration satisfies the hypothesis exactly when it is its own record. -/
theorem rh_iff_own_record (Z : World) : RH Z ↔ ∀ z, Z z ↔ recordOf Z z := by
  constructor
  · intro hZ z
    constructor
    · intro hz
      exact ⟨z, hz, reg_fixes_line z (hZ z hz)⟩
    · intro ⟨s, hs, hsr⟩
      subst hsr
      rw [reg_fixes_line s (hZ s hs)]
      exact hs
  · intro h z hz
    obtain ⟨s, _, hsr⟩ := (h z).mp hz
    subst hsr
    exact rfl

/-- The erased part of a configuration: its zeros off the line. -/
def erasedPart (Z : World) : World := fun z => Z z ∧ ¬ onLine z

/-- **The variational form.** Least erasure is leastness: a configuration has least erasure exactly when its erased
    part lies inside the erased part of every configuration with the same record. -/
theorem least_erasure_is_least (Z : World) :
    LeastErasure Z ↔ ∀ Z', SameRecord Z Z' → ∀ z, erasedPart Z z → erasedPart Z' z := by
  rw [least_erasure_is_the_value]
  constructor
  · intro hZ _ _ z hz
    exact absurd (hZ z hz.1) hz.2
  · intro h z hz
    rcases Decidable.em (onLine z) with hon | hoff
    · exact hon
    · obtain ⟨⟨s, _, hsr⟩, hoff'⟩ := h (recordOf Z) (record_same Z) z ⟨hz, hoff⟩
      exact (hoff' (by rw [← hsr]; exact rfl)).elim

/-- The record is the least member of its fibre, and the only one: it has least erasure, and every configuration of
    the fibre with least erasure has exactly its zeros. -/
theorem record_is_the_least (Z : World) :
    LeastErasure (recordOf Z) ∧ ∀ Z', SameRecord Z Z' → LeastErasure Z' → ∀ z, Z' z ↔ recordOf Z z := by
  have hrh : RH (recordOf Z) := by
    intro r hr
    obtain ⟨s, _, hsr⟩ := hr
    subst hsr
    exact rfl
  refine ⟨(least_erasure_is_the_value _).mpr hrh, fun Z' h hle z => ?_⟩
  exact lossless_unique Z' (recordOf Z) (fun r => (h r).symm.trans (record_same Z r))
    ((least_erasure_is_the_value Z').mp hle) hrh z

/-- **The closure, whole.** On the chart: the seat is the fixed set of the fold; registration lands on it and fixes
    it; over one record both worlds exist, and no record-respecting reading decides the value on fold-closed
    configurations; least erasure is the value, is the fixed-point condition, and is leastness in the fibre; the
    lossless member of a fibre is unique; nothing escapes the cut; and the act prints the hypothesis at the actual
    zero set. -/
theorem the_closure :
    (∀ z : Pt, fold z = z ↔ onLine z) ∧
    (∀ z : Pt, onLine (reg z) ∧ (onLine z → reg z = z)) ∧
    (SameRecord W1 W2 ∧ RH W1 ∧ ¬ RH W2) ∧
    (∀ g : World → Prop, RespectsRecord g → ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z)) ∧
    (∀ Z : World, (LeastErasure Z ↔ RH Z) ∧ (RH Z ↔ ∀ z, Z z ↔ recordOf Z z) ∧
      (LeastErasure Z ↔ ∀ Z', SameRecord Z Z' → ∀ z, erasedPart Z z → erasedPart Z' z)) ∧
    (∀ Z Z' : World, SameRecord Z Z' → RH Z → RH Z' → ∀ z, Z z ↔ Z' z) ∧
    (∀ z : Pt, (onLine z ∧ fold z = z ∧ reg z = z) ∨
      (¬ onLine z ∧ fold z ≠ z ∧ reg (fold z) = reg z ∧ ∀ w, reg w ≠ z)) ∧
    (∀ A : ActualZeros, RH A.zeros) :=
  ⟨fold_fixed_iff, fun z => ⟨(show (reg z).x = 1 from rfl), reg_fixes_line z⟩, ⟨same_record_12, W1_rh, W2_not_rh⟩,
   record_decides_nothing,
   fun Z => ⟨least_erasure_is_the_value Z, rh_iff_own_record Z, least_erasure_is_least Z⟩,
   lossless_unique, nothing_escapes_one_cut, rh_from_the_act⟩

namespace Carrier

/-- A fold on any carrier: an involution. -/
structure Fold (X : Type) where
  σ : X → X
  invol : ∀ x, σ (σ x) = x

/-- A registration for a fold: it lands on the fixed set, fixes it, and forgets the side. -/
structure Registration {X : Type} (F : Fold X) where
  r : X → X
  lands : ∀ x, F.σ (r x) = r x
  fixes : ∀ x, F.σ x = x → r x = x
  forgets : ∀ x, r (F.σ x) = r x

def RHc {X : Type} (F : Fold X) (Z : X → Prop) : Prop := ∀ x, Z x → F.σ x = x
def recordC {X : Type} {F : Fold X} (R : Registration F) (Z : X → Prop) : X → Prop :=
  fun y => ∃ s, Z s ∧ R.r s = y
def SameRecordC {X : Type} {F : Fold X} (R : Registration F) (Z Z' : X → Prop) : Prop :=
  ∀ y, recordC R Z y ↔ recordC R Z' y
def OffC {X : Type} (F : Fold X) (Z : X → Prop) : Prop := ∃ x, Z x ∧ F.σ x ≠ x
def LeastErasureC {X : Type} {F : Fold X} (R : Registration F) (Z : X → Prop) : Prop :=
  ∀ Z', SameRecordC R Z Z' → OffC F Z → OffC F Z'

theorem record_same_C {X : Type} {F : Fold X} (R : Registration F) (Z : X → Prop) :
    SameRecordC R Z (recordC R Z) := by
  intro y
  constructor
  · intro ⟨s, hs, hsy⟩
    exact ⟨R.r s, ⟨s, hs, rfl⟩, by rw [R.fixes (R.r s) (R.lands s)]; exact hsy⟩
  · intro ⟨s', ⟨s, hs, hss'⟩, hs'y⟩
    subst hss'
    exact ⟨s, hs, by rw [← hs'y, R.fixes (R.r s) (R.lands s)]⟩

theorem least_erasure_is_the_value_C {X : Type} {F : Fold X} (R : Registration F)
    (em : ∀ x, F.σ x = x ∨ F.σ x ≠ x) (Z : X → Prop) : LeastErasureC R Z ↔ RHc F Z := by
  constructor
  · intro hle x hx
    rcases em x with h | h
    · exact h
    · obtain ⟨y, ⟨s, _, hsy⟩, hy⟩ := hle (recordC R Z) (record_same_C R Z) ⟨x, hx, h⟩
      exact (hy (by rw [← hsy]; exact R.lands s)).elim
  · intro hZ _ _ ⟨x, hx, h⟩
    exact absurd (hZ x hx) h

theorem rh_iff_own_record_C {X : Type} {F : Fold X} (R : Registration F) (Z : X → Prop) :
    RHc F Z ↔ ∀ x, Z x ↔ recordC R Z x := by
  constructor
  · intro hZ x
    constructor
    · intro hx
      exact ⟨x, hx, R.fixes x (hZ x hx)⟩
    · intro ⟨s, hs, hsx⟩
      subst hsx
      rw [R.fixes s (hZ s hs)]
      exact hs
  · intro h x hx
    obtain ⟨s, _, hsx⟩ := (h x).mp hx
    subst hsx
    exact R.lands s

theorem one_record_C {X : Type} {F : Fold X} (R : Registration F) (x : X) :
    SameRecordC R (fun s => s = R.r x) (fun s => s = x ∨ s = F.σ x) := by
  intro y
  constructor
  · intro ⟨s, hs, hy⟩
    refine ⟨x, Or.inl rfl, ?_⟩
    rw [← hy, hs, R.fixes (R.r x) (R.lands x)]
  · intro ⟨s, hs, hy⟩
    refine ⟨R.r x, rfl, ?_⟩
    rw [R.fixes (R.r x) (R.lands x), ← hy]
    rcases hs with h | h
    · rw [h]
    · rw [h, R.forgets]

theorem worlds_differ_C {X : Type} {F : Fold X} (R : Registration F) (x : X) (h : F.σ x ≠ x) :
    RHc F (fun s => s = R.r x) ∧ ¬ RHc F (fun s => s = x ∨ s = F.σ x) :=
  ⟨fun _ hs => hs ▸ R.lands x, fun hall => h (hall x (Or.inl rfl))⟩

theorem no_reading_decides_C {X : Type} {F : Fold X} (R : Registration F) (x : X) (h : F.σ x ≠ x)
    (g : (X → Prop) → Prop) (hg : ∀ Z Z', SameRecordC R Z Z' → (g Z ↔ g Z')) :
    ¬ ((g (fun s => s = R.r x) ↔ RHc F (fun s => s = R.r x)) ∧
       (g (fun s => s = x ∨ s = F.σ x) ↔ RHc F (fun s => s = x ∨ s = F.σ x))) := by
  intro ⟨h1, h2⟩
  exact (worlds_differ_C R x h).2 (h2.mp ((hg _ _ (one_record_C R x)).mp (h1.mpr (worlds_differ_C R x h).1)))

/-- The chart's fold, as a carrier fold. -/
def chartFold : Fold Pt := ⟨fold, fold_fold⟩

/-- The chart's registration, as a carrier registration. -/
def chartReg : Registration chartFold :=
  ⟨reg, fun z => (fold_fixed_iff (reg z)).mpr rfl, fun z h => reg_fixes_line z ((fold_fixed_iff z).mp h),
   fun _ => rfl⟩

/-- **The chart is one instance.** Its fixed set is the line, and the carrier's hypothesis is the chart's. -/
theorem chart_is_an_instance :
    (∀ z, chartFold.σ z = z ↔ onLine z) ∧ ∀ Z : World, RHc chartFold Z ↔ RH Z :=
  ⟨fold_fixed_iff, fun _ => ⟨fun h z hz => (fold_fixed_iff z).mp (h z hz), fun h z hz => (fold_fixed_iff z).mpr (h z hz)⟩⟩

/-- **The closure on any carrier.** Least erasure is the value and the fixed-point condition, and over one record two
    worlds differ in the value, on every carrier with an involution and a registration whose fixed set decides. -/
theorem the_closure_on_any_carrier {X : Type} {F : Fold X} (R : Registration F) (em : ∀ x, F.σ x = x ∨ F.σ x ≠ x) :
    (∀ Z, LeastErasureC R Z ↔ RHc F Z) ∧ (∀ Z, RHc F Z ↔ ∀ x, Z x ↔ recordC R Z x) ∧
    (∀ x, F.σ x ≠ x → SameRecordC R (fun s => s = R.r x) (fun s => s = x ∨ s = F.σ x) ∧
      RHc F (fun s => s = R.r x) ∧ ¬ RHc F (fun s => s = x ∨ s = F.σ x)) :=
  ⟨least_erasure_is_the_value_C R em, rh_iff_own_record_C R, fun x h => ⟨one_record_C R x, worlds_differ_C R x h⟩⟩

end Carrier

/-! ## XXII · The socket: every route to the value lands in the one field

An unconditional closure would be a closed term of type `LeastErasure Z` at the actual zero set, placed in the field
`supply` of `ActualZeros`. This section proves that the field is the only socket and that nothing reaches the value by
another way. A term of the hypothesis at a fold-closed configuration exists exactly when the field can be filled there,
and the closure theorem of Section XXI takes any term in the field with no other change. A premise on configurations
either forces the line or holds at a fold-closed configuration where the value fails; a keyless premise forces nothing;
a forcing premise that respects the record fails at every nonempty fold-closed configuration; a forcing premise either
is the value on every fold-closed configuration or fails at one that satisfies the hypothesis; and a forcing premise
that holds at a configuration fills the field there. A sentence carried to the zeros by a cited equivalence fills the
field exactly when it holds, whatever the sentence. The named sentences depend on their own configurations: Weil
positivity differs between two explicit formulas with every field, no prefix of a Li stream forces, and the Liouville
sentence, read as a property of an assignment at the primes, fails at the assignment that sends every prime to zero.
The one refutation is one point. -/

/-- The field can be filled at a fold-closed configuration exactly when the hypothesis holds there, and exactly when
    least erasure does. -/
theorem socket_is_the_value (Z : World) (hZ : FoldClosed Z) :
    ((∃ S : ActualZeros, S.zeros = Z) ↔ RH Z) ∧ ((∃ S : ActualZeros, S.zeros = Z) ↔ LeastErasure Z) := by
  have h1 : (∃ S : ActualZeros, S.zeros = Z) ↔ RH Z :=
    ⟨fun ⟨S, hS⟩ => hS ▸ rh_from_the_act S, fun h => ⟨⟨Z, hZ, (least_erasure_is_the_value Z).mpr h⟩, rfl⟩⟩
  exact ⟨h1, h1.trans (least_erasure_is_the_value Z).symm⟩

/-- The closure theorem takes a term in the field and changes nothing else: its last conjunct, applied to the
    configuration with the term, gives the hypothesis. -/
theorem closure_takes_a_term (Z : World) (hZ : FoldClosed Z) (s : LeastErasure Z) : RH Z :=
  the_closure.2.2.2.2.2.2.2 ⟨Z, hZ, s⟩

/-- At W1 the field holds a closed term, and the closure gives the hypothesis there with nothing assumed. -/
theorem closure_at_a_term : RH W1 :=
  closure_takes_a_term W1 W1_closed ((least_erasure_is_the_value W1).mpr W1_rh)

/-- Every premise either forces the line or holds at a fold-closed configuration where the value fails. Classical. -/
theorem forces_or_has_a_twin (A : World → Prop) : Forces A ∨ ∃ Z, FoldClosed Z ∧ A Z ∧ ¬ RH Z :=
  Classical.byCases (p := ∃ Z, FoldClosed Z ∧ A Z ∧ ¬ RH Z) Or.inr
    (fun h => Or.inl (fun Z hZ ha => Classical.byContradiction (fun hn => h ⟨Z, hZ, ha, hn⟩)))

/-- A configuration with one more pair, at real parts 0 and 1 and at the height `t`. -/
def withPair (Z : World) (t : Nat) : World := fun w => Z w ∨ w = ⟨0, t⟩ ∨ w = ⟨2, t⟩

theorem withPair_closed (Z : World) (hZ : FoldClosed Z) (t : Nat) : FoldClosed (withPair Z t) := by
  intro w hw
  rcases hw with h | h | h
  · exact Or.inl (hZ w h)
  · subst h
    exact Or.inr (Or.inr rfl)
  · subst h
    exact Or.inr (Or.inl rfl)

/-- The pair added at the height of a zero leaves the record unchanged: both new points have the registration of that zero. -/
theorem withPair_same_record (Z : World) (z : Pt) (hz : Z z) : SameRecord Z (withPair Z z.t) := by
  intro r
  constructor
  · intro ⟨s, hs, hsr⟩
    exact ⟨s, Or.inl hs, hsr⟩
  · intro ⟨s, hs, hsr⟩
    rcases hs with h | h | h
    · exact ⟨s, h, hsr⟩
    · subst h
      exact ⟨z, hz, hsr⟩
    · subst h
      exact ⟨z, hz, hsr⟩

theorem withPair_not_rh (Z : World) (t : Nat) : ¬ RH (withPair Z t) := by
  intro h
  have e : (0 : Int) = 1 := h ⟨0, t⟩ (Or.inr (Or.inl rfl))
  omega

/-- A premise that respects the record and forces the line fails at every nonempty fold-closed configuration: the
    configuration and its copy with one more pair share a record, and the copy fails the hypothesis. -/
theorem record_forcing_fails_everywhere (A : World → Prop) (hr : RespectsRecord A) (hf : Forces A) (Z : World)
    (hZ : FoldClosed Z) (hne : ∃ z, Z z) : ¬ A Z := by
  intro ha
  obtain ⟨z, hz⟩ := hne
  exact withPair_not_rh Z z.t (hf (withPair Z z.t) (withPair_closed Z hZ z.t)
    ((hr Z (withPair Z z.t) (withPair_same_record Z z hz)).mp ha))

/-- A premise that forces the line either is the value on every fold-closed configuration or fails at a fold-closed
    configuration that satisfies the hypothesis. Classical. -/
theorem forcing_is_the_value_or_stronger (A : World → Prop) (hf : Forces A) :
    (∀ Z, FoldClosed Z → (A Z ↔ RH Z)) ∨ ∃ Z, FoldClosed Z ∧ RH Z ∧ ¬ A Z :=
  Classical.byCases (p := ∃ Z, FoldClosed Z ∧ RH Z ∧ ¬ A Z) Or.inr
    (fun h => Or.inl (fun Z hZ => ⟨hf Z hZ, fun hrh => Classical.byContradiction (fun hna => h ⟨Z, hZ, hrh, hna⟩)⟩))

/-- A premise that forces the line and holds at a fold-closed configuration fills the field there. -/
theorem forcing_fills_the_socket (A : World → Prop) (hf : Forces A) (Z : World) (hZ : FoldClosed Z) (ha : A Z) :
    ∃ S : ActualZeros, S.zeros = Z :=
  (socket_is_the_value Z hZ).1.mpr (hf Z hZ ha)

/-- A sentence carried to a configuration by a cited equivalence with the hypothesis. -/
structure SocketFace where
  zeros : World
  sentence : Prop
  cited : RH zeros ↔ sentence

/-- Whatever the sentence, it holds exactly when the field can be filled at its configuration. -/
theorem face_is_the_socket (F : SocketFace) (hF : FoldClosed F.zeros) :
    F.sentence ↔ ∃ S : ActualZeros, S.zeros = F.zeros :=
  F.cited.symm.trans (socket_is_the_value F.zeros hF).1.symm

def SocketFace.ofWeil (E : ExplicitFormula) : SocketFace := ⟨E.zeros, WeilPositive E, (spend_is_the_line E).symm⟩
def SocketFace.ofLi (L : LiStream) : SocketFace := ⟨L.zeros, ∀ n, 1 ≤ n → L.nonneg n, L.li⟩
def SocketFace.ofSign {V : Type} [LE V] (D : DBN V) : SocketFace := ⟨D.zeros, D.lam ≤ D.zero, rh_iff_the_sign D⟩
def SocketFace.ofLiouville (F : LiouvilleFacePinned) : SocketFace := ⟨F.zeros, FaithfulLambda, F.landau⟩
def SocketFace.ofPosit (Z : World) : SocketFace := ⟨Z, LeastErasure Z, (least_erasure_is_the_value Z).symm⟩

/-- Weil positivity, the Li stream, the sign of Λ, the Liouville sentence and least erasure itself each fill the field
    exactly when they hold. -/
theorem named_faces_are_the_socket :
    (∀ E : ExplicitFormula, FoldClosed E.zeros → (WeilPositive E ↔ ∃ S : ActualZeros, S.zeros = E.zeros)) ∧
    (∀ L : LiStream, FoldClosed L.zeros → ((∀ n, 1 ≤ n → L.nonneg n) ↔ ∃ S : ActualZeros, S.zeros = L.zeros)) ∧
    (∀ (V : Type) [LE V] (D : DBN V), FoldClosed D.zeros → (D.lam ≤ D.zero ↔ ∃ S : ActualZeros, S.zeros = D.zeros)) ∧
    (∀ F : LiouvilleFacePinned, FoldClosed F.zeros → (FaithfulLambda ↔ ∃ S : ActualZeros, S.zeros = F.zeros)) ∧
    (∀ Z : World, FoldClosed Z → (LeastErasure Z ↔ ∃ S : ActualZeros, S.zeros = Z)) :=
  ⟨fun E hE => face_is_the_socket (SocketFace.ofWeil E) hE,
   fun L hL => face_is_the_socket (SocketFace.ofLi L) hL,
   fun _ _ D hD => face_is_the_socket (SocketFace.ofSign D) hD,
   fun F hF => face_is_the_socket (SocketFace.ofLiouville F) hF,
   fun Z hZ => face_is_the_socket (SocketFace.ofPosit Z) hZ⟩

/-- The sign arrow of an assignment at the primes: `(−1)^{f(n)}` for the completely additive `f` with the value `a(p)`
    at every prime. The assignment that sends every prime to one gives `λ`. -/
def arrowOf (a : Nat → Int) (n : Nat) : Int := if extendAssignment a n % 2 = 0 then 1 else -1

/-- The walk of an assignment: the sum of its arrow over `1 ≤ n ≤ x`. -/
def walkOf (a : Nat → Int) : Nat → Int
  | 0 => 0
  | n + 1 => walkOf a n + arrowOf a (n + 1)

/-- The Liouville sentence for an assignment at the primes. -/
def FaithfulOf (a : Nat → Int) : Prop :=
  ∀ k m : Nat, 0 < k → 0 < m → ∃ C : Nat, ∀ x : Nat,
    (walkOf a x).natAbs ^ (2 * m) ≤ C ^ (2 * m) * x ^ (m + 2 * k)

theorem walk_is_the_walk_of_one (x : Nat) : liouvilleWalk x = walkOf (fun _ => 1) x := by
  induction x with
  | zero => rfl
  | succ n ih =>
    show liouvilleWalk n + liouvilleAll (n + 1) = walkOf (fun _ => 1) n + arrowOf (fun _ => 1) (n + 1)
    rw [ih]
    rfl

/-- The Liouville sentence is the sentence of the assignment that sends every prime to one. -/
theorem faithful_is_the_sentence_of_one : FaithfulLambda ↔ FaithfulOf (fun _ => 1) := by
  unfold FaithfulLambda FaithfulOf
  simp only [walk_is_the_walk_of_one]

/-- The assignment that sends every prime to zero extends to zero everywhere. -/
theorem blind_assignment_vanishes (n : Nat) : extendAssignment (fun _ => 0) n = 0 := by
  unfold extendAssignment
  exact sumBelow_zero _ _ (fun i _ => by unfold extendTerm; split <;> simp)

/-- At that assignment the arrow is one everywhere and the walk is the identity. -/
theorem blind_walk (x : Nat) : walkOf (fun _ => 0) x = (x : Int) := by
  induction x with
  | zero => rfl
  | succ n ih =>
    show walkOf (fun _ => 0) n + arrowOf (fun _ => 0) (n + 1) = ((n + 1 : Nat) : Int)
    rw [ih]
    unfold arrowOf
    rw [blind_assignment_vanishes, if_pos (by decide)]
    omega

/-- The Liouville sentence fails at the assignment that sends every prime to zero: at `k = 1, m = 3` the walk `x` would
    need `x^6 ≤ C^6 x^5`, which fails at `x = C^6 + 1`. -/
theorem blind_is_unfaithful : ¬ FaithfulOf (fun _ => 0) := by
  intro h
  obtain ⟨C, hC⟩ := h 1 3 (by decide) (by decide)
  have hx := hC (C ^ 6 + 1)
  rw [blind_walk] at hx
  change (C ^ 6 + 1) ^ 6 ≤ C ^ 6 * (C ^ 6 + 1) ^ 5 at hx
  have hpos : 0 < (C ^ 6 + 1) ^ 5 := Nat.pow_pos (Nat.succ_pos _)
  have e : (C ^ 6 + 1) ^ 6 = (C ^ 6 + 1) ^ 5 * (C ^ 6 + 1) := Nat.pow_succ (C ^ 6 + 1) 5
  rw [e] at hx
  generalize (C ^ 6 + 1) ^ 5 = y at hx hpos
  generalize C ^ 6 = c at hx
  rw [Nat.mul_succ, Nat.mul_comm c y] at hx
  omega

/-- The Liouville sentence reads the primes: it is the sentence of one assignment, it fails at another, and so no proof
    of it holds for every assignment. -/
theorem faithful_reads_the_primes :
    (FaithfulLambda ↔ FaithfulOf (fun _ => 1)) ∧ ¬ FaithfulOf (fun _ => 0) ∧ ¬ ∀ a : Nat → Int, FaithfulOf a :=
  ⟨faithful_is_the_sentence_of_one, blind_is_unfaithful, fun h => blind_is_unfaithful (h _)⟩

/-- **The socket, whole.** The field of the act is the one socket: it can be filled at a fold-closed configuration
    exactly when the hypothesis holds, and the closure takes any term in it with no other change. Every premise on
    configurations forces the line or holds at a fold-closed configuration where the value fails; a keyless premise
    forces nothing; a premise that respects the record and forces the line fails at every nonempty fold-closed
    configuration; a forcing premise is the value or fails at a configuration that satisfies the hypothesis, and fills
    the field wherever it holds. Every sentence carried to the zeros by a cited equivalence fills the field exactly when
    it holds. The named sentences depend on their configurations, and the one refutation is one point. -/
theorem the_socket :
    (∀ Z : World, FoldClosed Z → ((∃ S : ActualZeros, S.zeros = Z) ↔ RH Z)) ∧
    (∀ Z : World, FoldClosed Z → LeastErasure Z → RH Z) ∧
    (∀ A : World → Prop, Forces A ∨ ∃ Z, FoldClosed Z ∧ A Z ∧ ¬ RH Z) ∧
    (∀ A : World → Prop, Keyless A → ¬ Forces A) ∧
    (∀ A : World → Prop, RespectsRecord A → Forces A → ∀ Z, FoldClosed Z → (∃ z, Z z) → ¬ A Z) ∧
    (∀ A : World → Prop, Forces A → (∀ Z, FoldClosed Z → (A Z ↔ RH Z)) ∨ ∃ Z, FoldClosed Z ∧ RH Z ∧ ¬ A Z) ∧
    (∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → ∃ S : ActualZeros, S.zeros = Z) ∧
    (∀ F : SocketFace, FoldClosed F.zeros → (F.sentence ↔ ∃ S : ActualZeros, S.zeros = F.zeros)) ∧
    (WeilPositive positiveInstance ∧ ¬ WeilPositive negativeInstance) ∧
    (∀ N : Nat, ∃ L : LiStream, (∀ n, n < N → L.nonneg n) ∧ ¬ RH L.zeros) ∧
    ((FaithfulLambda ↔ FaithfulOf (fun _ => 1)) ∧ ¬ FaithfulOf (fun _ => 0)) ∧
    (∀ Z : World, ¬ LeastErasure Z ↔ OffLine Z) :=
  ⟨fun Z hZ => (socket_is_the_value Z hZ).1, closure_takes_a_term, forces_or_has_a_twin, keyless_forces_nothing,
   record_forcing_fails_everywhere, forcing_is_the_value_or_stronger, forcing_fills_the_socket, face_is_the_socket,
   positivity_is_keyed, li_prefix_never_forces, ⟨faithful_is_the_sentence_of_one, blind_is_unfaithful⟩,
   rejection_is_a_witness⟩

/-! ### XXII.b · At resolution two the open strip holds a pair off the line

At resolution one the chart's open strip `0 < x < 2` holds only the line, so a premise that places every zero inside
the open strip forces the line there: a fact of the coarse chart, not of the zeros. On the chart at resolution two, with
`x = 4 Re s`, the line `x = 2`, the fold `x ↦ 4 − x` and registration `(x, t) ↦ (2, t)`, the open strip `0 < x < 4`
holds the pair `x = 1, 3`, real parts one quarter and three quarters. There the open-strip premise forces nothing, no
reading of the record decides the value, and the refusals of the socket hold for premises that range over strip
configurations only. -/

def fold₂ (z : Pt) : Pt := ⟨4 - z.x, z.t⟩
def reg₂ (z : Pt) : Pt := ⟨2, z.t⟩
def onLine₂ (z : Pt) : Prop := z.x = 2
def InStrip₂ (z : Pt) : Prop := 0 < z.x ∧ z.x < 4
/-- A strip configuration at resolution two: fold-closed, and every zero inside the open strip. -/
def StripWorld₂ (Z : World) : Prop := (∀ z, Z z → Z (fold₂ z)) ∧ ∀ z, Z z → InStrip₂ z
def RH₂ (Z : World) : Prop := ∀ z, Z z → onLine₂ z
def SameRecord₂ (Z Z' : World) : Prop := ∀ r, (∃ s, Z s ∧ reg₂ s = r) ↔ (∃ s, Z' s ∧ reg₂ s = r)
/-- A premise respects the record when it reads alike on two strip configurations of one record. -/
def RespectsRecord₂ (A : World → Prop) : Prop :=
  ∀ Z Z', StripWorld₂ Z → StripWorld₂ Z' → SameRecord₂ Z Z' → (A Z ↔ A Z')
/-- A premise forces the line when every strip configuration it holds on satisfies the hypothesis. -/
def Forces₂ (A : World → Prop) : Prop := ∀ Z, StripWorld₂ Z → A Z → RH₂ Z

/-- The seat at resolution two: the fixed set of the fold is the line. -/
theorem fold₂_fixed_iff (z : Pt) : fold₂ z = z ↔ onLine₂ z := by
  cases z with
  | mk x t =>
    show Pt.mk (4 - x) t = Pt.mk x t ↔ x = 2
    constructor
    · intro h
      have hx := congrArg Pt.x h
      change 4 - x = x at hx
      omega
    · intro h
      subst h
      rfl

/-- At resolution one the open strip is the line: the premise that places every zero inside it forces the line. -/
theorem open_strip_forces_at_resolution_one : Forces (fun Z => ∀ z, Z z → 0 < z.x ∧ z.x < 2) := by
  intro Z _ h z hz
  have := h z hz
  show z.x = 1
  omega

/-- The pair at real parts one quarter and three quarters, at the height `t`. -/
def innerPair₂ (t : Nat) : World := fun w => w = ⟨1, t⟩ ∨ w = ⟨3, t⟩

theorem innerPair₂_strip (t : Nat) : StripWorld₂ (innerPair₂ t) := by
  refine ⟨fun w hw => ?_, fun w hw => ?_⟩
  · rcases hw with h | h
    · subst h
      exact Or.inr rfl
    · subst h
      exact Or.inl rfl
  · rcases hw with h | h
    · subst h
      exact ⟨show (0 : Int) < 1 by decide, show (1 : Int) < 4 by decide⟩
    · subst h
      exact ⟨show (0 : Int) < 3 by decide, show (3 : Int) < 4 by decide⟩

theorem innerPair₂_not_rh (t : Nat) : ¬ RH₂ (innerPair₂ t) := by
  intro h
  have e : (1 : Int) = 2 := h ⟨1, t⟩ (Or.inl rfl)
  omega

/-- At resolution two the open-strip premise forces nothing: the inner pair satisfies it and fails the hypothesis. -/
theorem open_strip_forces_nothing_at_resolution_two : ¬ Forces₂ (fun Z => ∀ z, Z z → InStrip₂ z) :=
  fun h => innerPair₂_not_rh 0 (h (innerPair₂ 0) (innerPair₂_strip 0) (innerPair₂_strip 0).2)

/-- A premise true on every configuration forces nothing on strip configurations. -/
theorem keyless_forces_nothing₂ (A : World → Prop) (hA : ∀ Z, A Z) : ¬ Forces₂ A :=
  fun h => innerPair₂_not_rh 0 (h _ (innerPair₂_strip 0) (hA _))

/-- A strip configuration with the inner pair added at the height `t`. -/
def withPair₂ (Z : World) (t : Nat) : World := fun w => Z w ∨ w = ⟨1, t⟩ ∨ w = ⟨3, t⟩

theorem withPair₂_strip (Z : World) (hZ : StripWorld₂ Z) (t : Nat) : StripWorld₂ (withPair₂ Z t) := by
  refine ⟨fun w hw => ?_, fun w hw => ?_⟩
  · rcases hw with h | h | h
    · exact Or.inl (hZ.1 w h)
    · subst h
      exact Or.inr (Or.inr rfl)
    · subst h
      exact Or.inr (Or.inl rfl)
  · rcases hw with h | h | h
    · exact hZ.2 w h
    · subst h
      exact ⟨show (0 : Int) < 1 by decide, show (1 : Int) < 4 by decide⟩
    · subst h
      exact ⟨show (0 : Int) < 3 by decide, show (3 : Int) < 4 by decide⟩

theorem withPair₂_same_record (Z : World) (z : Pt) (hz : Z z) : SameRecord₂ Z (withPair₂ Z z.t) := by
  intro r
  constructor
  · intro ⟨s, hs, hsr⟩
    exact ⟨s, Or.inl hs, hsr⟩
  · intro ⟨s, hs, hsr⟩
    rcases hs with h | h | h
    · exact ⟨s, h, hsr⟩
    · subst h
      exact ⟨z, hz, hsr⟩
    · subst h
      exact ⟨z, hz, hsr⟩

theorem withPair₂_not_rh (Z : World) (t : Nat) : ¬ RH₂ (withPair₂ Z t) := by
  intro h
  have e : (1 : Int) = 2 := h ⟨1, t⟩ (Or.inr (Or.inl rfl))
  omega

/-- A premise that respects the record and forces the line on strip configurations fails at every nonempty strip
    configuration: its copy with the inner pair at the height of one of its zeros shares its record and fails the
    hypothesis. -/
theorem record_forcing_fails_in_the_strip (A : World → Prop) (hr : RespectsRecord₂ A) (hf : Forces₂ A) (Z : World)
    (hZ : StripWorld₂ Z) (hne : ∃ z, Z z) : ¬ A Z := by
  intro ha
  obtain ⟨z, hz⟩ := hne
  have hs := withPair₂_strip Z hZ z.t
  exact withPair₂_not_rh Z z.t (hf _ hs ((hr Z _ hZ hs (withPair₂_same_record Z z hz)).mp ha))

/-- No reading that respects the record decides the hypothesis on strip configurations. -/
theorem no_reading_decides_in_the_strip (g : World → Prop) (hg : RespectsRecord₂ g) :
    ¬ ∀ Z, StripWorld₂ Z → (g Z ↔ RH₂ Z) := by
  intro h
  have hL : StripWorld₂ (fun w => w = ⟨2, 14⟩) :=
    ⟨fun w hw => by rw [hw]; rfl, fun w hw => by rw [hw]; exact ⟨by decide, by decide⟩⟩
  have hLrh : RH₂ (fun w => w = ⟨2, 14⟩) := fun w hw => by rw [hw]; rfl
  have hs := withPair₂_strip _ hL 14
  have hsame : SameRecord₂ (fun w => w = ⟨2, 14⟩) (withPair₂ (fun w => w = ⟨2, 14⟩) 14) :=
    withPair₂_same_record _ ⟨2, 14⟩ rfl
  exact withPair₂_not_rh _ 14 ((h _ hs).mp ((hg _ _ hL hs hsame).mp ((h _ hL).mpr hLrh)))

/-- Every premise either forces the line on strip configurations or holds at a strip configuration where the value
    fails. Classical. -/
theorem forces_or_has_a_twin₂ (A : World → Prop) : Forces₂ A ∨ ∃ Z, StripWorld₂ Z ∧ A Z ∧ ¬ RH₂ Z :=
  Classical.byCases (p := ∃ Z, StripWorld₂ Z ∧ A Z ∧ ¬ RH₂ Z) Or.inr
    (fun h => Or.inl (fun Z hZ ha => Classical.byContradiction (fun hn => h ⟨Z, hZ, ha, hn⟩)))

/-- **The socket in the strip.** At resolution one the open strip is the line; at resolution two the fold fixes the
    line, the open strip holds a pair off the line at every height, the open-strip premise and every keyless premise
    force nothing, no reading of the record decides, a record-respecting forcing premise fails at every nonempty strip
    configuration, and every premise forces or holds where the value fails. -/
theorem the_socket_in_the_strip :
    Forces (fun Z => ∀ z, Z z → 0 < z.x ∧ z.x < 2) ∧
    (∀ z : Pt, fold₂ z = z ↔ onLine₂ z) ∧
    (∀ t : Nat, StripWorld₂ (innerPair₂ t) ∧ ¬ RH₂ (innerPair₂ t)) ∧
    ¬ Forces₂ (fun Z => ∀ z, Z z → InStrip₂ z) ∧
    (∀ A : World → Prop, (∀ Z, A Z) → ¬ Forces₂ A) ∧
    (∀ g : World → Prop, RespectsRecord₂ g → ¬ ∀ Z, StripWorld₂ Z → (g Z ↔ RH₂ Z)) ∧
    (∀ A : World → Prop, RespectsRecord₂ A → Forces₂ A → ∀ Z, StripWorld₂ Z → (∃ z, Z z) → ¬ A Z) ∧
    (∀ A : World → Prop, Forces₂ A ∨ ∃ Z, StripWorld₂ Z ∧ A Z ∧ ¬ RH₂ Z) :=
  ⟨open_strip_forces_at_resolution_one, fold₂_fixed_iff, fun t => ⟨innerPair₂_strip t, innerPair₂_not_rh t⟩,
   open_strip_forces_nothing_at_resolution_two, keyless_forces_nothing₂, no_reading_decides_in_the_strip,
   record_forcing_fails_in_the_strip, forces_or_has_a_twin₂⟩

/-! ## XXIII · Double security: the two channels of the line

The formal gate: nothing passes for the hypothesis but least erasure, and the act passes it with an empty cone. The
actuation gate: nothing passes against it but a point off the line; the root, which every act re-enacts, crosses
neither way; a registration costs nothing exactly at least erasure, one floor per erased bit. Between the gates the
bit stays keyed. Every conjunct is a theorem above; this section adds their conjunction and no content. -/

/-- DOUBLE SECURITY. The formal gate, the actuation gate, and the keyed bit between them. -/
theorem double_security :
    (∀ A : ActualZeros, RH A.zeros) ∧
    (∀ Z : World, LeastErasure Z ↔ RH Z) ∧
    (∀ Z : World, ¬ LeastErasure Z ↔ OffLine Z) ∧
    (∀ Act : Type, Act → RootAct) ∧
    (¬ ∀ Z : World, RootAct → RH Z) ∧
    (¬ ∀ Z : World, RootAct → ¬ RH Z) ∧
    (¬ ∃ G : SelfGrounding (RH W2f), Nonempty G.Act) ∧
    (∀ C : FinCfg, C.price true = 0 ↔ LeastErasure C.world) ∧
    landauerFloor = 2870978885078723755499100 ∧
    ¬ RespectsRecord LeastErasure ∧
    (∃ Z : World, FoldClosed Z ∧ ¬ LeastErasure Z) :=
  ⟨rh_from_the_act, least_erasure_is_the_value, rejection_is_a_witness,
   fun _ a => act_reenacts_root a, root_does_not_cross_the_line, root_does_not_cross_the_denial,
   line_not_self_grounding, price_zero_iff_least_erasure, landauer_floor_exact,
   least_erasure_reads_past_the_record,
   ⟨W2, W2_closed, fun h => W2_not_rh ((least_erasure_is_the_value W2).mp h)⟩⟩

/-! ## XXIV · The terminal seal: least erasure

PhysOS Proof PSP-RH-SEAL-01. The row closes at least erasure: least erasure is the value on every configuration, the
hypothesis holds on every configuration the act carries, and the two gates of the line with the keyed bit between them
stand as one judged object. Every conjunct is a theorem above; this section adds their conjunction and no content. -/

/-- THE TERMINAL SEAL: least erasure, with its double defense. -/
theorem least_erasure_terminal_seal :
    (∀ Z : World, LeastErasure Z ↔ RH Z) ∧
    (∀ A : ActualZeros, RH A.zeros) ∧
    ((∀ A : ActualZeros, RH A.zeros) ∧
    (∀ Z : World, LeastErasure Z ↔ RH Z) ∧
    (∀ Z : World, ¬ LeastErasure Z ↔ OffLine Z) ∧
    (∀ Act : Type, Act → RootAct) ∧
    (¬ ∀ Z : World, RootAct → RH Z) ∧
    (¬ ∀ Z : World, RootAct → ¬ RH Z) ∧
    (¬ ∃ G : SelfGrounding (RH W2f), Nonempty G.Act) ∧
    (∀ C : FinCfg, C.price true = 0 ↔ LeastErasure C.world) ∧
    landauerFloor = 2870978885078723755499100 ∧
    ¬ RespectsRecord LeastErasure ∧
    (∃ Z : World, FoldClosed Z ∧ ¬ LeastErasure Z)) :=
  ⟨least_erasure_is_the_value, rh_from_the_act, double_security⟩

/-! ## XXV · The double defense, hardened: Omega and AEGIS of the row

Defense I, the formal gate: nothing passes for the hypothesis but least erasure; every premise that forces it fills the
field of the act or is strictly stronger, and every other premise has a twin on which the value fails. Defense II, the
actuation gate: nothing passes against it but a computed point off the line; a keyless premise, a reading of the record,
a certified height, a coalition of readings and the root decide nothing, and the registration is priced. The bit
between the gates stays keyed: the defense forces the form of every objection and never the value. Every conjunct is a
theorem above; this section adds their conjunction and no content. -/

/-- THE DOUBLE DEFENSE, HARDENED. -/
theorem double_defense_hardened :
    (∀ (Z : World), LeastErasure Z ↔ RH Z) ∧
    (∀ (A : ActualZeros), RH A.zeros) ∧
    (∀ (Z : World) (hZ : FoldClosed Z), ((∃ S : ActualZeros, S.zeros = Z) ↔ RH Z) ∧ ((∃ S : ActualZeros, S.zeros = Z) ↔ LeastErasure Z)) ∧
    (∀ (A : World → Prop), Forces A ∨ ∃ Z, FoldClosed Z ∧ A Z ∧ ¬ RH Z) ∧
    (Forces RH ∧ ∀ A : World → Prop, Forces A → ∀ Z, FoldClosed Z → A Z → RH Z) ∧
    (∀ (Z : World), ¬ LeastErasure Z ↔ OffLine Z) ∧
    (∀ (A : World → Prop) (hA : Keyless A), ¬ Forces A) ∧
    (∀ (g : World → Prop) (hg : RespectsRecord g), ¬ ∀ Z, FoldClosed Z → (g Z ↔ RH Z)) ∧
    (∀ (T : Nat), RH (LineBelow T) ∧ FoldClosed (TwinAbove T) ∧ ¬ RH (TwinAbove T) ∧
    ∀ z, z.t ≤ T → (TwinAbove T z ↔ LineBelow T z)) ∧
    (∀ {ι : Type} (at_ : ι → World → Prop) (h : ∀ i, Admissible (at_ i))
    (c : Coalition ι), ¬ ∀ Z, FoldClosed Z → (Coalition.eval at_ c Z ↔ RH Z)) ∧
    (¬ ∀ Z : World, RootAct → RH Z) ∧
    (¬ ∀ Z : World, RootAct → ¬ RH Z) ∧
    (∀ (C : FinCfg), C.price true = 0 ↔ LeastErasure C.world) ∧
    (landauerFloor = 2870978885078723755499100) ∧
    (¬ RespectsRecord LeastErasure) ∧
    ((∀ A : ActualZeros, RH A.zeros) ∧
    (∀ Z : World, LeastErasure Z ↔ RH Z) ∧
    (∀ Z : World, ¬ LeastErasure Z ↔ OffLine Z) ∧
    (∀ Act : Type, Act → RootAct) ∧
    (¬ ∀ Z : World, RootAct → RH Z) ∧
    (¬ ∀ Z : World, RootAct → ¬ RH Z) ∧
    (¬ ∃ G : SelfGrounding (RH W2f), Nonempty G.Act) ∧
    (∀ C : FinCfg, C.price true = 0 ↔ LeastErasure C.world) ∧
    landauerFloor = 2870978885078723755499100 ∧
    ¬ RespectsRecord LeastErasure ∧
    (∃ Z : World, FoldClosed Z ∧ ¬ LeastErasure Z)) :=
  ⟨least_erasure_is_the_value, rh_from_the_act, socket_is_the_value, forces_or_has_a_twin, rh_is_the_weakest_forcing_premise, rejection_is_a_witness, keyless_forces_nothing, record_decides_nothing, certified_height_never_forces, no_coalition_decides, root_does_not_cross_the_line, root_does_not_cross_the_denial, price_zero_iff_least_erasure, landauer_floor_exact, least_erasure_reads_past_the_record, double_security⟩

end PrimeFreedom

/-! ## Cones, printed: sections I to XVI -/

#print axioms PrimeFreedom.arrow_exists
#print axioms PrimeFreedom.aperture_one_bit_wide
#print axioms PrimeFreedom.prime_fibre
#print axioms PrimeFreedom.prime_off_seat
#print axioms PrimeFreedom.freedom_is_exactly_two
#print axioms PrimeFreedom.seat_is_zero
#print axioms PrimeFreedom.exists_prime_dvd
#print axioms PrimeFreedom.leastDivisor_prime
#print axioms PrimeFreedom.determined_by_primes
#print axioms PrimeFreedom.fold_preserves_offline
#print axioms PrimeFreedom.offline_zero_quadruple
#print axioms PrimeFreedom.not_rh_has_offline_witness
#print axioms PrimeFreedom.denial_posits_the_orbit
#print axioms PrimeFreedom.record_blind_at_every_scale
#print axioms PrimeFreedom.euclid_lemma
#print axioms PrimeFreedom.pExp_mul
#print axioms PrimeFreedom.padicMeasure_additive
#print axioms PrimeFreedom.prime_freedom_independent
#print axioms PrimeFreedom.primes_base_of_freedom
#print axioms PrimeFreedom.arrow_multiplicative
#print axioms PrimeFreedom.arrow_at_prime
#print axioms PrimeFreedom.finite_never_forces
#print axioms PrimeFreedom.limit_not_forced
#print axioms PrimeFreedom.nothing_escapes_one_cut
#print axioms PrimeFreedom.sides_together
#print axioms PrimeFreedom.rh_iff_no_left
#print axioms PrimeFreedom.record_decides_nothing
#print axioms PrimeFreedom.unicorn_block
#print axioms PrimeFreedom.keyless_forces_nothing
#print axioms PrimeFreedom.least_erasure_is_the_value
#print axioms PrimeFreedom.supply_iff
#print axioms PrimeFreedom.faces_are_one
#print axioms PrimeFreedom.rh_from_the_act_generic
#print axioms PrimeFreedom.rh_from_the_act
#print axioms PrimeFreedom.rh_ground_closure_complete

#print axioms PrimeFreedom.primes_exist
#print axioms PrimeFreedom.primes_exist_forces_nothing
#print axioms PrimeFreedom.prime_freedom_forces_nothing
#print axioms PrimeFreedom.arrow_forces_nothing
#print axioms PrimeFreedom.free_basis_coexists_with_offline_world
#print axioms PrimeFreedom.fold_off_line_stays_off
#print axioms PrimeFreedom.positivity_on_zero_side
#print axioms PrimeFreedom.least_erasure_is_positivity
#print axioms PrimeFreedom.prime_witness_iff
#print axioms PrimeFreedom.rh_from_prime_witness
#print axioms PrimeFreedom.positivity_is_keyed
#print axioms PrimeFreedom.freedom_does_not_pick_the_sign
#print axioms PrimeFreedom.prime_witness_ledger
#print axioms PrimeFreedom.posit_is_the_conclusion
#print axioms PrimeFreedom.rh_from_prime_act
#print axioms PrimeFreedom.acts_are_one
#print axioms PrimeFreedom.record_decides_nothing_free
#print axioms PrimeFreedom.unicorn_block_free
#print axioms PrimeFreedom.keyless_forces_nothing_free
#print axioms PrimeFreedom.arrow_forces_nothing_free
#print axioms PrimeFreedom.least_erasure_reads_past_the_record_free
#print axioms PrimeFreedom.positivity_is_keyed_free

/-! ## Cones, pinned: sections VII to XIII (a compile in which any pinned cone changes fails) -/
/-- info: 'PrimeFreedom.least_erasure_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.least_erasure_is_the_value
/-- info: 'PrimeFreedom.least_erasure_is_positivity' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.least_erasure_is_positivity
/-- info: 'PrimeFreedom.spend_is_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.spend_is_the_line
/-- info: 'PrimeFreedom.record_decides_nothing_free' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.record_decides_nothing_free
/-- info: 'PrimeFreedom.keyless_forces_nothing_free' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.keyless_forces_nothing_free
/-- info: 'PrimeFreedom.rh_from_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.rh_from_the_act
/-- info: 'PrimeFreedom.rh_from_prime_act' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.rh_from_prime_act
/-- info: 'PrimeFreedom.acts_are_one' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.acts_are_one
/-- info: 'PrimeFreedom.primes_base_of_freedom' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.primes_base_of_freedom
/-- info: 'PrimeFreedom.spend_is_not_the_free_basis' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.spend_is_not_the_free_basis
/-- info: 'PrimeFreedom.rh_on_the_spent_bit' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.rh_on_the_spent_bit
/-- info: 'PrimeFreedom.prime_arc_sealed' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.prime_arc_sealed
/-- info: 'PrimeFreedom.rh_is_the_weakest_forcing_premise' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.rh_is_the_weakest_forcing_premise
/-- info: 'PrimeFreedom.li_prefix_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.li_prefix_never_forces
/-- info: 'PrimeFreedom.rh_from_the_sign' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.rh_from_the_sign
/-- info: 'PrimeFreedom.rh_iff_the_sign' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.rh_iff_the_sign
/-- info: 'PrimeFreedom.spends_are_one' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.spends_are_one
/-- info: 'PrimeFreedom.line_not_self_grounding' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.line_not_self_grounding
/-- info: 'PrimeFreedom.sign_realized_both_ways' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.sign_realized_both_ways
/-- info: 'PrimeFreedom.the_vestigial_posit' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.the_vestigial_posit
/-- info: 'PrimeFreedom.exactly_one_face_is_keyed' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.exactly_one_face_is_keyed
/-- info: 'PrimeFreedom.arrow_is_not_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.arrow_is_not_the_line
/-- info: 'PrimeFreedom.template_binds_iff_seed' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.template_binds_iff_seed
/-- info: 'PrimeFreedom.the_seed_is_the_spend' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.the_seed_is_the_spend
/-- info: 'PrimeFreedom.the_template_plugged_in' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.the_template_plugged_in
/-! ## Cones, pinned: section XVI -/
/-- info: 'PrimeFreedom.fold_negates_odd' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.fold_negates_odd
/-- info: 'PrimeFreedom.rh_iff_even_eigenspace' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.rh_iff_even_eigenspace
/-- info: 'PrimeFreedom.record_blind_to_odd' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.record_blind_to_odd
/-- info: 'PrimeFreedom.side_odd_off_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.side_odd_off_line
/-- info: 'PrimeFreedom.record_never_reads_the_side' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.record_never_reads_the_side
/-- info: 'PrimeFreedom.colocation_is_a_calibration' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.colocation_is_a_calibration
/-- info: 'PrimeFreedom.calibration_realized_both_ways' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.calibration_realized_both_ways
/-- info: 'PrimeFreedom.recursion_fails_on_the_twin' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.recursion_fails_on_the_twin
/-- info: 'PrimeFreedom.least_erasure_is_the_recursion' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.least_erasure_is_the_recursion
/-- info: 'PrimeFreedom.the_mirror_at_minus_one' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.the_mirror_at_minus_one

/-! ## Cones, printed: section XVII -/
#print axioms PrimeFreedom.admissible_transfers
#print axioms PrimeFreedom.no_admissible_triad_forces
#print axioms PrimeFreedom.no_admissible_coalition_forces
#print axioms PrimeFreedom.spend_is_not_admissible
#print axioms PrimeFreedom.three_axis_lock
#print axioms PrimeFreedom.freedom_alone_open
#print axioms PrimeFreedom.certified_height_never_forces
#print axioms PrimeFreedom.certified_worlds_share_the_record_below
#print axioms PrimeFreedom.HeatFlow.disc_flow
#print axioms PrimeFreedom.HeatFlow.forward_preserves
#print axioms PrimeFreedom.HeatFlow.erasure_finite
#print axioms PrimeFreedom.HeatFlow.lam_nonneg
#print axioms PrimeFreedom.HeatFlow.real_at_lam
#print axioms PrimeFreedom.HeatFlow.lam_least
#print axioms PrimeFreedom.HeatFlow.lam_zero_iff_real
#print axioms PrimeFreedom.HeatFlow.de_bruijn_tight
#print axioms PrimeFreedom.HeatFlow.collision
#print axioms PrimeFreedom.HeatFlow.disc3_step
#print axioms PrimeFreedom.HeatFlow.disc3_strict
#print axioms PrimeFreedom.HeatFlow.disc3_monotone
#print axioms PrimeFreedom.HeatFlow.cubic_forward_preserves
#print axioms PrimeFreedom.HeatFlow.flow_injective
#print axioms PrimeFreedom.HeatFlow.certificate_two_worlds
#print axioms PrimeFreedom.HeatFlow.certificate_decides_nothing
#print axioms PrimeFreedom.HeatFlow.certification_never_forces
#print axioms PrimeFreedom.HeatFlow.zero_slack
#print axioms PrimeFreedom.HeatFlow.backward_not_forced
#print axioms PrimeFreedom.HeatFlow.family_least_erasure
#print axioms PrimeFreedom.heat_bit_is_one_inequality
#print axioms PrimeFreedom.family_bit_is_one_inequality
#print axioms PrimeFreedom.heat_model_reads_as_the_carrier
#print axioms PrimeFreedom.Liouville.lam_mult
#print axioms PrimeFreedom.Liouville.lam_flips_at_primes
#print axioms PrimeFreedom.Liouville.polya_holds_to_200
#print axioms PrimeFreedom.liouville_is_the_sign_arrow
#print axioms PrimeFreedom.rh_from_faithful
#print axioms PrimeFreedom.faithful_is_the_bit
#print axioms PrimeFreedom.the_posit_in_every_coordinate
#print axioms PrimeFreedom.modes
#print axioms PrimeFreedom.lossless_iff_rh
#print axioms PrimeFreedom.stable_iff_rh
#print axioms PrimeFreedom.five_readings_agree
#print axioms PrimeFreedom.no_record_reading_returns_any_face
#print axioms PrimeFreedom.same_for_every_reader
#print axioms PrimeFreedom.no_private_bit
#print axioms PrimeFreedom.spend_has_no_reader
#print axioms PrimeFreedom.the_harvest

/-! ## Cones, pinned: section XVII -/
/-- info: 'PrimeFreedom.no_admissible_coalition_forces' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.no_admissible_coalition_forces
/-- info: 'PrimeFreedom.spend_is_not_admissible' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.spend_is_not_admissible
/-- info: 'PrimeFreedom.certified_height_never_forces' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.certified_height_never_forces
/-- info: 'PrimeFreedom.HeatFlow.lam_nonneg' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.HeatFlow.lam_nonneg
/-- info: 'PrimeFreedom.HeatFlow.lam_zero_iff_real' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.HeatFlow.lam_zero_iff_real
/-- info: 'PrimeFreedom.HeatFlow.certificate_decides_nothing' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.HeatFlow.certificate_decides_nothing
/-- info: 'PrimeFreedom.HeatFlow.zero_slack' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.HeatFlow.zero_slack
/-- info: 'PrimeFreedom.heat_bit_is_one_inequality' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.heat_bit_is_one_inequality
/-- info: 'PrimeFreedom.liouville_is_the_sign_arrow' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.liouville_is_the_sign_arrow
/-- info: 'PrimeFreedom.Liouville.polya_holds_to_200' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.Liouville.polya_holds_to_200
/-- info: 'PrimeFreedom.the_posit_in_every_coordinate' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.the_posit_in_every_coordinate
/-- info: 'PrimeFreedom.five_readings_agree' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.five_readings_agree
/-- info: 'PrimeFreedom.spend_has_no_reader' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.spend_has_no_reader
/-- info: 'PrimeFreedom.the_harvest' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.the_harvest

/-! ## Cones, printed: section XVIII -/

#print axioms PrimeFreedom.placement
#print axioms PrimeFreedom.soundness_is_load_bearing
#print axioms PrimeFreedom.ground_exceeds_ladder
#print axioms PrimeFreedom.independent_axioms_are_separate_bits
#print axioms PrimeFreedom.root_is_keyless
#print axioms PrimeFreedom.keyless_crosses
#print axioms PrimeFreedom.root_decides_no_keyed
#print axioms PrimeFreedom.choice_is_keyed
#print axioms PrimeFreedom.root_does_not_cross_choice
#print axioms PrimeFreedom.line_is_keyed_over_worlds
#print axioms PrimeFreedom.root_does_not_cross_the_line
#print axioms PrimeFreedom.refutation_is_one_point
#print axioms PrimeFreedom.cant_refute_seals
#print axioms PrimeFreedom.cant_refute_seals_dec
#print axioms PrimeFreedom.rh_iff_cant_refute
#print axioms PrimeFreedom.independence_forces_truth
#print axioms PrimeFreedom.cant_prove_does_not_seal_false
#print axioms PrimeFreedom.cant_asymmetry
#print axioms PrimeFreedom.round_trip_identity
#print axioms PrimeFreedom.absolute_returns_unchanged
#print axioms PrimeFreedom.trip_adds_presence_only
#print axioms PrimeFreedom.massless_arrow
#print axioms PrimeFreedom.any_true_premise_serves
#print axioms PrimeFreedom.the_line_round_trips
#print axioms PrimeFreedom.ladder_blocked
#print axioms PrimeFreedom.the_road

/-! ## Cones, pinned: section XVIII -/
/-- info: 'PrimeFreedom.placement' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.placement
/-- info: 'PrimeFreedom.soundness_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.soundness_is_load_bearing
/-- info: 'PrimeFreedom.ground_exceeds_ladder' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.ground_exceeds_ladder
/-- info: 'PrimeFreedom.root_decides_no_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.root_decides_no_keyed
/-- info: 'PrimeFreedom.root_does_not_cross_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.root_does_not_cross_the_line
/-- info: 'PrimeFreedom.cant_refute_seals' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.cant_refute_seals
/-- info: 'PrimeFreedom.rh_iff_cant_refute' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.rh_iff_cant_refute
/-- info: 'PrimeFreedom.independence_forces_truth' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.independence_forces_truth
/-- info: 'PrimeFreedom.cant_prove_does_not_seal_false' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.cant_prove_does_not_seal_false
/-- info: 'PrimeFreedom.round_trip_identity' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.round_trip_identity
/-- info: 'PrimeFreedom.massless_arrow' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.massless_arrow
/-- info: 'PrimeFreedom.ladder_blocked' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.ladder_blocked
/-- info: 'PrimeFreedom.the_road' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.the_road

/-! ## Cones, printed: section XIX -/

#print axioms PrimeFreedom.vocabulary_law
#print axioms PrimeFreedom.every_face_proves_every_face
#print axioms PrimeFreedom.chart_faces_prove_each_other
#print axioms PrimeFreedom.fold_fold
#print axioms PrimeFreedom.fold_law_admissible
#print axioms PrimeFreedom.same_record_eq
#print axioms PrimeFreedom.record_reading_admissible
#print axioms PrimeFreedom.admissible_const
#print axioms PrimeFreedom.keyless_denial_respects
#print axioms PrimeFreedom.admissible_not
#print axioms PrimeFreedom.admissible_and
#print axioms PrimeFreedom.admissible_or
#print axioms PrimeFreedom.admissible_never_decides
#print axioms PrimeFreedom.coalition_admissible
#print axioms PrimeFreedom.no_coalition_decides
#print axioms PrimeFreedom.triaxial_cut_irreducible
#print axioms PrimeFreedom.ladder_proof_lands_on_least_erasure
#print axioms PrimeFreedom.ladder_proof_iff_least_erasure
#print axioms PrimeFreedom.lineTheory_sound
#print axioms PrimeFreedom.a_sound_theory_may_prove_the_line
#print axioms PrimeFreedom.route_ledger_is_computed
#print axioms PrimeFreedom.route_ledger_counts
#print axioms PrimeFreedom.route_status_total
#print axioms PrimeFreedom.blocked_iff_theorem
#print axioms PrimeFreedom.reader_frame
#print axioms PrimeFreedom.the_front

/-! ## Cones, pinned: section XIX -/
/-- info: 'PrimeFreedom.vocabulary_law' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.vocabulary_law
/-- info: 'PrimeFreedom.every_face_proves_every_face' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.every_face_proves_every_face
/-- info: 'PrimeFreedom.chart_faces_prove_each_other' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.chart_faces_prove_each_other
/-- info: 'PrimeFreedom.record_reading_admissible' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.record_reading_admissible
/-- info: 'PrimeFreedom.admissible_not' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.admissible_not
/-- info: 'PrimeFreedom.admissible_and' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.admissible_and
/-- info: 'PrimeFreedom.admissible_or' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.admissible_or
/-- info: 'PrimeFreedom.admissible_never_decides' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.admissible_never_decides
/-- info: 'PrimeFreedom.coalition_admissible' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.coalition_admissible
/-- info: 'PrimeFreedom.no_coalition_decides' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.no_coalition_decides
/-- info: 'PrimeFreedom.triaxial_cut_irreducible' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.triaxial_cut_irreducible
/-- info: 'PrimeFreedom.ladder_proof_lands_on_least_erasure' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.ladder_proof_lands_on_least_erasure
/-- info: 'PrimeFreedom.ladder_proof_iff_least_erasure' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.ladder_proof_iff_least_erasure
/-- info: 'PrimeFreedom.a_sound_theory_may_prove_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.a_sound_theory_may_prove_the_line
/-- info: 'PrimeFreedom.route_ledger_is_computed' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.route_ledger_is_computed
/-- info: 'PrimeFreedom.blocked_iff_theorem' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.blocked_iff_theorem
/-- info: 'PrimeFreedom.reader_frame' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.reader_frame
/-- info: 'PrimeFreedom.the_front' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.the_front

/-! ## Cones, pinned: section XX -/
/-- info: 'PrimeFreedom.reg_on_line' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.reg_on_line
/-- info: 'PrimeFreedom.record_rh' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.record_rh
/-- info: 'PrimeFreedom.record_has_least_erasure' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.record_has_least_erasure
/-- info: 'PrimeFreedom.record_closed' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.record_closed
/-- info: 'PrimeFreedom.record_carried_by_least_erasure' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.record_carried_by_least_erasure
/-- info: 'PrimeFreedom.admissible_holds_on_the_lossless_world' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.admissible_holds_on_the_lossless_world
/-- info: 'PrimeFreedom.every_reading_holds_on_the_lossless_world' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.every_reading_holds_on_the_lossless_world
/-- info: 'PrimeFreedom.every_coalition_holds_on_the_lossless_world' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.every_coalition_holds_on_the_lossless_world
/-- info: 'PrimeFreedom.record_never_testifies_against' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.record_never_testifies_against
/-- info: 'PrimeFreedom.pair_two_points_one_record' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.pair_two_points_one_record
/-- info: 'PrimeFreedom.offCount_zero_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.offCount_zero_iff
/-- info: 'PrimeFreedom.fincfg_closed' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.fincfg_closed
/-- info: 'PrimeFreedom.least_erasure_iff_zero_erased' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.least_erasure_iff_zero_erased
/-- info: 'PrimeFreedom.landauer_floor_exact' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.landauer_floor_exact
/-- info: 'PrimeFreedom.price_zero_iff_least_erasure' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.price_zero_iff_least_erasure
/-- info: 'PrimeFreedom.denial_price_linear' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.denial_price_linear
/-- info: 'PrimeFreedom.reversible_commits_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.reversible_commits_nothing
/-- info: 'PrimeFreedom.least_erasure_iff_no_point_off' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.least_erasure_iff_no_point_off
/-- info: 'PrimeFreedom.rejection_is_a_witness' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.rejection_is_a_witness
/-- info: 'PrimeFreedom.falsifier_form_constant' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.falsifier_form_constant
/-- info: 'PrimeFreedom.act_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.act_reenacts_root
/-- info: 'PrimeFreedom.root_does_not_cross_the_denial' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.root_does_not_cross_the_denial
/-- info: 'PrimeFreedom.assent_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.assent_is_the_value
/-- info: 'PrimeFreedom.one_shape_two_registers' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.one_shape_two_registers
/-- info: 'PrimeFreedom.freedom_is_given_the_sign_is_spent' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.freedom_is_given_the_sign_is_spent
/-- info: 'PrimeFreedom.least_erasure_affirmed' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.least_erasure_affirmed

/-! ## Cones, printed: every theorem of sections I to XX whose cone is not printed above -/

#print axioms PrimeFreedom.orientation_two_valued
#print axioms PrimeFreedom.orientations_distinct
#print axioms PrimeFreedom.seat_is_one
#print axioms PrimeFreedom.findLeastFrom_correct
#print axioms PrimeFreedom.leastDivisor_spec
#print axioms PrimeFreedom.dvd_remainder_mul
#print axioms PrimeFreedom.leastMulDvd_spec
#print axioms PrimeFreedom.findGt_spec
#print axioms PrimeFreedom.findGt_max
#print axioms PrimeFreedom.pExp_dvd
#print axioms PrimeFreedom.two_pow_ge
#print axioms PrimeFreedom.pow_dvd_bound
#print axioms PrimeFreedom.pExp_le_of_dvd
#print axioms PrimeFreedom.mul_mul_mul_comm_nat
#print axioms PrimeFreedom.pExp_self
#print axioms PrimeFreedom.pExp_eq_zero_of_not_dvd
#print axioms PrimeFreedom.pExp_one
#print axioms PrimeFreedom.pExp_other
#print axioms PrimeFreedom.signArrow_add
#print axioms PrimeFreedom.fold_fixed_iff
#print axioms PrimeFreedom.reg_fixes_line
#print axioms PrimeFreedom.unicorn_never_registered
#print axioms PrimeFreedom.W1_closed
#print axioms PrimeFreedom.W1_rh
#print axioms PrimeFreedom.pair_closed
#print axioms PrimeFreedom.pair_not_rh
#print axioms PrimeFreedom.pair_same_record
#print axioms PrimeFreedom.W2_closed
#print axioms PrimeFreedom.W2_not_rh
#print axioms PrimeFreedom.same_record_12
#print axioms PrimeFreedom.fibre_is_infinite
#print axioms PrimeFreedom.lossless_unique
#print axioms PrimeFreedom.sentence_separates_record_does_not
#print axioms PrimeFreedom.record_is_lossless
#print axioms PrimeFreedom.record_same
#print axioms PrimeFreedom.least_erasure_reads_past_the_record
#print axioms PrimeFreedom.posit_is_the_value
#print axioms PrimeFreedom.fold_onLine_iff
#print axioms PrimeFreedom.fold_ne_of_offline
#print axioms PrimeFreedom.primes_exist_keyless
#print axioms PrimeFreedom.prime_freedom_keyless
#print axioms PrimeFreedom.arrow_keyless
#print axioms PrimeFreedom.W2f_closed
#print axioms PrimeFreedom.W2f_not_rh
#print axioms PrimeFreedom.same_record_f
#print axioms PrimeFreedom.weaker_never_forces
#print axioms PrimeFreedom.weaker_at_the_twin_never_forces
#print axioms PrimeFreedom.rh_from_li
#print axioms PrimeFreedom.li_is_the_bit_stream
#print axioms PrimeFreedom.root_has_an_act
#print axioms PrimeFreedom.fold_face_keyless
#print axioms PrimeFreedom.fold_face_on_twin
#print axioms PrimeFreedom.fold_face_on_line
#print axioms PrimeFreedom.record_face_keyless
#print axioms PrimeFreedom.arrow_face_keyless
#print axioms PrimeFreedom.closure_face_on_line
#print axioms PrimeFreedom.closure_face_fails_on_twin
#print axioms PrimeFreedom.fold_keeps_even
#print axioms PrimeFreedom.residence_orientation_reversing
#print axioms PrimeFreedom.reg_kills_odd
#print axioms PrimeFreedom.reg_keeps_even
#print axioms PrimeFreedom.reg_idempotent
#print axioms PrimeFreedom.onLine_iff_odd_zero
#print axioms PrimeFreedom.odd_pair_opposite
#print axioms PrimeFreedom.wall_on_the_chart
#print axioms PrimeFreedom.value_is_recursion
#print axioms PrimeFreedom.recursion_is_value
#print axioms PrimeFreedom.recursion_on_the_line
#print axioms PrimeFreedom.root_recursion
#print axioms PrimeFreedom.HeatFlow.sq_nonneg
#print axioms PrimeFreedom.HeatFlow.cube_diff
#print axioms PrimeFreedom.HeatFlow.disc3_monotone_rec
#print axioms PrimeFreedom.HeatFlow.famLam_nonneg_rec
#print axioms PrimeFreedom.HeatFlow.family_least_erasure_rec
#print axioms PrimeFreedom.root_act

/-! ## Cones, pinned: section XXI -/

/-- info: 'PrimeFreedom.sumBelow_add' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.sumBelow_add
/-- info: 'PrimeFreedom.sumBelow_congr' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.sumBelow_congr
/-- info: 'PrimeFreedom.sumBelow_stable' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.sumBelow_stable
/-- info: 'PrimeFreedom.sumBelow_zero' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.sumBelow_zero
/-- info: 'PrimeFreedom.sumBelow_single' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.sumBelow_single
/-- info: 'PrimeFreedom.primeTest_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.primeTest_iff
/-- info: 'PrimeFreedom.pExp_zero_above' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.pExp_zero_above
/-- info: 'PrimeFreedom.extendTerm_zero_above' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.extendTerm_zero_above
/-- info: 'PrimeFreedom.extendAssignment_bound' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.extendAssignment_bound
/-- info: 'PrimeFreedom.extendTerm_mul' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.extendTerm_mul
/-- info: 'PrimeFreedom.extendAssignment_mul' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.extendAssignment_mul
/-- info: 'PrimeFreedom.extendTerm_other' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.extendTerm_other
/-- info: 'PrimeFreedom.extendAssignment_prime' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.extendAssignment_prime
/-- info: 'PrimeFreedom.extendAssignment_additive' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.extendAssignment_additive
/-- info: 'PrimeFreedom.primes_admit_every_assignment' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.primes_admit_every_assignment
/-- info: 'PrimeFreedom.omegaAll_mul' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.omegaAll_mul
/-- info: 'PrimeFreedom.omegaAll_prime' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.omegaAll_prime
/-- info: 'PrimeFreedom.liouvilleAll_mul' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.liouvilleAll_mul
/-- info: 'PrimeFreedom.liouvilleAll_prime' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.liouvilleAll_prime
/-- info: 'PrimeFreedom.liouvilleAll_one' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.liouvilleAll_one
/-- info: 'PrimeFreedom.liouvilleAll_agrees_to_30' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.liouvilleAll_agrees_to_30
/-- info: 'PrimeFreedom.pinned_face_reads' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.pinned_face_reads
/-- info: 'PrimeFreedom.pinned_face_is_a_face' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.pinned_face_is_a_face
/-- info: 'PrimeFreedom.rh_iff_own_record' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.rh_iff_own_record
/-- info: 'PrimeFreedom.least_erasure_is_least' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.least_erasure_is_least
/-- info: 'PrimeFreedom.record_is_the_least' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.record_is_the_least
/-- info: 'PrimeFreedom.the_closure' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.the_closure
/-- info: 'PrimeFreedom.Carrier.record_same_C' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.Carrier.record_same_C
/-- info: 'PrimeFreedom.Carrier.least_erasure_is_the_value_C' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.Carrier.least_erasure_is_the_value_C
/-- info: 'PrimeFreedom.Carrier.rh_iff_own_record_C' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.Carrier.rh_iff_own_record_C
/-- info: 'PrimeFreedom.Carrier.one_record_C' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.Carrier.one_record_C
/-- info: 'PrimeFreedom.Carrier.worlds_differ_C' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.Carrier.worlds_differ_C
/-- info: 'PrimeFreedom.Carrier.no_reading_decides_C' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.Carrier.no_reading_decides_C
/-- info: 'PrimeFreedom.Carrier.chart_is_an_instance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.Carrier.chart_is_an_instance
/-- info: 'PrimeFreedom.Carrier.the_closure_on_any_carrier' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.Carrier.the_closure_on_any_carrier

/-! ## Cones, pinned: section XXII -/
/-- info: 'PrimeFreedom.socket_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.socket_is_the_value
/-- info: 'PrimeFreedom.closure_takes_a_term' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.closure_takes_a_term
/-- info: 'PrimeFreedom.closure_at_a_term' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.closure_at_a_term
/-- info: 'PrimeFreedom.forces_or_has_a_twin' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.forces_or_has_a_twin
/-- info: 'PrimeFreedom.withPair_closed' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.withPair_closed
/-- info: 'PrimeFreedom.withPair_same_record' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.withPair_same_record
/-- info: 'PrimeFreedom.withPair_not_rh' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.withPair_not_rh
/-- info: 'PrimeFreedom.record_forcing_fails_everywhere' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.record_forcing_fails_everywhere
/-- info: 'PrimeFreedom.forcing_is_the_value_or_stronger' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.forcing_is_the_value_or_stronger
/-- info: 'PrimeFreedom.forcing_fills_the_socket' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.forcing_fills_the_socket
/-- info: 'PrimeFreedom.face_is_the_socket' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.face_is_the_socket
/-- info: 'PrimeFreedom.named_faces_are_the_socket' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.named_faces_are_the_socket
/-- info: 'PrimeFreedom.walk_is_the_walk_of_one' depends on axioms: [propext] -/
#guard_msgs in #print axioms PrimeFreedom.walk_is_the_walk_of_one
/-- info: 'PrimeFreedom.faithful_is_the_sentence_of_one' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.faithful_is_the_sentence_of_one
/-- info: 'PrimeFreedom.blind_assignment_vanishes' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.blind_assignment_vanishes
/-- info: 'PrimeFreedom.blind_walk' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.blind_walk
/-- info: 'PrimeFreedom.blind_is_unfaithful' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.blind_is_unfaithful
/-- info: 'PrimeFreedom.faithful_reads_the_primes' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.faithful_reads_the_primes
/-- info: 'PrimeFreedom.the_socket' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.the_socket

/-! ## Cones, pinned: section XXII.b -/
/-- info: 'PrimeFreedom.fold₂_fixed_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.fold₂_fixed_iff
/-- info: 'PrimeFreedom.open_strip_forces_at_resolution_one' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.open_strip_forces_at_resolution_one
/-- info: 'PrimeFreedom.innerPair₂_strip' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.innerPair₂_strip
/-- info: 'PrimeFreedom.innerPair₂_not_rh' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.innerPair₂_not_rh
/-- info: 'PrimeFreedom.open_strip_forces_nothing_at_resolution_two' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.open_strip_forces_nothing_at_resolution_two
/-- info: 'PrimeFreedom.keyless_forces_nothing₂' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.keyless_forces_nothing₂
/-- info: 'PrimeFreedom.withPair₂_strip' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.withPair₂_strip
/-- info: 'PrimeFreedom.withPair₂_same_record' does not depend on any axioms -/
#guard_msgs in #print axioms PrimeFreedom.withPair₂_same_record
/-- info: 'PrimeFreedom.withPair₂_not_rh' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.withPair₂_not_rh
/-- info: 'PrimeFreedom.record_forcing_fails_in_the_strip' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.record_forcing_fails_in_the_strip
/-- info: 'PrimeFreedom.no_reading_decides_in_the_strip' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.no_reading_decides_in_the_strip
/-- info: 'PrimeFreedom.forces_or_has_a_twin₂' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.forces_or_has_a_twin₂
/-- info: 'PrimeFreedom.the_socket_in_the_strip' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.the_socket_in_the_strip

/-! ## Cones, pinned: section XXIII -/

/-- info: 'PrimeFreedom.double_security' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.double_security

/-! ## Cone, printed: the terminal seal -/
#print axioms PrimeFreedom.least_erasure_terminal_seal
#print axioms PrimeFreedom.double_defense_hardened
