Create database tienda_Videojuegos;
Use tienda_Videojuegos;
Create table Usuario(
	ID_Usuario int primary key ,
	Nombres varchar(100),
	Correo varchar(100)
);
Create table Videojuegos(
	ID_Videojuego int primary key,
	Titulo varchar(200),
	Plataforma varchar(100),
	Precio decimal (6,2),
);
Create table Ventas(
	ID_Venta int primary key,
	ID_Usuario int,
	Fecha date,
	Foreign key(ID_Usuario) references Usuario(ID_Usuario)
);
Create table Detalle_ventas(
	ID_Detalle int primary key,
	ID_Venta int,
	ID_Videojuego int,
	Cantidad int
);
Insert into Usuario(ID_Usuario,Nombres,Correo) values
(01,'William','willrod@gmail.com'),
(02,'Diego','dieg3ef@gmail.com');
Insert into Videojuegos(ID_Videojuego,Titulo,Plataforma,Precio)Values
(11,'Pokemon X','Nintendo 3ds',100),
(12,'God of war','PS4',150.50);
Insert into Ventas(ID_Venta,ID_Usuario,Fecha) values
(101,01,'08-18-2025'),
(102,02,'07-18-2025');
Insert into Detalle_ventas(ID_Detalle,ID_Venta,ID_Videojuego,Cantidad) Values
(1001,101,11,2),
(1002,102,12,4);

-- Mostrar el nombre del usuario, el juego que compró, la cantidad y la fecha
SELECT 
    u.Nombres AS Comprador, 
    v.Titulo AS Videojuego, 
    dv.Cantidad, 
    ven.Fecha AS Fecha_Compra
FROM Usuario u
INNER JOIN Ventas ven ON u.ID_Usuario = ven.ID_Usuario
INNER JOIN Detalle_ventas dv ON ven.ID_Venta = dv.ID_Venta
INNER JOIN Videojuegos v ON dv.ID_Videojuego = v.ID_Videojuego;

-- Obtener videojuegos con un precio superior al promedio
SELECT Titulo, Precio 
FROM Videojuegos 
WHERE Precio > (SELECT AVG(Precio) FROM Videojuegos);

-- Obtener los nombres de los usuarios que han realizado al menos una compra
SELECT Nombres, Correo 
FROM Usuario 
WHERE ID_Usuario IN (
    SELECT ID_Usuario 
    FROM Ventas
);

-- Listar los videojuegos que han sido vendidos al menos una vez en los detalles de venta
SELECT Titulo, Plataforma 
FROM Videojuegos vid
WHERE EXISTS (
    SELECT 1 
    FROM Detalle_ventas dv 
    WHERE dv.ID_Videojuego = vid.ID_Videojuego
);

SELECT Titulo, Plataforma 
FROM Videojuegos vid
WHERE NOT EXISTS (
    SELECT 1 
    FROM Detalle_ventas dv 
    WHERE dv.ID_Videojuego = vid.ID_Videojuego
	)
