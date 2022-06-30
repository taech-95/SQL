select * from customer;
select customer_id, 
case 
	when customer_id between 1 and 100 then 'premium'
	when customer_id between 101 and 200 then 'plus'
	else 'usual'
end
from customer;
