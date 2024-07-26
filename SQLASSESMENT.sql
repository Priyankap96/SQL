create database assessment;
use assessment;

create table worker (
worker_id int,
first_name varchar(250),
last_name varchar(250),
salary DECIMAL(8, 2) NOT NULL,
joining_date timestamp not null,
departments varchar(10),
primary key (worker_id)
);



insert into worker ( worker_id, first_name, last_name, salary, joining_date, departments )
values
 ( 1, 'monika', 'arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'NIHARIKA', 'VERMA', 80000, '2014-06-11 09:00:00', 'ADMIN'),
(3, 'VISHAL', 'SINGHAL', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'AMITABH', 'SINGH', 500000, '2014-02-20 09:00:00', 'ADMIN'),
(5, 'VIVEK', 'BHATI', 500000, '2014-06-11 09:00:00', 'ADMIN'),
(6, 'VIPUL', 'DIWAN', 200000, '2014-06-11 09:00:00', 'ACCOUNT'),
(7, 'SATISH', 'KUMAR', 75000, '2014-01-20 09:00:00', 'ACCOUNT'),
(8, 'GEETIKA', 'CHAUHAN', 90000, '2014-04-11 09:00:00', 'ADMIN');


select * from worker;
select * from std_info;
drop table std_info;

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from worker order by first_name asc,  departments desc;

-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 
select * from worker where first_name  in ('vipul' , 'satish');

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select * from worker where first_name like '_____h';

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1. 
select  * from worker where salary between 1 and 100000;

-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 

-- 6. Write an SQL query to show the top 6 records of a table. 
select * from worker limit 6;

-- 7. Write an SQL query to fetch the departments that have less than five people in them. 
select departments, count(worker_id) < 5 as no_employees from worker group by departments;


-- 8. Write an SQL query to show all departments along with the number of people in there. 
select departments , count(worker_id) as number_of_ppl from worker group by departments;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department.

select first_name, salary, departments from worker where (salary, departments) in (select max(salary), departments from worker group by departments);

-- ---------------------------------------------------------------------------------------------------

create table stds (
stdid int,
stdname varchar (250) not null ,
sex varchar(50),
percentage decimal (10,2) not null,
class int,
section varchar(11),
stream_s varchar(250),
dob date
);


INSERT INTO STDs (STDID, STDNAME, SEX, PERCENTAGE,CLASS, SECTION, STREAM_S, DOB)
VALUES
(1001, 'surekha joshi', 'female', '82', '12', 'A', 'SCIENCE', '1998-03-08'),
(1002, 'MAAHI AGARWAL', 'FEMALE','56','11', 'C', 'COMMERCE','2008-11-23'),
(1003, 'SANAM VERMA','MALE', '59','11','C','COMMERCE','2006-06-29'),
(1004, 'RONIT KUMAR','MALE','63','11','C','COMMERCE','1997-11-05'),
(1005, 'DIPESH PULKIT', 'MALE','78','11','B','SCIENCE','2003-09-14'),
(1006, 'JAHANVI PURI', 'FEMALE' ,'60', '11', 'B','COMMERCE', '2008-07-11' ),
(1007, 'SANAM KUMAR','MALE','23','12','F','COMMERCE','1998-03-08' ),
(1008, 'SAHIL SARAS','MALE','56','11','C','COMMERCE','2008-07-11'),
(1009, 'AKSHARA AGARWAL', 'FEMALE', '72', '12', 'B', 'COMMERCE', '1996-10-01'),
(1010, 'STUTI MISRA', 'FEMALE', '39', '11','F', 'SCIENCE','2008-11-23'),
(1011, 'HARSH AGARWAL', 'MALE' , '42', '11', 'C', 'SCIENCE', '1998-08-03'),
(1012, 'NIKUNJ AGARWAL', 'MALE', '49', '12','C','COMMERCE', '1998-06-28'),
(1013, 'AKRITI SAXENA', 'FEMALE', '89', '12', 'A', 'SCIENCE', '2008-11-23'),
(1014, 'TANI RASTOGI', 'FEMALE', '82','12','A', 'SCIENCE', '2008-11-23');




-- 1 To display all the records form STUDENT table. SELECT * FROM student ;
select * from stds;
 
 
 /* INSIGHTS
 
 1. query shows all the column regarding information of students which inlcudes 8 columns as table name studs. 
 2. in this table all 8 table name is as STDID, STDNAME, SEX, PERCENTAGE,CLASS, SECTION, STREAM_S, or  DOB.
 
 */
 
 
 
 
-- 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB FROM student ; 
select STDNAME,dob from stds;

/*
- based on qestions requirements seletion of only two column from table stds.
- this column name is stdname shows student's name and dob shows date of birth of all studets.	
- in this list total of 14 student name shows in which 1 student each born year is in 1996 and 97 and 2003 and 2006 , 4 students in 1998, 6 students in 2008.

*/



-- 3. To display all students record where percentage is greater of equal to 80 FROM student table. SELECT * FROM student WHERE percentage >= 80; 

select * from stds where percentage >=80;


/*
-selecting all the column information from std_info table with condition that display those students name only who got less then or equal 80% overall.
-after applying this codition in this table formate total of 3 student name displayed who got less than or equal 80% all students are from different classes.
-in this condition 89% is the highest percentage and 82% is  lower and all are the female students.
- all students come from same stream and sections 
*/

-- 4. To display student name, stream and percentage where percentage of student is more than 80 SELECT StdName, Stream, Percentage WHERE percentage > 80; 
select stdname, stream_s , percentage from stds where percentage > 80;

/*
extracting details of stdname,stream_s, and percentage from stds table.
all the stds are come from same stream_s and having highest percentage.
all 3 of them are girls.

*/

-- 5. To display all records of science students whose percentage is more than 75 form student table. SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75; 
select * from stds where stream_s = 'science' and percentage > 75;

/*
all column details is filtered by percentage which is below than 75 and science stream.
there are 4 female and one male details available, all are from same stream and most of come from same class.
*/