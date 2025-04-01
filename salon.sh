#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ My Salon ~~~~~\n"

SERVICE=NULL
SERVICE_ID_SELECTED=NULL
SERVICE_TIME=NULL
CUSTOMER_NAME=NULL
CUSTOMER_ID=NULL
CUSTOMER_PHONE=NULL

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  say "Welcome to My Salon how can I help you?"
  echo -e "\n\n1. Cut\n2. Color\n3. Perm\n4. Exit"
  read MAIN_MENU_SELECTION
  case $MAIN_MENU_SELECTION in
    1) CUT_MENU ;;
    2) COLOR_MENU ;;
    3) PERM ;;
    4) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?";;
  esac
}
CUT_MENU(){
  SCHEDULE
  MAIN_MENU
}
COLOR_MENU(){
  prompt ""
    MAIN_MENU
}
PERM_MENU(){
  echo -e "\n You made the cut menu"
  MAIN_MENU
}
  SCHEDULE(){
  prompt "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select ")
  if [[ -z   ]]
  then
    prompt "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
  fi

  prompt "What time would you like your cut, Fabio?"
  read SERVICE_TIME

  MAIN_MENU "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}

EXIT(){
  echo -e "\nThank you for stopping in.\n"
}

say(){
    if [[ $1 ]]
  then
    echo -e "\n\n$1\n"
  fi
}
prompt(){
    if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi
}

MAIN_MENU
