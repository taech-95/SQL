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
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
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

