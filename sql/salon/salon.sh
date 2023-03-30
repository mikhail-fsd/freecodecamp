#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICE_MENU() {

if [[ -z $1 ]]
then
  echo -e "Welcome to My Salon, how can I help you?\n"
else
  echo -e "\n$1"
fi
SERVICES=$($PSQL "SELECT * FROM services")
echo "$SERVICES" | while read NUM BAR NAME
do
  echo "$NUM) $NAME"
done

READ_CHOICE
}

READ_CHOICE() {
read SERVICE_ID_SELECTED
# take service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

# if service id provide servive name
if [[ -z $SERVICE_NAME ]]
then
  SERVICE_MENU "I could not find that service. What would you like today?"
else
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # take customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/^ //')
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # insert appointment
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}

SERVICE_MENU
