CREATE DATABASE PROJECT_1
USE PROJECT_1


--REGIONS TABLE CREATED
CREATE TABLE REGIONS(
REGION_ID INT PRIMARY KEY,
REGION_NAME VARCHAR(25) DEFAULT NULL
)
SELECT * FROM REGIONS


--COUNTRIES TABLE CREATED

/*ON DELETE CASCADE:
This means that if a record in the REGIONS table is deleted,
any rows in the CPUNTRIES table that reference that REGION_ID will also be deleted automatically. 
This is known as a "cascade delete." 
It helps maintain referential integrity by ensuring that no orphaned rows are left in CPUNTRIES 
that refer to a REGION_ID that no longer exists in REGIONS.*/

/*ON UPDATE CASCADE:
This means that if the REGION_ID in the REGIONS table is updated (changed), 
then the corresponding REGION_ID values in the CPUNTRIES table will also be 
automatically updated to match the new value. This is known as a "cascade update,"
which ensures that the relationship between the tables remains consistent when REGION_ID values change.*/

CREATE TABLE COUNTRIES(
COUNTRY_ID CHAR(2) PRIMARY KEY,
COUNTRY_NAME VARCHAR (40) DEFAULT NULL,
REGION_ID INT NOT NULL,
FOREIGN KEY (REGION_ID) REFERENCES REGIONS(REGION_ID) 
ON DELETE CASCADE ON UPDATE CASCADE
)
SELECT * FROM COUNTRIES


--LOCATION TABLE
CREATE TABLE LOCATION (
LOCATION_ID INT PRIMARY KEY,
STREET_ADDRESS VARCHAR (40) DEFAULT NULL,
POSTAL_CODE VARCHAR (12) DEFAULT NULL,
CITY VARCHAR (30) NOT NULL,
STATE_PROVINCE VARCHAR (25) DEFAULT NULL,
COUNTRY_ID CHAR (2) NOT NULL,
FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRIES (COUNTRY_ID) ON DELETE
CASCADE ON UPDATE CASCADE
)
SELECT * FROM LOCATION


--JOB TABLE
CREATE TABLE JOBS (
JOB_ID INT PRIMARY KEY,
JOB_TITLE VARCHAR (35) NOT NULL,
MIN_SALARY DECIMAL (8, 2) DEFAULT NULL,
MAX_SALARY DECIMAL (8, 2) DEFAULT NULL
);
SELECT * FROM JOBS


--DEPARTMENTS TABLE
CREATE TABLE DEPARTMENTS (
DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR (30) NOT NULL,
LOCATION_ID INT DEFAULT NULL,
FOREIGN KEY(LOCATION_ID) REFERENCES LOCATION(LOCATION_ID) 
ON DELETE CASCADE ON UPDATE CASCADE
)
SELECT * FROM DEPARTMENTS


--EMPLOYEES TABLE

CREATE TABLE EMPLOYEES(
EMPLOYEE_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR (20) DEFAULT NULL,
LAST_NAME VARCHAR (25) NOT NULL,
EMAIL VARCHAR (100) NOT NULL,
PHONE_NUMBER VARCHAR (20) DEFAULT NULL,
HIRE_DATE DATE NOT NULL,
JOB_ID INT NOT NULL,
SALARY DECIMAL (8, 2) NOT NULL,
MANAGER_ID INT DEFAULT NULL,
DEPARTMENT_ID INT DEFAULT NULL,
FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID) ON
DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID) ON
DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID)
)
SELECT * FROM EMPLOYEES


--DEPENDENTS TABLE

CREATE TABLE DEPENDENTS (
DEPENDENT_ID INT PRIMARY KEY,
FISRT_NAME VARCHAR (50) NOT NULL,
LAST_NAME VARCHAR (50) NOT NULL,
RELATIONSHIP VARCHAR (25) NOT NULL,
EMPLOYEE_ID INT NOT NULL,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID) ON DELETE
CASCADE ON UPDATE CASCADE
);
SELECT * FROM DEPENDENTS


--DATA FOR THE TABLES REGIONS
INSERT INTO regions(region_id,region_name)
VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name)
VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name)
VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name)
VALUES (4,'Middle East and Africa');
SELECT * FROM regions

/*Data for the table countries */

INSERT INTO countries(country_id,country_name,region_id)
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('ZW','Zimbabwe',4);
SELECT * FROM countries

/*Data for the table locations */
INSERT INTO LOCATION
(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO location(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO location(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO location(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO location(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO location(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO location(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
SELECT * FROM LOCATION


/*Datafor the table jobs */

INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (19,'Stock Manager',5500.00,8500.00);
SELECT * FROM jobs


/*Data for the table departments */
INSERT INTO departments(department_id,department_name,location_id)
VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (11,'Accounting',1700);
SELECT * FROM departments

/*Data for the table employees */

INSERT INTO
EMPLOYEES(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
SELECT * from employees 



/*Data for the table dependents */

INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,FISRT_NAME,last_name,relationship,employee_id)
VALUES (30,'Sandra','Taylor','Child',176);
SELECT * from dependents 


--TASK 1: 

--A:To get data from all the rows and columns in the employees table, solution 
SELECT * FROM EMPLOYEES

/*B: select data from the employee id, first name, last name, and hire date of all rows in
the employees table: SOLUTION b*/
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE FROM EMPLOYEES

/* D: Increase the salary two times and named as New_SALARY from employees table 
C: to get the first name, last name, salary, and new salary:   SOLUTION*/
SELECT FIRST_NAME,LAST_NAME,SALARY, SALARY*2 AS NEW_SALARY FROM EMPLOYEES





--TASK 2:

/* A: returns the data from the employee id, first name, last name, hire date, and salary column of
the employees table:
   B: to sort employees by first names in alphabetical order: */
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,SALARY FROM EMPLOYEES 
ORDER BY FIRST_NAME ASC

/*C. to sort the employees by the first name in ascending order and the last name in descending order:*/
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,SALARY FROM EMPLOYEES 
ORDER BY FIRST_NAME ASC, LAST_NAME DESC

/*D. to sort employees by salary from high to low:*/
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,SALARY FROM EMPLOYEES 
ORDER BY SALARY DESC

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE,SALARY FROM EMPLOYEES
ORDER BY SALARY DESC

/*E. to sort the employees by values in the hire_date column from:*/
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,SALARY FROM EMPLOYEES 
ORDER BY HIRE_DATE ASC

/*F. sort the employees by the hire dates in descending order:*/
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,SALARY FROM EMPLOYEES 
ORDER BY HIRE_DATE DESC



--TASK 3:

SELECT * FROM EMPLOYEES
/*A. selects the salary data from the salary column of the employees table and sorts 
them from high to low:*/
SELECT SALARY FROM EMPLOYEES 
ORDER BY SALARY DESC

/*B. select unique values from the salary column of the employees table:*/
SELECT DISTINCT SALARY FROM EMPLOYEES

/*C. selects the job id and salary from the employees table:*/
SELECT JOB_ID,SALARY FROM EMPLOYEES
ORDER BY SALARY DESC

/*D: to remove the duplicate values in job id and salary:*/
SELECT DISTINCT JOB_ID, SALARY FROM EMPLOYEES
ORDER BY SALARY DESC 

/*E. returns the distinct phone numbers of employees:*/
SELECT DISTINCT PHONE_NUMBER FROM EMPLOYEES


--TASK 4:
/*A. returns all rows in the employees table sorted by the first_name column*/
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC

/*B. to return the first 5 rows in the result set returned by the SELECT clause:*/
SELECT TOP 5 * FROM EMPLOYEES

/*C. to return five rows starting from the 4th row:*/
--The ORDER BY clause is mandatory when using OFFSET and FETCH in SQL Server.
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC, SALARY ASC
OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY

SELECT SALARY FROM EMPLOYEES
ORDER BY SALARY DESC


/*D. gets the top five employees with the highest salaries.*/
SELECT TOP 5 MAX(SALARY) AS MAX_SAL FROM EMPLOYEES
GROUP BY SALARY
ORDER BY SALARY DESC

/*E. to get employees who have the 2nd highest salary in the company*/
SELECT SALARY FROM EMPLOYEES
ORDER BY SALARY DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY

--TASK 5

/*query finds employees who have salaries greater than 14,000 and sorts the results sets based on
the salary in descending order.*/
SELECT * FROM EMPLOYEES
WHERE SALARY>14000 
ORDER BY SALARY DESC

/*B. query finds all employees who work in the department id 5.*/
SELECT * FROM EMPLOYEES 
WHERE DEPARTMENT_ID=5

/*C. query finds the employee whose last name is Chen*/
SELECT * FROM EMPLOYEES
WHERE LAST_NAME='CHEN'

/*D. To get all employees who joined the company after January 1st, 1999*/
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE>'1999-01-01'

/*E. to find the employees who joined the company in 1999,*/
SELECT * FROM EMPLOYEES
WHERE YEAR(HIRE_DATE)='1999'

/*F. statement finds the employee whose last name is Himuro*/
SELECT * FROM EMPLOYEES
WHERE LAST_NAME='Himuro'

/*G. the query searches for the string Himuro in the last_name column of the employees table.*/
SELECT * FROM EMPLOYEES
WHERE LAST_NAME LIKE '%Himuro%'



/*H. to find all employees who do not have phone numbers:*/
SELECT * FROM EMPLOYEES
WHERE PHONE_NUMBER IS NULL

/*I. returns all employees whose department id is not 8.*/
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID != 8

/*J. finds all employees whose department id is not eight and ten.*/
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID != 8 AND DEPARTMENT_ID!=10

/*K. to find the employees whose salary is greater than 10,000,*/
SELECT * FROM EMPLOYEES
WHERE SALARY>10000 


/*L. finds employees in department 8 and have the salary greater than 10,000:*/
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID =8 AND SALARY>10000

/*M. the statement below returns all employees whose salaries are less than 10,000:*/
SELECT * FROM EMPLOYEES
WHERE SALARY<10000

/*N. finds employees whose salaries are greater than or equal 9,000:*/
SELECT * FROM EMPLOYEES
WHERE SALARY >= 9000

/*O. finds employees whose salaries are less than or equal to 9,000:*/
SELECT * FROM EMPLOYEES
WHERE SALARY <= 9000



--TASK 6

--COURSES TABLE:
CREATE TABLE COURSES(
COURSE_ID INT PRIMARY KEY,
COURSE_NAME VARCHAR(50)
)
SELECT * FROM COURSES

/*A. adds a new column named credit_hours to the courses table.*/
ALTER TABLE COURSES 
ADD CREDIT_HOURS VARCHAR(50)

/*B. adds the fee and max_limit columns to the courses table and places these columns after
the course_name column:  RESOLVED WITH THE HELP OF VIEW*/

ALTER TABLE COURSES
ADD FEE DECIMAL (10,2),MAX_LIMIT INT;

ALTER TABLE COURSES
ADD MAX_LIMIT INT 

ALTER TABLE COURSES
ADD CREDIT_HOURS VARCHAR(50)

SELECT * FROM COURSES

CREATE VIEW COURSE_VIEWS AS 
SELECT COURSE_ID,FEE,MAX_LIMIT,COURSE_NAME,CREDIT_HOURS
FROM COURSES

DROP VIEW COURSE_VIEWS

SELECT * FROM COURSE_VIEWS

/*C. changes the attribute of the fee column to NOT NULL.*/
ALTER TABLE COURSES
ALTER COLUMN FEE DECIMAL(10,2) NOT NULL

--TO CHECK THE ALL THE COLUMNS AND DATA-TYPE OF A TABLE
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='COURSES'

/*D. to remove the fee column of the courses table*/
ALTER TABLE COURSES 
DROP COLUMN FEE 

/*E. removes the max_limit and credit_hours of the courses table.*/
ALTER TABLE COURSES
DROP COLUMN MAX_LIMIT, CREDIT_HOURS



--TASK 7
CREATE TABLE PROJECTS(
PROJECT_ID INT PRIMARY KEY,
PROJECT_NAME VARCHAR(255),
START_DATES DATE NOT NULL,
END_DATES DATE NOT NULL
)
SELECT * FROM PROJECTS

/*A. to add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the
relationship between the projects and project_milestones tables.*/

CREATE TABLE PROJECT_MILESTONE(
MILESTONE_ID INT PRIMARY KEY,
PROJECT_ID INT,
MILESTONE_NAME VARCHAR(100)
FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS(PROJECT_ID) ON DELETE CASCADE 
ON UPDATE CASCADE
);


SELECT * FROM PROJECT_MILESTONE
/*SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='COURSES'
*/

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='PROJECT_MILESTONE'

DROP TABLE PROJECT_MILESTONE

CREATE TABLE PROJECT_MILESTONE1(
MILESTONE_ID INT PRIMARY KEY,
PROJECT_ID INT,
MILESTONE_NAME VARCHAR(100)
)

SELECT * FROM PROJECT_MILESTONE1
/*B. Suppose the project_milestones already exists without any predefined foreign key and you want
to define a FOREIGN KEY constraint for the project_id column so write a Query to add a
FOREIGN KEY constraint to existing table*/

ALTER TABLE PROJECT_MILESTONE1
ADD CONSTRAINT FK_PROJECT_ID FOREIGN KEY (PROJECT_ID)
REFERENCES PROJECTS (PROJECT_ID)

SELECT * FROM PROJECTS;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='PROJECTS'




-- TASK 8

/*1)WRITE A QUERY FOR LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-

Part 1:-*/

/*A. finds all employees whose salaries are greater than 5,000 and less than 7,000:*/
SELECT * FROM EMPLOYEES
WHERE SALARY>5000 AND SALARY<7000


/*B. finds employees whose salary is either 7,000 or 8,000:*/
SELECT * FROM EMPLOYEES
WHERE SALARY=7000 OR SALARY=8000

/*C. finds all employees who do not have a phone number:*/
SELECT * FROM EMPLOYEES
WHERE PHONE_NUMBER IS NULL

/*D. finds all employees whose salaries are between 9,000 and 12,000.*/
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 12000

/*E. finds all employees who work in the department id 8 or 9.*/
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID=8 OR DEPARTMENT_ID=9

/*F. finds all employees whose first name starts with the string jo*/
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'JO%'

/*G. finds all employees with the first names whose the second character is h*/

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE'_H%'

/*H. finds all employees whose salaries are greater than all salaries of employees in the department 8:*/

SELECT * FROM EMPLOYEES
WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID=8)

SELECT * FROM EMPLOYEES
WHERE SALARY > (SELECT MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID=8)




--Part 2:-

/*A. finds all employees whose salaries are greater than the average salary of every department:*/

--The ALL keyword ensures that the employee's salary must be greater than every department's average salary.

SELECT * FROM EMPLOYEES
WHERE SALARY> ALL(SELECT AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID)

/*B. finds all employees who have dependents:*/
SELECT * FROM EMPLOYEES
SELECT * FROM [dbo].[DEPENDENTS]

SELECT E.FIRST_NAME,E.LAST_NAME,E.EMAIL,D.DEPENDENT_ID, D.EMPLOYEE_ID,D.FISRT_NAME,D.RELATIONSHIP
FROM EMPLOYEES E
LEFT JOIN DEPENDENTS D ON D.EMPLOYEE_ID=E.EMPLOYEE_ID

/*C. to find all employees whose salaries are between 2,500 and 2,900:*/
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 2500 AND 2900

/*D. to find all employees whose salaries are not in the range of 2,500 and 2,900:*/
SELECT * FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 2500 AND 2900

/*E. to find all employees who joined the company between January 1, 1999, and December 31, 2000:*/
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '1999-01-01' AND '2000-12-31'

/*F. to find employees who have not joined the company from January 1, 1989 to December 31, 1999:*/
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE NOT BETWEEN '1989-01-01' AND '1999-12-31'

/*G. to find employees who joined the company between 1990 and 1993:*/
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '1990' AND '1993'



--Part 3:-

/*A. to find all employees whose first names start with Da*/
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'DA%'

/*B. to find all employees whose first names end with er*/
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%ER'

/*C. to find employees whose last names contain the word an:*/
SELECT * FROM EMPLOYEES
WHERE LAST_NAME LIKE '%AN%'

/*D. retrieves employees whose first names start with Jo and are followed by at most 2 characters:*/
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'JO__'

/*E. to find employees whose first names start with any number of characters and are followed by at
most one character:*/
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%_'

/*F. to find all employees whose first names start with the letter S but not start with Sh:*/
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%' AND FIRST_NAME NOT LIKE 'SH%'

--PART 4 

/*A. retrieves all employees who work in the department id 5.*/
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID=5

/*B. To get the employees who work in the department id 5 and with a salary not greater than 5000.*/
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID=5 AND SALARY!>5000

/*C. statement gets all the employees who are not working in the departments 1, 2, or 3.*/

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID!=1 AND DEPARTMENT_ID!=2 AND DEPARTMENT_ID!=3

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (1,2,3)

/*D. retrieves all the employees whose first names do not start with the letter D.*/
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE 'D%'

/*E. to get employees whose salaries are not between 5,000 and 1,000.*/
SELECT * FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 1000 AND 5000


--PART 5

/*SELECT E.FIRST_NAME,E.LAST_NAME,E.EMAIL,D.DEPENDENT_ID, D.EMPLOYEE_ID,D.FISRT_NAME,D.RELATIONSHIP
FROM EMPLOYEES E
LEFT JOIN DEPENDENTS D ON D.EMPLOYEE_ID=E.EMPLOYEE_ID*/
SELECT * FROM EMPLOYEES
SELECT * FROM [dbo].[DEPENDENTS]

/*A. Write a query to get the employees who do not have any dependents by above image*/
SELECT E.FIRST_NAME,E.LAST_NAME,E.EMAIL,D.DEPENDENT_ID, D.EMPLOYEE_ID,D.FISRT_NAME,D.RELATIONSHIP
FROM DEPENDENTS D 
RIGHT JOIN EMPLOYEES E ON D.EMPLOYEE_ID=E.EMPLOYEE_ID
WHERE D.EMPLOYEE_ID IS NULL


/*B. To find all employees who do not have the phone numbers*/
SELECT * FROM EMPLOYEES
WHERE PHONE_NUMBER IS NULL

/*C. To find all employees who have phone numbers*/
SELECT * FROM EMPLOYEES
WHERE PHONE_NUMBER IS NOT NULL




--TASK 9

/*A. To get the information of the department id 1,2, and 3*/
SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME,E.EMAIL,DE.DEPARTMENT_NAME,DE.LOCATION_ID, DE.DEPARTMENT_ID FROM EMPLOYEES E
JOIN DEPARTMENTS DE ON E.DEPARTMENT_ID=DE.DEPARTMENT_ID
WHERE DE.DEPARTMENT_ID IN (1,2,3)
ORDER BY DE.DEPARTMENT_ID


/*B. To get the information of employees who work in the department id 1, 2 and 3*/
SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME,E.EMAIL,DE.DEPARTMENT_NAME,DE.LOCATION_ID, DE.DEPARTMENT_ID FROM EMPLOYEES E
JOIN DEPARTMENTS DE ON E.DEPARTMENT_ID=DE.DEPARTMENT_ID
WHERE DE.DEPARTMENT_ID IN (1,2,3)
ORDER BY DE.DEPARTMENT_ID


SELECT * FROM EMPLOYEES
SELECT * FROM DEPARTMENTS
SELECT * FROM JOBS

/*C. Write a Query to get the first name, last name, job title, and department name of employees who work
in department id 1, 2, and 3.*/

SELECT E.FIRST_NAME, E.LAST_NAME, DE.DEPARTMENT_NAME, J.JOB_TITLE FROM EMPLOYEES E
JOIN DEPARTMENTS DE ON E.DEPARTMENT_ID=DE.DEPARTMENT_ID
JOIN JOBS J ON J.JOB_ID=E.JOB_ID




/*SQL LEFT JOIN clause*/

/*first table would be the left always would be the left table in joins.
From which table we want the data will define the left or right table.
if i wanted to get all the data from left table then go for left join and vice-versa*/

SELECT * FROM COUNTRIES
SELECT * FROM LOCATION

/*A. To query the country names of US, UK, and China*/
SELECT L.LOCATION_ID, L.STREET_ADDRESS,L.POSTAL_CODE,L.CITY,C.COUNTRY_NAME FROM LOCATION L
LEFT JOIN COUNTRIES C ON L.COUNTRY_ID=C.COUNTRY_ID
WHERE C.COUNTRY_ID IN ('US','UK','CN')
ORDER BY C.COUNTRY_ID

/*B. query retrieves the locations located in the US, UK and China:*/
SELECT L.LOCATION_ID,L.CITY,L.STATE_PROVINCE,C.COUNTRY_NAME FROM LOCATION L 
LEFT JOIN COUNTRIES C ON L.COUNTRY_ID=C.COUNTRY_ID
WHERE C.COUNTRY_ID IN ('CN','UK','US')


/*C. To join the countries table with the locations table*/
SELECT C.*, L.* FROM COUNTRIES C
LEFT JOIN LOCATION L ON C.COUNTRY_ID=L.COUNTRY_ID


/*D. to find the country that does not have any locations in the locations table*/
SELECT * FROM COUNTRIES
SELECT * FROM LOCATION

SELECT C.COUNTRY_ID, C.COUNTRY_NAME, L.STREET_ADDRESS,L.STATE_PROVINCE,L.CITY FROM  COUNTRIES C
LEFT JOIN LOCATION L ON L.COUNTRY_ID=C.COUNTRY_ID
WHERE L.STREET_ADDRESS IS NULL

SELECT * FROM COUNTRIES
SELECT * FROM LOCATION
SELECT * FROM REGIONS

/*Write a query to join 3 tables: regions, countries, and locations*/
SELECT L.* , C.*,R.* FROM COUNTRIES C
JOIN LOCATION L ON C.COUNTRY_ID=L.COUNTRY_ID
JOIN REGIONS R ON C.REGION_ID=R.REGION_ID





--SELF JOIN
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC


/*The manager_id column specifies the manager of an employee. Write a query statement to joins the
employees table to itself to query the information of who reports to whom.*/
CREATE VIEW MANAGER_VIEW AS
SELECT E1.EMPLOYEE_ID,E1.FIRST_NAME,E1.LAST_NAME,E1.EMAIL,E2.MANAGER_ID,E2.FIRST_NAME AS MANAGER_FIRSTNAME
FROM EMPLOYEES E1
JOIN EMPLOYEES E2 ON E2.EMPLOYEE_ID=E1.MANAGER_ID
--ORDER BY E2.FIRST_NAME

drop view MANAGER_VIEW

SELECT * FROM MANAGER_VIEW
ORDER BY MANAGER_FIRSTNAME

/*Now write a Query To include the president in the result set:-*/
SELECT * FROM MANAGER_VIEW
WHERE MANAGER_ID IS NULL



--FULL OUTER JOIN

CREATE TABLE FRUITS (
FRUIT_ID INT PRIMARY KEY,
FRUIT_NAME VARCHAR (255) NOT NULL,
BASKET_ID INTEGER
);
CREATE TABLE BASKETS (
BASKET_ID INT PRIMARY KEY,
BASKET_NAME VARCHAR (255) NOT NULL
);

INSERT INTO BASKETS(BASKET_ID, BASKET_NAME)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');
INSERT INTO FRUITS(FRUIT_ID,FRUIT_NAME,BASKET_ID)
VALUES
(1, 'Apple', 1),
(2, 'Orange', 1),
(3, 'Banana', 2),
(4, 'Strawberry', NULL);

SELECT * FROM FRUITS
SELECT * FROM BASKETS

/*A. Write a query to returns each fruit that is in a basket and each basket that has a fruit, but also
returns each fruit that is not in any basket and each basket that does not have any fruit*/

SELECT F.*,B.* FROM FRUITS F
FULL OUTER JOIN BASKETS B
ON B.BASKET_ID=F.BASKET_ID

/*B. Write a query to find the empty basket, which does not store any fruit*/
SELECT F.*,B.* FROM FRUITS F
FULL OUTER JOIN BASKETS B
ON B.BASKET_ID=F.BASKET_ID
WHERE F.FRUIT_NAME IS NULL

/*C. Write a query which fruit is not in any basket*/
SELECT F.*,B.* FROM FRUITS F
FULL OUTER JOIN BASKETS B
ON B.BASKET_ID=F.FRUIT_ID
WHERE B.BASKET_NAME IS NULL





--SQL CROSS JOIN clause

CREATE TABLE SALES_ORGANIZATION (
SALES_ORG_ID INT PRIMARY KEY,
SALES_ORG VARCHAR (255)
);

CREATE TABLE SALES_CHANNEL (
CHANNEL_ID INT PRIMARY KEY,
CHANNEL VARCHAR (255)
);

INSERT INTO SALES_ORGANIZATION(SALES_ORG_ID, SALES_ORG)
VALUES
(1, 'Domestic'),
(2, 'Export');

INSERT INTO SALES_CHANNEL(CHANNEL_ID, CHANNEL)
VALUES
(1, 'Wholesale'),
(2, 'Retail'),
(3, 'eCommerce'),
(4, 'TV Shopping');

SELECT * FROM SALES_CHANNEL
SELECT * FROM SALES_ORGANIZATION

/*Write a Query To find the all possible sales channels that a sales organization*/

SELECT SC.CHANNEL,SO.SALES_ORG FROM SALES_CHANNEL SC
CROSS JOIN SALES_ORGANIZATION SO






--TASK 10 : SQL GROUP BY clause


/*A. to group the values in department_id column of the employees table:*/
SELECT DEPARTMENT_ID, COUNT(*) AS TOTAL_DEPARTMENT_COUNT FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

/*B. to count the number of employees by department:*/
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS TOTAL_EMPLOYEE_COUNT FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

/*C. returns the number of employees by department*/
SELECT DEPARTMENT_ID, COUNT(*) AS EMP_NUM FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

/*D. to sort the departments by headcount:*/
SELECT DEPARTMENT_ID, COUNT(*) AS EMP_COUNT FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY EMP_COUNT ASC

/*E. to find departments with headcounts are greater than 5:*/


SELECT DEPARTMENT_ID, COUNT(*) AS EMP_COUNT FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>5

/*F. returns the minimum, maximum and average salary of employees in each department.*/
SELECT MIN(SALARY) AS MIN_SAL, MAX(SALARY) AS MAX_SAALRY,
AVG(SALARY) AS AVG_SAL, DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID ASC

/*G. To get the total salary per department,*/
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

/*groups rows with the same values both department_id and job_id columns in the same group then
return the rows for each of these groups*/
SELECT * FROM DEPARTMENTS 
SELECT * FROM EMPLOYEES

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) AS EMP_COUNT FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID





--SQL HAVING clause
SELECT * FROM EMPLOYEES
SELECT * FROM DEPENDENTS

/*A. To get the managers and their direct reports, and to group employees by the managers
and to count the direct reports.*/
SELECT * FROM EMPLOYEES

SELECT E1.MANAGER_ID, E2.FIRST_NAME AS MANAGER_NAME,  COUNT(E1.MANAGER_ID) AS DIRECT_REPORTERS
FROM 
EMPLOYEES E1 
JOIN EMPLOYEES E2 ON E1.MANAGER_ID=E2.EMPLOYEE_ID
GROUP BY E1.MANAGER_ID, E2.FIRST_NAME
/*HAVING COUNT(E1.MANAGER_ID)>=5*/
ORDER BY E2.FIRST_NAME

/*B. To find the managers who have at least five direct reports*/
SELECT E1.MANAGER_ID, E2.FIRST_NAME AS MANAGER_NAME,  COUNT(E1.MANAGER_ID) AS DIRECT_REPORTERS
FROM 
EMPLOYEES E1 
JOIN EMPLOYEES E2 ON E1.MANAGER_ID=E2.EMPLOYEE_ID
GROUP BY E1.MANAGER_ID, E2.FIRST_NAME
HAVING COUNT(E1.MANAGER_ID)>=5
ORDER BY E2.FIRST_NAME

/*calculates the sum of salary that the company pays for each department and selects only
the departments with the sum of salary between 20000 and 30000.*/
SELECT DEPARTMENT_ID,SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) BETWEEN 20000 AND 30000


/*D. To find the department that has employees with the lowest salary greater than 10000*/
SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY)>10000

/*To find the departments that have the average salaries of employees between 5000 and
7000*/

SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) BETWEEN 5000 AND 7000








--TASK 11

--1)SQL UNION operator

/*Write a Query to combine the first name and last name of employees and dependents*/

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME
FROM EMPLOYEES
UNION
SELECT CONCAT(FISRT_NAME, ' ', LAST_NAME) AS FULL_NAME
FROM DEPENDENTS;


--3)SQL EXISTS operator
/*A. finds all employees who have at least one dependent.*/
SELECT * FROM EMPLOYEES
SELECT * FROM DEPENDENTS

SELECT DISTINCT E.FIRST_NAME, E.LAST_NAME FROM EMPLOYEES E
JOIN DEPENDENTS D
ON D.EMPLOYEE_ID=E.EMPLOYEE_ID


/*B. finds employees who do not have any dependents:*/

SELECT DISTINCT E.FIRST_NAME, E.LAST_NAME FROM EMPLOYEES E
WHERE NOT EXISTS 
(SELECT 1 FROM DEPENDENTS D WHERE D.EMPLOYEE_ID=E.EMPLOYEE_ID);



--4) SQL CASE expression
/*A. Suppose the current year is 2000. How to use the simple CASE expression to get the
work anniversaries of employees by*/

--solution 1
SELECT EMPLOYEE_ID, FIRST_NAME,HIRE_DATE,
DATEDIFF(YEAR,HIRE_DATE,'2000-01-01') 
AS WORK_ANNIVERSARIES FROM EMPLOYEES

--solution 2
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
CASE
WHEN YEAR('2000-01-01')-YEAR(HIRE_DATE)=1 THEN '1-YEAR WORK ANNIVERSARY'
WHEN YEAR('2000-01-01')-YEAR(HIRE_DATE)<=5 THEN '(2-5)-YEAR WORK ANNIVERSARY'
WHEN YEAR('2000-01-01')-YEAR(HIRE_DATE)<=10 THEN '(5-10)-YEAR WORK ANNIVERSARY'
WHEN YEAR('2000-01-01')-YEAR(HIRE_DATE)<=15 THEN '(10-15)-YEAR WORK ANNIVERSARY'
WHEN YEAR('2000-01-01')-YEAR(HIRE_DATE)<=20 THEN '(15-20)-YEAR WORK ANNIVERSARY'
WHEN YEAR('2000-01-01')-YEAR(HIRE_DATE)>20 THEN '(>20)-YEAR WORK ANNIVERSARY'
ELSE 'NO-ANNIVERSARY'
END AS 'WORK ANNIVERSARY'
FROM EMPLOYEES

/*B. Write a Query If the salary is less than 3000, the CASE expression returns “Low”. If the salary
is between 3000 and 5000, it returns “average”. When the salary is greater than 5000, the CASE
expression returns “High”.*/
SELECT * FROM EMPLOYEES

SELECT EMPLOYEE_ID, FIRST_NAME, 
CASE
WHEN SALARY<3000 THEN 'LOW'
WHEN SALARY BETWEEN 3000 AND 5000 THEN 'AVERAGE'
ELSE 'HIGH SALARY'
END AS 'SALARY_RANGE'
FROM EMPLOYEES
ORDER BY SALARY_RANGE






--5) SQL UPDATE statement

/*Write a Query to update Sarah’s last name from Bell to Lopez*/


SELECT FIRST_NAME,LAST_NAME,EMPLOYEE_ID,
CASE
WHEN LAST_NAME='Bell' THEN  'LOPEZ'
END AS 'NEW_LASTNAME'
FROM EMPLOYEES
WHERE FIRST_NAME='SARAH'

UPDATE EMPLOYEES
SET LAST_NAME='LOPEZ' 
WHERE FIRST_NAME='SARAH'
AND LAST_NAME='BELL'

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE FIRST_NAME='SARAH'






/*FINAL TASK (Advanced Queries)*/



--1. First, find all departments located at the location whose id is 1700:
SELECT * FROM DEPARTMENTS
WHERE LOCATION_ID=1700

/* 2. Second, find all employees that belong to the location 1700 by using
the department id list of the
previous query:*/
SELECT * FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (1,3,9,10,11) 
ORDER BY FIRST_NAME

/*A. Combine Above two queries using subquery inorder find all departments located at the
location whose id is 1700 and find all employees that belong to the location 1700 by
using the department id list of the previous query*/

--SOLUTION
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE LOCATION_ID=1700)

/*B. to find all employees who do not locate at the location 1700:*/
SELECT * FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE LOCATION_ID !=1700)

/*C. finds the employees who have the highest salary:*/

SELECT * FROM EMPLOYEES 
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES)

/*D. finds all employees who salaries are greater than 
the average salary of all employees:*/

SELECT * FROM EMPLOYEES
WHERE SALARY > (SELECT AVG (SALARY) FROM EMPLOYEES)

/*E. finds all departments which have at least one employee with the salary is greater than
10,000:*/


SELECT DISTINCT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY>10000)

/*F. finds all departments that do not have any employee
with the salary greater than 10,000:*/
SELECT DISTINCT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY!>10000)

/*G. to find the lowest salary by department:*/

SELECT DEPARTMENT_ID,SALARY AS LOWEST_SALARY FROM EMPLOYEES E
WHERE SALARY= 
(SELECT MIN(SALARY) FROM EMPLOYEES 
WHERE DEPARTMENT_ID=E.DEPARTMENT_ID)


/*finds all employees whose salaries are greater than the lowest salary of every department:*/
SELECT DEPARTMENT_ID,FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY> (SELECT MIN(SALARY) FROM EMPLOYEES)

/*I. finds all employees whose salaries are greater than or equal to the highest salary of every
department*/

SELECT DEPARTMENT_ID,FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES E
WHERE SALARY>= (SELECT MAX(SALARY) FROM EMPLOYEES
WHERE DEPARTMENT_ID = e.DEPARTMENT_ID)


/*J. returns the average salary of every department*/
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME,
(SELECT AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID= D.DEPARTMENT_ID) AS AVG_SALARY
FROM DEPARTMENTS D

/*K. to calculate the average of average salary of departments :*/

SELECT AVG(AVERAGES_SALARY) AS AVGR_SALARY FROM 
(SELECT EMP.DEPARTMENT_ID, AVG(EMP.SALARY) AS AVERAGES_SALARY FROM EMPLOYEES EMP 
GROUP BY EMP.DEPARTMENT_ID) AS DEPT_AVG

SELECT * FROM EMPLOYEES
SELECT * FROM DEPARTMENTS

/*finds the salaries of all employees, their average salary,and the difference between the
salary of each employee and the average salary.*/

SELECT
EMPLOYEE_ID,
FIRST_NAME, DEPARTMENT_ID,
SALARY,
(SELECT AVG(SALARY) FROM EMPLOYEES) AS AVG_SALARY,
SALARY- (SELECT  AVG(SALARY) FROM EMPLOYEES) AS SALARY_DIFFERENCE
FROM EMPLOYEES




 