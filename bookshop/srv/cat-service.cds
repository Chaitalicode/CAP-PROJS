using { sap.capire.bookshop as my } from '../db/schema';
service CatalogService @(path:'/browse') {

  entity Books as SELECT from my.Books {*,
    author.name as author
  } excluding {createdBy, modifiedBy }
  actions {
      @sap.applicable.path: 'stock'
      action addSomething();
      function getBooksCount() returns Integer;
  }

  @requires_: 'authenticated-user'
  @insertonly entity Orders as projection on my.Orders;
}

annotate CatalogService.Books with @(
    UI : {
        LineItem  : [
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'CatalogService.addSomething',
                Label : 'START'
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : price,
                Label : 'Price',
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'Stock',
            },
        ],
    }
) ;
