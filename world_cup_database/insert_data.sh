#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
  # not in team_id
  NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    
    if [[ -z $NAME ]]
    then
    #insert team_id
      echo $($PSQL "INSERT INTO teams(name)VALUES('$WINNER')")
    else [[ $WINNER != $NAME ]]
      echo $($PSQL "INSERT INTO teams(name)VALUES('$WINNER')")
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
   # not in name
   NOT_IN_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")

    if [[ -z $NOT_IN_NAME ]]
    then
      #insert opponent
      echo $($PSQL "INSERT INTO teams(name)VALUES('$OPPONENT')")
    fi
  fi

  
done
