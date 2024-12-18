-----easy
--1)
--SELECT * FROM employee
--WHERE title ILIKE '%Senior%'


--2)
--SELECT COUNT(invoice_id), billing_country FROM invoice
--GROUP BY billing_country
--ORDER BY count DESC


--3) 
--SELECT DISTINCT(total) FROM invoice
--ORDER BY total DESC
--LIMIT 3


--4)
--SELECT SUM(total), billing_city FROM invoice
--GROUP BY billing_city
--ORDER BY sum DESC
--LIMIT 1

--5)
--SELECT SUM(total), customer.customer_id  FROM customer
--JOIN invoice ON customer.customer_id = invoice.customer_id
--GROUP BY customer.customer_id
--ORDER BY sum(total) DESC
--LIMIT 1

-----moderate
--1)
--SELECT DISTINCT(customer.email), customer.first_name, customer.last_name, genre.name FROM customer
--JOIN invoice ON customer.customer_id = invoice.customer_id
--JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
--JOIN track ON track.track_id = invoice_line.track_id
--JOIN genre ON track.genre_id = genre.genre_id
--WHERE genre.name ILIKE '%rock%'
--ORDER BY email ASC

--2)
--SELECT COUNT(DISTINCT album.album_id), artist.name FROM artist
--JOIN album ON artist.artist_id = album.artist_id
--JOIN track ON track.album_id = album.album_id
--JOIN genre ON genre.genre_id = track.genre_id
--WHERE genre.name ILIKE'%rock%'
--GROUP BY 
--    artist.name
--ORDER BY count DESC

--3)
--SELECT  b.milliseconds_length, b.name  FROM (
--    SELECT milliseconds AS milliseconds_length, name
--	FROM
--	track) b
--WHERE b.milliseconds_length > (SELECT AVG(milliseconds) FROM track)
--ORDER BY b.milliseconds_length  DESC


----advanced
--1)
--WITH best_sales_artist AS(
--SELECT artist.artist_id, artist.name, SUM(invoice_line.unit_price * invoice_line.quantity)
--	FROM artist
--JOIN album ON artist.artist_id = album.artist_id
--JOIN track ON track.album_id = album.album_id
--JOIN invoice_line ON invoice_line.track_id = track.track_id
--GROUP BY artist.artist_id
--ORDER BY 3	DESC
--	LIMIT 1
--)
--SELECT customer.first_name, customer.last_name, customer.customer_id, best_sales_artist.artist_id, best_sales_artist.name, SUM(invoice_line.unit_price * invoice_line.quantity) 
--FROM customer
--JOIN invoice ON customer.customer_id = invoice.customer_id
--JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
--JOIN track ON invoice_line.track_id = track.track_id
--JOIN album ON track.album_id = album.album_id
--JOIN best_sales_artist ON best_sales_artist.artist_id = album.artist_id
--GROUP BY customer.customer_id, 
 --   customer.first_name, 
 --   customer.last_name, 
 --   best_sales_artist.artist_id, 
  --  best_sales_artist.name


--2) 
--WITH genre_popular AS (
--    SELECT  
--        customer.country, 
--        genre.name AS genre_name, 
 --       genre.genre_id,
--        COUNT(invoice_line.quantity) AS total_quantity
--    FROM 
--        genre
--    JOIN 
 --       track ON genre.genre_id = track.genre_id
 --   JOIN 
 --       invoice_line ON invoice_line.track_id = track.track_id
--    JOIN 
  --      invoice ON invoice.invoice_id = invoice_line.invoice_id
  --  JOIN 
  --      customer ON customer.customer_id = invoice.customer_id
  --  GROUP BY 
  --      customer.country, 
  --      genre.name, 
  --      genre.genre_id
	--ORDER BY 1 DESC, total_quantity DESC
	
--)
--SELECT * 
--FROM genre_popular;

--3)
--WITH top_customer AS(
--SELECT customer.first_name, customer.last_name, customer.customer_id, 
--	invoice.billing_country, SUM(invoice.total) AS total_spent FROM customer
--JOIN invoice ON invoice.customer_id = customer.customer_id
--	GROUP BY 3,1,2,4
--	ORDER BY total_spent DESC
--	)
--	SELECT * FROM top_customer
	






 


