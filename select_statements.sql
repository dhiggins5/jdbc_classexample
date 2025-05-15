SELECT customer_id, first_name, last_name
FROM customer
ORDER BY last_name ASC;

SELECT category, COUNT(recipe_id) AS total_recipes
FROM recipe
GROUP BY category;

SELECT ingredient_id, name, type, num_instock, reorder
FROM ingredients
WHERE reorder = TRUE
ORDER BY num_instock ASC;

SELECT recipe_id, COUNT(batch_number) AS batch_count
FROM batches
GROUP BY recipe_id
ORDER BY batch_count DESC;

SELECT ingredient_id, name, num_instock
FROM ingredients
WHERE num_instock < 50
ORDER BY num_instock ASC;

SELECT customer_id, first_name, last_name, SUM(reward_points) AS total_points
FROM customer
GROUP BY customer_id, first_name, last_name
ORDER BY total_points DESC;
