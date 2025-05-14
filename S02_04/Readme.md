# MongoDB Restaurant Queries Challenge

This project contains a set of **32 MongoDB query exercises** based on a collection of **Restaurant** documents in **New York City**. The goal is to help learners practice a variety of MongoDB query techniques including filtering, projection, sorting, and working with arrays and embedded documents.

---

## 📋 Query Tasks

1. Display all documents in the `Restaurants` collection.
2. Display `restaurant_id`, `name`, `borough`, and `cuisine` for all documents.
3. Display `restaurant_id`, `name`, `borough`, and `cuisine`, excluding the `_id` field.
4. Display `restaurant_id`, `name`, `borough`, and `zipcode`, excluding the `_id` field.
5. Display all restaurants located in the **Bronx**.
6. Display the **first 5** restaurants in the **Bronx**.
7. Display the **next 5** restaurants after skipping the first 5 in the **Bronx**.
8. Find restaurants with a **score greater than 90**.
9. Find restaurants with a **score between 81 and 99** (exclusive).
10. Find restaurants with **latitude less than -95.754168**.
11. Find restaurants that do **not serve 'American' cuisine**, have a **score > 70**, and **longitude < -65.754168**.
12. Perform the previous query **without using `$and`**.
13. Find restaurants that **do not serve 'American' cuisine**, received a **grade 'A'**, and are **not in Brooklyn**. Sort by **cuisine descending**.
14. Find `restaurant_id`, `name`, `borough`, and `cuisine` for restaurants whose **name starts with 'Wil'**.
15. Find `restaurant_id`, `name`, `borough`, and `cuisine` for restaurants whose **name ends with 'ces'**.
16. Find `restaurant_id`, `name`, `borough`, and `cuisine` for restaurants whose **name contains 'Reg'**.
17. Find restaurants in the **Bronx** that serve **American or Chinese cuisine**.
18. Find `restaurant_id`, `name`, `borough`, and `cuisine` for restaurants in **Staten Island, Queens, Bronx, or Brooklyn**.
19. Find `restaurant_id`, `name`, `borough`, and `cuisine` for restaurants **not in Staten Island, Queens, Bronx, or Brooklyn**.
20. Find `restaurant_id`, `name`, `borough`, and `cuisine` for restaurants with a **score of 10 or less**.
21. Find restaurants that **serve fish** (excluding 'American' and 'Chinese') **or** have a **name starting with 'Wil'**.
22. Find `restaurant_id`, `name`, and `grades` for restaurants with **grade 'A'**, **score 11**, and **ISODate '2014-08-11T00:00:00Z'**.
23. Find `restaurant_id`, `name`, and `grades` where the **second element** in `grades` has **grade 'A'**, **score 9**, and **ISODate '2014-08-11T00:00:00Z'**.
24. Find `restaurant_id`, `name`, `address`, and geolocation where the **second coordinate** is between **42 and 52**.
25. Sort restaurant names in **ascending order**, displaying all fields.
26. Sort restaurant names in **descending order**, displaying all fields.
27. Sort **cuisine in ascending order**, then sort **borough in descending order** within each cuisine group.
28. Find all addresses that **do not contain the word "street"**.
29. Select all documents where the `coord` value is of **type Double**.
30. Select `restaurant_id`, `name`, and `grade` where the **score is divisible by 7**.
31. Find `name`, `borough`, **longitude**, **latitude**, and `cuisine` for restaurants that **contain 'mon'** in the name.
32. Find `name`, `borough`, **longitude**, **latitude**, and `cuisine` for restaurants whose **name starts with 'Mad'**.

---

## 🎯 Certification Levels

- ✅ **Level 1**: Complete at least **17** correct queries.
- ✅ **Level 2**: Complete **17 to 25** correct queries.
- ✅ **Level 3**: Complete **more than 25** correct queries.

---

## 📦 Dataset

Download the dataset used in this challenge:

**restaurants.zip** (contains MongoDB dump of the restaurants collection)

---

## 🛠 Requirements

- MongoDB (local or cloud instance)
- MongoDB Compass or Mongo Shell

---

## 📘 How to Use

1. Unzip `restaurants.zip`.
2. Restore the data using:

```bash
mongorestore --db restaurants ./restaurants
