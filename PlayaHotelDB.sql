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
    STDOcc int not null,
    MaxOcc int not null,
    BasePrice double(4,2) not null,
    ExtraPersonCost double(3,2) not null
    
);

create table `Guest` (

	GuestID INT PRIMARY KEY AUTO_INCREMENT,
    Address varchar(50) not null,
    City varchar(50) not null,
    State varchar(50) not null,
    Zip varchar(50) not null,
    PhoneNumber char(50) not null,
    NameId int not null,
    
    foreign key fk_Guest_NameId (NameId)
        references Name(NameId)
);

create table `AmenityCoupling` (

	AmenityId int not null,
    RoomId int not null,
    
    foreign key fk_AmenityCoupling_AmenityId (AmenityId)
        references Amenity(AmenityId),
	foreign key fk_AmenityCoupling_RoomId (RoomId)
        references Room(RoomId)
);

create table `Reservation` (

	AdultCount int not null,
    ChildrenCount int not null,
    TotalCost double(4,2) not null,
    RoomId int not null,
    GuestId int not null,
    DateId int not null,
    
    foreign key fk_Reservation_RoomId (RoomId)
        references Room(RoomId),
	foreign key fk_Reservation_GuestId (GuestId)
        references Guest(GuestId),
	foreign key fk_Reservation_DateId (DateId)
        references Date(DateId)
);

