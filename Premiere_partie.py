
#question 1
def r_names(s):
    s = "code(insee)_mode de scrutin numlist_code(nuance de la liste)_numero du candidat dans la liste_tour_nom_prenom_sexe_date de naissance_code(profession)_libellé profession_nationalité"

    l1 = ['']
    l2 = s.split()
    return l1

print(r_name(s)) 

#question 2
parse_dates():\
    r_names = "'codeinsee', 'modedescrutin', 'numliste', 'codenuancedelaliste', 'numeroducandidatdanslalistetour', 'nom', 'prenom', 'sexe', 'Datedenaissance', 'codeprofession', 'libelleprofession', 'nationalite'"

def parses_date(r_names):
    l = findall("Date", r_names)
    return l

print(parses_date(r_names))