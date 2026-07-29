import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

structure PharmacokineticModel (C : CompartmentModel) where
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeDistribution : ℝ
  concentrationCurve : ℝ → ℝ
  concentrationPositive : Prop
  concentrationPositiveTerm : concentrationPositive
  absorptionEliminationAdmissible : Prop
  absorptionEliminationAdmissibleTerm : absorptionEliminationAdmissible

structure PharmacokineticEvidence {C : CompartmentModel} (P : PharmacokineticModel C) where
  concentrationPositiveClosed : P.concentrationPositive
  absorptionEliminationAdmissibleClosed : P.absorptionEliminationAdmissible
  concentrationDerived : P.concentrationCurve = λ t => P.absorptionRate / (P.volumeDistribution * (P.eliminationRate - P.absorptionRate)) * (Real.exp (-P.absorptionRate * t) - Real.exp (-P.eliminationRate * t))

def PharmacokineticClosed {C : CompartmentModel} (P : PharmacokineticModel C) : Prop :=
  P.concentrationPositive ∧ P.absorptionEliminationAdmissible ∧
  P.concentrationCurve = λ t => P.absorptionRate / (P.volumeDistribution * (P.eliminationRate - P.absorptionRate)) * (Real.exp (-P.absorptionRate * t) - Real.exp (-P.eliminationRate * t))

theorem pharmacokinetic_closed_from_evidence {C : CompartmentModel} (P : PharmacokineticModel C) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.concentrationPositiveClosed (And.intro E.absorptionEliminationAdmissibleClosed E.concentrationDerived)

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse