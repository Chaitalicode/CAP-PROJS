namespace sap.capire.cvd;
using {Currency, managed } from '@sap/cds/common';

entity Covids {
  key ID   : Integer;
  county   : String(111);
  state   : String(111);
  cases    : Integer;
  confirmedCases : Integer;
  confirmedDeaths : Integer;
  probableCases : Integer;
  probableDeaths : Integer;
}

entity CovidDetails {
  key SID   : Integer;
  key ID  : Integer;
  county   : String(111);
  state   : String(111);
  cases    : Integer;
  confirmedCases : Integer;
  confirmedDeaths : Integer;
  probableCases : Integer;
  probableDeaths : Integer;
}

// entity Orders : managed {
//   key ID   : UUID;
//   OrderNo  : String @title:'Order Number'; //> readable key
//   Items    : Composition of many OrderItems on Items.parent = $self;
// }
// entity OrderItems {
//   key ID   : UUID;
//   parent   : Association to Orders;
//   book     : Association to Books;
//   amount   : Integer;
// }