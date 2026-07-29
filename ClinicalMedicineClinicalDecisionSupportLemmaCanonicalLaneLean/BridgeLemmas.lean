import ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DecisionSupportWitnessClosed A.patient

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.patient.conclusion

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse
