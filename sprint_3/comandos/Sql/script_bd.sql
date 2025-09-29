create table MOTOS_MOTTU
(
    ID_MOTO   int identity
        constraint PK_MOTOS_MOTTU
            primary key,
    PLACA     nvarchar(7)  not null,
    CHASSI    nvarchar(17) not null,
    ID_MODELO int          not null
)
go

create table PATIOS
(
    Id       int identity
        constraint PK_PATIOS
            primary key,
    Nome     nvarchar(100) not null,
    Endereco nvarchar(200) not null
)
go

create table CARRAPATOS
(
    Id            int identity
        constraint PK_CARRAPATOS
            primary key,
    CodigoSerial  nvarchar(7) not null,
    StatusBateria int         not null,
    StatusDeUso   int         not null,
    IdPatio       int         not null
        constraint FK_CARRAPATOS_PATIOS_IdPatio
            references PATIOS
            on delete cascade
)
go

create unique index IX_CARRAPATOS_CodigoSerial
    on CARRAPATOS (CodigoSerial)
go

create index IX_CARRAPATOS_IdPatio
    on CARRAPATOS (IdPatio)
go

create table MOTOS
(
    Id          int identity
        constraint PK_MOTOS
            primary key,
    Placa       nvarchar(7)  not null,
    Chassi      nvarchar(17) not null,
    Modelo      int          not null,
    Zona        int          not null,
    IdPatio     int          not null
        constraint FK_MOTOS_PATIOS_IdPatio
            references PATIOS,
    IdCarrapato int          not null
        constraint FK_MOTOS_CARRAPATOS_IdCarrapato
            references CARRAPATOS
)
go

create unique index IX_MOTOS_Chassi
    on MOTOS (Chassi)
go

create unique index IX_MOTOS_IdCarrapato
    on MOTOS (IdCarrapato)
go

create index IX_MOTOS_IdPatio
    on MOTOS (IdPatio)
go

create unique index IX_MOTOS_Placa
    on MOTOS (Placa)
go

create unique index IX_PATIOS_Nome
    on PATIOS (Nome)
go

create table USUARIOS
(
    Id          int identity
        constraint PK_USUARIOS
            primary key,
    Email       nvarchar(100) not null,
    Nome        nvarchar(100) not null,
    Senha       nvarchar(100) not null,
    DataCriacao datetime2     not null,
    IdPatio     int           not null
        constraint FK_USUARIOS_PATIOS_IdPatio
            references PATIOS
)
go

create unique index IX_USUARIOS_Email
    on USUARIOS (Email)
go

create index IX_USUARIOS_IdPatio
    on USUARIOS (IdPatio)
go
