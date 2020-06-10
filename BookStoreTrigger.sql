-- Update the number of book in table book when books are bought
DELIMETER $$
CREATE TRIGGER update_book_quantity ON order_detail AFTER INSERT AS
BEGIN
	UPDATE book 
	SET inventory_qty = inventory_qty - (
		SELECT quantity
		FROM order_detail
		WHERE book_id = book.book_id
	)
	FROM book
	JOIN order_detail ON book.book_id = order_detail.book_id;
END
DELIMETER ;

-- Update table orders to get the total_bill of an order when books are added into order
DELIMETER $$
CREATE TRIGGER order_total_bill ON order_detail AFTER INSERT AS
BEGIN
	UPDATE orders
	SET total_bill = total_bill + (
		SELECT SUM(b.price * od.quantity)
		FROM order_detail AS od, book AS b
		WHERE od.order_id = orders.order_id
		AND b.book_id = od.book_id
	)
	FROM orders 
	JOIN order_detail ON orders.order_id = order_detail.order_id;
END
DELIMETER ;