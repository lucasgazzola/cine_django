-- \i C:/Users/tomas/Desktop/GESTION_DE_DATOS/scripts/cine.sql
-- Tabla: pelicula
\c postgres
drop database if exists cine_django;
create database cine_django;
\c cine_django

-- Tabla: director
CREATE TABLE director (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE pelicula (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracion INTEGER,
    sinopsis TEXT,
    director_id INTEGER NOT NULL,
    constraint fk_pelicula_director foreign key (director_id) references director(id)
);

-- Tabla: actor
CREATE TABLE actor (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE actor_por_pelicula(
    id serial primary key,
    actor_id integer not null,
    pelicula_id integer not null,
    constraint fk_actor_por_pelicula_actor_id foreign key (actor_id) references actor(id),
    constraint fk_actor_por_pelicula_pelicula_id foreign key (pelicula_id) references pelicula(id)
);

-- Tabla: tipo_funcion
CREATE TABLE tipo_funcion (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tarifa numeric not null
);

-- Tabla: sector
CREATE TABLE sector (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla: sala
CREATE TABLE sala (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    sector_id INTEGER NOT NULL,
    constraint fk_sala_sector foreign key (sector_id) references sector(id)
);

-- Tabla: funcion
CREATE TABLE funcion (
    id SERIAL PRIMARY KEY,
    pelicula_id INTEGER NOT NULL,
    sala_id INTEGER NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    constraint fk_funcion_sala foreign key (sala_id) references sala(id),
    constraint fk_funcion_pelicula foreign key (pelicula_id) references pelicula(id)
);

-- Tabla: entrada
CREATE TABLE entrada (
    id SERIAL PRIMARY KEY,
    funcion_id INTEGER NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    monto numeric not null,
    constraint fk_entrada_funcion foreign key (funcion_id) references funcion(id)
);

--CARGA DE DATOS 
-- Insertar datos en la tabla "director"
INSERT INTO director (nombre)
VALUES ('Martin Scorsese'), ('Francis Ford Coppola'), ('Quentin Tarantino'), ('George Romero');

-- Insertar datos en la tabla "actor"
INSERT INTO actor (nombre)
VALUES ('Robert De Niro'), ('Al Pacino'), ('Samuel Jackson');

-- Insertar datos en la tabla "pelicula"
INSERT INTO pelicula (titulo, duracion, sinopsis, director_id)
VALUES ('Taxi Driver', 113, 'Sinopsis...', 1),
       ('The Godfather II', 200, 'Sinopsis...', 2),
       ('Pulp Fiction', 153, 'Sinopsis...', 3);

-- Insertar datos en la tabla "actor_por_pelicula"
INSERT INTO actor_por_pelicula (actor_id, pelicula_id)
VALUES (1, 1), (2, 2), (3, 3);

-- Insertar datos en la tabla "sector"
INSERT INTO sector (nombre)
VALUES ('Sector 1'), ('Sector 2'), ('Sector 3');

-- Insertar datos en la tabla "sala"
INSERT INTO sala (nombre, sector_id)
VALUES ('Sala 1', 1), ('Sala 2', 1), ('Sala 3', 2);

-- Insertar datos en la tabla "tipo_funcion"
INSERT INTO tipo_funcion (nombre, tarifa)
VALUES ('2D', 10.00), ('3D', 15.00);

-- Insertar datos en la tabla "funcion"
INSERT INTO funcion (pelicula_id, sala_id, fecha, hora)
VALUES (1, 1, '2023-01-01', '15:00:00'),
       (2, 2, '2023-01-02', '18:30:00'),
       (3, 3, '2023-01-03', '20:15:00');

-- Insertar datos en la tabla "entrada"
INSERT INTO entrada (funcion_id, precio, monto)
VALUES (1, 10.00, 100.00),
       (2, 15.00, 150.00),
       (3, 12.00, 120.00);