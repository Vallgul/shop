using from './cat-service';
annotate CatalogService.Products with @odata.draft.enabled;
 
annotate CatalogService.Products with @(
    UI: {
 SelectionFields: [productgroup_ID],
 Identification  : [ {Value: ID} ],
 LineItem: [
     { $Type : 'UI.DataField', Value : productgroup.imageURL, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: productgroup_ID, ![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: model, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: status_ID, Criticality: status.criticality, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: price, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: taxrate, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: height, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: width, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: depth, ![@UI.Importance]: #High }
 ],
 PresentationVariant : {SortOrder : [   
        {   $Type      : 'Common.SortOrderType', Property   : productgroup.name, Descending : false },
        {   $Type      : 'Common.SortOrderType', Property   : model, Descending : false }
        ]},
    },
  UI        : {
        HeaderInfo : {
            TypeName       : 'Product',
            TypeNamePlural : 'Products',
            Title          : {Value : productgroup_ID},
        },
        HeaderFacets : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }],
        FieldGroup #Description        : {Data : [
        {   $Type : 'UI.DataField', Value : productgroup_ID },   
        {   $Type : 'UI.DataField', Value : productgroup.imageURL },
        {   $Type : 'UI.DataField', Value : model },
         ]},
         FieldGroup #Details : {Data : [
        {   $Type : 'UI.DataField', Value : price},
        {   $Type : 'UI.DataField', Value : taxrate }
        ]},
        FieldGroup #Details2 : {Data : [
        {   $Type : 'UI.DataField', Value : status_ID, Criticality: status.criticality },
        ]},
        FieldGroup #Details3 : {Data : [
        {   $Type : 'UI.DataField', Value : depth },
        {   $Type : 'UI.DataField', Value : width },
        {   $Type : 'UI.DataField', Value : height },
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {  $Type : 'UI.DataField',  Value : createdBy },
        {  $Type : 'UI.DataField',  Value : createdAt },
        {  $Type : 'UI.DataField',  Value : modifiedBy },
        {  $Type : 'UI.DataField',  Value : modifiedAt }
        ]}
    },
     UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails',
        Label  : '{i18n>productInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>priceInfo}',
            Target : '@UI.FieldGroup#Details'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>productionInfo}',
            Target : '@UI.FieldGroup#Details2'
        },
         {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>dimentionsInfo}',
            Target : '@UI.FieldGroup#Details3'
        },
        ]
    },
      {
        $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo',
        Label  : '{i18n>adminInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>adminInfo}',
            Target : '@UI.FieldGroup#AdministrativeData'
        }
        ]
    },
     {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>marketsInfo}',
        Target : 'market/@UI.LineItem'
    }
    ]
  
);
 
 
annotate CatalogService.Markets with @ (
 UI: {
 Identification: [{Value: toMarketInfos_ID }],
 SelectionFields: [toMarketInfos_ID],
 LineItem: [
     { $Type : 'UI.DataField', Value: toMarketInfos.imageURL, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: toMarketInfos_ID, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: startDate, ![@UI.Importance]: #High }, 
     { $Type : 'UI.DataField', Value: endDate, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: totalNetAmount, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: totalGrossAmount, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: totalTaxAmount, ![@UI.Importance]: #High } 
 ],
 HeaderInfo : { TypeName: 'Market', TypeNamePlural : 'Markets', Title : {Value : toMarketInfos_ID} },
 HeaderFacets : [{ $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Description', ![@UI.Importance] : #Medium }],
        FieldGroup #Description        : {Data : [
        {   $Type : 'UI.DataField', Value : toMarketInfos_ID },
        {   $Type : 'UI.DataField', Value : toMarketInfos.imageURL },
        ]},
        FieldGroup #Details : {Data : [
        {   $Type : 'UI.DataField', Value : startDate },
        {   $Type : 'UI.DataField', Value : endDate, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : totalNetAmount, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : totalGrossAmount, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : totalTaxAmount, ![@UI.Importance] : #Medium }
        ]}
    },
     UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails2',
        Label  : '{i18n>marketInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>marketInfo}',
            Target : '@UI.FieldGroup#Description'
        }
        ]
    },
      {
        $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo2',
        Label  : '{i18n>marketDetails}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>marketDetails}',
            Target : '@UI.FieldGroup#Details'
        }        ]
    },
     {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>ordersInfo}',
        Target : 'order/@UI.LineItem'
    }
    ]
);
 
annotate CatalogService.Orders with @ (
 UI: {
 Identification: [{Value: deliveryDate}],
 SelectionFields: [deliveryDate],
 LineItem: [
     { $Type : 'UI.DataField', Value: deliveryDate, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: quantity,![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: calendarYear, ![@UI.Importance]: #High }, 
     { $Type : 'UI.DataField', Value: netAmount, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: grossAmount, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: taxAmount, ![@UI.Importance]: #High },
 ],
 HeaderInfo : { TypeName: 'Order', TypeNamePlural: 'Orders', Title: {Value : deliveryDate},},
 HeaderFacets : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }
        ],
        FieldGroup #Description: {Data : [
        { $Type : 'UI.DataField', Value : deliveryDate },
        { $Type : 'UI.DataField', Value : quantity },
        { $Type : 'UI.DataField', Value : calendarYear }       
        ]},
        FieldGroup #Details : {Data : [
        {   $Type : 'UI.DataField', Value : netAmount, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : grossAmount, ![@UI.Importance] : #Medium },
        {   $Type : 'UI.DataField', Value : taxAmount, ![@UI.Importance] : #Medium },
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {  $Type : 'UI.DataField', Value : createdBy },
        {  $Type : 'UI.DataField', Value : createdAt },
        {  $Type : 'UI.DataField', Value : modifiedBy },
        {  $Type : 'UI.DataField', Value : modifiedAt }]}},
UI.Facets : [
    {   $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails3',
        Label  : '{i18n>orderInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>orderInfo}',
            Target : '@UI.FieldGroup#Description'
        }]
    },
      { $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo3',
        Label  : '{i18n>adminInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>adminInfo}',
            Target : '@UI.FieldGroup#AdministrativeData'
        }]
    }
    ]
);
  
annotate CatalogService.Products with {
    ID @title: '{i18n>productID}';
    title @title: '{i18n>title}';
    model @title: '{i18n>model}';
    price @title: '{i18n>price}' @Measures.ISOCurrency: currency_code;
    taxrate @title: '{i18n>taxRate}';
    height @title: '{i18n>height}' @Measures.Unit : sizeuom_msehi;
    width @title: '{i18n>width}' @Measures.Unit : sizeuom_msehi;
    depth @title: '{i18n>depth}' @Measures.Unit : sizeuom_msehi;
    currency_code @title: '{i18n>currency}';
    productgroup @title: '{i18n>product}';
};
 
annotate CatalogService.Markets with {
    startDate @title: '{i18n>startDate}';
    endDate @title: '{i18n>endDate}';
    totalNetAmount @title: '{i18n>totalNetAmount}' @Measures.ISOCurrency: currency_code;
    totalGrossAmount @title: '{i18n>totalGrossAmount}' @Measures.ISOCurrency: currency_code;
    totalTaxAmount @title: '{i18n>totalTaxAmount}' @Measures.ISOCurrency: currency_code;
    currency_code @title: '{i18n>currency}';
    toMarketInfos @title: '{i18n>market}'
};
 
annotate CatalogService.Orders with {
    deliveryDate @title: '{i18n>deliveryDate}';
    calendarYear @title: '{i18n>year}';
    quantity @title : '{i18n>quantity}';
    netAmount @title: '{i18n>netAmount}' @Measures.ISOCurrency: currency_code;
    grossAmount @title: '{i18n>grossAmount}' @Measures.ISOCurrency: currency_code;
    taxAmount @title: '{i18n>taxAmount}' @Measures.ISOCurrency: currency_code;
    currency_code @title: '{i18n>currency}';
};