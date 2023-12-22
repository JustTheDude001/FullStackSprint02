DROP DATABASE youtube;
CREATE DATABASE youtube;
USE youtube;

-- Table users:
CREATE TABLE users (
	ID_user int NOT NULL AUTO_INCREMENT,
	email varchar(256) NOT NULL,
	password_sha512 varchar(128) NOT NULL,
	user_name varchar(64) NOT NULL,
	bith_date DATE NOT NULL,
	sex ENUM("male","female","other"),
	country varchar(128),
	postal_code varchar(32),
	
	UNIQUE(ID_user)
	
);


-- Table videos
CREATE TABLE videos(
	ID_video int NOT NULL AUTO_INCREMENT,
	ID_user int NOT NULL,
	title varchar(512),
	description varchar(10000),
	resolution varchar(64),
	file_name varchar(512),
	length_video_s int,
	thumbnail varchar(1024),
	times_played int,
	likes_num int,
	dislikes_num int,
	publication_date TIMESTAMP DEFAULT NOW(),
	
	UNIQUE(ID_video),

	FOREIGN KEY idUser_fk (ID_user)
	REFERENCES users(ID_user)
);

-- Table channels:
CREATE TABLE channels (
	ID_channel int NOT NULL AUTO_INCREMENT,
	ID_user int NOT NULL, 
	name varchar(256) NOT NULL,
	description varchar(10000),
	creation_date TIMESTAMP DEFAULT NOW(),
	
	UNIQUE(ID_channel),

	FOREIGN KEY idUser_fk (ID_user)
	REFERENCES users(ID_user)
	
);


CREATE TABLE labels (
  ID_label int not NULL AUTO_INCREMENT,
  name varchar(126),
  
  UNIQUE(ID_label)

);

CREATE TABLE video_labels(
  ID_video int NOT NULL,
  ID_label int NOT NULL,
  FOREIGN KEY idVideo_fk (ID_video)
  REFERENCES videos(ID_video),
  FOREIGN KEY idLabel_fk (ID_label)
  REFERENCES labels(ID_label)
);


-- Table subscriptions
CREATE TABLE subscriptions (
	ID_user int NOT NULL,
	ID_channel int NOT NULL,
	
	FOREIGN KEY idUser_fk (ID_user)
	REFERENCES users(ID_user),
	FOREIGN KEY idChannel_fk (ID_channel)
	REFERENCES channels(ID_channel)

);


-- Table Likes

CREATE TABLE likes(
 ID_video int NOT NULL,
 ID_user int NOT NULL,
 type_reaction ENUM("like", "dislike"),
 date_reaction TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 
	FOREIGN KEY idUser_fk (ID_user)
	REFERENCES users(ID_user),
	FOREIGN KEY idVideo_fk (ID_video)
	REFERENCES videos(ID_video)
);

-- Table playlists:
CREATE TABLE playlists (
	ID_playlist int NOT NULL AUTO_INCREMENT,
	ID_user int NOT NULL,
	playlist_name varchar(256) NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	state ENUM("public","private"),
	
	UNIQUE(ID_playlist),
	
	FOREIGN KEY idUser_fk (ID_user)
	REFERENCES users(ID_user)
);


-- Table comments:
CREATE TABLE comments (
	ID_comment int NOT NULL AUTO_INCREMENT,
	ID_video int NOT NULL,
	ID_user int NOT NULL,
	comment_text varchar(15000),
	comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	
	UNIQUE(ID_comment),
	FOREIGN KEY idVideo_fk (ID_video)
	REFERENCES videos(ID_video),
	FOREIGN KEY idUser_fk (ID_user)
	REFERENCES users(ID_user)
	
);


-- Table comments likes
CREATE TABLE comments_likes(
	ID_comment int NOT NULL,
	ID_user int NOT NULL,
	type ENUM("like","dislike"),
	reaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY idComment_fk (ID_comment)
	REFERENCES comments(ID_comment),
	FOREIGN KEY idUser_fk (ID_user)
	REFERENCES users(ID_user)
);
