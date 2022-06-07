drop database if exists HotelDB;

create database HotelDB;

use HotelDB;

create table `Amenity` (

	AmenityID INT PRIMARY KEY AUTO_INCREMENT,
    Amenity varchar(50) not null
);

create table `GuestName` (

	NameID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName varchar(50) not null,
    LastName varchar(50) not null
);

create table `ReservDate` (

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
        references GuestName(NameId)
        ON DELETE CASCADE
);

create table `AmenityCoupling` (

	RoomID int not null,
	AmenityID int not null,
    
    
    foreign key fk_AmenityCoupling_AmenityId (AmenityId)
        references Amenity(AmenityId),
	foreign key fk_AmenityCoupling_RoomId (RoomId)
        references Room(RoomId)
);

create table `Reservation` (

	ReservationID INT PRIMARY KEY AUTO_INCREMENT,

	AdultCount int not null,
    ChildrenCount int not null,
    TotalCost double(6,2) not null,
    RoomID int not null,
    GuestID int not null,
    DateID int not null,
    
    foreign key fk_Reservation_RoomId (RoomId)
        references Room(RoomId),
	foreign key fk_Reservation_GuestId (GuestId)
        references Guest(GuestId)
        ON DELETE CASCADE,
	foreign key fk_Reservation_DateId (DateId)
        references ReservDate(DateId)
        ON DELETE CASCADE
);

INSERT INTO Amenity (AmenityID, Amenity) VALUES
    (1, 'Microwave'), 
    (2, 'Jacuzzi'), 
    (3, 'Refrigerator'), 
    (4, 'Oven');
    
INSERT INTO GuestName (FirstName, LastName) VALUES
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
    
INSERT INTO ReservDate (StartDate, EndDate) VALUES
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
	(5, 205, 'Single', false, 2, 2, 174.99, 0),
	(6, 206, 'Single', true, 2, 2, 149.99, 0),
	(7, 207, 'Single', false, 2, 2, 174.99, 0),
	(8, 208, 'Single', true, 2, 2, 149.99, 0),
	(9, 301, 'Double', false, 2, 4, 199.99, 10),
	(10, 302, 'Double', true, 2, 4, 174.99, 10),
	(11, 303, 'Double', false, 2, 4, 199.99, 10),
	(12, 304, 'Double', true, 2, 4, 174.99, 10),
	(13, 305, 'Single', false, 2, 2, 174.99, 0),
	(14, 306, 'Single', true, 2, 2, 149.99, 0),
	(15, 307, 'Single', false, 2, 2, 174.99, 0),
	(16, 308, 'Single', true, 2, 2, 149.99, 0),
	(17, 401, 'Suite', true, 3, 8, 399.99, 20),
	(18, 402, 'Suite', true, 3, 8, 399.99, 20);
    
INSERT INTO Guest (NameId, Address, City, State, Zip, PhoneNumber) VALUES
	(1, '1010 W 23rd St', 'Raleigh', 'NC', '27607', '832-330-8004'),
	(2, '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '291-553-0508'),
	(3, '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '478-277-9632'),
	(4, '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '308-494-0198'),
	(5, '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '214-730-0298'),
	(6, '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '377-507-0974'),
	(7, '7 Poplar Dr.', 'Arvada', 'CO', '80003', '814-485-2615'),
	(8, '70 Oakwood St.', 'Zion', 'IL', '60099', '279-491-0960'),
	(9, '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '446-396-6785'),
	(10, '77 West Surrey Street', 'Oswego', 'NY', '13126', '834-727-1001'),
	(11, '939 Linda Rd.', 'Burke', 'VA', '22015', '446-351-6860'),
	(12, '87 Queen St.', 'Drexel Hill', 'PA', '19026', '231-893-2755');
    
INSERT INTO AmenityCoupling (RoomID, AmenityID) VALUES
    (1, 1),
	(1, 2),
	(2, 3),
	(3, 1),
	(3, 2),
	(4, 3),
	(5, 1),
	(5, 2),
	(5, 3),
	(6, 1),
	(6, 3),
	(7, 1),
	(7, 2),
	(7, 3),
	(8, 1),
	(8, 3),
	(9, 1),
	(9, 2),
	(10, 3),
	(11, 1),
	(11, 2),
	(12, 3),
	(13, 1),
	(13, 2),
	(13, 3),
	(14, 1),
	(14, 3),
	(15, 1),
	(15, 2),
	(15, 3),
	(16, 1),
	(16, 3),
	(17, 1),
	(17, 3),
	(17, 4),
	(18, 1),
	(18, 3);
    
INSERT INTO Reservation (ReservationID, AdultCount, ChildrenCount, TotalCost, RoomID, GuestID, DateID) VALUES
    (1 ,1 ,0 ,299.98 ,16 ,2 ,1),
	(2 ,2 ,1 ,999.95 ,3 ,3 ,2),
	(3 ,2 ,0 ,349.98 ,13 ,4 ,3),
	(4 ,2 ,2 ,199.99 ,1 ,5 ,4),
	(5 ,1 ,1 ,524.97 ,15 ,1 ,5),
	(6 ,3 ,0 ,924.95 ,10 ,6 ,6),
	(7 ,2 ,2 ,349.98 ,2 ,7 ,7),
	(8 ,2 ,0 ,874.95 ,12 ,8 ,8),
	(9 ,1 ,0 ,799.96 ,9 ,9 ,9),
	(10 ,1 ,1 ,174.99 ,7 ,10 ,10),
	(11 ,2 ,4 ,1199.97 ,17 ,11 ,11),
	(12 ,2 ,0 ,599.96 ,6 ,12 ,12),
	(13 ,1 ,0 ,599.96 ,8 ,12 ,12),
	(14 ,3 ,0 ,184.99 ,12 ,6 ,13),
	(15 ,2 ,0 ,699.96 ,5 ,1 ,14),
	(16 ,3 ,1 ,184.99 ,4 ,9 ,15),
	(17 ,4 ,2 ,1259.97 ,17 ,10 ,16),
	(18 ,2 ,1 ,199.99 ,11 ,3 ,17),
	(19 ,1 ,0 ,349.98 ,13 ,3 ,18),
	(20 ,2 ,0 ,149.99 ,8 ,2 ,19),
	(21 ,2 ,2 ,399.98 ,3 ,5 ,20),
	(22 ,2 ,2 ,1199.97 ,17 ,4 ,21),
	(23 ,2 ,0 ,449.97 ,6 ,2 ,21),
	(24 ,2 ,2 ,599.97 ,9 ,2 ,21),
	(25 ,2 ,0 ,699.96 ,10 ,11 ,22);
    

    
    