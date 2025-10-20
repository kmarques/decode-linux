# Sujet Partiel

## Exercice 1 (6 points)

Créer une calculatrice en bash qui prend une expression arithmétique en argument et qui affiche le résultat.

Niveau 1 : 3 arguments, Addition, soustraction, multiplication, division (1 points)
Niveau 2 : N arguments, gérer les priorités (2 points)
Niveau 3 : N arguments, gérer les parenthèses (3 points)

Nom du script : calcul.sh

Exemple de sortie :
```
$> ./calcul.sh 1 + 2
3
$> ./calcul.sh 1 + 2 \* 3
7
$> ./calcul.sh \( 1 + 2 \) \* \( 3 - 4 \)
-3
$> ./calcul.sh "( 1 + 2 ) * ( 3 - 4 )"
-3
```

Aide : aucune

## Exercice 2 (6 points)

Créer un script permettant d'afficher un menu afin de lancer les scripts précédents. Si l'utilisateur entre une option invalide, le menu doit être relancé. Si l'utilisateur quitte l'annuaire (Exercice 3), il doit retourner au menu principal. L'exercice 3 n'a pas besoin d'étre terminé pour faire cet exercice. "Custom process" permet de lancer un processus avec des arguments (illimité) et d'afficher le résultat.

Choix du menu :
- Calculatrice (Exercice 1)
- Annuaire (Exercice 3)
- Custom process : Permet de lancer un processus avec des arguments et d'afficher le résultat
- Quitter

Nom du script : menu.sh

Exemple de sortie :
```
$> ./menu.sh
1) Calculatrice
2) Annuaire
3) Custom process
4) Quitter
Votre choix :
```
Sortie Option 1:
```
Votre choix : 1
Calcul: 1 + 2
3
```
Sortie Option 3:
```
Votre choix : 3
Nom du process : ls
Argument 1 : -l
Argument 2 : -a
Argument 3 :
--> Résultat de la commande ls -a
. .. file1 file2 file3
--> Process terminé avec code 0
```
Sortie Option 4:
```
Votre choix : 4
Au revoir
```
Si option invalide :
```
Votre choix : 5
Cette option n'est pas disponible
```

Aide : read

## Exercice 3 (8 points)

Créer un script permettant de générer un annuaire téléphonique.
Le script doit permettre de :
- Ajouter un contact (nom, numéro) (id auto incrémenté en reprenant le dernier id + 1) (2 point)
- Supprimer un contact (par id) (2 point)
- Rechercher un contact par nom (**début de nom insensible à la casse**) (3 points)
- Afficher tous les contacts (1 point)
Les données doivent être stockées dans un fichier texte sous la forme :
```
id1;"nom1";numero1
id;"nom2";numero2
```
Le script doit présenté un menu permettant de choisir l'action à effectuer. Le script doit relancer le menu après chaque action sauf si l'option 5 est choisie.

Nom du script : annuaire.sh
Nom du fichier : annuaire.csv

Exemple de sortie :
```
$> ./annuaire.sh
Bienvenue dans l'annuaire
Il y a actuellement 5 contacts
1) Ajouter un contact
2) Supprimer un contact
3) Rechercher un contact
4) Afficher tous les contacts
5) Quitter
Votre choix :
```
Sortie Option 1:
```
Votre choix : 1
Nom : toto
Numéro : 0123456789
Contact ajouté
```
Sortie Option 2:
```
Votre choix : 2
id : 1
Contact supprimé
```
Sortie Option 2 (si id n'existe pas):
```
Votre choix : 2
id : 1
Contact introuvable
```
Sortie Option 3:
```
Votre choix : 3
Nom : to
135) topExoEver
245) toto
// id) nom
```
Sortie Option 4:
```
Votre choix : 4
1) First Contact 0123456789
...
135) topExoEver 0123456789
245) toto 9876543210
// id) nom numero
```
Sortie Option 5:
```
Votre choix : 5
Au revoir
```
Si l'utilisateur entre une option invalide :
```
Votre choix : 6
Cette option n'est pas disponible
```

Aide : grep, cut, wc