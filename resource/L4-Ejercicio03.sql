--use master;
--drop database ejercicio3;
create database ejercicio3;
go
use ejercicio3;

create table Cliente(
	Id int primary key identity,
	Cliente varchar(250) unique not null,
	Telefono varchar(12) unique not null,
);


create table Proyecto(
	Id int primary key identity,
	Proyecto varchar(250) unique not null,
	ClienteId int not null,
	
);


create table PaqueteTrabajo(
	Id int primary key identity,
	Costos decimal(10,2) not null,
	Fecha Datetime not null,
	Colaborador varchar(250) not null,
	ProyectoId int not null,
	ResponsableId int not null,
	LocalidadId int not null
);

create table Responsable(
	Id int primary key identity,
	Responsable varchar(250) not null,
	EmpresaId int not null
);

create table Empresa(
	Id int primary key identity,
	Responsable varchar(250) not null
);


create table Localidad(
	Id int primary key identity,
	Localidad varchar(250) unique  not null,
	PaisId int not null
);

create table Pais(
	Id int primary key identity,
	Pais varchar(250) unique  not null
);


alter table Localidad add constraint FK_Pais_Localidad foreign key (PaisId) references Pais(Id);
alter table Responsable add constraint FK_Empresa_Responsable foreign key (EmpresaId) references Empresa(Id);
alter table PaqueteTrabajo add constraint FK_Localidad_PaqueteTrabajo foreign key (LocalidadId) references Pais(Id);
alter table PaqueteTrabajo add constraint FK_Proyecto_PaqueteTrabajo foreign key (ProyectoId) references Proyecto(Id);
alter table PaqueteTrabajo add constraint FK_Responsable_PaqueteTrabajo foreign key (ResponsableId) references Responsable(Id);
alter table Proyecto add constraint FK_Cliente_Proyecto foreign key (ClienteId) references Cliente(Id);
