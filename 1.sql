

create table customer (aadhar_num varchar(15) UNIQUE PRIMARY KEY,
name varchar(100) NOT NULL,
pan_num varchar(10) unique NOT NULL,
mob_num varchar(10)  NOT NULL,
address TEXT NOT NULL,
email_id varchar(100) unique NOT NULL);



CREATE TABLE chitty(chitty_num int NOT NULL,
branch varchar(100) NOT NULL,
amount_chitty varchar(100) NOT NULL,
start_date DATE NOT NULL,
no_of_installment int NOT NULL,
chitty_status varchar(10) CHECK(chitty_status IN ('CLOSED','NOT')) NOT NULL,
PRIMARY KEY(chitty_num,branch));





CREATE TABLE customer_chitty(
aadhar_num varchar(15) NOT NULL,
branch varchar(100) NOT NULL,
chitty_num INT NOT NULL,
chittal_num INT NOT NULL,
PRIMARY KEY(branch,chitty_num,chittal_num),
FOREIGN KEY(aadhar_num) REFERENCES customer(aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(chitty_num,branch) REFERENCES chitty(chitty_num,branch)
ON UPDATE CASCADE
ON DELETE CASCADE);



CREATE TABLE chitty_payment(
chitty_num INT NOT NULL,
chittal_num INT NOT NULL,
branch VARCHAR(100) NOT NULL,
paid_amount DECIMAL(15,2) NOT NULL,
paid_date DATE NOT NULL,
mode_of_payment VARCHAR(20) NOT NULL,
payment_branch varchar(100) NOT NULL,
PRIMARY KEY(branch,chitty_num,chittal_num,paid_date),
FOREIGN KEY(chitty_num,branch,chittal_num) REFERENCES customer_chitty(chitty_num,branch,chittal_num)
ON UPDATE CASCADE
ON DELETE CASCADE
);



CREATE TABLE chitty_auction(
aadhar_num varchar(15),
chitty_num INT NOT NULL,
chittal_num INt NOT NULL,
branch varchar(100) NOT NULL,
earned_amount DECIMAL(15,2) NOT NULL,
PRIMARY KEY(chittal_num,chitty_num,branch),
FOREIGN KEY(chitty_num,branch,chittal_num) REFERENCES customer_chitty(chitty_num,branch,chittal_num)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(aadhar_num) REFERENCES customer(aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE
);



CREATE TABLE Loan(
loan_num INT NOT NULL,
branch VARCHAR(100) NOT NULL,
loan_type varchar(20) CHECK (loan_type IN('Home Loan','Personal Loan','Car Loan','Business Loan')) NOT NULL,
aadhar_num varchar(15) NOT NULL,
chitty_num int NOT NULL,
loan_amount DECIMAL(15,2) NOT NULL,
loan_period INT NOT NULL,
emi DECIMAL(15,2) NOT NULL,
PRIMARY KEY(loan_num,branch),
FOREIGN KEY(aadhar_num) REFERENCES customer(aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(chitty_num) REFERENCES chitty(chitty_num)
ON UPDATE CASCADE
ON DELETE CASCADE);



CREATE TABLE Loan_Payment(
    aadhar_num VARCHAR(15),
    loan_num INT NOT NULL,
    branch VARCHAR(100) NOT NULL,
    emi DECIMAL(15,2) NOT NULL,
    date_of_payment DATE NOT NULL,
    branch_of_payment VARCHAR(100),
    PRIMARY KEY(loan_num, branch, date_of_payment),
    FOREIGN KEY(aadhar_num) REFERENCES customer(aadhar_num)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY(loan_num, branch) REFERENCES Loan(loan_num, branch)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


INSERT INTO customer (aadhar_num, name, pan_num, mob_num, address, email_id) VALUES
('012 345 678 010', 'Amit Sharma', 'JKLM0123N', '9876543239', '10 Forest Road, Kottayam, Kerala', 'amit.sharma@example.com'),
('012 345 678 030', 'Priti Nair', 'T0UV1234W', '9876543269', '69 Garden Grove, Kasaragod, Kerala', 'priti.nair123@example.com'),
('012 345 678 040', 'Rajeev Iyer', 'DEFG1234G', '9876543279', '79 Valley Road, Kozhikode, Kerala', 'rajeev.iyer123@example.com'),
('012 345 678 912', 'Nikhil Kumar', 'TUVWX0123Y', '9876543229', '456 Hilltop Lane, Thiruvananthapuram, Kerala', 'nikhil.kumar@example.com'),
('123 456 789 012', 'Anand Kumar', 'ABCDE1234F', '9876543210', '123 MG Road, Ernakulam, Kerala', 'anand.kumar@example.com'),
('123 456 789 021', 'Rajesh Reddy', 'K1LM2345N', '9876543260', '60 Hill View, Wayanad, Kerala', 'rajesh.reddy123@example.com'),
('123 456 789 100', 'Aishwarya Menon', 'ABCD1234E', '9876543230', '1 Main Street, Kochi, Kerala', 'aishwarya.menon@example.com'),
('123 456 789 110', 'Pooja Menon', 'KLMN1234O', '9876543240', '11 Blue Ridge, Ernakulam, Kerala', 'pooja.menon@example.com'),
('123 456 789 901', 'Sandeep Rao', 'A1BC2345D', '9876543250', '50 Palm Road, Kochi, Kerala', 'sandeep.rao@example.com'),
('234 567 890 032', 'Anil Kumar', 'V2WX3456Y', '9876543271', '71 Hill View, Malappuram, Kerala', 'anil.kumar123@example.com'),
('234 567 890 042', 'Amit Reddy', 'FGHI3456I', '9876543281', '81 Garden Grove, Kannur, Kerala', 'amit.reddy456@example.com'),
('234 567 890 123', 'Ravi Nair', 'BCDEF2345G', '9876543211', '456 NH Road, Thiruvananthapuram, Kerala', 'ravi.nair@example.com'),
('234 567 890 200', 'Rajesh Kumar', 'BCDE2345F', '9876543231', '2 Market Road, Palakkad, Kerala', 'rajesh.kumar@example.com'),
('234 567 890 210', 'Haritha Nair', 'LMNO2345P', '9876543241', '12 Palm Grove, Thrissur, Kerala', 'haritha.nair@example.com'),
('345 678 901 234', 'Lakshmi Menon', 'CDEFG3456H', '9876543212', '789 Temple Street, Kozhikode, Kerala', 'lakshmi.menon@example.com'),
('345 678 901 235', 'Ramesh Warrier', 'MNOPQ3456R', '9876543222', '123 Hill View, Idukki, Kerala', 'ramesh.warrier@example.com'),
('345 678 901 300', 'Anju S', 'CDEF3456G', '9876543232', '3 College Avenue, Thrissur, Kerala', 'anju.s@example.com'),
('345 678 901 310', 'Akash S', 'MNOP3456Q', '9876543242', '13 Lotus Lane, Thiruvananthapuram, Kerala', 'akash.s@example.com'),
('456 789 012 345', 'Suresh Pillai', 'DEFGH4567I', '9876543213', '321 Lake View, Alappuzha, Kerala', 'suresh.pillai@example.com'),
('456 789 012 400', 'Manoj Nair', 'DEFG4567H', '9876543233', '4 Garden Lane, Malappuram, Kerala', 'manoj.nair@example.com'),
('456 789 012 410', 'Sushma Rao', 'NOPQ4567R', '9876543243', '14 Ocean View, Alappuzha, Kerala', 'sushma.rao@example.com'),
('567 890 123 456', 'Meera Das', 'EFGHI5678J', '9876543214', '654 Hilltop, Kollam, Kerala', 'meera.das@example.com'),
('567 890 123 500', 'Sanya Sharma', 'EFGH5678I', '9876543234', '5 Park Street, Kozhikode, Kerala', 'sanya.sharma@example.com'),
('567 890 123 510', 'Karthik R', 'OPQR5678S', '9876543244', '15 Valley Road, Kannur, Kerala', 'karthik.r@example.com'),
('567 890 123 905', 'Deepa Menon', 'E5FG6789H', '9876543254', '54 Garden Avenue, Idukki, Kerala', 'deepa.menon@example.com'),
('678 901 234 568', 'Rita Menon', 'PQRST6789U', '9876543225', '321 Ocean Lane, Kollam, Kerala', 'rita.menon@example.com'),
('789 012 345 037', 'Haritha Menon', 'A7BC8901D', '9876543276', '76 Hilltop, Palakkad, Kerala', 'haritha.menon123@example.com'),
('789 012 345 679', 'Sajan Thomas', 'QRSTU7890V', '9876543226', '654 River View, Kannur, Kerala', 'sajan.thomas@example.com'),
('789 012 345 700', 'Nisha Patel', 'GHIJ7890K', '9876543236', '7 Riverbank, Idukki, Kerala', 'nisha.patel@example.com'),
('890 123 456 038', 'Vinay Kumar', 'B8CD9012E', '9876543277', '77 Meadow Lane, Ernakulam, Kerala', 'vinay.kumar123@example.com'),
('890 123 456 790', 'Kiran Joseph', 'RSTUV8901W', '9876543227', '987 Mountain Lane, Kottayam, Kerala', 'kiran.joseph@example.com'),
('901 234 567 039', 'Seema Rao', 'C9DE0123F', '9876543278', '78 Sunset Boulevard, Malappuram, Kerala', 'seema.rao123@example.com'),
('901 234 567 900', 'Divya S', 'IJKL9012M', '9876543238', '9 Sunset Boulevard, Pathanamthitta, Kerala', 'divya.s@example.com');



INSERT INTO customer(aadhar_num, name, pan_num, mob_num, address, email_id) VALUES
('012 345 678 999', 'Asma P A', 'XYZ1234A', '9876543290', '123 New Street, Kottayam, Kerala', 'asma.pa@example.com'),
('012 345 678 998', 'Anjana K Santhosh', 'XYZ1234B', '9876543291', '124 New Street, Kottayam, Kerala', 'anjana.santhosh@example.com'),
('012 345 678 997', 'Mila Joseph', 'XYZ1234C', '9876543292', '125 New Street, Kottayam, Kerala', 'mila.joseph@example.com'),
('012 345 678 996', 'Shifa S', 'XYZ1234D', '9876543293', '126 New Street, Kottayam, Kerala', 'shifa.s@example.com'),
('012 345 678 995', 'Anshhif P A', 'XYZ1234E', '9876543294', '127 New Street, Kottayam, Kerala', 'anshhif.pa@example.com'),
('012 345 678 994', 'Ansaf P A', 'XYZ1234F', '9876543295', '128 New Street, Kottayam, Kerala', 'ansaf.pa@example.com'),
('012 345 678 993', 'Shajeera R M', 'XYZ1234G', '9876543296', '129 New Street, Kottayam, Kerala', 'shajeera.rm@example.com'),
('012 345 678 992', 'Kaleed P M', 'XYZ1234H', '9876543297', '130 New Street, Kottayam, Kerala', 'kaleed.pm@example.com'),
('012 345 678 991', 'Abbas P M', 'XYZ1234I', '9876543298', '131 New Street, Kottayam, Kerala', 'abbas.pm@example.com'),
('012 345 678 990', 'Abbobakkar', 'XYZ1234J', '9876543299', '132 New Street, Kottayam, Kerala', 'abbobakkar@example.com');


INSERT INTO customer (aadhar_num, name, pan_num, mob_num, address, email_id) VALUES
('012 345 678 111', 'Geetha K', 'ABCD1234Z', '9876543280', '111 Seaside Avenue, Kollam, Kerala', 'geetha.k@example.com'),
('123 456 789 222', 'Mohan R', 'PQRS5678T', '9876543290', '222 Hill View, Alappuzha, Kerala', 'mohan.r@example.com'),
('234 567 890 333', 'Rekha S', 'WXYZ7890V', '9876543300', '333 Garden Lane, Kannur, Kerala', 'rekha.s@example.com'),
('345 678 901 444', 'Kiran P', 'EFGH9012W', '9876543310', '444 River Road, Kottayam, Kerala', 'kiran.p@example.com'),
('456 789 012 555', 'Vikram A', 'IJKL0123X', '9876543320', '555 Sunset Boulevard, Ernakulam, Kerala', 'vikram.a@example.com'),
('567 890 123 666', 'Leela M', 'MNOP3456Y', '9876543330', '666 Ocean Drive, Thrissur, Kerala', 'leela.m@example.com');

INSERT INTO customer (aadhar_num, name, pan_num, mob_num, address, email_id) VALUES
    ('901 234 567 891', 'Jaseena', 'JASEN1234P', '9876543211', '123 Sunrise Avenue, Kochi, Kerala', 'jaseena@example.com'),
    ('901 234 567 892', 'Hasi', 'HASI1234Q', '9876543212', '456 Sunset Boulevard, Kottayam, Kerala', 'hasi@example.com'),
    ('901 234 567 893', 'Munthas', 'MUNT1234R', '9876543213', '789 River Road, Malappuram, Kerala', 'munthas@example.com'),
    ('901 234 567 894', 'Kaleed', 'KALEE1234S', '9876543214', '321 Garden Street, Kasaragod, Kerala', 'kaleed@example.com'),
    ('901 234 567 895', 'Sulaiman', 'SULAI1234T', '9876543215', '654 Valley View, Thrissur, Kerala', 'sulaiman@example.com'),
    ('901 234 567 896', 'Kiran', 'KIRAN1234U', '9876543216', '987 Mountain Drive, Ernakulam, Kerala', 'kiran@example.com'),
    ('901 234 567 897', 'Favas', 'FAVAS1234V', '9876543217', '741 Ocean View, Kollam, Kerala', 'favas@example.com'),
    ('901 234 567 898', 'Sajeer', 'SAJEE1234W', '9876543218', '852 Pine Lane, Kozhikode, Kerala', 'sajeer@example.com');




INSERT INTO chitty (chitty_num, branch, amount_chitty, start_date, no_of_installment, chitty_status) VALUES
(101, 'Ernakulam', '500,000', '2023-01-15', 20, 'NOT'),
(101, 'Kollam', '500,000', '2023-01-15', 20, 'NOT'),
(101, 'Kozhikode', '500,000', '2024-01-15', 20, 'NOT'),
(102, 'Thiruvananthapuram', '250,000', '2022-05-10', 15, 'CLOSED'),
(103, 'Kottayam', '750,000', '2023-03-20', 25, 'NOT'),
(105, 'Kannur', '600,000', '2023-02-05', 18, 'NOT'),
(105, 'Ernakulam', '600,000', '2023-02-05', 18, 'NOT'),
(106, 'Kottayam', '400,000', '2022-10-10', 20, 'NOT'),
(106, 'Thiruvananthapuram', '400,000', '2022-10-10', 20, 'NOT'),
(107, 'Kannur', '300,000', '2021-12-25', 12, 'CLOSED'),
(108, 'Ernakulam', '200,000', '2023-04-18', 10, 'NOT'),
(108, 'Kozhikode', '200,000', '2023-04-18', 10, 'NOT'),
(110, 'Kottayam', '350,000', '2023-06-12', 20, 'NOT');





INSERT INTO customer_chitty(aadhar_num,branch,chitty_num,chittal_num) VALUES
('123 456 789 012','Ernakulam',101,1),
('123 456 789 012','Ernakulam',101,2),
('567 890 123 456','Ernakulam',101,3),
('234 567 890 123','Ernakulam',101,4),
('234 567 890 123','Ernakulam',101,5);



INSERT INTO customer_chitty (aadhar_num, branch, chitty_num, chittal_num) VALUES
('890 123 456 038', 'Kottayam', 103, 1),
('567 890 123 905', 'Kottayam', 103, 2),
('789 012 345 700', 'Kottayam', 103, 3),
('012 345 678 010', 'Kottayam', 103, 4);


INSERT INTO customer_chitty (aadhar_num, branch, chitty_num, chittal_num) VALUES
('012 345 678 912', 'Kollam', 101, 1),
('456 789 012 345', 'Kollam', 101, 2),
('678 901 234 568', 'Kollam', 101, 3),
('789 012 345 679', 'Kollam', 101, 4),
('890 123 456 790', 'Kollam', 101, 5);

INSERT INTO customer_chitty (aadhar_num, branch, chitty_num, chittal_num) VALUES
('012 345 678 010', 'Kozhikode', 101, 1),
('123 456 789 110', 'Kozhikode', 101, 2),
('234 567 890 210', 'Kozhikode', 101, 3),
('345 678 901 310', 'Kozhikode', 101, 4),
('456 789 012 410', 'Kozhikode', 101, 5),
('567 890 123 510', 'Kozhikode', 101, 6);




INSERT INTO customer_chitty (aadhar_num, branch, chitty_num, chittal_num) VALUES
('123 456 789 100', 'Thiruvananthapuram', 102, 1),
('234 567 890 200', 'Thiruvananthapuram', 102, 2),
('345 678 901 300', 'Thiruvananthapuram', 102, 3),
('456 789 012 400', 'Thiruvananthapuram', 102, 4),
('567 890 123 500', 'Thiruvananthapuram', 102, 5);

INSERT INTO customer_chitty (aadhar_num, branch, chitty_num, chittal_num) VALUES
('012 345 678 995', 'Thiruvananthapuram', 102, 6), 
('012 345 678 994', 'Thiruvananthapuram', 102, 7), 
('012 345 678 993', 'Thiruvananthapuram', 102, 8), 
('012 345 678 992', 'Thiruvananthapuram', 102, 9), 
('012 345 678 991', 'Thiruvananthapuram', 102, 10), 
('012 345 678 990', 'Thiruvananthapuram', 102, 11),
('012 345 678 999', 'Thiruvananthapuram', 102, 12), 
('012 345 678 998', 'Thiruvananthapuram', 102, 13), 
('012 345 678 997', 'Thiruvananthapuram', 102, 14), 
('012 345 678 996', 'Thiruvananthapuram', 102, 15); 



INSERT INTO customer_chitty (aadhar_num, branch, chitty_num, chittal_num) VALUES
('123 456 789 021','Kannur',107,1),
('901 234 567 039','Kannur',107,2),
('012 345 678 030','Kannur',107,3),
('234 567 890 042','Kannur',107,4),
('012 345 678 040','Kannur',107,5);



INSERT INTO customer_chitty(aadhar_num,branch,chitty_num,chittal_num) VALUES


('901 234 567 900','Kannur',107,7),
('345 678 901 234','Kannur',107,8),
('345 678 901 235','Kannur',107,9),
('012 345 678 040','Kannur',107,10),
('123 456 789 901','Kannur',107,11),
('234 567 890 032','Kannur',107,12);








INSERT INTO chitty_payment (chitty_num, chittal_num, branch, paid_amount, paid_date, mode_of_payment, payment_branch)
VALUES
    (101, 1, 'Kozhikode', 5000.00, '2024-03-01', 'Cash', 'Kozhikode'),
    (101, 1, 'Kozhikode', 5000.00, '2024-04-01', 'Cash', 'Kozhikode'),
    (101, 1, 'Kozhikode', 5000.00, '2024-05-01', 'Online', 'Ernakulam'),
    (101, 1, 'Kozhikode', 5000.00, '2024-06-01', 'Cash', 'Kozhikode'),
    (101, 1, 'Kozhikode', 5000.00, '2024-07-01', 'Cash', 'Kozhikode'),

    (101, 2, 'Kozhikode', 5000.00, '2024-03-01', 'Cheque', 'Kozhikode'),
    (101, 2, 'Kozhikode', 5000.00, '2024-04-01', 'Cash', 'Kozhikode'),
    (101, 2, 'Kozhikode', 5000.00, '2024-05-01', 'Cash', 'Kozhikode'),
    (101, 2, 'Kozhikode', 5000.00, '2024-06-01', 'Online', 'Ernakulam'),
    (101, 2, 'Kozhikode', 5000.00, '2024-07-01', 'Online', 'Kozhikode'),

    (101, 3, 'Kozhikode', 5000.00, '2024-03-01', 'Online', 'Kozhikode'),
    (101, 3, 'Kozhikode', 5000.00, '2024-04-01', 'Online', 'Kozhikode'),
    (101, 3, 'Kozhikode', 5000.00, '2024-05-01', 'Online', 'Kozhikode'),
    (101, 3, 'Kozhikode', 5000.00, '2024-06-01', 'Online', 'Kozhikode'),
    (101, 3, 'Kozhikode', 5000.00, '2024-07-01', 'Online', 'Kozhikode'),

    (101, 4, 'Kozhikode', 5000.00, '2024-03-01', 'Online', 'Kozhikode'),
    (101, 4, 'Kozhikode', 5000.00, '2024-04-01', 'Online', 'Kozhikode'),
    (101, 4, 'Kozhikode', 5000.00, '2024-05-01', 'cash', 'Kozhikode'),
    (101, 4, 'Kozhikode', 5000.00, '2024-06-01', 'Online', 'Kozhikode'),
    (101, 4, 'Kozhikode', 5000.00, '2024-07-01', 'Online', 'Kozhikode'),

    (101, 5, 'Kozhikode', 5000.00, '2024-03-01', 'Online', 'Kozhikode'),
    (101, 5, 'Kozhikode', 5000.00, '2024-04-01', 'Online', 'Kozhikode'),
    (101, 5, 'Kozhikode', 5000.00, '2024-05-01', 'Online', 'Kozhikode'),
    (101, 5, 'Kozhikode', 5000.00, '2024-06-01', 'Online', 'Kozhikode'),
    (101, 5, 'Kozhikode', 5000.00, '2024-07-01', 'Online', 'Kozhikode'),

    (101, 6, 'Kozhikode', 5000.00, '2024-03-01', 'Online', 'Kozhikode'),
    (101, 6, 'Kozhikode', 5000.00, '2024-04-01', 'Online', 'Kozhikode'),
    (101, 6, 'Kozhikode', 5000.00, '2024-05-01', 'Online', 'Kozhikode'),
    (101, 6, 'Kozhikode', 5000.00, '2024-06-01', 'Online', 'Kozhikode'),
    (101, 6, 'Kozhikode', 5000.00, '2024-07-01', 'Online', 'Kozhikode'),

    (102, 1, 'Thiruvananthapuram', 4000.00, '2024-04-15', 'Cash', 'Thiruvananthapuram'),
    (102, 1, 'Thiruvananthapuram', 4000.00, '2024-05-15', 'Cash', 'Thiruvananthapuram'),
    (102, 1, 'Thiruvananthapuram', 4000.00, '2024-06-15', 'Cash', 'Thiruvananthapuram'),
    (101, 4, 'Ernakulam', 3500.00, '2024-07-25', 'Cheque', 'Ernakulam'),
    (101, 5, 'Ernakulam', 3500.00, '2024-07-25', 'Cheque', 'Kozhikode'),
    (103, 1, 'Kottayam', 750.00, '2024-07-25', 'Cheque', 'Kozhikode'),
    (102, 1, 'Thiruvananthapuram', 4000.00, '2024-07-15', 'Online', 'Thiruvananthapuram'),
    (102, 2, 'Thiruvananthapuram', 4000.00, '2024-07-15', 'Cash', 'Thiruvananthapuram'),
    (102, 3, 'Thiruvananthapuram', 4000.00, '2024-07-15', 'Online', 'Thiruvananthapuram');







-- Insert winning members with their respective bid amounts
INSERT INTO chitty_auction (aadhar_num, chitty_num, chittal_num, branch, earned_amount) VALUES
    ('123 456 789 100', 102, 1, 'Thiruvananthapuram', 200000.00),
    ('234 567 890 200', 102, 2, 'Thiruvananthapuram', 210000.00),
    ('345 678 901 300', 102, 3, 'Thiruvananthapuram', 220000.00),
    ('456 789 012 400', 102, 4, 'Thiruvananthapuram', 230000.00),
    ('567 890 123 500', 102, 5, 'Thiruvananthapuram', 240000.00);

-- Insert non-winning members with the distributed amount
INSERT INTO chitty_auction (aadhar_num, chitty_num, chittal_num, branch, earned_amount) VALUES
    ('012 345 678 995', 102, 6, 'Thiruvananthapuram', 15000.00), 
    ('012 345 678 994', 102, 7, 'Thiruvananthapuram', 15000.00), 
    ('012 345 678 993', 102, 8, 'Thiruvananthapuram', 15000.00), 
    ('012 345 678 992', 102, 9, 'Thiruvananthapuram', 15000.00), 
    ('012 345 678 991', 102, 10, 'Thiruvananthapuram', 15000.00), 
    ('012 345 678 990', 102, 11, 'Thiruvananthapuram', 15000.00),
    ('012 345 678 999', 102, 12, 'Thiruvananthapuram', 15000.00), 
    ('012 345 678 998', 102, 13, 'Thiruvananthapuram', 15000.00), 
    ('012 345 678 997', 102, 14, 'Thiruvananthapuram', 15000.00), 
    ('012 345 678 996', 102, 15, 'Thiruvananthapuram', 15000.00);


INSERT INTO chitty_auction (aadhar_num, chitty_num, chittal_num, branch, earned_amount) VALUES
    ('123 456 789 021', 107, 1, 'Kannur', 280000.00), -- Month 1
    ('901 234 567 039', 107, 2, 'Kannur', 275000.00), -- Month 2
    ('012 345 678 030', 107, 3, 'Kannur', 270000.00), -- Month 3
    ('234 567 890 042', 107, 4, 'Kannur', 265000.00), -- Month 4
    ('012 345 678 040', 107, 5, 'Kannur', 260000.00), -- Month 5
    ('901 234 567 900', 107, 7, 'Kannur', 255000.00), -- Month 6
    ('345 678 901 234', 107, 8, 'Kannur', 250000.00), -- Month 7
    ('345 678 901 235', 107, 9, 'Kannur', 245000.00), -- Month 8
    ('012 345 678 040', 107, 10, 'Kannur', 240000.00), -- Month 9
    ('123 456 789 901', 107, 11, 'Kannur', 235000.00), -- Month 10
    ('234 567 890 032', 107, 12, 'Kannur', 230000.00); -- Month 11


-- Insert auction data for these members
INSERT INTO chitty_auction (aadhar_num, chitty_num, chittal_num, branch, earned_amount) VALUES
    ('123 456 789 012', 101, 1, 'Ernakulam', 480000.00), -- Month 1
    ('123 456 789 012', 101, 2, 'Ernakulam', 475000.00), -- Month 2
    ('567 890 123 456', 101, 3, 'Ernakulam', 470000.00), -- Month 3
    ('234 567 890 123', 101, 4, 'Ernakulam', 465000.00), -- Month 4
    ('234 567 890 123', 101, 5, 'Ernakulam', 460000.00); -- Month 5


-- Insert auction data for these members
INSERT INTO chitty_auction (aadhar_num, chitty_num, chittal_num, branch, earned_amount) VALUES
    ('890 123 456 038', 103, 1, 'Kottayam', 200000.00), -- Month 1
    ('567 890 123 905', 103, 2, 'Kottayam', 180000.00), -- Month 2
    ('789 012 345 700', 103, 3, 'Kottayam', 170000.00), -- Month 3
    ('012 345 678 010', 103, 4, 'Kottayam', 150000.00); -- Month 4


-- Insert members into the customer_chitty table for chitty 101
-- Insert auction data for these members
INSERT INTO chitty_auction (aadhar_num, chitty_num, chittal_num, branch, earned_amount) VALUES
    ('012 345 678 912', 101, 1, 'Kollam', 120000.00), -- Month 1
    ('456 789 012 345', 101, 2, 'Kollam', 110000.00), -- Month 2
    ('678 901 234 568', 101, 3, 'Kollam', 100000.00), -- Month 3
    ('789 012 345 679', 101, 4, 'Kollam', 90000.00),  -- Month 4
    ('890 123 456 790', 101, 5, 'Kollam', 80000.00);  -- Month 5

-- Insert auction data for the members
INSERT INTO chitty_auction (aadhar_num, chitty_num, chittal_num, branch, earned_amount) VALUES
    ('012 345 678 010', 101, 1, 'Kozhikode', 100000.00), -- Month 1
    ('123 456 789 110', 101, 2, 'Kozhikode', 90000.00),  -- Month 2
    ('234 567 890 210', 101, 3, 'Kozhikode', 85000.00),  -- Month 3
    ('345 678 901 310', 101, 4, 'Kozhikode', 80000.00),  -- Month 4
    ('456 789 012 410', 101, 5, 'Kozhikode', 75000.00),  -- Month 5
    ('567 890 123 510', 101, 6, 'Kozhikode', 70000.00);  -- Month 6





INSERT INTO Loan (loan_num, branch, loan_type, aadhar_num, chitty_num, loan_amount, loan_period, emi)
VALUES
(1001, 'Kottayam', 'Home Loan', '012 345 678 010', 103, 500000.00, 120, 5000.00),
(1002, 'Kozhikode', 'Personal Loan', '012 345 678 010', 101, 200000.00, 60, 3500.00),
(1003, 'Kannur', 'Car Loan', '012 345 678 030', 107, 300000.00, 72, 4500.00),
(1004, 'Kannur', 'Business Loan', '012 345 678 040', 107, 600000.00, 84, 8000.00),
(1005, 'Kollam', 'Home Loan', '012 345 678 912', 101, 500000.00, 120, 5000.00),
(1006, 'Ernakulam', 'Personal Loan', '123 456 789 012', 101, 150000.00, 48, 3200.00),
(1007, 'Kannur', 'Car Loan', '123 456 789 021', 107, 250000.00, 60, 4500.00),
(1008, 'Thiruvananthapuram', 'Home Loan', '123 456 789 100', 102, 400000.00, 120, 4000.00),
(1009, 'Kozhikode', 'Business Loan', '123 456 789 110', 101, 700000.00, 84, 8500.00),
(1010, 'Kannur', 'Home Loan', '123 456 789 901', 107, 450000.00, 120, 4500.00),
(1011, 'Kannur', 'Personal Loan', '234 567 890 032', 107, 200000.00, 60, 3500.00),
(1012, 'Kannur', 'Car Loan', '234 567 890 042', 107, 350000.00, 72, 5000.00),
(1013, 'Ernakulam', 'Business Loan', '234 567 890 123', 101, 800000.00, 84, 9000.00),
(1014, 'Thiruvananthapuram', 'Home Loan', '234 567 890 200', 102, 450000.00, 120, 4500.00),
(1015, 'Kozhikode', 'Personal Loan', '234 567 890 210', 101, 250000.00, 60, 4500.00),
(1016, 'Kannur', 'Car Loan', '345 678 901 234', 107, 400000.00, 72, 6000.00),
(1017, 'Kannur', 'Business Loan', '345 678 901 235', 107, 900000.00, 84, 9500.00),
(1018, 'Thiruvananthapuram', 'Home Loan', '345 678 901 300', 102, 500000.00, 120, 5000.00),
(1019, 'Kozhikode', 'Personal Loan', '345 678 901 310', 101, 300000.00, 60, 4800.00);



INSERT INTO Loan_Payment (aadhar_num, loan_num, branch, emi, date_of_payment, branch_of_payment)
VALUES
('012 345 678 010', 1001, 'Kottayam', 5000.00, '2024-08-01', 'Kottayam'),
('012 345 678 010', 1002, 'Kozhikode', 3500.00, '2024-08-01', 'Kozhikode'),
('012 345 678 030', 1003, 'Kannur', 4500.00, '2024-08-01', 'Kannur'),
('012 345 678 040', 1004, 'Kannur', 8000.00, '2024-08-01', 'Kannur'),
('012 345 678 912', 1005, 'Kollam', 5000.00, '2024-08-01', 'Kollam'),
('123 456 789 012', 1006, 'Ernakulam', 3200.00, '2024-08-01', 'Ernakulam'),
('123 456 789 021', 1007, 'Kannur', 4500.00, '2024-08-01', 'Kannur'),
('123 456 789 100', 1008, 'Thiruvananthapuram', 4000.00, '2024-08-01', 'Thiruvananthapuram'),
('123 456 789 110', 1009, 'Kozhikode', 8500.00, '2024-08-01', 'Kozhikode'),
('123 456 789 901', 1010, 'Kannur', 4500.00, '2024-08-01', 'Kannur'),
('234 567 890 032', 1011, 'Kannur', 3500.00, '2024-08-01', 'Kannur'),
('234 567 890 042', 1012, 'Kannur', 5000.00, '2024-08-01', 'Kannur'),
('234 567 890 123', 1013, 'Ernakulam', 9000.00, '2024-08-01', 'Ernakulam'),
('234 567 890 200', 1014, 'Thiruvananthapuram', 4500.00, '2024-08-01', 'Thiruvananthapuram'),
('234 567 890 210', 1015, 'Kozhikode', 4500.00, '2024-08-01', 'Kozhikode'),
('345 678 901 234', 1016, 'Kannur', 6000.00, '2024-08-01', 'Kannur'),
('345 678 901 235', 1017, 'Kannur', 9500.00, '2024-08-01', 'Kannur'),
('345 678 901 300', 1018, 'Thiruvananthapuram', 5000.00, '2024-08-01', 'Thiruvananthapuram'),
('345 678 901 310', 1019, 'Kozhikode', 4800.00, '2024-08-01', 'Kozhikode');


select *from chitty_payment;
select *from chitty_auction;
select *from minimum;
select *from maximum;
select *from customer_chitty;
select *from Loan_Payment;
select *from Loan;
select *from chitty;
select *from customer;





select distinct c.name,c.aadhar_num,c.mob_num,c.address from Loan  l join  customer  c on l.aadhar_num=c.aadhar_num;


select *from customer where aadhar_num NOT IN(select distinct c.address from Loan  l join  customer  c on l.aadhar_num=c.aadhar_num);



select l.loan_num,l.loan_amount,l.branch,c.name,c.aadhar_num,c.mob_num 
from Loan  l 
join customer c 
on l.aadhar_num=c.aadhar_num 
order by loan_amount desc;


select branch,loan_type,count(*) as total_Loan from Loan group by branch,loan_type;



create view new as select chitty_num,chittal_num,branch from chitty_payment where branch != payment_branch;
select name,aadhar_num,address,mob_num from customer where aadhar_num IN(select cc.aadhar_num from customer_chitty cc join new on new.chitty_num=cc.chitty_num and new.chittal_num=cc.chittal_num and new.branch=cc.branch);



CREATE VIEW minimum AS 
    SELECT 
        branch, 
        chitty_num, 
        MIN(earned_amount) AS min_earned_amount 
    FROM 
         chitty_auction 
    WHERE
       branch IN(select branch from chitty where chitty_status='CLOSED')
    GROUP BY 
        branch, 
       chitty_num;





CREATE VIEW maximum AS 
    SELECT 
        branch, 
        chitty_num, 
        MAX(earned_amount) AS max_earned_amount 
    FROM 
         chitty_auction 
    WHERE
       branch IN(select branch from chitty where chitty_status='CLOSED')
    GROUP BY 
        branch, 
       chitty_num;



 SELECT name,address,mob_num from customer where aadhar_num 
  IN
   (SELECT ca.aadhar_num from chitty_auction ca 
      join 
     minimum m 
     on 
    ca.branch=m.branch and ca.chitty_num=m.chitty_num and ca.earned_amount=m.max_earned_amount);


 SELECT name,address,mob_num from customer where aadhar_num 
  IN
   (SELECT ca.aadhar_num from chitty_auction ca 
      join 
     maximum m 
     on 
    ca.branch=m.branch and ca.chitty_num=m.chitty_num and ca.earned_amount=m.max_earned_amount);
























    







   


















