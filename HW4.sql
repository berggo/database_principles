-- When was the first payment done? When the last?
SELECT MAX(payment_date) AS LAST_PAYMENT, MIN(payment_date) AS FIRST_PAYMENT FROM payment;

-- Report total payments by year. By month. Combine both reports.
SELECT
  YEAR(payment_date) AS year,
  SUM(amount)        AS total_payments
FROM payment
GROUP BY YEAR(payment_date)
ORDER BY year;

SELECT
  YEAR(payment_date)  AS year,
  MONTH(payment_date) AS month,
  SUM(amount)         AS total_payments
FROM payment
GROUP BY YEAR(payment_date),
         MONTH(payment_date)

ORDER BY year, month;

-- Which film brings more money to the company? Which actor?
SELECT f.title, SUM(p.amount) AS total_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id
ORDER BY total_revenue DESC
LIMIT 1;

SELECT a.first_name, a.last_name, SUM(p.amount) AS total_revenue
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY a.actor_id
ORDER BY total_revenue DESC
LIMIT 1;

-- Customers from which city pays more money?
SELECT a.city, SUM(p.amount) AS total_revenue
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY a.city
ORDER BY total_revenue DESC
LIMIT 1;

-- Create list of the films that was leaders by month.
SELECT 
    YEAR(r.rental_date) AS year,
    MONTH(r.rental_date) AS month,
    f.title,
    SUM(p.amount) AS total_revenue
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
JOIN 
    payment p ON r.rental_id = p.rental_id
GROUP BY 
    YEAR(r.rental_date), MONTH(r.rental_date), f.film_id
ORDER BY 
    year, month, total_revenue DESC;

-- Combine data from last_update fields from all the tables.
SELECT 
    f.film_id, f.title AS film_title, f.last_update AS film_last_update,
    a.actor_id, a.first_name AS actor_first_name, a.last_name AS actor_last_name, a.last_update AS actor_last_update,
    c.customer_id, c.first_name AS customer_first_name, c.last_name AS customer_last_name, c.last_update AS customer_last_update,
    p.payment_id, p.amount, p.last_update AS payment_last_update,
    r.rental_id, r.rental_date, r.return_date, r.last_update AS rental_last_update,
    i.inventory_id, i.last_update AS inventory_last_update
FROM 
    film f
JOIN 
    film_actor fa ON f.film_id = fa.film_id
JOIN 
    actor a ON fa.actor_id = a.actor_id
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
JOIN 
    customer c ON r.customer_id = c.customer_id
JOIN 
    payment p ON r.rental_id = p.rental_id
ORDER BY 
    f.film_id, a.actor_id, c.customer_id;

-- Calculate frequency of update for all the tables.
SELECT 
    'film' AS table_name,
    COUNT(*) AS total_updates,
    DATEDIFF(MAX(last_update), MIN(last_update)) AS update_period_days,
    COUNT(*) / DATEDIFF(MAX(last_update), MIN(last_update)) AS updates_per_day
FROM film

UNION ALL

SELECT 
    'actor' AS table_name,
    COUNT(*) AS total_updates,
    DATEDIFF(MAX(last_update), MIN(last_update)) AS update_period_days,
    COUNT(*) / DATEDIFF(MAX(last_update), MIN(last_update)) AS updates_per_day
FROM actor

UNION ALL

SELECT 
    'customer' AS table_name,
    COUNT(*) AS total_updates,
    DATEDIFF(MAX(last_update), MIN(last_update)) AS update_period_days,
    COUNT(*) / DATEDIFF(MAX(last_update), MIN(last_update)) AS updates_per_day
FROM customer

UNION ALL

SELECT 
    'payment' AS table_name,
    COUNT(*) AS total_updates,
    DATEDIFF(MAX(last_update), MIN(last_update)) AS update_period_days,
    COUNT(*) / DATEDIFF(MAX(last_update), MIN(last_update)) AS updates_per_day
FROM payment

UNION ALL

SELECT 
    'rental' AS table_name,
    COUNT(*) AS total_updates,
    DATEDIFF(MAX(last_update), MIN(last_update)) AS update_period_days,
    COUNT(*) / DATEDIFF(MAX(last_update), MIN(last_update)) AS updates_per_day
FROM rental

UNION ALL

SELECT 
    'inventory' AS table_name,
    COUNT(*) AS total_updates,
    DATEDIFF(MAX(last_update), MIN(last_update)) AS update_period_days,
    COUNT(*) / DATEDIFF(MAX(last_update), MIN(last_update)) AS updates_per_day
FROM inventory;


-- THR END -- 






