# IceCity Heating Management System 🔥

## 📌 Project Overview

IceCity is a database system designed to manage heating usage in a frozen city.
It tracks house owners, houses, heaters, daily usage, and monthly reports.

The system focuses on:

* Data integrity
* Efficient querying
* Business logic implementation using SQL

---

## 🧱 Database Design

The system consists of the following tables:

* **Owners** → stores owner information
* **Houses** → each owner can have multiple houses
* **Heaters** → each house contains multiple heaters
* **DailyUsage** → tracks daily working hours of heaters
* **MonthlyReport** → stores aggregated monthly data

### 🔗 Relationships

* Owner → Houses (1:N)
* House → Heaters (1:N)
* Heater → DailyUsage (1:N)
* House → MonthlyReport (1:N)

### ✅ Constraints Used

* Primary Keys
* Foreign Keys
* NOT NULL
* CHECK constraints (e.g. working hours ≤ 24, power > 0)
* UNIQUE constraints to prevent duplicate data

---

## 📥 Data Insertion

Dummy data was inserted to simulate real-world usage:

* 3 Owners
* Each Owner has 2 Houses
* Each House has 2 Heaters
* Each Heater has 30 DailyUsage records
* Each House has MonthlyReport

### 🔥 Automation

A trigger was implemented to automatically generate **DailyUsage** records when a heater is inserted.

---

## 🔍 Queries (Part 2)

SQL queries were written to simulate real-world operations such as:

* Retrieving houses for a specific owner
* Listing heaters in a house
* Filtering high usage (> 8 hours)
* Monthly report filtering
* Sorting houses by cost
* Calculating:

  * Total working hours per house per month
  * Average working hours per heater
  * Maximum heater power per house

### 🎯 Purpose

These queries help in:

* Monitoring usage
* Data analysis
* Supporting decision-making

---

## ⚙️ Stored Procedures

### 1️⃣ CalculateDailyHeaterUsageCost

Calculates the cost of heater usage for a specific day based on:

* Heater power
* Working hours
* Rate

### 2️⃣ CalculateMonthlyReport (Bonus 🔥)

Generates a full monthly report for a house by:

* Aggregating daily usage
* Calculating total hours
* Calculating total cost
* Performing UPSERT (Update or Insert)

### 🎯 Purpose

* Centralize business logic
* Avoid code duplication
* Improve maintainability

---

## 👁️ Views

### 1️⃣ vw_HouseHeaterSummary

Provides a simplified view of:

* HouseId
* HeaterId
* HeaterType
* PowerValue

### 2️⃣ vw_MonthlyCostSummary

Displays:

* HouseId
* ReportMonth
* TotalWorkingHours
* MonthlyAverageCost

### 🎯 Purpose

* Simplify complex joins
* Improve readability
* Provide clean data for UI / API

---

## ⚡ Triggers

### 🔥 trg_UpdateMonthlyReport

Automatically updates the monthly report whenever new daily usage is inserted.

### 🎯 Purpose

* Maintain real-time data consistency
* Automate updates
* Reduce manual operations

---

## 🧠 Key Concepts Applied

* SQL DDL & DML
* Joins & Aggregations
* GROUP BY & HAVING
* Stored Procedures
* Views
* Triggers
* Data Integrity & Constraints

---

## 📦 Project Structure

```
week2/
│
├── tables.sql
├── insert_data.sql
├── queries.sql
├── stored_procedures.sql
├── views.sql
├── triggers.sql
└── README.md
```

---

## 🚀 Conclusion

This project demonstrates a complete database system with:

* Clean schema design
* Realistic data
* Advanced SQL queries
* Business logic encapsulation
* Automation using triggers

It is designed to simulate real-world backend database development.

---
