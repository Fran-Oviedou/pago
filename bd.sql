-- Active: 1722942989265@@127.0.0.1@3306@pagCobro
-- --- 
-- Table 'Usuario'
-- 
-- SOURCE bd.sql
-- 

DROP TABLE IF EXISTS Carrito_Productos;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Carrito;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Usuario;

CREATE TABLE `Usuario` (
 `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `user_usuario` VARCHAR(100) NOT NULL UNIQUE,
  `nombre_apellido` VARCHAR(250) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `codigo_postal` INT DEFAULT NULL,
  `contraseña_usuario` VARCHAR(60) NOT NULL,
  `telefono` INT DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
);

-- Crear tabla Roles
CREATE TABLE Roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    tipo_rol VARCHAR(50) NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Crear tabla Carrito
CREATE TABLE Carrito (
    id_carrito INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    status_carrito VARCHAR(50),
    metodo_pago VARCHAR(50),
    fecha_pago DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Crear tabla Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    cantidad_producto INT NOT NULL,
    id_carrito INT,
    nombre_producto VARCHAR(255) NOT NULL,
    imagen_producto VARCHAR(1500),
    FOREIGN KEY (id_carrito) REFERENCES Carrito(id_carrito)  
);


CREATE TABLE Carrito_Productos (
    id_carrito_producto INT PRIMARY KEY AUTO_INCREMENT,
    id_carrito INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_carrito) REFERENCES Carrito(id_carrito) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto) ON DELETE CASCADE
);


-- Insertar un usuario de ejemplo
INSERT INTO `Usuario` (user_usuario, nombre_apellido, email, codigo_postal, contraseña_usuario, telefono) 
VALUES ('fran', 'Franco Oviedo', 'd46586677@alumnos.itr.edu.ar', NULL, 'brimarcos', NULL);

INSERT INTO Producto (precio, descripcion, cantidad_producto, nombre_producto, imagen_producto) VALUES
(512, 'Camiseta algodón', 100, 'Camiseta Blanca', 'https://acdn.mitiendanube.com/stores/002/273/996/products/boneco-verano-2023-321-c2b221bf98812ae84b16954034290479-1024-1024.png'), 
(512, 'Pantalón', 50, 'Pantalón Jeans', 'https://m.media-amazon.com/images/I/71mwrMva5lL._AC_UY1000_.jpg'),
(512, 'Gorra con logo', 75, 'Gorra', 'https://i.pinimg.com/originals/0b/e9/87/0be9871bf8fa1210997305cb5cabe8ca.png'),
(512, 'Par de medias de lana', 150, 'Calcetines', 'https://ih1.redbubble.net/image.2954810594.4653/ur,socks_flatlay_medium,square,600x600-bg,f8f8f8.1.jpg'),
(512, 'Suéter de lana', 20, 'Suéter', 'https://i.pinimg.com/originals/60/59/79/605979a6ed2c1771fa7176b154c10251.png'),
(512, 'Bufanda', 90, 'Bufanda', 'https://www.regalosfrikis.com/wp-content/uploads/2014/12/regalos-frikis-bufanda-creeper.png');
