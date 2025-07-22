create database GreenValleyHospital;
USE GreenValleyHospital;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS Medication CASCADE;
DROP TABLE IF EXISTS Admission CASCADE;
DROP TABLE IF EXISTS RequisitionDetails CASCADE;
DROP TABLE IF EXISTS Requisition CASCADE;
DROP TABLE IF EXISTS Supply CASCADE;
DROP TABLE IF EXISTS Patient CASCADE;
DROP TABLE IF EXISTS StaffExperience CASCADE;
DROP TABLE IF EXISTS StaffQualification CASCADE;
DROP TABLE IF EXISTS Staff CASCADE;
DROP TABLE IF EXISTS Supplier CASCADE;
DROP TABLE IF EXISTS Ward CASCADE;
DROP TABLE IF EXISTS Zip CASCADE;


-- Create the Zip table
CREATE TABLE Zip (
    zip CHAR(5) PRIMARY KEY,
    city VARCHAR(15) NOT NULL,
    state CHAR(2) NOT NULL
);

-- Create the Staff table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    hire_date DATE,
    address VARCHAR(50),
    zip CHAR(5),
    contact_phone CHAR(10),
    department_id INT,
    FOREIGN KEY (zip) REFERENCES Zip(zip)
);

-- Create the Ward table
CREATE TABLE Ward (
    ward_id INT PRIMARY KEY,
    ward_name VARCHAR(50) NOT NULL,
    charge_nurse_id INT
);

-- Create the Patient table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    address VARCHAR(50),
    zip CHAR(5),
    contact_phone CHAR(10),
    admission_date DATE,
    ward_id INT,
    FOREIGN KEY (zip) REFERENCES Zip(zip),
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id)
);


-- Create the Supplier table
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50) NOT NULL,
    contact_person VARCHAR(50),
    contact_phone CHAR(10),
    zip CHAR(5),
    FOREIGN KEY (zip) REFERENCES Zip(zip)
);

-- StaffQualification table
CREATE TABLE StaffQualification (
    Staff_id int,
    QualificationName VARCHAR(50),
    Institution VARCHAR(100),
    YearObtained INT,
    PRIMARY KEY (Staff_id, QualificationName, YearObtained),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);
-- StaffExperience table
CREATE TABLE StaffExperience (
    staff_id INT,
    JobTitle VARCHAR(50),
    Organization VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY (staff_id, JobTitle, Organization),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);


-- Create the Supply table
CREATE TABLE Supply (
    supply_id INT PRIMARY KEY,
    supply_name VARCHAR(50) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Create the Requisition table
CREATE TABLE Requisition (
    requisition_id INT PRIMARY KEY,
    staff_id INT,
    requisition_date DATE,
    ward_id INT,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id)
);

-- Create the RequisitionDetails table
CREATE TABLE RequisitionDetails (
    requisition_id INT,
    supply_id INT,
    quantity INT,
    PRIMARY KEY (requisition_id, supply_id),
    FOREIGN KEY (requisition_id) REFERENCES Requisition(requisition_id),
    FOREIGN KEY (supply_id) REFERENCES Supply(supply_id)
);

-- Create the Admission table
CREATE TABLE Admission (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    admission_date DATE,
    discharge_date DATE,
    ward_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id)
);

-- Create the Medication table
CREATE TABLE Medication (
    medication_id INT PRIMARY KEY,
    medication_name VARCHAR(50) NOT NULL,
    dosage VARCHAR(50),
    side_effects VARCHAR(100)
);


-- Insert data into Zip table
INSERT INTO Zip (zip, city, state) VALUES ('10101', 'New York', 'NY');
INSERT INTO Zip (zip, city, state) VALUES ('10801', 'New Rochelle', 'NY');
INSERT INTO Zip (zip, city, state) VALUES ('20001', 'Washington', 'DC');
INSERT INTO Zip (zip, city, state) VALUES ('30301', 'Atlanta', 'GA');
INSERT INTO Zip (zip, city, state) VALUES ('60601', 'Chicago', 'IL');
INSERT INTO Zip (zip, city, state) VALUES ('94101', 'San Francisco', 'CA');
INSERT INTO Zip (zip, city, state) VALUES ('75201', 'Dallas', 'TX');

-- Insert data into Ward table
INSERT INTO Ward (ward_id, ward_name, charge_nurse_id) VALUES (1, 'Emergency', 1);
INSERT INTO Ward (ward_id, ward_name, charge_nurse_id) VALUES (2, 'Pediatrics', 2);
INSERT INTO Ward (ward_id, ward_name, charge_nurse_id) VALUES (3, 'Surgery', 3);
INSERT INTO Ward (ward_id, ward_name, charge_nurse_id) VALUES (4, 'Intensive Care', 4);
INSERT INTO Ward (ward_id, ward_name, charge_nurse_id) VALUES (5, 'Cardiology', 5);

-- Insert data into Supplier table
INSERT INTO Supplier (supplier_id, supplier_name, contact_person, contact_phone, zip) VALUES (1, 'Health Supplies Inc.', 'Alice Brown', '5551234567', '10101');
INSERT INTO Supplier (supplier_id, supplier_name, contact_person, contact_phone, zip) VALUES (2, 'Medical Essentials LLC', 'Bob Smith', '5559876543', '10801');
INSERT INTO Supplier (supplier_id, supplier_name, contact_person, contact_phone, zip) VALUES (3, 'Pharma Supplies', 'Carol Jones', '5556543210', '20001');
INSERT INTO Supplier (supplier_id, supplier_name, contact_person, contact_phone, zip) VALUES (4, 'MedCare Ltd.', 'David Clark', '5554321098', '30301');
INSERT INTO Supplier (supplier_id, supplier_name, contact_person, contact_phone, zip) VALUES (5, 'Hospital Supplies Co.', 'Emily Davis', '5558765432', '60601');
INSERT INTO Supplier (supplier_id, supplier_name, contact_person, contact_phone, zip) VALUES (6, 'LifeCare Inc.', 'Frank Wilson', '5553456789', '94101');
INSERT INTO Supplier (supplier_id, supplier_name, contact_person, contact_phone, zip) VALUES (7, 'Wellness Products', 'Grace Lewis', '5555678901', '75201');

-- Insert data into Staff table
INSERT INTO Staff (staff_id, first_name, last_name, date_of_birth, gender, hire_date, address, zip, contact_phone, department_id) VALUES (1, 'John', 'Doe', '1980-01-01', 'M', '2005-06-15', '123 Main St', '10101', '5551234567', 1);
INSERT INTO Staff (staff_id, first_name, last_name, date_of_birth, gender, hire_date, address, zip, contact_phone, department_id) VALUES (2, 'Jane', 'Smith', '1985-02-14', 'F', '2010-09-21', '456 Elm St', '10801', '5559876543', 2);
INSERT INTO Staff (staff_id, first_name, last_name, date_of_birth, gender, hire_date, address, zip, contact_phone, department_id) VALUES (3, 'Emily', 'Jones', '1992-05-23', 'F', '2016-11-10', '789 Pine St', '20001', '5556789012', 3);
INSERT INTO Staff (staff_id, first_name, last_name, date_of_birth, gender, hire_date, address, zip, contact_phone, department_id) VALUES (4, 'Michael', 'Brown', '1978-12-05', 'M', '2002-03-30', '101 Maple St', '30301', '5553456789', 4);
INSERT INTO Staff (staff_id, first_name, last_name, date_of_birth, gender, hire_date, address, zip, contact_phone, department_id) VALUES (5, 'Sarah', 'Davis', '1988-07-13', 'F', '2015-06-20', '202 Oak St', '60601', '5558901234', 5);
INSERT INTO Staff (staff_id, first_name, last_name, date_of_birth, gender, hire_date, address, zip, contact_phone, department_id) VALUES (6, 'David', 'Wilson', '1990-03-25', 'M', '2019-01-05', '303 Cedar St', '94101', '5556782345', 1);
INSERT INTO Staff (staff_id, first_name, last_name, date_of_birth, gender, hire_date, address, zip, contact_phone, department_id) VALUES (7, 'Laura', 'Taylor', '1995-08-17', 'F', '2021-08-11', '404 Birch St', '75201', '5554328765', 2);

-- Insert data into Patient table
INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, zip, contact_phone, admission_date, ward_id) VALUES (1, 'Alice', 'Johnson', '1990-03-05', 'F', '789 Maple Ave', '10101', '5556543210', '2024-08-11', 1);
INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, zip, contact_phone, admission_date, ward_id) VALUES (2, 'Bob', 'Williams', '1987-07-19', 'M', '321 Oak St', '10801', '5553210987', '2024-08-10', 2);
INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, zip, contact_phone, admission_date, ward_id) VALUES (3, 'Chris', 'Martin', '1995-11-22', 'M', '654 Pine St', '20001', '5554321098', '2024-08-15', 3);
INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, zip, contact_phone, admission_date, ward_id) VALUES (4, 'Diana', 'Garcia', '1982-06-30', 'F', '987 Elm St', '30301', '5558765432', '2024-08-14', 4);
INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, zip, contact_phone, admission_date, ward_id) VALUES (5, 'Eva', 'Harris', '1975-09-09', 'F', '123 Oak Ave', '60601', '5559876543', '2024-08-13', 5);
INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, zip, contact_phone, admission_date, ward_id) VALUES (6, 'Frank', 'Miller', '1991-04-12', 'M', '456 Maple Ave', '94101', '5553216789', '2024-08-16', 1);
INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, zip, contact_phone, admission_date, ward_id) VALUES (7, 'Grace', 'Martinez', '1986-10-07', 'F', '789 Cedar St', '75201', '5556547890', '2024-08-12', 2);

INSERT INTO StaffQualification (staff_id, QualificationName, Institution, YearObtained)
VALUES (1, 'Bachelor of Nursing', 'Springfield University', 2015),
       (1, 'Advanced Cardiac Life Support', 'American Heart Association', 2017),
       (2, 'Bachelor of Nursing', 'University of Nebraska', 2014),
       (2, 'Pediatric Nursing Certification', 'Pediatric Nursing Certification Board', 2016),
       (3, 'Bachelor of Nursing', 'University of Wisconsin', 2016),
       (3, 'Trauma Nursing Core Course', 'Emergency Nurses Association', 2018),
       (4, 'Bachelor of Nursing', 'University of Chicago', 2018),
       (4, 'Certified Emergency Nurse', 'Board of Certification for Emergency Nursing', 2019),
       (5, 'Bachelor of Nursing', 'University of Michigan', 2013),
       (5, 'Oncology Nursing Certification', 'Oncology Nursing Certification Corporation', 2015),
       (6, 'Bachelor of Nursing', 'St. Louis University', 2016),
       (6, 'Critical Care Nursing Certification', 'American Association of Critical-Care Nurses', 2018),
       (7, 'Bachelor of Nursing', 'University of Minnesota', 2019),
       (7, 'Psychiatric Nursing Certification', 'American Nurses Credentialing Center', 2021);

-- Staff member 201
INSERT INTO StaffExperience (staff_id, JobTitle, Organization, StartDate, EndDate) VALUES
(1, 'Nurse', 'Springfield Hospital', '2020-01-15', '2022-01-14'),
(1, 'Nurse', 'Springfield Clinic', '2022-01-15', '2023-01-14');

-- Staff member 202
INSERT INTO StaffExperience (staff_id, JobTitle, Organization, StartDate, EndDate) VALUES
(2, 'Nurse', 'Lincoln Medical Center', '2017-06-01', '2021-06-01');

-- Staff member 203
INSERT INTO StaffExperience (staff_id, JobTitle, Organization, StartDate, EndDate) VALUES
(3, 'Nurse', 'Madison Health Clinic', '2019-03-22', '2022-03-22'),
(3, 'Nurse', 'Madison Community Hospital', '2022-03-23', '2024-03-23');

-- Staff member 204
INSERT INTO StaffExperience (staff_id, JobTitle, Organization, StartDate, EndDate) VALUES
(4, 'Nurse', 'Chicago Medical Group', '2021-05-10', '2023-05-10'),
(4, 'Nurse', 'Chicago General Hospital', '2023-05-11', '2024-05-10');

-- Staff member 205
INSERT INTO StaffExperience (staff_id, JobTitle, Organization, StartDate, EndDate) VALUES
(5, 'Nurse', 'Detroit Health Services', '2014-09-14', '2019-09-14'),
(5, 'Nurse', 'Detroit Specialty Care', '2019-09-15', '2022-09-14');

-- Staff member 206
INSERT INTO StaffExperience (staff_id, JobTitle, Organization, StartDate, EndDate) VALUES
(6, 'Nurse', 'St. Louis Hospital', '2019-12-30', '2022-12-30'),
(6, 'Nurse', 'St. Louis Health Clinic', '2022-12-31', '2024-12-30');

-- Staff member 207
INSERT INTO StaffExperience (staff_id, JobTitle, Organization, StartDate, EndDate) VALUES
(7, 'Nurse', 'Minneapolis Medical Center', '2022-02-20', '2024-02-20');

-- Insert data into Supply table
INSERT INTO Supply (supply_id, supply_name, supplier_id) VALUES (1, 'Bandages', 1);
INSERT INTO Supply (supply_id, supply_name, supplier_id) VALUES (2, 'Antiseptic', 2);
INSERT INTO Supply (supply_id, supply_name, supplier_id) VALUES (3, 'Syringes', 3);
INSERT INTO Supply (supply_id, supply_name, supplier_id) VALUES (4, 'IV Fluids', 4);
INSERT INTO Supply (supply_id, supply_name, supplier_id) VALUES (5, 'Medications', 5);
INSERT INTO Supply (supply_id, supply_name, supplier_id) VALUES (6, 'Surgical Instruments', 6);
INSERT INTO Supply (supply_id, supply_name, supplier_id) VALUES (7, 'Patient Monitors', 7);

-- Insert data into Requisition table
INSERT INTO Requisition (requisition_id, staff_id, requisition_date, ward_id) VALUES (1, 1, '2024-08-01', 1);
INSERT INTO Requisition (requisition_id, staff_id, requisition_date, ward_id) VALUES (2, 2, '2024-08-03', 2);
INSERT INTO Requisition (requisition_id, staff_id, requisition_date, ward_id) VALUES (3, 3, '2024-08-05', 3);
INSERT INTO Requisition (requisition_id, staff_id, requisition_date, ward_id) VALUES (4, 4, '2024-08-07', 4);
INSERT INTO Requisition (requisition_id, staff_id, requisition_date, ward_id) VALUES (5, 5, '2024-08-09', 5);

-- Insert data into RequisitionDetails table
INSERT INTO RequisitionDetails (requisition_id, supply_id, quantity) VALUES (1, 1, 100);
INSERT INTO RequisitionDetails (requisition_id, supply_id, quantity) VALUES (1, 2, 50);
INSERT INTO RequisitionDetails (requisition_id, supply_id, quantity) VALUES (2, 3, 200);
INSERT INTO RequisitionDetails (requisition_id, supply_id, quantity) VALUES (3, 4, 150);
INSERT INTO RequisitionDetails (requisition_id, supply_id, quantity) VALUES (4, 5, 300);
INSERT INTO RequisitionDetails (requisition_id, supply_id, quantity) VALUES (5, 6, 20);

-- Insert data into Admission table
INSERT INTO Admission (admission_id, patient_id, admission_date, discharge_date, ward_id) VALUES (1, 1, '2024-08-11', NULL, 1);
INSERT INTO Admission (admission_id, patient_id, admission_date, discharge_date, ward_id) VALUES (2, 2, '2024-08-10', NULL, 2);
INSERT INTO Admission (admission_id, patient_id, admission_date, discharge_date, ward_id) VALUES (3, 3, '2024-08-15', NULL, 3);
INSERT INTO Admission (admission_id, patient_id, admission_date, discharge_date, ward_id) VALUES (4, 4, '2024-08-14', NULL, 4);
INSERT INTO Admission (admission_id, patient_id, admission_date, discharge_date, ward_id) VALUES (5, 5, '2024-08-13', NULL, 5);
INSERT INTO Admission (admission_id, patient_id, admission_date, discharge_date, ward_id) VALUES (6, 6, '2024-08-16', NULL, 1);
INSERT INTO Admission (admission_id, patient_id, admission_date, discharge_date, ward_id) VALUES (7, 7, '2024-08-12', NULL, 2);

-- Insert data into Medication table
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (1, 'Aspirin', '500 mg', 'Nausea');
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (2, 'Ibuprofen', '200 mg', 'Upset stomach');
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (3, 'Acetaminophen', '500 mg', 'Allergic reaction');
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (4, 'Amoxicillin', '250 mg', 'Diarrhea');
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (5, 'Lisinopril', '10 mg', 'Cough');
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (6, 'Metformin', '500 mg', 'Nausea, Vomiting');
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (7, 'Atorvastatin', '20 mg', 'Muscle pain');
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (8, 'Hydrochlorothiazide', '25 mg', 'Dizziness');
INSERT INTO Medication (medication_id, medication_name, dosage, side_effects) VALUES (9, 'Omeprazole', '20 mg', 'Headache');