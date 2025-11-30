--- Динамика общей суммы продаж и прибыли

select TO_CHAR(order_date, 'YYYY')    as year
	  ,TO_CHAR(order_date, 'MM')      as month
	  ,ROUND(SUM(sales)) || '$'	      as total_sales
	  ,ROUND(SUM(profit)) || '$' 	  as total_profit
from orders
group by year, month
order by year, month;
---


--- Динамика процента прибыли

select TO_CHAR(order_date, 'YYYY')                  as year
	  ,TO_CHAR(order_date, 'MM')                    as month
	  ,ROUND(SUM(profit) / SUM(sales) * 100) || '%' as profit_ratio
from orders
group by year, month
order by year, month;
---


--- Процент прибыли с заказа

select order_id,
	   ROUND(SUM(profit) / SUM(sales) * 100) || '%' as profit_ratio
from orders
group by order_id
order by order_id;
---


--- Суммы продаж каждого покупателя

select customer_id, customer_name,
	   ROUND(SUM(sales)) || '$' as sales
from orders
group by customer_id, customer_name
order by customer_id;
---


--- Динамика средней скидки

select TO_CHAR(order_date, 'YYYY')                  as year
	  ,TO_CHAR(order_date, 'MM')                    as month
	  ,ROUND(AVG(discount) * 100) || '%'            as avg_discount
from orders
group by year, month
order by year, month;
---


--- Динамика продаж по сегментам

select TO_CHAR(order_date, 'YYYY')                  as year
	  ,TO_CHAR(order_date, 'MM')                    as month
	  ,                                                segment
	  ,ROUND(SUM(sales)) || '$'                     as sales
from orders
group by year, month, segment
order by year, month, segment;
---


--- Динамика продаж по категориям

select TO_CHAR(order_date, 'YYYY')                  as year
	  ,TO_CHAR(order_date, 'MM')                    as month
	  ,                                                category 
	  ,ROUND(SUM(sales)) || '$'                     as sales
from orders
group by year, month, category
order by year, month, category;
---