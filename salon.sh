#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e '\n~~~~~ MY SALON ~~~~~'
MAIN_MENU() {
  if [[ -n $1 ]]
  then
    printf "\n%s\n\n" "$1"
  fi
  printf "1) cut\n"
  printf "2) color\n"
  printf "3) perm\n"
  printf "4) style\n"
  printf "5) trim\n"
  read SERVICE_ID_SELECTED
}   
RECORD() {
  SERVICE_ID=$1
  #new record
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # number not found
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
  # add new customers
    ADD_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  # take a timeeee
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
  echo -e "\nWhat time would you like your $2,$CUSTOMER_NAME?"
  read SERVICE_TIME

  # add appointments
  ADD_APP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $2 at $SERVICE_TIME,$CUSTOMER_NAME."

}
MENU_MESSAGE='Welcome to My Salon, how can I help you?'
while true
do
  MAIN_MENU "$MENU_MESSAGE"
  MENU_MESSAGE=""
  case $SERVICE_ID_SELECTED in
    1) RECORD 1 'cut'; break ;;
    2) RECORD 2 'color'; break ;;
    3) RECORD 3 'perm'; break ;;
    4) RECORD 3 'style'; break ;;
    5) RECORD 3 'trim'; break ;;
    *) MENU_MESSAGE="I could not find that service. What would you like today?" ;;
  esac
done