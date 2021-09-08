using shop from '../../db/data-model';
 
annotate shop.Products with @(
    title       : '{i18n>productService}',
    description : '{i18n>productService}'
) {
    ID              @(
        title       : '{i18n>productID}',
        description : '{i18n>productID}',
    );
 
    model         @(
        title            : '{i18n>model}',
        description      : '{i18n>model}'
    );
 
     productgroup         @(
        title            : '{i18n>product}',
        description      : '{i18n>product}',
        Common.FieldControl : #Mandatory,
        Common.Text : productgroup.name,
        ValueList : { ValueListWithFixedValues:true,
            CollectionPath : 'shop.ProductGroups',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'productgroup_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }                
            ]}
   );
 
    status @(
        title               : '{i18n>status}',
        description         : '{i18n>status}',
 
        Common.Text : status.name,
        ValueList : { ValueListWithFixedValues:true,
            CollectionPath : 'shop.Statuses',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'status_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }                
            ]}
    );
 
    sizeuom_msehi @(
        title               : '{i18n>UOM}',
        description         : '{i18n>UOM}',
        Common.FieldControl : #ReadOnly
    )
 
};
 
annotate shop.UOM with {
        msehi    @(
        title            : '{i18n>UOM}',
        description      : '{i18n>UOM}')
};
 
annotate shop.ProductGroups with {
         
        ID @ (
        title            : '{i18n>shopID}',
        description      : '{i18n>shopID}'
    );
          
        name      @(
        title            : '{i18n>product}',
        description      : '{i18n>product}'
    );
       
};
 
 
annotate shop.Statuses with {
         
        ID @ (
        title            : '{i18n>statusID}',
        description      : '{i18n>statusID}'
    );
          
        name      @(
        title            : '{i18n>status}',
        description      : '{i18n>status}'
    );
       
};
 
annotate shop.MarketInfos with {
    ID @ (
        title            : '{i18n>marketID}',
        description      : '{i18n>marketID}'
    );
    name      @(
        title            : '{i18n>marketName}',
        description      : '{i18n>marketName}',
        Common.FieldControl : #ReadOnly
    );
       
};
 
annotate shop.Markets with {
  
     toMarketInfos  @(
        title            : '{i18n>productGroup}',
        description      : '{i18n>productGroup}',
        Common.FieldControl : #Mandatory,
        Common.Text : toMarketInfos.name ,
        ValueList : {
            CollectionPath : 'shop.MarketInfos',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'toMarketInfos_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }                
            ]}
   );
     startDate @(
        title               : '{i18n>startDate}',
        description         : '{i18n>startDate}',
    );
     endDate @(
        title               : '{i18n>endDate}',
        description         : '{i18n>endDate}', 
    );
     totalNetAmount @(
        title               : '{i18n>totalnetamount}',
        description         : '{i18n>totalnetamount}',
        Common.FieldControl : #ReadOnly
    );
     totalGrossAmount@(
        title               : '{i18n>totalGrossAmount}',
        description         : '{i18n>totalGrossAmount}',
        Common.FieldControl : #ReadOnly
    );
 
     totalTaxAmount@(
        title               : '{i18n>totalTaxAmount}',
        description         : '{i18n>totalTaxAmount}',
        Common.FieldControl : #ReadOnly
     );
 
    currency  @(
        title               : '{i18n>currency}',
        description         : '{i18n>currency}',
    );
}
 
annotate shop.Orders with {
 deliveryDate     @(
        title               : '{i18n>deliverydate}',
        description         : '{i18n>deliverydate}',
        Common.FieldControl : #Mandatory
    );
 quantity @(
        title               : '{i18n>quantity}',
        description         : '{i18n>quantity}',
        Common.FieldControl : #Mandatory
    );
 calendarYear  @(
        title               : '{i18n>year}',
        description         : '{i18n>year}',
        Common.FieldControl : #ReadOnly
    );
 netAmount  @(
        title               : '{i18n>netAmount}',
        description         : '{i18n>netAmount}',
        Common.FieldControl : #ReadOnly,
    );
 grossAmount @(
        title               : '{i18n>grossAmount}',
        description         : '{i18n>grossAmount}',
        Common.FieldControl : #ReadOnly
    );
 
 taxAmount  @(
        title               : '{i18n>taxAmount}',
        description         : '{i18n>taxAmount}',
        Common.FieldControl : #ReadOnly
    );
 
 currency  @(
        title               : '{i18n>currency}',
        description         : '{i18n>currency}',
    );
 }