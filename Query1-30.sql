-- 1. total revenue by day 
SELECT order_date date, sum(total_bill)
FROM orders
GROUP BY order_date
ORDER BY order_date ASC;

-- 2. infomation of customers who by more than 3 Fantasy books
SELECT c.*
FROM customer c, orders o, order_detail od, genre g
WHERE c.customer_id = o.customer_id AND c.customer_id = o.customer_id 
AND o.order_id = od.order_id AND g.book_id = od.book_id
AND g.genre = 'Fantasy'
GROUP BY c.customer_id
HAVING COUNT(*) >= 3;

-- 3. best seller in third quarter of 2019
SELECT b.title, sum(od.quantity) * b.price as 'total revenue'
FROM order_detail od
JOIN book b ON od.book_id = b.book_id
JOIN orders o ON o.order_id = od.order_id
WHERE MONTH(o.order_date) IN (7, 8, 9)
GROUP BY b.book_id
HAVING `total revenue` >= ALL (
	SELECT sum(od1.quantity) * b1.price
	FROM order_detail od1
	JOIN book b1 ON od1.book_id = b1.book_id
	JOIN orders o1 ON o1.order_id = od1.order_id
	WHERE o1.order_date BETWEEN '2019/07/01' AND '2019/09/30'
	GROUP BY b1.book_id
);

-- 4. unsold book in the past 6 month
SELECT title
FROM book
WHERE title not in (
	SELECT DISTINCT b.title
	FROM order_detail od
	JOIN book b ON od.book_id = b.book_id
	JOIN orders o ON o.order_id = od.order_id
	WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 180 DAY)
);

-- 5. customer who spent more than 2000000 in 2020
SELECT c.*, sum(o.total_bill) AS 'total spending'
FROM customer c 
JOIN orders o ON o.customer_id = c.customer_id
WHERE YEAR(o.order_date) = 2020
GROUP BY c.customer_id
HAVING SUM(o.total_bill) > 2000000;

-- 6. all books written by J.K Rowling
SELECT b.title
FROM book b
JOIN author_detail ad ON ad.book_id = b.book_id
JOIN author a ON a.author_id = ad.author_id
WHERE a.name = 'J. K. Rowling';

--  7. books that have amount in stock smaller than 3 and have sold more than 10 copies in last 3 month
SELECT b.*, SUM(od.quantity) AS 'Copies sold in last 6 month'
FROM book b
JOIN order_detail od ON b.book_id = od.book_id
JOIN orders o ON o.order_id = od.order_id
WHERE b.inventory_qty < 3 AND o.order_date >= DATE_SUB(CURDATE(), INTERVAL 180 DAY)
GROUP BY b.book_id
HAVING SUM(od.quantity) > 10;

--  8. Retrieve the best seller in top 3 publisher having most books sold
SELECT b.title 'book title', p.name 'publisher name', SUM(od.quantity)
FROM book b, order_detail od, (
	SELECT publisher.*
    FROM publisher
    JOIN book ON publisher.publisher_id = book.publisher_id
    JOIN order_detail ON order_detail.book_id = book.book_id
    GROUP BY book.book_id, book.publisher_id
    ORDER BY SUM(order_detail.quantity) DESC
    LIMIT 3
) p
WHERE b.book_id = od.book_id AND b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.publisher_id
HAVING SUM(od.quantity) >= ALL (
	SELECT SUM(od1.quantity)
    FROM book b1, order_detail od1
    WHERE b1.book_id = od1.book_id AND b1.publisher_id = b.publisher_id
    GROUP BY b1.book_id
);


-- 9. quarter that have the largest revenue in 2019
SELECT QUARTER(o.order_date) AS 'quarter', SUM(od.quantity * b.price) AS 'revenue'
FROM orders o, order_detail od, book b
WHERE o.order_id = od.order_id AND b.book_id = od.book_id AND YEAR(o.order_date) = 2019
GROUP BY QUARTER(o.order_date) 
HAVING `revenue` >= ALL (
	SELECT SUM(od1.quantity * b1.price)
	FROM orders o1, order_detail od1, book b1
	WHERE o1.order_id = od1.order_id AND b1.book_id = od1.book_id AND YEAR(o1.order_date) = 2019
	GROUP BY QUARTER(o1.order_date) 
);

-- 10. Procedure retrieve book in a price range
DELIMITER $$
CREATE PROCEDURE book_in_price_range(IN low int, IN high int)
BEGIN
	SELECT book.*
    FROM book
    WHERE price >= low AND price <= HIGH;
END; $$
DELIMITER ;
CALL book_in_price_range(100000, 300000);

-- 11. Create view which retrieves the list of all books and the amount of each book sold, sorts by the amount of sold books in descending order 
CREATE VIEW book_sales_detail AS 
SELECT b.book_id 'book id', b.title 'book title', b.price, b.inventory_qty 'inventory qty', p.name 'publisher', COALESCE(sum(od.quantity), 0) 'sales' 
FROM book b LEFT JOIN order_detail od ON b.book_id = od.book_id, publisher p
WHERE p.publisher_id = b.publisher_id
GROUP BY b.book_id
ORDER BY sales;

-- 12. In the top 3 most favorite genres, retrieve top 4 books which were bought the most of each genre 
SELECT * FROM (
	SELECT genre_detail_sales.book_id, genre_detail_sales.title, genre_detail_sales.genre, genre_detail_sales.sales, 
	DENSE_RANK() OVER ( PARTITION BY genre_detail_sales.genre ORDER BY genre_detail_sales.sales DESC) AS 'rank'
	FROM (
		SELECT b.book_id, b.title, g.genre, sum(od.quantity) 'sales'
		FROM genre g, book b, order_detail od
		WHERE g.book_id = b.book_id AND od.book_id = b.book_id
		AND g.genre IN (
			SELECT genre_sales_rank.genre FROM (	
				SELECT genre_sales.*, DENSE_RANK() OVER (ORDER BY sales DESC) sales_rank
				FROM (
					SELECT g.genre, sum(od.quantity) 'sales'
					FROM genre g, book b, order_detail od
					WHERE g.book_id = b.book_id AND od.book_id = b.book_id
					GROUP BY g.genre
					ORDER BY sales DESC
				) genre_sales
			) genre_sales_rank
			WHERE sales_rank <= 3
		)
		GROUP BY b.book_id, g.genre
		ORDER BY g.genre, sales DESC
	) genre_detail_sales ) temp
WHERE temp.`rank` <= 4;

-- 13. Retrieve the average revenue per months in 2019
SELECT MONTH(o.order_date) 'month', round(avg(o.total_bill)) 'average revenue'
FROM orders o
WHERE YEAR(o.order_date) = 2019
GROUP BY MONTH(o.order_date)
ORDER BY MONTH(o.order_date);

-- 14. Retrieve information of the customer who bought the most number of books and that number
SELECT c.*, sum(od.quantity) 'book amount'
FROM orders o, customer c, order_detail od
WHERE o.order_id = od.order_id AND c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING `book amount` >= ALL (
	SELECT sum(od1.quantity)
	FROM orders o1, customer c1, order_detail od1
	WHERE o1.order_id = od1.order_id AND c1.customer_id = o1.customer_id
	GROUP BY c1.customer_id
);

-- 15. Retrieve the books information and authors of the top 7 most favorite books 
-- Cach 1
SELECT * FROM (
	SELECT salesinfo.*, dense_rank() over (order by sales desc) sales_rank
	FROM (
		SELECT b.title, b.price, b.inventory_qty, a.name, a.country, sum(od.quantity) 'sales'
		FROM author a, author_detail ad, book b, order_detail od
		WHERE a.author_id = ad.author_id AND ad.book_id = b.book_id AND od.book_id = b.book_id
		GROUP BY b.book_id, a.author_id
		ORDER BY sales DESC
	) salesinfo
) salesinfo_withrank
WHERE salesinfo_withrank.sales_rank <= 7;

-- Cach 2
SET @order_rank = 0;
SET @cur_sales = 0;
SELECT rankedtable.title, rankedtable.price, rankedtable.inventory_qty, rankedtable.name, rankedtable.country, rankedtable.sales
FROM (
	SELECT salesinfo.*,
		@order_rank := IF(@cur_sales <> sales, @order_rank + 1, @order_rank) AS rnk, 
		@cur_sales := sales AS sales_temp
	FROM (
		SELECT b.title, b.price, b.inventory_qty, a.name, a.country, sum(od.quantity) 'sales'
		FROM author a, author_detail ad, book b, order_detail od
		WHERE a.author_id = ad.author_id AND ad.book_id = b.book_id AND od.book_id = b.book_id
		GROUP BY b.book_id, a.author_id
	) salesinfo
	ORDER BY sales DESC) rankedtable 
WHERE rankedtable.rnk <= 7;

-- 16. Retrieve information of the cashier which has the lowest sales revenue in total
SELECT s.*, sum(o.total_bill) 'revenue'
FROM orders o, staff s
WHERE o.staff_id = s.staff_id
GROUP BY s.staff_id
HAVING revenue <= ALL (
	SELECT sum(o1.total_bill)
	FROM orders o1, staff s1
	WHERE o1.staff_id = s1.staff_id
	GROUP BY s1.staff_id
);

-- 17. Retrieve information of the order which has the highest total bill in 2019 and the cashier that was in charge of that order
SELECT o.order_id, o.order_date, o.total_bill, s.name, s.dob, s.phone, s.email
FROM orders o, staff s
WHERE o.staff_id = s.staff_id
AND YEAR(o.order_date) = 2019
AND o.total_bill >= ALL (
	SELECT o.total_bill
	FROM orders o, staff s
	WHERE o.staff_id = s.staff_id
	AND YEAR(o.order_date) = 2019
);

-- 18. Retrieve information of customers who bought "Adventure", "Mystery" and "Action" books 
SELECT DISTINCT c.*
FROM genre g, book b, order_detail od, orders o, customer c
WHERE g.book_id = b.book_id AND b.book_id = od.book_id AND od.order_id = o.order_id AND o.customer_id = c.customer_id
AND g.genre = 'Adventure'
AND c.customer_id IN (
	SELECT c1.customer_id
	FROM genre g1, book b1, order_detail od1, orders o1, customer c1
	WHERE g1.book_id = b1.book_id AND b1.book_id = od1.book_id AND od1.order_id = o1.order_id AND o1.customer_id = c1.customer_id
	AND g1.genre = 'Action'
)
AND c.customer_id IN (
	SELECT c2.customer_id
	FROM genre g2, book b2, order_detail od2, orders o2, customer c2
	WHERE g2.book_id = b2.book_id AND b2.book_id = od2.book_id AND od2.order_id = o2.order_id AND o2.customer_id = c2.customer_id
	AND g2.genre = 'Mystery'
);

-- 19. Since Kathryne Rosingdall quited her manager job, Sher Kentwell will be promoted to manager. Update the information of these staffs
UPDATE staff s1, staff s2 
SET s1.end_date = now(), s2.`position` = 'manager'
WHERE s1.name = 'Kathryne Rosingdall' AND s2.name = 'Sher Kentwell';

-- 20. During the Covid-19 pandemic, in order to maintain the business, the director of the bookstore decided to fired some non manager staffs which were newly hired in 2020. Retrieve the list of these staffs.
UPDATE staff s
SET s.end_date = now()
WHERE YEAR(s.hire_date) = 2020 AND s.`position` <> 'manager';

-- 21. Create trigger to update the quantity of books left after an order is made
CREATE TRIGGER update_book_quantity BEFORE INSERT ON order_detail
FOR EACH ROW 
	UPDATE book 
	SET inventory_qty = inventory_qty - NEW.quantity
	WHERE book_id = NEW.book_id;

-- 22. Create trigger to get the total bill of an order when books are added into order
CREATE TRIGGER order_total_bill BEFORE INSERT ON order_detail
FOR EACH ROW
	UPDATE orders
	SET total_bill = total_bill + (
		SELECT (price * NEW.quantity)
		FROM book
		WHERE book_id = NEW.book_id
	)
	WHERE order_id = NEW.order_id;

-- 23. Give the name of exactly 2 publishers publishing the most number of books
SELECT p.name
FROM publisher AS p, (
	SELECT publisher_id 
	FROM book 
	GROUP BY publisher_id 
	ORDER BY SUM(inventory_qty) DESC 
	LIMIT 2) AS p1
WHERE p.publisher_id = p1.publisher_id;

-- 24. Give the information of all the authors whose books published by publisher 'Lao Động' 
SELECT a.name, a.country
FROM author AS a, author_detail AS ad, book AS b, publisher AS p
WHERE b.publisher_id = p.publisher_id
AND b.book_id = ad.book_id
AND ad.author_id = a.author_id
AND p.name LIKE N'%Lao Động%';

-- 25. Give the name, hire date and the number of books sold by staffs who have been working less than 1 year
SELECT s.name, s.hire_date, SUM(books_in_order.total_book) AS book_sold
FROM staff AS s, orders AS o, (
	SELECT SUM(quantity) AS total_book, order_id
	FROM order_detail
	GROUP BY order_id
	) AS books_in_order
WHERE s.staff_id = o.staff_id
AND o.order_id = books_in_order.order_id
AND (DATEDIFF(now(), s.hire_date)/365) < 1
GROUP BY s.staff_id;
	
-- 26. Give the title of books written by American authors whose books were published by more than 3 publishers
SELECT b.title AS Books 
FROM book AS b, author_detail AS ad
WHERE b.book_id = ad.book_id
AND ad.author_id IN (
	SELECT a.author_id
	FROM author AS a, author_detail AS ad, book AS b
	WHERE a.author_id = ad.author_id
	AND b.book_id = ad.book_id
	AND a.country = 'USA'
	GROUP BY a.author_id
	HAVING COUNT(DISTINCT b.publisher_id) > 3
);

-- 27. Function to get the number of books published by 1 publisher
DELIMITER $$

CREATE FUNCTION book_count(publisherID INT) RETURNS INT
LANGUAGE SQL DETERMINISTIC
BEGIN
	DECLARE number_of_book INT;
	SELECT COUNT(book_id) 
	INTO number_of_book
	FROM book
	WHERE publisher_id = publisherID
	GROUP BY publisher_id;
	RETURN number_of_book;
END $$

DELIMITER ;
 
-- 28. Give the name of customers who buy books in only 1 genre
SELECT c.name 
FROM customer AS c, orders AS o, order_detail AS od, book AS b, genre AS g
WHERE c.customer_id = o.customer_id
AND o.order_id = od.order_id
AND od.book_id = b.book_id
AND b.book_id = g.book_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT g.genre) <= 1;

-- 29. Give the name of authors who wrote the least number of books among all British authors
SELECT a.name AS Authors
FROM author AS a, author_detail AS ad
WHERE a.author_id = ad.author_id
AND a.country = 'England'
GROUP BY a.author_id
HAVING COUNT(ad.book_id) <= ALL (
	SELECT COUNT(ad.book_id)
	FROM author_detail AS ad, author AS a
	WHERE ad.author_id = a.author_id
	AND a.country = 'England'
	GROUP BY a.author_id
);

-- 30. Give the name and phone number of customers who used to buy at least 1 book written by author 'J. K. Rowling' and the total number of books he/she's already bought till now is less than 5
SELECT c.name, c.phone
FROM customer AS c, orders AS o, order_detail AS od
WHERE c.customer_id = o.customer_id
AND o.order_id = od.order_id
AND od.book_id IN (
	SELECT b.book_id
	FROM book AS b, author_detail AS ad, author AS a
	WHERE b.book_id = ad.book_id
	AND a.author_id = ad.author_id
	AND a.name = 'J. K. Rowling' 
)
GROUP BY c.customer_id
HAVING SUM(od.quantity) < 5;



























