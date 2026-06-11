insert into _academie(academie_nom)
select distinct academie_nom from stockage;

insert into _region(region_nom)
select distinct region_nom from stockage;

insert into _departement(departement_code,departement_nom,region_nom)
select distinct s.etablissement_code_dept,s.dept_nom,s.region_nom from stockage as s;

insert into _commune(commune_nom,departement_code)
select distinct s.commune_nom,s.etablissement_code_dept from stockage as s;

insert into _etablissement(etablissement_code_uai,etablissement_nom,etablissement_statut)
select s.Code_UAI_etablissement,s.etablissement_libelle,s.Statut_etablissement from stockage as s;

insert into _filiere(filiere_libelle,filiere_libelle_tres_abrege,filiere_libelle_abrege,filiere_libelle_detaille_bis)
select s.filiere_libelle,s.filiere_libelle_tres_abrege,s.filiere_libelle_abrege,s.filiere_libelle_detaille_bis from stockage as s;

INSERT INTO _regroupement (libelle_regroupement)
SELECT s.regroupement_1 FROM stockage AS s WHERE s.regroupement_1 IS NOT NULL
UNION ALL
SELECT s.regroupement_2 FROM stockage AS s WHERE s.regroupement_2 IS NOT NULL
UNION ALL
SELECT s.regroupement_3 FROM stockage AS s WHERE s.regroupement_3 IS NOT NULL;

insert into _session(session_annee)
select distinct session from stockage;

insert into _mention_bac(libelle_mention) Values
 ('Sans mention'),
    ('Assez bien'),
    ('Bien'),
    ('Très bien'),
    ('Félicitations du jury');

insert into _type_bac(type_bac) Values
('Professionel'),
('General'),
('Technologique');

insert into _formation(cod_aff_form,filiere_libelle_detaille,coordonnees_gps,list_com,concours_communs_banque_epreuve,url_formation,tri,academie_nom,etablissement_code_uai,commune_nom)
select s.cod_aff_form,s.filiere_libelle_detaille,s.coordonnees_gps,s.list_com,s.concours_communs_banque_epreuve,s.url_formation,s.tri,s.academie_nom,s.etablissement_code_uai,s.commune_nom from stockage as s;

insert into admissions_generalites(selectivite,capacite,effectif_total_candidats,effectif_total_candidates,cod_aff_form,session_annee)
select selectivite,capacite,effectif_total_candidats,effectif_total_candidates,cod_aff_form,session_annee from stockage;

insert into admissions_selon_type_neo_bac(effectif_candidat_neo_bac_classes,cod_aff_form,session_annee,type_bac)
select effectif_candidat_neo_bac_classes,cod_aff_form,session_annee,type_bac from stockage;

insert into effectif_selon_mention(effectif_admis_neo_bac_selon_mention,cod_aff_form,libelle_mention,session_annee)
select effectif_admis_neo_bac_selon_mention,cod_aff_form,libelle_mention,session_annee from stockage;

insert into rang_dernier_appele_selon_regroupement(rang_dernier_appele,cod_aff_form,libelle_regroupement,session_annee)
select rang_dernier_appele,cod_aff_form,libelle_regroupement,session_annee from stockage;