CREATE DATABASE aeromosca

USE aeromosca

CREATE TABLE numerovuelo (
id VARCHAR(20) PRIMARY KEY,
nombrevuelo VARCHAR(70) UNIQUE NOT NULL,

);

ALTER TABLE numerovuelo
ADD fecha DATE NOT NULL;


CREATE TABLE ciudad (
id INT PRIMARY KEY IDENTITY(1,1),
nombreciudad VARCHAR(70) NOT NULL,
);

CREATE TABLE puerta (
id VARCHAR(20) PRIMARY KEY,
nombrepuerta VARCHAR(70) UNIQUE NOT NULL,
);

--
ALTER TABLE puerta
ADD CONSTRAINT CK_capacidad CHECK(capacidad > 0)

SELECT *
FROM puerta
WHERE id= 'P01';

UPDATE puerta
SET capacidad=2
WHERE id='P01';


CREATE TABLE aeropuerto (
id INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(70) UNIQUE NOT NULL,
ciudad INT NOT NULL FOREIGN KEY REFERENCES ciudad(id),
puerta VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES puerta(id),
numerovuelo VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES numerovuelo(id),
);



-- Inserción de datos
INSERT INTO ciudad (nombreciudad) VALUES
('Medellín'),
('Bogotá'),
('Cali'),
('Cartagena'),
('Barranquilla'),
('Santa Marta'),
('Bucaramanga'),
('Pereira');

INSERT INTO puerta (id, nombrepuerta) VALUES
('P01', 'Puerta 1 Internacional'),
('P02', 'Puerta 2 Nacional'),
('P03', 'Puerta 3 Nacional'),
('P04', 'Puerta 4 Internacional'),
('P05', 'Puerta 5 Nacional'),
('P06', 'Puerta 6 Carga'),
('P07', 'Puerta 7 Nacional'),
('P08', 'Puerta 8 Internacional');

INSERT INTO numerovuelo (id, nombrevuelo, fecha) VALUES
('AV244', 'Avianca 244', '2025-10-20'),
('LA4089', 'LATAM 4089', '2025-10-21'),
('VH5672', 'Viva Air 5672', '2025-10-22'),
('SAT8123', 'Satena 8123', '2025-10-23'),
('WIN456', 'Wingo 456', '2025-10-24'),
('EZ789', 'EasyFly 789', '2025-10-25'),
('AV9540', 'Avianca Cargo 9540', '2025-10-26'),
('LA1234', 'LATAM 1234', '2025-10-27');


SELECT *
FROM numerovuelo
WHERE id = 'CM154' OR id = 'AA916' OR id = 'IB6585'

UPDATE numerovuelo
SET fecha = '2025-09-16'
WHERE id = 'CM154' OR id = 'AA916' OR id = 'IB6585'


INSERT INTO numerovuelo (id, nombrevuelo, fecha) VALUES
('CM154', 'Copa Airlines 154', '2025-11-05'),
('AA916', 'American Airlines 916', '2025-11-10'),
('IB6585', 'Iberia 6585', '2025-11-12'),
('AV84', 'Avianca 84', '2025-12-01'),
('P57030', 'Wingo 7030', '2025-12-15'),
('LA4045', 'LATAM 4045', '2025-12-20'),
('JA3011', 'JetSMART 3011', '2026-01-08'),
('AF422', 'Air France 422', '2026-01-15'),
('KL745', 'KLM 745', '2026-01-20'),
('NK860', 'Spirit 860', '2026-02-05');


INSERT INTO aeropuerto (nombre, ciudad, puerta, numerovuelo) VALUES
('Aeropuerto José María Córdova', 1, 'P01', 'AV244'),
('Aeropuerto Internacional El Dorado', 2, 'P02', 'LA4089'),
('Aeropuerto Internacional Alfonso Bonilla Aragón', 3, 'P03', 'VH5672'),
('Aeropuerto Internacional Rafael Núñez', 4, 'P04', 'SAT8123'),
('Aeropuerto Internacional Ernesto Cortissoz', 5, 'P05', 'WIN456'),
('Aeropuerto Internacional Simón Bolívar', 6, 'P07', 'EZ789'),
('Aeropuerto Internacional Palonegro', 7, 'P08', 'AV9540'),
('Aeropuerto Internacional Matecaña', 8, 'P06', 'LA1234');

SELECT *
FROM puerta

SELECT *
FROM numerovuelo

SELECT *
FROM puerta

SELECT a.nombre, a.puerta, a.numerovuelo, c.nombreciudad
FROM aeropuerto a
INNER JOIN ciudad c
ON a.ciudad = c.id

INSERT INTO aeropuerto (nombre, ciudad, puerta, numerovuelo) VALUES
('Aeropuerto Olaya Herrera', 1, 'P02', 'JA3011'),
('Puente Aéreo T2 - El Dorado', 2, 'P05', 'CM154'),
('Terminal de Carga de Cali', 3, 'P06', 'AV84'),
('Terminal Vuelos Privados Cartagena', 4, 'P01', 'AA916'),
('Base Aérea de Malambo', 5, 'P07', 'P57030'),
('Pista Aérea Mamancana', 6, 'P02', 'NK860'),
('Aeropuerto Militar CATAM', 2, 'P08', 'IB6585'),
('Aeroclub del Café', 8, 'P03', 'LA4045'),
('Terminal Internacional El Dorado Muelle Norte', 2, 'P04', 'AF422'),
('Zona de Aviación General JMC', 1, 'P07', 'KL745');


SELECT *
FROM puerta

SELECT *
FROM numerovuelo
WHERE fecha = '2025-09-16'

SELECT *
FROM puerta

SELECT p.id, n.id, n.fecha
FROM aeropuerto a
INNER JOIN puerta p
ON a.puerta = p.id
INNER JOIN numerovuelo n
ON a.numerovuelo = n.id
WHERE fecha = '2025-09-16'

Los nuevos cambios
