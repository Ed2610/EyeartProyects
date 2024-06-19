CREATE DATABASE  IF NOT EXISTS `eye`; 
USE `eye`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: monorail.proxy.rlwy.net    Database: eye
-- ------------------------------------------------------
-- Server version	8.4.0

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;


CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
);


--
-- Dumping data for table `tipodocumento`
--


INSERT INTO `tipodocumento` VALUES (1,'Cedula de Ciudadania'),(4,'Cedula de Extranjeria'),(3,'Pasaporte'),(5,'Pasaporte Extranjero'),(2,'Tarjeta De Identidad'),(6,'Visa');


--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;


CREATE TABLE `ciudad` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idCiudad`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
);


--
-- Dumping data for table `ciudad`
--

INSERT INTO `ciudad` VALUES (4,'Barranquilla'),(1,'Bogotá'),(8,'Bucaramanga'),(3,'Cali'),(5,'Cartagena'),(7,'Cúcuta'),(10,'Ibagué'),(14,'Itagüí'),(12,'Manizales'),(2,'Medellín'),(13,'Neiva'),(16,'Pastos'),(11,'Pereira'),(15,'Riohacha'),(6,'Soacha'),(9,'Valledupar');


--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;


CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `NumeroDocumento` int NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` bigint NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Contrasena` varchar(45) NOT NULL,
  `TipoDocumento_idTipoDocumento` int NOT NULL,
  `Ciudad_idCiudad` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`TipoDocumento_idTipoDocumento`,`Ciudad_idCiudad`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  KEY `TipoDocumento_idTipoDocumento` (`TipoDocumento_idTipoDocumento`),
  KEY `Ciudad_idCiudad` (`Ciudad_idCiudad`),
  CONSTRAINT `fk_Usuario_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`),
  CONSTRAINT `fk_Usuario_TipoDocumento1` FOREIGN KEY (`TipoDocumento_idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`)
);


--
-- Dumping data for table `usuario`
--


INSERT INTO `usuario` VALUES (2,'Ivan Eduardo','Olmos Ramirez',1034779066,'',3052577073,'Ivanolmos211@gmail.com','f2653f181d41985a0c662b439252258a',2,1),(3,'Sergio David','Olmos Ramirez',1001773345,'',3042263091,'sergioolmos614@gmail.com','4ea1e578eaad8658708de967341e4994',1,1),(4,'Marcy Yaneth','Ramirez Lancheros',23390375,'',3204530509,'Marcyyrl2171@gmail.com','2c7a55bd3fcd75307b4fb61f176655b8',1,1),(5,'Eduardo Alfonso','Patiño Olmos',27534704,'',3207088543,'EduardoAlfonsoOlmos@gmail.com','736ee19b73e5a7c925c7584c757568ec',1,1),(6,'Diego','Patiño Rodriguez',1001323426,'',3104830990,'patiñodiego0610@gmail.com','59de7e2fd49f59d866a9dd3eb30dbc6e',1,1),(7,'Eduardo Antonio','Balza Peña',1034779066,'',3001843390,'eduardobalzapeña15@gmail.com','0479310914ef8174d5bafa74e5221a9a',1,1),(8,'Daniel Felipe','Romero Moreno',1014180413,'',3172539255,'danielfeliperomeromoreno799@gmail.com','8431afe0d0d8c2fe1477e2f9d579692b',1,1),(9,'Brayam Sneider','Cerquera Rodriguez',1016007699,'',3103227324,'brayamscr0614@gmail.com','56496955388ae6ff31dccbad262e53e2',2,15),(10,'Yeimi ','Rodriguez Suarez',1003456777,'',3104577052,'yeimirs21@gmail.com','b13a8014871dc6e33e26bf12d39cf068',1,10),(11,'Andres Leonardo','Ramirez Pinilla',1024556789,'',3202543312,'leopinilla12@gmail.com','3e0618852234c2176e0e8e53f62dbfb2',1,12),(12,'Luisa Fernanda','Sandoval Suarez',1035883410,'',3123430507,'LuuFer11@gmail.com','3d9f2e6ad52a26f54de175b96a4d1548',1,1),(13,'Lorena','Medina Yazo',1034644559,'',3081468955,'lorenamedina@gmail.com','14a078e9d9c6683f976125689e1ceb27',2,1),(14,'Luis Fernando','Morales',1036228570,'',3194274397,'luis123445566@gmail.com','3f2e35a6dc69bc4d1317f3f092a6bc92',1,1),(15,'Shirley vanessa','Garcia',1040542672,'',3017625608,'shirleyvanessa@gmail.com','7c8349ea89cad737c67a0e0c25c8882a',1,3),(16,'Juliana Andrea','Lopez Ramirez',1032609112,'',3194364371,'Lopezandrea@gmail.com','2bcc04f2b01b490f5ff9a2a89701bc0d',2,5),(17,'Maria del Carmen','Osorio',1820034430,'',3048455901,'Mariaosorio@gmail.com','d27282dcfabdc1394fdc844020846741',4,6),(18,'Mark aniton','Petterson offord',1565241,'',8003542235,'MarkAnitonPA@gmail.com','02e3d5b669281b96dfa0a77f3c29f2f4',5,1),(19,'Maria Camila','Soto Arias',1001843765,'',3108466901,'Marisoto@gmail.com','777a6306da38955193326f6f0b0f1a48',1,2),(20,'Timmy','Sandoval Valenzuela',1030458792,'',3052438212,'elgrantimmy12@gmail.com','49070333beba15a2c02cc596d4e1f3fa',1,1),(21,'Jann Paul',' Romero Fernandez',1020656544,'',3108024335,'papol112@gmail.com','a6e92c4335b5128773ce4a2fdcbd54ce',1,1),(22,'Fulanito','Noseque',1020848559,'Calle 80',3005897444,'ed@gmail.com','25f9e794323b453885f5181f1b624d0b',1,1),(23,'Fulanito','Noseque',1020848559,'Calle 80',3005897444,'ed@gmail.com','25f9e794323b453885f5181f1b624d0b',1,1),(24,'Eduardo','Balza',1058796666,'calle 10000',3005879666,'pep@gmail.com','25f9e794323b453885f5181f1b624d0b',1,1),(25,'Pepito','Perez',1020587999,'Calle 100',3008759666,'pep45@gmail.com','25f9e794323b453885f5181f1b624d0b',1,1),(26,'Marvel','Peña',15978888,'calle 45',3005896777,'marvel@gmail.com','25f9e794323b453885f5181f1b624d0b',4,3),(27,'Peppa','Pig',2147483647,'Calle Cerdo',300589647,'peppa@gmail.com','25f9e794323b453885f5181f1b624d0b',1,1),(31,'Pepito','Perez',1058796666,'Calle 100',3008759666,'ed24@gmail.com','25f9e794323b453885f5181f1b624d0b',1,1),(32,'Fernando','Vazquez',1076543876,'Calle 9# Pueblo Paleta',3009812546,'tagapeth@gmail.com','25f9e794323b453885f5181f1b624d0b',1,5),(33,'Nicolás','Alarcón',1031642434,'calle 100',3229118880,'nicolasf5231@gmail.com','d2ba718fabd848655343b6639eef7bf5',1,1);



--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;


CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
);


--
-- Dumping data for table `rol`
--


INSERT INTO `rol` VALUES (2,'Administrador'),(1,'Cliente');


--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;


CREATE TABLE `roles_usuarios` (
  `idUsuario` int NOT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idRol`),
  KEY `fk_usuario` (`idUsuario`),
  KEY `fk_rol` (`idRol`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
);


--
-- Dumping data for table `roles_usuarios`
--


INSERT INTO `roles_usuarios` VALUES (31,2),(33,2);


--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;


CREATE TABLE `carrito` (
  `idCarrito` int NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` int NOT NULL,
  PRIMARY KEY (`idCarrito` , `Usuario_idUsuario`),
  CONSTRAINT `fk_Carrito_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
);


--
-- Dumping data for table `carrito`
--


INSERT INTO carrito (Usuario_idUsuario)VALUES ("3"), ("4"),("7"),("15"),("6"),("10"),("2"),("8"),("11"),("9"),("12"),("5");


--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;


CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
);


--
-- Dumping data for table `categoria`
--


INSERT INTO `categoria` VALUES (1,'Jabones'),(2,'Antibacterial'),(3,'Cremas Faciales'),(4,'Cremas Corporales'),(5,'Velas'),(6,'Belleza');


--
-- Table structure for table `metodopago`
--

DROP TABLE IF EXISTS `metodopago`;


CREATE TABLE `metodopago` (
  `idMetodoPago` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idMetodoPago`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
);


--
-- Dumping data for table `metodopago`
--


INSERT INTO `metodopago` VALUES (7,'Bancolombia'),(6,'Daviplata'),(5,'Nequi'),(4,'Paypal'),(2,'Tarjeta De Credito'),(3,'Tarjeta De Debito'),(1,'Transferencia Bancaria');


--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;


CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `CodigoReferencia` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Total` double NOT NULL,
  `Carrito_idCarrito` int NOT NULL,
  `MetodoPago_idMetodoPago` int NOT NULL,
  PRIMARY KEY (`idPedido`,`Carrito_idCarrito`,`MetodoPago_idMetodoPago`),
  UNIQUE KEY `idPedido` (`idPedido`),
  KEY `Carrito_idCarrito` (`Carrito_idCarrito`),
  KEY `MetodoPago_idMetodoPago` (`MetodoPago_idMetodoPago`),
  CONSTRAINT `fk_Pedido_Carrito1` FOREIGN KEY (`Carrito_idCarrito`) REFERENCES `carrito` (`idCarrito`),
  CONSTRAINT `fk_Pedido_MetodoPago1` FOREIGN KEY (`MetodoPago_idMetodoPago`) REFERENCES `metodopago` (`idMetodoPago`)
);


--
-- Dumping data for table `pedido`
--



--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;


CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `DescripcionProducto` varchar(45) NOT NULL,
  `Precio` double NOT NULL,
  `Stock` int NOT NULL,
  `url_foto` text,
  `Categoria_idCategoria` int NOT NULL,
  PRIMARY KEY (`idProducto`,`Categoria_idCategoria`),
  UNIQUE KEY `idProducto` (`idProducto`),
  KEY `Categoria_idCategoria` (`Categoria_idCategoria`),
  CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`Categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`)
);


--
-- Dumping data for table `producto`
--


INSERT INTO `producto` VALUES (3,'Jabon de Hojuelas','Jabón super Rico de glicerina para la piel, e',20000,6,'https://i.ibb.co/rGjG8KB/Whats-App-Image-2024-05-20-at-10-49-33-AM-3.jpg',1),(4,'Crema hidratante','crema para hidratar de eye art ',35000,10,'https://i.ibb.co/94tfPp9/Whats-App-Image-2024-05-20-at-10-49-34-AM-1.jpg',4),(5,'Crema 2','Prueba',41000,5,'https://i.ibb.co/rkyf6Wg/Whats-App-Image-2024-05-20-at-10-49-33-AM-2.jpg',3),(6,'Crema 3','Prueba',45000,5,'https://i.ibb.co/nzZSDz5/Whats-App-Image-2024-05-20-at-10-49-32-AM.jpg',1),(7,'Crema 4','Prueba de inserción de productos ',45000,5,'https://i.ibb.co/jwPNG7P/Whats-App-Image-2024-05-20-at-10-49-27-AM.jpg',4),(8,'Crema 5','Prueba de inserción de productos ',45000,5,'https://i.ibb.co/J2QMR3J/Whats-App-Image-2024-05-20-at-10-49-26-AM-1.jpg',1),(9,'Crema 6','Prueba de inserción de productos',45000,5,'https://i.ibb.co/J2QMR3J/Whats-App-Image-2024-05-20-at-10-49-26-AM-1.jpg',1),(13,'Nuevo Producto','Producto revolucionario',7000,10,'https://i.ibb.co/Tw6Jj92/Whats-App-Image-2024-05-20-at-10-49-28-AM-1.jpg',4),(20,'New','test',45000,4,'https://i.ibb.co/GW4WHVr/Whats-App-Image-2024-05-20-at-10-49-25-AM.jpg',3),(38,'Jabon rojo','rojo',100000,1,'https://i.ibb.co/TT2gvYx/Whats-App-Image-2024-05-20-at-10-49-30-AM.jpg',1),(39,'Producto novedoso','Jabon hermoso que rejuvenece la piel',60000,10,'https://i.ibb.co/Mgg82kD/Whats-App-Image-2024-06-12-at-5-07-26-PM2.jpg',1),(40,'Producto mas','Rejuvncemiento de piel',45000,10,'https://i.ibb.co/3Y60mbZ/Whats-App-Image-2024-06-12-at-5-07-26-PM.jpg',1),(41,'Agua de rosas','Agua purificante para piel',156000,5,'https://i.ibb.co/yyJHrZk/descarga-1-1.png',1),(42,'Este magnifico Jabon','Este jabon grande',14700,10,'https://i.ibb.co/30X8ZwN/Whats-App-Image-2024-05-20-at-10-49-19-AM.jpg',1),(43,'Product Cremas++','Testeo desde hosting',15000,10,'https://i.ibb.co/M8D4PXY/Whats-App-Image-2023-12-03-at-9-29-24-PM.jpg',1),(44,'Jabon novedoso','Prueba',26000,10,'https://i.ibb.co/r2Q8y0R/pngtree-eco-soap-bar-png-image-13355886.png',1);


--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;


CREATE TABLE `factura` (
  `producto_idProducto` int NOT NULL,
  `pedido_idPedido` int NOT NULL,
  `Cantidad` int NOT NULL,
  `CodReferencia` varchar(45) NOT NULL,
  PRIMARY KEY (`producto_idProducto`,`pedido_idPedido`),
  KEY `pedido_idPedido` (`pedido_idPedido`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`pedido_idPedido`) REFERENCES `pedido` (`idPedido`)
);


--
-- Dumping data for table `factura`
--





--
-- Table structure for table `itemscarrito`
--

DROP TABLE IF EXISTS `itemscarrito`;


CREATE TABLE `itemscarrito` (
  `idItem` int NOT NULL AUTO_INCREMENT,
  `Cantidad` int NOT NULL,
  `Carrito_idCarrito` int NOT NULL,
  `Producto_idProducto` int NOT NULL,
  PRIMARY KEY (`idItem`),
  KEY `itemscarrito_ibfk_1` (`Producto_idProducto`),
  KEY `itemscarrito_ibfk_2` (`Carrito_idCarrito`),
  CONSTRAINT `itemscarrito_ibfk_1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `itemscarrito_ibfk_2` FOREIGN KEY (`Carrito_idCarrito`) REFERENCES `carrito` (`idCarrito`)
);


--
-- Dumping data for table `itemscarrito`
--


INSERT INTO `itemscarrito` VALUES (1,10,4,3),(2,20,3,3),(3,22,1,13),(4,18,6,20),(5,15,12,5),(6,25,3,6),(7,11,8,44),(8,31,7,38),(9,45,5,39),(10,2,9,4);




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 17:16:55
