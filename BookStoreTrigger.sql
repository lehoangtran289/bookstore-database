-- Update the number of book in table book when books are bought
DELIMITER $

CREATE TRIGGER update_book_quantity BEFORE INSERT ON order_detail
	FOR EACH ROW 
	UPDATE book 
	SET inventory_qty = inventory_qty - NEW.quantity
	WHERE book_id = NEW.book_id;
$

DELIMITER ;

-- Update table orders to get the total_bill of an order when books are added into order
DELIMITER $

CREATE TRIGGER order_total_bill BEFORE INSERT ON order_detail
	FOR EACH ROW
	UPDATE orders
	SET total_bill = total_bill + (
		SELECT (price * NEW.quantity)
		FROM book
		WHERE book_id = NEW.book_id
	)
	WHERE order_id = NEW.order_id;
$

DELIMITER ;