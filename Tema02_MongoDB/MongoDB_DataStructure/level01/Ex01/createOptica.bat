
// Install Various:
// apt -s install unixodbc
// apt install libmongoc-1.0-0

// To export with mongo:
// mongoexport -d optica -c clients
// mongoexport -d optica



// Get connection string in command line:
// db.getMongo()

// Create MONGODB Database
// There is NO "Create" command, in order to create a database switch the context to a non-existing database:
// IMPORTANT -- All commands in MONGODB are written in LOWER case!
use optica

// Database is created when data is stored into the database:
// Insert Document into database:
// db.collection_name.insert({})

//Exercise 01:
db.clients.insert({
	name: "First Client Name",
	address: {
		street: "Right Street",
		number: "123",
		city: "Barcelona",
		postal_code: "08123",
		country: "Spain",
		floor: "2n",
		door: "1st"
		},
	email: "firstclientemail@fake.com",
	register_date: new Date("2023-12-21"),
	recomendation_id: null,
	sells: [
		{
		ulleres: [
			{ulleres_id: 1,
			proveider_id: 2}
		],
		brand: "Rayban",
		graduation_left: 2.3,
		graduation_right: 2.0,
		color_left: "white",
		color_right: "white",
		frame_type: "Metallic",
		price: 127.0,
		employer_id: 1,
		sale_date: new Date("2023-12-22")
		}
	]
})


//Exercise 02:

db.proveiders.insert({
	name: "proveidorU",
	address: {
		street: "Right Street",
		number: "123",
		city: "Barcelona",
		postal_code: "08123",
		country: "Spain",
		floor: "2n",
		door: "1st"
		},
		telephone: "912398123",
		fax: "192873917",
		nif: "ijadsidlma"

})



db.ulleres.insert({
	brand: "Brand",
	frame: "Metallic",
	provider: "Google Associated SL",
	price: 105.75,
	proveidor_id: [1],
	buyers_id: [1,2]
})

