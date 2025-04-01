#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

$($PSQL "")
tres1=$($PSQL "TRUNCATE customers")
tres2=$($PSQL "truncate appointments")
clear
