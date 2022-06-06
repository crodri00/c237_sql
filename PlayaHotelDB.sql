drop database if exists HotelDB;

create database HotelDB;

use HotelDB;

create table `Amenity` (

	AmenityID INT PRIMARY KEY AUTO_INCREMENT,
    Amenity varchar(50) not null
);

create table `Name` (

	NameID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName varchar(50) not null,
    LastName varchar(50) not null
);

create table `Date` (

	DateID INT PRIMARY KEY AUTO_INCREMENT,
    StartDate date not null,
    EndDate date not null
);

create table `Room` (

	RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNum int not null,
    RoomType varchar(50) not null,
    ADAAccess BOOL not null,
    StandOcc int not null,
    MaxOcc int not null,
    BasePrice double(6,2) not null,
    ExtraPerson double(5,2) null
    
);

create table `Guest` (

	GuestID INT PRIMARY KEY AUTO_INCREMENT,
    Address varchar(50) not null,
    City varchar(50) not null,
    State varchar(50) not null,
    Zip varchar(50) not null,
    PhoneNumber char(50) not null,
    NameID int not null,
    
    foreign key fk_Guest_NameId (NameId)
        references Name(NameId)
);

create table `AmenityCoupling` (

	AmenityID int not null,
    RoomID int not null,
    
    foreign key fk_AmenityCoupling_AmenityId (AmenityId)
        references Amenity(AmenityId),
	foreign key fk_AmenityCoupling_RoomId (RoomId)
        references Room(RoomId)
);

create table `Reservation` (

	ReservationID INT PRIMARY KEY AUTO_INCREMENT,

	AdultCount int not null,
    ChildrenCount int not null,
    TotalCost double(4,2) not null,
    RoomID int not null,
    GuestID int not null,
    DateID int not null,
    
    foreign key fk_Reservation_RoomId (RoomId)
        references Room(RoomId),
	foreign key fk_Reservation_GuestId (GuestId)
        references Guest(GuestId),
	foreign key fk_Reservation_DateId (DateId)
        references Date(DateId)
);

INSERT INTO Amenity (AmenityID, Amenity) VALUES
    (1, 'Microwave'), 
    (2, 'Jacuzzi'), 
    (3, 'Refrigerator'), 
    (4, 'Oven');
    
INSERT INTO Name (FirstName, LastName) VALUES
    ('Clarissa','Rodriguez'),
	('Mack','Simmer'),
	('Bettyann','Seery'),
	('Duane','Cullison'),
	('Karie','Yang'),
	('Aurore','Lipton'),
	('Zachery','Luechtefeld'),
	('Jeremiah','Pendergrass'),
	('Walter','Holaway'),
	('Wilfred','Vise'),
	('Maritza','Tilton'),
	('Joleen','Tison');
    
INSERT INTO Date (StartDate, EndDate) VALUES
    ('2023-02-02', '2023-02-04'),
	('2023-02-05', '2023-02-10'),
	('2023-02-22', '2023-02-24'),
	('2023-03-06', '2023-03-07'),
	('2023-03-17', '2023-03-20'),
	('2023-03-18', '2023-03-23'),
	('2023-03-29', '2023-03-31'),
	('2023-03-31', '2023-04-05'),
	('2023-04-09', '2023-04-13'),
	('2023-04-23', '2023-04-24'),
	('2023-05-30', '2023-06-02'),
	('2023-06-10', '2023-06-14'),
	('2023-06-17', '2023-06-18'),
	('2023-06-28', '2023-07-02'),
	('2023-07-13', '2023-07-14'),
	('2023-07-18', '2023-07-21'),
	('2023-07-28', '2023-07-29'),
	('2023-08-30', '2023-09-01'),
	('2023-09-16', '2023-09-17'),
	('2023-09-13', '2023-09-15'),
	('2023-11-22', '2023-11-25'),
	('2023-12-24', '2023-12-28');
    
INSERT INTO Room (RoomID, RoomNum, RoomType, AdaAccess, StandOcc, MaxOcc, BasePrice, ExtraPerson) VALUES
    (1, 201, 'Double', false, 2, 4, 199.99, 10),
	(2, 202, 'Double', true, 2, 4, 174.99, 10),
	(3, 203, 'Double', false, 2, 4, 199.99, 10),
	(4, 204, 'Double', true, 2, 4, 174.99, 10),
	(5, 205, 'Single', false, 2, 2, 174.99, NULL),
	(6, 206, 'Single', true, 2, 2, 149.99, NULL),
	(7, 207, 'Single', false, 2, 2, 174.99, NULL),
	(8, 208, 'Single', true, 2, 2, 149.99, NULL),
	(9, 301, 'Double', false, 2, 4, 199.99, 10),
	(10, 302, 'Double', true, 2, 4, 174.99, 10),
	(11, 303, 'Double', false, 2, 4, 199.99, 10),
	(12, 304, 'Double', true, 2, 4, 174.99, 10),
	(13, 305, 'Single', false, 2, 2, 174.99, NULL),
	(14, 306, 'Single', true, 2, 2, 149.99, NULL),
	(15, 307, 'Single', false, 2, 2, 174.99, NULL),
	(16, 308, 'Single', true, 2, 2, 149.99, NULL),
	(17, 401, 'Suite', true, 3, 8, 399.99, 20),
	(18, 402, 'Suite', true, 3, 8, 399.99, 20);
    
    