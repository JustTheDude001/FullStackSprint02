#RUN AS ROOT:
mongod --dbpath /home/muser/Documents/FullStackDev/Sprints/Sprint02/Tema02_MongoDB/DB_Path/ start
mongod --dbpath /home/muser/Documents/FullStackDev/Sprints/Sprint02/Tema02_MongoDB/DB_Path/

mongoexport -d databaseName -c collectionName -o outputFile --pretty


