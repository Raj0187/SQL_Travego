use travego;


# a. How many female passengers traveled a minimum distance of 600 KMs? (1 mark)

SELECT COUNT(*) AS FemalePassengersCount
FROM Passenger
WHERE gender = 'F' AND distance >= 600;

select * from passenger;  # for verifying

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


show tables; # for verifying
