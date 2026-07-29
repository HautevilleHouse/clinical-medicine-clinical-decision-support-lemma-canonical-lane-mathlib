import ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.PharmacokineticModels

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

structure CompartmentModel (P : PharmacokineticModelsPackage) where
  numberCompartments : Nat
  transferRates : List ℝ
  eliminationRate : ℝ
  initialConditions : List ℝ
  formulationValid : P.pkModelValid → numberCompartments > 0 → Prop
  solutionExists : Prop

structure CompartmentModelEvidence (P : PharmacokineticModelsPackage) (C : CompartmentModel P) where
  formulationValidClosed : ∀ (h : P.pkModelValid), C.formulationValid h (by omega)
  solutionExistsClosed : C.solutionExists

def CompartmentModelClosed (P : PharmacokineticModelsPackage) (C : CompartmentModel P) : Prop :=
  (∀ (h : P.pkModelValid), C.formulationValid h (by omega)) ∧ C.solutionExists

theorem compartment_model_closed_from_evidence (P : PharmacokineticModelsPackage) (C : CompartmentModel P) (E : CompartmentModelEvidence P C) : CompartmentModelClosed P C := by
  exact And.intro E.formulationValidClosed E.solutionExistsClosed

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse
