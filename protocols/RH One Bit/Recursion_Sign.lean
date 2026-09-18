namespace R
def Closes (P : Prop) : Prop := ¬P → P
theorem closes_iff (P : Prop) : Closes P ↔ P :=
  ⟨fun h => Classical.byContradiction (fun n => n (h n)), fun p _ => p⟩
/-- The recursion stands for P exactly when P, and stands for ¬P exactly when ¬P: it carries no sign. -/
theorem recursion_is_sign_blind (P : Prop) : (Closes P ↔ P) ∧ (Closes (¬P) ↔ ¬P) := ⟨closes_iff P, closes_iff (¬P)⟩
/-- Exactly one of the two recursions stands, and which one is the bit. -/
theorem exactly_one_stands (P : Prop) : (Closes P ∨ Closes (¬P)) ∧ ¬ (Closes P ∧ Closes (¬P)) :=
  ⟨Classical.byCases (fun p : P => Or.inl (fun _ => p)) (fun n => Or.inr (fun _ => n)),
   fun ⟨a, b⟩ => (closes_iff (¬P)).mp b ((closes_iff P).mp a)⟩
end R
#print axioms R.recursion_is_sign_blind
#print axioms R.exactly_one_stands
