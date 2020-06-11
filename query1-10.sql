use bookstoredb;

-- total revenue by day 
SELECT order_date date, sum(total_bill)
FROM orders
GROUP BY order_date
ORDER BY order_date ASC;

-- infomation of customers who by more than 3 Technical books
SELECT c.*
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_detail od on o.order_id = od.order_id
JOIN genre g on g.book_id = od.book_id
WHERE g.genre = 'Technical'
GROUP BY c.customer_id
HAVING COUNT(*) >= 3;

-- best seller in third quarter of 2019
SELECT b.title, sum(od.quantity) * b.price as 'total revenue'
FROM order_detail od
JOIN book b ON od.book_id = b.book_id
JOIN orders o ON o.order_id = od.order_id
WHERE o.order_date BETWEEN '2019/07/01' AND '2019/09/30'
GROUP BY b.book_id
ORDER BY SUM(od.quantity) * b.price DESC
LIMIT 1;

-- unsold book in the past 6 month
SELECT title
FROM book
WHERE title not in (
	SELECT DISTINCT b.title
	FROM order_detail od
	JOIN book b ON od.book_id = b.book_id
	JOIN orders o ON o.order_id = od.order_id
	WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 180 DAY)
);

-- customer who spent more than 2000000 in 2020
SELECT c.*, sum(o.total_bill) AS 'total spending'
FROM customer c 
JOIN orders o ON o.customer_id = c.customer_id
WHERE YEAR(o.order_date) = 2020
GROUP BY c.customer_id
HAVING SUM(o.total_bill) > 2000000;

-- all books written by J.K Rowling
SELECT b.title
FROM book b
JOIN author_detail ad ON ad.book_id = b.book_id
JOIN author a ON a.author_id = ad.author_id
WHERE a.name = 'J. K. Rowling';

--  books that have amount in stock smaller than 3 and have sold more than 10 copies in last 3 month
SELECT b.*, SUM(od.quantity) AS 'Copies sold in last 6 month'
FROM book b
JOIN order_detail od ON b.book_id = od.book_id
JOIN orders o ON o.order_id = od.order_id
WHERE b.inventory_qty < 3 AND o.order_date >= DATE_SUB(CURDATE(), INTERVAL 180 DAY)
GROUP BY b.book_id
HAVING SUM(od.quantity) > 10;

--  best seller of 3 best publisher
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


-- discount 15% for books that unsold in last month
UPDATE book
SET price = price * 0.85
WHERE book_id IN (
	SELECT book_id
	FROM book
	WHERE book_id not in (
		SELECT DISTINCT b.book_id
		FROM order_detail od
		JOIN book b ON od.book_id = b.book_id
		JOIN orders o ON o.order_id = od.order_id
		WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
	)
);

-- books that have more than one genres
SELECT b.*
FROM book b
JOIN genre g on b.book_id = g.book_id
GROUP BY b.book_id
HAVING COUNT(g.genre) > 1;








