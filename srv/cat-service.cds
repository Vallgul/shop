using shop as shop from '../db/data-model';
using sap.common as common from '@sap/cds/common';
using masterdata as masterdata from '../db/master-data';
 
service CatalogService {
    @odata.draft.enabled
    @Capabilities : { Deletable:true, Insertable:true}
    entity Products as projection on shop.Products;
    @Capabilities : { Deletable:true, Insertable:true}
    entity Markets as projection on shop.Markets;
    @Capabilities : { Deletable:true, Insertable:true}
    entity Orders as projection on shop.Orders;
    @cds.autoexpose entity ProductGroups as projection on masterdata.ProductGroups;
    @cds.autoexpose entity UOM as projection on masterdata.UOM;
    @cds.autoexpose entity MarketMDs as projection on masterdata.MarketInfos;
    @cds.autoexpose entity Statuses as projection on masterdata.Statuses;
    entity Currencies as projection on common.Currencies;
}