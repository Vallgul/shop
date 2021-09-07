using from './cat-service';
 
annotate CatalogService.Products with @(
    UI: {
 SelectionFields: [model],
 Identification  : [  {Value: model}
     ],
 LineItem: [
     { $Type : 'UI.DataField', Value: ID, ![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: model, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: price, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: taxrate, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: height, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: width, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: depth, ![@UI.Importance]: #High }
 ],
 PresentationVariant : {SortOrder : [
       
        {   $Type      : 'Common.SortOrderType', Property   : ID, Descending : false },
        {   $Type      : 'Common.SortOrderType', Property   : model, Descending : false }
        ]},
    },
  UI        : {
        HeaderInfo : {
            TypeName       : 'Product',
            TypeNamePlural : 'Products',
            Title          : {Value : model},
        },
        HeaderFacets : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }],
        FieldGroup #Description        : {Data : [
        {   $Type : 'UI.DataField', Value : ID },   
        {   $Type : 'UI.DataField', Value : model },
         ]},
         FieldGroup #Details : {Data : [
        {   $Type : 'UI.DataField', Value : price},
        {   $Type : 'UI.DataField', Value : taxrate }
        ]},
        FieldGroup #Details3 : {Data : [
        {   $Type : 'UI.DataField', Value : depth },
        {   $Type : 'UI.DataField', Value : width },
        {   $Type : 'UI.DataField', Value : height }
        ]}
    },
     UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails',
        Label  : '{i18n>productinfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>priceinfo}',
            Target : '@UI.FieldGroup#Details'
        },
         {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>dimentionsinfo}',
            Target : '@UI.FieldGroup#Details3'
        },
        ]
    }
    ]
  
);
  
annotate CatalogService.Products with {
    ID @title: '{i18n>ID}';
    model @title: '{i18n>model}';
    price @title: '{i18n>price}';
    taxrate @title: '{i18n>taxrate}';
    height @title: '{i18n>height}';
    width @title: '{i18n>width}';
    depth @title: '{i18n>depth}';
};