create database NBA_stats;
use NBA_stats;


-- drop table if exists game_Logs;
-- drop table if exists stats;
-- drop table if exists awards;
-- drop table if exists contracts;
-- drop table if exists injuries;
-- drop table if exists players;
-- drop table if exists teams;
-- drop table if exists

create table teams(
team_id int Primary key auto_increment,
team_name varchar(100),
abbreviation varchar(3),
city varchar(50),
arena varchar(100),
conference varchar(20),
division varchar(50)
);

create table players(
player_id int Primary key auto_increment,
player_name varchar(100),
team_id int,
position varchar(20),
season year,
height decimal(4,2),
weight int,
birth_date Date,
college varchar (100),
draft_year year,
draft_position int,
experience int,
nationality varchar(50),
foreign key(team_id) references teams(team_id)
);

create table game_logs(
game_id int primary key auto_increment,
player_id int,
opponent_team_id int,
points int,
rebounds int,
assists int,
blocks int,
steals int,
turnovers int,
mins_played decimal(4,1),
foreign key (player_id) references players(player_id),
foreign key (opponent_team_id) references teams(team_id)
);



create table stats(
stat_id Int primary key auto_increment,
player_id int,
points_per_game decimal(4,2),
rebounds_per_game decimal(4,2),
assists_per_game decimal(4,2),
turnovers_per_game decimal(4,2),
blocks_per_game decimal(4,2),
steals_per_game decimal(4,2),
three_points_attempted_per_game decimal(4,2),
three_point_made_per_game decimal(4,2),
foreign key (player_id) references players(player_id)
);

create table awards(
award_id int primary key auto_increment ,
player_id int,
award_name varchar(100),
season year,
award_desc varchar(1000),
foreign key (player_id) references players(player_id)
);

create table contracts(
contract_id int primary key auto_increment,
player_id int,
team_id int,
season year,
salary decimal(10,2),
contract_length int,
foreign key (player_id) references players(player_id),
foreign key(team_id) references teams(team_id)
);

create table injuries(
injury_id int primary key auto_increment,
player_id int,
injury_type varchar(100),
date_of_injury date,
injury_status varchar(50),
foreign key(player_id) references players(player_id)
);

