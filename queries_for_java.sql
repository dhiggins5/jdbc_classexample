SELECT name, type, num_instock, reorder
FROM ingredients
ORDER BY name;

SELECT first_name, last_name, reward_points
FROM customer
ORDER BY reward_points DESC
LIMIT 5;

SELECT date, SUM(total) AS revenue
FROM transactions
GROUP BY date
ORDER BY date DESC
LIMIT 5;

SELECT name, type, num_instock, reorder, last_updated
FROM ingredients
ORDER BY name;

SELECT word
FROM (
    SELECT r.name
    FROM recipe r
) AS names,
LATERAL regexp_split_to_table(names.name, E'\\s+') AS word;

SELECT i.name, COUNT(r.recipe_id) AS usage_count
FROM ingredients i
JOIN recipe r ON i.ingredient_id = r.ingredient_id
GROUP BY i.name
ORDER BY usage_count DESC;

SELECT r.name AS recipe_name, i.name AS ingredient_name, i.type
FROM recipe r
JOIN ingredients i ON r.ingredient_id = i.ingredient_id
ORDER BY r.name;

SELECT c.first_name, c.last_name, r.name AS recipe, t.total, t.date
FROM transactions t
JOIN customer c ON t.customer_id = c.customer_id
JOIN recipe r ON t.recipe_id = r.recipe_id
ORDER BY t.date DESC;

CREATE OR REPLACE VIEW recipe_words_view AS
SELECT r.name AS recipe_name,
       regexp_split_to_table(r.name, E'\\s+') AS word
FROM recipe r;
