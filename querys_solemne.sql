--  Solo se hizo ejercicio de QUERY

--  Base de datos
--  Regiones: id, numero, nombre
--  Comunas: id, nombre, id_region
--  Distritos: id, numero
--  Candidatos: id, nombre, distrito_id, coalicion
--  Mesas: id, distrito_id, comuna_id, numero
--  Votos: mesa_id, candidato_id

--  1. ¿Cuántos votos fueron emitidos en la region de "Region de Magallanes y de la Antártica Chilena"?

SELECT COUNT(*)
FROM Votos AS v
JOIN Mesas AS m ON v.mesa_id = m.id
JOIN Comunas AS c ON m.comuna_id = c.id
JOIN Regiones AS r ON c.id_region = r.id
WHERE r.nombre = 'Region de Magallanes y de la Antártica Chilena';

--  2. ¿Cuantos votos se obtuvieron en promedio en la comuna de Providencia?
--  Esta pregunta se refería a promedio de votos en la comuna de providencia dividido por candidatos

SELECT Ca.nombre, AVG(t1.count)
FROM (
    SELECT COUNT(v.candidato_id) AS count, v.candidato_id
    FROM Votos AS v
    JOIN Mesas AS m ON v.mesa_id = m.id
    JOIN Comunas AS c ON m.comuna_id = c.id
    WHERE c.nombre = 'Providencia'
    GROUP BY v.candidato_id
) AS t1
JOIN Candidatos AS Ca ON t1.candidato_id = Ca.id;

--  3. ¿Cuál fue el candidato que obtuvo 100 votos en la comuna de Valparaiso?

SELECT Ca.nombre
FROM Candidatos AS Ca
JOIN Votos AS v ON Ca.id = v.candidato_id
JOIN Mesas AS m ON v.mesa_id = m.id
JOIN Comunas AS Co ON m.comuna_id = Co.id
WHERE Co.nombre = 'Valparaiso'
GROUP BY Ca.id
HAVING COUNT(v.voto_id) = 100;

--  4. ¿Cuántos votos obtuvo en total el candidato Jorge Perez por el distrito número 5?

SELECT COUNT(v.voto_id) AS total_votos
FROM Votos AS v
JOIN Candidatos AS Ca ON v.candidato_id = Ca.id
JOIN Distritos AS d ON Ca.distrito_id = d.id
WHERE Ca.nombre = 'Jorge Perez' AND d.numero = 5;

--  5. ¿Cuántos votos obtuvieron cada coalición?

SELECT Ca.coalicion, COUNT(v.voto_id) AS total_votos
FROM Votos AS v
JOIN Candidatos AS Ca ON v.candidato_id = Ca.id
GROUP BY Ca.coalicion;

--  6. ¿Cuáles son los candidatos del distrito 15 que obtuvieron más de 10000 votos?

SELECT Ca.nombre, COUNT(v.voto_id) AS total_votos
FROM Votos AS v
JOIN Candidatos AS Ca ON v.candidato_id = Ca.id
JOIN Distritos AS d ON Ca.distrito_id = d.id
WHERE d.numero = 15
GROUP BY Ca.id
HAVING COUNT(v.voto_id) > 10000;