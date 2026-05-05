Drop schema if exists parcoursup Cascade;
create schema parcoursup;
set schema 'parcoursup';

drop table if exists Session;
CREATE TABLE Session{
    session_annee INT,
    primary key(session_annee)
};

CREATE TABLE Regroupement{
    libelle_regroupement VARCHAR NOT NULL,
    primary key(libelle_regroupement)
};

CREATE TABLE Type_bac{
    type_bac VARCHAR NOT NULL,
    primary key(type_bac)
};

CREATE TABLE Mention_bac{
    libelle_mention VARCHAR NOT NULL,
    primary key(libelle_mention)
};

drop table if exists rang_dernier_appele_selon_regroupement;

create table rang_dernier_appele_selon_regroupement{
    rang_dernier_appele INT;
    cod_aff_form VARCHAR REFERENCES Formation(cod_aff_form),
    libelle_regroupement VARCHAR REFERENCES Regroupement(libelle_regroupement),
    session_annee INT REFERENCES Session(session_annee),
    primary key(cod_aff_form, libelle_regroupement, session_annee)
};