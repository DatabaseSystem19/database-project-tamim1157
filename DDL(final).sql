CREATE TABLE Students (
  student_id INT PRIMARY KEY,
  name VARCHAR(25),
  address VARCHAR(25),
  contact_number VARCHAR(20),
  email VARCHAR(30)
);

CREATE TABLE Teachers (
  teacher_id INT PRIMARY KEY,
  name VARCHAR(25),
  address VARCHAR(25),
  contact_number VARCHAR(20),
  email VARCHAR(30)
);

CREATE TABLE Departments (
  department_id INT PRIMARY KEY,
  name VARCHAR(25)
);

CREATE TABLE Courses (
  course_id INT PRIMARY KEY,
  name VARCHAR(25),
  description VARCHAR(35),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Classes (
  class_id INT PRIMARY KEY,
  name VARCHAR(25),
  course_id INT,
  teacher_id INT,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id),
  FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Enrollments (
  enrollment_id INT PRIMARY KEY,
  student_id INT,
  class_id INT,
  enrollment_date DATE,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);



--Cascading Actions in Referential Integrity--
Create table dept2(
dept_id number(20),
dept_name varchar(30),
faculty varchar(30),
no_of_student number(20),
primary key(dept_id)
);
Create table course2(
course_no varchar(20),
course_name varchar(50),
year_semister number(3),
credit number(20,4),
dept_id number(20),
primary key(course_no),
foreign key(dept_id) references dept2(dept_id)
on delete cascade
);

--****own table constraints***--

-- Create the students table
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    address VARCHAR2(100),
    phone_number NUMBER,
    email VARCHAR2(50)
);

-- Create the teachers table
CREATE TABLE teachers (
    teacher_id NUMBER PRIMARY KEY,
    teacher_name VARCHAR2(50),
    address VARCHAR2(100),
    phone_number NUMBER,
    email VARCHAR2(50)
);

-- Create the departments table
CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

-- Create the courses table
CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(50),
    description VARCHAR2(100),
    dept_id NUMBER,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON DELETE CASCADE
       
);

-- Create the classes table
CREATE TABLE classes (
    class_id NUMBER PRIMARY KEY,
    class_name VARCHAR2(50),
    course_id NUMBER,
    teacher_id NUMBER,
   FOREIGN KEY (course_id)  REFERENCES courses(course_id)
   FOREIGN KEY (teacher_id)REFERENCES teachers(teacher_id)
   ON DELETE CASCADE
    
);

-- Create the enrollments table
CREATE TABLE enrollments (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    class_id NUMBER,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)   
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
    ON DELETE CASCADE     
);

--alter--
alter table students add f_name varchar(20);
alter table students modify f_name varchar(25);
alter table students rename column f_name to fathers_name;
alter table students drop column fathers_name ;


--Drop--
drop table enrollments;
drop table classes;
drop table courses;
drop table departments;
drop table teachers;
drop table students;

__constraints on a single relation__

CREATE TABLE std_table (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 18)
);
CREATE TABLE std_table2 (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 18 AND age <= 120),
    status VARCHAR(10) CHECK (status IN ('active', 'inactive', 'pending')),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT check_age_status CHECK (
        (status = 'active' AND age >= 18 AND age <= 65) OR
        (status = 'inactive' AND age >= 18 AND age <= 120) OR
        (status = 'pending' AND age >= 18 AND age <= 100) OR
        (end_date > start_date)
    )
);


