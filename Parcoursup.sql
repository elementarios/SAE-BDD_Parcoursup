--Initilialisation du schéma
Drop schema if exists parcoursup Cascade;
create schema parcoursup;
set schema 'parcoursup';



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