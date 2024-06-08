#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=usernames -t --no-align -c"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Check if username exists in the database
USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")

# If user doesn't exist
if [[ -z $USER_INFO ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user into the database
  RESULTADO=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  GAMES_PLAYED=0
  BEST_GAME=1000
else
  # Extract user information
  IFS='|' read USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Randomly generate a secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"

# Start guessing loop
while true; do
  read GUESS

  # Check if the input is an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  GUESSES=$((GUESSES + 1))

  # Compare the guess to the secret number
  if (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  elif (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  else

    NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))
    if (( GUESSES < BEST_GAME )); then
      NEW_BEST_GAME=$GUESSES
    else
      NEW_BEST_GAME=$BEST_GAME
    fi

    RESULTADO=$($PSQL"UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$NEW_BEST_GAME WHERE username='$USERNAME'")

    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi


done



