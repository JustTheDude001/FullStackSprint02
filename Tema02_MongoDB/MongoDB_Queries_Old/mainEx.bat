// MONGO DB -------------------------------------------------------------

// SHOW DATABASES:
show dbs
show collections
db.getCollectionNames()

// Tenim una col·lecció d'Objectes Restaurant a la ciutat de Nova York, i necessitem algunes consultes... pots ajudar-nos?
use Restaurants
// 1//     Escriu una consulta per mostrar tots els documents en la col·lecció Restaurants. 
db.Restaurants.find({})
db.Restaurants.find({}).pretty()

// 2//     Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine de tots els documents en la col·lecció Restaurants.
//Simplest Query which shows all restaurant_id - :1 means all 
//db.Restaurants.find({},{restaurant_id:1}).pretty()
db.Restaurants.find({},{restaurant_id:1,name:1, borough:1, cuisine:1}).pretty()
// 3//     Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine, però excloent el camp _id per tots els documents en la col·lecció Restaurants.
db.Restaurants.find({},{_id:0,restaurant_id:1,name:1, borough:1, cuisine:1}).pretty()
// 4//     Escriu una consulta per mostrar restaurant_id, name, borough i zip code, però excloent el camp _id per tots els documents en la col·lecció Restaurants.
db.Restaurants.find({},{_id:0,restaurant_id:1, name:1, borough:1, address:{zipcode:1}}).pretty()
// 5//     Escriu una consulta per mostrar tots els restaurants que estan en el Bronx.
db.Restaurants.find({},{restaurant_id:1,name:1, borough:"Bronx", cuisine:1}).pretty()
// OR
db.Restaurants.find({borough:"Bronx"}).pretty()
// TO TEST:
// db.Restaurants.find({borough:"Bronx"},{borough:1} ).pretty()


// 6//     Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx.
db.Restaurants.find({borough:"Bronx"}).pretty().limit(5)
// 7//     Escriu una consulta per mostrar els 5 restaurants després de saltar els primers 5 que siguin del Bronx.
db.Restaurants.find({borough:"Bronx"}).pretty().limit(5).skip(5)
// 8//     Escriu una consulta per trobar els restaurants que tenen algun score més gran de 90.
db.Restaurants.find( {"grades.score":{$gt:90}}).pretty();
// Notes For The Future
//db.Restaurants.find({}, { grades:{ totalScore: { $avg:"$grades.score"}}} ).pretty();
//db.Restaurants.find({}, {totalScore: { $avg:"$grades.score"}} ).pretty();

// 9//     Escriu una consulta per trobar els restaurants que tenen un score més gran que 80 però menys que 100.
db.Restaurants.find( {"grades.score":{$gt:80, $lt:100}}).pretty();

//WARNING - NOTE
// longitude must lie between [-180, 180] and latitude must lie between [-90,90].
//LONGITUDE [0]
//LATITUDE [1]

// 10//     Escriu una consulta per trobar els restaurants que estan situats en una longitud inferior a -95.754168.
db.Restaurants.find( {"address.coord.0":{$lt:-95.754168}}).pretty();

// 11//     Escriu una consulta de MongoDB per a trobar els restaurants que no cuinen menjar 'American ' i tenen algun score superior a 70 i latitud inferior a -65.754168.
/"cuisine" : "Continental"
//db.Restaurants.find( {cuisine:{$eq:"American"}}, {}).pretty();
//db.Restaurants.find( {cuisine:"American"}).pretty();

//NOTE "American" Does NOT exists in DataBase, but "American " DOES YES Exists! (It contains an space at the end) - Okay Space IS in exercise...
db.Restaurants.find( {"cuisine":{$ne:"American "}, "grades.score": {$gt:70}, "address.coord.1":{$lt:-65.754168} }, {}).pretty();
//WITH AND
db.Restaurants.find( {$and: [ {"cuisine":{$ne:"American "}}, {"grades.score": {$gt:70}}, {"address.coord.0":{$lt:-65.754168}}] }, {}).pretty();

// 12//     Escriu una consulta per trobar els restaurants que no preparen menjar 'American' i tenen algun score superior a 70 i que, a més, es localitzen en longituds inferiors a -65.754168. Nota: Fes aquesta consulta sense utilitzar operador $and.
db.Restaurants.find( {"cuisine":{$ne:"American"}, "grades.score": {$gt:70}, "address.coord.0":{$lt:-65.754168} }, {}).pretty();

// 13//     Escriu una consulta per trobar els restaurants que no preparen menjar 'American ', tenen alguna nota 'A' i no pertanyen a Brooklyn. S'ha de mostrar el document segons la cuisine en ordre descendent.
db.Restaurants.find( {"cuisine":{$ne:"American "}, "grades.grade": {$eq:"A"}, "borough":{$ne:"Brooklyn"} }, {}).pretty().sort({"cuisine":-1});
//CHECKME - Number 13
// 14//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Wil' en les tres primeres lletres en el seu nom.

// 15//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'ces' en les últimes tres lletres en el seu nom.
//To Test:
//db.Restaurants.find({} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();
db.Restaurants.find({ "name":{ $regex: /ces$/ }} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();

// 16//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Reg' en qualsevol lloc del seu nom.
db.Restaurants.find({ "name":{ $regex: /Reg/ }} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();

// 17//     Escriu una consulta per trobar els restaurants que pertanyen al Bronx i preparen plats Americans o xinesos.
db.Restaurants.find({ "borough":{$eq:"Bronx"}, $or: [{ "cuisine":{$eq:"American "}},{ "cuisine":{$regex: /Chinese/ } } ]} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();
//db.Restaurants.find({ "borough":{$eq:"Bronx"}, "cuisine":{$regex: /Chinese/ } } ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();

// 18//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per aquells restaurants que pertanyen a Staten Island, Queens, Bronx o Brooklyn.
db.Restaurants.find({ $or: [{"borough":{$eq:"Staten Island"}},{"borough":{$eq:"Queens"}},{"borough":{$eq:"Bronx"}}]} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();

// 19//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que NO pertanyen a Staten Island, Queens, Bronx o Brooklyn.
db.Restaurants.find({ $nor: [{"borough":{$eq:"Staten Island"}},{"borough":{$eq:"Queens"}},{"borough":{$eq:"Bronx"}},{"borough":{$eq:"Brooklyn"}}]} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();

// 20//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que aconsegueixin una nota menor que 10.
//db.Restaurants.find({"grades.score":{$lt:10}} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1, "grades":1}).pretty();
db.Restaurants.find({"grades.score":{$lt:10}} ,{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();

// 21//     Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que preparen marisc ('seafood') excepte si són 'American ', 'Chinese' o el name del restaurant comença amb lletres 'Wil'.
db.Restaurants.find({"cuisine":{$eq:"Seafood"} , $nor: [ {"cuisine":"American "}, {"cuisine":"Chinese"}, {name:{$regex: /^Wil/}}]},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();
//With Regex Down (Upper and Lower Case)
//db.Restaurants.find({"cuisine":{$regex: /[S-s]eafood/ } , $nor: [ {"cuisine":"American "}, {"cuisine":"Chinese"}, {name:{$regex: /^Wil/}}]},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();
//db.Restaurants.find({"cuisine":{$regex: /[S-s]eafood/ }},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1}).pretty();

// 22//     Escriu una consulta per trobar el restaurant_id, name i grades per a aquells restaurants que aconsegueixin un grade de "A" i un score d'11 amb un ISODate "2014-08-11T00:00:00Z".
//db.Restaurants.find({ "grades.grade":"A", "grades.date":{$eq: Date("2011-09-29T00:00:00Z")}},  {"restaurand_id":1,"name":1, "grades":1}).pretty();
//db.Restaurants.find({ "grades.grade":"A", "grades.date":ISODate("2014-08-11T00:00:00Z") },  {"restaurand_id":1,"name":1, "grades":1}).pretty();
db.Restaurants.find({ "grades.grade":"A", "grades.date":ISODate("2014-08-11T00:00:00Z"), "grades.score":11 },  {"restaurand_id":1,"name":1, "grades":1}).pretty();
//OR FOR MATCHING THE SAME ELEMENT:
db.Restaurants.find({ "grades": {
	$elemMatch: {
	 "grade":"A", 
	 "date":ISODate("2014-08-11T00:00:00Z"),
	 "score":11 }}}
	 ,  {"restaurand_id":1,"name":1, "grades":1}).pretty();


// 23//     Escriu una consulta per trobar el restaurant_id, name i grades per a aquells restaurants on el 2n element de l'array de graus conté un grade de "A" i un score 9 amb un ISODate "2014-08-11T00:00:00Z".
db.Restaurants.find({ "grades.1.grade":"A", 
	 "grades.1.date":ISODate("2014-08-11T00:00:00Z"),
	 "grades.1.score":9 }
	 ,  {"restaurand_id":1,"name":1, "grades":1}).pretty();
	 
// OR WITH VARIABLE:
var myLevel="1";
db.Restaurants.find({ ["grades."+myLevel+".grade"]:"A", 
	 ["grades."+myLevel+".date"]:ISODate("2014-08-11T00:00:00Z"),
	 ["grades."+myLevel+".score"]:9 }
	 ,  {"restaurand_id":1,"name":1, "grades":1}).pretty();
// 24//     Escriu una consulta per trobar el restaurant_id, name, adreça i ubicació geogràfica per a aquells restaurants on el segon element de l'array coord conté un valor entre 42 i 52.
//db.Restaurants.find({},{"restaurant_id":1,"name":1, "address":1, "coord":1}).pretty();
db.Restaurants.find({"address.coord.1":{$gt:42, $lt:52}},{"restaurant_id":1,"name":1, "address":1, "coord":1}).pretty();
// 25//     Escriu una consulta per organitzar els restaurants per nom en ordre ascendent.
db.Restaurants.find({}).pretty().sort({"name":1});

// 26//     Escriu una consulta per organitzar els restaurants per nom en ordre descendent.
db.Restaurants.find({}).pretty().sort({"name":-1});
// 27//     Escriu una consulta per organitzar els restaurants pel nom de la cuisine en ordre ascendent i pel barri en ordre descendent.
db.Restaurants.find({}).pretty().sort({"name":1, "cuisine":1, "borough":-1});
// 28//     Escriu una consulta per saber si les direccions contenen el carrer.
//I DO NOT KNOW WHAT THE HELL I AM SUPPOSED TO DO HERE...
//USE $exists? $in? $nin? What should I output in screen...
//Various possibilities listed below...

db.Restaurants.find({
	"address.street":{ $nin: [] }},{}).pretty();
	
db.Restaurants.find({
	"address.street":{ $in: [] }},{}).pretty();

db.Restaurants.find({
	"address.street":{ $exists: false }},{}).pretty();

db.Restaurants.find({
	"address.street":null},{}).pretty();

db.Restaurants.find({
	$or: [
	{"address.street":{ $exists: false }},
	{"address.street":null}
	]},{}).pretty();
	
db.Restaurants.find({
	"address.street":{ $exists: true }},{}).pretty();



// 29//     Escriu una consulta que seleccioni tots els documents en la col·lecció de restaurants on els valors del camp coord és de tipus Double.
db.Restaurants.find({"address.coord.0":{$type:1},"address.coord.1":{$type:1}},{}).pretty();
//db.Restaurants.find({"address.coord.0":{$type:16},"address.coord.1":{$type:16}},{}).pretty();

// 30//     Escriu una consulta que seleccioni el restaurant_id, name i grade per a aquells restaurants que retornen 0 com a residu després de dividir algun dels seus score per 7.
db.Restaurants.find({"grades.score":{ $mod:[7,0]}},{"restaurant_id":1, "name":1, "grades.grade":1}).pretty();

// 31//     Escriu una consulta per trobar el name de restaurant, borough, longitud, latitud i cuisine per a aquells restaurants que contenen 'mon' en algun lloc del seu name.
//db.Restaurants.find({},{"name":1, "borough":1, "address.coord.0":1, "address.coord.1":1, "cuisine":1}).pretty();
//DOES NOT SEEM POSSIBLE (ABOVE) - ASK TEACHER
db.Restaurants.find({"name": {$regex: /mon/}},{"name":1, "borough":1, "address.coord":1, "cuisine":1}).pretty();
// 32//     Escriu una consulta per trobar el name de restaurant, borough, longitud, latitud i cuisine per a aquells restaurants que contenen 'Mad' com a primeres tres lletres del seu name.
db.Restaurants.find({"name": {$regex: /^Mad/}},{"name":1, "borough":1, "address.coord":1, "cuisine":1}).pretty();
