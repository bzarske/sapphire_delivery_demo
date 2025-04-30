using riskManagementSrv as service from '../../srv/service';
using from '../annotations';

annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : impact,
            Criticality : criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Mitigation',
            Value : mitigation_ID,
        },
    ]
);

