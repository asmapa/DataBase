create table employees(
 e_aadhar_num BIGINT PRIMARY KEY CHECK (e_aadhar_num BETWEEN 100000000000 AND 999999999999),
name varchar(50) NOT NULL,
address varchar(200) NOT NULL,
age int check(age > 0) NOT NULL,
mob_num varchar(10) NOT NULL,
email_id varchar(100) UNIQUE NOT NULL,
join_date DATE NOT NULL,
salary DECIMAL(15,2) NOT NULL);


create table room(
roomNo int PRIMARY KEY,
room_type varchar(10) check(room_type in ('A/C','NON A/C')) NOT NULL,
capacity varchar(30) check (capacity in('Single bed','double bed')) NOT NULL);

create table food(
item_num int PRIMARY KEY,
item_name varchar(100) NOT NULL,
item_type varchar(20) check(item_type in('veg','non-veg')) NOT NULL,
price decimal(15,2) NOT NULL);


create table residents(
aadhar_num BIGINT PRIMARY KEY check (aadhar_num BETWEEN 100000000000 AND 999999999999),
name varchar(50) NOT NULL,
address varchar(200) NOT NULL,
gender varchar(10) check(gender in('male','female','others'))NOT NULL,
age int check(age > 0) NOT NULL,
mob_num varchar(10) NOT NULL,
email_id varchar(100) UNIQUE NOT NULL);



create table bookings(
booking_id INT,
aadhar_num BIGINT ,
room_num INT NOT NULL,
check_in_date DATE NOT NULL,
check_out_date DATE NOT NULL,
time TIME NOT NULL,
booking_status varchar(100) check (booking_status in('confirmed','pending','cancelled')) NOT NULL,
PRIMARY KEY (booking_id,aadhar_num,room_num),
FOREIGN KEY (aadhar_num) REFERENCES residents(aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (room_num) REFERENCES room(roomNo)
ON UPDATE CASCADE
ON DELETE CASCADE);


create table companions(
caadhar_num BIGINT check (caadhar_num BETWEEN 100000000000 AND 999999999999),
name varchar(50) NOT NULL,
gender varchar(10) check(gender in('male','female','others'))NOT NULL,
mob_num varchar(10) NOT NULL,
res_aadhar_num BIGINT ,
booking_id INT ,
PRIMARY KEY(caadhar_num,res_aadhar_num,booking_id),
FOREIGN KEY (res_aadhar_num) REFERENCES residents(aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
ON UPDATE CASCADE
ON DELETE CASCADE );


create table food_order(
order_num int,
res_aadhar_num BIGINT,
item_num int,
quantity int CHECK (quantity > 0) NOT NULL,
order_date DATE NOT NULL,
PRIMARY KEY(order_num,item_num),
FOREIGN KEY (res_aadhar_num) REFERENCES residents(aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (item_num) REFERENCES food(item_num)
ON UPDATE CASCADE
ON DELETE CASCADE);



INSERT INTO employees (e_aadhar_num, name, address, age, mob_num, email_id, join_date, salary)
VALUES 
(123456789012, 'Ravi Kumar', '123 MG Road, Ernakulam, Kerala', 28, '9876543210', 'ravi.kumar@example.com', '2023-05-10', 55000.00),
(234567890123, 'Sneha Nair', '456 Canal Road, Thrissur, Kerala', 32, '9123456789', 'sneha.nair@example.com', '2022-03-15', 62000.00),
(345678901234, 'Anand Menon', '789 Palm Street, Kozhikode, Kerala', 30, '9087654321', 'anand.menon@example.com', '2021-11-22', 70000.00);
INSERT INTO employees (e_aadhar_num, name, address, age, mob_num, email_id, join_date, salary)
VALUES
(456789012345, 'Maya R', '12 Blossom Avenue, Kochi, Kerala', 27, '9012345678', 'maya.r@example.com', '2023-01-11', 51000.00),
(567890123456, 'Ajay Verma', '23 Lotus Street, Trivandrum, Kerala', 34, '9023456781', 'ajay.verma@example.com', '2022-09-17', 72000.00),
(678901234567, 'Nikita S', '89 Hilltop Road, Kottayam, Kerala', 29, '9034567892', 'nikita.s@example.com', '2023-04-25', 59000.00),
(789012345678, 'Rajeev Nair', '56 Riverbank, Alappuzha, Kerala', 41, '9045678903', 'rajeev.nair@example.com', '2021-08-07', 83000.00),
(890123456789, 'Kavya Mohan', '67 Palm Grove, Kannur, Kerala', 36, '9056789014', 'kavya.mohan@example.com', '2020-12-18', 67000.00),
(901234567890, 'Nikhil P', '11 Sunrise Blvd, Thrissur, Kerala', 31, '9067890125', 'nikhil.p@example.com', '2019-05-29', 75000.00),
(123098765432, 'Priya S', '29 Maple Drive, Calicut, Kerala', 26, '9078901236', 'priya.s@example.com', '2021-02-15', 53000.00),
(234567890124, 'Aditya K', '37 Rose Lane, Pathanamthitta, Kerala', 39, '9089012347', 'aditya.k@example.com', '2020-10-21', 81000.00),
(345678901235, 'Divya C', '45 Ocean View, Palakkad, Kerala', 28, '9090123458', 'divya.c@example.com', '2021-07-11', 56000.00),
(456789012346, 'Vineeth R', '59 Forest Hills, Malappuram, Kerala', 33, '9101234569', 'vineeth.r@example.com', '2022-01-30', 69000.00),
(567890123457, 'Harsha Menon', '63 Lakeview, Kasaragod, Kerala', 35, '9112345670', 'harsha.menon@example.com', '2021-03-18', 78000.00),
(678901234568, 'Anu K', '91 Woodland, Kollam, Kerala', 29, '9123456781', 'anu.k@example.com', '2019-06-24', 62000.00),
(789012345679, 'Suresh R', '18 Pebble Beach, Ernakulam, Kerala', 42, '9134567892', 'suresh.r@example.com', '2018-09-08', 85000.00),
(890123456780, 'Latha B', '73 Bay Avenue, Wayanad, Kerala', 38, '9145678903', 'latha.b@example.com', '2020-11-12', 77000.00),
(901234567891, 'Vikas S', '44 Garden Road, Kannur, Kerala', 30, '9156789014', 'vikas.s@example.com', '2017-10-19', 64000.00),
(123456789013, 'Meera N', '67 Palm Boulevard, Kottayam, Kerala', 27, '9167890125', 'meera.n@example.com', '2022-04-23', 54000.00),
(234567890135, 'Rohit P', '89 Mountain Street, Thrissur, Kerala', 40, '9178901236', 'rohit.p@example.com', '2020-02-05', 80000.00),
(345678901246, 'Anjali S', '56 Orchard Lane, Palakkad, Kerala', 32, '9189012347', 'anjali.s@example.com', '2021-05-14', 69000.00),
(456789012357, 'Krishna V', '23 Sunrise Avenue, Trivandrum, Kerala', 37, '9190123458', 'krishna.v@example.com', '2023-03-20', 73000.00),
(567890123468, 'Arun N', '12 Riverfront, Kozhikode, Kerala', 34, '9201234569', 'arun.n@example.com', '2019-07-26', 68000.00);



INSERT INTO room (roomNo, room_type, capacity) VALUES
(1, 'A/C', 'Single bed'),
(2, 'NON A/C', 'double bed'),
(3, 'A/C', 'Single bed'),
(4, 'NON A/C', 'double bed'),
(5, 'A/C', 'Single bed'),
(6, 'NON A/C', 'double bed'),
(7, 'A/C', 'Single bed'),
(8, 'NON A/C', 'double bed'),
(9, 'A/C', 'Single bed'),
(10, 'NON A/C', 'double bed'),
(11, 'A/C', 'Single bed'),
(12, 'NON A/C', 'double bed'),
(13, 'A/C', 'Single bed'),
(14, 'NON A/C', 'double bed'),
(15, 'A/C', 'Single bed'),
(16, 'NON A/C', 'double bed'),
(17, 'A/C', 'Single bed'),
(18, 'NON A/C', 'double bed'),
(19, 'A/C', 'Single bed'),
(20, 'NON A/C', 'double bed'),
(21, 'A/C', 'Single bed'),
(22, 'NON A/C', 'double bed'),
(23, 'A/C', 'Single bed'),
(24, 'NON A/C', 'double bed'),
(25, 'A/C', 'Single bed'),
(26, 'NON A/C', 'double bed'),
(27, 'A/C', 'Single bed'),
(28, 'NON A/C', 'double bed'),
(29, 'A/C', 'Single bed'),
(30, 'NON A/C', 'double bed'),
(31, 'A/C', 'Single bed'),
(32, 'NON A/C', 'double bed'),
(33, 'A/C', 'Single bed'),
(34, 'NON A/C', 'double bed'),
(35, 'A/C', 'Single bed'),
(36, 'NON A/C', 'double bed'),
(37, 'A/C', 'Single bed'),
(38, 'NON A/C', 'double bed'),
(39, 'A/C', 'Single bed'),
(40, 'NON A/C', 'double bed'),
(41, 'A/C', 'Single bed'),
(42, 'NON A/C', 'double bed'),
(43, 'A/C', 'Single bed'),
(44, 'NON A/C', 'double bed'),
(45, 'A/C', 'Single bed'),
(46, 'NON A/C', 'double bed'),
(47, 'A/C', 'Single bed'),
(48, 'NON A/C', 'double bed'),
(49, 'A/C', 'Single bed'),
(50, 'NON A/C', 'double bed');

INSERT INTO room (roomNo, room_type, capacity) VALUES
(51, 'A/C', 'double bed'),
(52, 'A/C', 'double bed'),
(53, 'A/C', 'double bed'),
(54, 'A/C', 'double bed'),
(55, 'A/C', 'double bed');


INSERT INTO room (roomNo, room_type, capacity) VALUES
(56, 'NON A/C', 'Single bed'),
(57, 'NON A/C', 'Single bed'),
(58, 'NON A/C', 'Single bed'),
(59, 'NON A/C', 'Single bed'),
(60, 'NON A/C', 'Single bed');



INSERT INTO food (item_num, item_name, item_type, price) VALUES
(1, 'Veg Biryani', 'veg', 150.00),
(2, 'Chicken Biryani', 'non-veg', 250.00),
(3, 'Paneer Butter Masala', 'veg', 180.00),
(4, 'Butter Chicken', 'non-veg', 280.00),
(5, 'Dal Tadka', 'veg', 120.00),
(6, 'Fish Curry', 'non-veg', 220.00),
(7, 'Mixed Vegetable Curry', 'veg', 140.00),
(8, 'Mutton Rogan Josh', 'non-veg', 350.00),
(9, 'Aloo Gobi', 'veg', 130.00),
(10, 'Prawn Masala', 'non-veg', 300.00),
(11, 'Chana Masala', 'veg', 125.00),
(12, 'Grilled Chicken', 'non-veg', 270.00),
(13, 'Mushroom Masala', 'veg', 160.00),
(14, 'Beef Fry', 'non-veg', 260.00),
(15, 'Palak Paneer', 'veg', 190.00),
(16, 'Egg Curry', 'non-veg', 180.00),
(17, 'Vegetable Fried Rice', 'veg', 140.00),
(18, 'Chicken Fried Rice', 'non-veg', 220.00),
(19, 'Gobi Manchurian', 'veg', 150.00),
(20, 'Chicken Manchurian', 'non-veg', 240.00);

INSERT INTO food (item_num, item_name, item_type, price) VALUES
(21, 'Masala Tea', 'veg', 20.00),
(22, 'Black Tea', 'veg', 15.00),
(23, 'Lemon Juice', 'veg', 30.00),
(24, 'Mango Shake', 'veg', 80.00),
(25, 'Cold Coffee', 'veg', 90.00),
(26, 'Orange Juice', 'veg', 40.00),
(27, 'Banana Shake', 'veg', 70.00),
(28, 'Green Tea', 'veg', 25.00),
(29, 'Watermelon Juice', 'veg', 50.00),
(30, 'Strawberry Shake', 'veg', 100.00);



INSERT INTO residents (aadhar_num, name, address, gender, age, mob_num, email_id) VALUES
(123456789012, 'Rajesh Kumar', '123 Main Street, Kochi, Kerala', 'male', 45, '9876543210', 'rajesh.kumar@example.com'),
(234567890123, 'Anita Sharma', '456 Elm Street, Thrissur, Kerala', 'female', 38, '9123456789', 'anita.sharma@example.com'),
(345678901234, 'Vikram Patel', '789 Oak Avenue, Calicut, Kerala', 'male', 29, '9234567890', 'vikram.patel@example.com'),
(456789012345, 'Sneha Menon', '101 Maple Drive, Palakkad, Kerala', 'female', 33, '9345678901', 'sneha.menon@example.com'),
(567890123456, 'Amit Singh', '202 Pine Road, Kannur, Kerala', 'male', 40, '9456789012', 'amit.singh@example.com'),
(678901234567, 'Deepa Nair', '303 Cedar Street, Trivandrum, Kerala', 'female', 27, '9567890123', 'deepa.nair@example.com'),
(789012345678, 'Ravi R', '404 Birch Lane, Kottayam, Kerala', 'male', 32, '9678901234', 'ravi.r@example.com'),
(890123456789, 'Meera Krishnan', '505 Willow Avenue, Alappuzha, Kerala', 'female', 35, '9789012345', 'meera.krishnan@example.com'),
(901234567890, 'Nikhil Varma', '606 Spruce Road, Ernakulam, Kerala', 'male', 50, '9890123456', 'nikhil.varma@example.com'),
(123098765432, 'Priya R', '707 Palm Street, Wayanad, Kerala', 'female', 28, '9901234567', 'priya.r@example.com'),
(234567890124, 'Arun Kumar', '808 Oak Avenue, Kozhikode, Kerala', 'male', 41, '9912345678', 'arun.kumar@example.com'),
(345678901235, 'Anjali G', '909 Maple Drive, Thrissur, Kerala', 'female', 37, '9923456789', 'anjali.g@example.com'),
(456789012346, 'Suresh B', '1010 Cedar Street, Palakkad, Kerala', 'male', 30, '9934567890', 'suresh.b@example.com'),
(567890123457, 'Latha K', '1111 Birch Lane, Kannur, Kerala', 'female', 26, '9945678901', 'latha.k@example.com'),
(678901234568, 'Ramesh S', '1212 Willow Avenue, Trivandrum, Kerala', 'male', 39, '9956789012', 'ramesh.s@example.com'),
(789012345679, 'Sunita R', '1313 Spruce Road, Kottayam, Kerala', 'female', 31, '9967890123', 'sunita.r@example.com'),
(890123456780, 'Harish V', '1414 Palm Street, Alappuzha, Kerala', 'male', 43, '9978901234', 'harish.v@example.com'),
(901234567891, 'Geetha N', '1515 Oak Avenue, Kozhikode, Kerala', 'female', 29, '9989012345', 'geetha.n@example.com'),
(123456789013, 'Vijay M', '1616 Maple Drive, Ernakulam, Kerala', 'male', 34, '9990123456', 'vijay.m@example.com'),
(234567890135, 'Sonia T', '1717 Cedar Street, Wayanad, Kerala', 'female', 42, '9901234567', 'sonia.t@example.com'),
(345678901246, 'Sanjay P', '1818 Birch Lane, Thrissur, Kerala', 'male', 26, '9912345678', 'sanjay.p@example.com'),
(456789012357, 'Nandini S', '1919 Willow Avenue, Palakkad, Kerala', 'female', 30, '9923456789', 'nandini.s@example.com'),
(567890123468, 'Rakesh G', '2020 Spruce Road, Kannur, Kerala', 'male', 28, '9934567890', 'rakesh.g@example.com'),
(678901234579, 'Jaya V', '2121 Palm Street, Trivandrum, Kerala', 'female', 33, '9945678901', 'jaya.v@example.com'),
(789012345680, 'Manoj K', '2222 Oak Avenue, Kottayam, Kerala', 'male', 45, '9956789012', 'manoj.k@example.com'),
(890123456781, 'Neetu R', '2323 Maple Drive, Alappuzha, Kerala', 'female', 40, '9967890123', 'neetu.r@example.com'),
(901234567892, 'Sandeep N', '2424 Cedar Street, Kozhikode, Kerala', 'male', 37, '9978901234', 'sandeep.n@example.com'),
(123456789014, 'Rekha M', '2525 Birch Lane, Ernakulam, Kerala', 'female', 26, '9989012345', 'rekha.m@example.com'),
(234567890146, 'Siddharth K', '2626 Willow Avenue, Wayanad, Kerala', 'male', 32, '9990123456', 'siddharth.k@example.com'),
(345678901257, 'Ayesha Q', '2727 Spruce Road, Thrissur, Kerala', 'female', 34, '9901234567', 'ayesha.q@example.com'),
(456789012368, 'Kiran B', '2828 Palm Street, Palakkad, Kerala', 'male', 39, '9912345678', 'kiran.b@example.com'),
(567890123479, 'Madhavi S', '2929 Oak Avenue, Kannur, Kerala', 'female', 31, '9923456789', 'madhavi.s@example.com');





-- Insert booking entries for Rajesh Kumar for 3 rooms in the same booking
INSERT INTO bookings (booking_id, aadhar_num, room_num, check_in_date, check_out_date, time, booking_status)
VALUES 
(1, 123456789012, 1, '2024-08-26', '2024-08-29', '12:00:00', 'confirmed'), -- A/C room
(1, 123456789012, 2, '2024-08-26', '2024-08-29', '12:00:00', 'confirmed'), -- NON A/C room
(1, 123456789012, 4, '2024-08-26', '2024-08-29', '12:00:00', 'confirmed'); -- NON A/C room


-- Insert booking entries for Anita Sharma for 4 A/C rooms in the same booking
INSERT INTO bookings (booking_id, aadhar_num, room_num, check_in_date, check_out_date, time, booking_status)
VALUES 
(2, 234567890123, 3, '2024-08-27', '2024-08-30', '14:00:00', 'confirmed'), -- A/C room
(2, 234567890123, 5, '2024-08-27', '2024-08-30', '14:00:00', 'confirmed'), -- A/C room
(2, 234567890123, 7, '2024-08-27', '2024-08-30', '14:00:00', 'confirmed'), -- A/C room
(2, 234567890123, 9, '2024-08-27', '2024-08-30', '14:00:00', 'confirmed'); -- A/C room

-- Insert booking entries for Vikram Patel for 2 NON A/C rooms in the same booking
INSERT INTO bookings (booking_id, aadhar_num, room_num, check_in_date, check_out_date, time, booking_status)
VALUES 
(3, 345678901234, 10, '2024-08-28', '2024-09-01', '10:00:00', 'confirmed'), -- NON A/C room
(3, 345678901234, 12, '2024-08-28', '2024-09-01', '10:00:00', 'confirmed'); -- NON A/C room


-- Insert booking entries for Rajesh Kumar for 3 A/C rooms in the same booking
INSERT INTO bookings (booking_id, aadhar_num, room_num, check_in_date, check_out_date, time, booking_status)
VALUES 
(4, 123456789012, 11, '2024-08-29', '2024-09-02', '15:00:00', 'confirmed'), -- A/C room
(4, 123456789012, 13, '2024-08-29', '2024-09-02', '15:00:00', 'confirmed'), -- A/C room
(4, 123456789012, 15, '2024-08-29', '2024-09-02', '15:00:00', 'confirmed'); -- A/C room


-- Insert booking entries for multiple people, each booking 1 room (A/C or NON A/C)
INSERT INTO bookings (booking_id, aadhar_num, room_num, check_in_date, check_out_date, time, booking_status)
VALUES 
(5, 567890123456, 17, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'), -- Amit Singh, A/C room
(6, 678901234567, 18, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'), -- Deepa Nair, NON A/C room
(7, 789012345678, 19, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'), -- Ravi R, A/C room
(8, 890123456789, 20, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'), -- Meera Krishnan, NON A/C room
(9, 901234567890, 21, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'), -- Nikhil Varma, A/C room
(10, 123098765432, 22, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'), -- Priya R, NON A/C room
(11, 234567890124, 23, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'), -- Arun Kumar, A/C room
(12, 345678901235, 24, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'), -- Anjali G, NON A/C room
(13, 456789012346, 25, '2024-08-30', '2024-09-03', '11:00:00', 'confirmed'); -- Suresh B, A/C room



-- Insert booking entries for Latha K for 3 A/C rooms in the same booking
INSERT INTO bookings (booking_id, aadhar_num, room_num, check_in_date, check_out_date, time, booking_status)
VALUES 
(14, 567890123457, 27, '2024-08-31', '2024-09-04', '13:00:00', 'confirmed'), -- A/C room
(14, 567890123457, 29, '2024-08-31', '2024-09-04', '13:00:00', 'confirmed'), -- A/C room
(14, 567890123457, 31, '2024-08-31', '2024-09-04', '13:00:00', 'confirmed'); -- A/C room


-- Insert another booking for Anita Sharma for 3 A/C rooms
INSERT INTO bookings (booking_id, aadhar_num, room_num, check_in_date, check_out_date, time, booking_status)
VALUES 
(15, 234567890123, 33, '2024-09-05', '2024-09-09', '16:00:00', 'confirmed'), -- A/C room
(15, 234567890123, 35, '2024-09-05', '2024-09-09', '16:00:00', 'confirmed'), -- A/C room
(15, 234567890123, 37, '2024-09-05', '2024-09-09', '16:00:00', 'confirmed'); -- A/C room



-- Insert booking entries for multiple people, each booking 2 rooms (A/C and NON A/C)
INSERT INTO bookings (booking_id, aadhar_num, room_num, check_in_date, check_out_date, time, booking_status)
VALUES 
(16, 567890123457, 39, '2024-09-10', '2024-09-14', '09:00:00', 'confirmed'), -- Latha K, A/C room
(16, 567890123457, 40, '2024-09-10', '2024-09-14', '09:00:00', 'confirmed'), -- Latha K, NON A/C room

(17, 678901234568, 41, '2024-09-10', '2024-09-14', '10:00:00', 'confirmed'), -- Ramesh S, A/C room
(17, 678901234568, 42, '2024-09-10', '2024-09-14', '10:00:00', 'confirmed'), -- Ramesh S, NON A/C room

(18, 789012345679, 43, '2024-09-10', '2024-09-14', '11:00:00', 'confirmed'), -- Sunita R, A/C room
(18, 789012345679, 44, '2024-09-10', '2024-09-14', '11:00:00', 'confirmed'), -- Sunita R, NON A/C room

(19, 890123456780, 45, '2024-09-10', '2024-09-14', '12:00:00', 'confirmed'), -- Harish V, A/C room
(19, 890123456780, 46, '2024-09-10', '2024-09-14', '12:00:00', 'confirmed'), -- Harish V, NON A/C room

(20, 901234567891, 47, '2024-09-10', '2024-09-14', '13:00:00', 'confirmed'), -- Geetha N, A/C room
(20, 901234567891, 48, '2024-09-10', '2024-09-14', '13:00:00', 'confirmed'), -- Geetha N, NON A/C room

(21, 123456789013, 49, '2024-09-10', '2024-09-14', '14:00:00', 'confirmed'), -- Vijay M, A/C room
(21, 123456789013, 50, '2024-09-10', '2024-09-14', '14:00:00', 'confirmed'), -- Vijay M, NON A/C room

(22, 234567890135, 51, '2024-09-10', '2024-09-14', '15:00:00', 'confirmed'), -- Sonia T, A/C room
(22, 234567890135, 56, '2024-09-10', '2024-09-14', '15:00:00', 'confirmed'); -- Sonia T, NON A/C room






-- Insert companion entries for Rajesh Kumar's booking (booking_id 1)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(111122223333, 'Sanjay Kumar', 'male', '9876543211', 123456789012, 1),
(222233334444, 'Meena Kumari', 'female', '9876543212', 123456789012, 1),
(333344445555, 'Ravi Shankar', 'male', '9876543213', 123456789012, 1),
(444455556666, 'Pooja R', 'female', '9876543214', 123456789012, 1),
(555566667777, 'Arya N', 'female', '9876543215', 123456789012, 1);


-- Insert companion entries for Anita Sharma's booking (booking_id 2)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(111223344556, 'Ravi Kumar', 'male', '9956789013', 234567890123, 2),
(222334455667, 'Sunita Singh', 'female', '9956789014', 234567890123, 2),
(333445566778, 'Anil Gupta', 'male', '9956789015', 234567890123, 2),
(444556677889, 'Geeta R', 'female', '9956789016', 234567890123, 2),
(555667788990, 'Kumar Vishal', 'male', '9956789017', 234567890123, 2),
(666778899001, 'Neeta Sharma', 'female', '9956789018', 234567890123, 2),
(777889900112, 'Rajeev Reddy', 'male', '9956789019', 234567890123, 2),
(888900011223, 'Priti K', 'female', '9956789020', 234567890123, 2);


-- Insert companion entries for Vikram Patel's booking (booking_id 3)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(111223344558, 'Deepak Kumar', 'male', '9967890124', 345678901234, 3),
(222334455668, 'Sita Devi', 'female', '9967890125', 345678901234, 3);



-- Insert companion entries for Rajesh Kumar's new booking (booking_id 4)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(111223344559, 'Nisha Kumari', 'female', '9976543211', 123456789012, 4),
(222334455669, 'Suresh Mehta', 'male', '9976543212', 123456789012, 4),
(333445566779, 'Anjali Sharma', 'female', '9976543213', 123456789012, 4);



-- Insert companion entries for Amit Singh's booking (booking_id 5)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(111223344560, 'Karan Singh', 'male', '9988776655', 567890123456, 5),
(222334455670, 'Rita Singh', 'female', '9988776656', 567890123456, 5);

-- Insert companion entries for Deepa Nair's booking (booking_id 6)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(333445566780, 'Manoj Nair', 'male', '9988776657', 678901234567, 6),
(444556677890, 'Sonia Nair', 'female', '9988776658', 678901234567, 6);

-- Insert companion entries for Ravi R's booking (booking_id 7)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(555667788901, 'Ramesh R', 'male', '9988776659', 789012345678, 7),
(666778899012, 'Pooja R', 'female', '9988776660', 789012345678, 7);

-- Insert companion entries for Meera Krishnan's booking (booking_id 8)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(777889900123, 'Ajay Krishnan', 'male', '9988776661', 890123456789, 8),
(888900011234, 'Anu Krishnan', 'female', '9988776662', 890123456789, 8);

-- Insert companion entries for Nikhil Varma's booking (booking_id 9)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(999011223345, 'Rajesh Varma', 'male', '9988776663', 901234567890, 9),
(101122334456, 'Sita Varma', 'female', '9988776664', 901234567890, 9);

-- Insert companion entries for Priya R's booking (booking_id 10)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(121233445567, 'Vikram R', 'male', '9988776665', 123098765432, 10),
(131344556678, 'Kavita R', 'female', '9988776666', 123098765432, 10);

-- Insert companion entries for Arun Kumar's booking (booking_id 11)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(141455667789, 'Sanjay Kumar', 'male', '9988776667', 234567890124, 11),
(151566778890, 'Meena Kumar', 'female', '9988776668', 234567890124, 11);

-- Insert companion entries for Anjali G's booking (booking_id 12)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(161677889901, 'Ravi G', 'male', '9988776669', 345678901235, 12),
(171788900012, 'Sonia G', 'female', '9988776670', 345678901235, 12);

-- Insert companion entries for Suresh B's booking (booking_id 13)
INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(181899011123, 'Anil B', 'male', '9988776671', 456789012346, 13),
(191900122234, 'Geeta B', 'female', '9988776672', 456789012346, 13);



INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(201234567890, 'Rajesh K', 'male', '9445678901', 567890123457, 14),
(202345678901, 'Anita K', 'female', '9445678902', 567890123457, 14),
(203456789012, 'Vikram K', 'male', '9445678903', 567890123457, 14);


INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(301234567890, 'Amit Sharma', 'male', '9523456789', 234567890123, 15),
(302345678901, 'Geeta Sharma', 'female', '9523456790', 234567890123, 15),
(303456789012, 'Sonia Sharma', 'female', '9523456791', 234567890123, 15);


INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(401234567890, 'Ravi L', 'male', '9945678904', 567890123457, 16),
(402345678901, 'Maya L', 'female', '9945678905', 567890123457, 16),
(403456789012, 'Raj L', 'male', '9945678906', 567890123457, 16),
(404567890123, 'Anu L', 'female', '9945678907', 567890123457, 16);


INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(501234567890, 'Nita S', 'female', '9956789013', 678901234568, 17),
(502345678901, 'Ravi S', 'male', '9956789014', 678901234568, 17),
(503456789012, 'Kiran S', 'male', '9956789015', 678901234568, 17);


INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(601234567890, 'Arun R', 'male', '9967890124', 789012345679, 18),
(602345678901, 'Deepa R', 'female', '9967890125', 789012345679, 18),
(603456789012, 'Sita R', 'female', '9967890126', 789012345679, 18),
(604567890123, 'Vijay R', 'male', '9967890127', 789012345679, 18);


INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(701234567890, 'Maya V', 'female', '9978901235', 890123456780, 19),
(702345678901, 'Vikram V', 'male', '9978901236', 890123456780, 19),
(703456789012, 'Neha V', 'female', '9978901237', 890123456780, 19),
(704567890123, 'Sandeep V', 'male', '9978901238', 890123456780, 19);


INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(801234567890, 'Anil N', 'male', '9989012346', 901234567891, 20),
(802345678901, 'Kavita N', 'female', '9989012347', 901234567891, 20),
(803456789012, 'Raj N', 'male', '9989012348', 901234567891, 20),
(804567890123, 'Pooja N', 'female', '9989012349', 901234567891, 20);


INSERT INTO companions (caadhar_num, name, gender, mob_num, res_aadhar_num, booking_id)
VALUES 
(901234567890, 'Sita M', 'female', '9990123457', 123456789013, 21),
(902345678901, 'Raj M', 'male', '9990123458', 123456789013, 21),
(903456789012, 'Neha M', 'female', '9990123459', 123456789013, 21),
(904567890123, 'Kiran M', 'male', '9990123460', 123456789013, 21);




INSERT INTO food_order (order_num, res_aadhar_num, item_num, quantity, order_date) VALUES
(1, '123456789012', 21, 1, '2024-08-25'),
(1, '123456789012', 22, 1, '2024-08-25'),
(2, '123456789012', 1, 1, '2024-08-26'),
(2, '123456789012', 2, 1, '2024-08-26'),
(3, '234567890123', 1, 1, '2024-08-27'),
(3, '234567890123', 21, 1, '2024-08-27'),
(4, '678901234579', 5, 1, '2024-08-28'),
(4, '678901234579', 21, 1, '2024-08-28'),
(5, '789012345680', 10, 1, '2024-08-29'),
(5, '789012345680', 21, 1, '2024-08-29'),
(6, '890123456781', 9, 1, '2024-08-30'),
(6, '890123456781', 22, 1, '2024-08-30'),
(7, '901234567892', 4, 1, '2024-08-24'),
(7, '901234567892', 21, 1, '2024-08-24'),
(8, '123456789014', 17, 1, '2024-08-26'),
(8, '123456789014', 23, 1, '2024-08-26'),
(9, '234567890146', 8, 1, '2024-08-27'),
(9, '234567890146', 21, 1, '2024-08-27'),
(10, '345678901257', 11, 1, '2024-08-29'),
(10, '345678901257', 26, 1, '2024-08-29'),
(11, '456789012368', 6, 1, '2024-08-28'),
(11, '456789012368', 21, 1, '2024-08-28'),
(12, '567890123479', 19, 1, '2024-08-29'),
(12, '567890123479', 24, 1, '2024-08-29');


/*1.*/

select name,aadhar_num,mob_num,address from residents where aadhar_num in(select res_aadhar_num from companions group by booking_id,res_aadhar_num having count(*) > 3 );



/*2. */

create view data as select res_aadhar_num,booking_id,count(*) as number_of_companion from companions
where
res_aadhar_num in(select aadhar_num from bookings where check_in_date between '2024-08-05' and '2024-10-03') 
group by res_aadhar_num,booking_id;


select r.aadhar_num,r.name,r.mob_num,d.number_of_companion from residents r join data d on r.aadhar_num=d.res_aadhar_num;


/*3.*/


create view data3 as select aadhar_num,booking_id,count(*) from bookings where room_num in(select roomNo from room where room_type='A/C') group by aadhar_num,booking_id having count(*)>2;



select name,aadhar_num,mob_num from residents where aadhar_num in (select aadhar_num from data3 group by aadhar_num having count(*)>=2);


/* 4.*/

create view data4 as select item_num,count(*) as count from food_order group by item_num;

select item_num,item_type,item_name,price,'MAX' as max_or_min from food where item_num in(select item_num from data4 where count in(select max(count) from data4))
union all
select item_num,item_type,item_name,price,'MIN' as min_or_max from food where item_num in(select item_num from data4 where count in(select min(count) from data4));


/* 5.*/

create view data5 as SELECT item_num, COUNT(*) as count  FROM food_order WHERE order_date BETWEEN '2024-08-25' AND '2024-08-28' GROUP BY item_num ;


SELECT data5.item_num, data5.count, food.price FROM data5 JOIN food ON data5.item_num = food.item_num ORDER BY data5.count DESC, food.price ASC;


drop view data;
drop view data3;
drop view data4;
drop view data5;
drop table food_order;
drop table companions;
drop table bookings;
drop table residents;
drop table food;
drop table room;
drop table employees;













