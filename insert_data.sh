#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

#echo -e "\nClear ALL TABLES"
echo $($PSQL "TRUNCATE teams, games RESTART IDENTITY CASCADE")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # запрос АЙДИ команд
    WIN_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPP_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    if [[ -z $WIN_ID ]]
    then
    # create new command
      INSERT_COMAND=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WIN_ID=$($PSQL "select team_id from teams where name='$WINNER'")
      #echo -e "New command add: $WINNER ID: $WIN_ID"
    fi
    if [[ -z $OPP_ID ]]
    then
    # create new command
      INSERT_COMAND=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPP_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
      #echo -e "New command add: $OPPONENT ID: $OPP_ID"
    fi
  
    # добавление записи в ТАБЛИЦУ ИГР
    INSERT_RECORD=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    #echo  $INSERT_RECORD
  fi
done

  

