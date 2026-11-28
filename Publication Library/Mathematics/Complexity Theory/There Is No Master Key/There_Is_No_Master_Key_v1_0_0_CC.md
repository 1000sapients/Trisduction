# There Is No Master Key
## A Machine-Checked Refutation of the Secret Cheat Code That Breaks All Cryptography: a Cipher No Algorithm Can Break, No Guesser That Shortcuts the Key Space, No Speedup That Crosses a Class, No Break Apart from the Machine That Runs It, and the Factoring Question Reduced to One Keyed Bit

**Mohammad F. Islam PhD** · 28 November 2026

## Abstract

A narrative now in circulation holds that an AI has found a secret cheat code that breaks all cryptography, and that the factoring of large numbers, on which much of public-key cryptography rests, is already finished. This paper answers it with theorems compiled in Lean 4, in one standalone file with no import, no axiom declared and no sorry. Every theorem is unconditional, and every theorem that speaks of an adversary speaks of every function, so every AI is covered without a special case. A cipher exists that no adversary of any power breaks: under the one-time pad, every ciphertext is the encryption of every message of its length under exactly one key. No guesser that tests keys one at a time covers 2^N^ keys in fewer than 2^N^ tests. No speedup by a constant or a polynomial factor makes a method polynomial that was not. A claimed factor is checked by one division, and a claimed break is refuted by one public instance. On the decision form of factoring no break holds apart from the machine that runs it, and no bar does either. On every model the factoring question is exactly one keyed transfer, which every route passes and no premise uniform over models forces. The two public factoring records of September 2026, RSA-260 and RSA-896, both reached with AI assistance, are read against these theorems: each is the known number field sieve made faster on graphics processors, each was announced in public, and each is checked by one multiplication. Neither is a master key, and the theorems state what any claim of one must produce before it is believed.

## 1. The Claim and the Answer

The claim has three parts. A secret method exists. It breaks any cryptography. It was found by an AI. Each part is a mathematical statement, and each is answered here by a theorem that a machine has checked.

The word *any* is answered first, because one counterexample refutes a universal. Section 3 proves that the one-time pad is broken by no adversary at all. The word *secret* is answered by Sections 6 and 7: whether an algorithm is a break depends on its answers and on nothing else (`a_break_is_its_answers`), a claimed break is refuted by one instance it fails on, and no break holds apart from the machine that runs it. The word *AI* needs no theorem of its own. An AI is an algorithm, and every theorem below that quantifies over algorithms quantifies over every function from inputs to outputs, computable or not.

Speed is answered by Section 5, since the public records of 2026 were gains in speed. The question that remains, whether a polynomial classical algorithm for factoring exists, is located exactly by Section 8: on every model it is one keyed transfer, and the paper proves which routes cannot reach it. Table 1 sets each part of the claim beside the theorem that answers it.

**Table 1 · The claim in circulation and the theorems that answer it**

| Claim | Theorem in Appendix A | What the theorem proves |
|---|---|---|
| It breaks any cryptography | `no_adversary_breaks_the_pad` | A cipher exists that no adversary of any power breaks |
| It guesses keys faster than counting | `no_guesser_shortcuts` | Fewer than 2^N^ tests leave an N-bit key unfound |
| Faster hardware has done it | `no_speedup_crosses_a_class` | No constant or polynomial speedup crosses into polynomial time |
| It works but is kept secret | `a_break_is_its_answers`, `factor_iff_witness`, `one_instance_refutes` | A break is its answers alone; a factor is checked by one division; one instance refutes a claimed break |
| It is a formula, not a machine | `no_formal_alone_cheat_code` | No break of factoring holds apart from the machine that runs it |
| Factoring is therefore finished | `factor_normal_form`, `factor_uniform_forces_nothing` | The question is one keyed transfer; no uniform premise settles it |

## 2. The Model

A machine, in the sense of Appendix A, is a set of algorithms, a set of instances, a size for each instance, and for each algorithm and instance an output bit and a running time. The machine also carries the predicate it is asked to decide. The definitions are carried from the normal form of the separation published with the P versus NP master on 21 October 2026 (Islam 2026a), and they are printed in full in Appendix A.

An algorithm runs *clean* on an instance at the bound c and k when its output equals the predicate and its running time is at most c·n^k^ + c, where n is the size of the instance. An algorithm *escapes* at a bound when it runs clean on every instance. A machine is *separated* when no algorithm escapes at any bound, so that separation is the statement that no polynomial algorithm decides the predicate. The *record* of a machine is the same machine with every output read against the predicate as its opposite. On the record nothing escapes, and that is proved with no premise but one instance in `record_has_least_escape`.

The factoring row is the machine whose predicate is the decision form of factoring, whether N has a proper factor up to k, whose instances are the pairs N and k, and whose size is the sum of their bit lengths. An *algorithm model* of the factoring row is one choice of its algorithms with their outputs and running times; every algorithm model shares the predicate, the instances and the sizes, and two models differ only in which algorithms they have and how those algorithms behave.

The algorithms of a machine are an arbitrary type. Nothing in the definitions limits them to a programming language, to a physical device or to a reasoning style. An AI, an oracle and a function that no device computes are all algorithms of some machine, and every theorem stated for every machine is stated for them.

## 3. A Cipher No Algorithm Breaks

The one-time pad encrypts a message, a string of bits, with a key of the same length by exclusive or, and decrypts by exclusive or again. Appendix A proves that decryption inverts encryption (`dec_enc`), that every message fits every ciphertext of its length under some key (`every_message_fits`), and that the key carrying a message to a ciphertext is unique (`one_key_per_message`).

The theorem `no_adversary_breaks_the_pad` takes any adversary at all, any function from ciphertexts to messages. For any ciphertext and any two different messages of its length, each message is the encryption of the ciphertext under a key, unique by `one_key_per_message`, and the adversary's answer misses at least one of them. With the key chosen uniformly and used once, every message of that length is equally consistent with the ciphertext, so the ciphertext holds no information that tells the messages apart, and no amount of computation recovers what is not there. The theorem depends on no axiom at all. This is the kernel of Shannon's perfect secrecy, now checked by a machine.

One cipher that no algorithm breaks is enough to refute the claim that an algorithm breaks any cryptography. The claim does not survive its own first word.

## 4. A Key Space No Guesser Shortcuts

A guesser that tests keys one at a time asks, of each candidate, whether it is the key. Appendix A carries from the P versus NP master the pigeonhole bound of such search: a list that contains every number below K has at least K entries (`pigeon`). A fixed list of fewer than 2^N^ guesses therefore misses some N-bit key (`fixed_guessing_floor`).

The adaptive case is proved as well. A guesser may choose each next test from all the tests it has made so far, by any rule at all. Its *path* is the run on which every test so far has failed, and `off_path_finds_nothing` proves that against a key off the path the guesser follows that path and finds nothing. The theorem `no_guesser_shortcuts` follows: any adaptive strategy that makes fewer than 2^N^ tests leaves an N-bit key it never finds. For a key of 128 bits, that is 2^128^ tests, whatever chooses them.

A floor of the same kind holds for the discrete logarithm in the generic group model, as Shoup proved in 1997: an algorithm that uses the group only through its operations needs a number of operations of the order of the square root of the largest prime factor of the group order. Appendix A formalises the test-only case; Shoup's theorem is cited.

## 5. No Speedup Crosses a Class

The public records of 2026 were gains in speed, and speed is the most common source of the claim that a method has crossed into a new class. Appendix A states the class with bounds c·(n+1)^k^, and `polyB_iff_bound` proves that it is the class of Section 2, the running times bounded by some c·n^k^ + c.

`constant_speedup` proves that if a slow machine takes at most s times what a fast machine takes, the slow one is polynomial whenever the fast one is. `polynomial_speedup` proves the same for a speedup by a polynomial factor, which covers any number of processors polynomial in the size of the input. The contrapositive is `no_speedup_crosses_a_class`: a method that is not polynomial stays not polynomial on any machine faster by a constant or by a polynomial factor.

The number field sieve, the fastest known classical method for factoring large numbers, sieves over a factor base that holds every prime up to a bound that grows faster than every polynomial in the bit length (Lenstra and Lenstra 1993), so its running time, which is at least the size of that base, grows faster than every polynomial as well. Running it on faster hardware, on more hardware, or with better engineering moves it inside its class. The theorem proves that none of these moves it across.

## 6. Every Claimed Break Is Checked by One Witness

A factoring break acts on the world in one way: it produces factors. Appendix A defines the check of a claimed factor d of N as one pair of comparisons and one division (`verify`), proves the check sound (`verify_sound`), and proves that the decision form of factoring, whether N has a proper factor up to k, holds exactly when some d up to k passes the check (`factor_iff_witness`). `product_passes_the_check` proves that two numbers above one whose product is N give a factor of N that passes the check, so a claimed factorization is confirmed by one multiplication.

Three theorems close the section. `a_break_is_its_answers` proves that two algorithms giving the same answers in the same times are both breaks or neither, so who holds an algorithm, whether it is kept secret and how it was found change nothing. `a_break_answers_every_challenge` proves that a real break answers every instance put to it, correctly and within its bound. `one_instance_refutes` proves that a claimed break is refuted by one instance on which it errs or overruns. Together they fix what a claim of a break must do to be believed and what refutes it. The claim must answer a public challenge, and the answer is checked by anyone in one step.

## 7. No Break Apart from the Machine That Runs It

The claim of a secret cheat code often takes the form of a formula: a piece of mathematics, found once, that cracks every key whatever runs it. Appendix A states the factoring row over every algorithm model (`factorRow`) and builds two models on the identical predicate, the identical instances and the identical sizes. In one, an algorithm answers every instance within the bound (`factor_oracle_escapes`). In the other, nothing escapes (`factor_closed_separated`).

`no_formal_alone_cheat_code` follows: no escape of the factoring row holds in every algorithm model. A break that works on the predicate alone, whatever machine reads it, is refuted by the second model. Any break exists only on the machine that runs it, and is delivered there by running. Its mirror, `no_formal_alone_bar`, proves that no separation of the factoring row holds in every model either. The predicate alone settles neither side.

Two further theorems fix what a reading of the predicate cannot do. `separation_does_not_carry` proves that the separation of one machine does not give the separation of another on the same predicate. `record_cannot_tell` proves that in every model the records of the primality row and of the factoring row are both separated. Primality was placed in polynomial time by Agrawal, Kayal and Saxena in 2004, so no argument that reads only the record can tell the row they opened from the row that remains.

## 8. The Factoring Question, Located Exactly

Whether a polynomial classical algorithm for factoring exists is the separation of one machine, the factoring row on classical machines. Appendix A proves exactly what that question is and which routes cannot reach it.

`factor_normal_form` proves that on every model the separation of the factoring row is exactly its own transfer, the implication from the record's closure to the machine's. `factor_every_route` proves that every route to the separation, from any premise, delivers that transfer. `factor_uniform_forces_nothing` proves that no premise true of the factoring row in every model forces the separation, and `factor_bit_is_keyed` proves that the transfer holds in one model and fails in another, so that it is keyed to its machine. The same normal form holds for the discrete logarithm and for every other row, since `sep_normal_form` is stated for every machine; on satisfiability the same form, with the identity of its faces, is proved in the identity paper of the same line (Islam 2026b).

The question is therefore one keyed bit. No reading of the predicate settles it, no uniform premise forces it, no speedup crosses it, and no true fact that holds whatever the model, about another problem or about anything else, carries to it (`no_outside_fact_carries`): a reduction carries a result only because it is a statement about the factoring row's own algorithms. Any answer is a concrete algorithm on a concrete machine, or a proof about that machine, and either is public the moment it is shown.

## 9. The Records of September 2026

Two records were set in September 2026, and both were reached with AI assistance. On 3 September 2026, Eric Lu, working with Cognition and its software agent Devin, factored RSA-260, a number of 260 decimal digits and 862 bits, by the general number field sieve. The work was a heavily modified CADO-NFS with lattice sieving and linear algebra on graphics processors, about 4,900 GPU-days of compute, and Lu reports essentially no algorithmic advance. On 19 September 2026, Stephen A. Weis of Anthropic announced the factorization of RSA-896, a number of 270 decimal digits and 896 bits, with Claude porting CADO-NFS to graphics processors and orchestrating the computation, about 30 GPU-years in all. Weis reports no meaningful improvement in the running time of the sieve (Lu 2026; Ivezic 2026).

Read against the theorems, each record is what Section 5 says a gain in speed is: the known sieve, moved inside its class. Each was a concrete algorithm on a concrete machine, as Section 7 requires of any break. Each was announced in public with its factors, and each is checked by one multiplication, as Section 6 provides. Each record is one number. Neither is a master key: Lu reports that RSA-2048 does not appear to be meaningfully affected, and the report on RSA-896 places RSA-2048 out of classical reach. These are records of honest public work, and read correctly they are evidence against the narrative they are cited for.

## 10. How to Test a Master Key

The RSA Factoring Challenge, created by RSA Laboratories in March 1991 and ended in 2007, left its numbers public. RSA-2048, a number of 617 decimal digits, has not been factored (Wikipedia 2026). A claim of a master key for factoring is tested by one request: publish two numbers whose product is RSA-2048. Anyone checks the answer by one multiplication, as `product_passes_the_check` provides, and a claim that cannot produce the factors has shown nothing, as `one_instance_refutes` provides. No trust in the claimant, in the AI or in this paper is needed. The test is the theorem, applied.

## 11. Closure

The secret cheat code that breaks all cryptography is refuted at each of its words. *All* is refuted by a cipher that no adversary of any power breaks. *Cheat code*, a formula that works whatever machine reads it, is refuted by the theorem that no break of factoring holds apart from the machine that runs it. *Secret* is answered by the witness: a break is its answers and nothing else, it is checked by one division, and one instance refutes it. *Found by AI* changes nothing, because every theorem here speaks of every algorithm. The gains of 2026 were gains in speed, and no speedup crosses a class.

What remains is one question, located exactly: on every model the factoring question is one keyed transfer, passed by every route and forced by no uniform premise. No theorem here depends on the P versus NP question or on any conjecture. No axiom is declared. Every proof is complete. There is no master key.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. The normal form of Section 2 is carried from the kernel of the P versus NP master, and the pigeonhole bound of Section 4 from its black-box part, both under their original names; the one-time pad, the adaptive guesser, the class bridge, the speedup theorems and the witness theorems are written for this paper as machine-checked proofs of the classical results they formalise, Shannon (1949) for the pad and the pigeonhole count for the guesser, and the factoring row with its located question is new here. Appendix A compiles under Lean 4.19.0 (de Moura and Ullrich 2021) with no import; its capstone, `there_is_no_master_key`, depends on Lean's three standard axioms, and `no_adversary_breaks_the_pad` on none. The facts of Section 9 are taken from the public reports cited, and the arithmetic of Section 10 from the published challenge.

## References

1. Agrawal, M., Kayal, N. and Saxena, N. (2004). PRIMES is in P. *Annals of Mathematics* 160(2), 781–793.
2. de Moura, L. and Ullrich, S. (2021). The Lean 4 theorem prover and programming language. *Automated Deduction, CADE 28*, LNCS 12699, 625–635.
3. Islam, M. F. (2026a). *P ≠ NP Closed to One Bit*, Math Journal edition, with the kernel PNP_Normal_Form_Paper_v1_3_0_CC.lean. <https://github.com/1000sapients/Trisduction/commit/67e477c>
4. Islam, M. F. (2026b). *A Theorem-Grade Proof of the Identity of P ≠ NP: The Vacant Seat*. <https://github.com/1000sapients/Trisduction/commit/e383113>
5. Ivezic, M. (2026). RSA-896 Factored With Claude on Spare GPUs, 16 Days After RSA-260. *PostQuantum.com*, 19 September 2026. <https://postquantum.com/security-pqc/rsa-896-factored-claude-gpus/>
6. Lenstra, A. K. and Lenstra, H. W., Jr. (eds.) (1993). *The Development of the Number Field Sieve*. Lecture Notes in Mathematics 1554, Springer.
7. Lu, E. (2026). Factoring RSA-260. *Cognition*, 9 September 2026. <https://cognition.com/blog/factoring-rsa-260>
8. Shannon, C. E. (1949). Communication theory of secrecy systems. *Bell System Technical Journal* 28(4), 656–715.
9. Shoup, V. (1997). Lower bounds for discrete logarithms and related problems. *Advances in Cryptology, EUROCRYPT '97*, LNCS 1233, 256–266.
10. Wikipedia (2026). RSA numbers. <https://en.wikipedia.org/wiki/RSA_numbers>

## Appendix A · No_Master_Key_CC.lean

The kernel of this paper, printed whole. Core Lean 4.19.0, no import, no axiom declared, no sorry; it compiles silently except for the nine #print axioms lines at its end, which name the axioms of each capstone. Every theorem named in Sections 1 to 11 is here under that name.

```lean
/-
  No_Master_Key_CC.lean · v1.0.0 · the kernel of the paper "There Is No Master Key".
  Claude-coded (_CC), written under the direct supervision of the author. Core Lean 4.19.0, standalone.

  RATIONALE. A public narrative claims that an AI has found a secret cheat code that cracks any cryptography, so
    that prime factoring and the keys built on it are already cooked. This file answers that narrative with
    machine-checked theorems. Each theorem is unconditional and each is stated for every algorithm, which includes
    every AI, every oracle and every function, computable or not, wherever the statement quantifies over one.
  DESIGN, in six parts.
    I    THE CIPHER NO ALGORITHM BREAKS. The one-time pad on bit strings: every ciphertext is the encryption of every
         message of its length under exactly one key, so no adversary of any power recovers the message.
    II   THE KEY SPACE NO GUESSER SHORTCUTS. A test-only search over 2^N keys, fixed or adaptive, that makes fewer
         than 2^N tests leaves a key it never found. Pigeonhole, carried from PNP.BLACKBOX, on no axiom.
    III  NO SPEEDUP CROSSES A CLASS. A machine faster by any constant factor or any polynomial factor is polynomial
         exactly when the slower one is; faster hardware moves a method inside its class and never across it. The
         class of Part III is the class of the normal form's bound (polyB_iff_bound).
    IV   EVERY CLAIMED BREAK IS CHECKED BY ONE WITNESS. A factor is verified by one division, a factorization by one
         multiplication (product_passes_the_check), a claimed break is
         refuted by one public instance on which it errs or overruns, and whether an algorithm is a break depends
         on its answers alone (a_break_is_its_answers), so secrecy is no property of a break.
    V    NO FORMAL-ALONE CHEAT CODE. On the decision form of factoring, no escape holds in every algorithm model
         and no separation does: a break exists only on the machine that runs it. The record of the primality row
         and of the factoring row cannot be told apart. The separation of one row does not carry to another.
    VI   THE ONE OPEN, LOCATED EXACTLY. On every model, the separation of the factoring row is exactly its own
         transfer; every route to it passes that one keyed bit, no premise uniform over models forces it, and no
         true fact that holds whatever the model carries to it (no_outside_fact_carries).
  STANDING. The normal form (Machine, Clean, Escapes, Sep, Rec, the closure and the route law) is carried from
    PNP_Normal_Form_CC.lean of 21 October 2026, Part A of the P ≠ NP master, under namespace NMK.NF. Nothing in this
    file proves or assumes that factoring or the discrete logarithm is hard or easy on classical machines. That
    sentence is the one open, and Part VI proves it is exactly one keyed bit.
  CITED, NOT FORMALISED. Shannon 1949 (perfect secrecy; Part I is its kernel); Agrawal, Kayal and Saxena 2004
    (primality in P); the number field sieve (subexponential); Shoup 1997 (the generic-group floor for the discrete
    logarithm, the analogue of Part II).
  NON-NEGOTIABLE. No import, no axiom declared, no sorry, no native_decide. No theorem may be restated as "no fast
    classical factoring algorithm exists"; that is not proved here. Every capstone is pinned by #print axioms.
  RISKS. Part V's models are algorithm models, not Turing machines: they bar arguments uniform over machine models,
    as relativization does, and do not bar a concrete algorithm proved on real machines (as AKS is for primality).
    Part III states the class with bounds c·(n+1)^k; polyB_iff_bound proves it the class of the bound c·n^k + c.
-/

/-! # THE NORMAL FORM, carried from Part A of the P ≠ NP master -/
namespace NMK.NF

structure Machine where
  Alg  : Type
  Inst : Type
  size : Inst → Nat
  out  : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat  : Inst → Bool

def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop :=
  M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
def Escapes (M : Machine) (A : M.Alg) (c k : Nat) : Prop := ∀ x, Clean M A c k x
def NothingEscapes (M : Machine) : Prop := ∀ A c k, ∃ x, ¬ Clean M A c k x
def Sep (M : Machine) : Prop := ¬ ∃ A c k, Escapes M A c k

theorem sep_of_closure (M : Machine) (h : NothingEscapes M) : Sep M :=
  fun ⟨A, c, k, he⟩ => match h A c k with
    | ⟨x, hx⟩ => hx (he x)

theorem closure_of_sep (M : Machine) (h : Sep M) : NothingEscapes M :=
  fun A c k => Classical.byContradiction fun hn =>
    h ⟨A, c, k, fun x => Classical.byContradiction fun hx => hn ⟨x, hx⟩⟩

theorem bnot_ne (b : Bool) : (!b) ≠ b := by cases b <;> decide

/-- The record of a machine: every output read against the predicate as its opposite. -/
def Rec (M : Machine) : Machine := { M with out := fun _ x => !(M.sat x) }

theorem record_has_least_escape (M : Machine) (x₀ : M.Inst) : NothingEscapes (Rec M) :=
  fun _ _ _ => ⟨x₀, fun hc => bnot_ne (M.sat x₀) hc.1⟩

theorem record_is_separated (M : Machine) (x₀ : M.Inst) : Sep (Rec M) :=
  sep_of_closure (Rec M) (record_has_least_escape M x₀)

theorem sep_normal_form (M : Machine) (x₀ : M.Inst) :
    (NothingEscapes (Rec M) → NothingEscapes M) ↔ Sep M :=
  ⟨fun h => sep_of_closure M (h (record_has_least_escape M x₀)),
   fun hs _ => closure_of_sep M hs⟩

theorem every_route_passes_the_bit (M : Machine) (x₀ : M.Inst) (Q : Prop) (h : Q → Sep M) :
    Q → (NothingEscapes (Rec M) → NothingEscapes M) :=
  fun q => (sep_normal_form M x₀).mpr (h q)

end NMK.NF

/-! # PART I · THE CIPHER NO ALGORITHM BREAKS -/
namespace NMK.PAD

/-- Bitwise exclusive or of two strings, to the shorter length. -/
def xorL : List Bool → List Bool → List Bool
  | [], _ => []
  | _ :: _, [] => []
  | a :: as, b :: bs => xor a b :: xorL as bs

/-- Encryption and decryption under a key: both are the exclusive or. -/
def enc (key msg : List Bool) : List Bool := xorL key msg
def dec (key ct : List Bool) : List Bool := xorL key ct

theorem xor_cancel (a b : Bool) : xor a (xor a b) = b := by cases a <;> cases b <;> rfl
theorem xor_comm' (a b : Bool) : xor a b = xor b a := by cases a <;> cases b <;> rfl

theorem xorL_comm : ∀ a b : List Bool, xorL a b = xorL b a
  | [], [] => rfl
  | [], _ :: _ => rfl
  | _ :: _, [] => rfl
  | a :: as, b :: bs => by
    show xor a b :: xorL as bs = xor b a :: xorL bs as
    rw [xor_comm' a b, xorL_comm as bs]

theorem xorL_length : ∀ a b : List Bool, a.length = b.length → (xorL a b).length = a.length
  | [], _, _ => rfl
  | _ :: _, [], h => Nat.noConfusion h
  | _ :: as, _ :: bs, h => by
    show (xorL as bs).length + 1 = as.length + 1
    rw [xorL_length as bs (Nat.succ.inj h)]

theorem xorL_cancel : ∀ k m : List Bool, k.length = m.length → xorL k (xorL k m) = m
  | [], [], _ => rfl
  | [], _ :: _, h => Nat.noConfusion h
  | _ :: _, [], h => Nat.noConfusion h
  | a :: as, b :: bs, h => by
    show xor a (xor a b) :: xorL as (xorL as bs) = b :: bs
    rw [xor_cancel, xorL_cancel as bs (Nat.succ.inj h)]

/-- Decryption inverts encryption. -/
theorem dec_enc (key msg : List Bool) (h : key.length = msg.length) : dec key (enc key msg) = msg :=
  xorL_cancel key msg h

/-- EVERY MESSAGE FITS EVERY CIPHERTEXT: for a ciphertext and a message of its length there is a key of that
    length under which the message encrypts to the ciphertext. -/
theorem every_message_fits (msg ct : List Bool) (h : msg.length = ct.length) :
    ∃ key, key.length = ct.length ∧ enc key msg = ct :=
  ⟨xorL msg ct, (xorL_length msg ct h).trans h,
   by show xorL (xorL msg ct) msg = ct; rw [xorL_comm]; exact xorL_cancel msg ct h⟩

/-- EXACTLY ONE KEY PER MESSAGE: the key that carries a message to a ciphertext is unique. -/
theorem one_key_per_message (key msg ct : List Bool) (hk : key.length = msg.length) (he : enc key msg = ct) :
    key = xorL msg ct := by
  have : xorL msg (xorL msg key) = key := xorL_cancel msg key hk.symm
  rw [← he]; show key = xorL msg (xorL key msg); rw [xorL_comm key msg]; exact this.symm

/-- THE CIPHER NO ALGORITHM BREAKS. Take any adversary at all, any function from ciphertexts to messages, an AI or
    an oracle or anything else. For any ciphertext and any two different messages of its length, each message is
    the encryption of the ciphertext under exactly one key, and the adversary's answer misses at least one of them. -/
theorem no_adversary_breaks_the_pad (adv : List Bool → List Bool) (m₁ m₂ ct : List Bool)
    (h₁ : m₁.length = ct.length) (h₂ : m₂.length = ct.length) (hne : m₁ ≠ m₂) :
    (∃ k₁, k₁.length = ct.length ∧ enc k₁ m₁ = ct) ∧
    (∃ k₂, k₂.length = ct.length ∧ enc k₂ m₂ = ct) ∧
    (adv ct ≠ m₁ ∨ adv ct ≠ m₂) :=
  ⟨every_message_fits m₁ ct h₁, every_message_fits m₂ ct h₂,
   if h : adv ct = m₁ then Or.inr (fun h' => hne (h.symm.trans h')) else Or.inl h⟩

theorem pad_checks :
    enc [true, false, true] [false, false, true] = [true, false, false] ∧
    dec [true, false, true] [true, false, false] = [false, false, true] := ⟨rfl, rfl⟩

end NMK.PAD

/-! # PART II · THE KEY SPACE NO GUESSER SHORTCUTS (carried from PNP.BLACKBOX) -/
namespace NMK.KEYS

def has : List Nat → Nat → Bool
  | [], _ => false
  | y :: ys, k => Nat.beq y k || has ys k
def drop : List Nat → Nat → List Nat
  | [], _ => []
  | y :: ys, k => cond (Nat.beq y k) (drop ys k) (y :: drop ys k)
theorem beq_self : ∀ n : Nat, Nat.beq n n = true
  | 0 => rfl
  | n + 1 => beq_self n
theorem drop_le : ∀ (l : List Nat) (k : Nat), (drop l k).length ≤ l.length
  | [], _ => Nat.le_refl 0
  | y :: ys, k => by
    unfold drop
    cases Nat.beq y k with
    | true => exact Nat.le_succ_of_le (drop_le ys k)
    | false => exact Nat.succ_le_succ (drop_le ys k)
theorem drop_len : ∀ (l : List Nat) (k : Nat), has l k = true → (drop l k).length + 1 ≤ l.length
  | [], _, h => Bool.noConfusion h
  | y :: ys, k, h => by
    unfold drop
    unfold has at h
    cases hy : Nat.beq y k with
    | true => exact Nat.succ_le_succ (drop_le ys k)
    | false =>
      rw [hy] at h
      exact Nat.succ_le_succ (drop_len ys k h)
theorem has_drop : ∀ (l : List Nat) (k x : Nat), Nat.beq x k = false →
    has l x = true → has (drop l k) x = true
  | [], _, _, _, h => Bool.noConfusion h
  | y :: ys, k, x, hxk, h => by
    unfold drop
    unfold has at h
    cases hy : Nat.beq y k with
    | true =>
      cases hyx : Nat.beq y x with
      | true =>
        have : x = k := (Nat.eq_of_beq_eq_true hyx).symm.trans (Nat.eq_of_beq_eq_true hy)
        rw [this, beq_self] at hxk; exact Bool.noConfusion hxk
      | false =>
        rw [hyx] at h
        exact has_drop ys k x hxk h
    | false =>
      show has (y :: drop ys k) x = true
      unfold has
      cases hyx : Nat.beq y x with
      | true => rfl
      | false =>
        rw [hyx] at h
        exact has_drop ys k x hxk h
theorem beq_false_of_lt (x K : Nat) (h : x < K) : Nat.beq x K = false := by
  cases hb : Nat.beq x K with
  | false => rfl
  | true =>
    have e : x = K := Nat.eq_of_beq_eq_true hb
    rw [e] at h; exact absurd h (Nat.lt_irrefl K)

/-- PIGEONHOLE, on no axiom: a list that contains every number below K has at least K entries. -/
theorem pigeon : ∀ (K : Nat) (l : List Nat), (∀ x, x < K → has l x = true) → K ≤ l.length
  | 0, _, _ => Nat.zero_le _
  | K + 1, l, h =>
    Nat.le_trans
      (Nat.succ_le_succ (pigeon K (drop l K) (fun x hx =>
        has_drop l K x (beq_false_of_lt x K hx) (h x (Nat.lt_succ_of_lt hx)))))
      (drop_len l K (h K (Nat.lt_succ_self K)))

/-- FIXED GUESSING: any list of fewer than 2^N guesses misses some N-bit key. -/
theorem fixed_guessing_floor (N : Nat) (guesses : List Nat) (h : guesses.length < 2 ^ N) :
    ¬ ∀ key, key < 2 ^ N → has guesses key = true :=
  fun hall => Nat.not_lt_of_le (pigeon (2 ^ N) guesses hall) h

theorem has_append : ∀ (l₁ l₂ : List Nat) (x : Nat), has (l₁ ++ l₂) x = (has l₁ x || has l₂ x)
  | [], _, _ => rfl
  | y :: ys, l₂, x => by
    show (Nat.beq y x || has (ys ++ l₂) x) = ((Nat.beq y x || has ys x) || has l₂ x)
    rw [has_append ys l₂ x, Bool.or_assoc]

/-- An adaptive guesser: any strategy, an AI included, choosing the next test from the tests made so far. The path
    is the run on which every test so far has failed. -/
def path (next : List Nat → Nat) : Nat → List Nat
  | 0 => []
  | q + 1 => path next q ++ [next (path next q)]

theorem path_length (next : List Nat → Nat) : ∀ q, (path next q).length = q
  | 0 => rfl
  | q + 1 => by
    show (path next q ++ [next (path next q)]).length = q + 1
    rw [List.length_append, path_length next q]; rfl

/-- The interaction of a guesser with the test oracle of a key: it stops when a test succeeds. -/
def interact (next : List Nat → Nat) (o : Nat → Bool) : Nat → List Nat × Bool
  | 0 => ([], false)
  | q + 1 => match interact next o q with
    | (p, true) => (p, true)
    | (p, false) => (p ++ [next p], o (next p))

/-- Against a key off the path, the interaction is the path and finds nothing. -/
theorem off_path_finds_nothing (next : List Nat → Nat) (x : Nat) :
    ∀ q, has (path next q) x = false → interact next (fun y => Nat.beq y x) q = (path next q, false)
  | 0, _ => rfl
  | q + 1, h => by
    have h' : (has (path next q) x || has [next (path next q)] x) = false := by
      rw [← has_append]; exact h
    have hp : has (path next q) x = false := by
      cases hq : has (path next q) x with
      | false => rfl
      | true => rw [hq] at h'; exact Bool.noConfusion h'
    have hy : Nat.beq (next (path next q)) x = false := by
      have h'' : has [next (path next q)] x = false := by
        cases hq2 : has [next (path next q)] x with
        | false => rfl
        | true => rw [hq2, Bool.or_true] at h'; exact Bool.noConfusion h'
      cases hb : Nat.beq (next (path next q)) x with
      | false => rfl
      | true => show true = false; rw [← hb]; exact (Bool.or_false _).symm.trans h''
    show (match interact next (fun y => Nat.beq y x) q with
      | (p, true) => (p, true)
      | (p, false) => (p ++ [next p], Nat.beq (next p) x)) = (path next q ++ [next (path next q)], false)
    rw [off_path_finds_nothing next x q hp]
    show (path next q ++ [next (path next q)], Nat.beq (next (path next q)) x) = _
    rw [hy]

/-- THE KEY SPACE NO GUESSER SHORTCUTS. Any adaptive strategy, an AI included, that makes fewer than 2^N tests
    leaves an N-bit key it never finds. Stated without an axiom as the failure of "it finds every key". -/
theorem no_guesser_shortcuts (next : List Nat → Nat) (N q : Nat) (hq : q < 2 ^ N) :
    ¬ ∀ key, key < 2 ^ N → (interact next (fun y => Nat.beq y key) q).2 = true :=
  fun hall => fixed_guessing_floor N (path next q) ((path_length next q).symm ▸ hq) (fun key hk => by
    cases hh : has (path next q) key with
    | true => rfl
    | false =>
      have := hall key hk
      rw [off_path_finds_nothing next key q hh] at this
      exact Bool.noConfusion this)

end NMK.KEYS

/-! # PART III · NO SPEEDUP CROSSES A CLASS -/
namespace NMK.SPEED

/-- A running time is polynomial when some c·(n+1)^k bounds it at every instance. -/
def PolyB {I : Type} (size : I → Nat) (t : I → Nat) : Prop := ∃ c k, ∀ x, t x ≤ c * (size x + 1) ^ k

/-- A CONSTANT SPEEDUP KEEPS THE CLASS: if the slow machine takes at most s times the fast one, the slow one is
    polynomial whenever the fast one is. -/
theorem constant_speedup {I : Type} (size : I → Nat) (t t' : I → Nat) (s : Nat)
    (h : ∀ x, t x ≤ s * t' x) : PolyB size t' → PolyB size t :=
  fun ⟨c, k, hb⟩ => ⟨s * c, k, fun x => by
    rw [Nat.mul_assoc]; exact Nat.le_trans (h x) (Nat.mul_le_mul_left s (hb x))⟩

/-- A POLYNOMIAL SPEEDUP KEEPS THE CLASS: polynomially many processors, or a polynomially faster machine, cannot
    make a superpolynomial method polynomial. -/
theorem polynomial_speedup {I : Type} (size : I → Nat) (t t' : I → Nat) (a j : Nat)
    (h : ∀ x, t x ≤ a * (size x + 1) ^ j * t' x) : PolyB size t' → PolyB size t :=
  fun ⟨c, k, hb⟩ => ⟨a * c, j + k, fun x => by
    rw [Nat.pow_add, ← Nat.mul_mul_mul_comm]
    exact Nat.le_trans (h x) (Nat.mul_le_mul_left _ (hb x))⟩

/-- NO SPEEDUP CROSSES A CLASS: a method that is not polynomial stays not polynomial on any machine faster by a
    constant or by a polynomial factor. -/
theorem no_speedup_crosses_a_class {I : Type} (size : I → Nat) (t t' : I → Nat) (a j : Nat)
    (h : ∀ x, t x ≤ a * (size x + 1) ^ j * t' x) : ¬ PolyB size t → ¬ PolyB size t' :=
  fun hn hp => hn (polynomial_speedup size t t' a j h hp)

/-- (n+1)^k is at most 2^k·n^k + 1, the step that joins the two forms of the polynomial bound. -/
theorem succ_pow_le (n k : Nat) : (n + 1) ^ k ≤ 2 ^ k * n ^ k + 1 := by
  cases n with
  | zero => rw [Nat.zero_add, Nat.one_pow]; exact Nat.le_add_left 1 _
  | succ m =>
    have h : m + 1 + 1 ≤ 2 * (m + 1) := by omega
    calc (m + 1 + 1) ^ k ≤ (2 * (m + 1)) ^ k := Nat.pow_le_pow_left h k
      _ = 2 ^ k * (m + 1) ^ k := Nat.mul_pow 2 (m + 1) k
      _ ≤ 2 ^ k * (m + 1) ^ k + 1 := Nat.le_succ _

/-- ONE CLASS, TWO FORMS: a running time is bounded by some c·(n+1)^k exactly when it is bounded by some
    c·n^k + c, the bound of the normal form. The speedup theorems therefore speak of the class of Section 2. -/
theorem polyB_iff_bound {I : Type} (size : I → Nat) (t : I → Nat) :
    PolyB size t ↔ ∃ c k, ∀ x, t x ≤ NMK.NF.bound c k (size x) := by
  constructor
  · intro ⟨c, k, h⟩
    refine ⟨c * 2 ^ k, k, fun x => ?_⟩
    show t x ≤ c * 2 ^ k * size x ^ k + c * 2 ^ k
    calc t x ≤ c * (size x + 1) ^ k := h x
      _ ≤ c * (2 ^ k * size x ^ k + 1) := Nat.mul_le_mul_left c (succ_pow_le _ _)
      _ = c * 2 ^ k * size x ^ k + c := by rw [Nat.mul_add, Nat.mul_one, Nat.mul_assoc]
      _ ≤ c * 2 ^ k * size x ^ k + c * 2 ^ k :=
          Nat.add_le_add_left (Nat.le_mul_of_pos_right c (Nat.two_pow_pos k)) _
  · intro ⟨c, k, h⟩
    refine ⟨2 * c, k, fun x => ?_⟩
    have hx : t x ≤ c * size x ^ k + c := h x
    have h1 : size x ^ k ≤ (size x + 1) ^ k := Nat.pow_le_pow_left (Nat.le_succ _) k
    have h2 : c ≤ c * (size x + 1) ^ k := Nat.le_mul_of_pos_right c (Nat.pow_pos (Nat.succ_pos (size x)))
    calc t x ≤ c * size x ^ k + c := hx
      _ ≤ c * (size x + 1) ^ k + c * (size x + 1) ^ k := Nat.add_le_add (Nat.mul_le_mul_left c h1) h2
      _ = 2 * c * (size x + 1) ^ k := by rw [← Nat.two_mul, Nat.mul_assoc]

end NMK.SPEED

/-! # PART IV · EVERY CLAIMED BREAK IS CHECKED BY ONE WITNESS -/
namespace NMK.WITNESS
open NMK.NF

/-- The check of a claimed factor: one comparison pair and one division. -/
def verify (N d : Nat) : Bool := decide (1 < d) && decide (d < N) && (N % d == 0)

/-- The decision form of factoring: N has a factor d with 1 < d < N and d ≤ k. -/
def hasFactorLE (N k : Nat) : Bool := (List.range (k + 1)).any (fun d => verify N d)

/-- THE WITNESS IS SOUND: a factor that passes the check divides N and is proper. -/
theorem verify_sound (N d : Nat) (h : verify N d = true) : 1 < d ∧ d < N ∧ N % d = 0 := by
  simp [verify] at h; exact ⟨h.1.1, h.1.2, h.2⟩

/-- THE DECISION IS ITS WITNESS: N has a factor up to k exactly when some d up to k passes the check. -/
theorem factor_iff_witness (N k : Nat) : hasFactorLE N k = true ↔ ∃ d, d ≤ k ∧ verify N d = true := by
  simp only [hasFactorLE, List.any_eq_true, List.mem_range]
  exact ⟨fun ⟨d, hd, hv⟩ => ⟨d, Nat.le_of_lt_succ hd, hv⟩, fun ⟨d, hd, hv⟩ => ⟨d, Nat.lt_succ_of_le hd, hv⟩⟩

/-- ONE MULTIPLICATION CHECKS A FACTORIZATION: two numbers above one whose product is N give a factor of N that
    passes the check, so a claimed factorization is confirmed by multiplying its two factors. -/
theorem product_passes_the_check (p q : Nat) (hp : 1 < p) (hq : 1 < q) : verify (p * q) p = true := by
  have h1 : p < p * q := by
    have h0 : 0 < p := Nat.lt_trans Nat.zero_lt_one hp
    have := Nat.mul_lt_mul_of_pos_left hq h0
    rw [Nat.mul_one] at this; exact this
  simp [verify, hp, h1, Nat.mul_mod_right]

theorem witness_checks : verify 15 3 = true ∧ verify 13 5 = false ∧ hasFactorLE 15 3 = true ∧
    hasFactorLE 13 12 = false := ⟨rfl, rfl, rfl, rfl⟩

/-- ONE PUBLIC INSTANCE REFUTES A CLAIMED BREAK: a break claimed at a bound is refuted by one instance on which it
    errs or overruns. -/
theorem one_instance_refutes (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) (h : ¬ Clean M A c k x) :
    ¬ Escapes M A c k :=
  fun he => h (he x)

/-- A REAL BREAK ANSWERS EVERY PUBLIC CHALLENGE: correctly and within its bound, on any instance put to it. -/
theorem a_break_answers_every_challenge (M : Machine) (A : M.Alg) (c k : Nat) (he : Escapes M A c k)
    (x : M.Inst) : M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x) :=
  he x

/-- A BREAK IS ITS ANSWERS: two algorithms of one machine that give the same answers in the same times on every
    instance are both breaks or neither. Who holds an algorithm, whether it is kept secret and how it was found
    change nothing; what makes it a break is what it answers. -/
theorem a_break_is_its_answers (M : Machine) (A B : M.Alg) (c k : Nat)
    (h : ∀ x, M.out A x = M.out B x ∧ M.time A x = M.time B x) :
    Escapes M A c k ↔ Escapes M B c k := by
  constructor
  · intro he x
    have e := he x
    exact ⟨(h x).1.symm.trans e.1, by rw [← (h x).2]; exact e.2⟩
  · intro he x
    have e := he x
    exact ⟨(h x).1.trans e.1, by rw [(h x).2]; exact e.2⟩

end NMK.WITNESS

/-! # PART V · NO FORMAL-ALONE CHEAT CODE -/
namespace NMK.ROW
open NMK.NF NMK.WITNESS

def isPrimeB (N : Nat) : Bool :=
  decide (2 ≤ N) && !((List.range N).any (fun d => decide (1 < d) && (N % d == 0)))

/-- Size of an instance: the sum of the bit lengths of N and k, so polynomial means polynomial in log N. -/
def fsize (x : Nat × Nat) : Nat := Nat.log2 x.1 + Nat.log2 x.2 + 2

/-- The factoring row over any algorithm model. -/
def factorRow (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat) : Machine :=
  ⟨Alg, Nat × Nat, fsize, out, time, fun x => hasFactorLE x.1 x.2⟩

/-- The primality row over any algorithm model (the row AKS placed in P). -/
def primeRow (Alg : Type) (out : Alg → Nat → Bool) (time : Alg → Nat → Nat) : Machine :=
  ⟨Alg, Nat, fun n => Nat.log2 n + 1, out, time, isPrimeB⟩

def factorOracle : Machine := factorRow Unit (fun _ x => hasFactorLE x.1 x.2) (fun _ _ => 0)
def factorClosed : Machine := factorRow Unit (fun _ x => !(hasFactorLE x.1 x.2)) (fun _ _ => 0)

theorem factor_oracle_escapes : ¬ Sep factorOracle :=
  fun h => h ⟨(), 0, 0, fun _ => ⟨rfl, Nat.zero_le _⟩⟩

theorem factor_closed_separated : Sep factorClosed :=
  sep_of_closure _ (fun _ _ _ => ⟨(4, 2), fun hc => bnot_ne (hasFactorLE 4 2) hc.1⟩)

/-- NO FORMAL-ALONE CHEAT CODE: no escape of the factoring row holds in every algorithm model. -/
theorem no_formal_alone_cheat_code :
    ¬ ∀ (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat),
        ¬ Sep (factorRow Alg out time) :=
  fun h => h Unit (fun _ x => !(hasFactorLE x.1 x.2)) (fun _ _ => 0) factor_closed_separated

/-- NO FORMAL-ALONE BAR: no separation of the factoring row holds in every algorithm model. -/
theorem no_formal_alone_bar :
    ¬ ∀ (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat),
        Sep (factorRow Alg out time) :=
  fun h => factor_oracle_escapes (h Unit (fun _ x => hasFactorLE x.1 x.2) (fun _ _ => 0))

/-- ONE ROW DOES NOT CARRY TO ANOTHER: one machine is separated and another, on the same predicate, is not. -/
theorem separation_does_not_carry : Sep factorClosed ∧ ¬ Sep factorOracle :=
  ⟨factor_closed_separated, factor_oracle_escapes⟩

/-- THE RECORD CANNOT TELL: in every model the records of the primality row and of the factoring row are both
    separated, so no reading of the record tells the row AKS opened from the row still open. -/
theorem record_cannot_tell (A₁ : Type) (o₁ : A₁ → Nat → Bool) (t₁ : A₁ → Nat → Nat)
    (A₂ : Type) (o₂ : A₂ → Nat × Nat → Bool) (t₂ : A₂ → Nat × Nat → Nat) :
    Sep (Rec (primeRow A₁ o₁ t₁)) ∧ Sep (Rec (factorRow A₂ o₂ t₂)) :=
  ⟨record_is_separated (primeRow A₁ o₁ t₁) (4 : Nat),
   record_is_separated (factorRow A₂ o₂ t₂) ((4, 2) : Nat × Nat)⟩

theorem row_checks : isPrimeB 13 = true ∧ isPrimeB 15 = false := ⟨rfl, rfl⟩

end NMK.ROW

/-! # PART VI · THE ONE OPEN, LOCATED EXACTLY -/
namespace NMK.OPEN
open NMK.NF NMK.ROW

/-- On every model the separation of the factoring row is exactly its own transfer. -/
theorem factor_normal_form (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat) :
    (NothingEscapes (Rec (factorRow Alg out time)) → NothingEscapes (factorRow Alg out time)) ↔
      Sep (factorRow Alg out time) :=
  sep_normal_form _ (4, 2)

/-- Every route to the separation of factoring, from any premise, delivers that transfer. -/
theorem factor_every_route (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat)
    (Q : Prop) (h : Q → Sep (factorRow Alg out time)) :
    Q → (NothingEscapes (Rec (factorRow Alg out time)) → NothingEscapes (factorRow Alg out time)) :=
  every_route_passes_the_bit _ (4, 2) Q h

/-- No premise true of the factoring row in every model forces its separation. -/
theorem factor_uniform_forces_nothing (P : Machine → Prop)
    (hP : ∀ Alg out time, P (factorRow Alg out time)) :
    ¬ ∀ Alg out time, P (factorRow Alg out time) → Sep (factorRow Alg out time) :=
  fun h => factor_oracle_escapes (h Unit _ _ (hP Unit (fun _ x => NMK.WITNESS.hasFactorLE x.1 x.2) (fun _ _ => 0)))

/-- The bit is keyed: its transfer holds in one model and fails in the other. -/
theorem factor_bit_is_keyed :
    (NothingEscapes (Rec factorClosed) → NothingEscapes factorClosed) ∧
    ¬ (NothingEscapes (Rec factorOracle) → NothingEscapes factorOracle) :=
  ⟨fun _ => closure_of_sep _ factor_closed_separated,
   fun h => factor_oracle_escapes (sep_of_closure _ (h (record_has_least_escape _ (4, 2))))⟩

/-- NO OUTSIDE FACT CARRIES: a true fact that holds whatever the model of the factoring row, about another
    problem or about anything else, forces the separation of the factoring row in no model uniformly. A reduction
    carries a result only because it is a statement about the factoring row's own algorithms in a model. -/
theorem no_outside_fact_carries (Q : Prop) (hQ : Q) :
    ¬ ∀ (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat),
        Q → Sep (factorRow Alg out time) :=
  fun h => factor_oracle_escapes (h Unit (fun _ x => NMK.WITNESS.hasFactorLE x.1 x.2) (fun _ _ => 0) hQ)

end NMK.OPEN

/-! # THE CAPSTONE -/
namespace NMK
open NMK.NF

/-- THERE IS NO MASTER KEY. Nothing before the colon. (I) a cipher no adversary of any power breaks; (II) a key space
    no guesser of fewer than 2^N tests covers; (III) no constant or polynomial speedup crosses a class; (IV) a
    claimed factor is checked by one division, a factorization by one multiplication, a claimed break is refuted by one instance, and a break is its answers
    alone; (V) no formal-alone cheat code and no formal-alone bar on the factoring row; (VI) the factoring question,
    on every model, is exactly one keyed bit, passed by every route, forced by no uniform premise, and carried by no
    true fact that holds whatever the model. -/
theorem there_is_no_master_key :
    -- I
    (∀ (adv : List Bool → List Bool) (m₁ m₂ ct : List Bool), m₁.length = ct.length → m₂.length = ct.length →
      m₁ ≠ m₂ → adv ct ≠ m₁ ∨ adv ct ≠ m₂) ∧
    (∀ (key msg ct : List Bool), key.length = msg.length → PAD.enc key msg = ct → key = PAD.xorL msg ct) ∧
    -- II
    (∀ (next : List Nat → Nat) (N q : Nat), q < 2 ^ N →
      ¬ ∀ key, key < 2 ^ N → (KEYS.interact next (fun y => Nat.beq y key) q).2 = true) ∧
    -- III
    (∀ {I : Type} (size : I → Nat) (t t' : I → Nat) (a j : Nat),
      (∀ x, t x ≤ a * (size x + 1) ^ j * t' x) → ¬ SPEED.PolyB size t → ¬ SPEED.PolyB size t') ∧
    -- IV
    (∀ N k, WITNESS.hasFactorLE N k = true ↔ ∃ d, d ≤ k ∧ WITNESS.verify N d = true) ∧
    (∀ p q : Nat, 1 < p → 1 < q → WITNESS.verify (p * q) p = true) ∧
    (∀ (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst), ¬ Clean M A c k x → ¬ Escapes M A c k) ∧
    (∀ (M : Machine) (A B : M.Alg) (c k : Nat),
      (∀ x, M.out A x = M.out B x ∧ M.time A x = M.time B x) → (Escapes M A c k ↔ Escapes M B c k)) ∧
    -- V
    (¬ ∀ (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat),
        ¬ Sep (ROW.factorRow Alg out time)) ∧
    (¬ ∀ (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat),
        Sep (ROW.factorRow Alg out time)) ∧
    -- VI
    (∀ (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat),
      (NothingEscapes (Rec (ROW.factorRow Alg out time)) → NothingEscapes (ROW.factorRow Alg out time)) ↔
        Sep (ROW.factorRow Alg out time)) ∧
    (∀ Q : Prop, Q → ¬ ∀ (Alg : Type) (out : Alg → Nat × Nat → Bool) (time : Alg → Nat × Nat → Nat),
        Q → Sep (ROW.factorRow Alg out time)) :=
  ⟨fun adv m₁ m₂ ct h₁ h₂ hne => (PAD.no_adversary_breaks_the_pad adv m₁ m₂ ct h₁ h₂ hne).2.2,
   PAD.one_key_per_message,
   KEYS.no_guesser_shortcuts,
   fun size t t' a j h => SPEED.no_speedup_crosses_a_class size t t' a j h,
   WITNESS.factor_iff_witness,
   WITNESS.product_passes_the_check,
   WITNESS.one_instance_refutes,
   WITNESS.a_break_is_its_answers,
   ROW.no_formal_alone_cheat_code,
   ROW.no_formal_alone_bar,
   OPEN.factor_normal_form,
   OPEN.no_outside_fact_carries⟩

end NMK

#print axioms NMK.PAD.no_adversary_breaks_the_pad
#print axioms NMK.KEYS.no_guesser_shortcuts
#print axioms NMK.SPEED.no_speedup_crosses_a_class
#print axioms NMK.WITNESS.factor_iff_witness
#print axioms NMK.ROW.no_formal_alone_cheat_code
#print axioms NMK.ROW.record_cannot_tell
#print axioms NMK.OPEN.factor_uniform_forces_nothing
#print axioms NMK.OPEN.factor_bit_is_keyed
#print axioms NMK.there_is_no_master_key
```

## Appendix B · Provenance Trail

The theorems of this paper stand on two earlier records of the same line, and both are public. The normal form of Section 2 is in the row of 21 October marked normal form. The pigeonhole bound of Section 4 is in the row of 21 October marked black-box floor. The one-time pad, the adaptive guesser, the speedup theorems, the witness theorems, the factoring row and its located question are in the last row.

**Table B.1 · The provenance of the theorems, 2026**

| Date | Grade | Record | Git commit or Zenodo URL |
|---|---|---|---|
| 24 Mar | Frame, first anchor | *Trisduction, A Geometric Epistemology of Absolute Convergence: three orthogonal axes converging on one proposition* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 21 Oct | Lean, normal form | *PNP_Normal_Form_CC.lean: the machine, the record, the transfer, and every route passing the bit* | <https://github.com/1000sapients/Trisduction/commit/4144323> |
| 21 Oct | Lean, black-box floor | *P ≠ NP Closed to One Bit, Math Journal edition, with its kernel: the pigeonhole floor of test-only search* | <https://github.com/1000sapients/Trisduction/commit/67e477c> |
| 26 Nov | Theorem, identity | *A Theorem-Grade Proof of the Identity of P ≠ NP: The Vacant Seat* | <https://github.com/1000sapients/Trisduction/commit/e383113> |
| 26 Nov | Lean, master | *PNP_Normal_Form_Paper_v1_16_0_CC.lean: the master kernel whose Part A is carried in Appendix A* | <https://github.com/1000sapients/Trisduction/commit/f6afee9> |
| 28 Nov | Theorem, no master key | *This paper, edition 1.0.0: the cipher no algorithm breaks, the key space no guesser shortcuts, no speedup across a class, the witness, no break apart from its machine, the factoring question located* | `not yet deposited` |

Dates are git commit dates in UTC. Each row is listed at the grade its own record carries. The row of 24 March carries the date printed on its page.
