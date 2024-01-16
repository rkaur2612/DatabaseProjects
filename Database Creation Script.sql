DROP DATABASE IF EXISTS `fbs_ramankaur`;
CREATE DATABASE `fbs_ramankaur`;
USE `fbs_ramankaur`;

-- Tables list to be created
-- Airlines
-- Airports
-- Flights
-- Passengers
-- Seats
-- Bookings

-- Create the Airlines table
CREATE TABLE airlines (
    AirlineID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    IATA_Code VARCHAR(3)
);
INSERT INTO airlines VALUES 
(1,'Delta Airlines','DL'),
(DEFAULT,'American Airlines','AA');

-- Create the Airports table
CREATE TABLE airports (
    AirportID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    IATA_Code VARCHAR(3),
    City VARCHAR(50),
    Country VARCHAR(50)
);
INSERT INTO airports VALUES
(1,'Los Angeles Intl Airport','LAX','Los Angeles','USA'),
(DEFAULT,'San Francisco Intl Airport','SFO','San Francisco','USA'),
(DEFAULT,'San Diego Intl Airport','SAN','San Diego','USA');

-- Create the Flights table
CREATE TABLE flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber INT NOT NULL,
    AirlineID INT,
    OriginAirportID INT,
    DestinationAirportID INT,
    DepartureDate DATETIME NOT NULL,
    ArrivalDate DATETIME NOT NULL,
    Distance_miles INT,
    FOREIGN KEY (AirlineID) REFERENCES airlines(AirlineID),
    FOREIGN KEY (OriginAirportID) REFERENCES airports(AirportID),
    FOREIGN KEY (DestinationAirportID) REFERENCES airports(AirportID)
);

INSERT INTO flights VALUES
(1,530,1,1,2,'2022-10-05 08:20:00','2022-10-05 09:35:00','236'),
(2,571,1,2,1,'2022-10-07 14:00:00','2022-10-07 15:15:00','236'),
(3,4087,2,2,3,'2022-10-26 13:25:00','2022-10-26 17:15:00','447');

-- Create the Passengers table
CREATE TABLE passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    isChild BOOLEAN
);

INSERT INTO passengers VALUES
(1,'John','Smith',32,FALSE),
(DEFAULT,'Jennifer','Smith',31,FALSE),
(DEFAULT,'Jane','Smith',1,TRUE);

CREATE TABLE seats (
    FlightID INT,
    SeatNumber VARCHAR(4),
    PRIMARY KEY (FlightID,SeatNumber),
    FOREIGN KEY (FlightID) REFERENCES flights(FlightID)
    );
    
INSERT INTO seats (FlightID,SeatNumber) VALUES
(1,'21A'),
(1,'22A'),
(1,'23A'),
(1,'21B'),
(1,'22B'),
(1,'23B'),
(1,'21C'),
(1,'22C'),
(1,'23C'),
(2,'21A'),
(2,'22A'),
(2,'23A'),
(2,'21B'),
(2,'22B'),
(2,'23B'),
(2,'21C'),
(2,'22C'),
(2,'23C'),
(3,'21A'),
(3,'22A'),
(3,'23A'),
(3,'21B'),
(3,'22B'),
(3,'23B'),
(3,'21C'),
(3,'22C'),
(3,'23C');

-- Create the Bookings table
CREATE TABLE bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    PassengerID INT,
    SeatNumber VARCHAR(4),
    Price DECIMAL(10,2),
    ConfirmationNumber VARCHAR(20),
    TicketNumber INT,
    FOREIGN KEY (FlightID) REFERENCES flights(FlightID),
    FOREIGN KEY (PassengerID) REFERENCES passengers(PassengerID),
    FOREIGN KEY (FlightID, SeatNumber) REFERENCES seats(FlightID, SeatNumber)
);

INSERT INTO bookings (FlightID,PassengerID,SeatNumber,Price,ConfirmationNumber,TicketNumber) VALUES
(1,1,'23A',228.80,'DAGHCX',0177200658),
(1,2,'23B',228.80,'DAGHCX',0178410326),
(1,3,'23C',228.80,'DAGHCX', 0178413421),
(2,1,'23A',228.80,'DAGHCX',0177200658),
(2,2,'23B',228.80,'DAGHCX',0178410326),
(2,3,'23C',228.80,'DAGHCX', 0178413421);