using { riskManagementSrv } from '../srv/service.cds';

annotate riskManagementSrv.Risks with @UI.HeaderInfo: { TypeName: 'Risk', TypeNamePlural: 'Risks' };
annotate riskManagementSrv.Risks with {
  mitigation @Common.ValueList: {
    CollectionPath: 'Mitigations',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: mitigation_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
    ],
  }
};
annotate riskManagementSrv.Risks with {
  impact @title: 'Impact';
  criticality @title: 'Criticality'
};

annotate riskManagementSrv.Risks with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: impact },
 { $Type: 'UI.DataField', Value: criticality },
    { $Type: 'UI.DataField', Label: 'Mitigation', Value: mitigation_ID }
];

annotate riskManagementSrv.Risks with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: impact },
 { $Type: 'UI.DataField', Value: criticality },
    { $Type: 'UI.DataField', Label: 'Mitigation', Value: mitigation_ID }
  ]
};

annotate riskManagementSrv.Risks with {
  mitigation @Common.Label: 'Mitigation'
};

annotate riskManagementSrv.Risks with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate riskManagementSrv.Risks with @UI.SelectionFields: [
  mitigation_ID
];

annotate riskManagementSrv.Mitigations with @UI.HeaderInfo: { TypeName: 'Mitigation', TypeNamePlural: 'Mitigations' };
annotate riskManagementSrv.Mitigations with {
  description @title: 'Description'
};

annotate riskManagementSrv.Mitigations with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: description }
];

annotate riskManagementSrv.Mitigations with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: description }
  ]
};

annotate riskManagementSrv.Mitigations with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

