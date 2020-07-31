create database DimensionalE2;
go
use DimensionalE2;
create table DimCliente(
	Skey int primary key identity,
	Cliente varchar(255) unique not null,
	Direccion varchar(255) not null,
	TipoSkey int not null
);
go


create table FactReserva(
	Skey int primary key identity,
	--Fecha datetime not null,
	DimClienteSkey int not null,
	DimAgenciaViajeSkey int not null,
	DimViajeSkey int not null,
	DimTiempoSkey int not null
);
go

create table DimAgenciaViaje(
	Skey int primary key identity,
	AgenciaViaje varchar(255) unique not null,
	--DimOperador
	Operador varchar(255) unique not null,
);
go

create table DimViaje(
	Id int primary key identity,
	Viaje varchar(255) unique not null,
	Descripcion varchar(255) unique not null,
	--DimDestino
	Destino varchar(255) unique not null,
	--DimPais
	Pais varchar(255) unique not null
);
go

create table DimTiempo(
	Skey int primary key identity,
	Ano int not null,
	Mes int not null
);

ALTER TABLE FactReserva ADD CONSTRAINT FK_DimCliente_FactReserva FOREIGN KEY (DimClienteSkey) REFERENCES DimCliente(Skey);
ALTER TABLE FactReserva ADD CONSTRAINT FK_DimAgenciaViaje_FactReserva FOREIGN KEY (DimAgenciaViajeSkey) REFERENCES DimAgenciaViaje(Skey);
ALTER TABLE FactReserva ADD CONSTRAINT FK_DimViaje_FactReserva FOREIGN KEY (DimViajeSkey) REFERENCES DimViaje(Id);
ALTER TABLE  FactReserva ADD CONSTRAINT FK_DimTiempo_FactReserva FOREIGN KEY (DimTiempoSkey) REFERENCES DimTiempo (Skey);

--use master
--drop database DimensionalE2