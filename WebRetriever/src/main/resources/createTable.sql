drop table if exists `t_game_info`;
CREATE TABLE t_game_info
(
    id int PRIMARY KEY AUTO_INCREMENT,
    title varchar (255) DEFAULT '' NOT NULL,
    originTitle varchar (255) DEFAULT '' NOT NULL,
    url varchar (1024) DEFAULT '' NOT NULL,
    imageUrl varchar (1024),
    summary varchar (1024) DEFAULT '' NOT NULL
);

drop table if exists `t_game_platform`;
CREATE TABLE t_game_platform
(
    id int PRIMARY KEY AUTO_INCREMENT,
    gameId int NOT NULL,
    platformId int NOT NULL
);

drop table if exists `t_platform_info`;
CREATE TABLE t_platform_info
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(63) DEFAULT '' NOT NULL
);

drop table if exists `t_game_dev`;
CREATE TABLE t_game_dev
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    gameId INT NOT NULL,
    devId INT NOT NULL
);

drop table if exists `t_game_pub`;
CREATE TABLE t_game_pub
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    gameId INT NOT NULL,
    pubId INT NOT NULL
);

drop table if exists `t_dev_info`;
CREATE TABLE t_dev_info
(
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar (255) DEFAULT '' NOT NULL,
    url varchar (1024)
);

drop table if exists `t_game_genres`;
CREATE TABLE t_game_genres
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    gameId INT NOT NULL,
    genresId INT NOT NULL
);

drop table if exists `t_genres_info`;
CREATE TABLE t_genres_info
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) DEFAULT '' NOT NULL
);

insert into t_platform_info (name) value ('PC');
insert into t_platform_info (name) value ('PS');
insert into t_platform_info (name) value ('PS2');
insert into t_platform_info (name) value ('PS3');
insert into t_platform_info (name) value ('PS4');
insert into t_platform_info (name) value ('Vita');
insert into t_platform_info (name) value ('XBox One');
insert into t_platform_info (name) value ('XBox 360');
insert into t_platform_info (name) value ('XBox');
insert into t_platform_info (name) value ('Wii');
insert into t_platform_info (name) value ('Wii U');
insert into t_platform_info (name) value ('DS');
insert into t_platform_info (name) value ('3DS');