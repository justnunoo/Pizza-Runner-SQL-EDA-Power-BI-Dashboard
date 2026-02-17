🍕 Pizza Runner – SQL EDA & Power BI Dashboard

A complete end-to-end data analytics project where I designed and enriched a relational dataset, performed exploratory data analysis (EDA) using SQL, and built an interactive business dashboard in Power BI (by Microsoft).

This project focuses on operational performance, customer behaviour, and revenue analysis for a fictional pizza delivery company.

📌 Project Overview

The goal of this project was to:

clean and enhance a messy transactional dataset,

model it properly for analytics,

perform EDA using SQL,

and finally build an executive-style dashboard showing operational and commercial KPIs.

The project simulates a real business analytics workflow:
raw operational data → data modelling → EDA → KPI definition → dashboard.

🧱 Dataset & Modelling

The dataset is built around two different data grains:

1. Order item level

Each row represents a pizza ordered.

Table: customer_orders

Key fields:

order_id

customer_id

pizza_id

exclusions

extras

order_time

unit_price (added for analytics)

quantity (added for analytics)

order_channel (APP / WEB / PHONE – added for insight)

created_at

2. Delivery / order level

Each row represents one delivery attempt.

Table: runner_orders

Key fields:

order_id

runner_id

pickup_time

distance

duration

cancellation

Enhanced fields added:

delivery_status
(DELIVERED, CUSTOMER_CANCELLED, RESTAURANT_CANCELLED)

customer_rating

3. Reference tables

runners

pizza_names

pizza_recipes

pizza_toppings

🧠 Data Engineering & Cleaning

The original dataset contained several real-world data issues:

numeric fields stored as text (distance, duration)

inconsistent null values (null, empty strings, NULL)

cancellation reasons stored as free text

no pricing information

no clear delivery outcome indicator

Key improvements I implemented

Introduced a clean delivery_status column derived from cancellation logic.

Added pricing and quantity (unit_price, quantity) to support revenue analysis.

Added order_channel to enable channel performance analysis.

Created realistic additional orders (February–May 2020) to improve time-series analysis.

Added a numeric delivery time column for accurate aggregation in Power BI.

Maintained proper data grain separation (order-item vs delivery).

🔍 Exploratory Data Analysis (SQL)

All EDA was performed using SQL before loading data into Power BI.

Examples of analysis performed:

order volume trends by day and weekday

accepted vs cancelled orders

customer cancellation rate

pizza popularity

revenue by pizza type

runner performance

average delivery time

revenue per order

A major modelling decision was to calculate delivery KPIs only from the runner_orders table to avoid double counting, since customer_orders is at pizza-item level.

📊 Dashboard (Power BI)

The final dashboard focuses on three business areas:

1. Order performance

Total orders

Delivered orders

Accepted orders percentage

Customer cancellation percentage

2. Financial performance

Total revenue

Average order value (AOV)

Revenue per delivered order

Revenue by pizza type

3. Operations

Average delivery time

Average delivery time by day of week

Runner performance comparison

📈 Key KPIs Implemented

Accepted Orders %

Delivered Orders

Customer Cancellation %

Total Revenue

Average Order Value

Revenue per Delivered Order

Average Delivery Time (minutes)

A specific operational insight visual shows:

Average delivery time by day of the week, calculated only for delivered orders.

🛠 Tools & Technologies

SQL (PostgreSQL syntax)

Power BI

Data modelling (star-style relationships)

DAX measures

🧩 Data Model

Relationship used in Power BI:

customer_orders[order_id]  →  runner_orders[order_id]


Cardinality:

Many (customer_orders) → One (runner_orders)


This ensures that:

revenue metrics slice correctly by runner, time and delivery outcome,

delivery KPIs are not inflated by multiple pizzas per order.

📂 Project Structure
/
├── sql/
│   ├── schema_and_data.sql
│   ├── cleaning_and_enrichment.sql
│   └── eda_queries.sql
├── powerbi/
│   └── pizza_runner_dashboard.pbix
└── README.md


(File names may vary depending on how you organise the repo.)

🚀 How to Run This Project

Create a new database.

Run the provided SQL script to create the schema and load the data.

Open the Power BI file.

Update the data source connection to your database.

Refresh the dataset.

💡 Business Questions Answered

What percentage of orders are successfully accepted and delivered?

How often do customers cancel orders?

Which pizza types generate the most revenue?

What is the average delivery time and how does it vary by weekday?

How much revenue is generated per delivered order?

How does ordering behaviour vary by channel?

👤 Author

Justice Samuel Nunoo

Physics & Computing graduate with hands-on experience in:

SQL analytics and data modelling

Power BI dashboard development

business and operational performance reporting

GitHub: GitHub – https://github.com/justnunoo

Portfolio: https://jsn-my-portfolio.vercel.app

📌 Notes

This project was intentionally designed to reflect a realistic analytics workflow, including:

messy operational data,

multiple data grains,

business-driven KPIs,

and modelling decisions that prevent common reporting mistakes (such as double counting orders).
