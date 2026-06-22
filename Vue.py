import pandas as pd
# --- 1. Chargement du fichier source --------------------------------------

df = pd.read_csv("fr-esr-parcoursup_2022.csv", sep=";")

# --- 2. Sélection des colonnes -------------------

colonnes_identification = list(df.columns[[3, 9, 15]])
# 3  -> Etablissement
# 9  -> Filière de formation
# 15 -> Filière de formation très détaillée

colonne_capacite = [df.columns[17]]
# 17 -> Capacité de l'établissement par formation

colonnes_mentions_effectifs = list(df.columns[60:66])
# 60 -> Dont effectif des admis néo bacheliers sans information sur la mention au bac
# 61 -> Dont effectif des admis néo bacheliers sans mention au bac
# 62 -> Dont effectif des admis néo bacheliers avec mention Assez Bien au bac
# 63 -> Dont effectif des admis néo bacheliers avec mention Bien au bac
# 64 -> Dont effectif des admis néo bacheliers avec mention Très Bien au bac
# 65 -> Dont effectif des admis néo bacheliers avec mention Très Bien avec félicitations au bac

colonnes_mentions_pourcentages = list(df.columns[82:88])
# 82 -> % d'admis néo bacheliers sans information sur la mention au bac
# 83 -> % d'admis néo bacheliers sans mention au bac
# 84 -> % d'admis néo bacheliers avec mention Assez Bien au bac
# 85 -> % d'admis néo bacheliers avec mention Bien au bac
# 86 -> % d'admis néo bacheliers avec mention Très Bien au bac
# 87 -> % d'admis néo bacheliers avec mention Très Bien avec félicitations au bac

colonnes_admis = list(df.columns[47])

colonnes_candidats = list(df.columns[19])

toutes_colonnes = (
    colonnes_identification
    + colonne_capacite
    + colonnes_mentions_effectifs
    + colonnes_mentions_pourcentages
    + colonnes_admis
    + colonnes_candidats
)

# --- 3. Construction de la vue ---------

# Les noms de colonnes originaux du fichier CSV
vue_capacite_mentions = df[toutes_colonnes].copy()

# Suppression des lignes sans capacité renseignée (non exploitables pour la problématique)
vue_capacite_mentions = vue_capacite_mentions.dropna(subset=colonne_capacite)


colonnes_numeriques = colonne_capacite + colonnes_mentions_effectifs + colonnes_mentions_pourcentages
for col in colonnes_numeriques:
    vue_capacite_mentions[col] = pd.to_numeric(vue_capacite_mentions[col], errors="coerce")

# Suppression des lignes où la conversion numérique aurait échoué
vue_capacite_mentions = vue_capacite_mentions.dropna(subset=colonnes_numeriques)

# Tri par capacité décroissante pour faciliter la lecture
vue_capacite_mentions = vue_capacite_mentions.sort_values(
    by=colonne_capacite[0], ascending=False
).reset_index(drop=True)

#

nomFSortie = "vue.csv"

vue_capacite_mentions.to_csv(nomFSortie, sep=";", index=False)


