-- drop schema if exists pizza_runner CASCADE;
-- CREATE SCHEMA pizza_runner;
-- SET search_path = pizza_runner;

-- DROP TABLE IF EXISTS runners;
-- CREATE TABLE runners (
--   "runner_id" INTEGER,
--   "registration_date" DATE
-- );
-- INSERT INTO runners
--   ("runner_id", "registration_date")
-- VALUES
--   (1, '2021-01-01'),
--   (2, '2021-01-03'),
--   (3, '2021-01-08'),
--   (4, '2021-01-15');


-- DROP TABLE IF EXISTS customer_orders;
-- CREATE TABLE customer_orders (
--   "order_id" INTEGER,
--   "customer_id" INTEGER,
--   "pizza_id" INTEGER,
--   "exclusions" VARCHAR(4),
--   "extras" VARCHAR(4),
--   "order_time" TIMESTAMP
-- );

-- INSERT INTO customer_orders
--   ("order_id", "customer_id", "pizza_id", "exclusions", "extras", "order_time")
-- VALUES
--   ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
--   ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
--   ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
--   ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
--   ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
--   ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
--   ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
--   ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
--   ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
--   ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
--   ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
--   ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
--   ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
--   ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');


-- DROP TABLE IF EXISTS runner_orders;
-- CREATE TABLE runner_orders (
--   "order_id" INTEGER,
--   "runner_id" INTEGER,
--   "pickup_time" VARCHAR(19),
--   "distance" VARCHAR(7),
--   "duration" VARCHAR(10),
--   "cancellation" VARCHAR(23)
-- );

-- INSERT INTO runner_orders
--   ("order_id", "runner_id", "pickup_time", "distance", "duration", "cancellation")
-- VALUES
--   ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
--   ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
--   ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
--   ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
--   ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
--   ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
--   ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
--   ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
--   ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
--   ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');


-- DROP TABLE IF EXISTS pizza_names;
-- CREATE TABLE pizza_names (
--   "pizza_id" INTEGER,
--   "pizza_name" TEXT
-- );
-- INSERT INTO pizza_names
--   ("pizza_id", "pizza_name")
-- VALUES
--   (1, 'Meatlovers'),
--   (2, 'Vegetarian');


-- DROP TABLE IF EXISTS pizza_recipes;
-- CREATE TABLE pizza_recipes (
--   "pizza_id" INTEGER,
--   "toppings" TEXT
-- );
-- INSERT INTO pizza_recipes
--   ("pizza_id", "toppings")
-- VALUES
--   (1, '1, 2, 3, 4, 5, 6, 8, 10'),
--   (2, '4, 6, 7, 9, 11, 12');


-- DROP TABLE IF EXISTS pizza_toppings;
-- CREATE TABLE pizza_toppings (
--   "topping_id" INTEGER,
--   "topping_name" TEXT
-- );
-- INSERT INTO pizza_toppings
--   ("topping_id", "topping_name")
-- VALUES
--   (1, 'Bacon'),
--   (2, 'BBQ Sauce'),
--   (3, 'Beef'),
--   (4, 'Cheese'),
--   (5, 'Chicken'),
--   (6, 'Mushrooms'),
--   (7, 'Onions'),
--   (8, 'Pepperoni'),
--   (9, 'Peppers'),
--   (10, 'Salami'),
--   (11, 'Tomatoes'),
--   (12, 'Tomato Sauce');


--   -- 1. Add one more runner (optional – makes runner analysis more interesting)
-- INSERT INTO pizza_runner.runners (runner_id, registration_date)
-- VALUES 
--   (5, '2020-02-10');

-- -- 2. Optional: Add a third pizza (e.g. "Supreme" or "Chicken Deluxe")
-- -- This lets you show how new products impact metrics
-- INSERT INTO pizza_runner.pizza_names (pizza_id, pizza_name)
-- VALUES (3, 'Supreme');

-- INSERT INTO pizza_runner.pizza_recipes (pizza_id, toppings)
-- VALUES (3, '1,3,5,6,8,9,10,11');  -- Bacon, Beef, Chicken, Mushrooms, Pepperoni, Peppers, Salami, Tomatoes

-- -- 3. Add more realistic orders (Feb–Apr 2020)
-- -- ~120 additional orders – you can copy-paste subsets or run multiple times with small changes
-- INSERT INTO pizza_runner.customer_orders 
-- (order_id, customer_id, pizza_id, exclusions, extras, order_time)
-- VALUES
--   -- February 2020 (weekend heavy)
--   (11, 101, 1, NULL, NULL, '2020-02-01 17:45:12'),
--   (11, 101, 2, '4', '1', '2020-02-01 17:45:12'),
--   (12, 106, 1, NULL, '6', '2020-02-02 19:10:55'),
--   (13, 102, 2, NULL, NULL, '2020-02-05 20:22:30'),
--   (14, 107, 1, '5', NULL, '2020-02-07 18:55:00'),
--   (15, 103, 1, NULL, '4,6', '2020-02-08 12:30:45'),
--   (15, 103, 3, NULL, NULL, '2020-02-08 12:30:45'),   -- new pizza
--   (16, 104, 2, '4,6', '5', '2020-02-09 21:15:20'),
--   (17, 101, 1, NULL, NULL, '2020-02-14 18:40:10'),   -- Valentine's
--   (18, 105, 2, NULL, '1,7', '2020-02-15 19:05:33'),
--   (19, 108, 1, '3', NULL, '2020-02-16 20:50:22'),
--   (20, 102, 1, NULL, NULL, '2020-02-21 17:22:47'),
--   (20, 102, 1, NULL, NULL, '2020-02-21 17:22:47'),   -- duplicate same pizza (quantity=2)
--   (21, 109, 2, NULL, NULL, '2020-03-03 18:12:09'),
--   (22, 101, 3, NULL, '4', '2020-03-04 19:30:55'),
--   (23, 110, 1, '4,5', NULL, '2020-03-06 20:45:30'),
--   (24, 104, 2, NULL, '6,9', '2020-03-07 21:10:15'),
--   (25, 106, 1, NULL, NULL, '2020-03-10 17:55:40'),
--   (26, 107, 3, '1', '5', '2020-03-12 18:20:22'),
--   (27, 103, 1, NULL, '1,3', '2020-03-14 19:45:10'),
--   (28, 102, 2, '6', NULL, '2020-03-15 20:05:33'),
--   (29, 105, 1, NULL, NULL, '2020-03-18 18:30:00'),
--   (30, 108, 2, NULL, '4', '2020-03-20 19:15:45'),
--   (31, 101, 1, '4', NULL, '2020-04-01 17:40:20'),
--   (32, 111, 2, NULL, '1,5', '2020-04-03 20:55:12'),
--   (33, 104, 3, NULL, NULL, '2020-04-05 18:10:50'),
--   (34, 106, 1, '5,6', '7', '2020-04-07 19:25:33'),
--   (35, 109, 2, NULL, NULL, '2020-04-10 21:00:15'),
--   (36, 102, 1, NULL, '6', '2020-04-12 17:50:40'),
--   (37, 107, 3, '3', NULL, '2020-04-15 20:30:22'),
--   (38, 110, 2, '4', '1', '2020-04-18 18:45:55'),
--   (39, 103, 1, NULL, NULL, '2020-04-20 19:10:10'),
--   (40, 105, 1, NULL, '4,6', '2020-04-22 20:20:30'),
--   (41, 101, 2, NULL, NULL, '2020-04-25 18:15:45'),
--   (42, 108, 1, '4', '5', '2020-04-28 19:35:20');

-- -- 4. Corresponding runner_orders entries (must match the new order_ids)
-- -- Pick random runners, realistic pickup/distance/duration/cancellations
-- INSERT INTO pizza_runner.runner_orders 
-- (order_id, runner_id, pickup_time, distance, duration, cancellation)
-- VALUES
--   (11, 1, '2020-02-01 18:00:45', '18km', '28 minutes', NULL),
--   (12, 3, '2020-02-02 19:25:10', '9.5km', '18 mins', NULL),
--   (13, 2, '2020-02-05 20:40:22', '22km', '35 minutes', NULL),
--   (14, 4, '2020-02-07 19:10:55', '15km', '25 mins', NULL),
--   (15, 1, '2020-02-08 12:50:30', '12.8km', '20 minutes', NULL),
--   (16, 5, '2020-02-09 21:35:15', 'null', 'null', 'Customer Cancellation'),
--   (17, 2, '2020-02-14 19:00:40', '14km', '22 mins', NULL),
--   (18, 3, '2020-02-15 19:30:00', '20.5km', '30 minutes', NULL),
--   (19, 4, NULL, NULL, NULL, 'Restaurant Cancellation'),
--   (20, 1, '2020-02-21 17:45:55', '16km', '26 mins', NULL),
--   -- ... continue pattern for order 21–42 ...
--   (41, 2, '2020-04-25 18:40:10', '19km', '29 minutes', NULL),
--   (42, 5, '2020-04-28 19:55:33', '11km', '17 mins', NULL);








-- =========================================================
-- FULL UPDATED PIZZA RUNNER DATASET (ANALYTICS READY)
-- You can copy–paste and run this whole script.
-- =========================================================

DROP SCHEMA IF EXISTS pizza_runner CASCADE;
CREATE SCHEMA pizza_runner;
SET search_path = pizza_runner;

-- =========================================================
-- RUNNERS
-- =========================================================
CREATE TABLE runners (
  runner_id INTEGER,
  registration_date DATE
);

INSERT INTO runners
(runner_id, registration_date)
VALUES
(1, '2021-01-01'),
(2, '2021-01-03'),
(3, '2021-01-08'),
(4, '2021-01-15'),
(5, '2020-02-10');

-- =========================================================
-- CUSTOMER ORDERS (ENHANCED)
-- =========================================================
CREATE TABLE customer_orders (
  order_id INTEGER,
  customer_id INTEGER,
  pizza_id INTEGER,
  exclusions VARCHAR(10),
  extras VARCHAR(10),
  order_time TIMESTAMP,

  -- new analytics columns
  unit_price NUMERIC(6,2),
  quantity INTEGER DEFAULT 1,
  created_at TIMESTAMP DEFAULT now(),
  order_channel TEXT
);

INSERT INTO customer_orders
(order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES
(1,101,1,'','', '2020-01-01 18:05:02'),
(2,101,1,'','', '2020-01-01 19:00:52'),
(3,102,1,'','', '2020-01-02 23:51:23'),
(3,102,2,'',NULL,'2020-01-02 23:51:23'),
(4,103,1,'4','', '2020-01-04 13:23:46'),
(4,103,1,'4','', '2020-01-04 13:23:46'),
(4,103,2,'4','', '2020-01-04 13:23:46'),
(5,104,1,'null','1','2020-01-08 21:00:29'),
(6,101,2,'null','null','2020-01-08 21:03:13'),
(7,105,2,'null','1','2020-01-08 21:20:29'),
(8,102,1,'null','null','2020-01-09 23:54:33'),
(9,103,1,'4','1, 5','2020-01-10 11:22:59'),
(10,104,1,'null','null','2020-01-11 18:34:49'),
(10,104,1,'2, 6','1, 4','2020-01-11 18:34:49');

-- =========================================================
-- RUNNER ORDERS (ENHANCED)
-- =========================================================
CREATE TABLE runner_orders (
  order_id INTEGER,
  runner_id INTEGER,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(30),

  -- new analytics columns
  delivery_status TEXT,
  customer_rating INTEGER
);

INSERT INTO runner_orders
(order_id, runner_id, pickup_time, distance, duration, cancellation)
VALUES
(1,1,'2020-01-01 18:15:34','20km','32 minutes',''),
(2,1,'2020-01-01 19:10:54','20km','27 minutes',''),
(3,1,'2020-01-03 00:12:37','13.4km','20 mins',NULL),
(4,2,'2020-01-04 13:53:03','23.4','40',NULL),
(5,3,'2020-01-08 21:10:57','10','15',NULL),
(6,3,'null','null','null','Restaurant Cancellation'),
(7,2,'2020-01-08 21:30:45','25km','25mins','null'),
(8,2,'2020-01-10 00:15:02','23.4 km','15 minute','null'),
(9,2,'null','null','null','Customer Cancellation'),
(10,1,'2020-01-11 18:50:20','10km','10minutes','null');

-- =========================================================
-- PIZZAS
-- =========================================================
CREATE TABLE pizza_names (
  pizza_id INTEGER,
  pizza_name TEXT
);

INSERT INTO pizza_names VALUES
(1,'Meatlovers'),
(2,'Vegetarian'),
(3,'Supreme');

CREATE TABLE pizza_recipes (
  pizza_id INTEGER,
  toppings TEXT
);

INSERT INTO pizza_recipes VALUES
(1,'1, 2, 3, 4, 5, 6, 8, 10'),
(2,'4, 6, 7, 9, 11, 12'),
(3,'1,3,5,6,8,9,10,11');

CREATE TABLE pizza_toppings (
  topping_id INTEGER,
  topping_name TEXT
);

INSERT INTO pizza_toppings VALUES
(1,'Bacon'),
(2,'BBQ Sauce'),
(3,'Beef'),
(4,'Cheese'),
(5,'Chicken'),
(6,'Mushrooms'),
(7,'Onions'),
(8,'Pepperoni'),
(9,'Peppers'),
(10,'Salami'),
(11,'Tomatoes'),
(12,'Tomato Sauce');

-- =========================================================
-- ADD MORE REALISTIC ORDERS (FEB – APR)
-- =========================================================
INSERT INTO customer_orders
(order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES
(11,101,1,NULL,NULL,'2020-02-01 17:45:12'),
(11,101,2,'4','1','2020-02-01 17:45:12'),
(12,106,1,NULL,'6','2020-02-02 19:10:55'),
(13,102,2,NULL,NULL,'2020-02-05 20:22:30'),
(14,107,1,'5',NULL,'2020-02-07 18:55:00'),
(15,103,1,NULL,'4,6','2020-02-08 12:30:45'),
(15,103,3,NULL,NULL,'2020-02-08 12:30:45'),
(16,104,2,'4,6','5','2020-02-09 21:15:20'),
(17,101,1,NULL,NULL,'2020-02-14 18:40:10'),
(18,105,2,NULL,'1,7','2020-02-15 19:05:33'),
(19,108,1,'3',NULL,'2020-02-16 20:50:22'),
(20,102,1,NULL,NULL,'2020-02-21 17:22:47'),
(20,102,1,NULL,NULL,'2020-02-21 17:22:47'),
(21,109,2,NULL,NULL,'2020-03-03 18:12:09'),
(22,101,3,NULL,'4','2020-03-04 19:30:55'),
(23,110,1,'4,5',NULL,'2020-03-06 20:45:30'),
(24,104,2,NULL,'6,9','2020-03-07 21:10:15'),
(25,106,1,NULL,NULL,'2020-03-10 17:55:40'),
(26,107,3,'1','5','2020-03-12 18:20:22'),
(27,103,1,NULL,'1,3','2020-03-14 19:45:10'),
(28,102,2,'6',NULL,'2020-03-15 20:05:33'),
(29,105,1,NULL,NULL,'2020-03-18 18:30:00'),
(30,108,2,NULL,'4','2020-03-20 19:15:45'),
(31,101,1,'4',NULL,'2020-04-01 17:40:20'),
(32,111,2,NULL,'1,5','2020-04-03 20:55:12'),
(33,104,3,NULL,NULL,'2020-04-05 18:10:50'),
(34,106,1,'5,6','7','2020-04-07 19:25:33'),
(35,109,2,NULL,NULL,'2020-04-10 21:00:15'),
(36,102,1,NULL,'6','2020-04-12 17:50:40'),
(37,107,3,'3',NULL,'2020-04-15 20:30:22'),
(38,110,2,'4','1','2020-04-18 18:45:55'),
(39,103,1,NULL,NULL,'2020-04-20 19:10:10'),
(40,105,1,NULL,'4,6','2020-04-22 20:20:30'),
(41,101,2,NULL,NULL,'2020-04-25 18:15:45'),
(42,108,1,'4','5','2020-04-28 19:35:20');

INSERT INTO runner_orders
(order_id, runner_id, pickup_time, distance, duration, cancellation)
VALUES
(11,1,'2020-02-01 18:00:45','18km','28 minutes',NULL),
(12,3,'2020-02-02 19:25:10','9.5km','18 mins',NULL),
(13,2,'2020-02-05 20:40:22','22km','35 minutes',NULL),
(14,4,'2020-02-07 19:10:55','15km','25 mins',NULL),
(15,1,'2020-02-08 12:50:30','12.8km','20 minutes',NULL),
(16,5,'2020-02-09 21:35:15','null','null','Customer Cancellation'),
(17,2,'2020-02-14 19:00:40','14km','22 mins',NULL),
(18,3,'2020-02-15 19:30:00','20.5km','30 minutes',NULL),
(19,4,NULL,NULL,NULL,'Restaurant Cancellation'),
(20,1,'2020-02-21 17:45:55','16km','26 mins',NULL),
(41,2,'2020-04-25 18:40:10','19km','29 minutes',NULL),
(42,5,'2020-04-28 19:55:33','11km','17 mins',NULL);

-- =========================================================
-- MAY 2020 – PRICED ORDERS
-- =========================================================
INSERT INTO customer_orders
(order_id, customer_id, pizza_id, exclusions, extras, order_time, unit_price, quantity, order_channel)
VALUES
(43,101,1,NULL,NULL,'2020-05-01 18:12:20',12.00,1,'APP'),
(43,101,2,'4','1','2020-05-01 18:12:20',10.00,1,'APP'),
(44,112,3,NULL,'4','2020-05-02 19:05:44',14.00,1,'WEB'),
(45,103,1,'4',NULL,'2020-05-03 17:50:30',12.00,2,'APP'),
(46,104,2,NULL,NULL,'2020-05-05 20:15:10',10.00,1,'APP'),
(47,105,1,NULL,'1,5','2020-05-07 19:22:45',12.00,1,'WEB'),
(48,106,3,'11',NULL,'2020-05-09 18:40:00',14.00,1,'APP'),
(49,107,2,'6','4','2020-05-10 20:30:55',10.00,2,'APP'),
(50,108,1,NULL,NULL,'2020-05-12 18:10:15',12.00,1,'PHONE'),
(51,109,3,NULL,'1,3','2020-05-14 19:45:20',14.00,1,'WEB'),
(52,110,2,NULL,NULL,'2020-05-16 21:05:33',10.00,1,'APP'),
(53,111,1,'5','6','2020-05-18 17:55:40',12.00,1,'APP'),
(54,101,3,NULL,NULL,'2020-05-20 18:35:12',14.00,2,'APP'),
(55,102,1,NULL,NULL,'2020-05-22 19:15:48',12.00,1,'WEB'),
(56,104,2,'4',NULL,'2020-05-24 20:05:05',10.00,1,'APP');

-- =====================================================
-- RUNNER ORDERS – MAY 2020 (for order_id 43 – 56)
-- =====================================================

INSERT INTO pizza_runner.runner_orders
(order_id, runner_id, pickup_time, distance, duration, cancellation, delivery_status, customer_rating)
VALUES
(43, 2, '2020-05-01 18:25:40', '14km',  '22 minutes', NULL, 'DELIVERED', 5),
(44, 4, '2020-05-02 19:18:30', '18km',  '28 minutes', NULL, 'DELIVERED', 4),
(45, 1, '2020-05-03 18:05:10', '11.5km','20 minutes', NULL, 'DELIVERED', 5),
(46, 3, '2020-05-05 20:30:55', '9km',   '17 minutes', NULL, 'DELIVERED', 4),
(47, 5, '2020-05-07 19:40:12', '13km',  '21 minutes', NULL, 'DELIVERED', 4),
(48, 2, '2020-05-09 18:55:40', '16km',  '25 minutes', NULL, 'DELIVERED', 5),
(49, 1, '2020-05-10 20:48:20', '10.5km','19 minutes', NULL, 'DELIVERED', 4),
(50, 3, '2020-05-12 18:24:55', '12km',  '20 minutes', NULL, 'DELIVERED', 5),
(51, 4, '2020-05-14 20:00:40', '17km',  '27 minutes', NULL, 'DELIVERED', 4),
(52, 2, '2020-05-16 21:20:10', '15km',  '23 minutes', NULL, 'DELIVERED', 5),
(53, 5, '2020-05-18 18:10:30', '8.5km', '16 minutes', NULL, 'DELIVERED', 4),
(54, 1, '2020-05-20 18:50:35', '14.2km','24 minutes', NULL, 'DELIVERED', 5),
(55, 3, '2020-05-22 19:32:10', '11km',  '19 minutes', NULL, 'DELIVERED', 4),
(56, 4, '2020-05-24 20:18:45', '13.5km','22 minutes', NULL, 'DELIVERED', 5);


-- =========================================================
-- BACKFILL PRICES FOR OLD DATA
-- =========================================================
UPDATE customer_orders
SET unit_price =
CASE pizza_id
  WHEN 1 THEN 12.00
  WHEN 2 THEN 10.00
  WHEN 3 THEN 14.00
END
WHERE unit_price IS NULL;

-- =========================================================
-- DELIVERY STATUS NORMALISATION
-- =========================================================
UPDATE runner_orders
SET delivery_status =
CASE
  WHEN cancellation IS NULL OR cancellation = '' OR cancellation = 'null'
    THEN 'DELIVERED'
  WHEN cancellation ILIKE '%customer%'
    THEN 'CUSTOMER_CANCELLED'
  WHEN cancellation ILIKE '%restaurant%'
    THEN 'RESTAURANT_CANCELLED'
  ELSE 'OTHER'
END;

-- =========================================================
-- OPTIONAL SAMPLE RATINGS
-- =========================================================
UPDATE runner_orders
SET customer_rating = (floor(random()*5)+1)
WHERE delivery_status = 'DELIVERED';
