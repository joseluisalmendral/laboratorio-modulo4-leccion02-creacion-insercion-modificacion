
/* CREACION DE LA BASE DE DATOS */

CREATE TABLE IF NOT EXISTS clientes(
	id_cliente SERIAL PRIMARY KEY,
	nombre VARCHAR(100),
	email VARCHAR(50),
	direccion VARCHAR(200),
	telefono VARCHAR(9),
	pais VARCHAR(25)
);


CREATE TABLE IF NOT EXISTS empleados(
	id_empleado SERIAL PRIMARY KEY,
	nombre VARCHAR(100),
	cargo VARCHAR(50),
	email VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS proveedores(
	id_proveedor SERIAL PRIMARY KEY,
	nombre VARCHAR(100),
	contacto VARCHAR (100),
	telefono INT,
	direccion VARCHAR(200)
);


CREATE TABLE IF NOT EXISTS envios(
	id_envio SERIAL PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_empleado INT NOT NULL,
	id_proveedor INT NOT NULL,
	fecha_envio DATE,
	estado VARCHAR(100),
	total FLOAT,
	
	FOREIGN KEY (id_cliente)
	REFERENCES clientes (id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (id_empleado)
	REFERENCES empleados (id_empleado)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (id_proveedor)
	REFERENCES proveedores (id_proveedor)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS detalles_envios(
	id_detalle SERIAL PRIMARY KEY,
	id_envio INT NOT NULL,
	producto VARCHAR(100),
	cantidad INT,
	precio_unitario FLOAT,
	
	FOREIGN KEY (id_envio)
	REFERENCES envios(id_envio)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS regiones(
	id_region SERIAL PRIMARY KEY,
	nombre VARCHAR(100),
	pais VARCHAR(100)
);



/* EJERCICIO 2. Insercion de datos */

INSERT INTO clientes (nombre, email, direccion, telefono, pais) VALUES
('Juan Pérez', 'juan.perez@mail.com', 'Calle Falsa 123', '123456789', 'España'),
('María García', 'maria.garcia@mail.com', 'Av. de la Paz 45', '987654321', 'México'),
('Pedro Sánchez', 'pedro.sanchez@mail.com', 'Calle Mayor 78', '123123123', 'Argentina'),
('Lucía López', 'lucia.lopez@mail.com', 'Plaza Central 9', '654987321', 'Chile'),
('Carlos Díaz', 'carlos.diaz@mail.com', 'Paseo de la Reforma 22', '321654987', 'Colombia'),
('Laura Fernández', 'laura.fernandez@mail.com', 'Calle Sol 34', '111222333', 'Perú'),
('José Martínez', 'jose.martinez@mail.com', 'Av. Libertad 98', '444555666', 'Uruguay'),
('Ana Torres', 'ana.torres@mail.com', 'Calle Luna 56', '777888999', 'Venezuela'),
('Manuel Romero', 'manuel.romero@mail.com', 'Calle Estrella 101', '555666777', 'Paraguay'),
('Claudia Ruiz', 'claudia.ruiz@mail.com', 'Av. San Juan 55', '999888777', 'Bolivia');



INSERT INTO empleados (nombre, cargo, email) VALUES
('Sofía Hernández', 'Gerente', 'sofia.hernandez@empresa.com'),
('David González', 'Supervisor', 'david.gonzalez@empresa.com'),
('Martín Morales', 'Administrador', 'martin.morales@empresa.com'),
('Andrea Jiménez', 'Asistente', 'andrea.jimenez@empresa.com'),
('Rafael Ortiz', 'Contador', 'rafael.ortiz@empresa.com');


INSERT INTO proveedores (nombre, contacto, telefono, direccion) VALUES
('Proveedor A', 'Carlos Rivera', 123456789, 'Calle Comercio 1'),
('Proveedor B', 'Sandra León', 987654321, 'Av. Industrial 23'),
('Proveedor C', 'Roberto Flores', 654987321, 'Paseo Comercial 45');



INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total) VALUES
(1, 1, 1, '2024-01-10', 'Enviado', 150.00),
(2, 2, 1, '2024-02-15', 'Pendiente', 250.00),
(3, 3, 2, '2024-03-20', 'Enviado', 350.00),
(4, 4, 2, '2024-04-25', 'En tránsito', 450.00),
(5, 1, 3, '2024-05-30', 'Enviado', 550.00),
(6, 2, 3, '2024-06-05', 'Cancelado', 200.00),
(7, 3, 1, '2024-07-10', 'Enviado', 300.00),
(8, 4, 2, '2024-08-15', 'Pendiente', 400.00);



INSERT INTO detalles_envios (id_envio, producto, cantidad, precio_unitario) VALUES
(1, 'Producto 1', 10, 15.00),
(2, 'Producto 2', 20, 12.50),
(3, 'Producto 3', 15, 23.33),
(4, 'Producto 4', 8, 56.25),
(5, 'Producto 5', 25, 22.00),
(6, 'Producto 6', 5, 40.00),
(7, 'Producto 7', 12, 25.00),
(8, 'Producto 8', 10, 40.00);



INSERT INTO regiones (nombre, pais) VALUES
('Región Norte', 'España'),
('Región Sur', 'México'),
('Región Central', 'Argentina'),
('Región Andina', 'Chile'),
('Región Amazónica', 'Colombia');



/* EJERCICIO 3. Modificacion y Actualizacion de Datos */

/* 1 */
UPDATE envios 
SET estado = 'Entregado'
WHERE id_envio = 3;

/* 2 */
UPDATE empleados 
SET cargo = 'Director de Datos'
WHERE id_empleado = 5;

/* 3 */
UPDATE  detalles_envios 
SET precio_unitario = precio_unitario * 1.10
WHERE producto = 'Producto 1';

/* 4 */
UPDATE  clientes 
SET direccion = 'Nueva Calle B, 123'
WHERE id_cliente = 2;

/* 5 */
UPDATE  envios 
SET id_proveedor = 3
WHERE id_envio = 4;

/* 6 */
UPDATE  detalles_envios 
SET cantidad = 5
WHERE detalles_envios.id_envio = 2
AND producto = 'Producto 3';--pongo el 3 porque es el que tengo, pero deberia de ser el 'Producto 3'


/* 7 */
UPDATE  envios 
SET total = 50
WHERE id_envio = 5;

/* 8 */
UPDATE proveedores
SET contacto = 'Nuevo Contacto 2'
WHERE id_proveedor = 2;

/* 9 */
UPDATE clientes
SET pais = 'Portugal'
WHERE id_cliente = 6;

/* 10 */
UPDATE envios
SET fecha_envio = '2024-08-10'
WHERE id_envio = 7;


/* EJERCICIO 4. Eliminacion de datos */

-- 1
ALTER TABLE clientes
ADD COLUMN fecha_nacimiento DATE;

--2
ALTER TABLE proveedores
ADD COLUMN codigo_postal VARCHAR(10);

--3 
ALTER TABLE proveedores
DROP COLUMN contacto;

--4
ALTER TABLE regiones
DROP COLUMN pais;

--5
ALTER TABLE clientes
ALTER COLUMN telefono TYPE VARCHAR(15);


--6
ALTER TABLE envios
ALTER COLUMN total TYPE NUMERIC(12, 2);

--7
ALTER TABLE empleados
ADD COLUMN fecha_contrato DATE;

--8
ALTER TABLE envios
DROP COLUMN estado;

--9
ALTER TABLE empleados 
RENAME COLUMN nombre TO nombre_completo;


/* EJERCICIO 5. Contesta a las siguientes preguntas usando queries */


--1
SELECT * FROM clientes c 
WHERE c.pais = 'España';

--2
SELECT * FROM envios e 
WHERE id_empleado = 2;

--3
SELECT producto FROM detalles_envios de 
WHERE id_envio = 3;

--4
SELECT * FROM proveedores p 
WHERE telefono = '123456789';

--5
SELECT * FROM empleados e 
WHERE cargo = 'Supervisor de Envíos';

--6
SELECT * FROM envios e 
WHERE id_cliente = 5;

--7
SELECT *
FROM regiones;


--8
SELECT producto, precio_unitario 
FROM detalles_envios 
WHERE precio_unitario > 50;

--9
SELECT * 
FROM envios 
WHERE fecha_envio = '2024-08-05';

--10
SELECT * 
FROM clientes 
WHERE telefono LIKE '6003%';


