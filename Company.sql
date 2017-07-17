CREATE DATABASE Company;
 
USE Company;
 
CREATE TABLE TipoProducto
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(100) NOT NULL
);
 
CREATE TABLE Proveedores
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(100) NOT NULL
);
 
CREATE TABLE Productos
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  clave VARCHAR(50) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  tipoProducto INT NULL,
  proveedor INT NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  estado INT NOT NULL,
  FOREIGN KEY (tipoProducto) REFERENCES TipoProducto(id),
  FOREIGN KEY (proveedor) REFERENCES Proveedores(id)
);
 
CREATE TABLE RegistrosTemporales
(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   proveedor VARCHAR(100) NOT NULL,
   clave VARCHAR(100) NOT NULL,
   costo DECIMAL(10,2) NOT NULL
);
 
INSERT INTO  TipoProducto(nombre,descripcion) VALUES('Limpieza','Articulos relacionados con la limpieza');
INSERT INTO  TipoProducto(nombre,descripcion) VALUES('Abarrotes','Articulos de la categoria abarrotes');
INSERT INTO  TipoProducto(nombre,descripcion) VALUES('Medicamentos','Farmacos');
INSERT INTO  TipoProducto(nombre,descripcion) VALUES('Papeleria','Articulos escolares y de oficina');
INSERT INTO  TipoProducto(nombre,descripcion) VALUES('Otros','Articulos que no estan relacionados a ninguna categoria');
 
INSERT INTO Proveedores(nombre,descripcion) VALUES('Distribuidora Mexico','Proveedor de productos de origen mexicano');
INSERT INTO Proveedores(nombre,descripcion) VALUES('Abarrotes a Granel Ruiz','Proveedor de abarrotes y productos relacionados');
INSERT INTO Proveedores(nombre,descripcion) VALUES('Surtidora la Morena','Proveedor de productos en general');
 
INSERT INTO Productos(clave,nombre,tipoProducto,proveedor,costo,estado) VALUES('PINOL360','Pinol Limpiador 360 ml',1,1,20.50,1);
INSERT INTO Productos(clave,nombre,tipoProducto,proveedor,costo,estado) VALUES('P123450','Pinol Limpiador 360 ml',1,2,21.00,1);
INSERT INTO Productos(clave,nombre,tipoProducto,proveedor,costo,estado) VALUES('LIMP-PINOL01','Pinol Limpiador 360 ml',1,3,19.80,1);
 
INSERT INTO registrostemporales(proveedor,clave,costo) VALUES('Surtidora la Morena','25Pinol','11.50');
INSERT INTO registrostemporales(proveedor,clave,costo) VALUES('Distribuidora Mexico','PinolABC','13.50');
INSERT INTO registrostemporales(proveedor,clave,costo) VALUES('Abarrotes a Granel Ruiz','PINOL','12.00');