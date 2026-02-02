#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then 
  echo -e "Please provide an element as an argument."
  
else 
  ARG=$1 
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE CAST(atomic_number AS text)='$ARG' OR symbol='$ARG' OR name='$ARG'")
  
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo -e 'I could not find that element in the database.'
  else  
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT type FROM types JOIN properties USING (type_id) JOIN elements USING (atomic_number) WHERE atomic_number=$ATOMIC_NUMBER")
    MELT_P=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    BOIL_P=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT_P celsius and a boiling point of $BOIL_P celsius."
  fi
fi




