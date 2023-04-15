#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER_NAME

DATA_REQUEST=$($PSQL "SELECT user_name, game_played, best_game FROM storage WHERE user_name = '$USER_NAME'")
if [[ -z $DATA_REQUEST ]]
then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  QUERY=$($PSQL "INSERT INTO storage(user_name, game_played, best_game) VALUES('$USER_NAME', 0, 0)")
else
  IFS="|" read USER_NAME GAME_PLAYED BEST_GAME <<< $DATA_REQUEST
  echo "Welcome back, $USER_NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo -e "\nGuess the secret number between 1 and 1000:"

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0


while [[ $USER_NUMBER -ne $SECRET_NUMBER ]];
do
  read USER_NUMBER
  if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    ((NUMBER_OF_GUESSES++))
    if [[ $USER_NUMBER -lt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $USER_NUMBER -gt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
  fi
done

if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME || $BEST_GAME -eq 0 ]]
then
  QUERY=$($PSQL "UPDATE storage SET best_game = $NUMBER_OF_GUESSES, game_played = $GAME_PLAYED+1 WHERE user_name = '$USER_NAME'")
else
  QUERY=$($PSQL "UPDATE storage SET game_played = $GAME_PLAYED+1 WHERE user_name = '$USER_NAME'")
fi
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"