
  /* DANNYS DINER */

/* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?

SELECT customer_id,
 	   SUM(mn.price) 
FROM dannys_diner.sales sl
INNER JOIN dannys_diner.menu mn
ON mn.product_id = sl.product_id
GROUP BY customer_id
ORDER BY customer_id;


-- 2. How many days has each customer visited the restaurant?

SELECT customer_id,
	   COUNT(DISTINCT order_date) AS No_Days_visited
FROM dannys_diner.sales sl
INNER JOIN dannys_diner.menu mn
ON mn.product_id = sl.product_id
GROUP BY 1
ORDER BY 1;

-- 3. What was the first item from the menu purchased by each customer?

SELECT *
FROM(SELECT customer_id,
		    order_date,
			product_name,
			RANK() OVER (PARTITION BY customer_id 
								ORDER BY order_date)RowNumber
FROM dannys_diner.sales sl
INNER JOIN dannys_diner.menu mn
ON mn.product_id = sl.product_id)Newtable
WHERE Newtable.RowNumber = 1


-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT Product_name,
	   count(product_name) As Times_purchased
FROM dannys_diner.sales sl
JOIN dannys_diner.menu  mn
ON mn.product_id = sl.product_id
GROUP BY Product_name
Limit 1;

-- 5. Which item was the most popular for each customer?

SELECT *
FROM (SELECT customer_id,
       product_name,
       count(product_name) As Most_popular_item
FROM dannys_diner.sales sl
JOIN dannys_diner.menu  mn
ON mn.product_id = sl.product_id 
GROUP BY customer_id,product_name) xxx
WHERE xxx.Most_popular_item > 2;

SOLUTION B

with cte AS
(
SELECT customer_id, COUNT(sl.product_id),
	RANK() OVER (PARTITION BY customer_id ORDER BY COUNT (sl.product_id) DESC)most_popular_item
				 FROM dannys_diner.sales sl
				 JOIN dannys_diner.menu  mn
				 ON mn.product_id = sl.product_id
				 GROUP BY sl.product_id, customer_id
)

select *
from cte
where most_popular_item = 1


-- 6. Which item was purchased first by the customer after they became a member?

SELECT *
FROM(SELECT *,FIRST_VALUE(product_name) OVER (PARTITION BY customer_id
								        ORDER BY order_date)firstvalue
FROM dannys_diner.sales sl
JOIN dannys_diner.menu  mn
ON mn.product_id = sl.product_id)sub
JOIN dannys_diner.members  mm
ON mm.customer_id = sub.customer_id
WHERE order_date > join_date

SOLUTION B


SELECT sub.customer_id,
	   order_date,
       product_name,
       rownumber
	   
FROM (SELECT *,ROW_NUMBER() OVER (PARTITION BY customer_id
								  ORDER BY order_date)Rownumber
FROM dannys_diner.sales sl
JOIN dannys_diner.menu  mn
ON mn.product_id = sl.product_id)sub

WHERE (customer_id) in (SELECT customer_id 
						FROM dannys_diner.members )
						and Rownumber = 4


-- 7. Which item was purchased just before the customer became a member?

SELECT * 
FROM (SELECT *,ROW_NUMBER ()OVER(PARTITION BY customer_id
							ORDER BY order_date)roll 
FROM dannys_diner.sales sl
JOIN dannys_diner.menu MN
ON mn.product_id = sl.product_id
 
WHERE (customer_id) in (SELECT customer_id FROM dannys_diner.members
						WHERE order_date < Join_date )
						ORDER BY  order_date DESC)NEW_TABLE
WHERE new_table.roll >= 2


-- 8. What is the total items and amount spent for each member before they became a member?

SELECT customer_id,
       COUNT(product_name),
	   SUM(mn.price)
	   
FROM dannys_diner.sales sl
JOIN dannys_diner.menu Mn
ON mn.product_id = sl.product_id
WHERE (customer_id) in (SELECT customer_id
						FROM dannys_diner.members
						WHERE order_date < Join_date )				
GROUP BY customer_id
ORDER BY customer_id;

-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT customer_id,
       SUM(CASE WHEN product_name ='sushi' 
		         THEN  price*20 
		          Else Price*10 END)total_amount
				  
FROM dannys_diner.sales sl
JOIN dannys_diner.menu Mn
ON mn.product_id = sl.product_id
GROUP BY customer_id;

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

SELECT sl.customer_id, 
	   SUM (CASE WHEN (order_date BETWEEN join_date 
					   AND join_date + interval '7' DAY) 
						THEN price*20 END)
FROM dannys_diner.sales sl
JOIN dannys_diner.menu mn
ON mn.product_id = sl.product_id
JOIN dannys_diner.members mm
ON  sl.customer_id = mm.customer_id
GROUP BY sl.customer_id

				 
					
