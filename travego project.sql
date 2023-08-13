drop database  if exists travego;

create database Travego;

use Travego;

# table had been created manually.
drop table passenger;
CREATE TABLE Passenger (
  Passenger_id INT,
  Passenger_name VARCHAR(20),
  Category VARCHAR(20),
  Gender VARCHAR(20),
  Boarding_City VARCHAR(20),
  Destination_City VARCHAR(20),
  Distance INT,
  Bus_Type VARCHAR(20)
);

INSERT INTO Passenger (Passenger_id, Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
VALUES
  (1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
  (2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
  (3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
  (4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
  (5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
  (6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
  (7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
  (8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
  (9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

select * from passenger;

CREATE TABLE Price (
  id INT,
  Bus_type VARCHAR(20),
  Distance INT,
  Price INT
);


INSERT INTO Price (id, Bus_type, Distance, Price)
VALUES
  (1, 'Sleeper', 350, 770),
  (2, 'Sleeper', 500, 1100),
  (3, 'Sleeper', 600, 1320),
  (4, 'Sleeper', 700, 1540),
  (5, 'Sleeper', 1000, 2200),
  (6, 'Sleeper', 1200, 2640),
  (7, 'Sleeper', 1500, 2700),
  (8, 'Sitting', 500, 620),
  (9, 'Sitting', 600, 744),
  (10, 'Sitting', 700, 868),
  (11, 'Sitting', 1000, 1240),
  (12, 'Sitting', 1200, 1488),
  (13, 'Sitting', 1500, 1860);

select * from passenger;

desc passenger;

select * from price;

desc price;



################################################## TASK 2 ##############################################333

# a. How many female passengers traveled a minimum distance of 600 KMs? (1 mark)

SELECT COUNT(*) AS FemalePassengersCount
FROM Passenger
WHERE gender = 'F' AND distance >= 600;

select * from passenger;

#b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus. (2 marks)

SELECT *
FROM Passenger
WHERE distance > 500 AND bus_type = 'Sleeper';

#c. Select passenger names whose names start with the character 'S'.(2 marks)

SELECT *
FROM Passenger
WHERE passenger_name LIKE 's%';

#d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output. (3 marks)

SELECT
  p.Passenger_name,
  p.Boarding_City,
  p.Destination_City,
  p.Bus_Type,
  pr.Price AS Price
FROM
  Passenger p
JOIN
  Price pr ON p.Bus_Type = pr.Bus_type AND p.Distance = pr.Distance;

#e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? (4 marks)
select * from price;
SELECT p.Passenger_name, pr.price
FROM Passenger p
JOIN Price pr ON P.Bus_Type = Pr.Bus_type AND p.Distance = Pr.Distance
WHERE P.Distance = 1000 AND P.Bus_Type = 'Sitting';

#f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? (5 marks)

SELECT
  p.Passenger_name,
  p.Bus_Type,
  pr.Price AS Ticket_Price
FROM
  Passenger p
JOIN
  Price pr ON pr.Bus_Type = p.Bus_type AND pr.Distance = p.Distance
WHERE
  p.Passenger_name = 'Pallavi'
  AND p.Boarding_City = 'Panaji'
  AND p.Destination_City = 'Bangalore';


#g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper (2 marks)

UPDATE Passenger
SET Category = 'Non-AC'
WHERE Bus_Type = 'Sleeper';

select * from passenger;

#h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database. (1 mark)

DELETE FROM Passenger
WHERE Passenger_name = 'Piyush';
commit ;

select * from passenger;

#i. Truncate the table passenger and comment on the number of rows in the table (explain if required). (1 mark)

TRUNCATE TABLE passenger;

SELECT COUNT(*) AS row_count FROM passenger;

# j. Delete the table passenger from the database. (1 mark)

DROP TABLE IF EXISTS passenger;



