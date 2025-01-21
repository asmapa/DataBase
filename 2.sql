


CREATE TABLE employee(
name varchar(30) NOT NULL,
address TEXT NOT NULL,
aadhar_num BIGINT PRIMARY KEY,
mob_num varchar(10) NOT NULL,
email_id varchar(100) UNIQUE NOT NULL);



CREATE TABLE patients(
name varchar(30) NOT NULL,
address TEXT NOT NULL,
aadhar_num BIGINT PRIMARY KEY,
age int check(age > 0) NOT NULL,
mob_num varchar(10) NOT NULL,
email_id varchar(100) UNIQUE NOT NULL);





CREATE TABLE doctors(
doctor_name varchar(30) NOT NULL,
address TEXT NOT NULL,
specialization varchar(30) NOT NULL,
hospital_name varchar(200) NOT NULL,
doc_aadhar_num BIGINT PRIMARY KEY );




CREATE TABLE test(
test_name varchar(30) PRIMARY KEY NOT NULL,
description varchar(300) NOT NULL);




CREATE TABLE scan(
scan_name varchar(30) PRIMARY KEY NOT NULL,
description varchar(300) NOT NULL);




CREATE TABLE patient_test(
pat_aadhar_num BIGINT  NOT NULL,
test_name varchar(30), 
doc_aadhar_num BIGINT  NOT NULL,
date_of_test DATE NOT NULL,
path_of_result varchar(400) NOT NULL,
amount_to_paid DECIMAL(15,2) NOT NULL,
PRIMARY KEY(pat_aadhar_num,test_name,doc_aadhar_num,date_of_test),
FOREIGN KEY(pat_aadhar_num) REFERENCES patients(aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(test_name) REFERENCES test(test_name)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(doc_aadhar_num) REFERENCES doctors(doc_aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE);




CREATE TABLE scan_conduct(
pat_aadhar_num BIGINT NOT NULL,
scan_name varchar(30) NOT NULL,
date_of_scan DATE NOT NULL,
doc_aadhar_num BIGINT  NOT NULL,
path_of_result varchar(400) NOT NULL,
path_of_doc_pres varchar(400) NOT NULL,
amount_to_paid DECIMAL(15,2) NOT NULL,
PRIMARY KEY(pat_aadhar_num,scan_name,doc_aadhar_num,date_of_scan),
FOREIGN KEY(pat_aadhar_num) REFERENCES patients(aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(scan_name) REFERENCES scan(scan_name)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(doc_aadhar_num) REFERENCES doctors(doc_aadhar_num)
ON UPDATE CASCADE
ON DELETE CASCADE);




INSERT INTO employee(name, address, aadhar_num, mob_num, email_id) VALUES
('Nandini P', 'Kannur, Kerala', '012345678901', '0987654321', 'nandini.p@example.com'),
('Vidya M', 'Ernakulam, Kerala', '101010101010', '0987654320', 'vidya.m@example.com'),
('Madhavan P', 'Malappuram, Kerala', '111111111111', '9876543219', 'madhavan.p@example.com'),
('Deepak V', 'Kottayam, Kerala', '121212121212', '9876543211', 'deepak.v@example.com'),
('Gopika S', 'Pathanamthitta, Kerala', '222222222222', '8765432108', 'gopika.s@example.com'),
('Shalini R', 'Kochi, Kerala', '234567890123', '8765432109', 'shalini.r@example.com'),
('Ajay N', 'Wayanad, Kerala', '333333333333', '7654321097', 'ajay.n@example.com'),
('Rajesh P', 'Kozhikode, Kerala', '345678901234', '7654321098', 'rajesh.p@example.com'),
('Soumya T', 'Idukki, Kerala', '444444444444', '6543210986', 'soumya.t@example.com'),
('Leena S', 'Thrissur, Kerala', '456789012345', '6543210987', 'leena.s@example.com'),
('Praveen K', 'Kasargod, Kerala', '555555555555', '5432109875', 'praveen.k@example.com'),
('Vijay Nair', 'Palakkad, Kerala', '567890123456', '5432109876', 'vijay.nair@example.com'),
('Lakshmi R', 'Thiruvananthapuram, Kerala', '666666666666', '4321098764', 'lakshmi.r@example.com'),
('Meera N', 'Alappuzha, Kerala', '678901234567', '4321098765', 'meera.n@example.com'),
('Biju P', 'Palakkad, Kerala', '777777777777', '3210987653', 'biju.p@example.com'),
('Arun K', 'Kollam, Kerala', '789012345678', '3210987654', 'arun.k@example.com'),
('Rekha S', 'Thrissur, Kerala', '888888888888', '2109876542', 'rekha.s@example.com'),
('Divya Menon', 'Ernakulam, Kerala', '890123456789', '2109876543', 'divya.menon@example.com'),
('Suresh M', 'Kottayam, Kerala', '901234567890', '1098765432', 'suresh.m@example.com'),
('Ramesh N', 'Kozhikode, Kerala', '999999999999', '1098765431', 'ramesh.n@example.com');




INSERT INTO patients (name, address, aadhar_num, age, mob_num, email_id) VALUES
('Sandeep R', 'Trivandrum, Kerala', '131313131313', 45, '9988776655', 'sandeep.r@example.com'),
('Arathi M', 'Kochi, Kerala', '141414141414', 38, '8877665544', 'arathi.m@example.com'),
('Kiran S', 'Kozhikode, Kerala', '151515151515', 52, '7766554433', 'kiran.s@example.com'),
('Neha P', 'Thrissur, Kerala', '161616161616', 29, '6655443322', 'neha.p@example.com'),
('Akhil N', 'Palakkad, Kerala', '171717171717', 36, '5544332211', 'akhil.n@example.com'),
('Radhika R', 'Alappuzha, Kerala', '181818181818', 48, '4433221100', 'radhika.r@example.com'),
('Ravi K', 'Kollam, Kerala', '191919191919', 41, '3322110099', 'ravi.k@example.com'),
('Nisha T', 'Ernakulam, Kerala', '202020202020', 34, '2211009988', 'nisha.t@example.com'),
('Arjun B', 'Kottayam, Kerala', '212121212121', 50, '1100998877', 'arjun.b@example.com'),
('Divya S', 'Kannur, Kerala', '222222222222', 39, '0099887766', 'divya.s@example.com'),
('Harish K', 'Malappuram, Kerala', '232323232323', 46, '9988776654', 'harish.k@example.com'),
('Asha M', 'Pathanamthitta, Kerala', '242424242424', 31, '8877665543', 'asha.m@example.com'),
('Vineeth P', 'Wayanad, Kerala', '252525252525', 44, '7766554432', 'vineeth.p@example.com'),
('Gauri N', 'Idukki, Kerala', '262626262626', 33, '6655443321', 'gauri.n@example.com'),
('Jithin V', 'Kasargod, Kerala', '272727272727', 49, '5544332210', 'jithin.v@example.com'),
('Meera S', 'Thiruvananthapuram, Kerala', '282828282828', 37, '4433221109', 'meera.s@example.com'),
('Krishna K', 'Palakkad, Kerala', '292929292929', 53, '3322110098', 'krishna.k@example.com'),
('Priya L', 'Thrissur, Kerala', '303030303030', 42, '2211009987', 'priya.l@example.com'),
('Ashwin P', 'Kozhikode, Kerala', '313131313131', 28, '1100998876', 'ashwin.p@example.com'),
('Arun S', 'Ernakulam, Kerala', '323232323232', 40, '0099887765', 'arun.s@example.com'),
('Amitha', 'Kollam, Kerala', '123232323232', 40, '0099887765', 'amitha.r@example.com'),
('Geethul', 'Ernakulam, Kerala', '423232323232', 40, '0099887765', 'geethul.r@example.com'),
('Amritha', 'Ernakulam, Kerala', '523232323232', 40, '0099887765', 'amritha.r@example.com'),
('Gaga', 'Ernakulam, Kerala', '623232323232', 40, '0099887765', 'gaga.r@example.com'),
('Vijithra R', 'Ernakulam, Kerala', '723232323232', 40, '0099887765', 'vijithra.r@example.com'),
('Niyaana', 'Ernakulam, Kerala', '823232323232', 40, '0099887765', 'niyaana.r@example.com'),
('Asna', 'Ernakulam, Kerala', '923232323232', 40, '0099887765', 'asna.r@example.com'),
('Asma R', 'Ernakulam, Kerala', '113232323232', 40, '0099887765', 'asma.r@example.com'),
('Arun Paraash R', 'Ernakulam, Kerala', '453232323232', 40, '0099887765', 'arunparaash.r@example.com'),
('Neelimia', 'Ernakulam, Kerala', '323232003232', 40, '0099887765', 'neelimia.r@example.com'),
('Niyana Krisha', 'Ernakulam, Kerala', '320002323232', 40, '0099887765', 'niyanakrisha.r@example.com'),
('Binu S', 'Ernakulam, Kerala', '323232320002', 40, '0099887765', 'binu.s@example.com'),
('Liya', 'Ernakulam, Kerala', '323232000032', 40, '0099887765', 'liya.r@example.com');



INSERT INTO doctors (doctor_name, address, specialization, hospital_name, doc_aadhar_num) VALUES
('Dr. Maya Krishnan', 'Kochi, Kerala', 'Cardiology', 'Amrita Hospital', '123456789012'),
('Dr. Vinod Balan', 'Trivandrum, Kerala', 'Neurology', 'KIMS Hospital', '234567890123'),
('Dr. Anitha Menon', 'Kozhikode, Kerala', 'Pediatrics', 'Baby Memorial Hospital', '345678901234'),
('Dr. Rajeev Nair', 'Thrissur, Kerala', 'Orthopedics', 'Jubilee Mission Hospital', '456789012345'),
('Dr. Shyam Prasad', 'Alappuzha, Kerala', 'Dermatology', 'VSM Hospital', '567890123456'),
('Dr. Priya Varghese', 'Kannur, Kerala', 'Gynecology', 'AKG Memorial Hospital', '678901234567'),
('Dr. John Mathew', 'Kottayam, Kerala', 'ENT', 'Caritas Hospital', '789012345678'),
('Dr. Lakshmi Nair', 'Palakkad, Kerala', 'Oncology', 'Palana Hospital', '890123456789'),
('Dr. Thomas George', 'Ernakulam, Kerala', 'Cardiology', 'Lakeshore Hospital', '901234567890'),
('Dr. Rekha Ramesh', 'Kollam, Kerala', 'Neurology', 'Meditrina Hospital', '012345678901'),
('Dr. Ashok Kumar', 'Idukki, Kerala', 'Gastroenterology', 'Mar Baselios Hospital', '112345678902'),
('Dr. Meera Pillai', 'Malappuram, Kerala', 'Ophthalmology', 'MES Medical College', '212345678903'),
('Dr. Arjun Raj', 'Pathanamthitta, Kerala', 'Orthopedics', 'Pushpagiri Hospital', '312345678904'),
('Dr. Neena Suresh', 'Wayanad, Kerala', 'Pediatrics', 'DM WIMS', '412345678905'),
('Dr. Kiran Nambiar', 'Kasargod, Kerala', 'Psychiatry', 'Govt. General Hospital', '512345678906'),
('Dr. Bindu Mathew', 'Kannur, Kerala', 'Dermatology', 'Govt. Medical College', '612345678907'),
('Dr. Suresh Kumar', 'Kozhikode, Kerala', 'Cardiology', 'IQRAA Hospital', '712345678908'),
('Dr. Anu Mohan', 'Ernakulam, Kerala', 'Neurology', 'Aster Medcity', '812345678909'),
('Dr. Rakesh Chandran', 'Thrissur, Kerala', 'Orthopedics', 'Daya Hospital', '912345678910'),
('Dr. Beena Nair', 'Kochi, Kerala', 'Gynecology', 'Medical Trust Hospital', '013456789012'),
('Dr. Manoj Nair', 'Trivandrum, Kerala', 'Oncology', 'Sree Uthram Thirunal Hospital', '023456789013');


INSERT INTO test (test_name, description) VALUES
('Blood Test', 'A comprehensive blood test to check various health parameters.'),
('ECG', 'Electrocardiogram to monitor heart activity.'),
('Lipid Profile', 'A blood test to measure cholesterol levels.'),
('Liver Function Test', 'Blood tests to assess liver health.'),
('Kidney Function Test', 'Blood tests to assess kidney health.'),
('Thyroid Function Test', 'Blood tests to evaluate thyroid activity.'),
('Blood Sugar Test', 'A test to measure glucose levels in the blood.'),
('Urine Test', 'Analysis of urine for various health parameters.'),
('Bone Density Test', 'A test to measure bone mineral density.'),
('Allergy Test', 'Tests to identify allergic reactions to various substances.'),
('Pulmonary Function Test', 'Tests to measure lung function.'),
('HIV Test', 'Blood tests to detect the presence of HIV.'),
('Vitamin D Test', 'Blood test to measure vitamin D levels.'),
('CBC (Complete Blood Count)', 'A blood test that measures overall health.'),
('Glucose Tolerance Test', 'A test to diagnose diabetes.'),
('PSA Test', 'A blood test to screen for prostate cancer.'),
('Iron Studies', 'Tests to assess iron levels in the blood.'),
('C-Reactive Protein (CRP) Test', 'A test to measure inflammation levels in the body.'),
('Hemoglobin A1c', 'A test to measure average blood sugar levels over the past 2-3 months.'),
('Rheumatoid Factor Test', 'A blood test used to help diagnose rheumatoid arthritis.');


INSERT INTO scan (scan_name, description) VALUES
('CT Scan', 'Computed tomography scan for cross-sectional imaging of bones and soft tissues.'),
('MRI Scan', 'Magnetic resonance imaging for detailed images of organs and tissues.'),
('Ultrasound', 'Imaging using high-frequency sound waves to visualize organs and tissues.'),
('X-Ray', 'Radiographic imaging to view internal structures, particularly bones.'),
('PET Scan', 'Positron emission tomography scan to observe metabolic processes in the body.'),
('Mammography', 'Specialized X-ray imaging to detect breast cancer.'),
('Bone Scan', 'A nuclear imaging test to diagnose bone diseases and conditions.'),
('DEXA Scan', 'Dual-energy X-ray absorptiometry scan to measure bone density.'),
('Fluoroscopy', 'Continuous X-ray imaging to view moving body structures.'),
('Angiography', 'Imaging test that uses X-rays to view blood vessels.'),
('HIDA Scan', 'Hepatobiliary iminodiacetic acid scan to evaluate gallbladder function.'),
('Barium Swallow', 'Imaging test using barium to visualize the esophagus.'),
('Thyroid Scan', 'Nuclear medicine test to evaluate thyroid function.'),
('Renal Scan', 'Imaging test to examine kidney function and structure.'),
('SPECT Scan', 'Single-photon emission computed tomography for 3D imaging of blood flow and organ function.');





INSERT INTO patient_test (pat_aadhar_num, test_name, doc_aadhar_num, date_of_test, path_of_result, amount_to_paid) VALUES
    
    ('131313131313', 'Blood Test', '123456789012', '2024-07-01', '/results/blood_test_131313131313.pdf', 500.00),
    ('131313131313', 'ECG', '234567890123', '2024-07-01', '/results/ecg_131313131313.pdf', 1200.00),
    
  
    ('141414141414', 'Blood Test', '345678901234', '2024-07-02', '/results/blood_test_141414141414.pdf', 500.00),
    ('141414141414', 'Lipid Profile', '456789012345', '2024-07-02', '/results/lipid_profile_141414141414.pdf', 800.00),
    
   
    ('151515151515', 'Liver Function Test', '567890123456', '2024-07-03', '/results/liver_function_151515151515.pdf', 1500.00),
	('323232323232', 'Liver Function Test', '567890123456', '2024-07-03', '/results/liver_function_151515151515.pdf', 1500.00),
    
    
    ('161616161616', 'Blood Test', '678901234567', '2024-07-04', '/results/blood_test_161616161616.pdf', 500.00),
    ('161616161616', 'Thyroid Function Test', '789012345678', '2024-07-04', '/results/thyroid_function_161616161616.pdf', 700.00),
    
    
    ('171717171717', 'Allergy Test', '890123456789', '2024-07-05', '/results/allergy_test_171717171717.pdf', 2000.00),
	('123232323232', 'Allergy Test', '890123456789', '2024-07-05', '/results/allergy_test_171717171717.pdf', 2000.00),
	
    
   
    ('181818181818', 'Blood Test', '901234567890', '2024-07-06', '/results/blood_test_181818181818.pdf', 500.00),
    ('181818181818', 'Urine Test', '012345678901', '2024-07-06', '/results/urine_test_181818181818.pdf', 300.00),
	('453232323232', 'Urine Test', '012345678901', '2024-07-06', '/results/urine_test_181818181818.pdf', 300.00),
    
  
    ('191919191919', 'Blood Test', '013456789012', '2024-07-07', '/results/blood_test_191919191919.pdf', 500.00),
    ('191919191919', 'Vitamin D Test', '023456789013', '2024-07-07', '/results/vitamin_d_test_191919191919.pdf', 1000.00),
    
    
    ('202020202020', 'CBC (Complete Blood Count)', '112345678902', '2024-07-08', '/results/cbc_202020202020.pdf', 800.00),
    ('323232320002', 'CBC (Complete Blood Count)', '112345678902', '2024-07-08', '/results/cbc_202020202020.pdf', 800.00),
	('923232323232', 'CBC (Complete Blood Count)', '112345678902', '2024-07-08', '/results/cbc_202020202020.pdf', 800.00),
	('113232323232', 'CBC (Complete Blood Count)', '112345678902', '2024-07-08', '/results/cbc_202020202020.pdf', 800.00),
	
  
    ('212121212121', 'Blood Test', '212345678903', '2024-07-09', '/results/blood_test_212121212121.pdf', 500.00),
    ('212121212121', 'Glucose Tolerance Test', '312345678904', '2024-07-09', '/results/glucose_tolerance_212121212121.pdf', 1500.00),
    
    
    ('222222222222', 'Rheumatoid Factor Test', '345678901234', '2024-07-10', '/results/rheumatoid_factor_222222222222.pdf', 1800.00),
    
   
    ('232323232323', 'Blood Test', '456789012345', '2024-07-11', '/results/blood_test_232323232323.pdf', 500.00),
    ('242424242424', 'Blood Test', '567890123456', '2024-07-12', '/results/blood_test_242424242424.pdf', 500.00),
    ('252525252525', 'Thyroid Function Test', '678901234567', '2024-07-13', '/results/thyroid_function_252525252525.pdf', 700.00),
    ('262626262626', 'Blood Test', '789012345678', '2024-07-14', '/results/blood_test_262626262626.pdf', 500.00),
    ('272727272727', 'HIV Test', '890123456789', '2024-07-15', '/results/hiv_test_272727272727.pdf', 1500.00),
	('423232323232', 'HIV Test', '890123456789', '2024-07-05', '/results/allergy_test_171717171717.pdf', 2000.00),
	('823232323232', 'HIV Test', '890123456789', '2024-07-05', '/results/allergy_test_171717171717.pdf', 2000.00),
    ('282828282828', 'Blood Test', '901234567890', '2024-07-16', '/results/blood_test_282828282828.pdf', 500.00),
    ('292929292929', 'Lipid Profile', '012345678901', '2024-07-17', '/results/lipid_profile_292929292929.pdf', 800.00);



INSERT INTO scan_conduct (pat_aadhar_num, scan_name, date_of_scan, doc_aadhar_num, path_of_result, path_of_doc_pres, amount_to_paid) VALUES
('212121212121', 'PET Scan', '2024-08-25', '012345678901', '/path/to/result1', '/path/to/prescription1', 2500.00),  
('141414141414', 'CT Scan', '2024-08-05', '345678901234', '/path/to/result2', '/path/to/prescription2', 3000.00), 
('151515151515', 'Ultrasound', '2024-08-10', '456789012345', '/path/to/result3', '/path/to/prescription3', 1500.00),  
('151515151515', 'Ultrasound', '2024-08-15', '456789012345', '/path/to/result4', '/path/to/prescription4', 1500.00),  
('191919191919', 'Ultrasound', '2024-08-05', '890123456789', '/path/to/result5', '/path/to/prescription5', 1600.00), 
('191919191919', 'Ultrasound', '2024-08-12', '890123456789', '/path/to/result6', '/path/to/prescription6', 1600.00),  
('202020202020', 'X-Ray', '2024-08-10', '901234567890', '/path/to/result7', '/path/to/prescription7', 1200.00),  
('202020202020', 'X-Ray', '2024-08-15', '901234567890', '/path/to/result8', '/path/to/prescription8', 1200.00);  

INSERT INTO scan_conduct (pat_aadhar_num, scan_name, date_of_scan, doc_aadhar_num, path_of_result, path_of_doc_pres, amount_to_paid) VALUES
('212121212121', 'PET Scan', '2024-08-12', '012345678901', '/path/to/result1', '/path/to/pres1', 15000.00),
('212121212121', 'PET Scan', '2024-08-20', '012345678901', '/path/to/result2', '/path/to/pres2', 15000.00),
('131313131313', 'MRI Scan', '2024-07-05', '234567890123', '/path/to/result3', '/path/to/pres3', 18000.00),
('131313131313', 'MRI Scan', '2024-07-20', '234567890123', '/path/to/result4', '/path/to/pres4', 18000.00),
('141414141414', 'CT Scan', '2024-07-15', '345678901234', '/path/to/result5', '/path/to/pres5', 12000.00),
('141414141414', 'CT Scan', '2024-07-25', '345678901234', '/path/to/result6', '/path/to/pres6', 12000.00),
('151515151515', 'Ultrasound', '2024-08-01', '456789012345', '/path/to/result7', '/path/to/pres7', 5000.00),
('161616161616', 'X-Ray', '2024-08-10', '567890123456', '/path/to/result8', '/path/to/pres8', 3000.00),
('171717171717', 'MRI Scan', '2024-07-10', '678901234567', '/path/to/result9', '/path/to/pres9', 18000.00),
('171717171717', 'MRI Scan', '2024-08-05', '678901234567', '/path/to/result10', '/path/to/pres10', 18000.00),
('181818181818', 'CT Scan', '2024-07-18', '789012345678', '/path/to/result11', '/path/to/pres11', 12000.00),
('181818181818', 'CT Scan', '2024-08-01', '789012345678', '/path/to/result12', '/path/to/pres12', 12000.00),
('191919191919', 'Ultrasound', '2024-07-25', '890123456789', '/path/to/result13', '/path/to/pres13', 5000.00),
('202020202020', 'X-Ray', '2024-08-02', '901234567890', '/path/to/result14', '/path/to/pres14', 3000.00);




/*1*/

select distinct t.test_name,tt.description from patient_test t join test tt on t.test_name=tt.test_name where pat_aadhar_num='161616161616' and date_of_test BETWEEN '2024-07-01' AND '2024-07-10';

/*2*/

select test_name,count(*) as num_of_patients from patient_test group by test_name;

/*3*/


create view detail as  select test_name,count(*) as num_of_patients from patient_test group by test_name;

select test_name, num_of_patients,'max' as maximum_or_minimum  from detail where num_of_patients in (select MAX(num_of_patients) from detail)
union all
select test_name, num_of_patients,'min' as maximum_or_minimum from detail where num_of_patients IN (SELECT MIN(num_of_patients) FROM detail);

/*4*/


create view data_MRI_patients as select pat_aadhar_num,scan_name,COUNT(*) from scan_conduct where scan_name = 'X-Ray'  GROUP BY  pat_aadhar_num,scan_name having count(*) <= 2;


select p.name,p.address,p.mob_num,p.aadhar_num from patients p join data_MRI_patients d where p.aadhar_num=d.pat_aadhar_num;





/*select scan_conduct.pat_aadhar_num, patients.name, patients.address, patients.mob_num, scan_conduct.scan_name, count(*) as count from scan_conduct join patients on patients.aadhar_num = scan_conduct.pat_aadhar_num where scan_conduct.scan_name = 'MRI SCAN' group by scan_conduct.pat_aadhar_num, scan_conduct.scan_name having count(*) <= 2;*/




/*5*/


select test_name,sum(amount_to_paid) as total_revenue,'TEST' as Test_or_Scan from patient_test group by test_name
union all
select scan_name,SUM(amount_to_paid) as total_revenue ,'SCAN' as Test_or_Scan from scan_conduct group by scan_name;

/*6*/




select s.scan_name, s.description,'min' as maximum_or_minimum  from scan s join scan_conduct sc on s.scan_name = sc.scan_name where sc.date_of_scan in (select min(date_of_scan) from scan_conduct)
union all
select s.scan_name, s.description,'max' as maximum_or_minimum  from scan s join scan_conduct sc on s.scan_name = sc.scan_name where sc.date_of_scan in (select max(date_of_scan) from scan_conduct);

/*7*/


create view details as SELECT doc_aadhar_num,COUNT(*) AS count FROM patient_test WHERE date_of_test BETWEEN '2024-07-04' AND '2024-08-15' GROUP BY doc_aadhar_num;


select d.doc_aadhar_num,ds.doctor_name,ds.address,'max' as maximum_or_minimum 
from details d join doctors ds 
on ds.doc_aadhar_num=d.doc_aadhar_num 
where d.count IN(select max(count) from details)

union all

select d.doc_aadhar_num,ds.doctor_name,ds.address,'min' as maximum_or_minimum  
from details d 
join doctors ds 
on ds.doc_aadhar_num=d.doc_aadhar_num 
where d.count IN(select min(count) from details);

/*8*/

select doc_aadhar_num,sum(amount_to_paid),'TEST' as Test_or_Scan from patient_test group by doc_aadhar_num
union all
select doc_aadhar_num,sum(amount_to_paid),'SCAN' as Test_or_Scan from scan_conduct group by doc_aadhar_num;

drop view data_MRI_patients;
drop view detail;
drop view details;
drop table scan_conduct;
drop table patient_test;
drop table scan;
drop table test;
drop table doctors;
drop table patients;
drop table employee;











