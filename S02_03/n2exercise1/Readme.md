Level 2 - Exercise 1: Food Delivery Ordering System

This project involves designing and modeling a database for an online food ordering website.
Project Description

The website allows customers to place orders for food (pizzas, hamburgers, and drinks) online, choosing between home delivery or in-store pickup. Each order is managed by a specific store, which also has assigned employees.
Requirements and Data Model

    Customer
    Stores a unique identifier and personal information: first name, last name, address, postal code, city, province, and phone number.

    Order
    Each order has a unique ID, date and time of placement, type (delivery or pickup), quantity per product type, total price, and an additional notes field.
    An order is placed by one customer, but a customer can place many orders.

    Products
    Types include pizzas, hamburgers, and drinks. Each product has a unique ID, name, description, image, and price.
    Pizza categories may vary throughout the year.

    Store
    Each store has a unique ID and stores address, postal code, city, and province.
    A store manages many orders, but each order is managed by only one store.

    Employees
    Each employee works at only one store.
    Stores first name, last name, tax ID (NIF), phone number, and role (cook or delivery person).
    For delivery orders, the delivery person and the delivery date/time are recorded.

Database Structure (summary)

    Customers (id, first_name, last_name, address, postal_code, city, province, phone)

    Orders (id, datetime, type, total_price, notes, customer_id, store_id, delivery_person_id, delivery_datetime)

    Products (id, name, description, image, price, pizza_category)

    Stores (id, address, postal_code, city, province)

    Employees (id, first_name, last_name, tax_id, phone, role, store_id)