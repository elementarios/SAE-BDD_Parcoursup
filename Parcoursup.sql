--Initilialisation du schéma
Drop schema if exists parcoursup Cascade;
create schema parcoursup;
set schema 'parcoursup';



------Tables
drop Table if EXISTS Academie;
CREATE TABLE Academie(
    academie_nom VARCHAR(20) PRIMARY KEY;
);