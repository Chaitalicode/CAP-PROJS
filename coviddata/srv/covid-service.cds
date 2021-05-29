using my.cvd as my from '../db/schema';
service CovidService {
entity Covids as projection on my.Covids;
entity CovidDetails as projection on my.CovidDetails;
}
annotate CovidService.Covids with @(
    UI : {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Covid',
            TypeNamePlural : 'Covids',
            Title : {
                $Type : 'UI.DataField',
                Value :ID ,
                Label : 'ID'
            },
            Description : {
                $Type : 'UI.DataField',
                Value : state,
                Label : 'State'
            },
        },
        SelectionFields  : [ID, county, date,state,cases],
        LineItem  : [
            {$Type : 'UI.DataField',Value : ID, Label : 'ID'},
            {$Type : 'UI.DataField',Value : county, Label : 'County'},
            {$Type : 'UI.DataField',Value : date, Label : 'Date'},
            {$Type : 'UI.DataField',Value : cases, Label : 'Cases'}
        ],
        HeaderFacets  : [
            {
                $Type : 'UI.CollectionFacet',
                Facets : [
                    {
                        $Type : 'UI.ReferenceFacet',
                        Target : '@UI.FieldGroup#IdCases',
                    }
                ],
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#StateCounty',
            },
        ],
        FieldGroup #IdCases : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {$Type : 'UI.DataField',Value : ID,Label : 'ID'},
                {$Type : 'UI.DataField',Value : cases,Label : 'Cases'},
            ],
            Label : 'ID & Cases'
        },
        FieldGroup #StateCounty : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {$Type : 'UI.DataField',Value : state,Label : 'State'},
                {$Type : 'UI.DataField',Value : county,Label : 'County'},
            ],
            Label : 'State & County'
        },
       Facets  : [
           {
               $Type : 'UI.CollectionFacet',
               Label : 'Mains',
               Facets : [
                   {
                       $Type : 'UI.ReferenceFacet',
                       Target : 'covidDetails/@UI.LineItem#cvddetailTable',
                       Label : 'Covid Details Table'
                   },
               ],
           },
       ],
        
    }
);

annotate CovidService.CovidDetails with @(
    UI : {
        LineItem #cvddetailTable: [
            {$Type : 'UI.DataField',Value : SID, Label : 'SID'},
            {$Type : 'UI.DataField',Value : ID_ID, Label : 'ID'},
            {$Type : 'UI.DataField',Value : date, Label : 'Date'},
            {$Type : 'UI.DataField',Value : county, Label : 'County'},
            {$Type : 'UI.DataField',Value : state, Label : 'State'}
        ],
    }
);