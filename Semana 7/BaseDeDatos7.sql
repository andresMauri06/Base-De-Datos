create database Practica0;
use Practica0;

CREATE TABLE Empleados (
Id INT PRIMARY KEY,
Nombre VARCHAR(50),
Edad INT,
Departamento VARCHAR (50)
 );

 INSERT INTO Empleados (Id, Nombre, Edad, Departamento)
VALUES 

(2,'Ana',28,'Marketing'),
(3,'Luis',26,'IT'),
(4,'Maria',25,'Recursos Humanos');

SELECT * FROM Empleados;
--Eliminacion de datos
DELETE FROM Empleados
WHERE Id=2;
--
DELETE FROM Empleados
WHERE Edad < 27;
SELECT * FROM Empleados;
--Actualización de Datos de tabla
UPDATE Empleados
SET Nombre = 'Luis'
WHERE Id = 3;

--Actualización de Datos
UPDATE Empleados
SET Departamento = 'General';

SELECT * FROM Empleados;
--Uso de PIVOT
CREATE TABLE Ventas (
    Vendedor VARCHAR(50),
    Mes VARCHAR(20),
    Monto INT
);

INSERT INTO Ventas (Vendedor, Mes, Monto)
VALUES
('Carlos', 'Enero', 100),
('Carlos', 'Febrero', 150),
('Ana', 'Enero', 200),
('Ana', 'Febrero', 250);

SELECT * FROM Ventas;
