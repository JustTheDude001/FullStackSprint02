

-- Insert in table proveidor example:
INSERT INTO proveidor
VALUES(NULL, 
	"Raiban",
	1,
	"937819123",
	"937819343",
	"81291074-W"
	);

-- Insert in table addresses example:
INSERT INTO addresses
VALUES(NULL, 
	"C. Cantabria",
	"54-A",
	"7n",
	"2a",
	"Barcelona",
	"98123",
	"Catalonia! Yeah Catalonia! But in English!"
	);

INSERT INTO addresses
VALUES(NULL, 
	"C. Cantabria",
	"54-A",
	"7n",
	"2a",
	"Mataro",
	"98123",
	"Catalonia! Yeah Catalonia! But in English!"
	);
	
-- Table Ulleres:
INSERT INTO ulleres
VALUES(
  NULL,
  1,
  "Raiban",
  "1.569",
  -1.8,
  'flotant',
  "black",
  "white",
  "green",
  15.76
  );
  
 
-- Client Table
INSERT INTO clients 
VALUES(
  NULL,
  "SomeoneWithNotGoodSight",
	4,
  "+34 780 123 764",
  "fakeemailOne@fake.com",
  DEFAULT,
  4
  );



-- Client Table
INSERT INTO clients 
VALUES(
  NULL,
  "TheRichGuy",
  7,
  "8174810382",
  "fakeEmailBuyer@fake.fake",
  "2014-08-12 23-05-23",
  NULL
  );


-- Ventes/Sells Table
INSERT INTO ventes 
VALUES(
  NULL,
  4,
  3,
  2,
  NOW()
  );
 
 
-- Worker Tables / Optional Choice
INSERT INTO workers 
VALUES(
  NULL,
  "WorkerNameOne",
  4,
  "9123850123",
  "workerFakeEmail@fake.fake",
  "2014-12-12 23-05-23",
  NULL  );
  
  
INSERT INTO marca
VALUES(
  NULL,
  1,
  "Decathlon"
);
  
 
-- ---------------------------------------------------------------------
-- Line Instert Statements for Chat GTP:
-- ---------------------------------------------------------------------
-- Insert in table proveidor example:
INSERT INTO proveidorVALUES(NULL, "Raiban",1,"937819123","937819343","81291074-W");
-- Insert in table addresses example:
INSERT INTO addressesVALUES(NULL, "C. Cantabria","54-A","7n","2a","Barcelona","98123","Catalonia! Yeah Catalonia! But in English!");
INSERT INTO addressesVALUES(NULL, "C. Cantabria","54-A","7n","2a","Mataro","98123","Catalonia! Yeah Catalonia! But in English!");
-- Client Table
INSERT INTO clients VALUES(  NULL,  "SomeoneWithNotGoodSight",4,  "+34 780 123 764",  "fakeemailOne@fake.com",  DEFAULT,  4  );
-- Client Table
INSERT INTO clients VALUES(  NULL,  "TheRichGuy",  7,  "8174810382",  "fakeEmailBuyer@fake.fake",  "2014-08-12 23-05-23",  NULL  );
-- Ventes/Sells Table
INSERT INTO ventes VALUES(  NULL,  4,  3,  2,  NOW()  );  
-- Worker Tables / Optional Choice
INSERT INTO workers VALUES(  NULL,  "WorkerNameOne",  4,  "9123850123",  "workerFakeEmail@fake.fake",  "2014-12-12 23-05-23",  NULL  );
-- Table Ulleres:
INSERT INTO ulleresVALUES(  NULL, 1, "Raiban",  "1.569",  -1.8,  'flotant',  "black",  "white",  "green",  15.76  );   
-- Table marques:
INSERT INTO marca VALUES(  NULL, 1, "Decathlon");
  


