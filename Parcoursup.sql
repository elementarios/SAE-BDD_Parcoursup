--Initilialisation du schéma
Drop schema if exists parcoursup Cascade;
create schema parcoursup;
set schema 'parcoursup';



------Tables
drop Table if EXISTS Academie;
CREATE TABLE Academie(
    academie_nom VARCHAR(20) PRIMARY KEY;
);
---



-- Wbimport à utiliser à la fin--

/*
Wbimport
-mode=insert
-file='fr-esr-parcoursup_2022.csv'
-header=false
-table=emp
-schema='distribill1'
-fileColumns=matr,nome,sal,poste,dateemb,comm,nodept
-dateFormat='yyyy-MM-dd';
*/
