create database bdpanaderia;

use bdpanaderia;
select * from detalleventa;

create table admin
(
	id int auto_increment primary key,
    usuario varchar(50),
    contraseña varchar(50)
);
select * from admin;
insert into admin (usuario,contraseña) values('Diego','diego123');

create table empleado
(
codEmp int primary key,
nomEmp varchar(20),
apEmp varchar(20)


);

create table distrito
(
codDis int primary key,
nomDis varchar(20)
);


create table cliente
(
codCli int  primary key,
nomCli varchar(20),
apCli varchar(20),
celCli char(9),
codDis int,
foreign key(codDis) references distrito(codDis)

);

create table venta
(
idVenta int auto_increment primary key,
codEmp int, 
vendedor varchar(50),
codigoProducto INT,
nombreProducto VARCHAR(50),
cantidad INT,
precioUnitario DECIMAL(10,2),
total DECIMAL(10,2),
importeTotal int,
vueltoDinero Decimal(10,2),
fecha DATE,
foreign key(codEmp) references empleado(codEmp)
);


Select * From venta;
SELECT * FROM producto;

create table producto
(
codPro char(5) primary key,
nomPro varchar(20),
precioPro decimal
);


DELIMITER //
 CREATE PROCEDURE `sp_Clientes_por_Distrito`( IN cadena VARCHAR(30))
BEGIN
	SELECT C.codcli, C.nomCli, C.apCli, C.celCli, D.nomDis FROM cliente C INNER JOIN distrito D ON C.codDis = D.codDis WHERE D.nomDis = cadena;
END

