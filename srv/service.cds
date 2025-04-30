using { RiskManagement as my } from '../db/schema.cds';

@path: '/service/riskManagement'
@requires: 'authenticated-user'
service riskManagementSrv {
  @odata.draft.enabled
  entity Risks as projection on my.Risks;
  @odata.draft.enabled
  entity Mitigations as projection on my.Mitigations;
}