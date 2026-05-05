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
);


DROP TABLE if EXISTS Region;
CREATE TABLE Region(
    region_nom VARCHAR(20) PRIMARY KEY;
);


DROP TABLE if EXISTS Departement;
CREATE TABLE Departement(
    departement_code VARCHAR(20) PRIMARY KEY,
    departement_nom VARCHAR(20),
    region_nom VARCHAR(20) REFERENCES Region.region_nom;
);


DROP TABLE if EXISTS Commune;
CREATE TABLE Commune(
    commune_nom VARCHAR(20) PRIMARY KEY,
    departement_code VARCHAR(20) REFERENCES Departement.departement_code;
);


Drop TABLE if EXISTS Formation;
CREATE TABLE Formation(
    cod_aff_form VARCHAR(20) PRIMARY KEY,
    filiere_libelle_detaille VARCHAR(20),
    coordonnees_gps VARCHAR(20),
    list_com VARCHAR(20),
    concours_communs_banque_epreuve VARCHAR(20),
    url_formation VARCHAR(20),
    tri VARCHAR(20),
    academie_nom VARCHAR(20) REFERENCES Academie.academie_nom,
    filiere_id INT REFERENCES Filiere.filiere_id,
    etablissement_code_uai VARCHAR(20) REFERENCES Etablissement.etablissement_code_uai,
    commune_nom VARCHAR(20) REFERENCES Commune.commune_nom;
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
