using shop as shop from '../db/data-model';
 
service CatalogService {
    @readonly entity Products as projection on shop.Products;
}