#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
GAME() {
  COUNT=0
  RAND_NUM=$((RANDOM%1000+1))
  NUM=0
  echo "Guess the secret number between 1 and 1000:"
  while (( NUM != RAND_NUM )) 
  do 
    read -r NUM
    if ! [[ $NUM =~ ^[0-9]+$ ]]
      then
        echo "That is not an integer, guess again:"
        continue
    fi    

    ((COUNT++))
    if (( NUM > RAND_NUM ))
      then
        echo "It's lower than that, guess again:"
    elif (( NUM < RAND_NUM ))
      then
        echo "It's higher than that, guess again:"
    else
      $PSQL "update players set games_played=games_played+1 where player_id=$1" > /dev/null
      BEST_GAME=$($PSQL "select best_game from players where player_id=$1")
      echo "You guessed it in $COUNT tries. The secret number was $RAND_NUM. Nice job!"
      if [[ -z $BEST_GAME ]] || (( COUNT < BEST_GAME ))
        then
          $PSQL "update players set best_game=$COUNT where player_id=$1" > /dev/null
      fi
      break
    fi  
    
  done
}
echo "Enter your username:"
read -r NAME
ID=$($PSQL "select player_id from players where username='$NAME'")
if [[ -z $ID ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  $PSQL "insert into players(username, games_played) values('$NAME', 0)" > /dev/null
  ID=$($PSQL "select player_id from players where username='$NAME'")
  GAME $ID
else
  GAME_P=$($PSQL "select games_played from players where player_id=$ID")
  BEST_G=$($PSQL "select best_game from players where player_id=$ID")
  echo "Welcome back, $NAME! You have played $GAME_P games, and your best game took $BEST_G guesses."
  GAME $ID
fi  