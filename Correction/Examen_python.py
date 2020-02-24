# 1 Ecrire une fonction python r_names() qui admet pour entrer une de ces chaînes de
# caractères et qui retourne une liste de nom de colonnes.

from re import sub

Nuancier ='																				'													
Nuancier += "code	libellé	ordre	définition"


def r_names(Nuancier):
    x=Nuancier.replace(' ','_')
    x1=sub('[é,è]','e',x)
    x2=sub('[(,)]','',x1)
    x3=x2.split()
    return x3
print(r_names(Nuancier))

x3=r_names(Nuancier)

# 2 Ecrire une fonction python parse_dates() qui admet pour entrer la liste renvoyer par
# r_names() et qui retourne une liste contenant seulement les noms de colonnes
# commençant par « Date».

def parse_dates(x3):
    for i in range (0, len(x3)):
        if x3[i][0:4]=='Date':
            return x3[i]

print(parse_dates(x3))

# 6. Les fichiers ayant la même structure, écrire une fonction chargement() pour alimenter
# la base « RNE » avec ces fichiers. Cette fonction utilisera les fonction r_names et
# parses_dates(). Elle aura pour entrer la chaîne de caractère contenant le nom des
# colonnes, le chemin d’accès vers le fichier et le nom de la table dans la quel écrire. Alimenter la base avec les fichiers

from sqlalchemy import create_engine
import pandas as pd

engine = create_engine('mysql+pymysql://RNE_user:RNE_password13@localhost:3306/Repertoire_elus_nationaux')


def chargement(link,table):
    print("Chargement des données")
    df = pd.read_excel(link , skiprows=0,header=1, names = r_names(Nuancier))
    df.to_sql('nuancier', con = engine, if_exists='append', index = False)
    return print("Fin du chargement des données")

chargement('/home/utilisateur/Téléchargements/Projet_examen/codes_nuances.xlsx', 'nuancier')
