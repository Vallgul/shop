namespace shop;

entity Products {
  key ID        : Integer;
  model         : String(15);
  price         : Decimal(15, 2);
  taxrate       : Integer;
  height        : Decimal(13, 3);
  depth         : Decimal(13, 3);
  width         : Decimal(13, 3);
 }