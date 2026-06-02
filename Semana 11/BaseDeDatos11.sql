Create DataBase Practica11;

Use practica11;

IF OBJECT_ID('Ventas', 'U')
    DROP TABLE Ventas;

CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    Empleado VARCHAR(50),
    Region VARCHAR(30),
    Producto VARCHAR(50),
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    FechaVenta DATE
);

INSERT INTO Ventas (Empleado, Region, Producto, Cantidad, PrecioUnitario, FechaVenta)
VALUES 
    ('Juan Pérez',     'Norte',   'Laptop',      2,  1200.00, '2026-01-15'),
    ('Juan Pérez',     'Norte',   'Mouse',       5,    25.00, '2026-01-15'),
    ('María López',    'Sur',     'Laptop',      1,  1100.00, '2026-01-20'),
    ('María López',    'Sur',     'Teclado',     3,    45.00, '2026-01-20'),
    ('Carlos Ruiz',    'Norte',   'Monitor',     2,   250.00, '2026-02-01'),
    ('Ana Torres',     'Centro',  'Laptop',      3,  1150.00, '2026-02-05'),
    ('Ana Torres',     'Centro',  'Mouse',       10,   20.00, '2026-02-05'),
    ('Luis Gómez',     'Sur',     'Impresora',   1,   300.00, '2026-02-10'),
    ('Juan Pérez',     'Norte',   'Laptop',      1,  1250.00, '2026-02-15'),
    ('María López',    'Sur',     'Monitor',     2,   280.00, '2026-02-20');


SELECT COUNT(*) AS TotalVentas FROM Ventas;

SELECT 
    SUM(Cantidad) AS TotalUnidadesVendidas,
    SUM(Cantidad * PrecioUnitario) AS TotalIngresos
FROM Ventas;

SELECT 
    AVG(Cantidad * PrecioUnitario) AS TicketPromedio,
    MAX(Cantidad * PrecioUnitario) AS VentaMasAlta,
    MIN(Cantidad * PrecioUnitario) AS VentaMasBaja
FROM Ventas;

SELECT 
    Empleado,
    COUNT(*) AS NumVentas,
    SUM(Cantidad) AS TotalUnidades,
    SUM(Cantidad * PrecioUnitario) AS TotalVendido,
    AVG(Cantidad * PrecioUnitario) AS PromedioPorVenta,
    MAX(Cantidad * PrecioUnitario) AS MayorVenta,
    MIN(Cantidad * PrecioUnitario) AS MenorVenta
FROM Ventas
GROUP BY Empleado
ORDER BY TotalVendido DESC;

SELECT 
    Region,
    COUNT(*) AS NumVentas,
    SUM(Cantidad * PrecioUnitario) AS TotalIngresos,
    AVG(Cantidad) AS PromedioCantidad
FROM Ventas
GROUP BY Region;

SELECT 
    Producto,
    COUNT(*) AS VecesVendido,
    SUM(Cantidad) AS TotalUnidades,
    SUM(Cantidad * PrecioUnitario) AS IngresosTotales
FROM Ventas
GROUP BY Producto
ORDER BY IngresosTotales DESC;


SELECT 
    Empleado,
    SUM(Cantidad * PrecioUnitario) AS TotalVendido,
    COUNT(*) AS NumTransacciones
FROM Ventas
GROUP BY Empleado
HAVING SUM(Cantidad * PrecioUnitario) > 1500
ORDER BY TotalVendido DESC;

SELECT 
    Region,
    COUNT(*) AS NumVentas,
    SUM(Cantidad * PrecioUnitario) AS TotalIngresos
FROM Ventas
GROUP BY Region
HAVING COUNT(*) > 3;

SELECT 
    Producto,
    SUM(Cantidad) AS TotalUnidades,
    SUM(Cantidad * PrecioUnitario) AS Ingresos
FROM Ventas
GROUP BY Producto
HAVING SUM(Cantidad) > 5;


SELECT 
    Region,
    Empleado,
    COUNT(*) AS NumVentas,
    SUM(Cantidad) AS UnidadesVendidas,
    SUM(Cantidad * PrecioUnitario) AS TotalIngresos,
    AVG(Cantidad * PrecioUnitario) AS TicketPromedio
FROM Ventas
GROUP BY Region, Empleado
HAVING SUM(Cantidad * PrecioUnitario) > 1000
ORDER BY Region, TotalIngresos DESC;
