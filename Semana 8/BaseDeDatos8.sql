CREATE DATABASE Practica08;
USE Practica08;

-- Tabla de cuentas
CREATE TABLE  Cuentas (
    IdCuenta INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00
);

-- Insertar datos iniciales
INSERT INTO Cuentas (IdCuenta, Nombre, Saldo)
VALUES 
(1, 'Juan', 1000.00),
(2, 'Maria', 500.00)

SELECT * FROM Cuentas;

CREATE FUNCTION fn_ObtenerSaldo(@IdCuenta INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Saldo DECIMAL(10,2);

    SELECT @Saldo = Saldo 
    FROM Cuentas 
    WHERE IdCuenta = @IdCuenta;

    RETURN ISNULL(@Saldo, 0.00);
END;
GO

CREATE PROCEDURE sp_TransferirDinero
    @Origen INT,
    @Destino INT,
    @Monto DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Cuentas SET Saldo = Saldo - @Monto WHERE IdCuenta = @Origen;
        UPDATE Cuentas SET Saldo = Saldo + @Monto WHERE IdCuenta = @Destino;

        COMMIT TRANSACTION;

        SELECT 'Transferencia realizada correctamente' AS Resultado;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SELECT 'Error en la transferencia: ' + ERROR_MESSAGE() AS Resultado;
    END CATCH
END;
GO


CREATE PROCEDURE sp_ConsultarCuenta
    @IdCuenta INT
AS
BEGIN
    SELECT IdCuenta, Nombre, Saldo 
    FROM Cuentas 
    WHERE IdCuenta = @IdCuenta;
END;
GO

CREATE PROCEDURE sp_Depositar
    @IdCuenta INT,
    @Monto DECIMAL(10,2)
AS
BEGIN
    UPDATE Cuentas 
    SET Saldo = Saldo + @Monto 
    WHERE IdCuenta = @IdCuenta;

    SELECT 'Depósito realizado correctamente' AS Resultado;
END;
GO

PRINT '=== Estado Inicial ===';
EXEC sp_ConsultarCuenta 1;
EXEC sp_ConsultarCuenta 2;

EXEC sp_TransferirDinero 1, 2, 200.00;

PRINT '=== Estado Final ===';
EXEC sp_ConsultarCuenta 1;
EXEC sp_ConsultarCuenta 2;

SELECT dbo.fn_ObtenerSaldo(1) AS Saldo_Juan;
