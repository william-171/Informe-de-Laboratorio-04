--use master;
--drop database DimensionalE1;
create database DimensionalE1;
go
use DimensionalE1;
create table FactEnvio(
	FactEnvioSkey int not null,
	--Fecha datetime not null,
	Costos decimal(10,2) not null,
	DimDestinoSkey int not null,
	DimCentroCostoSkey int not null,
	DimLoteSkey int not null,
	DimModoTransporteSkey int not null,
	DimTiempoSkey int not null,
	--primary key(
	--	FactEnvioSkey,
	--	DimDestinoSkey,
	--	DimCentroCostoSkey,
	--	DimLoteSkey,
	--	DimModoTransporteSkey,
	--	DimTiempoSkey
	--)

);

create table DimDestino(
	Skey int primary key identity,
	Destino varchar(255) not null,
	--DimPais
	Pais varchar(150) not null,
	TarifaImportacion decimal(10,2) not null

);

create table DimCentroCosto(
	Skey int primary key identity,
	CentroCosto varchar(255) not null,
	Responsable varchar(255) not null,
	--DimGrupoCentroCosto
	GrupoCentroCosto varchar(255) not null
);

create table DimLote(
	Skey int primary key identity,
	Lote varchar(255) unique not null,
	Peso decimal(10,2) not null,
	TarifaExportacion decimal(10,2) not null,
	--DimGrupo
	Grupo varchar(255) unique not null
);

create table DimModoTransporte(
	Skey int primary key identity,
	ModoTransporte varchar(255) not null
);

create table DimTiempo(
	Skey int primary key identity,
	Ano int not null,
	Mes int not null
);


ALTER TABLE  FactEnvio ADD CONSTRAINT FK_DimDestino_FactEnvio FOREIGN KEY (DimDestinoSkey) REFERENCES DimDestino (Skey);
ALTER TABLE  FactEnvio ADD CONSTRAINT FK_DimCentroCosto_FactEnvio FOREIGN KEY (DimCentroCostoSkey) REFERENCES DimCentroCosto (Skey);
ALTER TABLE  FactEnvio ADD CONSTRAINT FK_DimLote_FactEnvio  FOREIGN KEY (DimLoteSkey) REFERENCES DimLote (Skey);
ALTER TABLE  FactEnvio ADD CONSTRAINT FK_DimModoTransporte_FactEnvio FOREIGN KEY (DimModoTransporteSkey) REFERENCES DimModoTransporte (Skey);
ALTER TABLE  FactEnvio ADD CONSTRAINT FK_DimTiempo_FactEnvio FOREIGN KEY (DimTiempoSkey) REFERENCES DimTiempo (Skey);