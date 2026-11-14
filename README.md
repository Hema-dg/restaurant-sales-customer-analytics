# Restaurant Sales & Customer Analytics

## 📌 Project Overview

This project focuses on analyzing restaurant sales and customer data using SQL. The analysis covers customer behavior, order patterns, menu performance, sales revenue, payment methods, and customer feedback.

The project uses a synthetic restaurant dataset created for analytical purposes.

## 🎯 Project Objectives

- Analyze overall restaurant sales and revenue performance.
- Identify sales trends over time.
- Analyze customer purchasing behavior and spending patterns.
- Identify top-performing and underperforming menu items.
- Analyze payment methods and payment performance.
- Analyze customer feedback and ratings.
- Generate meaningful business insights using SQL.

## 🗄️ Database Tables

The database contains six tables:

1. **Customer** – Stores customer information.
2. **Menu** – Stores restaurant menu item information.
3. **Orders** – Stores customer order information.
4. **OrderDetails** – Stores individual menu items included in each order.
5. **Payment** – Stores payment information for orders.
6. **Feedback** – Stores customer ratings and feedback for orders.

## 📊 Dataset

| Table | Records |
|---|---:|
| Customer | 100 |
| Menu | 30 |
| Orders | 500 |
| OrderDetails | 928 |
| Payment | 500 |
| Feedback | 500 |

## 🔗 Database Relationships

- Customer → Orders
- Orders → OrderDetails
- Menu → OrderDetails
- Orders → Payment
- Orders → Feedback

## 💻 SQL Concepts Used

- Database and table creation
- Primary Keys and Foreign Keys
- NOT NULL, UNIQUE and CHECK constraints
- INSERT, UPDATE and DELETE
- SELECT and filtering
- WHERE, AND, OR and NOT
- IN, BETWEEN and LIKE
- DISTINCT
- Aggregate functions
- GROUP BY and HAVING
- ORDER BY and LIMIT
- INNER JOIN
- LEFT JOIN
- Multiple-table JOINs
- Subqueries
- Correlated Subqueries
- EXISTS and NOT EXISTS
- UNION and UNION ALL
- CASE
- COALESCE
- String functions
- Date functions
- CTE
- Window functions
- Views
- Indexes
- Transactions
- GRANT and REVOKE

## 📈 Analysis Areas

### Sales & Revenue Analysis

- Total revenue
- Revenue by payment method
- Revenue by menu category
- Daily revenue
- Monthly revenue
- Average order value

### Customer Analysis

- Orders by customer
- Top customers by number of orders
- Top customers by spending
- Orders by customer city
- Customer purchasing behavior

### Menu Analysis

- Top-selling menu items
- Menu category performance
- Revenue by menu item
- Popular menu categories
- Menu performance comparison

### Order Analysis

- Total orders
- Orders by status
- Completed and cancelled orders
- Cancellation rate
- Order patterns

### Payment Analysis

- Payment method usage
- Payment status analysis
- Revenue by payment method

### Feedback Analysis

- Average customer rating
- Rating distribution
- Customer satisfaction analysis
- Rating-based analysis

## 🛠️ Tools & Technologies

- **MySQL**
- **MySQL Workbench**
- **SQL**

## 📁 Project Files

- `restaurant_analytics.sql` – Contains database creation, table definitions, data generation, SQL queries and analysis.
- `README.md` – Project documentation.

## 🚀 Project Outcome

The project transforms restaurant data into meaningful analytical information using SQL. The analysis helps understand sales performance, customer behavior, menu performance, payment patterns, and customer satisfaction.

## 👩‍💻 Project Type

**SQL Data Analytics Project**



## ▶️ How to Run

1. Install MySQL and MySQL Workbench.
2. Download `restaurant_analytics.sql` from this repo.
3. Open the file in MySQL Workbench.
4. Run the script from top to bottom (click the lightning bolt icon, or press Ctrl+Shift+Enter).
5. The script creates the database and tables, inserts the data, and runs all the analysis queries.
