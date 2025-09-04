Create Database Diamante_Azul;
Use Diamante_Azul; 

Create table Cliente 
(idCliente  int primary key not null,
nomCliente varchar (60) not null,
TipoDocumento bigint not null,
Direccion varchar (60) not null,
telefonocliente bigint not null );

Create table Empleado
(idEmpleado int primary key not null,
NombreEmple varchar(60) not null,
tipoDocumento varchar(60) not null,
Telefonoemple bigint not null,
emailemple varchar (100 )not null);

Create table cargo
(idcargo int auto_increment key not null,
nombreusu varchar(60) not null,
contra varchar(60) not null,
rol int null);

Create table Producto 
(IdProducto Int auto_increment key not null,
NomProducto Varchar (50) not null,
Descripcion Varchar (300) not null,
Estadopro boolean not null,
Preciopro bigint not null);

Create table Empeño
(idempeño int primary key not null,
fechaempeño date not null,
estadoempeño boolean not null,
interes bigint not null,
id_prod_FK_Empeno int not null,
constraint id_prod_FK_Empeno foreign key (id_prod_FK_Empeno) references Producto (IdProducto),
fechavencimiento date not null);

Create table Factura_Venta (
idfactura_venta int auto_increment primary key not null,
Valor_Total_Factura_Venta Bigint Not null,
Subtotal_Factura_Venta Bigint Not null,
IVA_Factura_Venta Numeric Not null,
Id_Emple_FK_Factura_Venta int Not null,
Constraint Id_Emple_FK_Factura_Venta foreign key (Id_Emple_FK_Factura_Venta) references Empleado(IdEmpleado),
Id_Cliente_FK_Factura_Venta int Not null,
Constraint Id_Cliente_FK_Factura_Venta foreign key (Id_Cliente_FK_Factura_Venta) references Cliente (idCliente),
Estado_Factura_Venta Boolean Not null );

Create table Detalle_Factura_Venta
(Id_Detalle_Factura_Venta int auto_increment Primary key Not null,
Id_Producto_FK_Detalle_Factura_Venta int Not null,
Constraint Id_Producto_FK_Detalle_Factura_Venta foreign key (Id_Producto_FK_Detalle_Factura_Venta) references Producto (IdProducto),
Id_Factura_Venta_FK_Detalle_Factura_Venta int Not null,
Constraint Id_Factura_Venta_FK_Detalle_Factura_Venta foreign key (Id_Factura_Venta_FK_Detalle_Factura_Venta) references Factura_Venta (idFactura_Venta),
Cantidad_Producto int Not null,
Sub_Total_Producto Numeric Not null,
Estado_Detalle_Factura Boolean Not null
);