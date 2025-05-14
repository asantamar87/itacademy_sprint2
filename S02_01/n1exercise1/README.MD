# 🕶️Level 1 - Exercise 1 - "Cul d'Ampolla" Optician — Entity-Relationship Modeling

This project is part of **Level 1 - Exercise 1** in a database course. The goal is to **design and implement a relational database** to manage the operations of an optician shop called _"Cul d'Ampolla"_.

## 📘 Description

The optician wants to modernize the management of its clients, sales, and suppliers. This project defines the **entity-relationship diagrams (ERD)** and their implementation in SQL.

### 🎯 Objectives:
- Accurately model entities such as **suppliers**, **glasses**, **clients**, **employees**, and **sales**.
- Define **clear and efficient relationships** between all entities.
- Enable useful **queries** for business insights.

---

## 🧩 Model Specification

### 👓 Glasses
For each pair of glasses, the system tracks:
- **Brand**
- **Lens prescription** for each side
- **Frame type**: floating, plastic, or metal
- **Frame color**
- **Color of each lens**
- **Price**

Each **brand** is linked to a **single supplier**, but a supplier can offer **multiple brands**.

### 🚚 Suppliers
For each supplier, the following information is stored:
- **Name**
- **Full address**: street, number, floor, door, city, postal code, and country
- **Phone number**
- **Fax**
- **Tax ID (NIF)**

### 👤 Clients
The database stores:
- **Name**
- **Postal address**
- **Phone number**
- **Email address**
- **Registration date**
- **Referred by**: if another client recommended them

### 🧑‍💼 Employees & Sales
Each pair of glasses sold is associated with the **employee** who completed the sale. It also records:
- **Sale date**
- **Sale price**
- **Client who purchased it**

---

## 🧪 Example Queries

- 🔍 List the total number of invoices for a client within a specific period.
- 👓 List the different glasses models sold by an employee during a specific year.
- 📦 List the suppliers who have provided glasses that were successfully sold.

---

## 🛠️ Technologies Used

- **MySQL**
- Entity-Relationship Diagram (ERD)
- 3NF Normalization

---

## 📁 Project Structure

