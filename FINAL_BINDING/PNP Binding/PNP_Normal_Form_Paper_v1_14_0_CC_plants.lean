
/-! HOSTILE BUILD. Six plants, each a claim the kernel must refuse. A plant that compiles is a defect of the master. -/
-- Plant 1: a pin that calls a classical cone axiom-free.
/-- info: 'PNP.SEAT.the_seat_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SEAT.the_seat_delivers
-- Plant 2: the Seat as the Millennium sentence with the hardness half dropped.
example : PNP.SEAT.TheSeat ↔ PNP.TM.P_ne_NP := PNP.SEAT.the_seat_iff_p_ne_np
-- Plant 3: the Seat inhabited by the identity.
example : PNP.SEAT.TheSeat := PNP.SEAT.one_seat.mpr (fun h => h)
-- Plant 4: P ≠ NP from an empty Seat.
example : PNP.TM.P_ne_NP := PNP.SEAT.the_seat_delivers ⟨⟩
-- Plant 5: the transfer as a law of every machine.
example : ∀ M : PNP.NORMALFORM.Machine, PNP.CLOSURE.Transfer M := fun _ h => h
-- Plant 6: the collapse from a refutation with the hardness half dropped.
example (pEqNP : ¬ PNP.TM.P_ne_NP) : PNP.TM.SATinP := (PNP.SEAT.every_refutation_is_subsumed pEqNP).2.2
