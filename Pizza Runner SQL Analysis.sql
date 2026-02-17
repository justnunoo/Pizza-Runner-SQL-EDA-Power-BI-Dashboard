select *
from pizza_runner.runners;

select *
from pizza_runner.customer_orders;

-- Cleaning this order table

-- 1. Ensure consistency in no-value representation
update pizza_runner.customer_orders
set exclusions = NULL
where exclusions in ('null', '');

update pizza_runner.customer_orders
set extras = NULL
where extras in ('null', '');

-- 2. Remove leading/trailing spaces and standardize comma format
--    (remove space after comma)

update pizza_runner.customer_orders
set exclusions = trim(replace(exclusions, ', ', ','))
where exclusions is not null;

update pizza_runner.customer_orders
set extras = trim(replace(extras, ', ', ','))
where extras is not null;


select *
from pizza_runner.customer_orders;

-- Cleaning runner orders table

-- 1. Ensure consistency in no-value representation
update pizza_runner.runner_orders
set cancellation = null
where cancellation in ('null', '');

update pizza_runner.runner_orders
set duration = null
where duration in ('null', '');

update pizza_runner.runner_orders
set distance = null
where distance in ('null', '');

update pizza_runner.runner_orders
set pickup_time = null
where pickup_time in ('null', '');

-- standardize values in duration column
select 
duration,
regexp_replace(duration, '\D', '', 'g') as time
from pizza_runner.runner_orders;

update pizza_runner.runner_orders
set duration = regexp_replace(duration, '\D', '', 'g')
where duration is not null;

-- standardize values in the distance column
select
distance,
regexp_replace(distance, '[^0-9.]','', 'g')
from pizza_runner.runner_orders;

update pizza_runner.runner_orders
set distance = regexp_replace(distance, '[^0-9.]', '', 'g')
where distance is not null;

-- change pickup_time data type to Timestamp
alter table pizza_runner.runner_orders
add column pickup timestamp;

UPDATE pizza_runner.runner_orders
SET pickup = 
    CASE 
        WHEN pickup_time ~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$'
        THEN pickup_time::TIMESTAMP
        ELSE NULL
    END;


-- doing it by altering the data type directly
ALTER TABLE pizza_runner.runner_orders
ALTER COLUMN pickup_time TYPE TIMESTAMP
USING pickup_time::TIMESTAMP;

select *
from pizza_runner.runner_orders;

select *
from pizza_runner.pizza_names;

select *
from pizza_runner.pizza_recipes;

update pizza_runner.pizza_recipes
set toppings = replace(toppings, ', ', '');