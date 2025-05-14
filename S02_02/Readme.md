# 🏬🧑‍🎓 SQL Practice: Tienda & Universidad Databases

This project contains SQL exercises designed to practice and strengthen your database querying skills using two relational database schemas: **Tienda (Store)** and **Universidad (University)**. You will perform a variety of queries, including data retrieval, aggregation, joins, and advanced filtering.

---

## 📦 Tienda Database

This database consists of two main tables:

- **producto** (`codigo`, `nombre`, `precio`, `codigo_fabricante`)
- **fabricante** (`codigo`, `nombre`)

The `codigo_fabricante` in `producto` references the `codigo` in `fabricante`.

### 🧠 Query Challenges

You’ll practice SQL concepts such as:

- Basic data retrieval
- Column aliasing and formatting (uppercase, lowercase, rounding, truncating)
- Currency conversion (EUR to USD)
- Filtering by conditions
- Using `ORDER BY`, `LIMIT`, `DISTINCT`
- Aggregates with `GROUP BY`
- Subqueries
- Joins (`INNER JOIN`, `LEFT JOIN`, etc.)
- Pattern matching (`LIKE`, wildcards)
- Manufacturer-specific queries

---

## 🎓 Universidad Database

You'll explore a more complex academic system with students, professors, departments, subjects, enrollments, and school years.

### 🔍 Topics Covered

- Retrieve student names, birth years, and missing data
- Identify professors based on departments and attributes
- List subjects by semester, year, or degree program
- Combine tables using joins for department, course, and enrollment insights
- Count, group, and filter with advanced aggregations
- Identify unmatched data using `LEFT JOIN`, `RIGHT JOIN`

---

## 🧪 Sample Query Categories

### Tienda

- List all product names and prices
- Show products in USD with column aliases
- Round or truncate prices
- Sort products by multiple criteria
- Filter products by manufacturer
- Match manufacturer names with patterns
- Use `IN`, `NOT IN`, and subqueries
- Identify products with max/min prices per manufacturer

### Universidad

- List students or professors with missing data
- Query subjects by semester and degree
- Join professors with departments
- Group students by school year
- Count professors per department
- List professors with or without assigned courses

---

## ✅ Evaluation Levels

- **Level 1**: 37 correct queries (at least 20 from Universidad)
- **Level 2**: 37–56 correct queries (at least 20 from Universidad)
- **Level 3**: Over 56 correct queries (at least 20 from Universidad)

---

## 🗂️ File Structure

📂 sql-practice/
├── 📄 README.md
├── 📄 tienda_queries.sql
├── 📄 universidad_queries.sql
├── 📄 schema_tienda.sql
├── 📄 schema_universidad.sql

## 🚀 Submission Guidelines

- Each exercise should be delivered in a single `.sql` file.
- Each SQL query must be written on **a single line** (regardless of its length).
- Optionally, include a commented `.sql` file with explanations for readability.

---

## 📥 Resources

- [`schema_tienda.zip`](./schema_tienda.zip)
- [`schema_universidad.zip`](./schema_universidad.zip)

---
