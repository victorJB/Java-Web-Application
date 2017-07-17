USE Company;

DELIMITER //
CREATE PROCEDURE obtenerProveedores()
BEGIN
SELECT * FROM Proveedores;
END //
DELIMITER ;
 
 
DELIMITER //
CREATE PROCEDURE obtenerTipoProducto()
BEGIN
SELECT * FROM TipoProducto;
END //
DELIMITER ;
 
DELIMITER //
CREATE PROCEDURE obtenerRegistrosTemporales()
BEGIN
SELECT * FROM RegistrosTemporales;
END //
DELIMITER ;
 
DELIMITER //
CREATE PROCEDURE obtenerTipoProductoId(IN tipo VARCHAR(100))
BEGIN
SELECT * FROM TipoProducto WHERE nombre = tipo;
END //
DELIMITER ;
 
DELIMITER //
CREATE PROCEDURE InsertarProveedor(IN proveedor VARCHAR(100),clave VARCHAR(100),costo DECIMAL(10,2))
BEGIN
INSERT INTO RegistrosTemporales(proveedor,clave,costo) VALUES (proveedor,clave,costo);
END //
DELIMITER ;
 
DELIMITER //
CREATE PROCEDURE GuardarProducto(IN clave VARCHAR(50),nombre VARCHAR(100),tipoProducto INT(11),proveedor INT(11),costo DECIMAL(10,2),estado INT(11))
BEGIN
INSERT INTO Productos(clave,nombre,tipoProducto,proveedor,costo,estado) VALUES (clave, nombre, tipoProducto,proveedor,costo,estado);
END //
DELIMITER ;
 
DELIMITER //
CREATE PROCEDURE EliminarProveedorTemporal(IN idProveedor INT(11))
BEGIN
DELETE FROM registrosTemporales WHERE id = idProveedor; 
END //
DELIMITER ;