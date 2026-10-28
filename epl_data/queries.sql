--- A list of questions I want to answer using the epl matchday dataset, and which queries I used to answer them once I have done so.
--- The dataset contains match data from the English Premier League, from the 2000/2001 to the 2025/2026 seasons.

--- Question 1: Which season has the most total goals?
--- Answer: 2023/2024 season. Using aggregate functions I can group the matches by season, and add the totals of the homegoal and awaygoal columns together.

SELECT season, SUM(awaygoal + homegoal) AS total_goal
FROM epl_match_data
GROUP BY season
ORDER BY total_goal DESC;

--- Question 2: Which team has scored the most goals across all seasons? which has scored the least?
--- This question is much more challenging than the previous one, due to the nature of the table. The home team and away team for each match are recorded in 
--- separate columns, so the query will need to combine these columns into one, and then add together the total home and away goals for each team.
--- Answer: Arsenal have scored the most, Bradford the least. I first created two queries similar to the one used in Question 1, one recording the total home goals,
--- and one recording the total away goals for each team.
--- Using what I learned during week_02 about JOINS, I was then able to combine the two queries into one.

SELECT home.hometeam, (home.total_home + away.total_away) AS total_goals
FROM (
    SELECT Hometeam, SUM(homegoal) AS total_home
    FROM epl_match_data
    GROUP BY hometeam
) AS home
JOIN (
    SELECT awayteam, sum(awaygoal) AS total_away
    FROM epl_match_data
    GROUP BY awayteam
) AS away
ON home.hometeam = away.awayteam
ORDER BY total_goals DESC;

--- Question 3: Which teams have the highest and lowest average goals per game over all seasons?
--- Arsenal have the highest goals tally with 1880, while Bradford have the least with only 30. However, Arsenal have been present in all 26 seasons, so have many more games
--- in which to score their goals than Bradford, who were only in the league for one season.
--- For this query I will need to build on my previous work by also tallying the number of games each team has played, in order to find the average.
--- Answer: Manchester City have the highest average goals, Huddersfield Town the lowest. This reflects how, despite not being in the division at the start of the century, 
--- Man City's takeover in 2008 had a huge effect on their performances.

SELECT 
    home.hometeam, (home.total_home + away.total_away) AS total_goals,
    (home.home_games + away.away_games) AS total_games,
    (home.total_home + away.total_away)/(home.home_games + away.away_games) AS avg_goals
FROM (
    SELECT Hometeam, SUM(homegoal) AS total_home, COUNT(hometeam) AS home_games
    FROM epl_match_data
    GROUP BY hometeam
) AS home
JOIN (
    SELECT awayteam, sum(awaygoal) AS total_away, COUNT(awayteam) AS away_games
    FROM epl_match_data
    GROUP BY awayteam
) AS away
ON home.hometeam = away.awayteam
ORDER BY avg_goals DESC;
