import ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

structure AdmissibleClass where
  patient : PatientObject
  endpointProven : Prop
  remainderRecorded : Prop
  gateWitness : endpointProven ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DecisionSupportWitnessClosed A.patient ∧ (A.endpointProven ∨ A.remainderRecorded)

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse
