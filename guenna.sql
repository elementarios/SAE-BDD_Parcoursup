Drop schema if exists parcoursup Cascade;
create schema parcoursup;
set schema 'parcoursup';

drop table if exists Session;
CREATE TABLE Session{
    session_annee INT,
    primary key(session_annee)
};
drop table if exists Regroupement;
CREATE TABLE Regroupement{
    libelle_regroupement VARCHAR NOT NULL,
    primary key(libelle_regroupement)
};
drop table if exists Type_bac;
CREATE TABLE Type_bac{
    type_bac VARCHAR NOT NULL,
    primary key(type_bac)
};
drop table if exists Mention_bac;
CREATE TABLE Mention_bac{
    libelle_mention VARCHAR NOT NULL,
    primary key(libelle_mention)
};

drop table if exists Admissions_generalites;
create table Admissions_generalites{
    selectivite VARCHAR NOT NULL,
    capacite INT,
    effectif_total_candidats INT,
    effectif_total_candidates INT,
    cod_aff_form VARCHAR NOT NULL REFERENCES Formation(cod_aff_form),
    session_annee INT REFERENCES Session(session_annee),
    primary key(cod_aff_form, session_annee)
};-- comen hair

drop table if exists Admissions_selon_type_neo_bac;
create table Admissions_selon_type_neo_bac{
    effectif_candidat_neo_bac_classes INT,
    cod_aff_form VARCHAR NOT NULL REFERENCES Formation(cod_aff_form),
    session_annee INT REFERENCES Session(session_annee),
    type_bac VARCHAR NOT NULL REFERENCES Type_bac(type_bac),
    primary key(cod_aff_form, session_annee, type_bac)
};

drop table if exists rang_dernier_appele_selon_regroupement;
create table rang_dernier_appele_selon_regroupement{
    rang_dernier_appele INT;
    cod_aff_form VARCHAR NOT NULL REFERENCES Formation(cod_aff_form),
    libelle_regroupement VARCHAR NOT NULL REFERENCES Regroupement(libelle_regroupement),
    session_annee INT REFERENCES Session(session_annee),
    primary key(cod_aff_form, libelle_regroupement, session_annee)
};

drop table if exists effectif_selon_mention;
create table effectif_selon_mention{
    effectif_admis_neo_bac_selon_mention INT,
    cod_aff_form VARCHAR NOT NULL REFERENCES Formation(cod_aff_form),
    libelle_mention VARCHAR NOT NULL REFERENCES Mention_bac(libelle_mention),
    session_annee INT REFERENCES Session(session_annee),
    primary key(cod_aff_form, libelle_mention, session_annee)
};
