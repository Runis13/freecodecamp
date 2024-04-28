#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
($PSQL 'TRUNCATE TABLE games, teams;')

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  TEAM1=$WINNER
  TEAM2=$OPPONENT

  if [[ $TEAM1 != 'winner' ]]
  then
    TEAM1_ID=$($PSQL "select team_id from teams where name='$TEAM1'")
    TEAM2_ID=$($PSQL "select team_id from teams where name='$TEAM2'")

    if [[ -z $TEAM1_ID ]]
    then
      INSERT_TEAM_RESULT1=$($PSQL "insert into teams(name) values('$TEAM1')")
      if [[ $INSERT_TEAM_RESULT1 == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $TEAM1
      fi
    fi 

    if [[ -z $TEAM2_ID ]]
    then
      INSERT_TEAM_RESULT2=$($PSQL "insert into teams(name) values('$TEAM2')")
      if [[ $INSERT_TEAM_RESULT2 == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $TEAM2
      fi
    fi
    TEAM1_ID=$($PSQL "select team_id from teams where name='$TEAM1'")
    TEAM2_ID=$($PSQL "select team_id from teams where name='$TEAM2'") 

    INSERT_RESULT=$($PSQL "insert into games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) values($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS , $TEAM1_ID, $TEAM2_ID)")

    


    
  fi
  
done