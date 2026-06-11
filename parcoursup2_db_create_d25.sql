--Initilialisation du schéma
Drop schema if exists parcoursup2 Cascade;
create schema parcoursup2;
set schema 'parcoursup2';



------Tables
drop Table if EXISTS _academie;
CREATE TABLE _academie(
    academie_nom VARCHAR(50) PRIMARY KEY
);


drop TABLE if EXISTS _etablissement;
CREATE TABLE _etablissement(
    etablissement_code_uai VARCHAR(50) PRIMARY KEY,
    etablissement_nom VARCHAR(150) NOT NULL,
    etablissement_statut VARCHAR(50) Not NULL
);


drop TABLE if EXISTS _filiere;
CREATE TABLE _filiere(
    filiere_id SERIAL PRIMARY KEY,
    filiere_libelle VARCHAR(400) NOT NULL,
    filiere_libelle_tres_abrege VARCHAR(30) NOT NULL,
    filiere_libelle_abrege VARCHAR(150) not NULL,
    filiere_libelle_detaille_bis VARCHAR(150) NOT NULL
);


DROP TABLE if EXISTS _region;
CREATE TABLE _region(
    region_nom VARCHAR(30) PRIMARY KEY
);


DROP TABLE if EXISTS _departement;
CREATE TABLE _departement(
    departement_code VARCHAR(19) PRIMARY KEY,
    departement_nom VARCHAR(40),
    region_nom VARCHAR(30) REFERENCES _Region(region_nom)
);


DROP TABLE if EXISTS _commune;
CREATE TABLE _commune(
    commune_nom VARCHAR(50) PRIMARY KEY,
    departement_code VARCHAR(20) REFERENCES _Departement(departement_code)
);


Drop TABLE if EXISTS _formation;
CREATE TABLE _formation(
    cod_aff_form int PRIMARY KEY,
    filiere_libelle_detaille VARCHAR(400),
    coordonnees_gps VARCHAR(45),
    list_com VARCHAR(100),
    concours_communs_banque_epreuve VARCHAR(200),
    url_formation VARCHAR(200),
    tri VARCHAR(50),
    academie_nom VARCHAR(50) REFERENCES _Academie(academie_nom),
    filiere_id INT REFERENCES _Filiere(filiere_id),
    etablissement_code_uai VARCHAR(15) REFERENCES _Etablissement(etablissement_code_uai),
    commune_nom VARCHAR(50) REFERENCES _Commune(commune_nom)
);

drop table if exists _session;
CREATE TABLE _session(
    session_annee INT,
    primary key(session_annee)
);
drop table if exists _regroupement;
CREATE TABLE _regroupement(
    libelle_regroupement VARCHAR(100) NOT NULL,
    primary key(libelle_regroupement)
);
drop table if exists _type_bac;
CREATE TABLE _type_bac(
    type_bac VARCHAR(17) NOT NULL,
    primary key(type_bac)
);
drop table if exists _mention_bac;
CREATE TABLE _mention_bac(
    libelle_mention VARCHAR(50) NOT NULL,
    primary key(libelle_mention)
);

drop table if exists admissions_generalites;
create table admissions_generalites(
    selectivite VARCHAR(30) NOT NULL,
    capacite INT,
    effectif_total_candidats INT,
    effectif_total_candidates INT,
    cod_aff_form INT NOT NULL REFERENCES _Formation(cod_aff_form),
    session_annee INT REFERENCES _Session(session_annee),
    primary key(cod_aff_form, session_annee)
);-- comen hair

drop table if exists admissions_selon_type_neo_bac;
create table admissions_selon_type_neo_bac(
    effectif_candidat_neo_bac_classes INT,
    cod_aff_form INT NOT NULL REFERENCES _Formation(cod_aff_form),
    session_annee INT REFERENCES _Session(session_annee),
    type_bac VARCHAR(16) NOT NULL REFERENCES _Type_bac(type_bac),
    primary key(cod_aff_form, session_annee, type_bac)
);

drop table if exists rang_dernier_appele_selon_regroupement;
create table rang_dernier_appele_selon_regroupement(
    rang_dernier_appele INT,
    cod_aff_form INT NOT NULL REFERENCES _Formation(cod_aff_form),
    libelle_regroupement VARCHAR(100) NOT NULL REFERENCES _Regroupement(libelle_regroupement),
    session_annee INT REFERENCES _Session(session_annee),
    primary key(cod_aff_form, libelle_regroupement, session_annee)
);

drop table if exists effectif_selon_mention;
create table effectif_selon_mention(
    effectif_admis_neo_bac_selon_mention INT,
    cod_aff_form int NOT NULL REFERENCES _Formation(cod_aff_form),
    libelle_mention VARCHAR(50) NOT NULL REFERENCES _Mention_bac(libelle_mention),
    session_annee INT REFERENCES _Session(session_annee),
    primary key(cod_aff_form, libelle_mention, session_annee)
);

Drop table if exists stockage;
create table stockage(
  Session int,
  Statut_etablissement Varchar(50),
  Code_UAI_etablissement Varchar(20),
  etablissement_libelle Varchar(150),
  etablissement_code_dept Varchar(19),
  dept_nom Varchar(40),
  region_nom Varchar(30),
  academie_nom Varchar(50),
  commune_nom Varchar(50),
  filiere_libelle Varchar(400),
  selectivite Varchar(50),
  filiere_libelle_tres_abrege varchar(30),
  filiere_detaille varchar(400),
  filiere_libelle_abrege varchar(150),
  filiere_libelle_detaille_bis varchar(150),
  filiere_libelle_tres_detaille varchar(400),
  coordonnees_gps varchar(44),
  capacite int,
  effectif_total_candidats int,
  effectif_total_candidates int,
  effectif_total_phase_principale int,
  effectif_internat_phase_principale int,
  effectif_neo_bac_general_phase_principale int,
  effectif_neo_bac_general_phase_principale_boursier int,
  effectif_neo_bac_techno_phase_principale int,
  effectif_neo_bac_techno_principale_boursier int,
  effectif_neo_bac_pro_phase_principale int,
  effectif_neo_bac_pro_phase_principale_boursier int,
  effectif_total_autres_phase_principale int,
  effectif_total_phase_complementaire int,
  effectif_neo_bac_general_phase_complementaire int,
  effectif_neo_bac_techno_phase_complementaire int,
  effectif_neo_bac_pro_phase_complementaire int,
  effectif_total_autres_phase_complementaire int,
  effectif_total_classés_phase_principale INT,
  effectif_total_classés_phase_complementaire int,
  effectif_total_classes_internat_cpge int,
  effectif_total_classes_hors_internat_cpge int,
  effectif_candidats_neo_bac_classes_type_general int,
  effectif_candidats_neo_bac_boursiers_classes_type_general int,
  effectif_candidats_neo_bac_classes_type_techno int,
  effectif_candidats_neo_bac_boursiers_classes_type_techno int,
  effectif_candidats_neo_bac_classes_type_pro int,
  effectif_candidats_neo_bac_boursiers_classes_type_pro int,
  effectif_candidats_classes_type_autres int,
  effectif_total_proposition_admission int,
  effectif_total_admis int,
  effectif_total_admises int,
  effectif_total_admis_phase_principale int,
  effectif_total_admis_phase_complementaire int,
  effectif_proposition_admis_ouverture_procedure_principale int,
  effectif_proposition_admis_avant_bac int,
  effectif_proposition_admis_avant_fin_procedure_principale int,
  effectif_admis_en_internat int,
  effectif_total_admis_boursiers_neo_bac int,
  effectif_total_admis_neo_bac int,
  effectif_admis_neo_bac_type_general int,
  effectif_admis_neo_bac_type_techno int,
  effectif_admis_neo_bac_type_pro int,
  effectif_admis_neo_bac int,
  effectif_admis_neo_bac_selon_mention_type_mention_sans_info int,
  effectif_admis_neo_bac_selon_mention_type_mention_sans_mention int,
  effectif_admis_neo_bac_selon_mention_type_mention_assez_bien int,
  effectif_admis_neo_bac_selon_mention_type_mention_bien int,
  effectif_admis_neo_bac_selon_mention_type_mention_tres_bien int,
  effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel int,
  effectif_admis_neo_bac_avec_mention_type_bac_general int,
  effectif_admis_neo_bac_avec_mention_type_bac_techno int,
  effectif_admis_neo_bac_avec_mention_type_bac_pro int,
  effectif_admis_meme_etablissement int,
  effectif_admises_meme_etablissement int,
  effectif_admis_meme_academie int,
  effectif_admis_meme_academie_pcv int,
  pourcent_proposition_admis_ouverture_procedure_principale int,
  pourcent_proposition_avant_bac int,
  pourcent_proposition_admis_avant_fin_procedure_principale int,
  pourcent_admises int,
  pourcent_neo_bac_admis_meme_academie int,
  pourcent_neo_bac_admis_meme_academie_pcv int,
  pourcent_neo_bac_admis_meme_etablissement_bts_cpge int,
  pourcent_neo_bac_admis_boursiers int,
  pourcent_neo_bac int,
  pourcent_neo_bac_mention_sans_info int,
  pourcent_neo_bac_mention_sans int,
  pourcent_neo_bac_mention_assez_bien int,
  pourcent_neo_bac_mention_bien int,
  pourcent_neo_bac_mention_très_bien int,
  pourcent_neo_bac_mention_très_bien_felicitations int,
  pourcent_neo_bac_general int,
  pourcent_neo_bac_general_avec_mention int,
  pourcent_neo_bac_techno int,
  pourcent_neo_bac_techno_avec_mention int,
  pourcent_neo_bac_pro int,
  pourcent_neo_bac_pro_avec_mention int,
  effectif_candidats_terminale_generale_avec_proposition_admis int,
  effectif_candidats_terminale_generale_boursiers_avec_proposition_admis int,
  effectif_candidats_terminale_techno_avec_proposition_admis int,
  effectif_candidats_terminale_techno_boursiers_avec_proposition_admis int,
  effectif_candidats_terminale_pro_avec_proposition_admis int,
  effectif_candidats_terminale_pro_boursiers_avec_proposition_admis int,
  effectif_autres_candidats_avec_proposition_admis int,
  regroupement_1 varchar(100),
  rang_dernier_appele_groupe1 int,
  regroupement_2 varchar(100),
  rang_dernier_appele_groupe2 int,
  regroupement_3 varchar(100),
  rang_dernier_appele_groupe3 int,
  list_com varchar(100),
  tri varchar(20),
  cod_aff_form int,
  concours_communs_banques_epreuves varchar(200),
  url_formation varchar(200)
 );


Wbimport
-mode=insert
-file='fr-esr-parcoursup_2022.csv'
-header=true
-delimiter=';'
-quoteChar='"'
-table=stockage
-schema='parcoursup2'
-fileColumns=Session,Statut_etablissement,Code_UAI_etablissement,etablissement_libelle,etablissement_code_dept,dept_nom,region_nom,academie_nom,commune_nom,filiere_libelle,selectivite,filiere_libelle_tres_abrege,filiere_detaille,filiere_libelle_abrege,filiere_libelle_detaille_bis,filiere_libelle_tres_detaille,coordonnees_gps,capacite,effectif_total_candidats,effectif_total_candidates,effectif_total_phase_principale,effectif_internat_phase_principale,effectif_neo_bac_general_phase_principale,effectif_neo_bac_general_phase_principale_boursier,effectif_neo_bac_techno_phase_principale,effectif_neo_bac_techno_principale_boursier,effectif_neo_bac_pro_phase_principale,effectif_neo_bac_pro_phase_principale_boursier,effectif_total_autres_phase_principale,effectif_total_phase_complementaire,effectif_neo_bac_general_phase_complementaire,effectif_neo_bac_techno_phase_complementaire,effectif_neo_bac_pro_phase_complementaire,effectif_total_autres_phase_complementaire,effectif_total_classés_phase_principale,effectif_total_classés_phase_complementaire,effectif_total_classes_internat_cpge,effectif_total_classes_hors_internat_cpge,effectif_candidats_neo_bac_classes_type_general,effectif_candidats_neo_bac_boursiers_classes_type_general,effectif_candidats_neo_bac_classes_type_techno,effectif_candidats_neo_bac_boursiers_classes_type_techno,effectif_candidats_neo_bac_classes_type_pro,effectif_candidats_neo_bac_boursiers_classes_type_pro,effectif_candidats_classes_type_autres,effectif_total_proposition_admission,effectif_total_admis,effectif_total_admises,effectif_total_admis_phase_principale,effectif_total_admis_phase_complementaire,effectif_proposition_admis_ouverture_procedure_principale,effectif_proposition_admis_avant_bac,effectif_proposition_admis_avant_fin_procedure_principale,effectif_admis_en_internat,effectif_total_admis_boursiers_neo_bac,effectif_total_admis_neo_bac,effectif_admis_neo_bac_type_general,effectif_admis_neo_bac_type_techno,effectif_admis_neo_bac_type_pro,effectif_admis_neo_bac,effectif_admis_neo_bac_selon_mention_type_mention_sans_info,effectif_admis_neo_bac_selon_mention_type_mention_sans_mention,effectif_admis_neo_bac_selon_mention_type_mention_assez_bien,effectif_admis_neo_bac_selon_mention_type_mention_bien,effectif_admis_neo_bac_selon_mention_type_mention_tres_bien,effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel,effectif_admis_neo_bac_avec_mention_type_bac_general,effectif_admis_neo_bac_avec_mention_type_bac_techno,effectif_admis_neo_bac_avec_mention_type_bac_pro,effectif_admis_meme_etablissement,effectif_admises_meme_etablissement,effectif_admis_meme_academie,effectif_admis_meme_academie_pcv,pourcent_proposition_admis_ouverture_procedure_principale,pourcent_proposition_avant_bac,pourcent_proposition_admis_avant_fin_procedure_principale,pourcent_admises,pourcent_neo_bac_admis_meme_academie,pourcent_neo_bac_admis_meme_academie_pcv,pourcent_neo_bac_admis_meme_etablissement_bts_cpge,pourcent_neo_bac_admis_boursiers,pourcent_neo_bac,pourcent_neo_bac_mention_sans_info,pourcent_neo_bac_mention_sans,pourcent_neo_bac_mention_assez_bien,pourcent_neo_bac_mention_bien,pourcent_neo_bac_mention_très_bien,pourcent_neo_bac_mention_très_bien_felicitations,pourcent_neo_bac_general,pourcent_neo_bac_general_avec_mention,pourcent_neo_bac_techno,pourcent_neo_bac_techno_avec_mention,pourcent_neo_bac_pro,pourcent_neo_bac_pro_avec_mention,effectif_candidats_terminale_generale_avec_proposition_admis,effectif_candidats_terminale_generale_boursiers_avec_proposition_admis,effectif_candidats_terminale_techno_avec_proposition_admis,effectif_candidats_terminale_techno_boursiers_avec_proposition_admis,effectif_candidats_terminale_pro_avec_proposition_admis,effectif_candidats_terminale_pro_boursiers_avec_proposition_admis,effectif_autres_candidats_avec_proposition_admis,regroupement_1,rang_dernier_appele_groupe1,regroupement_2,rang_dernier_appele_groupe2,regroupement_3,rang_dernier_appele_groupe3,list_com,tri,cod_aff_form,concours_communs_banques_epreuves,url_formation
-dateFormat='yyyy-MM-dd';


insert into _academie(academie_nom)
select distinct academie_nom from stockage;

insert into _region(region_nom)
select distinct region_nom from stockage;

insert into _departement(departement_code,departement_nom,region_nom)
select distinct s.etablissement_code_dept,s.dept_nom,s.region_nom from stockage as s;

insert into _commune(commune_nom,departement_code)
select distinct s.commune_nom,s.etablissement_code_dept from stockage as s ON CONFLICT DO NOTHING;

insert into _etablissement(etablissement_code_uai,etablissement_nom,etablissement_statut)
select distinct s.Code_UAI_etablissement,s.etablissement_libelle,s.Statut_etablissement from stockage as s;

insert into _filiere(filiere_libelle,filiere_libelle_tres_abrege,filiere_libelle_abrege,filiere_libelle_detaille_bis)
select distinct s.filiere_libelle,s.filiere_libelle_tres_abrege,s.filiere_libelle_abrege,s.filiere_libelle_detaille_bis from stockage as s;

INSERT INTO _regroupement (libelle_regroupement)
SELECT distinct s.regroupement_1 FROM stockage AS s WHERE s.regroupement_1 IS NOT NULL
UNION
SELECT distinct s.regroupement_2 FROM stockage AS s WHERE s.regroupement_2 IS NOT NULL
UNION
SELECT distinct s.regroupement_3 FROM stockage AS s WHERE s.regroupement_3 IS NOT NULL;

insert into _session(session_annee)
select distinct session from stockage;

insert into _mention_bac(libelle_mention) Values
 ('Sans mention'),
    ('Assez bien'),
    ('Bien'),
    ('Très bien'),
    ('Félicitations du jury'),
    ('Sans Info');

insert into _type_bac(type_bac) Values
('Professionel'),
('General'),
('Technologique');

insert into _formation(cod_aff_form,filiere_libelle_detaille,coordonnees_gps,list_com,concours_communs_banque_epreuve,url_formation,tri,academie_nom,etablissement_code_uai,commune_nom)
select s.cod_aff_form,s.filiere_detaille,s.coordonnees_gps,s.list_com,s.concours_communs_banques_epreuves,s.url_formation,s.tri,s.academie_nom,s.Code_UAI_etablissement,s.commune_nom from stockage as s;

insert into admissions_generalites(selectivite,capacite,effectif_total_candidats,effectif_total_candidates,cod_aff_form,session_annee)
select s.selectivite,s.capacite,s.effectif_total_candidats,s.effectif_total_candidates,s.cod_aff_form,s.session from stockage as s;


insert into admissions_selon_type_neo_bac(effectif_candidat_neo_bac_classes,cod_aff_form,session_annee,type_bac)
select s.effectif_admis_neo_bac_avec_mention_type_bac_general,s.cod_aff_form,s.session,'General' from stockage as s 
Union all
select s.effectif_admis_neo_bac_avec_mention_type_bac_techno,s.cod_aff_form,s.session,'Professionel' from stockage as s 
Union all
select s.effectif_admis_neo_bac_avec_mention_type_bac_pro,s.cod_aff_form,s.session,'Technologique' from stockage as s ;



insert into effectif_selon_mention(effectif_admis_neo_bac_selon_mention,cod_aff_form,libelle_mention,session_annee)
select s.effectif_admis_neo_bac_selon_mention_type_mention_sans_info,s.cod_aff_form,'Sans Info',s.session from stockage as s
Union all
select s.effectif_admis_neo_bac_selon_mention_type_mention_sans_mention,s.cod_aff_form,'Sans mention',s.session from stockage as s
Union all
select s.effectif_admis_neo_bac_selon_mention_type_mention_assez_bien,s.cod_aff_form,'Assez bien',s.session from stockage as s
Union all
select s.effectif_admis_neo_bac_selon_mention_type_mention_bien,s.cod_aff_form,'Bien',s.session from stockage as s
union all
select s.effectif_admis_neo_bac_selon_mention_type_mention_tres_bien,s.cod_aff_form,'Très bien',s.session from stockage as s
union all
select s.effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel,s.cod_aff_form,'Félicitations du jury',s.session from stockage as s;

insert into rang_dernier_appele_selon_regroupement(rang_dernier_appele,cod_aff_form,libelle_regroupement,session_annee)
select s.rang_dernier_appele_groupe1,s.cod_aff_form,s.regroupement_1,s.session from stockage as s WHERE s.rang_dernier_appele_groupe1 is not null and s.regroupement_1 is not null
union all
select s.rang_dernier_appele_groupe2,s.cod_aff_form,s.regroupement_2,s.session from stockage as s WHERE s.rang_dernier_appele_groupe2 is not null and s.regroupement_2 is not null
union all
select s.rang_dernier_appele_groupe3,s.cod_aff_form,s.regroupement_3,s.session from stockage as s WHERE s.rang_dernier_appele_groupe3 is not null and s.regroupement_3 is not null;
