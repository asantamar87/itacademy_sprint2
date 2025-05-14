
1. db.restaurants.find()
2. db.restaurants.find({},{ _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1})
3. db.restaurants.find({},{ _id: 0,restaurant_id: 1, name: 1,borough: 1,cuisine: 1});
4. db.restaurants.find( {}, { _id: 0, restaurant_id: 1, name: 1, borough: 1,  "address.zipcode": 1 });
5. db.restaurants.find({ borough: "Bronx" });
6. db.restaurants.find({ borough: "Bronx" }).limit(5);
7. db.Restaurants.find({ borough: "Bronx" }).skip(5).limit(5);
8. db.Restaurants.find({ "grades.score": { $gt: 90 } });

8.1 db.restaurants.find(
  { "grades.score": { $gt: 90 } }, 
  { name: 1, grades: { $elemMatch: { score: { $gt: 90 } } }, _id: 0 }
).pretty();

9. db.restaurants.find({ "grades.score": { $gt: 80, $lt: 100 } });

9.1 db.restaurants.find(
  { "grades.score": { $gt: 80, $lt: 100 } },
  { name: 1, grades: { $elemMatch: { score: { $gt: 80, $lt: 100 } } }, _id: 0 }
).pretty();
10.db.restaurants.find({ "address.coord.0": { $lt: -95.754168 } });
11.db.restaurants.find({"address.coord.0": {$lt: -95.754168}}).pretty();
12.db.restaurants.find({cuisine: {$ne: "American"}, "grades.score":{$gt:70}, "address.coord.0": {$lt: -65.754168}}).pretty();
13.db.restaurants.find({cuisine: {$not: {$eq: "American "}}, "grades.score": {$gt: 70}, "address.coord.0": {$lt: -65.754168}}).pretty();
14.db.restaurants.find({cuisine: {$ne: "American "}, "grades.grade": "A", borough: {$ne: "Brooklyn"}}).sort({cuisine: -1}).pretty();
15.db.restaurants.find({name: {$regex: /^Wil/}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).pretty();
16.db.restaurants.find({name: {$regex:/ces$/}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).pretty();
17.db.restaurants.find({name: {$regex:/Reg/}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).pretty();
18.db.restaurants.find({borough: {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).pretty();
19.db.restaurants.find({_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).pretty();
20.db.restaurants.find({borough: {$nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).pretty();
21.db.restaurants.find({“grades.score”: {$not: {$gt:10}}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).pretty();
22.db.restaurants.find({$or: [{cuisine: {$ne: "American "}}, {cuisine: {$ne: "Chinese"}}, {name: {$regex: /^Wil/}}]}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).pretty();
23.db.restaurants.find({"grades": {$elemMatch: {grade: "A", score: 11, date: ISODate("2014-08-11T00:00:00Z")}}}, {_id: 0, restaurant_id: 1, name: 1, grades: 1}).pretty();
24.db.restaurants.find({"address.coord.1": {$gt: 42, $lt: 53}}, {_id: 0, restaurant_id: 1, name: 1, "address.building": 1, "address.street": 1, "address.zipcode": 1, "address.coord": 1}).pretty();
25.db.restaurants.find().sort({name: 1}).pretty();
26.db.restaurants.find().sort({name: -1}).pretty();
27.db.restaurants.find().sort({cuisine: 1, borough: -1}).pretty();
28.db.restaurants.find({"address.street": {$exists: false}}, {_id: 0, "address": 1}).pretty();
29.db.restaurants.find({"address.coord": {$type: "double"}}).pretty();
30.db.restaurants.find({$expr: {$eq: [{$mod: [{$arrayElemAt: ["$grades.score", 0]}, 7]}, 0]}}, {_id: 0, restaurant_id: 1, name: 1, grades: 1}).pretty();
31.db.restaurants.find({name: {$regex: /mon/i}}, {_id: 0, name: 1, borough: 1, "address.coord": 1, cuisine: 1}).pretty();
32.db.restaurants.find({name: {$regex: /^Mad/i}}, {_id: 0, name: 1, borough: 1, "address.coord": 1, cuisine: 1}).pretty();

