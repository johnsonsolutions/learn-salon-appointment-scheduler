#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ My Salon ~~~~~"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome to My Salon, how can I help you?"
  echo -e "\n1) cut\n2) color\n3) perm\n4) Exit"
  read MAIN_MENU_SELECTION
  case $MAIN_MENU_SELECTION in
    1) ACTIVITY 1 ;;
    2) ACTIVITY 2 ;;
    3) ACTIVITY 3 ;;
    4) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?";;
  esac
}

ACTIVITY()
{
  SERVICE_ID_SELECTED=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$PHONE_NUMBER'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_RESULT=$($PSQL "insert into customers(phone, name) values('$PHONE_NUMBER', '$CUSTOMER_NAME')")
  else
    CUSTOMER_NAME=$($PSQL "select name from customers where customer_id='$CUSTOMER_ID'")
  fi

  SERVICE=$($PSQL "select name from services where service_id='$SERVICE_ID_SELECTED'")
  echo -e "\nWhat time would you like your$SERVICE, $CUSTOMER_NAME?"
  read SERVICE_TIME
  TIME_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values('$CUSTOMER_ID', $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
  MAIN_MENU "I have put you down for a$SERVICE at $SERVICE_TIME,$CUSTOMER_NAME."

}

EXIT(){
  echo -e "\nThank you for stopping in.\n"
}


MAIN_MENU
