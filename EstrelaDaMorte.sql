CREATE DATABASE EstrelaDaMorte;

USE EstrelaDaMorte;

CREATE TABLE Planetas(
	IdPlaneta int not null,
	Nome varchar(50) not null,
	Rotacao float not null,
	Orbita float not null,
	Diametro float not null,
	Clima varchar(50) not null,
	Populacao int not null,
)
GO
ALTER TABLE Planetas ADD CONSTRAINT PK_Planetas PRIMARY KEY (IdPlaneta);

SELECT * FROM Planetas;

CREATE TABLE Naves(
	IdNave int not null,
	Nome varchar(100) not null,
	Modelo varchar(150) not null,
	Passageiros int not null,
	Carga float not null,
	Classe varchar(100) not null
)
GO
ALTER TABLE Naves ADD CONSTRAINT PK_Naves PRIMARY KEY (IdNave);

SELECT * FROM Naves;

CREATE TABLE Pilotos(
	IdPiloto int not null,
	Nome varchar(200) not null,
	AnoNascimento varchar(10) not null,
	IdPlaneta int not null
)
GO
ALTER TABLE Pilotos ADD CONSTRAINT PK_Pilotos PRIMARY KEY (IdPiloto);
GO
ALTER TABLE Pilotos ADD CONSTRAINT FK_Pilotos_Planetas FOREIGN KEY (IdPlaneta) REFERENCES Planetas (IdPlaneta);

SELECT * FROM Pilotos;

CREATE TABLE PilotosNaves(
	IdPiloto int not null,
	IdNave int not null,
	FlagAutorizado bit not null
)
GO
ALTER TABLE PilotosNaves ADD CONSTRAINT PK_PilotosNaves PRIMARY KEY (IdPiloto, IdNave);
GO
ALTER TABLE PilotosNaves ADD CONSTRAINT FK_PilotosNaves_Pilotos FOREIGN KEY (IdPiloto) REFERENCES Pilotos (IdPiloto);
GO
ALTER TABLE PilotosNaves ADD CONSTRAINT FK_PilotosNaves_Naves FOREIGN KEY (IdNave) REFERENCES Naves (IdNave);
GO
ALTER TABLE PilotosNaves ADD CONSTRAINT DF_PilotosNaves_FlagAutorizado DEFAULT (1) FOR FlagAutorizado;

SELECT * FROM PilotosNaves;

CREATE TABLE HistoricoViagens(
	IdNave int not null,
	IdPiloto int not null,
	DtSaida datetime not null,
	DtChegada datetime null
)
GO
ALTER TABLE HistoricoViagens ADD CONSTRAINT FK_HistoricoViagens_PilotosNaves FOREIGN KEY (IdPiloto, IdNave)
REFERENCES PilotosNaves (IdPiloto, IdNave);
GO
ALTER TABLE HistoricoViagens CHECK CONSTRAINT FK_HistoricoViagens_PilotosNaves;

SELECT * FROM HistoricoViagens;


/*----------------------------*/

select  t1.IdPiloto,
        t1.Nome,
        t1.AnoNascimento,
        t2.IdPlaneta,
        t2.Nome NomePlaneta,
        t2.Rotacao,
        t2.Orbita,
        t2.Diametro,
        t2.Clima,
        t2.Populacao
from    Pilotos t1
inner   join Planetas t2
on      t1.IdPlaneta = t2.IdPlaneta
where   IdPiloto = 2

SELECT * FROM Pilotos;