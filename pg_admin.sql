select * from cd.facilities;
select name, membercost from cd.facilities;
select * from cd.facilities where membercost > 0;
select * from cd.facilities where membercost< monthlymaintenance/50 and membercost > 0;
select * from cd.facilities where name  like '%Tennis%';
select * from cd.facilities where facid in(1,5);
select * from cd.members where joindate > '2012.09.01';
select distinct surname from cd.members order by surname limit 10;
select joindate from cd.members order by joindate desc limit 1; 
select count(*) from cd.facilities where guestcost>10;
select facid, SUM(slots) as Total_count  from cd.bookings where EXTRACT(MONTH from starttime) = 9 group by facid order by Total_count;
select facid, total_count = (select count(slots) from )  from cd.bookings  group by facid order by facid;

select facid, count(slots) from cd.bookings  group by facid having count(slots)>500

select bookings.starttime, facilities.name from cd.bookings join cd.facilities on bookings.facid = facilities.facid;

select bookings.starttime, facilities.name from cd.bookings join cd.facilities 
on bookings.facid = facilities.facid 
where starttime >= '2012-09-21' 
and starttime <'2012-09-22' and facilities.name ilike '%tennis court%' order by starttime;

select starttime from cd.members 
join cd.bookings on bookings.memid = members.memid 
where firstname = 'David' and surname = 'Farrell';