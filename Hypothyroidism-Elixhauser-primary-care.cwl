cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  postablative-hypothyroidism-elixhauser-primary-care---primary:
    run: postablative-hypothyroidism-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  hypothyroidism-elixhauser-primary-care---primary:
    run: hypothyroidism-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: postablative-hypothyroidism-elixhauser-primary-care---primary/output
  congenital-hypothyroidism-elixhauser-primary-care---primary:
    run: congenital-hypothyroidism-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care---primary/output
  hypothyroidism-elixhauser-primary-care-myxoedema---primary:
    run: hypothyroidism-elixhauser-primary-care-myxoedema---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: congenital-hypothyroidism-elixhauser-primary-care---primary/output
  hypothyroidism-elixhauser-primary-care-insufficiency---primary:
    run: hypothyroidism-elixhauser-primary-care-insufficiency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-myxoedema---primary/output
  hypothyroidism-elixhauser-primary-care-monitoring---primary:
    run: hypothyroidism-elixhauser-primary-care-monitoring---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-insufficiency---primary/output
  subclinical-hypothyroidism-elixhauser-primary-care---primary:
    run: subclinical-hypothyroidism-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-monitoring---primary/output
  hypothyroidism-elixhauser-primary-care-letter---primary:
    run: hypothyroidism-elixhauser-primary-care-letter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: subclinical-hypothyroidism-elixhauser-primary-care---primary/output
  hypothyroidism-elixhauser-primary-care-acquired---primary:
    run: hypothyroidism-elixhauser-primary-care-acquired---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-letter---primary/output
  hypothyroidism---primary:
    run: hypothyroidism---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-acquired---primary/output
  other-hypothyroidism-elixhauser-primary-care---primary:
    run: other-hypothyroidism-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: hypothyroidism---primary/output
  hypothyroidism-elixhauser-primary-care-resulting---primary:
    run: hypothyroidism-elixhauser-primary-care-resulting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: other-hypothyroidism-elixhauser-primary-care---primary/output
  hypothyroidism-elixhauser-primary-care-cretinism---primary:
    run: hypothyroidism-elixhauser-primary-care-cretinism---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-resulting---primary/output
  iatrogenic-hypothyroidism-elixhauser-primary-care---primary:
    run: iatrogenic-hypothyroidism-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-cretinism---primary/output
  hypothyroidism-elixhauser-primary-care-goitre---primary:
    run: hypothyroidism-elixhauser-primary-care-goitre---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: iatrogenic-hypothyroidism-elixhauser-primary-care---primary/output
  hypothyroidism-elixhauser-primary-care-pendred's---primary:
    run: hypothyroidism-elixhauser-primary-care-pendred's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-goitre---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: hypothyroidism-elixhauser-primary-care-pendred's---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
