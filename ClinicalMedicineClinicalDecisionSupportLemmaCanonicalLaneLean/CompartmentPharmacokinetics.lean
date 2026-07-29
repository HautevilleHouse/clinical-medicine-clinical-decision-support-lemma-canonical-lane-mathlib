import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  rateConstants : Type
  initialCondition : Type
  analyticalSolution : Type

structure CompartmentModelEvidence (M : CompartmentModel) where
  compartmentsClosed : M.compartments ≥ 1
  rateConstantsClosed : True
  initialConditionClosed : True
  analyticalSolutionClosed : True

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.compartments ≥ 1

theorem compartment_model_closed_from_evidence (M : CompartmentModel)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M :=
  E.compartmentsClosed

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse