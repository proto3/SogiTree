% SOGITREE
% Le Druidisme expliqué aux personnes âgées

## TLDR

SogiTree est un challenge de code. Le thème est de faire pousser des arbres à partir de 3 outils :

- Des fichiers .tree qui représente un monde et des arbres
- Un exécutable Sogitree qui transforme le monde en faisant pousser les arbres
- Un executable tree2png qui transforme un fichier .tree en image png

Ces 3 outils sont fournis en version basique et sont indépendants.

On gagne des points de différentes façons, à chacun sa stratégie !

##Contexte

Une guerre mondiale s'est déclenchée entre les partisans des espaces et des tabulation.

Le SogiMonde étant dévasté, une communauté de druides survivants tente de planter les graines d'un monde nouveau.

##Format tree

Le monde connu a été fortement modifié par les armes technologies utilisées dans le conflit.

Sa forme est maintenant une matrice rectangulaire de caractères ASCII

Les univers parallèles existent, ils sont simplement stockés dans différents fichiers .tree.

##Elements

Seuls 8 caractères sont encore sains :

- 'f' du feuillage clairsemé
- 'F' du feuillage dense
- 't' un tronc clair
- 'T' un vieux tronc
- 'o' un rocher
- 'r' une racine
- '-' de la terre
- ' ' pour l'air.

Tout autre élément est radioactif et ne doit pas être utilisé !

##Prerequis

Pour utiliser ce projet vous aurez besoin du top de la technologie !

`sudo apt-get install python3 make ffmpeg imagemagick`

##Les fichiers .tree

Des fichiers .tree d'exemple sont stockés dans le répertoire `datas`

##SogiTree

L'exécutable doit être placé à la racine du projet. Il lit le fichier .tree depuis son entrée standard et produit le résultat sur la sortie standard.

```
	cat graine.tree | ./SogiTree > result.tree
```

Il fait évoluer le monde d'une unité de temps. Cette unité n'est pas définie.

##tree2png

Cet exécutable transforme un fichier .tree en image png. SOn interface est la suivante :

```
	tree2png monde.tree monde.png
```

##Déroulement

- 11h50 : formation des trinômes
- 12h : Briefing
- 12h15 : Top départ !
- 14h00 : Rammassage des fichiers .tree bonus
- 14h30 : Fin du code ! Envoie des résultats et concertation du Jury
- 14h50 : Annonce des résultats
- 15h : Fin du challenge ! Back to work !

## Notation

Tests : 5 points
Esthétique (Jury) : 5 points
Réalisme du SogiTree: 5 points
tree2png amélioré : 5 points

Bonus :

- +1 point pour un fichier .tree fullhd accepté par l'arbitre (max 2 points)
- +1 point par fix d'un test intégré par l'arbitre(démonstration d'erreur + patch)
- +1 point par proposition de test supplémentaire accepté par l'arbitre

## Les 10 règles des tests

0. On ne parle pas du Tree Club
1. Respecte la géométrie du monde
2. Pas d'invasion d'éléments extraterrrestres
3. Dans le désert rien ne pousse
4. Un arbre ne peux pas pousser sans lumière
5. Une racine ne pousse que dans la terre
6. Un vieux tronc ne disparait pas
7. Un jeune tronc ne peut devenir qu'un vieux tronc
8. Les cailloux et le sol ça pousse pas hein...
9. un jeune tronc ne peut se créer qu'au contact d'une racine ou d'un tronc
10. Le feuillage doit pouvoir faire contact avec une racine via des éléments végétaux

2 derniers non implémentés

## Happy Hacking !

Soumission à l'email de l'arbitre des fichiers .tree et animations
