
create database ejercicio1;
go
use ejercicio1;
go
create table Grupo(
	Id int primary key identity,
	Grupo varchar(255) unique not null
);
go

create table Lote(
	Id int primary key identity,
	Lote varchar(255) unique not null,
	Peso decimal(10,2) not null,
	TarifaExportacion decimal(10,2) not null,
	GrupoId int not null
);
go

create table Pais(
	Id int primary key identity,
	Pais varchar(255) unique not null,
	TarifaImportacion decimal(10,2) not null
);
go

create table Destino(
	Id int primary key identity,
	Destino varchar(255) not null,
	PaisId int not null
);
go

create table Envio(
	Id int primary key identity,
	Fecha datetime not null,
	Costos decimal(10,2) not null,
	CentroCostoId int not null,
	LoteId int not null,
	DestinoId int not null,
	ModoTransporteId int not null,
);
go

create table CentroCosto(
	Id int primary key identity,
	CentroCosto varchar(255) not null,
	Responsable varchar(255) not null,
	GrupoCentroCostoId int not null
);
go

create table GrupoCentroCosto(
	Id int primary key identity,
	GrupoCentroCosto varchar(255) not null
);
go

create table ModoTransporte(
	Id int primary key identity,
	ModoTransporte varchar(255) not null
);
go

alter table CentroCosto add constraint FK_GrupoCentroCosto_CentroCosto foreign key(GrupoCentroCostoId) references GrupoCentroCosto(Id);

alter table Envio add constraint FK_Lote_Envio foreign key(LoteId) references Lote(Id);

alter table Envio add constraint FK_ModoTransporte_Envio foreign key(ModoTransporteId) references ModoTransporte(Id);

alter table Envio add constraint FK_CentroCosto_Envio foreign key(CentroCostoId) references CentroCosto(Id);

alter table Envio add constraint FK_Destino_Envio foreign key(DestinoId) references Destino(Id);

alter table Destino add constraint FK_Pais_Destino foreign key(PaisId) references Pais(Id);

alter table Lote add constraint FK_Grupo_Lote foreign key(GrupoId) references Grupo(Id);


--use master
--drop database Ejercicio1