// MONGO DB -------------------------------------------------------------

// SHOW DATABASES:
show dbs
show collections
db.getCollectionNames()

// Tenim una col·lecció d'Objectes Restaurant a la ciutat de Nova York, i necessitem algunes consultes... pots ajudar-nos?
use Restaurants

// 9//     Escriu una consulta per trobar els restaurants que tenen un score més gran que 80 però menys que 100.
//ORIGINAL --> db.Restaurants.find( {"grades.score":{$gt:80, $lt:100}}).pretty();
db.Restaurants.find({ grades: { $elemMatch: {  score: { $gt: 80,  $lt: 100 }  } }}).pretty();


// 11//     Escriu una consulta de MongoDB per a trobar els restaurants que no cuinen menjar 'American ' i tenen algun score superior a 70 i latitud inferior a -65.754168.
db.Restaurants.find( {$and: [ {"cuisine":{$ne:"American "}}, {"grades.score": {$gt:70}}, {"address.coord.0":{$lt:-65.754168}}] }, {}).pretty();

// 14//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Wil' en les tres primeres lletres en el seu nom.
db.Restaurants.find({ "name": {$regex: /^Wil/}} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();


// 18//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per aquells restaurants que pertanyen a Staten Island, Queens, Bronx o Brooklyn.
//ORIGINAL (Without IN) --> db.Restaurants.find({ $or: [{"borough":{$eq:"Staten Island"}},{"borough":{$eq:"Queens"}},{"borough":{$eq:"Bronx"}}]} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();
db.Restaurants.find({ "borough": {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();



// 19//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que NO pertanyen a Staten Island, Queens, Bronx o Brooklyn.
//ORIGINAL (Without NIN) --> db.Restaurants.find({ $nor: [{"borough":{$eq:"Staten Island"}},{"borough":{$eq:"Queens"}},{"borough":{$eq:"Bronx"}},{"borough":{$eq:"Brooklyn"}}]} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();
db.Restaurants.find({ "borough": {$nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();

// 28//     Escriu una consulta per saber si les direccions contenen el carrer.
//Okay I choose this one:
db.Restaurants.find({
	$or: [
	{"address.street":{ $exists: false }},
	{"address.street": {$in: [null, "", " "]}}
	]},{}).pretty();
//Tomorrow I will chose Charmander haha

