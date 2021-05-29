using { sap.capire.cvd as my } from '../db/schema';
service CovidService{
  entity Covids as projection on my.Covids;
  entity CovidDetails as projection on my.CovidDetails;
}