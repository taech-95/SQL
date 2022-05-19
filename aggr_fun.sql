select title, author_fname, count(*) from books GROUP BY author_fname;
select count(released_year) from books;
select concat('In ', released_year, ' ',  count(*), ' books released') from books;
select min(pages) from books;
select MAX(released_year) from books;

select title, author_fname from books where pages = (select MAX(pages) from books);
select author_fname, author_lname, min(released_year) from books 
group by author_fname, author_lname;

select author_fname, author_lname, max(pages) from books group by author_fname, author_lname;
select sum(pages) from books;
select author_fname, author_lname, sum(pages) from books group by author_fname, author_lname;
select released_year, avg(stock_quantity) from books group by released_year;
select avg(stock_quantity) from books group by released_year;
select author_fname, author_lname, avg(stock_quantity) from books group by author_fname, released_year;


select count(title) from books;
select released_year, count(*) from books group by released_year;
select sum(stock_quantity) from books;
select author_fname, author_lname, avg(released_year) from books group by author_fname, author_lname;
select concat( author_fname, ' ', author_fname), pages from books 
where pages = (select max(pages) from books);
select released_year, count(title), avg(pages) from books group by released_year;