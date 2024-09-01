use ipl;
SELECT * FROM ipl.matches;

#Total how many matches played in entire season
select count(id) from matches;

# Finding most MOM awards
select player_of_match, count(player_of_match) as MOM
from matches
group by player_of_match
order by MOM desc limit 5;

#Finding how many super over matches in IPL
select count(super_over) from matches where super_over="y";
select distinctwinner,super_over,venue from matches where super_over="Y";

#how many seasons palyed in entire ipl
select distinct(season) from matches;

#how many matches won by each team in each season
select winner as team,season,count(*) as match_won 
from matches
group by winner,season;

#which team has won by more runs and who got player of the match 
SELECT winner, won_by_runs as won_by_heighest_runs,player_of_match
FROM matches
WHERE won_by_runs = (SELECT MAX(won_by_runs) FROM matches);

#which team has won by more wickets and who got player of the match 
select winner,won_by_wickets as won_by_highest_wickets, player_of_match
from matches
where won_by_wickets= (select max(won_by_wickets) from matches);

#total toss won by each team 
SELECT toss_winner, COUNT(*) as toss_wins
FROM matches
GROUP BY toss_winner;

#highest score in ipl by first batting team
select season,target_runs as highest_score,player_of_match,team1 as team_name
from matches
where target_runs=(select max(target_runs) from matches);

#winner w.r.t batting first
select winner as team,count(*) as matches_won
from matches
where toss_decision="bat"
group by winner;

#winner w.r.t Second first
select winner as team,count(*) as matches_won
from matches
where toss_decision="field"
group by winner;

#No of matches played at each season
select count(*) as matches,season
from matches
group by season;

# no of matches played at each city
SELECT city, COUNT(*) as matches_played
FROM matches
GROUP BY city;

#Most succesful team in IPL
SELECT winner, COUNT(*) as wins
FROM matches
GROUP BY winner
ORDER BY wins DESC limit 5;

#win no of matches by winning toss 
SELECT winner, COUNT(*) as matches_won_after_toss
FROM matches
WHERE toss_winner = winner
GROUP BY winner;

# win probability by winning toss and match
SELECT 
    (SELECT COUNT(*) FROM matches WHERE toss_winner = winner) * 100 / 
    (SELECT COUNT(*) FROM matches) as winning_probability;
    
#Decision after winning toss as bat
select toss_decision ,count(*) as decision_as_batting
from matches
where toss_decision="bat"
group by toss_decision;

#Decision after winning toss as field
select toss_decision ,count(*) as decision_as_batting
from matches
where toss_decision="field"
group by toss_decision;

#top 5 cities where more matches are played
select city ,count(*) as matches_played
from matches
group by city
order by matches_played desc limit 5;
    







