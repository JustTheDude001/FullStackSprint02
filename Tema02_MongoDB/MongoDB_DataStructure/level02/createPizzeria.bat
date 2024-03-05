
use pizzeria

db.clients.insert({
	_id: 1,
	name: "Firstyclient",
	family_name_1: "FamilyOne",
	family_name_2: "FamiliTwo",
	address: {
		postal_code: "012312",
		city: "Barcelona",
		province: "Barcelona"
	},
	phone_number: "123719231",
})

db.orders.insert({
	_id: 1,
	date: new Date(2023-12-21),
	type: "domicili",
	products: [
		{product_id: 1,
		product_name: "Pizza Margaritha",
		product_amount: 2,
		price_total: 100}
		,
		{product_id: 2,
		product_name: "Cola",
		product_amount: 2,
		price_total: 100}
	],
	total_price: 34.75,
	info: "No more info",
	shop_id: 1,
	deliver_info: 
	{
		street: "FakeStreet",
		number: "777",
		flor: "3rd",
		contact_number: "9182313",
		note: "We do not have elevator"
	},
	clients:[
		{ client_id: 1,
		client_name: "Dude",
		client_surname_1: "Edud",
		client_surname_2: "Dedu" }
	],
	deliver_time: ISODate("2023-12-21T20:32:00.00Z")
})

db.products.insert({
	_id: 1,
	name: "Pizza Margaritha",
	description: "Pizza with cheese and tomato sauce",
	img_path: "/path/to/somewehere.png",
	price_e: 8.75,
	type: "pizza",
	id_category: 1
})

db.pizzas_cats.insert({
	_id: 1,
	name: "Pizzas Caseras"
})

db.shops.insert({
	_id: 1,
	address:{
		postal_code: "123712",
		locality: "Barcelona",
		province: "Barcelona"
	}
})

db.workers.insert({
	_id: 1,
	shop_id: 1,
	name: "Gustavo",
	family_name_1: "Frinch",
	famili_name_2: "Hermano",
	NIF: "12314123h2",
	phone_number: "8172y312",
	type: "repartidor"
})
