#! /bin/bash

function display_menu() {
echo "Bienvenue dans l'annuaire"
echo "Il y a actuellement "$(wc -l ./annuaire.csv | cut -w -f2)" contacts"
echo "1) Ajouter un contact"
echo "2) Supprimer un contact"
echo "3) Rechercher un contact"
echo "4) Afficher tous les contacts"
echo "5) Quitter"
}

function format_line() {
   local TO_PRINT
   TO_PRINT=()
   LINE=$1
   TO_PRINT[0]="$(echo $LINE | cut -d ';' -f1))"
   NAME=$(echo $LINE | cut -d ';' -f2)
   TO_PRINT[1]=${NAME//\"/}
   if [[ "$2" ]]; then
       TO_PRINT[2]=$(echo $LINE | cut -d ';' -f3)
   fi
   echo ${TO_PRINT[@]}
}

function do_search() {
   read -p "Nom : " NAME
   RESULT=$(grep -i ";\"$NAME" annuaire.csv)
   for LINE in $RESULT; do
     format_line "$LINE"
   done
}

function do_add() {
   local ID
   local NAME
   local PHONE
   read -p "Nom : " NAME
   read -p "Numéro : " PHONE
   if [[ -s "annuaire.csv" ]]; then
     LAST_LINE=$(tail -n1 annuaire.csv)
     LAST_ID=$(echo $LAST_LINE | cut -d ';' -f1)
     ID=$(($LAST_ID + 1))
   else
     ID=0
   fi
   echo "$ID;\"$NAME\";$PHONE" >> annuaire.csv
   echo "Contact ajouté"
}

function do_list() {
  #  IFS=";" permet de déterminer le séparateur des boucles sur une STRING
  for LINE in $(cat ./annuaire.csv); do
     format_line "$LINE" true
  done
}

function do_delete() {
   local ID
   read -p "ID : " ID
   grep -v "$ID;" annuaire.csv > temp
   mv temp  annuaire.csv
   echo "Contact supprimé"
}

if [[ ! -f "annuaire.csv"  ]]; then
   touch annuaire.csv
fi

CHOICE=0
while [[ $CHOICE -ne 5 ]]; do
   display_menu
   read -p "Votre choix : " CHOICE      
   case $CHOICE in
      1) do_add;;
      2) do_delete;;
      3) do_search;;
      4) do_list;;
      5) echo "Au revoir";;
      *) echo "Cette option n'est pas disponible";;
   esac
done
