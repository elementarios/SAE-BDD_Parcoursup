--Initilialisation du schéma
Drop schema if exists parcoursup Cascade;
create schema parcoursup;
set schema 'parcoursup';



------Tables
drop Table if EXISTS Academie;
CREATE TABLE Academie(
    academie_nom VARCHAR(20) PRIMARY KEY;
);


drop TABLE if EXISTS Etablissement;
CREATE TABLE Etablissement(
    etablissement_code_uai VARCHAR(20) PRIMARY KEY,
    etablissement_nom VARCHAR(20) NOT NULL,
    etablissement_statut VARCHAR(50) Not NULL;
);


drop TABLE if EXISTS Filiere;
CREATE TABLE Filiere(
    filiere_id INT PRIMARY KEY,
    filiere_libelle VARCHAR(20) NOT NULL,
    filiere_libelle_tres_abrege VARCHAR(20) NOT NULL,
    filiere_libelle_abrege VARCHAR(20) not NULL,
    filiere_libelle_detaille_bis VARCHAR(20) NOT NULL;
)
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
