Create DataBase Semana12;
Use Semana12;

CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    FechaRegistro DATE
);

CREATE TABLE Pedidos (
    IdPedido INT PRIMARY KEY,
    IdCliente INT,
    FechaPedido DATE,
    Monto DECIMAL(10,2),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

-- INSERTAR DATOS

INSERT INTO Clientes VALUES
(1,'Juan','Perez','2024-01-15'),
(2,'Maria','Lopez','2024-03-20'),
(3,'Carlos','Gomez','2024-05-10');

INSERT INTO Pedidos VALUES
(101,1,'2024-06-01',250.50),
(102,2,'2024-06-15',300.00),
(103,1,'2024-07-01',150.75);

-- 1. USO DE IN

SELECT *
FROM Clientes
WHERE IdCliente IN (1, 3);

-- 2. USO DE EXISTS

SELECT Nombre, Apellido
FROM Clientes C
WHERE EXISTS (
    SELECT *
    FROM Pedidos P
    WHERE P.IdCliente = C.IdCliente
);

-- 3. FUNCIONES DE FECHA

SELECT
    FechaPedido,
    DAY(FechaPedido) AS Dia,
    MONTH(FechaPedido) AS Mes,
    YEAR(FechaPedido) AS Anio,
    DATEADD(DAY, 30, FechaPedido) AS FechaMas30Dias,
    DATEDIFF(DAY, FechaPedido, GETDATE()) AS DiasTranscurridos,
    GETDATE() AS FechaActual
FROM Pedidos;

-- 4. FUNCIONES DE CADENA

SELECT
    CONCAT(Nombre, ' ', Apellido) AS NombreCompleto,
    LEN(Nombre) AS LongitudNombre,
    SUBSTRING(Nombre, 1, 3) AS PrimerasTresLetras,
    LOWER(Nombre) AS Minusculas,
    UPPER(Apellido) AS Mayusculas,
    LTRIM('    Hola') AS SinEspaciosIzquierda,
    RTRIM('Hola     ') AS SinEspaciosDerecha
FROM Clientes;

-- 5. FUNCIONES DE CONVERSIÓN

SELECT
    Monto,
    CAST(Monto AS INT) AS MontoEntero,
    CONVERT(VARCHAR, FechaPedido, 103) AS FechaFormatoDDMMYYYY
FROM Pedidos;
