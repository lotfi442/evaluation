##question 3
create database RNE;
use RNE;
##question4:les 6 tables ont été creer
##question 5
create user 'RNE_user2'@'localhost' identified by 'RNE_azerty'; 
GRANT ALL ON `RNE`.* TO 'RNE_user2'@'localhost';


##question 8
SELECT libelle FROM nuancier WHERE libelle LIKE '%Union%';
##question 9
SELECT * FROM elus WHERE Date_de_naissance BETWEEN '1900-06-01' AND '2020-08-20' in var;
##question 10
SELECT *, AVG(age) FROM elus GROUP BY M;
SELECT *, AVG(age) FROM elus GROUP BY F;
##question 11
select * from population group by bouche_du_rhone;
##question 12
SELECT COUNT(DISTINCT id) FROM departement limit 10;
##question 13
SELECT DISTINCT nombre_elus FROM nuancier and departement; 
##question 14
select departement.bouche_du_rhone from elus order by nuance_politique and ville;
#question 15
SELECT V.NAME
, SEXE
, COUNT(NOM) NOM
FROM ELUS E
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON V.DEPARTEMENT_CODE = D.CODE
WHERE SEXE LIKE "F"
GROUP BY SEXE,V.NAME
ORDER BY NOM DESC LIMIT 10;
#question 16 
SELECT V.NAME
, AVG(timestampdiff(YEAR, Date_de_naissance, "2014-01-01")) AS AGE_MOYEN
FROM ELUS E
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON V.DEPARTEMENT_CODE = D.CODE
GROUP BY V.NAME
ORDER BY AGE_MOYEN DESC;
#question 17
SELECT V.NAME
, AVG(timestampdiff(YEAR, Date_de_naissance, "2014-01-01")) AS AGE_MOYEN
FROM ELUS E
JOIN VILLES V ON E.CODE_INSEE = V.CODE_INSEE
JOIN DEPARTEMENTS D ON V.DEPARTEMENT_CODE = D.CODE
GROUP BY V.NAME  
HAVING AGE_MOYEN < 54
ORDER BY AGE_MOYEN ;


