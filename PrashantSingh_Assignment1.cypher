//Adding career runs and wickets for batsman and bowlers respectively

MATCH (p:PLAYER)-[r:PLAYS_FOR]->(t:TEAM)
WHERE p.role IN ['Batsman', 'Batswoman', 'Allrounder']
SET r.career_runs = toInteger(5000 + rand() * 5000)  // Random runs between 5000-10000
RETURN p.name, p.role, t.name, r.career_runs;

MATCH (p:PLAYER)-[r:PLAYS_FOR]->(t:TEAM)
WHERE p.role = 'Bowler'
SET r.career_wickets = toInteger(200 + rand() * 300)  // Random wickets between 200-500
RETURN p.name, p.role, t.name, r.career_wickets;

//Adding one more property as rating
MATCH (p:PLAYER)
SET p.rating = 90 + rand() * 10
RETURN p.name, p.rating;

//All Players Except Indian Players
MATCH (player:PLAYER)-[:PLAYS_FOR]->(team:TEAM)  
WHERE team.name <> "India"  
RETURN player;

//All Players who are all rounders or bowlers
MATCH (player:PLAYER) 
WHERE NOT (player.role='Batsman' or player.role='Batswoman')
RETURN player

//Assigning  India A new coach
MATCH (t:TEAM {name: "India"})  
SET t.coach = "Gautam Gambhir"  
RETURN t.name, t.coach;

//Batsman who having rating more than 95
MATCH (player:PLAYER)  
WHERE player.rating > 95 AND player.role = "Batsman"  
RETURN player;


//Batsman who having rating more than 95
MATCH (player:PLAYER)  
WHERE player.rating > 95 AND player.role = "Batsman"  
RETURN player;


//Career Wickets of bowler 
MATCH (p:PLAYER)-[r:PLAYS_FOR]->(t:TEAM)
WHERE p.role = 'Bowler'
RETURN p.name, p.role, t.name, r.career_wickets
ORDER BY r.career_wickets DESC;


//Carrer Runs of batsman, allrounder
MATCH (p:PLAYER)-[r:PLAYS_FOR]->(t:TEAM)
WHERE p.role IN ['Batsman', 'Batswoman', 'Allrounder']
RETURN p.name, p.role, t.name, r.career_runs
ORDER BY r.career_runs DESC;

CREATE
(virat:PLAYER{name:"Virat Kohli", age: 35, role:"Batsman", batting_style:"Right-hand", bowling_style:"Right-arm medium"}),
(rohit:PLAYER{name:"Rohit Sharma", age: 36, role:"Batsman", batting_style:"Right-hand", bowling_style:"Off-spin"}),
(bumrah:PLAYER{name:"Jasprit Bumrah", age: 30, role:"Bowler", batting_style:"Right-hand", bowling_style:"Right-arm fast"}),
(smith:PLAYER{name:"Steve Smith", age: 34, role:"Batsman", batting_style:"Right-hand", bowling_style:"Leg-spin"}),
(star:PLAYER{name:"Mitchell Starc", age: 33, role:"Bowler", batting_style:"Left-hand", bowling_style:"Left-arm fast"}),
(kane:PLAYER{name:"Kane Williamson", age: 34, role:"Batsman", batting_style:"Right-hand", bowling_style:"Off-spin"}),
(trent:PLAYER{name:"Trent Boult", age: 34, role:"Bowler", batting_style:"Right-hand", bowling_style:"Left-arm fast"}),
(root:PLAYER{name:"Joe Root", age: 34, role:"Batsman", batting_style:"Right-hand", bowling_style:"Off-spin"}),
(archer:PLAYER{name:"Jofra Archer", age: 30, role:"Bowler", batting_style:"Right-hand", bowling_style:"Right-arm fast"}),
(babar:PLAYER{name:"Babar Azam", age: 30, role:"Batsman", batting_style:"Right-hand", bowling_style:"Right-arm off-break"}),
(shaheen:PLAYER{name:"Shaheen Afridi", age: 28, role:"Bowler", batting_style:"Left-hand", bowling_style:"Left-arm fast"}),
(smith_s:PLAYER{name:"Smriti Mandhana", age: 28, role:"Batswoman", batting_style:"Left-hand", bowling_style:"Off-spin"}),
(warner:PLAYER{name:"David Warner", age: 37, role:"Batsman", batting_style:"Left-hand", bowling_style:"Leg-spin"}),
(stokes:PLAYER{name:"Ben Stokes", age: 33, role:"All-rounder", batting_style:"Left-hand", bowling_style:"Right-arm fast"}),
(kusal:PLAYER{name:"Kusal Perera", age: 34, role:"Batsman", batting_style:"Left-hand", bowling_style:"Off-spin"}),
(ngidi:PLAYER{name:"Lungi Ngidi", age: 29, role:"Bowler", batting_style:"Right-hand", bowling_style:"Right-arm fast"}),
(de_kock:PLAYER{name:"Quinton de Kock", age: 31, role:"Batsman", batting_style:"Left-hand", bowling_style:"Wicketkeeper"}),
(kieron:PLAYER{name:"Kieron Pollard", age: 36, role:"All-rounder", batting_style:"Right-hand", bowling_style:"Right-arm medium"}),
(rashid:PLAYER{name:"Rashid Khan", age: 26, role:"Bowler", batting_style:"Right-hand", bowling_style:"Leg-spin"}),
(shakib:PLAYER{name:"Shakib Al Hasan", age: 36, role:"All-rounder", batting_style:"Left-hand", bowling_style:"Left-arm orthodox"}),
(mushfiq:PLAYER{name:"Mushfiqur Rahim", age: 36, role:"Batsman", batting_style:"Right-hand", bowling_style:"Wicketkeeper"}),
(mustafiz:PLAYER{name:"Mustafizur Rahman", age: 29, role:"Bowler", batting_style:"Left-hand", bowling_style:"Left-arm fast"}),

(india:TEAM{name:"India", country:"India", coach:"Rahul Dravid"}),
(pakistan:TEAM{name:"Pakistan", country:"Pakistan", coach:"Grant Bradburn"}),
(bangladesh:TEAM{name:"Bangladesh", country:"Bangladesh", coach:"Chandika Hathurusingha"}),
(australia:TEAM{name:"Australia", country:"Australia", coach:"Andrew McDonald"}),
(newzealand:TEAM{name:"New Zealand", country:"New Zealand", coach:"Gary Stead"}),
(southafrica:TEAM{name:"South Africa", country:"South Africa", coach:"Mark Boucher"}),
(westindies:TEAM{name:"West Indies", country:"West Indies", coach:"Phil Simmons"}),

(rahul:COACH{name:"Rahul Dravid", nationality:"India", experience: 5}),
(grant:COACH{name:"Grant Bradburn", nationality:"New Zealand", experience: 7}),
(chandika:COACH{name:"Chandika Hathurusingha", nationality:"Sri Lanka", experience: 10}),
(andrew:COACH{name:"Andrew McDonald", nationality:"Australia", experience: 6}),
(gary:COACH{name:"Gary Stead", nationality:"New Zealand", experience: 8}),
(mark:COACH{name:"Mark Boucher", nationality:"South Africa", experience: 9}),
(phil:COACH{name:"Phil Simmons", nationality:"West Indies", experience: 11}),

(virat)-[:PLAYS_FOR {salary: 2000000, matches: 270}]->(india),
(rohit)-[:PLAYS_FOR {salary: 1800000, matches: 240}]->(india),
(bumrah)-[:PLAYS_FOR {salary: 1500000, matches: 150}]->(india),
(msdhoni)-[:PLAYS_FOR {salary: 2500000, matches: 350}]->(india),
(smith)-[:PLAYS_FOR {salary: 2200000, matches: 250}]->(australia),
(star)-[:PLAYS_FOR {salary: 2100000, matches: 150}]->(australia),
(kane)-[:PLAYS_FOR {salary: 2000000, matches: 230}]->(newzealand),
(trent)-[:PLAYS_FOR {salary: 1800000, matches: 200}]->(newzealand),
(root)-[:PLAYS_FOR {salary: 1900000, matches: 240}]->(england),
(archer)-[:PLAYS_FOR {salary: 1700000, matches: 120}]->(england),
(babar)-[:PLAYS_FOR {salary: 1700000, matches: 200}]->(pakistan),
(shaheen)-[:PLAYS_FOR {salary: 1600000, matches: 140}]->(pakistan),
(warner)-[:PLAYS_FOR {salary: 2100000, matches: 290}]->(australia),
(stokes)-[:PLAYS_FOR {salary: 2000000, matches: 270}]->(england),
(kusal)-[:PLAYS_FOR {salary: 1500000, matches: 210}]->(sri_lanka),
(ngidi)-[:PLAYS_FOR {salary: 1600000, matches: 130}]->(southafrica),
(de_kock)-[:PLAYS_FOR {salary: 1800000, matches: 220}]->(southafrica),
(kieron)-[:PLAYS_FOR {salary: 2000000, matches: 180}]->(westindies),
(rashid)-[:PLAYS_FOR {salary: 1500000, matches: 150}]->(afghanistan),
(shakib)-[:PLAYS_FOR {salary: 1600000, matches: 280}]->(bangladesh),
(mushfiq)-[:PLAYS_FOR {salary: 1400000, matches: 260}]->(bangladesh),
(mustafiz)-[:PLAYS_FOR {salary: 1500000, matches: 230}]->(bangladesh),

(rahul)-[:COACHES_FOR]->(india),
(grant)-[:COACHES_FOR]->(pakistan),
(chandika)-[:COACHES_FOR]->(bangladesh),
(andrew)-[:COACHES_FOR]->(australia),
(gary)-[:COACHES_FOR]->(newzealand),
(mark)-[:COACHES_FOR]->(southafrica),
(phil)-[:COACHES_FOR]->(westindies),

(virat)-[:TEAMMATES]->(rohit),
(rohit)-[:TEAMMATES]->(bumrah),
(msdhoni)-[:TEAMMATES]->(virat),
(smith)-[:TEAMMATES]->(star),
(star)-[:TEAMMATES]->(smith),
(kane)-[:TEAMMATES]->(trent),
(trent)-[:TEAMMATES]->(kane),
(root)-[:TEAMMATES]->(archer),
(archer)-[:TEAMMATES]->(root),
(babar)-[:TEAMMATES]->(shaheen),
(shaheen)-[:TEAMMATES]->(babar),
(warner)-[:TEAMMATES]->(stokes),
(stokes)-[:TEAMMATES]->(warner),
(kusal)-[:TEAMMATES]->(shakib),
(shakib)-[:TEAMMATES]->(kusal),
(ngidi)-[:TEAMMATES]->(de_kock),
(de_kock)-[:TEAMMATES]->(ngidi),
(kieron)-[:TEAMMATES]->(rashid),
(rashid)-[:TEAMMATES]->(kieron),

(virat)-[:PLAYED_AGAINST {runs: 85, balls: 60, wickets: 0}]->(pakistan),
(rohit)-[:PLAYED_AGAINST {runs: 120, balls: 98, wickets: 0}]->(pakistan),
(babar)-[:PLAYED_AGAINST {runs: 45, balls: 55, wickets: 0}]->(india),
(shakib)-[:PLAYED_AGAINST {runs: 60, balls: 40, wickets: 2}]->(india),
(star)-[:PLAYED_AGAINST {runs: 100, balls: 80, wickets: 1}]->(india),
(smith)-[:PLAYED_AGAINST {runs: 75, balls: 55, wickets: 0}]->(india),
(root)-[:PLAYED_AGAINST {runs: 110, balls: 85, wickets: 0}]->(pakistan),
(archer)-[:PLAYED_AGAINST {runs: 40, balls: 35, wickets: 2}]->(india),
(bumrah)-[:PLAYED_AGAINST {runs_conceded: 35, overs: 10, wickets: 3}]->(pakistan),
(shakib)-[:PLAYED_AGAINST {runs_conceded: 45, overs: 9, wickets: 2}]->(india),
(rashid)-[:PLAYED_AGAINST {runs_conceded: 60, overs: 8, wickets: 4}]->(india),
(stokes)-[:PLAYED_AGAINST {runs_conceded: 50, overs: 8, wickets: 2}]->(australia);

//Deleting Previous Indian Coach
MATCH(Dravid {name: "Rahul Dravid"})
DETACH DELETE Dravid

//Giving index to every players

MATCH (p:PLAYER)
WITH p ORDER BY p.name 
WITH collect(p) AS players
UNWIND range(0, size(players) - 1) AS index
WITH players[index] AS player, index + 1 AS player_id
SET player.player_id = player_id
RETURN player.name, player.player_id;

MATCH (t:TEAM {name: "India"})  
SET t.coach = "Gautam Gambhir"  
RETURN t.name, t.coach;

match(n) return n

//Players apart from rohit sharma
MATCH (player:PLAYER) 
WHERE player.name <> "Rohit Sharma"
RETURN player

//Players of team Australia
MATCH (p:PLAYER)-[:PLAYS_FOR]->(t:TEAM{name: 'Australia'})  
RETURN p.name;


//Properties of node Player
MATCH (p:PLAYER) 
RETURN p, properties(p) AS all_properties 


//Removing Current Coach of India
MATCH (t:TEAM {name: "India"})  
SET t.coach = NULL  


//Top 5 players with Most Number of matches

MATCH (p:PLAYER)-[r:PLAYS_FOR]->(t:TEAM)  
RETURN p.name as Player, SUM(r.matches) AS total_matches_played  
ORDER BY total_matches_played DESC  
LIMIT 5;

//Total Runs scored by players
MATCH (player:PLAYER)-[gamePlayed:PLAYED_AGAINST]->(team:TEAM)
RETURN player.name, SUM(gamePlayed.runs) AS total_runs
ORDER BY total_runs DESC;