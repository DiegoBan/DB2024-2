--  1.- Juegos para PC
SELECT nombre, genero
FROM juego
WHERE consola = 'PC';

-- 2.- Nombre de jugadores que tienen juego favorito alguno con genero ‘SOULS LIKE’.

SELECT p.nombre
FROM jugadores AS p
JOIN juego AS j ON p.juego_favorito_id = j.id
WHERE j.genero = 'SOULS LIKE';

-- 3.- Nombre de juego, jugador con más horas jugadas y las horas jugadas.

SELECT j.nombre, p.nombre, e.horas_jugadas
FROM juego AS j
JOIN estadisticas_jugador AS e ON j.id = e.juego_id
JOIN jugadores AS p ON e.jugador_id = p.id
WHERE e.horas_jugadas = (
    SELECT MAX(es.horas_jugadas)
    FROM estadisticas_jugador AS es
    WHERE es.juego_id = e.juego_id
);

-- 4.- Nombre y horas de jugadores de ‘League of Legends’ ordenados por sus horas descendientemente.

SELECT p.nombre, e.horas_jugadas AS horas_perdidas
FROM jugadores AS p
JOIN estadisticas_jugador AS e ON p.id = e.jugador_id
JOIN juego AS j ON e.juego_id = j.id
WHERE j.nombre = 'League of Legends'
ORDER BY e.horas_jugadas DESC;

-- 5.- Nombre de jugador y nombre de juego en el cual el jugdor tiene platino.

SELECT p.nombre, j.nombre
FROM jugadores AS p
JOIN estadisticas_jugador AS e ON p.id = e.jugador_id
JOIN juego AS j ON e.juego_id = j.id
WHERE e.platino = 1;

-- 6.- Jugador con mayor nivel en cada juego.

SELECT j.nombre, p.nombre, e.nivel
FROM juego AS j
JOIN estadisticas_jugador AS e ON j.id = e.juego_id
JOIN jugadores AS p ON e.jugador_id = p.id
WHERE e.nivel = (
    SELECT MAX(es.nivel)
    FROM estadisticas_jugador AS es
    WHERE es.juego_id = e.juego_id
);