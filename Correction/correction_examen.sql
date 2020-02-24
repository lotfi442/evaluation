# 3. creation de la base de donnée RNE
create DATABASE IF NOT EXISTS  RNE;
# 4.  creation de tables
create table elus(
code_insee varchar(10)
, mode_de_scrutin varchar(20)
, numliste varchar(10)
, code_nuance_de_la_liste varchar(10)
, numero_du_candidat_dans_la_liste varchar(10)
, tour varchar(10)
, nom varchar(100)
, prenom varchar(100)
, sexe varchar(1)
, Date_de_naissance datetime
, code_profession varchar(2)
, libelle_profession varchar(100)
, nationalite varchar(5)
);
create table population(
Code_insee varchar(5)
, Population_legale Int(7)
);
create table nuancier(
code varchar(4)
, libelle varchar(50)
, ordre varchar(2)
, definition varchar(500)
);
create table villes (
id varchar(5)
, departement_code varchar(10)
, code_insee varchar(10)
, zip_code varchar(20)
, name varchar(100)
);
create table categorie (
Code varchar(10)
, Nb_d_emplois int(5)
, Artisans_commerçants_chefs_d_entreprise int(5)
, Cadres_et_professions_intellectuelles_superieures int(5)
, Professions_intermedaires int(5)
, Employes int(5)
, Ouvriers int(5) 
);
create table departements(
id varchar(5)
, region_code varchar(3)
, code varchar(3)
, name varchar(100)
, nom_normalise varchar(100)
);

# 5. creation d'un nouvelle utilisateur RNE_user


create user 'RNE_user'@'localhost' identified by 'RNE_pasword';
GRANT ALL ON RNE.* TO 'RNE_user'@'localhost'

#8
select libelle from nuancier where libelle like "%union%";
#9
select nom, prenom,, date_de_naissance
from elus
inner join villes on elus.code_insee=villes.code.insee
inner join departement on villes.departement_code=departements.code
where departements.name ='var' and month(date_de_naissance) between 06 and 08;
#10
# 10. Quel est l’âge moyen des élus homme au 01/01/2014 ? Celui des élus femme

SELECT Date_de_naissance
, SEXE
, NOM
, AVG(timestampdiff(YEAR, Date_de_naissance, "2014-01-01"))  MOYENNE
 FROM ELUS
 GROUP BY NOM, SEXE, DATE_DE_NAISSANCE
 ORDER BY SEXE; 

# 11. Afficher la population totale du département des « Bouches-du-Rhône »

SELECT nom_normalise AS NOM_DEPARTEMENT, SUM(POPULATION_LEGALE) TOTALE_POPULATION
FROM POPULATION P
JOIN ELUS E ON E.CODE_INSEE = P.CODE_INSEE
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON D.CODE = V.DEPARTEMENT_CODE
WHERE D.NAME LIKE "BOUCHES_DU_RHÔNE"
GROUP BY nom_normalise;

# 12. Quel sont les 10 départements comptant le plus d’ouvriers

SELECT  sum(Ouvriers) as sum_ouvriers
, NOM_NORMALISE
FROM categorie C 
JOIN Villes V on V.code_insee = C.code
JOIN departements D on D.code = V.departement_code
GROUP BY NOM_NORMALISE
ORDER BY  sum_ouvriers DESC LIMIT 10;

# 13. Afficher le nombre d’élus regrouper par nuance politique et par département

SELECT LIBELLE
, NOM_NORMALISE  
, COUNT(NOM)
FROM NUANCIER N
JOIN ELUS E ON N.CODE = E.CODE_NUANCE_DE_LA_LISTE
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON V.DEPARTEMENT_CODE = D.CODE
GROUP BY LIBELLE, NOM_NORMALISE
ORDER BY LIBELLE ;

# 14. Afficher le nombre d’élus regroupé par nuance politique et par villes pour le département des « Bouches-du-Rhône »

SELECT LIBELLE
, V.name
, COUNT(NOM) NOM
FROM NUANCIER N
JOIN ELUS E ON N.CODE = E.CODE_NUANCE_DE_LA_LISTE
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON V.DEPARTEMENT_CODE = D.CODE
WHERE V.DEPARTEMENT_CODE LIKE "13"
GROUP BY LIBELLE, V.name
ORDER BY LIBELLE ;

# 15. Afficher les 10 départements dans lesquelles il y a le plus d’élus femme, ainsi que le nombre d’élus femme correspondant

SELECT V.NAME
, SEXE
, COUNT(NOM) NOM
FROM ELUS E
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON V.DEPARTEMENT_CODE = D.CODE
WHERE SEXE LIKE "F"
GROUP BY SEXE,V.NAME
ORDER BY NOM DESC LIMIT 10;

# 16. Donner l’âge moyen des élus par départements au 01/01/2014. Les afficher par ordre décroissant

SELECT D.NAME
, AVG(timestampdiff(YEAR, Date_de_naissance, "2014-01-01")) AS AGE_MOYEN
FROM ELUS E
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON V.DEPARTEMENT_CODE = D.CODE
GROUP BY D.NAME
ORDER BY AGE_MOYEN DESC;

# 17. Afficher les départements où l’âge moyen des élus est strictement inférieur à 54 ans.

SELECT D.NAME
, AVG(timestampdiff(YEAR, Date_de_naissance, "2014-01-01")) AS AGE_MOYEN
FROM ELUS E
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON V.DEPARTEMENT_CODE = D.CODE
GROUP BY D.NAME  
HAVING AGE_MOYEN < 54
ORDER BY D.NAME ;

