import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean

structure HazardModel where
  baselineHazard : Type
  covariates : Type
  effectSizes : Type
  proportionalHazardsAssumption : Prop

structure HazardModelEvidence (H : HazardModel) where
  baselineHazardClosed : True
  covariatesClosed : True
  effectSizesClosed : True
  proportionalHazardsAssumptionClosed : H.proportionalHazardsAssumption

def HazardModelClosed (H : HazardModel) : Prop :=
  H.proportionalHazardsAssumption

theorem hazard_model_closed_from_evidence (H : HazardModel)
    (E : HazardModelEvidence H) : HazardModelClosed H :=
  E.proportionalHazardsAssumptionClosed

end ClinicalMedicineClinicalDecisionSupportLemmaCanonicalLaneLean
end HautevilleHouse