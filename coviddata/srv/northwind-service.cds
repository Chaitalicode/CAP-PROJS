using { Northwind as external } from './external/Northwind.csn';
service MyNorthwindService {

    @readonly
    entity Products as projection on external.Products;
}