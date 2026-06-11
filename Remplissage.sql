insert into _academie
select distinct academie_nom from stockage;

insert into _region
select distinct region_nom from stockage;

insert into _departement
select distinct s.etablissement_code_dept,s.dept_nom,s.region_nom from stockage as s;

insert into _commune
select distinct s.commune_nom,s.etablissement_code_dept from stockage as s;

insert into _etablissement(etablissement_code_uai,etablissement_nom,etablissement_statut)
select s.Code_UAI_etablissement,s.etablissement_libelle,s.Statut_etablissement from stockage as s;

insert into _filiere(filiere_libelle,filiere_libelle_tres_abrege,filiere_libelle_abrege,filiere_libelle_detaille_bis)
select s.filiere_libelle,s.filiere_libelle_tres_abrege,s.filiere_libelle_abrege,s.filiere_libelle_detaille_bis from stockage as s;

INSERT INTO _regroupement (libelle_regroupement)
SELECT s.regroupement_1 FROM stockage AS s WHERE s.regroupement_1 IS NOT NULL
UNION 
SELECT s.regroupement_2 FROM stockage AS s WHERE s.regroupement_2 IS NOT NULL
UNION 
SELECT s.regroupement_3 FROM stockage AS s WHERE s.regroupement_3 IS NOT NULL;

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
select s.rang_dernier_appele_groupe1,s.cod_aff_form,s.regroupement_1,s.session from stockage as s
union all
select s.rang_dernier_appele_groupe2,s.cod_aff_form,s.regroupement_2,s.session from stockage as s
union all
select s.rang_dernier_appele_groupe3,s.cod_aff_form,s.regroupement_3,s.session from stockage as s;
