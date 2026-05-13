set schema 'parcoursup';

Drop table if exists stockage;
create table stockage(
  Session int ,
  Statut_etablissement Varchar(50),
  Code_UAI_etablissement Varchar(20),
  etablissement_libelle Varchar(50),
  etablissement_code_dept Varchar(20),
  dept_nom Varchar(20),
  
