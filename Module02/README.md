# Задание для модуля 2

## Загрузка данных в БД
Испольуя DBeaver я создал 3 таблицы orders, people, returns используя готовые скрипты из модуля 2.

Затем написал, запросы которые выводят:
1) Динамику общей суммы продаж и прибыли:
``` SQL 
select TO_CHAR(order_date, 'YYYY')    as year
	  ,TO_CHAR(order_date, 'MM')      as month
	  ,ROUND(SUM(sales)) || '$'	      as total_sales
	  ,ROUND(SUM(profit)) || '$' 	  as total_profit
from orders
group by year, month
order by year, month;
```
2) Динамику процента прибыли
``` SQL 
select TO_CHAR(order_date, 'YYYY')                  as year
	  ,TO_CHAR(order_date, 'MM')                    as month
	  ,ROUND(SUM(profit) / SUM(sales) * 100) || '%' as profit_ratio
from orders
group by year, month
order by year, month;
```

3) Процент прибыли с заказа
``` SQL 
select order_id,
	   ROUND(SUM(profit) / SUM(sales) * 100) || '%' as profit_ratio
from orders
group by order_id
order by order_id;
```

4) Суммы продаж каждого покупателя
``` SQL 
select customer_id, customer_name,
	   ROUND(SUM(sales)) || '$' as sales
from orders
group by customer_id, customer_name
order by customer_id;
```

5) Динамика средней скидки
``` SQL 
select TO_CHAR(order_date, 'YYYY')                  as year
	  ,TO_CHAR(order_date, 'MM')                    as month
	  ,ROUND(AVG(discount) * 100) || '%'            as avg_discount
from orders
group by year, month
order by year, month;
```

6) Динамика продаж по сегментам
``` SQL 
select TO_CHAR(order_date, 'YYYY')                  as year
	  ,TO_CHAR(order_date, 'MM')                    as month
	  ,                                                segment
	  ,ROUND(SUM(sales)) || '$'                     as sales
from orders
group by year, month, segment
order by year, month, segment;
```

7) Динамика продаж по категориям
``` SQL 
select TO_CHAR(order_date, 'YYYY')                  as year
	  ,TO_CHAR(order_date, 'MM')                    as month
	  ,                                                category 
	  ,ROUND(SUM(sales)) || '$'                     as sales
from orders
group by year, month, category
order by year, month, category;
```
## Модель данных

