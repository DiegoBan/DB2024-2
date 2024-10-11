CREATE DATABASE juegos;

CREATE TABLE juego (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    consola VARCHAR(10)
);

CREATE TABLE jugadores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    edad int NOT NULL,
    juego_favorito_id INT,
    FOREIGN KEY (juego_favorito_id) REFERENCES juego(id)
);

CREATE TABLE estadisticas_jugador (
    id INT PRIMARY KEY AUTO_INCREMENT,
    jugador_id INT NOT NULL,
    juego_id INT NOT NULL,
    nivel INT NOT NULL,
    horas_jugadas INT NOT NULL,
    platino BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id),
    FOREIGN KEY (juego_id) REFERENCES juego(id)
);

INSERT INTO juego (nombre, genero, consola) VALUES 
('League of Legends', 'MOBA', 'PC'),
('Elden Ring', 'Souls Like', 'PC'),
('Dark Souls 3', 'Souls Like', 'PC'),
('Minecraft', 'Sandbox', 'PC'),
('Dragon Ball Sparking Zero', 'fighting', 'PS5'),
('Mortal Kombat 11', 'fighting', 'PS5'),
('GTA 5', 'Sandbox', 'PS5'),
('Super Mario Odyssey', 'Plataformas', 'Switch'),
('Valorant', 'Shooter', 'PC');

INSERT INTO jugadores (nombre, edad, juego_favorito_id) VALUES 
('Diego', 20, 3),
('Vicente', 22, 1),
('Felipe', 25, 4),
('Victor', 38, 2),
('Yerko', 28, 3),
('Dante', 21, 1),
('Benjamin', 21, 4),
('Pedro', 22, 7);

INSERT INTO estadisticas_jugador (jugador_id, juego_id, nivel, horas_jugadas, platino) VALUES 
(1, 1, 275, 300, FALSE),
(1, 3, 100, 55, TRUE),
(1, 7, 128, 600, FALSE),
(2, 3, 155, 150, TRUE),
(2, 1, 455, 800, FALSE),
(3, 8, 20, 25, FALSE),
(4, 2, 80, 60, FALSE),
(4, 1, 30, 100, FALSE),
(5, 2, 200, 340, TRUE),
(5, 3, 154, 90, FALSE),
(6, 1, 400, 775, FALSE),
(7, 1, 389, 881, FALSE),
(7, 4, 40, 335, TRUE),
(8, 5, 5, 15, FALSE),
(8, 6, 50, 541, TRUE);
