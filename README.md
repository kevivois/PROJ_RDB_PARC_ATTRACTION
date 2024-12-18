# Micro-projet RDB

## RollerCoasterWorld ! 

## Description

RollerCoasterWorld est un parc d'attractions qui propose une large gamme d'attractions. Non loin de ces dernières se trouve ShopWorld, un magasin où les visiteurs peuvent acheter divers produits et souvenirs. Différents types de billets sont disponibles à la vente, chacun permettant l'accès à plusieurs attractions du parc. Les employés du parc exercent leurs fonctions soit dans les attractions, soit dans le magasin, en fonction de leur affectation. Enfin, les visiteurs ont la possibilité de laisser des commentaires (feedbacks) sur les attractions qu'ils ont faites, contribuant ainsi à enrichir l'expérience pour tous.

## Métriques

Notre parc d'attractions se compose d'une vingtaine d'attractions (par comparaison, Europa-Park en possède 59).
Plusieurs offres tarifaires permettront d'accéder à certaines attractions.
Pour chaque attraction, nous considérons qu'il est vraisemblable d'avoir un employé par attraction.

## Particularités 

Nous avons fait le choix d'avoir un seul magasin dans notre parc. De ce fait, nous n'aurons pas de table "shop" à proprement parler, mais une table qui liera un produit, un client et un employé pour obtenir une liste indiquant qui achète quoi, à qui, ainsi que d'autres colonnes comme la date, le prix et la quantité. Ainsi, nous avons des relations de plusieurs à plusieurs (par exemple, les employés qui peuvent travailler dans plusieurs attractions et les attractions qui peuvent être dirigées par plusieurs employés). 

Pour diversifier davantage, nous avons décidé d'introduire un système de tickets qui permet d'accéder à certaines attractions ou non, offrant ainsi un panel de questions intéressantes.

## Challenge

Dans notre structure, nous nous sommes retrouvés avec des relations circulaires que nous avons réussi à supprimer. Il existe des tables dépendantes d'autres tables, mais aucune boucle n'existe.

## Choix de modélisation

Dans notre projet, nous aurons naturellement des attractions qui forment la base d'un parc, mais nous n'avons pas introduit tous les éléments distinctifs d'un parc d'attractions comme des restaurants et/ou des cafés. Nous considérons que ce serait répétitif vis-à-vis du shop que nous avons déjà (le fonctionnement serait sensiblement le même). Ensuite, nous ne modéliserons pas l'aspect file d'attente d'une attraction, nous resterons sur des données statiques. 

## Forme

Notre base de données est au format 3NF (Troisième Forme Normale), car :
- Les colonnes contiennent seulement des valeurs atomiques.
- Aucun groupe répétitif n'existe.
- Les attributs décrivent toujours l'objet représenté par la relation.
- Aucune dépendance fonctionnelle transitive n'existe.

## Données

Notre projet est totalement fictif, même si une inspiration issue de parcs d'attractions pour les éléments de nos tables n'est pas exclue. Néanmoins, nous n'aurons aucune donnée réelle sur lesquelles nous baser ; elles seront totalement fictives.

## Questions :

Toutes les questions correspondantes se trouvent dans notre fichier `queries.sql`.

## Index

Dans notre base de données, aucun index ne serait nécessaire en l'état, car il y a trop peu de valeurs. Cependant, si l'on imagine qu'il y a plus de données, voici les index que l'on pourrait ajouter :
- Sur `sales_visitors` et sa colonne `date`, pour trouver toutes les ventes effectuées à une date spécifique.
- Sur `feedbacks` et les `ratings`, pour pouvoir trouver les mauvais commentaires.

Nous pourrions ajouter d'autres index, mais cela dépend des requêtes.

---

Notre groupe est composé de :
- Flavien Gomez Donoso
- Kevin Voisin
- Alexandre Venturi
