#! /bin/bash

SERVICES=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT service_id, name FROM services ORDER BY service_id")
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

display_services() {

    echo "$SERVICES" | while IFS='|' read -r SERVICE_ID NAME; do
      SERVICE_ID=$(echo $SERVICE_ID | xargs)
      NAME=$(echo $NAME | xargs)
      echo "$SERVICE_ID) $NAME"
    done
}


while true; do
    display_services

    read SERVICE_ID_SELECTED

    VALID_SERVICE=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")


    if [[ $VALID_SERVICE -eq 0 ]]; then
        echo -e "\nI could not find that service. What would you like today?"
    else

        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        EXISTING_PHONE=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")

        if [[ -z "$EXISTING_PHONE" ]]; then
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME
          INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
        else
          CUSTOMER_NAME=$EXISTING_PHONE
        fi


        echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
        read SERVICE_TIME

        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")

        INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(time, customer_id, service_id) values('$SERVICE_TIME', $CUSTOMER_ID, $VALID_SERVICE)")

        SERVICE_NAME=$($PSQL "select name from services where service_id = $VALID_SERVICE")

        echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."



        break
    fi
done