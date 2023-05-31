---PL/SQL DECLARE AND PRINT-----

set serveroutput on
declare 
department_id departments.department_id%type;
name departments.nemeE%type;

begin
select department_id,neme into department_id,name, from departments where department_id=7;
dbms_output.put_line('department_id: '||dept_id|| ' name: '||name || ');
end;
/

---SET DEFAULT AND INSERT VALUE---
set serveroutput ON
DECLARE
STUDENT_ID STUDENTS.STUDENT_ID%TYPE:=1;
NAME STUDENTS.NAME%TYPE:='ARIF';
ADDRESS STUDENTS.ADDRESS%TYPE:='KHULNA';
CONTACT_NUMBER STUDENTS.CONTACT_NUMBER%TYPE:='01862686';
EMAIL STUDENTS.EMAIL%TYPE:='TAMIM@GMAIL.COM';

BEGIN
INSERT INTO STUDENTS VALUES(STUDENT_ID,NAME,ADDRESS,CONTACT_NUMBER,EMAIL);
END;
/

---CURSOR---
set serveroutput ON
DECLARE
CURSOR C IS SELECT * FROM STUDENTS;
STD_ROW STUDENTS%ROWTYPE;
BEGIN
OPEN C;
FETCH C INTO STD_ROW.STUDENT_ID,STD_ROW.NAME,STD_ROW.ADDRESS,STD_ROW.CONTACT_NUMBER,STD_ROW.EMAIL;

WHILE C%FOUND LOOP
DBMS_OUT.PUT_LINE ('STUDENT_ID:' ||STD_ROW.STUDENT_ID|| 'NAME:'||STD_ROW.NAME|| 'ADDRESS:'||STD_ROW.ADDRESS||  'CONTACT_NUMBER: '||STD_ROW.CONTACT_NUMBER|| 'EMAIL:' ||STD_ROW.EMAIL);
dbms_output.put_line('Row count: '|| C%rowcount);
FETCH C INTO STD_ROW.STUDENT_ID,STD_ROW.NAME,STD_ROW.ADDRESS,STD_ROW.CONTACT_NUMBER,STD_ROW.EMAIL;
END LOOP;
CLOSE C;
END;
/

---FOR/WHILE LOOP WITH EXTEND FUNCTION---

set serveroutput on
declare 
  counter number;
  NAME2 STUDENTS.NAME2%type;
  TYPE NAMEARRAY IS VARRAY(5) OF STUDENTS .NAME%type; 
  A_NAME NAMEARRAY:=NAMEARRAY();
begin
  counter:=1;
  for x in 3..6  
  loop
    select NAME into name2 from STUDENTS where STUDENT_ID=x;
    A_NAME.EXTEND();
    A_NAME(counter):=name2;
    counter:=counter+1;
  end loop;
  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/

---FOR/WHILE LOOP WITHOUT EXTEND FUNCTION----

DECLARE 
   counter number :=1;
  NAME2 STUDENTS.NAME2%type;
  TYPE NAMEARRAY IS VARRAY(5) OF STUDENTS .NAME%type; 
   A_NAME NAMEARRAY:=NAMEARRAY('TAMIM', 'SAKIB', 'ARIF', 'RAHMAN', 'AFID'); 
   -- VARRAY with a fixed size of 5 elements and initialized with book names
BEGIN
   counter := 1;
   FOR x IN 2..6  
 loop
    select NAME into name2 from STUDENTS where STUDENT_ID=x;
    A_NAME(counter):=name2;
    counter:=counter+1;
   END LOOP;
   counter := 1;
   WHILE counter <= A_NAME.COUNT 
   LOOP 
      DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
      counter := counter + 1;
   END LOOP;
END;

--if/else---


DECLARE 
 counter number :=1;
  NAME2 STUDENTS.NAME2%type;
  TYPE NAMEARRAY IS VARRAY(5) OF STUDENTS .NAME%type; 
   A_NAME NAMEARRAY:=NAMEARRAY('TAMIM', 'SAKIB', 'ARIF', 'RAHMAN', 'AFID'); 
   -- VARRAY with a fixed size of 5 elements and initialized with book names
BEGIN
   counter := 1;
   FOR x IN 2..6  
 loop
    select NAME into name2 from STUDENTS where STUDENT_ID=x;
  
      if name2='sakib' 
        then
        dbms_output.put_line(name2||' is a '||'student');
      elsif name2='sabbir'  
        then
        dbms_output.put_line(name2||' is a '||'briliant std');
      else 
        dbms_output.put_line(name2||' is a '||'extraordinery');
        end if;
   END LOOP;
END;

----procedure---

CREATE or replace PROCEDURE proc2(
  var1 IN out NUMBER,
  var2 OUT VARCHAR2,
  var3 IN OUT NUMBER
)
AS
  t_show CHAR(30);
BEGIN
  t_show := 'From procedure: ';
  SELECT name INTO var2 FROM students WHERE student_id IN (SELECT student_id FROM enrollments WHERE enrollment_id = var1);
  var3 := var1 + 1; 
  DBMS_OUTPUT.PUT_LINE(t_show || var2 || ' id is ' || var1 || ' number: ' || var3);
END;
/
set serveroutput on
declare 
enrollment_id ENROLLMENTS.enrollment_id%type:=9004;
name students.name%type;
extra number;
begin
proc2(enrollment_id,name,extra);
end;
/

----function---
set serveroutput on
create or replace function fun(var1 in varchar) return varchar AS
value STUDENTS.name%type;
begin
  select name into value from students where student_id=var1; 
   return value;
end;
/
set serveroutput on
declare 
value varchar(20);
begin
value:=fun(5);
end;
/
drop procedure proc2;
drop function fun;
