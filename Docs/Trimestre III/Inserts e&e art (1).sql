USE EyE;


-- Insert Tabla Metodos de pago--
INSERT INTO metodopago (Descripcion)
VALUES 
("Transferencia Bancaria"),
("Tarjeta De Credito"),
("Tarjeta De Debito"),
("Paypal"),
("Nequi"),
("Daviplata");

-- ====================================================================================================================================================================================

-- Insert Tabla Tipo de Documento --
INSERT INTO tipodocumento (Descripcion)
VALUES 
("Cedula de Ciudadania"),
("Tarjeta De Identidad"),
("Pasaporte"),
("Cedula de Extranjeria"),
("Pasaporte Extranjero"),
("Visa");

-- ====================================================================================================================================================================================

-- Insert Tabla Ciudad --
INSERT INTO ciudad (Descripcion)
VALUES 
("Bogotá"),
("Medellín"),
("Cali"),
("Barranquilla"),
("Cartagena"),
("Soacha"),
("Cúcuta"),
("Bucaramanga"),
("Valledupar"),
("Ibagué"),
("Pereira"),
("Manizales"),
("Neiva"),
("Itagüí"),
("Riohacha"),
("Pasto");

-- ====================================================================================================================================================================================

-- Insert Tabla Rol --
INSERT INTO Rol (Descripcion)
VALUES 
("Cliente"),
("Administrador");

-- ====================================================================================================================================================================================

-- Insert Tabla Usuario --
INSERT INTO usuario (Nombre , Apellido , NumeroDocumento , Direccion, Telefono , Correo , Contrasena, TipoDocumento_IdTipoDocumento , Ciudad_IdCiudad)
VALUES 
("Ivan Eduardo", "Olmos Ramirez" , "1034779066" ,"cll154 58 23"  ,"3052577073" , "Ivanolmos211@gmail.com" , "Ivan211" ,  2 , 1 ),
("Sergio David", "Olmos Ramirez" , "1001773345" , "cll15 15 76"  ,"3042263091", "sergioolmos614@gmail.com" , "Serginho10" ,  1 , 1 ),
("Marcy Yaneth", "Ramirez Lancheros" , "23390375" , "cll42 12 42" ,"3204530509" , "Marcyyrl2171@gmail.com" , "Marcy2114" ,  1 , 1 ),
("Eduardo Alfonso", "Patiño Olmos" , "27534704" , "cll31 14 53"  ,"3207088543", "EduardoAlfonsoOlmos@gmail.com" , "Alfonso14" ,  1 , 1 ),
("Diego", "Patiño Rodriguez" , "1001323426" ,"cll14 123 31"  ,"3104830990" , "patiñodiego0610@gmail.com" , "DiegoP610" ,  1 , 1 ),
("Eduardo Antonio", "Balza Peña" , "1034779066" ,"cll4 21 65"  ,"3001843390" , "eduardobalzapeña15@gmail.com" , "Eduardo012" ,  1 , 1 ),
("Daniel Felipe", "Romero Moreno" ,"1014180413" ,"cll3 77 34" , "3172539255", "danielfeliperomeromoreno799@gmail.com" , "Danigod777" ,  1 , 1 ),
("Brayam Sneider", "Cerquera Rodriguez" , "1016007699" ,"cll13 42 42"  ,"3103227324", "brayamscr0614@gmail.com" , "Brayam0614" ,  2 , 15),
("Yeimi ", "Rodriguez Suarez" , "1003456777" ,"cll31 52 53"  ,"3104577052", "yeimirs21@gmail.com" , "Suarez21" ,  1 , 10 ),
("Andres Leonardo", "Ramirez Pinilla" , "1024556789" ,"cll143 42 12"  ,"3202543312", "leopinilla12@gmail.com" , "Meoessi" ,  1 , 12),
("Luisa Fernanda", "Sandoval Suarez" , "1035883410" ,"cll42 42 65"  ,"3123430507" ,  "LuuFer11@gmail.com" , "Fer1001" ,  1 , 1 ),
("Lorena","Medina Yazo" , "1034644559" ,"cll123 75 34"  ,"3081468955" ,"lorenamedina@gmail.com" , "Lore2005" ,  2 , 1 ),
("Luis Fernando", "Morales" , "1036228570" ,"cll12 73 73"  ,"3194274397", "luis123445566@gmail.com" , "Luisito777" ,  1 , 1 ),
("Shirley vanessa", "Garcia" , "1040542672" ,"cll76 16 86"  ,"3017625608", "shirleyvanessa@gmail.com" , "Shirleyvg" ,  1 , 3 ),
("Juliana Andrea", "Lopez Ramirez" , "1032609112" , "cll15 62 42" ,"3194364371", "Lopezandrea@gmail.com" , "lopandrea11" ,  2 , 5 ),
("Maria del Carmen", "Osorio" ," 1820034430" ,"cll51 52 42"  ,"3048455901", "Mariaosorio@gmail.com" , "Mariacaro" ,  4 , 6 ),
("Mark aniton", "Petterson offord" ," 0001565241" ,"cll126 73 63" , "8003542235", "MarkAnitonPA@gmail.com" , "Markpa" ,  5 , 1 ),
("Maria Camila", "Soto Arias" , "1001843765" ,"cll65 24 61" , "3108466901", "Marisoto@gmail.com" , "Cami7" ,  1 , 2 ),
("Timmy", "Sandoval Valenzuela" , "1030458792 ", "cll61 24 12" ,"3052438212", "elgrantimmy12@gmail.com" , "Timitorner" ,  1 , 1 ),
("Jann Paul", " Romero Fernandez" , "1020656544" , "cll42 65 62"  ,"3108024335", "papol112@gmail.com" , "Papol200512" ,  1 , 1 );

-- ====================================================================================================================================================================================

-- Insert Tabla Gestion de Rol --
INSERT INTO gestionroles (Usuario_IdUsuario , Rol_IdRol)
VALUES 
(1 , 2),
(2 , 1),
(3 , 1),
(4 , 1),
(5 , 1),
(6 , 2),
(7 , 2),
(8 , 2),
(9 , 1),
(10 , 1),
(11 , 1),
(12 , 1),
(13 , 1),
(14 , 1),
(15 , 1);

-- ====================================================================================================================================================================================

-- Insert Tabla Categorias --
INSERT INTO categoria (Descripcion)
VALUES ("Jabones"),
("Antibacterial"),
("Cremas Faciales"),
("Cremas Corporales"),
("Velas"),
("Belleza");

-- ====================================================================================================================================================================================

-- Insert Tabla Producto --
INSERT INTO producto (Nombre , DescripcionProducto , Precio , Stock , categoria_Idcategoria)
VALUES 
("Jabon Glicerina Calendula" , "" , 62000 ,20, 1),
("Velas de Manzanilla" , "" , 8500 , 15 , 5 ),
("Jabon Glicerina Naranja" , "" , 67000 , 8 , 1),
("Crema Facial E&E art" , "" , 16500 , 5 , 3),
("Exfoliante Facial E&E art " , "" , 20000 , 11 , 3),
("Gel Antibacterial" , "" , 19000 , 3 ,2),
("Jabon Corporal Avena" , "" , 7500 , 9 , 4),
("Jabon Glicerina Natural" , "" , 47000 , 20 , 1),
("Jabon Corporal Maracuya" , "" , 9500 , 6 ,4),
("Jabon Glicerina Cereza" , "" , 57000 , 4 ,1),
("Mascara de Carbon" , "" , 38000 , 11 , 3),
("Jabon Glicerina Mora" , "" , 57000 , 4 , 1);

-- ====================================================================================================================================================================================

-- Insert Tabla Carrito --
INSERT INTO Carrito (Usuario_idUsuario)
VALUES 
("1"), 
("3"), 
("4"), 
("7"), 
("15"), 
("6"), 
("10"), 
("2"), 
("8"), 
("11"), 
("9"), 
("12"), 
("5");

-- ====================================================================================================================================================================================

-- Insert Tabla itemscarrito--
 insert into itemscarrito (Carrito_idCarrito, Producto_idProducto, Cantidad , Producto_Categoria_idCategoria)
 values 
 (4,3,10,1), 
 (3,2,20,5), 
 (1,11,22,3),
 (6,10,18,1), 
 (12,5,15,3),
 (13,6,25,2), 
 (8,1,11,1), 
 (7,2,31,5), 
 (5,12,45,1), 
 (9,4,2,3);

-- ====================================================================================================================================================================================

-- Insert Tabla pedido --
INSERT INTO pedido (Fecha , CodigoReferencia , Cantidad , Total  , Carrito_idCarrito , MetodoPago_IdMetodoPago)
VALUES 
("2023-10-01", 001, 4, 80000 , 1 ,1),
("2023-06-11", 004, 6, 78000 , 2 , 4),
("2023-12-16", 006, 10, 65000 ,  3 , 2),
("2023-11-02", 008, 2, 30000 , 4, 1),
("2023-10-05", 011, 9, 33000  , 5 , 5),
("2022-04-04", 004, 1, 40000 , 5 , 5),
("2018-11-27", 008, 13, 55000  , 5 , 1),
("2023-10-01", 044, 43, 90000 , 5 , 5),
("2023-10-01", 001, 4, 80000 , 5 , 6),
("2021-09-08", 033, 8, 40000 , 5 , 2),
("2021-09-16", 008, 2, 75000 , 5 , 3),
("2020-05-12", 010, 5, 50000 , 5 , 2),
("2021-09-16", 008, 2, 75000 , 5 , 3),
("2020-05-12", 010, 5, 50000 , 5 , 4), 
("2022-01-10", 002, 3, 40000 , 5 , 4),
("2021-12-30", 012, 6, 45000 , 5 , 2),
("2023-06-25", 013, 5, 90000 , 5 , 3);

