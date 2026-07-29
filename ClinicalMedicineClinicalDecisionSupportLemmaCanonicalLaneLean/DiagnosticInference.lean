import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

structure DiagnosticInferenceModel where
  sensitivity : ℝ
  specificity : ℝ
  priorProb : ℝ
  posteriorProb : ℝ

structure DiagnosticInferenceEvidence (D : DiagnosticInferenceModel) where
  sensitivityClosed : D.sensitivity > 0 ∧ D.sensitivity ≤ 1
  specificityClosed : D.specificity > 0 ∧ D.specificity ≤ 1
  priorProbClosed : D.priorProb > 0 ∧ D.priorProb < 1
  posteriorProbClosed : D.posteriorProb = (D.sensitivity * D.priorProb) /
    (D.sensitivity * D.priorProb + (1 - D.specificity) * (1 - D.priorProb))

def DiagnosticInferenceClosed (D : DiagnosticInferenceModel) : Prop :=
  D.sensitivity > 0 ∧ D.sensitivity ≤ 1 ∧
  D.specificity > 0 ∧ D.specificity ≤ 1 ∧
  D.priorProb > 0 ∧ D.priorProb < 1 ∧
  D.posteriorProb = (D.sensitivity * D.priorProb) /
    (D.sensitivity * D.priorProb + (1 - D.specificity) * (1 - D.priorProb))

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferenceModel)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D :=
  And.intro E.sensitivityClosed (And.intro E.specificityClosed
    (And.intro E.priorProbClosed E.posteriorProbClosed))

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse