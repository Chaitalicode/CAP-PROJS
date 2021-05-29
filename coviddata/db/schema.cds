namespace my.cvd;
using {Currency, managed } from '@sap/cds/common';
entity Covids {
  key ID   : Integer;
  date : String;
  county   : String(111);
  state   : String(111);
  cases    : Integer;
  covidDetails :  Association to  many CovidDetails on covidDetails.ID = $self;
}

entity CovidDetails  {
  key SID   : Integer;
  key ID : Association to Covids;
  date : String;
  county   : String(111);
  state   : String(111);
  cases    : Integer;
  deaths : Integer;
}