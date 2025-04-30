namespace RiskManagement;
using { cuid } from '@sap/cds/common';

entity Risks : cuid {
  impact: Integer;
  criticality: Integer;
  mitigation: Association to Mitigations;
}

entity Mitigations : cuid {
  description: String(500);
}

