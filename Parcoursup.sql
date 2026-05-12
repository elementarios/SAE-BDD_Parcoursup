--Initilialisation du schéma
Drop schema if exists parcoursup Cascade;
create schema parcoursup;
set schema 'parcoursup';



------Tables
drop Table if EXISTS _academie;
CREATE TABLE _academie(
    academie_nom VARCHAR(20) PRIMARY KEY;
);


drop TABLE if EXISTS _etablissement;
CREATE TABLE _etablissement(
    etablissement_code_uai VARCHAR(20) PRIMARY KEY,
    etablissement_nom VARCHAR(20) NOT NULL,
    etablissement_statut VARCHAR(50) Not NULL;
);


drop TABLE if EXISTS _filiere;
CREATE TABLE _filiere(
    filiere_id INT PRIMARY KEY,
    filiere_libelle VARCHAR(20) NOT NULL,
    filiere_libelle_tres_abrege VARCHAR(20) NOT NULL,
    filiere_libelle_abrege VARCHAR(20) not NULL,
    filiere_libelle_detaille_bis VARCHAR(20) NOT NULL;
);


DROP TABLE if EXISTS _region;
CREATE TABLE _region(
    region_nom VARCHAR(20) PRIMARY KEY;
);


DROP TABLE if EXISTS _departement;
CREATE TABLE _departement(
    departement_code VARCHAR(20) PRIMARY KEY,
    departement_nom VARCHAR(20),
    region_nom VARCHAR(20) REFERENCES Region.region_nom;
);


DROP TABLE if EXISTS _commune;
CREATE TABLE _commune(
    commune_nom VARCHAR(20) PRIMARY KEY,
    departement_code VARCHAR(20) REFERENCES Departement.departement_code;
);


Drop TABLE if EXISTS _formation;
CREATE TABLE _formation(
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

drop table if exists _session;
CREATE TABLE _session{
    session_annee INT,
    primary key(session_annee)
};
drop table if exists _regroupement;
CREATE TABLE _regroupement{
    libelle_regroupement VARCHAR(20) NOT NULL,
    primary key(libelle_regroupement)
};
drop table if exists _type_bac;
CREATE TABLE _type_bac{
    type_bac VARCHAR(20) NOT NULL,
    primary key(type_bac)
};
drop table if exists _mention_bac;
CREATE TABLE _mention_bac{
    libelle_mention VARCHAR(20) NOT NULL,
    primary key(libelle_mention)
};

drop table if exists admissions_generalites;
create table admissions_generalites{
    selectivite VARCHAR(20) NOT NULL,
    capacite INT,
    effectif_total_candidats INT,
    effectif_total_candidates INT,
    cod_aff_form VARCHARv NOT NULL REFERENCES Formation(cod_aff_form),
    session_annee INT REFERENCES Session(session_annee),
    primary key(cod_aff_form, session_annee)
};-- comen hair

drop table if exists admissions_selon_type_neo_bac;
create table admissions_selon_type_neo_bac{
    effectif_candidat_neo_bac_classes INT,
    cod_aff_form VARCHAR(20) NOT NULL REFERENCES Formation(cod_aff_form),
    session_annee INT REFERENCES Session(session_annee),
    type_bac VARCHAR(20) NOT NULL REFERENCES Type_bac(type_bac),
    primary key(cod_aff_form, session_annee, type_bac)
};

drop table if exists rang_dernier_appele_selon_regroupement;
create table rang_dernier_appele_selon_regroupement{
    rang_dernier_appele INT;
    cod_aff_form VARCHAR(20) NOT NULL REFERENCES Formation(cod_aff_form),
    libelle_regroupement VARCHARv NOT NULL REFERENCES Regroupement(libelle_regroupement),
    session_annee INT REFERENCES Session(session_annee),
    primary key(cod_aff_form, libelle_regroupement, session_annee)
};

drop table if exists effectif_selon_mention;
create table effectif_selon_mention{
    effectif_admis_neo_bac_selon_mention INT,
    cod_aff_form VARCHAR(20) NOT NULL REFERENCES Formation(cod_aff_form),
    libelle_mention VARCHAR(20) NOT NULL REFERENCES Mention_bac(libelle_mention),
    session_annee INT REFERENCES Session(session_annee),
    primary key(cod_aff_form, libelle_mention, session_annee)
};

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
