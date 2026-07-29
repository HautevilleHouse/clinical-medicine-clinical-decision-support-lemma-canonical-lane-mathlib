import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

structure DecisionRulePackage where
  inputVariables : Type u
  decisionThreshold : Prop
  actionRule : Prop
  outcomeProjection : Prop
  clinicalValidityDerived : Prop

structure DecisionRuleEvidence (D : DecisionRulePackage) where
  inputVariablesClosed : D.inputVariables
  decisionThresholdClosed : D.decisionThreshold
  actionRuleClosed : D.actionRule
  outcomeProjectionClosed : D.outcomeProjection
  clinicalValidityDerivedClosed : D.clinicalValidityDerived

def DecisionRuleClosed (D : DecisionRulePackage) : Prop :=
  D.inputVariables ∧ D.decisionThreshold ∧ D.actionRule ∧ D.outcomeProjection ∧ D.clinicalValidityDerived

theorem decision_rule_closed_from_evidence (D : DecisionRulePackage) (E : DecisionRuleEvidence D) : DecisionRuleClosed D := by
  exact And.intro E.inputVariablesClosed (And.intro E.decisionThresholdClosed (And.intro E.actionRuleClosed (And.intro E.outcomeProjectionClosed E.clinicalValidityDerivedClosed)))

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse