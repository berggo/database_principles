-- Films that were never rented
SELECT f.film_id, f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

-- Films that were not rented in 2006
SELECT f.film_id, f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE YEAR(r.rental_date) != 2006
GROUP BY f.film_id;

-- Longest film
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 1;

-- Shortest film
SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 1;

-- the Average Payment Amount by Customer
SELECT c.customer_id, c.first_name, c.last_name, AVG(p.amount) AS avg_payment_amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

-- Total Number of Rentals per Store
SELECT s.store_id, COUNT(r.rental_id) AS total_rentals
FROM store s
JOIN inventory i ON s.store_id = i.store_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY s.store_id;

-- Actors Who Have Worked Together in Multiple Films
SELECT a1.first_name AS actor1_first_name, a1.last_name AS actor1_last_name,
       a2.first_name AS actor2_first_name, a2.last_name AS actor2_last_name,
       COUNT(f.film_id) AS films_together
FROM film_actor fa1
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN actor a1 ON fa1.actor_id = a1.actor_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
JOIN film f ON fa1.film_id = f.film_id
WHERE fa1.actor_id != fa2.actor_id
GROUP BY a1.actor_id, a2.actor_id
HAVING COUNT(f.film_id) > 1
ORDER BY films_together DESC;



