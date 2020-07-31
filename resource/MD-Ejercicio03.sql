--use master;
--drop database ejercicio3;
create database DimensionalE3;
go
use DimensionalE3;


create table FactPaqueteTrabajo(
	Skey int primary key identity,
	Costos decimal(10,2) not null,
	--Fecha Datetime not null,
	Colaborador varchar(250) not null,
	DimProyectoSkey int not null,
	DimResponsableSkey int not null,
	DimLocalidadSkey int not null,
	DimTiempoSkey int not null
);

create table DimProyecto(
	Skey int primary key identity,
	Proyecto varchar(250) unique not null,
	Cliente varchar(250) unique not null,
	Telefono varchar(12) unique not null
);

create table DimResponsable(
	Skey int primary key identity,
	Responsable varchar(250) not null,
	Empresa varchar(250) not null,
);


create table DimTiempo(
	Skey int primary key identity,
	Ano int not null,
	Mes int not null,
	Dia int not null
);


create table DimLocalidad(
	Skey int primary key identity,
	Localidad varchar(250) unique  not null,
	Pais varchar(250) unique  not null
);




alter table FactPaqueteTrabajo add constraint FK_DimLocalidad_FactPaqueteTrabajo foreign key (DimLocalidadSkey) references DimLocalidad(Skey);
alter table FactPaqueteTrabajo add constraint FK_DimProyecto_FactPaqueteTrabajo foreign key (DimProyectoSkey) references DimProyecto(Skey);
alter table FactPaqueteTrabajo add constraint FK_DimResponsable_FactPaqueteTrabajo foreign key (DimResponsableSkey) references DimResponsable(Skey);
alter table FactPaqueteTrabajo add constraint FK_DimTiempo_FactPaqueteTrabajo foreign key (DimTiempoSkey) references DimTiempo(Skey);
