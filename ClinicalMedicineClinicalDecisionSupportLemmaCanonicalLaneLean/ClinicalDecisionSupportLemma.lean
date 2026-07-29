import canonicalLaneMathlib.AdmissibleClass
import ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.CompartmentPharmacokinetics
import ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.DiagnosticInference
import ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

structure ClinicalDecisionSupportLemma (C : CompartmentModel) (D : DiagnosticInferenceModel) (H : HazardModel) where
  pkClosed : CompartmentModelClosed C
  diClosed : DiagnosticInferenceClosed D
  haClosed : HazardModelClosed H

theorem clinical_decision_support_lemma_from_evidence (C : CompartmentModel)
    (D : DiagnosticInferenceModel) (H : HazardModel)
    (CE : CompartmentModelEvidence C) (DE : DiagnosticInferenceEvidence D)
    (HE : HazardModelEvidence H) : ClinicalDecisionSupportLemma C D H :=
  {
    pkClosed := compartment_model_closed_from_evidence C CE
    diClosed := diagnostic_inference_closed_from_evidence D DE
    haClosed := hazard_model_closed_from_evidence H HE
  }

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse