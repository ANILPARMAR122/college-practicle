-- ==========================================
-- Assignment 3 - RDBMS Tables & Constraints
-- Name: Anil Parmar
-- ==========================================

create database if not exists college_db;
use college_db;

-- 1. University Details
create table university_details (
    university_id varchar(4) primary key,
    university_name varchar(100) not null,
    uni_type varchar(20) not null,
    city varchar(50),
    state varchar(50),
    -- constraints from assignment
    check (university_id like 'U___'),
    check (uni_type in ('State', 'Private'))
);

-- 2. College Details
create table colleg_details (
    colleg_id varchar(2) primary key,
    clg_name varchar(100) not null,
    uni_id varchar(4),
    clg_type varchar(50),
    city varchar(50),
    state varchar(50),
    check (colleg_id like 'C_'),
    foreign key (uni_id) references university_details(university_id)
);

-- 3. Student Details
create table student_details (
    student_id varchar(3) primary key,
    stud_name varchar(100) not null,
    dob date not null,
    age int,
    email_id varchar(100),
    mobile_no varchar(15),
    city varchar(50),
    check (student_id like 'S__'),
    check (age >= 20)
);

-- 4. Course Details
create table course_details (
    cours_id varchar(2) primary key,
    cours_name varchar(100) not null unique,
    no_of_seat int,
    duration int, -- duration in months
    fees decimal(10,2) not null,
    check (cours_id like 'C_'),
    check (duration >= 1)
);

-- 5. Admission Details
create table admission_details (
    reg_id varchar(6) primary key,
    stud_id varchar(3),
    college_id varchar(2),
    course_id varchar(2),
    uni_id varchar(4),
    prn_no varchar(20) unique,
    Admission_date date,
    paid_fees decimal(10,2) not null,
    remaining_fees decimal(10,2),
    check (reg_id regexp '^[0-9]{6}$'),
    check (remaining_fees <= paid_fees),
    foreign key (stud_id) references student_details(student_id),
    foreign key (college_id) references colleg_details(colleg_id),
    foreign key (course_id) references course_details(cours_id),
    foreign key (uni_id) references university_details(university_id)
);


-- ==========================================
-- Inserting Records (10 per table)
-- ==========================================

-- Universities
insert into university_details values
('U001', 'Shivaji University', 'State', 'Kolhapur', 'Maharashtra'),
('U002', 'Pune University', 'State', 'Pune', 'Maharashtra'),
('U003', 'Symbiosis International', 'Private', 'Pune', 'Maharashtra'),
('U004', 'Mumbai University', 'State', 'Mumbai', 'Maharashtra'),
('U005', 'Bharati Vidyapeeth', 'Private', 'Pune', 'Maharashtra'),
('U006', 'Solapur University', 'State', 'Solapur', 'Maharashtra'),
('U007', 'DY Patil University', 'Private', 'Kolhapur', 'Maharashtra'),
('U008', 'BATU Lonere', 'State', 'Lonere', 'Maharashtra'),
('U009', 'NMIMS', 'Private', 'Mumbai', 'Maharashtra'),
('U010', 'Amity University', 'Private', 'Mumbai', 'Maharashtra');

-- Colleges
insert into colleg_details values
('C1', 'CIMDR', 'U001', 'Autonomous', 'Sangli', 'Maharashtra'),
('C2', 'Willingdon College', 'U001', 'Aided', 'Sangli', 'Maharashtra'),
('C3', 'KWC College', 'U001', 'Aided', 'Sangli', 'Maharashtra'),
('C4', 'Fergusson College', 'U002', 'Autonomous', 'Pune', 'Maharashtra'),
('C5', 'COEP', 'U002', 'Government', 'Pune', 'Maharashtra'),
('C6', 'SICSR', 'U003', 'Private', 'Pune', 'Maharashtra'),
('C7', 'RIT Rajaramnagar', 'U001', 'Autonomous', 'Islampur', 'Maharashtra'),
('C8', 'KIT College of Engg', 'U001', 'Autonomous', 'Kolhapur', 'Maharashtra'),
('C9', 'St Xaviers College', 'U004', 'Autonomous', 'Mumbai', 'Maharashtra'),
('CA', 'MIT WPU College', 'U005', 'Private', 'Pune', 'Maharashtra');

-- Students (Age >= 20)
insert into student_details values
('S01', 'Anil Parmar', '2004-05-15', 22, 'anilparmar@gmail.com', '9890123456', 'Sangli'),
('S02', 'Sourabh Patil', '2003-08-20', 23, 'sourabh.p@gmail.com', '9890123457', 'Sangli'),
('S03', 'Prathamesh Joshi', '2004-01-10', 22, 'prathamesh.j@gmail.com', '9890123458', 'Miraj'),
('S04', 'Omkar Shinde', '2003-11-25', 23, 'omkar.s@gmail.com', '9890123459', 'Kolhapur'),
('S05', 'Aditya Kadam', '2002-04-14', 24, 'aditya.k@gmail.com', '9890123460', 'Pune'),
('S06', 'Rohan Mane', '2004-09-02', 22, 'rohan.m@gmail.com', '9890123461', 'Sangli'),
('S07', 'Snehal Deshmukh', '2003-03-18', 23, 'snehal.d@gmail.com', '9890123462', 'Satara'),
('S08', 'Vaishnavi Pawar', '2002-12-30', 24, 'vaishnavi.p@gmail.com', '9890123463', 'Karad'),
('S09', 'Sanket Kulkarni', '2003-07-07', 23, 'sanket.k@gmail.com', '9890123464', 'Kolhapur'),
('S10', 'Tejas More', '2004-02-11', 22, 'tejas.m@gmail.com', '9890123465', 'Sangli');

-- Courses (Duration in months, Unique names)
insert into course_details values
('C1', 'BCA', 60, 36, 45000.00),
('C2', 'MCA', 60, 24, 75000.00),
('C3', 'B.Sc Computer Science', 80, 36, 30000.00),
('C4', 'M.Sc Computer Science', 40, 24, 50000.00),
('C5', 'B.Tech CS', 120, 48, 110000.00),
('C6', 'BBA', 60, 36, 40000.00),
('C7', 'MBA', 60, 24, 90000.00),
('C8', 'Diploma in Web Dev', 30, 6, 20000.00),
('C9', 'Data Science Certificate', 30, 6, 25000.00),
('CB', 'AI & ML Bootcamp', 25, 3, 30000.00);

-- Admission Details (remaining_fees <= paid_fees)
insert into admission_details values
('101001', 'S01', 'C1', 'C2', 'U001', 'PRN202601', '2026-07-01', 50000.00, 25000.00),
('101002', 'S02', 'C1', 'C2', 'U001', 'PRN202602', '2026-07-02', 45000.00, 30000.00),
('101003', 'S03', 'C2', 'C1', 'U001', 'PRN202603', '2026-07-05', 25000.00, 20000.00),
('101004', 'S04', 'C4', 'C3', 'U002', 'PRN202604', '2026-07-08', 20000.00, 10000.00),
('101005', 'S05', 'C5', 'C5', 'U002', 'PRN202605', '2026-07-10', 70000.00, 40000.00),
('101006', 'S06', 'C3', 'C1', 'U001', 'PRN202606', '2026-07-12', 30000.00, 15000.00),
('101007', 'S07', 'C6', 'C2', 'U003', 'PRN202607', '2026-07-15', 50000.00, 25000.00),
('101008', 'S08', 'C7', 'C5', 'U001', 'PRN202608', '2026-07-18', 60000.00, 50000.00),
('101009', 'S09', 'C8', 'C5', 'U001', 'PRN202609', '2026-07-20', 65000.00, 45000.00),
('101010', 'S10', 'C1', 'C1', 'U001', 'PRN202610', '2026-07-22', 25000.00, 20000.00);
