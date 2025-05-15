INSERT INTO ingredients (ingredient_id, name, type, description, num_instock, reorder, last_updated) VALUES
(1, 'Ground Beef', 'Meat', 'Used for burgers', 100, FALSE, '2025-03-01 12:00:00'),
(2, 'Cheddar Cheese', 'Dairy', 'Sharp yellow cheese', 50, TRUE, '2025-03-02 12:00:00'),
(3, 'Macaroni Pasta', 'Pasta', 'Short-cut pasta', 80, FALSE, '2025-03-03 12:00:00'),
(4, 'Chicken', 'Meat', 'Whole chicken', 75, TRUE, '2025-03-04 12:00:00'),
(5, 'Barbecue Sauce', 'Condiment', 'Sweet and smoky BBQ sauce', 120, FALSE, '2025-03-05 12:00:00'),
(6, 'Clams', 'Seafood', 'Fresh clams', 40, TRUE, '2025-03-06 12:00:00'),
(7, 'Lettuce', 'Vegetable', 'Fresh romaine', 200, FALSE, '2025-03-07 12:00:00'),
(8, 'Croutons', 'Bread', 'Crispy croutons', 150, FALSE, '2025-03-08 12:00:00'),
(9, 'Cornmeal', 'Grain', 'For making cornbread', 90, TRUE, '2025-03-09 12:00:00'),
(10, 'Sausage', 'Meat', 'Seasoned pork sausage', 60, TRUE, '2025-03-10 12:00:00'),
(11, 'Shrimp', 'Seafood', 'Fresh shrimp', 70, TRUE, '2025-03-11 12:00:00'),
(12, 'Lobster', 'Seafood', 'Fresh Maine lobster', 30, TRUE, '2025-03-12 12:00:00'),
(13, 'Pizza Dough', 'Dough', 'Thin crust pizza dough', 50, TRUE, '2025-03-13 12:00:00'),
(14, 'Tomato Sauce', 'Condiment', 'Traditional pizza sauce', 80, FALSE, '2025-03-14 12:00:00'),
(15, 'Kidney Beans', 'Legume', 'Used in chili', 100, FALSE, '2025-03-15 12:00:00'),
(16, 'Apples', 'Fruit', 'Fresh Granny Smith apples', 90, FALSE, '2025-03-16 12:00:00');
Select * From ingredients
Limit 1;

INSERT INTO recipe (recipe_id, name, description, category, recipe_instructions, create_date, ingredient_id) VALUES
(1, 'Classic Cheeseburger', 'Juicy beef patty with melted cheese', 'Main Course', 'Grill patty, add cheese, assemble.', '2025-01-01', 1),
(2, 'Mac and Cheese', 'Creamy mac and cheese', 'Side Dish', 'Boil pasta, mix with cheese sauce.', '2025-01-02', 2),
(3, 'BBQ Chicken', 'Smoky and sweet grilled chicken', 'Main Course', 'Marinate, grill, and glaze.', '2025-01-03', 4),
(4, 'Clam Chowder', 'Rich and creamy New England soup', 'Soup', 'Simmer clams with potatoes.', '2025-01-04', 6),
(5, 'Lobster Roll', 'Buttery lobster in a toasted bun', 'Main Course', 'Mix lobster with mayo, serve.', '2025-01-05', 12),
(6, 'Fried Chicken', 'Crispy and juicy fried chicken', 'Main Course', 'Batter and deep fry.', '2025-01-06', 4),
(7, 'Cornbread', 'Sweet and moist cornbread', 'Side Dish', 'Mix batter, bake.', '2025-01-07', 9),
(8, 'Caesar Salad', 'Crisp lettuce with Caesar dressing', 'Salad', 'Toss ingredients together.', '2025-01-08', 7),
(9, 'Buffalo Wings', 'Spicy and tangy wings', 'Appetizer', 'Fry wings, toss in sauce.', '2025-01-09', 5),
(10, 'Pulled Pork Sandwich', 'Slow-cooked pork in BBQ sauce', 'Main Course', 'Slow cook pork, shred.', '2025-01-10', 5),
(11, 'Biscuits and Gravy', 'Fluffy biscuits with sausage gravy', 'Breakfast', 'Bake biscuits, make gravy.', '2025-01-11', 10),
(12, 'Shrimp and Grits', 'Southern shrimp over creamy grits', 'Main Course', 'Cook shrimp, serve with grits.', '2025-01-12', 11),
(13, 'New York Pizza', 'Thin crust, cheesy NY-style pizza', 'Main Course', 'Bake pizza with toppings.', '2025-01-13', 14),
(14, 'Chili', 'Spicy and hearty beef chili', 'Main Course', 'Simmer beef with beans and spices.', '2025-01-14', 15),
(15, 'Apple Pie', 'Classic American apple pie', 'Dessert', 'Bake apples in a flaky crust.', '2025-01-15', 16);
Select * From recipe
Limit 1;

INSERT INTO batches (batch_number, recipe_id, batch_size, date_made, date_expired) VALUES
(1, 1, 50, '2025-03-01', '2025-03-05'),
(2, 2, 40, '2025-03-02', '2025-03-06'),
(3, 3, 30, '2025-03-03', '2025-03-07'),
(4, 4, 25, '2025-03-04', '2025-03-08'),
(5, 5, 20, '2025-03-05', '2025-03-09'),
(6, 6, 50, '2025-03-06', '2025-03-10'),
(7, 7, 40, '2025-03-07', '2025-03-11'),
(8, 8, 35, '2025-03-08', '2025-03-12'),
(9, 9, 45, '2025-03-09', '2025-03-13'),
(10, 10, 30, '2025-03-10', '2025-03-14'),
(11, 11, 25, '2025-03-11', '2025-03-15'),
(12, 12, 20, '2025-03-12', '2025-03-16'),
(13, 13, 40, '2025-03-13', '2025-03-17'),
(14, 14, 50, '2025-03-14', '2025-03-18'),
(15, 15, 30, '2025-03-15', '2025-03-19');
Select * From batches
Limit 1;

INSERT INTO customer (customer_id, first_name, last_name, email, phone_num, reward_points) VALUES
(1, 'Michael', 'Miller', 'michael.miller@example.com', '555-1234', 120),
(2, 'Sarah', 'Johnson', 'sarah.johnson@example.com', '555-5678', 90),
(3, 'James', 'Brown', 'james.brown@example.com', '555-9101', 80),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '555-1122', 150),
(5, 'William', 'Smith', 'william.smith@example.com', '555-3344', 100),
(6, 'Linda', 'Clark', 'linda.clark@example.com', '555-5566', 130),
(7, 'David', 'Martinez', 'david.martinez@example.com', '555-7788', 110),
(8, 'Jessica', 'Lopez', 'jessica.lopez@example.com', '555-9900', 140),
(9, 'John', 'Garcia', 'john.garcia@example.com', '555-2233', 170),
(10, 'Sophia', 'Anderson', 'sophia.anderson@example.com', '555-4455', 160);
Select * From customer
Limit 1;

INSERT INTO transactions (transaction_id, customer_id, recipe_id, date, total, payment_method, quantity, price) VALUES
(1, 1, 1, '2025-03-08', 12.50, 'Credit Card', 1, 12.50),
(2, 2, 2, '2025-03-09', 9.99, 'Cash', 1, 9.99),
(3, 3, 3, '2025-03-10', 14.50, 'Debit Card', 1, 14.50),
(4, 4, 4, '2025-03-11', 8.99, 'Credit Card', 2, 4.50),
(5, 5, 5, '2025-03-12', 15.00, 'PayPal', 1, 15.00),
(6, 6, 6, '2025-03-13', 7.00, 'Venmo', 1, 7.00),
(7, 7, 7, '2025-03-14', 11.99, 'Apple Pay', 2, 6.00),
(8, 8, 8, '2025-03-15', 5.50, 'Cash', 1, 5.50),
(9, 9, 9, '2025-03-16', 3.99, 'Debit Card', 3, 1.33),
(10, 10, 10, '2025-03-17', 18.00, 'Credit Card', 2, 9.00);
Select * From transactions
Limit 1;

INSERT INTO supplier (supplier_id, name, phone_num, email, address, city, country, zipcode) VALUES
(1, 'American Fresh Meats', '555-1111', 'contact@afmeats.com', '123 Meat St.', 'Chicago', 'USA', 60601),
(2, 'Dairy Delight', '555-2222', 'sales@dairydelight.com', '456 Cream Ave.', 'Wisconsin', 'USA', 53703),
(3, 'Farm to Table', '555-3333', 'info@farmtotable.com', '789 Greenway Blvd.', 'Austin', 'USA', 73301),
(4, 'Seafood Select', '555-4444', 'orders@seafoodselect.com', '159 Ocean Dr.', 'Boston', 'USA', 02108),
(5, 'Spice It Up', '555-5555', 'support@spiceitup.com', '357 Flavor Ln.', 'New Orleans', 'USA', 70130);
Select * From supplier
Limit 1;

INSERT INTO supplier_inventory (id, supplier_id, ingredient_id, price, quantity_available) VALUES
(1, 1, 1, 5.99, 200),  
(2, 1, 4, 4.50, 150),  
(3, 2, 2, 3.25, 100),  
(4, 2, 3, 1.50, 200),  
(5, 3, 7, 1.00, 300),  
(6, 3, 10, 1.75, 250), 
(7, 4, 6, 7.99, 75),   
(8, 4, 12, 15.00, 50), 
(9, 5, 5, 2.99, 180),  
(10, 5, 9, 1.75, 220);  
Select * From supplier_inventory
Limit 1;

INSERT INTO supplies (supply_id, name, description, category, supplier_id) VALUES
(1, 'Burger Buns', 'Soft buns for burgers and sandwiches', 'Bakery', 3),
(2, 'Paper Food Trays', 'Disposable trays for serving food', 'Packaging', 5),
(3, 'To-Go Cups', 'Plastic cups for drinks', 'Packaging', 5),
(4, 'Napkins', 'Paper napkins for customer use', 'Accessories', 5),
(5, 'Baking Pans', 'Metal pans for baking cornbread and pies', 'Kitchen Equipment', 3),
(6, 'Spices Mix', 'A blend of American seasoning', 'Food Seasoning', 5),
(7, 'Cooking Oil', 'Vegetable oil for deep frying', 'Cooking Essentials', 3),
(8, 'Charcoal', 'For grilling and smoking meats', 'Grill Essentials', 1),
(9, 'Plastic Utensils', 'Disposable forks, knives, and spoons', 'Accessories', 5),
(10, 'Food Containers', 'Plastic containers for meal prep', 'Packaging', 5);
Select * From supplies
Limit 1;

ALTER TABLE "order" RENAME TO customer_orders;

INSERT INTO customer_orders (order_id, transaction_id, num_of_items, type) VALUES
(1, 1, 1, 'Dine-In'),
(2, 2, 1, 'Takeout'),
(3, 3, 2, 'Delivery'),
(4, 4, 2, 'Takeout'),
(5, 5, 1, 'Dine-In'),
(6, 6, 1, 'Delivery'),
(7, 7, 2, 'Dine-In'),
(8, 8, 1, 'Takeout'),
(9, 9, 3, 'Delivery'),
(10, 10, 2, 'Takeout'),
(11, 1, 1, 'Delivery'),
(12, 3, 1, 'Takeout'),
(13, 5, 2, 'Dine-In'),
(14, 7, 1, 'Delivery'),
(15, 9, 2, 'Dine-In');
Select * From customer_orders
Limit 1;
