# Data Catalog for Gold Layer

## Overview
The **Gold Layer** is a business-level data representation designed for analytical and reporting purposes. It consists of **dimension tables** and **fact tables** that store structured business metrics.

---

## Dimension Tables

### `gold.dim_customers`
Stores customer information with demographic and geographic attributes.

#### **Schema:**

| Column Name      | Data Type     | Description                                      |
|------------------|--------------|--------------------------------------------------|
| `customer_key`   | INT          | Surrogate key for each customer.                 |
| `customer_id`    | INT          | Unique identifier for the customer.              |
| `customer_number`| NVARCHAR(50) | Alphanumeric reference code.                      |
| `first_name`     | NVARCHAR(50) | Customer's first name.                           |
| `last_name`      | NVARCHAR(50) | Customer's last name.                            |
| `country`        | NVARCHAR(50) | Customer's country of residence.                 |
| `marital_status` | NVARCHAR(50) | Marital status ('Married', 'Single', etc.).      |
| `gender`         | NVARCHAR(50) | Gender ('Male', 'Female', 'n/a').                |
| `birthdate`      | DATE         | Date of birth (YYYY-MM-DD).                      |
| `create_date`    | DATE         | Record creation timestamp.                       |

---

### `gold.dim_products`
Provides product details, attributes, and classifications.

#### **Schema:**

| Column Name           | Data Type     | Description                                         |
|-----------------------|--------------|-----------------------------------------------------|
| `product_key`        | INT          | Surrogate key for each product.                     |
| `product_id`         | INT          | Unique identifier for the product.                  |
| `product_number`     | NVARCHAR(50) | Structured product code.                            |
| `product_name`       | NVARCHAR(50) | Descriptive name (e.g., type, color, size).        |
| `category_id`       | NVARCHAR(50) | Unique identifier for the category.                |
| `category`          | NVARCHAR(50) | High-level classification (e.g., 'Bikes').         |
| `subcategory`       | NVARCHAR(50) | Detailed classification (e.g., 'Mountain Bikes').  |
| `maintenance_required`| NVARCHAR(50) | Indicates maintenance requirement ('Yes', 'No').   |
| `cost`              | INT          | Base price in monetary units.                      |
| `product_line`      | NVARCHAR(50) | Product series (e.g., 'Road', 'Mountain').         |
| `start_date`        | DATE         | Availability start date.                           |

---

## Fact Tables

### `gold.fact_sales`
Stores transactional sales data for business analytics.

#### **Schema:**

| Column Name     | Data Type     | Description                                   |
|-----------------|--------------|-----------------------------------------------|
| `order_number`  | NVARCHAR(50) | Unique order identifier (e.g., 'SO54496').   |
| `product_key`   | INT          | Links to `dim_products`.                     |
| `customer_key`  | INT          | Links to `dim_customers`.                    |
| `order_date`    | DATE         | Date when the order was placed.              |
| `shipping_date` | DATE         | Date when the order was shipped.             |
| `due_date`      | DATE         | Payment due date.                            |
| `sales_amount`  | INT          | Total sale value in currency units.          |
| `quantity`      | INT          | Number of units sold.                        |
| `price`         | INT          | Price per unit of the product.               |

---
