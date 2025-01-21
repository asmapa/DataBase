CREATE TABLE student (
    email_id VARCHAR(100) UNIQUE NOT NULL,
    mobnum CHAR(10) UNIQUE NOT NULL,
    name VARCHAR(30) NOT NULL,
    roll_num CHAR(7) PRIMARY KEY CHECK (roll_num REGEXP '^[A-Z][A-Z][M,P][0-9]{4}$' AND SUBSTRING(roll_num, 4, 2) BETWEEN '01' AND '99'), 
    address_of_student VARCHAR(200) NOT NULL
);


create table guide(
    name varchar(20) NOT NULL,
    emp_id INT PRIMARY KEY,
    research_area varchar(100) NOT NULL,
    department varchar(100) NOT NULL,
    designation varchar(20) NOT NULL,
    email_id varchar(100) UNIQUE NOT NULL,
    mob_num char(10) UNIQUE NOT NULL
);

create table thesis(
    title varchar(100) NOT NULL,
    thesis_id INT PRIMARY KEY,
    central_area varchar(30) NOT NULL
);

create table indices(
    thesis_id INT,
    keyword varchar(200) NOT NULL,
    PRIMARY KEY(thesis_id),
    FOREIGN KEY(thesis_id) REFERENCES thesis (thesis_id)
);

create table submission(
    thesis_id INT,
    roll_num char(7),
    emp_id INT,
    submission_date DATE NOT NULL,
    PRIMARY KEY(thesis_id, roll_num, emp_id),
    FOREIGN KEY(thesis_id) REFERENCES thesis(thesis_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(roll_num) REFERENCES student(roll_num) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(emp_id) REFERENCES guide(emp_id) ON UPDATE CASCADE ON DELETE CASCADE
);




INSERT INTO student (email_id, mobnum, name, roll_num, address_of_student)
VALUES
('alice@example.com', '1234567890', 'Alice', 'CSM0123', '123 Main St'),  -- Roll number 01, Year 23 (2023)
('bob@example.com', '0987654321', 'Bob', 'AMP0222', '456 Elm St'),      -- Roll number 02, Year 22 (2022)
('charlie@example.com', '1122334455', 'Charlie', 'CSM0321', '789 Oak St'), -- Roll number 03, Year 21 (2021)
('david@example.com', '5566778899', 'David', 'AMP0420', '135 Maple St'), -- Roll number 04, Year 20 (2020)
('eve@example.com', '2233445566', 'Eve', 'CSM0523', '246 Pine St'),      -- Roll number 05, Year 23 (2023)
('frank@example.com', '6677889900', 'Frank', 'AMP0623', '357 Birch St'), -- Roll number 06, Year 23 (2023)
('grace@example.com', '7788990011', 'Grace', 'CSM0722', '468 Cedar St'), -- Roll number 07, Year 22 (2022)
('heidi@example.com', '8899001122', 'Heidi', 'AMP0823', '579 Cherry St'), -- Roll number 08, Year 23 (2023)
('ivan@example.com', '9900112233', 'Ivan', 'CSM0924', '680 Spruce St'),   -- Roll number 09, Year 24 (2024)
('judy@example.com', '0011223344', 'Judy', 'AMP1023', '791 Walnut St');   -- Roll number 10, Year 23 (2023)

INSERT INTO student (email_id, mobnum, name, roll_num, address_of_student)
VALUES
('kyle@example.com', '1112223333', 'Kyle', 'CSM1124', '910 Fir St'),    -- Roll number 11, Year 24 (2024)
('lisa@example.com', '4445556666', 'Lisa', 'AMP1223', '102 Maple St'),  -- Roll number 12, Year 23 (2023)
('mike@example.com', '7778889999', 'Mike', 'CSM1322', '203 Birch St'),  -- Roll number 13, Year 22 (2022)
('nina@example.com', '5556667777', 'Nina', 'AMP1421', '304 Oak St'),    -- Roll number 14, Year 21 (2021)
('oscar@example.com', '2223334444', 'Oscar', 'CSM1520', '405 Pine St'), -- Roll number 15, Year 20 (2020)
('paul@example.com', '8889990000', 'Paul', 'AMP1623', '506 Elm St'),    -- Roll number 16, Year 23 (2023)
('quinn@example.com', '9990001111', 'Quinn', 'CSM1724', '607 Cedar St'),-- Roll number 17, Year 24 (2024)
('rachel@example.com', '0001112222', 'Rachel', 'AMP1823', '708 Spruce St'),-- Roll number 18, Year 23 (2023)
('sam@example.com', '3334445555', 'Sam', 'CSM1922', '809 Walnut St'),   -- Roll number 19, Year 22 (2022)
('tina@example.com', '6667778888', 'Tina', 'AMP2024', '910 Cherry St'); -- Roll number 20, Year 24 (2024)




INSERT INTO guide (name, emp_id, research_area, department, designation, email_id, mob_num)
VALUES
('Dr. Alice', 101, 'AI', 'Computer Science', 'Professor', 'alice.guide@example.com', '9876543210'),
('Dr. Bob', 102, 'ML', 'AI and ML', 'Associate Professor', 'bob.guide@example.com', '8765432109'),
('Dr. Charlie', 103, 'Data Science', 'Data Engineering', 'Assistant Professor', 'charlie.guide@example.com', '7654321098'),
('Dr. David', 104, 'Cybersecurity', 'Cybersecurity', 'Professor', 'david.guide@example.com', '6543210987'),
('Dr. Eve', 105, 'Robotics', 'Mechanical Engineering', 'Associate Professor', 'eve.guide@example.com', '5432109876'),
('Dr. Frank', 106, 'Quantum Computing', 'Physics', 'Professor', 'frank.guide@example.com', '4321098765'),
('Dr. Grace', 107, 'Blockchain', 'Computer Science', 'Assistant Professor', 'grace.guide@example.com', '3210987654'),
('Dr. Heidi', 108, 'IoT', 'Electronics', 'Professor', 'heidi.guide@example.com', '2109876543'),
('Dr. Ivan', 109, 'Natural Language Processing', 'AI and ML', 'Associate Professor', 'ivan.guide@example.com', '1098765432'),
('Dr. Judy', 110, 'Biotech', 'Biotechnology', 'Professor', 'judy.guide@example.com', '0198765432');

INSERT INTO guide (name, emp_id, research_area, department, designation, email_id, mob_num)
VALUES
('Dr. Thomas', 111, 'Approximate Algorithms', 'Computer Science', 'Professor', 'thomas.guide@example.com', '1234567890');


INSERT INTO thesis (title, thesis_id, central_area) VALUES
('Approximate Nearest Neighbors', 1, 'Approximation Algorithms'),
('Greedy Algorithms for Set Cover', 2, 'Approximation Algorithms'),
('Approximate Shortest Paths', 3, 'Graph Algorithms'),
('Rounding Techniques in Linear Programming', 4, 'Optimization'),
('Randomized Algorithms for Approximation', 5, 'Randomized Algorithms'),
('Dynamic Programming Techniques', 6, 'Algorithm Design'),
('Heuristic Methods in AI', 7, 'Artificial Intelligence'),
('Network Flow Algorithms', 8, 'Graph Theory'),
('Machine Learning Approaches', 9, 'Data Science'),
('Data Compression Techniques', 10, 'Information Theory'),
('Deep Learning for Image Recognition', 11, 'Machine Learning'),
('Optimizing Search Algorithms', 12, 'Search Algorithms'),
('Reinforcement Learning in Robotics', 13, 'Artificial Intelligence'),
('Advanced Techniques in Cryptography', 14, 'Cryptography'),
('Computational Complexity Theory', 15, 'Theoretical Computer Science'),
('Natural Language Processing Techniques', 16, 'Data Science'),
('Parallel Algorithms for Sorting', 17, 'Parallel Computing'),
('Graph Partitioning Algorithms', 18, 'Graph Theory'),
('Distributed Systems and Scalability', 19, 'Distributed Computing'),
('Quantum Computing Algorithms', 20, 'Quantum Computing');

INSERT INTO indices (thesis_id, keyword) VALUES
(1, 'Approximation Algorithm, nearest neighbors, algorithms'),
(2, 'greedy algorithms, set cover, Approximation Algorithm'),
(3, 'shortest paths, graph algorithms, Approximation Algorithm'),
(4, 'linear programming, rounding techniques, optimization'),
(5, 'randomized algorithms, approximation Algorithm, probabilistic methods'),
(6, 'dynamic programming, algorithm design, optimization'),
(7, 'heuristic methods, artificial intelligence, optimization'),
(8, 'network flow, graph theory, algorithms'),
(9, 'machine learning, data science, prediction'),
(10, 'data compression, information theory, algorithms'),
(11, 'parallel algorithms, load balancing, distributed systems'),
(12, 'deep learning, neural networks, machine vision'),
(13, 'genetic algorithms, evolutionary methods, optimization'),
(14, 'probabilistic models, machine learning, data analysis'),
(15, 'linear regression, supervised learning, data science'),
(16, 'support vector machines, classification, algorithms'),
(17, 'unsupervised learning, clustering, big data'),
(18, 'convex optimization, numerical methods, linear programming'),
(19, 'reinforcement learning, decision making, artificial intelligence'),
(20, 'time series analysis, forecasting, data science');


INSERT INTO submission (thesis_id, roll_num, emp_id, submission_date) VALUES
(1, 'AMP0222', 102, '2024-09-02'),  -- Bob submits his thesis
(2, 'CSM0321', 103, '2024-09-03'),  -- Charlie submits his thesis
(3, 'AMP0420', 104, '2024-09-04'),  -- David submits his thesis
(4, 'CSM0523', 105, '2024-09-05'), -- Eve submits her thesis
(5, 'AMP0623', 106, '2024-09-06'),  -- Frank submits his thesis
(6, 'CSM0722', 107, '2024-09-07'),  -- Grace submits her thesis
(7, 'AMP0823', 108, '2024-09-08'),  -- Heidi submits her thesis
(8, 'CSM0924', 109, '2024-09-09'),  -- Ivan submits his thesis
(9, 'AMP1023', 110, '2024-09-10'),
(10, 'AMP0222', 102, '2024-09-02'), 
(11, 'CSM1124', 102, '2024-09-13'), 
(12, 'AMP1223', 102, '2024-09-23'), 
(13,'AMP1421' , 103, '2024-09-07'), 
(14, 'AMP1623', 104, '2024-09-27'), 
(15,'CSM1724' , 105, '2024-09-21'), 
(16, 'AMP1823', 106, '2024-09-26'), 
(17, 'CSM1922', 107, '2024-09-20'), 
(18, 'AMP2024', 108, '2024-09-10');  

INSERT INTO submission (thesis_id, roll_num, emp_id, submission_date) VALUES
(2,'AMP0222',109,'2024-09-15'),
(13,'AMP0823',108,'2024-09-05');

INSERT INTO submission (thesis_id, roll_num, emp_id, submission_date) VALUES
(7,'CSM1124',109,'2024-09-15');

INSERT INTO submission (thesis_id, roll_num, emp_id, submission_date) VALUES
    (9, 'CSM0722', 109, '2024-09-05'),
    (11, 'CSM0722', 105, '2024-09-25'),
    (17, 'AMP1223', 105, '2024-09-11');







/*1.Find the details of the guides who had guided the students for submitting thesis
containing the keword ”Approximation Agorithms”.*/

create view split_indices as 
select thesis_id, trim(substring_index(keyword, ',', 1)) as keyword from indices 
union all 
select thesis_id, trim(substring_index(substring_index(keyword, ',', 2), ',', -1)) as keyword from indices 
union all 
select thesis_id, trim(substring_index(substring_index(keyword, ',', 3), ',', -1)) as keyword from indices;




select name,department,designation,email_id,mob_num from guide where emp_id IN(select emp_id from submission where thesis_id IN( select thesis_id from
split_indices where keyword='Approximation Algorithm'));


/*2.Find the details of the guides who produced the maximum number of Thesis and
the minimum number of Thesis.*/

create view data as select emp_id,count(*) as count from submission group by emp_id;

select name, designation, mob_num, email_id, 'max' as max_min from guide where emp_id in (select emp_id from data where count in (select max(count) from data)) union all select name, designation, mob_num, email_id, 'min' as max_min from guide where emp_id in (select emp_id from data where count in (select min(count) from data));

/*3.Find the details of the students who submitted more than one thesis with the same
central area but worked under differnt guides.*/


create view data2 as select thesis.thesis_id,thesis.central_area,submission.roll_num,submission.emp_id from thesis join submission on thesis.thesis_id=submission.thesis_id;

select name,roll_num,email_id from student where roll_num in(select roll_num from data2 group by roll_num,central_area having count(distinct emp_id)=count(central_area) and count(distinct emp_id)>1);

/*4.Find the details of the guides who produced phD thesis with different central areas.*/

select name,email_id,designation from guide where emp_id IN(select emp_id as area_count from data2 where substring(roll_num,3,1)='P' group by emp_id having count(distinct central_area)> 1);

/*5.Obtain a listing of all the keywords in the index and the number of PhD thesis and MS thesis containing each of these keywords.*/


create view data4 as select i.thesis_id,i.keyword,s.roll_num,s.emp_id from split_indices i join submission s on i.thesis_id=s.thesis_id order by thesis_id;

select keyword, count(*), 'PHD' AS phd_ms FROM data4 where substring(roll_num, 3, 1) = 'P' group by keyword union all select keyword,count(*),'MS' as phd_ms from data4 where substring(roll_num,3,1) = 'M' group by keyword order by keyword;

/*6.Find the details of all the guides who did not produce any thesis within a specific period,*/

select emp_id,name,email_id,designation from guide where emp_id not in(select emp_id from submission where submission_date between '2024-09-05' AND '2024-09-21' );

/*7.Find the most trending area and the lest trending area. The most trending area is the central area with the highest number of submitted thesis and the least trending area is the one with the least number of submitted thesis.*/

create view data5 as select central_area,count(*) as num_of_submission from data2 group by central_area;
select central_area,'LEAST' as TRENDING from data5 where num_of_submission in(select min(num_of_submission) from data5) union all select central_area,'MOST' as TRENDING from data5 where num_of_submission in(select max(num_of_submission) from data5);

/*8.Find the details of all guides who produced MS thesis only from one central area.*/

select name,designation,email_id,emp_id from guide where emp_id in(select emp_id from data2 where substring(roll_num,3,1)='M' group by emp_id,central_area having count(distinct central_area)=1);


/*9.Find the details of all students who submitted more than one thesis with the condition that no two thesis submitted by the student do not have a common keyword.*/



create view details as select thesis_id,roll_num,keyword from data4 where roll_num IN(select roll_num from data4 group by roll_num having count(distinct thesis_id)>1);

select name,email_id,roll_num from student where roll_num IN(select roll_num from details group by roll_num having count(distinct thesis_id)*3=count(distinct keyword));

DROP VIEW IF EXISTS data, data2, data4, data5,details, split_indices;
DROP TABLE IF EXISTS student, guide, indices, submission, thesis;

