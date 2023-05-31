-- Insert data into Students table
insert into students values(1,'sakib','khulna',01814786,'shasan@gmail.com');
insert into students values(2,'rafi','Dhaka',01514656,'rafi@gmail.com');
insert into students values(3,'afif','rangpur',01614564,'afif@gmail.com');
insert into students values(4,'sabbir','rajshahi',01714987,'sabbir@gmail.com');
insert into students values(5,'mushfik','barisal',01814786,'mushfikhasan@gmail.com');
insert into students values(6,'rafid','cumilla',01513656,'rafid@gmail.com');
insert into students values(7,'arif','bhola',01619564,'arif@gmail.com');
insert into students values(8,'sabuj','rangamati',01734987,'sabuj@gmail.com');
insert into students values(9,'mahmud','jashore',01884786,'mahmud@gmail.com');
insert into students values(10,'karim','magura',01594656,'karim@gmail.com');

-- Insert data into Teachers table
insert into teachers values(1,'mr.abid','jashore',01871678,'abid@gmail.com');
insert into teachers values(2,'mr.arif','dhaka',01771678,'arif@gmail.com');
insert into teachers values(3,'mr.shafiul','khulna',01574678,'sujon@gmail.com');
insert into teachers values(4,'mr.noyon','barisal',01561678,'noyon@gmail.com');
insert into teachers values(5,'mr.rahman','sylhet',01872678,'abid@gmail.com');
insert into teachers values(6,'mr.sukanto','natore',01771978,'sb@gmail.com');
insert into teachers values(7,'mr.shafin','cumilla',01578678,'dipto@gmail.com');
insert into teachers values(8,'mr.rakib','kushtia',01571678,'rakibislam@gmail.com');
insert into teachers values(9,'mr.alamin','rajshahi',01841678,'alamin@gmail.com');
insert into teachers values(10,'mr.alif','chattogram',01721678,'armaanalif@gmail.com');

-- Insert data into Departments table
insert into departments values(1,'CSE');
insert into departments values(2,'EEE');
insert into departments values(3,'MSE');
insert into departments values(4,'ECE');
insert into departments values(5,'ESE');
insert into departments values(6,'CE');
insert into departments values(7,'ME');
insert into departments values(8,'URP');
insert into departments values(9,'BECM');
insert into departments values(10,'MME');

-- Insert data into Courses table
insert into courses values(1,'DLD DESIGN','computer related sub',1);
insert into courses values(2,'circuit',' mathmatical part',2);
insert into courses values(3,'physics','classical physics',3);
insert into courses values(4,'chemistry','solution analysis',4);
insert into courses values(5,'energy distribution','concept of energy',5);
insert into courses values(6,'structural design','logical part',6);
insert into courses values(7,'automobile eng','design process',7);
insert into courses values(8,'3d planning','urban planning',8);
insert into courses values(9,'construction eng','building eng',9);
insert into courses values(10,'material eng','metal detection',10);

-- Insert data into Classes table
insert into classes values(1001,'DLD 101',1,1);
insert into classes values(1002,'EEE 101',2,2);
insert into classes values(1003,'physics 101',3,3);
insert into classes values(1004,'chemistry 101',4,4);
insert into classes values(1005,'ESE 101',5,5);
insert into classes values(1006,'ce 101',6,6);
insert into classes values(1007,'me 101',7,7);
insert into classes values(1008,'urp 101',8,8);
insert into classes values(1009,'becm 101',9,9);
insert into classes values(1010,'mme 101',10,10);

-- Insert data into Enrollments table
 insert into enrollments values(9001,1,1001,TO_DATE('2012/04/12','yyyy/MM/dd'));
 insert into enrollments values(9002,2,1002,TO_DATE('2013/03/22','yyyy/MM/dd'));
 insert into enrollments values(9003,3,1003,TO_DATE('2011/02/02','yyyy/MM/dd'));
 insert into enrollments values(9004,4,1004,TO_DATE('2010/01/12','yyyy/MM/dd'));
 insert into enrollments values(9005,5,1005,TO_DATE('2014/04/12','yyyy/MM/dd'));
 insert into enrollments values(9006,6,1006,TO_DATE('2018/03/22','yyyy/MM/dd'));
 insert into enrollments values(9007,7,1007,TO_DATE('2001/02/02','yyyy/MM/dd'));
 insert into enrollments values(9008,8,1008,TO_DATE('2000/01/12','yyyy/MM/dd'));
 insert into enrollments values(9009,9,1009,TO_DATE('2019/04/12','yyyy/MM/dd'));
 insert into enrollments values(9010,10,1010,TO_DATE('2022/03/22','yyyy/MM/dd'));

--Save the SQL command output--
***Save the SQL command output in csv file***
SET MARKUP XML ON
SET HEADING OFF
SET PAGESIZE 0
SET FEEDBACK OFF
SPOOL C:\xampp\htdocs\Lab1.csv
SELECT *
FROM students;
SPOOL OFF

***Save the SQL command output in xml file***
SET COLSEP ","
SET HEADING OFF
SET PAGESIZE 0
SET FEEDBACK OFF
SPOOL C:\xampp\htdocs\Lab1.csv
SELECT *
FROM students;
SPOOL OFF

***Save the SQL command output in text file***
SPOOL C:\xampp\htdocs\Lab1.csv
SELECT *
FROM students;
SPOOL OFF

--display data using command--

SELECT * FROM Teachers WHERE email = 'abid@gmail.com';
SELECT * FROM Departments WHERE name = 'EEE';

--subquery--
->select name from students where student_id=(select student_id from enrollments where class_id=1001);

->select name from teachers where teacher_id=(select teacher_id from classes where course_id=7);
->select name from departments where department_id=(select department_id from courses where course_id=(select course_id from classes where name='EEE 101'));
->select name from teachers where teacher_id=(select teacher_id from classes where class_id=(select class_id from enrollments where enrollment_id=9007));

--union operation--
select name from departments where name like 'E%' union select name from departments where name like '%M%';

--update and delete row--
->update departments set name='EECE' where department_id=2;
->insert into teachers values(11,'mr.al hasan','kolkata',01721678,'armaanalif@gmail.com');
->delete from teachers where teacher_id=11;

--with clause--
->with max_id(val) as (select max(student_id) from students)
select * from students,max_id where students.student_id=max_id.val;

--Aggregate function--
->select count(*) from students;
->select count(student_id) as num_of_id from students;
->select count(address) as num_of_address from students;
->select count(distinct address) as num_of_address from students;
->select avg(student_id) as avg_of_id from students;
->select sum(student_id) as avg_of_id from students;
->select max(student_id) as avg_of_id from students;
->select min(student_id) as avg_of_id from students;

--group by or having--
->select address,avg(student_id) from students group by address;
->select address,avg(student_id) from students group by address having avg(student_id)>5;

--Nested subquery--
select name from departments where department_id=(select department_id from courses where course_id=(select course_id from classes where class_id=(select class_id from enrollments where student_id=7)));

--set membership--
->select * from students where name like 'e%' and student_id in (select student_id from students where email like '%mail%');
->select * from students where name like 'h%' and student_id in (select student_id from students where email like '%mail%');

--some/all/exist--
->select * from students where student_id> some(select student_id from students where student_id>=5);
->select * from students where student_id> all(select student_id from students where student_id>=5);
->select * from students where student_id=9 and exists(select * from students where address like '%k%');

--string operation--
->SELECT * FROM departments WHERE NAME LIKE 'E%';
->SELECT * FROM departments WHERE NAME LIKE '%E%';
 SELECT * FROM departments WHERE NAME LIKE '%E';
-> SELECT * FROM departments WHERE NAME LIKE '%E%E%E';

->SELECT * FROM departments WHERE NAME LIKE '___';
->SELECT * FROM departments WHERE NAME LIKE '_C_';
->SELECT * FROM departments WHERE NAME LIKE '___' or  NAME LIKE '____';

--join operation--
->select *from students natural join departments where name='CSE';
->select *from students natural join departments where department_id=7;

-> select *from students natural join enrollments;
-> select name,email from students join enrollments using (student_id);

select name,contact_number from students left outer join enrollments using(student_id);
select name,contact_number from students right outer join enrollments using(student_id);
select name,contact_number from students full outer join enrollments using(student_id);
select name,contact_number from students left outer join  enrollments  on students.student_id=enrollments.student_id;

--view--
create view student_details as select student_id,name from students;
create view CSE_DEPT_COURSE as select name from departments where department_id=(select department_id from courses where name='physics');
create view  custom as select * from students where student_id>=3;

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
insert into dept2(dept_id,dept_name,faculty,no_of_student)values(7,'CSE','EE',120);
insert into dept2(dept_id,dept_name,faculty,no_of_student)values(3,'EEE','EE',120);
insert into dept2(dept_id,dept_name,faculty,no_of_student)values(1,'CE','CE',120);
insert into dept2(dept_id,dept_name,faculty,no_of_student)values(5,'ME','ME',120);
insert into dept2(dept_id,dept_name,faculty,no_of_student)values(2,'ECE','EE',60);

insert into course2(course_no,course_name,year_semister,credit,dept_id)values('CSE1101','discreate math',11,3.00,7);
insert into course2(course_no,course_name,year_semister,credit,dept_id)values('CSE3105','database systems',31,3.00,7);
insert into course2(course_no,course_name,year_semister,credit,dept_id)values('EEE1101','Basic electrical engineering',11,3.00,3);
insert into course2(course_no,course_name,year_semister,credit,dept_id)values('ME3101','solid mechanics',31,3.00,5);

drop table dept2;
drop table course2;




