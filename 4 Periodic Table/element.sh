#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"



if [[ -z $1 ]] 
then
    echo Please provide an element as an argument.
else



  if [[ $1 =~ ^[0-9]+$ ]]; then
      atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
  else
      atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
  fi

  if [ -z "$atomic_number" ]; then
      echo I could not find that element in the database.
  else





    element_info=$($PSQL "SELECT elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements JOIN properties ON elements.atomic_number = properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number = $atomic_number")

    IFS='|' read -r name symbol type atomic_mass melting_point boiling_point <<< "$element_info"


    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."

fi
fi