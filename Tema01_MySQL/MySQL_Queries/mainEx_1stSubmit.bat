
-- Run AS 
-- 	SOURCE test.sql;

-- Restaurant Database 

SET @DatabaseName := 'Tienda';
SET @DollarToEuro := 0.93;
-- 1 USD = 0.93 Euros (2023-12-07)

-- SET @queryDB = CONCAT('USE ', @DatabaseName);
-- PREPARE stmt FROM @queryDB;
-- EXECUTE stmt;
-- DEALLOCATE PREPARE stmt;
-- USE DatabaseName WHERE DatabaseName=@DatabaseName;
-- Sadly it is NOT possible to use "USE" statement with variables... 

-- REMEMBER to change Database Name if needed:
USE tienda;


-- 1--    Llista el nom de tots els productes que hi ha en la taula "producto".
select nombre from producto;
-- 2--     Llista els noms i els preus de tots els productes de la taula "producto".
select nombre, precio from producto;
-- 3--     Llista totes les columnes de la taula "producto".
show columns from producto;
-- 4--     Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).
select nombre, precio as 'Precio €', precio/@DollarToEuro as 'Precio $' from producto;
-- 5--     Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.
select nombre as 'nom de "producto"', precio as 'euros', precio/@DollarToEuro as 'dòlars nord-americans' from producto;


--  6--     Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.
select upper(nombre), precio from producto;
--  7--     Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.
select lower(nombre), precio from producto;
--  8--     Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
select nombre, upper(left(nombre,2)) from fabricante; 
--  9--     Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.
select nombre, round(precio) from producto;
-- 10--     Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
select nombre, truncate(precio,0) from producto;


-- 11--     Llista el codi dels fabricants que tenen productes en la taula "producto".
select codigo FROM fabricante where codigo  in (SELECT codigo_fabricante FROM producto);
-- 12--     Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.
select codigo FROM fabricante where codigo  in (SELECT DISTINCT codigo_fabricante FROM producto);
-- 13--     Llista els noms dels fabricants ordenats de manera ascendent.
select nombre from fabricante order by nombre asc;
-- 14--     Llista els noms dels fabricants ordenats de manera descendent.
select nombre from fabricante order by nombre desc;
-- 15--     Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
-- SELECT nombre FROM producto ORDER BY nombre ASC;
-- SELECT nombre FROM producto ORDER BY precio DESC;
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;

-- 16--     Retorna una llista amb les 5 primeres files de la taula "fabricante".
SELECT * from fabricante LIMIT 5;
-- 17--     Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.
SELECT * from fabricante LIMIT 3,2;
-- Index start by Zero therefore fourth row is row number 3!

-- 18--     Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), necessitaries GROUP BY
SELECT nombre, precio from producto ORDER BY precio ASC LIMIT 1;
-- 19--     Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MAX(preu), necessitaries GROUP BY.
SELECT nombre, precio from producto ORDER BY precio DESC LIMIT 1;
-- 20--     Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21--     Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante;
-- 22--     Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre ASC;
-- 23--     Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante;
-- 24--     Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND producto.precio = ( SELECT MIN(precio) FROM producto );
-- 25--     Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND producto.precio = ( SELECT MAX(precio) FROM producto );


-- 26--     Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre from producto WHERE producto.codigo_fabricante =( SELECT fabricante.codigo from fabricante WHERE fabricante.nombre = 'Lenovo'); 
-- 27--     Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre from producto WHERE producto.codigo_fabricante =( SELECT fabricante.codigo from fabricante WHERE fabricante.nombre = 'Crucial') AND producto.precio > 200; 
-- 28--     Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre from producto WHERE (producto.codigo_fabricante =( SELECT fabricante.codigo from fabricante WHERE fabricante.nombre = 'Crucial') 
OR  (producto.codigo_fabricante =( SELECT fabricante.codigo from fabricante WHERE fabricante.nombre = 'Hewlett-Packard')) 
OR (producto.codigo_fabricante =( SELECT fabricante.codigo from fabricante WHERE fabricante.nombre = 'Seagate'))); 

-- 29--     Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l'operador IN.
SELECT producto.nombre from producto WHERE 
(producto.codigo_fabricante IN 
( SELECT  fabricante.codigo from fabricante WHERE fabricante.nombre IN ("Asus","Hewlett-Packard","Seagate")));

-- 30--     Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT nombre, precio FROM producto WHERE codigo_fabricante IN (SELECT fabricante.codigo FROM fabricante WHERE RIGHT(fabricante.nombre,1) = 'e');
-- 31--     Retorna un llistat amb el nom i el preu de tots els productes dels fabricants dels quals contingui el caràcter w en el seu nom.
SELECT nombre, precio FROM producto WHERE codigo_fabricante IN (SELECT fabricante.codigo FROM fabricante WHERE INSTR(fabricante.nombre,'w') > 0);
-- 32--     Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
-- 33--     Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT fabricante.codigo, fabricante.nombre FROM fabricante WHERE fabricante.codigo IN (SELECT producto.codigo_fabricante FROM producto);
-- 34--     Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.nombre, fabricante.codigo, producto.nombre FROM fabricante 
LEFT JOIN 
producto ON fabricante.codigo=producto.codigo_fabricante;


-- 35--     Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fabricante.nombre, fabricante.codigo FROM fabricante WHERE fabricante.codigo NOT IN (SELECT producto.codigo_fabricante FROM producto);
-- 36--     Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre FROM producto WHERE producto.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");
-- 37--     Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).
SELECT * FROM producto 
	WHERE producto.precio = 
	(SELECT MAX(precio) FROM producto WHERE producto.codigo_fabricante = 
	(SELECT codigo FROM fabricante WHERE  fabricante.nombre = "Lenovo")
	);
-- 38--     Llista el nom del producte més car del fabricant Lenovo.
SELECT producto.nombre FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Lenovo") ORDER BY precio DESC LIMIT 1;
-- OR:
SELECT producto.nombre FROM producto WHERE (producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Lenovo")
AND producto.precio = (SELECT MAX(producto.precio) FROM producto WHERE (producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Lenovo") )));

-- 39--     Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Hewlett-Packard") ORDER BY precio ASC LIMIT 1;
-- OR:
SELECT producto.nombre FROM producto WHERE (producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Hewlett-Packard")
AND producto.precio = (SELECT MIN(producto.precio) FROM producto WHERE (producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Hewlett-Packard") )));

-- 40--     Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT producto.nombre FROM producto WHERE producto.precio >= (SELECT MAX(producto.precio) FROM producto WHERE (producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Lenovo") ));

-- 41--     Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
-- SELECT producto.nombre FROM producto WHERE producto.codigo_fabricante =  (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Asus")
-- AND producto.precio > MEDIAN(SELECT producto.precio FROM producto WHERE producto.codigo_fabricante =  (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Asus"));
-- Okay... no Median Function.... WHAT THE DEEP HELL!!
-- My answer for question 41 below:
SELECT producto.nombre FROM producto WHERE 
(producto.codigo_fabricante =  (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Asus"))
AND 
(producto.precio > 
(SELECT SUM(producto.precio) FROM producto WHERE producto.codigo_fabricante =  
	(SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Asus"))
/
(SELECT COUNT(producto.precio) FROM producto WHERE producto.codigo_fabricante =  
	(SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Asus"))
);



-- UNIVERSIDAD EXERCISES -----------------------------------------------------------------------------------------------------------------

use universidad;
-- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:
-- 1--    Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.id IN (SELECT alumno_se_matricula_asignatura.id_alumno FROM alumno_se_matricula_asignatura) ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
-- 2--    Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE (persona.telefono IS NULL ) AND (persona.id IN (SELECT alumno_se_matricula_asignatura.id_alumno FROM alumno_se_matricula_asignatura));
-- 3--    Retorna el llistat dels/les alumnes que van néixer en 1999.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE EXTRACT(YEAR FROM persona.fecha_nacimiento) = EXTRACT(YEAR FROM '1999-01-01')
AND (persona.id IN (SELECT alumno_se_matricula_asignatura.id_alumno FROM alumno_se_matricula_asignatura));
-- 4--    Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE (persona.telefono IS NULL )
AND right(persona.nif,1) = 'K'
AND persona.id IN (SELECT profesor.id_profesor FROM profesor);
-- 5--    Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT asignatura.nombre FROM asignatura WHERE
asignatura.cuatrimestre = 1
AND asignatura.curso = 3
AND asignatura.id_grado = 7;
-- 6--    Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona, departamento WHERE persona.id IN (SELECT profesor.id_profesor FROM profesor)
AND departamento.id = (SELECT profesor.id_departamento FROM profesor WHERE profesor.id_profesor = persona.id)
ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- Que significa menor a major? ASCendent?
/* Testing...
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.id IN (SELECT profesor.id_profesor FROM profesor)
ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
*/

-- 7--    Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
/*Llistat Assignatures*/
SELECT asignatura.nombre FROM asignatura WHERE asignatura.id IN 
(SELECT alumno_se_matricula_asignatura.id_asignatura FROM alumno_se_matricula_asignatura 
WHERE alumno_se_matricula_asignatura.id_alumno = (SELECT persona.id FROM persona WHERE persona.nif = "26902806M"));
/*Any D'inici i Any De fi del curs escolar*/
SELECT curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM curso_escolar WHERE
curso_escolar.id = (SELECT persona.id FROM persona WHERE persona.nif = "26902806M");

/*WORKAROUND IT WORKS...*/
CREATE TEMPORARY TABLE firstT (
SELECT asignatura.nombre FROM asignatura WHERE asignatura.id IN 
(SELECT alumno_se_matricula_asignatura.id_asignatura FROM alumno_se_matricula_asignatura 
WHERE alumno_se_matricula_asignatura.id_alumno = (SELECT persona.id FROM persona WHERE persona.nif = "26902806M"))
);
CREATE TEMPORARY TABLE secondT (
SELECT curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM curso_escolar WHERE
curso_escolar.id = (SELECT persona.id FROM persona WHERE persona.nif = "26902806M")
);
select * from firstT, secondT;


-- 8--    Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT departamento.nombre FROM departamento WHERE departamento.id IN 
(SELECT profesor.id_departamento FROM profesor WHERE profesor.id_profesor IN 
(SELECT asignatura.id_profesor FROM asignatura WHERE asignatura.id_grado = 
(SELECT grado.id  FROM grado WHERE grado.nombre = "Grado en Ingeniería Informática (Plan 2015)")
)
);
-- 9--    Retorna un llistat amb tots els/les alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
	SELECT persona.nombre FROM persona WHERE persona.id IN (SELECT alumno_se_matricula_asignatura.id_alumno FROM alumno_se_matricula_asignatura 
	WHERE alumno_se_matricula_asignatura.id_curso_escolar = (SELECT curso_escolar.id FROM curso_escolar WHERE
	curso_escolar.anyo_inicio= EXTRACT(YEAR FROM '2018-01-01')
	AND 
	curso_escolar.anyo_fin= EXTRACT(YEAR FROM '2019-01-01')
	 )
	);


-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 1--     Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
-- SELECT persona.nombre FROM persona WHERE persona.id IN (SELECT profesor.id_profesor FROM profesor);
-- SELECT departamento.nombre FROM departamento;
-- Above to test... (QUERY NUMBER 1 BELOW)
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona 
RIGHT JOIN departamento ON
departamento.id = (SELECT profesor.id_departamento FROM profesor 
WHERE profesor.id_profesor = persona.id)
ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- 2--     Retorna un llistat amb els professors/es que no estan associats a un departament.
/*In order to test:*/
/*
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona
RIGHT JOIN profesor ON
profesor.id_profesor = persona.id
WHERE profesor.id_departamento = 1;
*/
/*My answer for Query 2:*/
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona
RIGHT JOIN profesor ON
profesor.id_profesor = persona.id
WHERE profesor.id_departamento = NULL;
-- OR:
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona
RIGHT JOIN profesor ON
profesor.id_profesor = persona.id
WHERE profesor.id_departamento = 0;

-- 3--     Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT departamento.nombre FROM departamento
LEFT JOIN profesor ON
profesor.id_departamento = departamento.id
WHERE departamento.id NOT IN (SELECT profesor.id_departamento FROM profesor);

-- 4--     Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT persona.nombre FROM persona
LEFT JOIN profesor ON
profesor.id_profesor = persona.id
WHERE profesor.id_profesor NOT IN (SELECT asignatura.id_profesor FROM asignatura
 WHERE asignatura.id_profesor IS NOT NULL);

/* FOR THE FUTURE, FINISH IT THIS WAY IF POSSIBLE (NOT ANSWER FOR CORRECTION / ANSWER FOR QUERY 4 ABOVE)
SELECT persona.nombre FROM persona
LEFT JOIN profesor ON
profesor.id_profesor = persona.id
WHERE profesor.id_profesor IN (SELECT profesor.id_profesor 
FROM profesor WHERE profesor.id_profesor NOT IN (SELECT asignatura.id_profesor FROM asignatura));
*/


-- 5--     Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT asignatura.nombre FROM asignatura
LEFT JOIN profesor ON 
profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL
OR asignatura.id_profesor NOT IN (SELECT profesor.id_profesor 
FROM profesor WHERE profesor.id_profesor IS NOT NULL)
ORDER BY asignatura.nombre ASC;

-- 6--     Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT(departamento.nombre) FROM departamento
LEFT JOIN profesor ON
profesor.id_departamento = departamento.id
WHERE profesor.id_profesor NOT IN (SELECT asignatura.id_profesor 
FROM asignatura WHERE asignatura.id_profesor IS NOT NULL)
OR departamento.id NOT IN (SELECT profesor.id_departamento 
FROM profesor WHERE profesor.id_departamento IS NOT NULL);





-- Consultes resum:

-- 1--     Retorna el nombre total d'alumnes que hi ha.
-- Consideració alumne = persona que no es professor:
SELECT COUNT(persona.id) FROM persona WHERE persona.id NOT IN (SELECT profesor.id_profesor FROM profesor);
-- Consideració alumne = persona que s'ha matriculat a assignatura:
SELECT COUNT(DISTINCT(alumno_se_matricula_asignatura.id_alumno)) FROM alumno_se_matricula_asignatura;

-- 2--     Calcula quants/es alumnes van néixer en 1999.
-- Consideració alumne = persona que no es professor:
SELECT COUNT(persona.id) FROM persona WHERE persona.id 
NOT IN (SELECT profesor.id_profesor FROM profesor) AND 
YEAR(persona.fecha_nacimiento) = "1999";

-- Consideració alumne = persona que s'ha matriculat a assignatura: 
-- ANSWER NOT COMMENTED:

/* NOT WORKING 
SELECT COUNT(DISTINCT(alumno_se_matricula_asignatura.id_alumno)) 
FROM alumno_se_matricula_asignatura
WHERE YEAR(SELECT persona.fecha_nacimiento FROM persona WHERE persona.id = 
(SELECT alumno_se_matricula_asignatura.id_alumno 
FROM alumno_se_matricula_asignaturaid_alumno)) = "1999";

SELECT COUNT(DISTINCT(alumno_se_matricula_asignatura.id_alumno)) 
FROM alumno_se_matricula_asignatura
WHERE YEAR(SELECT persona.fecha_nacimiento FROM persona) = "1999";

SELECT COUNT(DISTINCT(alumno_se_matricula_asignatura.id_alumno)) 
FROM alumno_se_matricula_asignatura
WHERE YEAR(persona.fecha_nacimiento) FROM persona = "1999";

-- ASK TEACHER - FOLLOWING 2 QUERIES TAKE ALL id_alumnos
-- OHHHH THIS WORKS (BELOW) - BUT NOT GIVING CORRECT VALUE...
SELECT COUNT(DISTINCT(alumno_se_matricula_asignatura.id_alumno)) 
FROM alumno_se_matricula_asignatura, persona
WHERE YEAR(persona.fecha_nacimiento) = "1999";
-- ALSO THIS WORKS (BELOW) - BUT NOT GIVING CORRECT VALUE... (SAME VALUE AS BEFORE)
SELECT DISTINCT(alumno_se_matricula_asignatura.id_alumno)
FROM alumno_se_matricula_asignatura, persona
WHERE YEAR(persona.fecha_nacimiento) = YEAR("1999-01-01");

-- ASK TEACHER - FOLLOWING 2 QUERIES TAKE ALL id_alumnos
-- OHHHH THIS WORKS (BELOW) - YES GIVING CORRECT VALUE...
SELECT COUNT(DISTINCT(alumno_se_matricula_asignatura.id_alumno))
FROM alumno_se_matricula_asignatura
LEFT JOIN persona ON
persona.id = alumno_se_matricula_asignatura.id_alumno
WHERE YEAR(persona.fecha_nacimiento) = "2000";
*/

/*NEW TRY OPTION 2 TO CORRECT*/
SELECT COUNT(DISTINCT(alumno_se_matricula_asignatura.id_alumno))
FROM alumno_se_matricula_asignatura
LEFT JOIN persona ON
persona.id = alumno_se_matricula_asignatura.id_alumno
WHERE YEAR(persona.fecha_nacimiento) = "1999";


-- 3--     Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento
RIGHT JOIN profesor ON
profesor.id_departamento = departamento.id
WHERE profesor.id_departamento = departamento.id
GROUP BY(departamento.nombre)
ORDER BY COUNT(profesor.id_profesor) DESC;

-- 4--     Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento
LEFT JOIN profesor ON
profesor.id_departamento = departamento.id
WHERE profesor.id_departamento = departamento.id
OR departamento.id NOT IN (SELECT profesor.id_departamento FROM profesor)
GROUP BY(departamento.nombre)
ORDER BY COUNT(profesor.id_profesor) DESC;

-- 5--     Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre, COUNT(asignatura.id) FROM grado
LEFT JOIN asignatura ON
asignatura.id_grado = grado.id
GROUP BY(grado.nombre)
ORDER BY COUNT(asignatura.id) DESC;

-- 6--     Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre, COUNT(asignatura.id) AS cnt FROM grado
LEFT JOIN asignatura ON
asignatura.id_grado = grado.id
GROUP BY(grado.nombre)
HAVING cnt > 40
ORDER BY COUNT(asignatura.id) DESC;

-- 7--     Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado
LEFT JOIN asignatura ON 
asignatura.id_grado = grado.id
WHERE asignatura.id_grado = grado.id
GROUP BY grado.nombre, asignatura.tipo;

/* TO TEST RESULT...
SELECT grado.nombre, asignatura.tipo, asignatura.creditos FROM grado
LEFT JOIN asignatura ON 
asignatura.id_grado = grado.id
WHERE asignatura.id_grado = grado.id;
*/

-- 8--     Retorna un llistat que mostri quants/es alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats/des.
SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_alumno) FROM curso_escolar
LEFT JOIN alumno_se_matricula_asignatura ON
alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
GROUP BY curso_escolar.anyo_inicio;

-- 9--     Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) FROM persona
LEFT JOIN asignatura ON
persona.id = (SELECT profesor.id_profesor FROM profesor 
WHERE profesor.id_profesor = asignatura.id_profesor)
WHERE persona.id IN (SELECT profesor.id_profesor FROM profesor)
GROUP BY persona.id, persona.nombre, persona.apellido1, persona.apellido2
ORDER BY COUNT(asignatura.id_profesor) DESC;

-- 10--     Retorna totes les dades de l'alumne més jove.
SELECT * FROM persona
WHERE persona.fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE persona.tipo = "alumno")
AND persona.tipo = "alumno";
-- ASK THEACHER...
/* Ara em dono compte que hi ha una columna a la taula persona que indica si algu es alumne o profeso ^^'...
NO ho he utilitzat a cap exercici... tot i que els resultats haurien de ser coherents... Simplement per
veure si algu es alumne o profesor comprobo si el seu ID esta en la taula profesor... 
Si les dades contingudes a la base de dades son coherents hauria de ser el mateix resultat...
Si es necessari que ho canvii cap problema, de moment deixo les antigues queries com estan*/


-- 11--     Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT persona.nombre FROM persona
LEFT JOIN profesor ON
profesor.id_profesor = persona.id
WHERE persona.id IN (SELECT profesor.id_profesor FROM profesor
	WHERE profesor.id_departamento IS NOT NULL)
AND profesor.id_profesor NOT IN (SELECT asignatura.id_profesor FROM asignatura 
WHERE asignatura.id_profesor IS NOT NULL);

--  YEAAAH ENDLICH!!!





