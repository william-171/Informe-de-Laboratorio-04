create database ejercicio2;
go
use ejercicio2;
go
create table Cliente(
	Id int primary key identity,
	Cliente varchar(255) unique not null,
	Direccion varchar(255) not null,
	TipoId int not null
);
go

create table Tipo(
	Id int primary key identity,
	Tipo varchar(255) unique not null
);
go

create table Reserva(
	Id int primary key identity,
	ClienteId int not null,
	Fecha datetime not null,
	AgenciaViajeId int not null,
	ViajeId int not null
);
go

create table AgenciaViaje(
	Id int primary key identity,
	AgenciaViaje varchar(255) unique not null
);
go


create table Operador(
	Id int primary key identity,
	Operador varchar(255) unique not null,
	AgenciaViajeId int not null
);
go

create table Viaje(
	Id int primary key identity,
	Viaje varchar(255) unique not null,
	Descripcion varchar(255) unique not null,
	DestinoId int not null
);
go

create table Destino(
	Id int primary key identity,
	Destino varchar(255) unique not null,
	PaisId int not null
);
go

create table Pais(
	Id int primary key identity,
	Pais varchar(255) unique not null
);
go

alter table Cliente add constraint FK_Tipo_Cliente foreign key (TipoId) references Tipo(Id);
alter table Reserva add constraint FK_Cliente_Reserva foreign key (ClienteId) references Cliente(Id);
alter table Reserva add constraint FK_AgenciaViaje_Reserva foreign key (AgenciaViajeId) references AgenciaViaje(Id);
alter table Reserva add constraint FK_Viaje_Reserva foreign key (ViajeId) references Viaje(Id);
alter table Operador add constraint FK_AgenciaViaje_Operador foreign key (AgenciaViajeId) references AgenciaViaje(Id);
alter table Viaje add constraint FK_Destino_Viaje foreign key (DestinoId) references Destino(Id);
alter table Destino add constraint FK_Pais_Destino foreign key (PaisId) references Pais(Id);

--use master
--drop database ejercicio2