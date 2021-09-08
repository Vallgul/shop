namespace masterdata;
using {shop} from './data-model';
 
 
entity UOM {
    key msehi      : String(3);
        dimid      : String(6);
        isocode    : String(3);
}
 
entity ProductGroups {
    key ID     : Integer;
    name       : String(20);
    imageURL   : String @UI.IsImageURL;
    imageType  : String @Core.IsMediaType;
}
 
entity Statuses {
    key ID     : Integer;
    name       : String(20);
    criticality: Integer;
}
 
entity MarketInfos {
    key ID     : Integer;
    name       : String(50);
    code       : String(2);
    imageURL   : String @UI.IsImageURL;
    imageType  : String @Core.IsMediaType;
}