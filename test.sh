#! /bin/bash

# mon comment

# set -xe

echo "Bonjour le monde"

touch titi

mkdir -p test/{1..50}

echo "Waiting 50sec"
#sleep 50

rm -rf titi test
echo "Clean "`pwd`

env

### Variables
VAR1=toto
VAR2=3
# VAR3 = "coucou"    PAS D'ESPACES
# VAR3= coucou       PAS D'ESPACES
VAR3=" coucou"
echo VAR1=$VAR1 
echo Contenance ${VAR2}L
echo "***"${VAR3}"****"

echo "*"${DEBUG=1}"*"
echo "**"${FILE// /_}"**"

#### Variables spéciales

echo "ARGV"
echo $0 => nom du process
echo $1 ... $9 => arguments

#shift # shift les arguments $2 => $1 $3 => $2 ...

echo $* => liste tous les arguments sous le format STRING
echo $@ => liste tous les arguments sous le format ARRAY
echo $# => récupère le nombre d\'arguments

echo Variables process
echo $? => donne le code retour de la dernière commande jouée
echo $$ => donne le PID du process en cours \(ici test.sh\)
echo $! => donne le PID du dernier process lancé

## Blocs de structures

### Conditions

echo test 0 -ne 1

if [ 1 -ne $1 ]; then
  echo "\$1 != 1"
elif [ 2 -ne $2 ]; then
  echo "\$2 != 2"
else
  echo "\$1 == 1 && \$2 == 2"
fi


case "$VAR4" in
   add)
      echo "Add operation"
      echo "1 + 3 => "$(( 1+3 )) ;;
   sub)
      echo "Sub operation" 
      echo "1 - 3 => "$(( 1-3 )) ;;
   *) echo "Operation not supported" ;;
esac

### Iterations

for ((i=0; $i < 10; i = $i + 1)); do
  echo "line $i"
done

MY_LIST=("fork" "plate" "knife")

for item in ${MY_LIST[@]}; do
   echo $item;
done

for ((i=0; $i < ${#MY_LIST[@]}; i = $i + 1)); do
  echo "line ${MY_LIST[$i]}"
done

i=0
while [ $i -lt 10 ]; do
  echo "while" $i
  i=$(( $i + 1))
done

i=0
until [ $i -gt 10 ]; do
  echo "until" $i
  i=$(( $i + 1))
done

### Functions
CURRENT_INDENT=0

function display() {
  for ((i=0; i< $CURRENT_INDENT; i=$i+1)); do echo -n ' '; done
  echo $*
}

display_indent() {
 local INDENT
 INDENT=4
 CURRENT_INDENT=$(($CURRENT_INDENT+$INDENT))
 display $*
}

echo $CURRENT_INDENT
display coucou je vais très très très bien

display_indent "Tu es sûre? il y a beaucoup de \"très\" dans ta phrase"
echo $CURRENT_INDENT
echo $INDENT

display_indent "Tu t'es pris pour mon psy ?"
echo $CURRENT_INDENT
echo $INDENT


#### Sous-Shell
VALUE=$(pwd)
echo $?
echo $VALUE

VALUE=`pwd`
echo $?
echo $VALUE

a=10
VALUE=$(($a*3))
echo $?
echo $VALUE
