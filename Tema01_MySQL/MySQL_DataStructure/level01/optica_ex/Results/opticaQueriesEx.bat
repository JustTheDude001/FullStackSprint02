



USE optica;


-- Tests START
-- 1. List the total sells for a client
SELECT ventes.ID_venta from ventes WHERE ID_Client = 4;
-- 2. List all the glasses sold for a worker.
SELECT ulleres.ID_glasses from ulleres WHERE ID_glasses IN (SELECT ID_glasses FROM ventes WHERE ID_worker = 5);
-- 3. List all the suppliers/providers which have provided sold glasses (succesfully)
-- What a long query... Maybe Improvement doing it somehow shorter?¿
SELECT proveidor.ID_proveidor FROM proveidor WHERE ID_proveidor IN (SELECT marca.ID_proveidor FROM marca WHERE marca.ID_marca IN (SELECT ulleres.ID_marca FROM ulleres WHERE ulleres.ID_glasses IN ( SELECT ventes.ID_glasses FROM ventes)));
