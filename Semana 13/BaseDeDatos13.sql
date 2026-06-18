
create database Practica13;
use practica13;
CREATE TABLE Empleados (
    IdEmpleado INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Salario DECIMAL(10,2)
);

INSERT INTO Empleados VALUES
(1, 'Juan', 1500),
(2, 'Maria', 2500),
(3, 'Carlos', 3500);

-- 1. FUNCIÓN

CREATE FUNCTION dbo.fn_Bono
(
    @Salario DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salario * 0.10
END;


-- 2. PROCEDIMIENTO ALMACENADO

CREATE PROCEDURE sp_MostrarEmpleado
    @Id INT
AS
BEGIN
    SELECT *
    FROM Empleados
    WHERE IdEmpleado = @Id;
END;


-- 3. MANEJO DE VARIABLES Y CONDICIONAL IF

DECLARE @SalarioEmpleado DECIMAL(10,2);

SELECT @SalarioEmpleado = Salario
FROM Empleados
WHERE IdEmpleado = 1;

IF @SalarioEmpleado > 2000
    PRINT 'Salario Alto';
ELSE
    PRINT 'Salario Bajo';

-- 4. PROGRAMACIÓN DE CURSORES
DECLARE @Nombre VARCHAR(50);

DECLARE CursorEmpleados CURSOR FOR
SELECT Nombre
FROM Empleados;

OPEN CursorEmpleados;

FETCH NEXT FROM CursorEmpleados INTO @Nombre;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Empleado: ' + @Nombre;

    FETCH NEXT FROM CursorEmpleados INTO @Nombre;
END;

CLOSE CursorEmpleados;
DEALLOCATE CursorEmpleados;

-- 5. USO DE LA FUNCIÓN
SELECT
    Nombre,
    Salario,
    dbo.fn_Bono(Salario) AS Bono
FROM Empleados;

-- 6. EJECUTAR PROCEDIMIENTO ALMACENADO
EXEC sp_MostrarEmpleado 1;
EXEC sp_MostrarEmpleado 2;
EXEC sp_MostrarEmpleado 3;
