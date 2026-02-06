# ZEPTO_SQL_EXCEL_ANALYSIS
SQL and EXCEL analysis of Zepto Product dataset

## Author : Vinay Kumar

## 📌 Project Overview
This project focuses on analyzing Zepto product data to extract meaningful business insights using SQL and Excel.
The objective is to understand product distribution, discounts, inventory status, and sales contribution across categories.

## 📂 Dataset
- Source: Kaggle (Zepto product dataset)
- The dataset includes product-level details such as:
  - Category
  - Product name
  - MRP
  - Discount percentage
  - Discounted selling price
  - Quantity
  - Weight (in grams)
  - Stock availability

## 🛠️ Tools & Technologies
- MySQL – Data cleaning, transformation, and analysis
- Microsoft Excel – Pivot tables and dashboard creation
- GitHub – Project documentation and version control

## 🧹 Data Cleaning (SQL)
- Removed invalid records where MRP = 0
- Verified consistency between stock status and available quantity
- Ensured numeric columns were correctly formatted for analysis

## 📊 Key Analysis Performed
- Category-wise product count
- Top 10 products by quantity sold
- Average discount percentage by category
- Inventory availability (In-stock vs Out-of-stock)
- Total inventory quantity by category
- Revenue calculation using discounted price × quantity

## 📈 Excel Dashboard
- Built pivot tables to support each analysis
- Created a single dashboard with multiple charts for quick insights
- Used clean layout, minimal colors, and clear chart titles
- Added short insight lines for better business interpretation

## 💡 Key Insights
- A few categories contribute most of the total inventory and product count
- Top-selling products drive a major portion of total quantity sold
- Discount levels vary significantly across categories
- Majority of products are currently in stock, indicating healthy inventory

## 📁 Repository Structure
- zepto_analysis.sql – All SQL queries used in the project
- Zepto_SQL_Excel_Dashboard.xlsx – Excel dashboard and analysis
- dashboard_preview.png – Dashboard screenshot (optional)

## 🎯 Conclusion
This project demonstrates practical use of SQL for data analysis and Excel for visualization.
It reflects real-world analytical thinking suitable for entry-level data analyst roles.
