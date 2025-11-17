#! /bin/bash

function display_menu() {
  echo "1) Calculatrice"
  echo "2) Annuaire"
  echo "3) Custom process"
  echo "4) Quitter"   
}

function do_calc() {
  local OPERATION

  echo -n "Calcul: "
  read OPERATION
  ./calc.sh "$OPERATION"
}

function do_annuaire() {
  ./annuaire.sh
}

function do_process() {
   local INDEX
   local VALUE
   local OPTIONS
   local CMD_NAME

   read -p "Nom du process : " CMD_NAME
   OPTIONS=()
   INDEX=0
   VALUE=" "
   while true; do
     read -p "Argument "$(($i+1))" : " VALUE
     if [[ ! -z "$VALUE" ]]; then
        OPTIONS[$i]=$VALUE;
        i=$(($i+1));
     else
        break 
     fi
   done
   echo "--> Résultat de la commande "$CMD_NAME ${OPTIONS[@]}
   $CMD_NAME ${OPTIONS[@]}
   echo "--> Process terminé avec code "$?  
}

CHOICE=0
while [[ $CHOICE -ne 4 ]]; do
   display_menu
   read -p "Votre choix : " CHOICE      
   case $CHOICE in
      1) do_calc;;
      2) do_annuaire;;
      3) do_process;;
      4) echo "Au revoir";;
      *) echo "Cette option n'est pas disponible";;
   esac
done
