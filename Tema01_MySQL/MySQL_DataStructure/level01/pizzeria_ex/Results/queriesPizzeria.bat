-- Pizzeria:



-- Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat.
-- Barcelona
-- OMG longest query of them all - Heil to the mother of all queries...
SELECT COUNT(productes_comanda.ID_producte)*productes_comanda.amount FROM productes_comanda 
WHERE ID_comanda IN (SELECT comandes.ID_comanda FROM comandes WHERE ID_botiga IN 
(SELECT ID_botiga FROM botigues WHERE ID_address IN (SELECT ID_address FROM addresses WHERE
addresses.city = "Barcelona")))
AND
ID_producte IN (SELECT ID_product FROM productes WHERE
product_type = "beguda")
GROUP BY amount;

-- Llista quantes comandes ha efectuat un determinat empleat/da.
-- Yeah... I know... Wierd Names... But not even god knows what can we expect for the future... Tiktok gen... You know...

-- Following query can give error if two workers have the same name and family names...
SELECT COUNT(comandes.ID_comanda) FROM comandes WHERE ID_repartidor =
(SELECT empleats.ID_empleat FROM empleats WHERE nom = "PizzaExpresso"
AND cognom_1="QuickBites"
AND cognom_2 = "Martinez");

-- Therefore ID can be used, and it is expected to be used...
SELECT COUNT(comandes.ID_comanda) FROM comandes WHERE ID_repartidor = 5;
-- OR 4 (for more than 1)
SELECT COUNT(comandes.ID_comanda) FROM comandes WHERE ID_repartidor = 4;
