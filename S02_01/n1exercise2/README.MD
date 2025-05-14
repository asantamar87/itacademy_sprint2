🍕 Exercici 2 - Pizzeria Ordering System

Welcome to the Pizzeria Ordering System project!
This repository contains the design and modeling of a web-based food ordering platform that allows customers to place delivery and pickup orders online.
📘 Project Overview

You’ve been hired to design the database and backend logic for an online ordering system for a local pizza restaurant chain. This system will manage:

    Customers and their personal details

    Orders and their contents

    Products (pizzas, burgers, drinks)

    Pizza categories

    Stores and employees

    Delivery tracking

🧩 Data Model Highlights
👤 Customers

Each customer has:

    A unique ID

    First name & last name

    Address

    Postal code

    City (stored in a separate table)

    Province (stored in a separate table)

    Phone number

    🔗 A city belongs to a single province, but a province can contain multiple cities.

🛒 Orders

Each order has:

    A unique ID

    Date and time

    Delivery or in-store pickup option

    Quantity of each product type

    Total price

    Assigned store

    (If delivery) Assigned delivery employee & delivery timestamp

    📌 Each order is made by one customer, but a customer can place multiple orders.

🍔 Products

Three types of products:

    Pizzas

    Burgers

    Drinks

Each product has:

    A unique ID

    Name

    Description

    Image

    Price

🍕 Pizza Categories

    A pizza belongs to one category

    A category can contain many pizzas

    Category names can change over time

Each category has:

    A unique ID

    Name

🏪 Stores

Each store has:

    A unique ID

    Address

    Postal code

    City

    Province

    🧾 A store handles many orders.

👥 Employees

Each employee has:

    A unique ID

    First name & last name

    NIF (National ID)

    Phone number

    Role: Cook or Delivery

    👨‍🍳 Each employee works at one store.

    🚚 For delivery orders, the system logs who delivered the order and when.