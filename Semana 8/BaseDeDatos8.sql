Create database Practica08; 
use Practica08;

CREATE TABLE Cuentas (
    IdCuenta INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Saldo DECIMAL(10,2)
);

INSERT INTO Cuentas (IdCuenta, Nombre, Saldo)
VALUES
(1, 'Juan', 1000),
(2, 'Maria', 500);

SELECT * FROM Cuentas;

BEGIN TRY

    UPDATE Cuentas
    SET Saldo = Saldo - 200
    WHERE IdCuenta = 1;

    UPDATE Cuentas
    SET Saldo = Saldo + 200
    WHERE IdCuenta = 2;

    COMMIT TRANSACTION;
	PRINT 'Transferencia realizada correctamente';

END TRY

SELECT * FROM Cuentas;

BEGIN CATCH;

    ROLLBACK TRANSACTION;

    PRINT 'Error en la transacción';
    PRINT ERROR_MESSAGE();

END CATCH;

SELECT * FROM Cuentas;
