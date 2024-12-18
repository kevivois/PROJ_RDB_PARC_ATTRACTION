# Micro-projet RDB

## RollerCoasterWorld ! 

## Description

RollerCoasterWorld est un parc d'attractions qui propose une large gamme d'attractions. Non loin de ces dernières, se trouve ShopWorld, un magasin où les visiteurs peuvent acheter divers produits et souvenirs. Différents types de billets sont disponibles à la vente, chacun permettant l'accès à plusieurs attractions du parc. Les employés du parc exercent leurs fonctions soit dans les attractions, soit dans le magasin, en fonction de leur affectation. Enfin, les visiteurs ont la possibilité de laisser des commentaires (feedbacks) sur les attractions qu'ils ont vécues, contribuant ainsi à enrichir l'expérience pour tous.

## Métriques

Notre parc d'attractions se composera d'une vingtaine d'attractions (comparativement Europapark en est composé de 59).
Plusieurs offres tarifaires permettrons d'accéder à certaines attractions.
Par attractions, nous considérons qu'il est vraisemblable d'avoir 10 employé.es par attractions pour ce qui est accueil, gestion des visiteurs ou encore entretien.

## Particularités 

Nous avons fait le choix de n'avoir qu'un seul shop dans notre parc pour varier les relations entre les tables, ainsi nous avons des relations de plusieurs à plusieurs (comme les employés qui peuvent travailler dans plusieurs attractions et les attractions qui sont dirigées par plusieurs employés) et avec notre shop nous avons une relation de un vers plusieurs dans le sens que plusieurs client peuvent aller dans ce shop. Pour avoir encore de la diversité, nous avons décidé d'introduire un système de ticket qui permet d'accéder à certaines attractions ou pas, ce qui offrira un panel de question intéressante. 

## Challenge(s)

Dans notre structure, nous nous sommes retrouver avec des relations qui forment un cercle. Il faudra bien comprendre ce que cela signifie et justifier pourquoi ce comportement est présent.

## Choix de modélisation

Dans notre projet, nous aurons naturellement des attractions qui forment la base d'un parc mais nous n'avons pas introduit tous les éléments distinctifs d'un parc d'attraction comme des restaurants et/ou des cafés, nous considérons que ce serait répétitif vis-à-vis des du shop que nous avons déjà (le fonctionnement serait sensiblement le mênme). Ensuite, nous ne modéliserons pas l'aspect file d'attente d'une attraction, nous resterons sur des données statiques. 

## Données

Notre projet est totalement fictif même si de l'inspiration de parc d'attraction pour les éléments de nos tables n'est pas exclue. Néanmoins, nous n'aurons aucune donnée sur lesquelles se baser, elles seront totalement fictives.

Questions intéressantes : 
- Quelles attractions puis-je faire selon un age et un billet ?
- Quelles est la moyenne des avis ?
- Quelle est la meilleure attraction ?
- Quelles employées ont travaillés à la fois dans un shop et dans une attractions.
- Quelles visiteurs ont achetés aux moins 2 objets.
- Quelle est le produit le plus vendu ?
- Quelle employé a vendu un 'objet' à 'client' ?
- 



Notre groupe est composé de :

Flavien Gomez Donoso,
Kevin Voisin,
Alexandre Venturi
