create database EyE;
use EyE;


create table `TipoDocumento` (
  `idTipoDocumento` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`));


create table  `Ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCiudad`));


create table  `Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `NumeroDocumento` INT NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Telefono` bigINT NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Contrasena` VARCHAR(45) NOT NULL,
  `TipoDocumento_idTipoDocumento` INT NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `TipoDocumento_idTipoDocumento`, `Ciudad_idCiudad`),
    FOREIGN KEY (`TipoDocumento_idTipoDocumento`)
    REFERENCES `TipoDocumento` (`idTipoDocumento`),
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `Ciudad` (`idCiudad`));


create table  `Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`));


create table  `MetodoPago` (
  `idMetodoPago` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMetodoPago`));


create table  `Carrito` (
  `idCarrito` INT NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCarrito`),
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`));


create table  `Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`));


create table  `Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NOT NULL,
  `CodigoReferencia` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  `Total` DOUBLE NOT NULL,
  `Carrito_idCarrito` INT NOT NULL,
  `MetodoPago_idMetodoPago` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Carrito_idCarrito`, `MetodoPago_idMetodoPago`),
    FOREIGN KEY (`Carrito_idCarrito`)
    REFERENCES `Carrito` (`idCarrito`),
    FOREIGN KEY (`MetodoPago_idMetodoPago`)
    REFERENCES `MetodoPago` (`idMetodoPago`));


create table  `GestionRoles` (
  `Usuario_idUsuario` INT NOT NULL,
  `Rol_idRol` INT NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Rol_idRol`),
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`),
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `Rol` (`idRol`));


create table  `ItemsCarrito` (
  `Cantidad` INT NOT NULL,
  `Carrito_idCarrito` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `Producto_Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`Carrito_idCarrito`, `Producto_idProducto`, `Producto_Categoria_idCategoria`),
    FOREIGN KEY (`Carrito_idCarrito`)
    REFERENCES `Carrito` (`idCarrito`));
    
    
create table`Factura` (
  `producto_idProducto` INT(11) NOT NULL,
  `pedido_idPedido` INT(11) NOT NULL,
  `Cantidad` INT(11) NOT NULL,
  `CodReferencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`producto_idProducto`, `pedido_idPedido`),
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `eye`.`producto` (`idProducto`),
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `eye`.`pedido` (`idPedido`));

    
    
