DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL
);

CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INT REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL,
    match_id INT NOT NULL
);

CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players ON DELETE CASCADE,
    match_id INT NOT NULL
);

CREATE TABLE rankings (
    ranking_id SERIAL PRIMARY KEY,
    team_id INT REFERENCES teams ON DELETE CASCADE,
    match_id INT NOT NULL,
    result TEXT NOT NULL
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams ON DELETE CASCADE,
    away_team_id INT REFERENCES teams ON DELETE CASCADE,
    season_id INT REFERENCES seasons ON DELETE CASCADE,
    referee_id INT REFERENCES referees ON DELETE CASCADE
);


-- SELECT * FROM matches m
--     JOIN teams ON match_id=team_id
--     JOIN seasons s ON match_id=s.season_id
--     JOIN players p ON match_id=p.player_id
--     JOIN referees r ON m.referee_id=r.referee_id
--     JOIN goals g ON m.match_id= g.goal_id
--     JOIN rankings rank ON m.match_id=rank.ranking_id;