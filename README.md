# High-Value Customers SQL Analysis

## Problem Statement

You are working as a data analyst for an e-commerce company. The management team wants a performance report of high-value customers.

A high-value customer is defined as:

* A customer whose total spending is above the overall average customer spending.
* The customer must have placed at least 2 orders.

The report should include:

* Customer name
* Total number of orders
* Total amount spent
* Average order value

The result should be ordered by customer name.

---

# Input Tables

## customers

| customer_id | customer_name | country |
| ----------- | ------------- | ------- |
| 1           | Alice         | India   |
| 2           | Bob           | USA     |
| 3           | Charlie       | India   |
| 4           | Diana         | UK      |
| 5           | Evan          | USA     |

---

## orders

| order_id | customer_id | order_date | order_amount |
| -------- | ----------- | ---------- | ------------ |
| 101      | 1           | 2024-01-05 | 500          |
| 102      | 1           | 2024-01-15 | 700          |
| 103      | 2           | 2024-01-10 | 300          |
| 104      | 3           | 2024-01-12 | 400          |
| 105      | 3           | 2024-01-18 | 600          |
| 106      | 4           | 2024-01-20 | 200          |
| 107      | 5           | 2024-01-22 | 1000         |
| 108      | 5           | 2024-01-25 | 1200         |

---

# SQL Concepts Used

* JOIN
* Common Table Expressions (CTEs)
* GROUP BY
* Aggregate Functions

  * COUNT()
  * SUM()
  * AVG()
* Subqueries
* Filtering with WHERE
* Ordering with ORDER BY

---

# Solution Approach

## Step 1: Create Customer Summary

First, create a summarized table containing:

* total number of orders per customer
* total spending per customer
* average order value per customer

This is done using:

* JOIN between customers and orders
* GROUP BY customer
* aggregate functions

---

## Step 2: Calculate Overall Average Customer Spending

The business requirement asks for:

> Customers whose total spending is above the overall average customer spending.

This means:

1. Calculate total spending for each customer.
2. Compute the average of those customer totals.

---

## Step 3: Filter High-Value Customers

Filter customers where:

* total_orders >= 2
* total_spent > average customer spending


# Expected Output

| customer_name | total_orders | total_spent | avg_order_value |
| ------------- | ------------ | ----------- | --------------- |
| Alice         | 2            | 1200        | 600             |
| Charlie       | 2            | 1000        | 500             |
| Evan          | 2            | 2200        | 1100            |

---




# Query Execution Flow

```text
customers + orders
        ↓
      JOIN
        ↓
customer_summary CTE
        ↓
Calculate customer metrics
        ↓
Compute average customer spending
        ↓
Filter high-value customers
        ↓
Order final results
```

---

# Skills Practiced

* SQL analytical thinking
* Data aggregation
* Business logic translation
* Intermediate SQL querying
* CTE design
* Aggregate filtering

Complied from TheQueryLab :https://www.thequerylab.com/
