create database library;
use library;

CREATE TABLE BRANCH (
branch_no INT PRIMARY KEY, 
manager_id INT, 
branch_address VARCHAR(30), 
contact_no INT);

INSERT INTO BRANCH (BRANCH_NO, MANAGER_ID, BRANCH_ADDRESS, CONTACT_NO) VALUES
(1,001,"calicut",789654123 ),
(2,002,"trissur", 321456897),
(3,003,"palakkad",213654879),
(4,004,"mannarkkad",123654789),
(5,006,"malapuram",123459867);

CREATE TABLE employee (
emp_id INT PRIMARY KEY, 
emp_name varchar(30), 
position VARCHAR(30), 
salary INT);

INSERT INTO employee (emp_id, emp_name,position,salary) VALUES
(1,'rohit',"hr",789654123 ),
(2,'sachin',"it", 321456897),
(3,'pollard',"sales",213654879),
(4,'bumrah',"manager",123654789),
(5,'surya',"hr",123459867);

CREATE TABLE customer (
customer_id INT PRIMARY KEY, 
customer_name varchar(30), 
customer_address VARCHAR(30), 
reg_date DATE);

INSERT INTO customer(customer_id, customer_name,customer_address,reg_date) VALUES
(1,'dhoni',"palakkad",'2022-01-03'),
(2,'bravo',"malapuram",'2022-02-12'),
(3,'raina',"perithalmanna",'2022-03-06'),
(4,'rahane',"kannur",'2023-01-05'),
(5,'chahar',"trissur",'2023-01-01');

CREATE TABLE books (
isbn INT PRIMARY KEY, 
book_title varchar(30), 
category VARCHAR(30), 
rental_price INT,
status VARCHAR(10),
author varchar(30),
publisher varchar(20));

INSERT INTO books(isbn, book_title,category,rental_price,status,author,publisher) VALUES
(01,'gatsby','tragedy ',1000,'yes','scott','charles'),
(02,'mockingbird','fiction ',500,'yes','harper','cott'),
(03,'beloved','fiction ',1000,'yes','tony',' alfred'),
(04,'frankenstein','sciencefiction ',1000,'yes','shelley','hughes'),
(05,'ulysses','modernist ',1000,'yes','james','sylvia');

CREATE TABLE issuestatus (
issue_id INT PRIMARY KEY, 
issued_cust INT, 
issued_book_name VARCHAR(30), 
issue_date DATE,
isbn_book INT,
FOREIGN KEY (issued_cust) REFERENCES customer(customer_id) ON DELETE CASCADE,
FOREIGN KEY (isbn_book) REFERENCES BOOKS(isbn) ON DELETE CASCADE);

insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
values
(1, 1, 'gatsby', '2023-05-10','1'),
(2, 2, 'mockingbird', '2023-06-15','2'),
(3, 3, 'beloved', '2023-07-20', '3'),
(4, 4, 'frankenstein', '2023-08-25','4'),
(5, 5, 'ulysses', '2023-04-30','5');

CREATE TABLE returnstatus (
return_id INT PRIMARY KEY, 
return_cust INT, 
return_book_name VARCHAR(30), 
return_date DATE,
isbn_book2 INT,
FOREIGN KEY (isbn_book2) REFERENCES books(isbn) ON DELETE CASCADE );

insert into returnstatus (return_Id, return_cust, return_book_name, return_date, Isbn_book2)
values
(1, 1, 'gatsby', '2023-06-10','1'),
(2, 2, 'mockingbird', '2023-07-15','2'),
(3, 3, 'beloved', '2023-08-20', '3'),
(4, 4, 'frankenstein', '2023-09-25','4'),
(5, 5, 'ulysses', '2023-05-30','5');

-- Q1. Retrieve the book title, category, and rental price of all available books.
select book_title , category ,rental_price from books where status = "yes";

-- Q2. List the employee names and their respective salaries in descending order of salary
select emp_name, salary from employee order by salary desc; 

-- Q3. Retrieve the book titles and the corresponding customers who have issued those books.
 select b.book_title,c.customer_name
from books b
join issuestatus I on b.isbn = I.Isbn_book
join customer c on I.issued_cust = C.customer_id;

 
-- Q4. Display the total count of books in each category.
select category, count(*) as total_count from books group by category;
 
-- Q5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.95000.
select emp_name, position from employee where salary >95000;

--  Q6. List the customer names who registered before 2022-01-01 and have not issued any books yet
select customer_name from customer where  reg_date > 2022-01-01 and
 customer_id not in (SELECT ISSUED_CUST FROM ISSUESTATUS);

-- Q7.  Display the branch numbers and the total count of employees in each branch.
 select branch_no, count(*) as total_count from branch group by branch_no;
 
 -- Q8.  Display the names of customers who have issued books in the month of June 2023. 
 select customer_name where reg_name = "june 2023";
 
 -- Q9.  Retrieve book_title from book table containing FICTION. 
select book_title from books where category = 'fiction';

-- Q10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select b.branch_no,count(*) as employee_count
from employee e 
join  branch b on e.emp_id = b.manager_id
group by b.branch_no
having employee_count > 5;













