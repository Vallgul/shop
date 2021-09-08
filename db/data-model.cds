namespace shop;
 
using { cuid, managed } from '@sap/cds/common';
using { masterdata } from './master-data';
using devcommon from './dev-common';
 
entity Products: managed, cuid, devcommon.Accounting {
  model         : String(15);
  status        : Association to one masterdata.Statuses;
  height        : Decimal(13, 3);
  depth         : Decimal(13, 3);
  width         : Decimal(13, 3);
  sizeuom       : Association to one masterdata.UOM;
  productgroup  : Association to one masterdata.ProductGroups;
  @cascade : {all}
  market   : Composition of many Markets on market.toProduct = $self; 
}
 
entity Markets: managed, cuid, devcommon.Accounting {
      toMarketInfos    : Association to masterdata.MarketInfos;
      toProduct        : Association to Products;
      startDate        : Date;
      endDate          : Date;
      @cascade : {all}
      order   : Composition of many Orders on order.toMarket = $self;
}
 
entity Orders: managed, cuid, devcommon.Accounting {
    toMarket: Association to Markets;
    quantity         : Integer;
    calendarYear     : String;
    deliveryDate     : Date;
}