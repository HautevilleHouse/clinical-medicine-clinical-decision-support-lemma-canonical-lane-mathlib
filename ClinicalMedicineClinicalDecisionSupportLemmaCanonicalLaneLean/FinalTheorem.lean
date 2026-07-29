import ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

def ClinicalDecisionSupportClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem clinical_decision_support_endgame (A : AdmissibleClass) :
    ClinicalDecisionSupportClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse
