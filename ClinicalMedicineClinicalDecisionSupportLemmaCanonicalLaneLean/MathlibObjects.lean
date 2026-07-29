import ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ClinicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ClinicalAdmittedObject where
  space : ClinicalSpace
  clinicalOutcome : Prop
  diagnosticInference : Prop
  decisionModel : Type
  decisionTopology : TopologicalSpace decisionModel
  validatedClinicalDecision : Prop
  conclusion : validatedClinicalDecision

structure ClinicalEndgameState where
  object : ClinicalAdmittedObject

def ClinicalWitnessClosed (O : ClinicalAdmittedObject) : Prop :=
  O.validatedClinicalDecision

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse
