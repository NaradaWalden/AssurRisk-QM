# Plan  : faut-il supprimer la formule Premium ?

**1. Pour cela, je vais vérifier si la formule Premium coûte réellement plus cher à AssurRisk que la formule Essentielle.
 Je vais donc regarder les colonnes des contrats & des sinistres nettoyés.

**2. Prépareation du tableau de comparaison**
Afin d'obtenir un tableau, je vais utiliser les colonnes suivantes :
- Nombre de contrats
- Nombre de sinistres
- Montant total des sinistres
- Coût moyen par sinistre
- Coût moyen des sinistres par contrat

Je vais  :
- Compter les contrats pour chaque formule.
- Relier chaque sinistre à son contrat  pour retrouver sa formule.
- Compter les sinistres et leur montant total.
- Rassembler les résultats  et je calcule les 2 moyennes.

------------------------------------------

**3. Identifier les données nécessaires**
Je vais utiliser les tables `dim_contrat` et `clean_fact_sinistre`.


**4. Effectuer les calculs dans le bon ordre**
Je commence par compter les contrats de chaque formule. Ensuite, les sinistres et leur montant total.
Je relie  les résultats pour obtenir le coût moyen par sinistre et le coût moyen par contrat.
Je compare ensuite Premium vs  Essentielle.

**5. Analyser et conclusion**
Je vérifie si Premium coûte réellement davantage, en tenant compte du nombre de contrats.
Je dois aussi vérifier si les cotisations sont disponibles, car le coût des sinistres ne suffit pas pour mesurer la rentabilité d'une formule.
Enfin, je prépare une réponse simple pour la direction, avec les chiffres obtenus, ma recommandation et les limites de l'analyse.

## RECOMMANDATIONS
-----------------------------------------------------
*Question : faut-il supprimer la formule Premium ?**
Non, je ne conseille pas de supprimer Premium.
Le directeur  a raison sur 1 point : un sinistre Premium coûte en moyenne 7 016 € vs 6 788 € pour Essentielle. Mais il faut aussi regarder ce que chaque formule rapporte.
En 2024, pour 100 € de primes annuelles prévues, AssurRisk a versé environ 110 € d'indemnisations en Premium, contre 312 € en Essentielle. 
Premium semble donc moins défavorable, même si les 2 résultats méritent d'être examinés.
Je conseille de garder Premium pour le moment et d'étudier en priorité pourquoi les indemnisations d'Essentielle sont si élevées. Il faudrait vérifier les tarifs, les garanties et les dépenses avant de modifier les offres.
Les primes sont des montants prévus, pas les cotisations réellement encaissées, et les frais de gestion manquent : on ne peut pas mesurer la rentabilité réelle.

Niveau Confiance : moyenne car d'autres analyses seront néccessaires
