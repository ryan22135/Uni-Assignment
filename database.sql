DROP DATABASE IF EXISTS LIBRARY;
drop user admin@localhost;
flush privileges;

create user 'admin'@'localhost' identified by 'LIBRARY';

grant all on *.* to 'admin'@'localhost';


CREATE DATABASE LIBRARY;

USE LIBRARY;

GRANT SELECT, INSERT, UPDATE, DELETE
	ON LIBRARY.*
	TO 'LIBRARY'@'localhost'
	IDENTIFIED BY 'pass';

USE LIBRARY;

CREATE TABLE users (
	userID INT PRIMARY KEY,
	firstName varchar(30) NOT NULL default '',
	lastName varchar(30) NOT NULL default '',
	email varchar(255) NOT NULL default '',
	homeAddress varchar(255) NOT NULL default '',
	dob DATE NOT NULL default '2000-01-01',
	password varchar(255) NOT NULL default '',
	isAdmin bit NOT NULL
);

CREATE TABLE item (
	itemID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name varchar(100) NOT NULL default '',
	description TEXT NOT NULL
);

CREATE TABLE book (
	bookID INT PRIMARY KEY NOT NULL,
	publisher varchar(50) NOT NULL default '',
	publishedDate DATE NOT NULL,
	ISBN BIGINT(13) NOT NULL,
	author varchar(50) NOT NULL default '',
	FOREIGN KEY (bookID) REFERENCES Item(itemID)
);

CREATE TABLE computer (
	computerID INT PRIMARY KEY NOT NULL,
	releaseDate DATE,
	modelNum varchar(10),
	manufacturer varchar(100),
	FOREIGN KEY (computerID) REFERENCES Item(itemID)
);

CREATE TABLE audioCD (
	diskID INT PRIMARY KEY NOT NULL,
	artist varchar(50) NOT NULL,
	type varchar(20) NOT NULL,
	FOREIGN KEY (diskID) REFERENCES Item(itemID)
);

CREATE TABLE transaction (
	transactionID INT PRIMARY KEY NOT NULL,
	itemID INT NOT NULL,
	userID INT NOT NULL,
	borrowedDate DATE NOT NULL,
	dueDate DATE NOT NULL,
	FOREIGN KEY (itemID) REFERENCES Item(itemID),
	FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE comments (
	itemID INT NOT NULL,
	userID INT NOT NULL,
	commentID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	comment TEXT NOT NULL,
	commentDate DATE NOT NULL,
	FOREIGN KEY (userID) REFERENCES users(userID),
	FOREIGN KEY (itemID) REFERENCES item(itemID)
);

INSERT INTO users
	(userID, firstName, lastName, email, dob, homeAddress, password, isAdmin)
VALUES
	(101, 'Sandeep', 'Raj', 'sandeep@mail.com', '1991-01-01' , '1 Ballarat VIC', 'user1', 1),
	(102, 'Anthony', 'Chapman', 'anthony@mail.com', '1992-02-02', '2 Ballarat VIC', 'user2', 0),
	(103, 'Ryan', 'Potschka', 'ryan@mail.com', '1993-03-03', '3 Ballarat VIC', 'user3', 1);

INSERT INTO item
	(itemID, name, description)
VALUES
	(11, "Ender's Game", "Set at an unspecified date in Earth's future, the novel presents an imperiled mankind after two conflicts with the Formics, an insectoid alien species."),
	(12, "Frankenstein", "A young scientist who creates a hideous, sapient creature in an unorthodox scientific experiment."),
	(13, "The Martian", "The story follows an American astronaut, Mark Watney, as he becomes stranded alone on Mars in the year 2035 and must improvise in order to survive."),
	(14, "LION", "A true story of survival and triumph against incredible odds, now a major motion picture starring Dev Patel, Nicole Kidman and Rooney Mara"),
	(15, "Death of a Sweep", "The 26th outing for the Highland's most famous PC, Hamish Macbeth."),
	(16, "August Heat", "The tenth novel in Camilleri's engrossing mystery series featuring the irrepressible Inspector Montalbano."),
	(17, "MacBook Pro 2017", "The new MacBook Pro is razor-thin, feather-light and now even faster and more powerful than before."),
	(18, "Acer Chromebook C731", "Chromebook with dual-band wireless and up to 13 hours battery life is perfect for anyone who works or studies on the go."),
	(19, "Surface Pro 6", "Get productive your way with new Surface Pro 6 - now with the latest 8th Gen Intel® Core™ processor.");

INSERT INTO book
	(bookID, publisher, publishedDate, ISBN, author)
VALUES
	(11, 'Tor Books', '1985-01-15', 111, 'Orson Scott Card'),
	(12, 'Penguin Books', '1818-01-01', 222, 'Mary Shelley'),
	(13, 'CSIRO Publishing', '2011-08-03', 333, 'Andy Weir');

INSERT INTO audioCD
	(diskID, artist, type)
VALUES
	(14, 'Saroo Brierly and Saroo Brierley', 'Blueray'),
	(15, 'M.C. Beaton', 'DVD'),
	(16, 'Andrea Camilleri ', 'CD');

INSERT INTO computer
	(computerID, releaseDate, modelNum, manufacturer)
VALUES
	(17, '2017-11-14', 1212, 'Apple'),
	(18, '2017-09-23', 1313, 'Acer'),
	(19, '2018-05-16', 1414, 'Microsoft');

INSERT INTO transaction
	(transactionID, itemID, userID, borrowedDate, dueDate)
VALUES
	(1, 11, 101, '2018-01-01', '2018-02-02'),
	(2, 12, 102, '2018-03-03', '2018-04-04'),
	(3, 13, 103, '2018-05-05', '2018-06-06');

