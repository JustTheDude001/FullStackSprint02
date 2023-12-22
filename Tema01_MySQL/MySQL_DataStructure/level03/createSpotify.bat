
DROP DATABASE spotify;
-- Spotify Database
CREATE DATABASE spotify;

USE spotify;

-- Users Table
CREATE TABLE users(
	ID_user int NOT NULL AUTO_INCREMENT,
	email varchar(256),
	password_sha512 varchar(512),
	name_user varchar(256),
	birth_data TIMESTAMP,
	sex ENUM("male","female","other"),
	country varchar(256),
	postal_code varchar(128),
	user_type ENUM("free", "premium"),
	
	UNIQUE(ID_user)
	
);



CREATE TABLE creditcards(
  ID_creditcard int NOT NULL AUTO_INCREMENT,
  card_number varchar(64),
  expire_month varchar(4),
  expire_year varchar(6),
  security_code varchar(16),
  
  UNIQUE(ID_creditcard)
);


CREATE TABLE paypals (
  ID_paypal int NOT NULL AUTO_INCREMENT,
  paypap_username varchar(256),
  
  UNIQUE(ID_paypal)
);


CREATE TABLE subscription(
  ID_subscription INT NOT NULL AUTO_INCREMENT,
  ID_user int NOT NULL,
  begin_date TIMESTAMP,
  renew_date TIMESTAMP,
  payment_method ENUM("credit_card", "paypal"),
  ID_creditcard int,
  ID_paypal int,
  
  UNIQUE(ID_subscription),
  FOREIGN KEY user_fk(ID_user)
  REFERENCES users(ID_user),
  
  FOREIGN KEY creditcard_fk(ID_creditcard)
  REFERENCES creditcards(ID_creditcard),
  
  FOREIGN KEY paypal_fk(ID_paypal)
  REFERENCES paypals(ID_paypal)
  
);

CREATE TABLE payments (
  ID_payment int NOT NULL AUTO_INCREMENT,
  ID_user int NOT NULL,
  date_payment TIMESTAMP,
  total_amount float,
  UNIQUE(ID_payment),
  FOREIGN KEY user_fk(ID_user)
  REFERENCES users(ID_user)
);

CREATE TABLE playlists(
  ID_playlist int NOT NULL AUTO_INCREMENT,
  ID_user INT NOT NULL,
  title varchar(128),
  songs_amount int,
  creation_date TIMESTAMP,
  status ENUM("active", "deleted"),
  deletion_date TIMESTAMP,
  
  UNIQUE(ID_playlist),
  FOREIGN KEY user_fk(ID_user)
  REFERENCES users(ID_user)
);

CREATE TABLE artists(
  ID_artist INT NOT NULL AUTO_INCREMENT,
  name varchar(512),
  artist_img varchar(5126),
  UNIQUE(ID_artist)
);


CREATE TABLE albums(
  ID_album int NOT NULL AUTO_INCREMENT,
  ID_artist int NOT NULL,
  album_title varchar(512),
  artist_name varchar(512),
  publication_year TIMESTAMP,
  cover_img varchar(2562),
  
  UNIQUE(ID_album),
  FOREIGN KEY artist_fk(ID_artist)
  REFERENCES artists(ID_artist)
  
  
);




CREATE TABLE songs (
  ID_song INT NOT NULL AUTO_INCREMENT,
  ID_artist INT NOT NULL,
  ID_album INT NOT NULL,
  song_title varchar(512),
  song_lenght_s float,
  reproduction_times int,
  
  UNIQUE(ID_song),
  FOREIGN KEY artist_fk(ID_artist)
  REFERENCES artists(ID_artist),
  FOREIGN KEY album_fk(ID_album)
  REFERENCES albums(ID_album)
);



CREATE TABLE shared_playlists(
  ID_playlist INT NOT NULL,
  ID_user INT,
  ID_added_song INT,
  added_song_title varchar(256),
  operation_date TIMESTAMP,
  
  FOREIGN KEY playlist_fk(ID_playlist)
  REFERENCES playlists(ID_playlist),
  FOREIGN KEY user_fk(ID_user)
  REFERENCES users(ID_user),
  FOREIGN KEY songs_fk(ID_added_song)
  REFERENCES songs(ID_song)
  
);


CREATE TABLE artists_relations(
	ID_artist_1 INT NOT NULL,
	ID_artist_2 INT NOT NULL,
	
	FOREIGN KEY artistOne_fk(ID_artist_1)
  REFERENCES artists(ID_artist),
  FOREIGN KEY artistTwo_fk(ID_artist_2)
  REFERENCES artists(ID_artist)
	
);

CREATE TABLE user_follows(
  ID_user INT NOT NULL,
  ID_artist INT NOT NULL,

  FOREIGN KEY user_fk(ID_user)
  REFERENCES users(ID_user),
  FOREIGN KEY artist_fk(ID_artist)
  REFERENCES artists(ID_artist)
);


CREATE TABLE user_fav_albums(
  ID_user INT NOT NULL,
  ID_album INT NOT NULL,
  
  FOREIGN KEY user_fk(ID_user)
  REFERENCES users(ID_user),
  FOREIGN KEY album_fk(ID_album)
  REFERENCES albums(ID_album)
);

CREATE TABLE user_fav_songs(
  ID_user INT NOT NULL,
  ID_song INT NOT NULL,
  
  FOREIGN KEY user_fk(ID_user)
  REFERENCES users(ID_user),
  FOREIGN KEY song_fk(ID_song)
  REFERENCES songs(ID_song)
);
