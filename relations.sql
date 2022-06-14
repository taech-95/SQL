CREATE TABLE customers ( 
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR(100)
);

CREATE TABLE orders (
id int AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
amount DECIMAL(8,2),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(id)
);

select first_name, last_name, order_date, amount from customers, orders where customers.id = orders.customer_id;
select first_name, last_name, order_date from customers join orders on customers.id = orders.customers_id;

select concat(first_name, ' ', last_name), order_date, sum(amount) from customers left join orders on orders.customer_id = customers.id group by last_name ;
select concat(first_name, ' ', last_name), 
order_date, 
ifnull(sum(amount),0) as total_spent 
from customers 
left join orders
    on orders.customer_id = customers.id 
group by last_name 
order by total_spent desc;

create table students (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100)
);

create table papers (
title Varchar(100),
grade int, 
student_id int,
FOREIGN KEY(student_id) REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select first_name, title, grade from students join papers on students.id = papers.student_id order by grade desc;
select first_name, title, grade from students left join papers on students.id = papers.student_id order by grade desc;
select first_name, ifnull(title, 'missing'), ifnull (grade,0) from students left join papers on students.id = papers.student_id order by grade desc;
select first_name, title, AVG(grade) from students join papers on students.id = papers.student_id group by first_name order by grade desc;
select first_name, ifnull (AVG(grade),0) from students left join papers on students.id = papers.student_id group by first_name order by grade desc;
select first_name, ifnull (AVG(grade),0), CASE
    when AVG(grade) >= 70 then 'PASSING'
    else 'Failing'
end as passing_status
from students left join papers on students.id = papers.student_id group by first_name order by grade desc;