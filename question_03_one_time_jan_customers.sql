--3-- Count all users who were acquired in jan 2025 and only placed one order in jan and did not 
--      placed any other  order

select Customer_code, count(Customer_code) as no_orders
from orders
where datepart(month, Placed_at) = 1 and datepart(year, Placed_at) = 2025
and Customer_code not in 
(
 select Customer_code
from orders
where not ( datepart(month, Placed_at) = 1 and datepart(year, Placed_at) = 2025)
group by Customer_code
)
group by Customer_code
having count(Customer_code) = 1;

output: 
### Sample Output

| Customer_Code     | No_Orders |
|-------------------|-----------|
| BCD7890123456ABC  | 1         |
| DEF5678901234MNO  | 1         |
| EFG1234567890DEF  | 1         |
