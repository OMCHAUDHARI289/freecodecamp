#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate tables to start fresh
$PSQL "TRUNCATE TABLE games, teams;"

# Read the CSV file (skip header) and insert teams
cat games.csv | tail -n +2 | while IFS=',' read year round winner opponent winner_goals opponent_goals
do
  # Insert winner team if not already in database
  INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$winner') ON CONFLICT DO NOTHING;")
  # Insert opponent team if not already in database
  INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$opponent') ON CONFLICT DO NOTHING;")
done

# Read the CSV file again and insert games
cat games.csv | tail -n +2 | while IFS=',' read year round winner opponent winner_goals opponent_goals
do
  # Get the winner_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
  # Get the opponent_id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
  # Insert the game
  INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);")
done
