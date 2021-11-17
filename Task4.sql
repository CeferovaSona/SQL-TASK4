CREATE DATABASE Cinema

Use Cinema


CREATE TABLE Genres(
Id int primary key identity,
Category nvarchar(100)
)

INSERT INTO Genres
VALUES ('Fantasy'),
       ('Comedy'),
	   ('Love'),
	   ('Action'),
	   ('Adventure')

CREATE TABLE Movies(
Id int primary key identity,
Name nvarchar(100),
FilmTime Time,

)

INSERT INTO Movies
VALUES  ('The Lost World','09:00:00'),
        ('An Unexpected Journey','15:30:00'),
		('Titanic','21:00:00'),
		('Lawrence of Arabia','19:00:00'),
		('The Killer ','21:00:00'),
		('Superbad ','14:00:00')

CREATE TABLE Sessions(
id int primary key identity,
Name nvarchar(50),
StartTime Time,
EndTime  Time
)

INSERT INTO Sessions
VALUES ('Morning Session','09:00:00','12:00:00'),
        ('Noon Session','14:00:00','16:00:00'),
        ('Evening Session','18:00:00','22:00:00')

CREATE TABLE Halls(
id int primary key identity,
Name nvarchar(50),

)

INSERT INTO Halls
VALUES ('Platinum'),
       ('Hall1'),
	   ('Hall2'),
	   ('Hall3')

CREATE TABLE Actors(
id int primary key identity,
FullName nvarchar(50)
)

INSERT INTO Actors
VALUES ('Tom Hanks'),
        ('Leonardo DiCaprio'),
		('Dwayne Johnson'),
		('Tom Cruse'),
		('Scarlet Johansson')

CREATE TABLE Tickets (
id int primary key identity,
TicketNumber int,
Place int
)

INSERT INTO Tickets
VALUES (5,20),
       (6,25),
	   (4,21),
	   (6,30)

CREATE TABLE Customers(
id int primary key identity,
FullName nvarchar(50)
)
INSERT  INTO Customers
VALUES  ('Vugar Rustemov'),
        ('Aysel Qarayeva'),
		('Melek Rustemova'),
		('Aynur Eliyeva'),
		('Sahib Ceferov')


SELECT * FROM Movies
SELECT * FROM Actors

CREATE TABLE MovieActors(
id int primary key identity,
ActorId int References Actors(id),
MovieId int References Movies(Id)
)


INSERT INTO MovieActors
VALUES (2,1),
       (2,3),
	   (3,6),
	   (4,6),
	   (4,5),
	   (3,2)


CREATE TABLE MovieGenres(
id int primary key identity,
MovieId int References Movies (id),
GenreId int References Genres (id)
)
 INSERT INTO MovieGenres
 VALUES  (1,1),
          (2,1),
		  (3,3),
		  (4,5),
		  (5,4)
 Select * FROM MovieGenres

 CREATE TABLE TicketCustomers(
 id int primary key identity,
TicketId int References Tickets(id),
CustomerId int References Customers (id)
)

SELECT * FROM Tickets
SELECT * FROM Customers

INSERT INTO TicketCustomers
VALUES (1,3),
       (2,5),
	   (4,3),
	   (3,2),
	   (4,1)
	   
CREATE Table MovieCustomers(
id int primary key identity,
MovieId int References Movies (Id),
CustomerId int References Customers (id)
)

INSERT INTO MovieCustomers
VALUES (1,5),
       (3,2),
	   (4,1),
	   (6,3)

	   


SELECT m.Name,m.FilmTime ,s.Name 'Session TYPE'  FROM Movies m
JOIN Sessions s
on m.FilmTime between s.StartTime and s.EndTime

JOIN MovieCustomers mc
on m.id=mc.MovieId

JOIN TicketCustomers tc
on mc.CustomerId=tc.CustomerId


