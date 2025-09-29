using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infraestrutura.Migrations
{
    /// <inheritdoc />
    public partial class Sprint3_SqlServerConfiguration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "MOTOS_MOTTU",
                columns: table => new
                {
                    ID_MOTO = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PLACA = table.Column<string>(type: "nvarchar(7)", maxLength: 7, nullable: false),
                    CHASSI = table.Column<string>(type: "nvarchar(17)", maxLength: 17, nullable: false),
                    ID_MODELO = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MOTOS_MOTTU", x => x.ID_MOTO);
                });

            migrationBuilder.CreateTable(
                name: "PATIOS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Endereco = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PATIOS", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CARRAPATOS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CodigoSerial = table.Column<string>(type: "nvarchar(7)", maxLength: 7, nullable: false),
                    StatusBateria = table.Column<int>(type: "int", nullable: false),
                    StatusDeUso = table.Column<int>(type: "int", nullable: false),
                    IdPatio = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CARRAPATOS", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CARRAPATOS_PATIOS_IdPatio",
                        column: x => x.IdPatio,
                        principalTable: "PATIOS",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "USUARIOS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Email = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Nome = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Senha = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    DataCriacao = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IdPatio = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_USUARIOS", x => x.Id);
                    table.ForeignKey(
                        name: "FK_USUARIOS_PATIOS_IdPatio",
                        column: x => x.IdPatio,
                        principalTable: "PATIOS",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "MOTOS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Placa = table.Column<string>(type: "nvarchar(7)", maxLength: 7, nullable: false),
                    Chassi = table.Column<string>(type: "nvarchar(17)", maxLength: 17, nullable: false),
                    Modelo = table.Column<int>(type: "int", nullable: false),
                    Zona = table.Column<int>(type: "int", nullable: false),
                    IdPatio = table.Column<int>(type: "int", nullable: false),
                    IdCarrapato = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MOTOS", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MOTOS_CARRAPATOS_IdCarrapato",
                        column: x => x.IdCarrapato,
                        principalTable: "CARRAPATOS",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_MOTOS_PATIOS_IdPatio",
                        column: x => x.IdPatio,
                        principalTable: "PATIOS",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CARRAPATOS_CodigoSerial",
                table: "CARRAPATOS",
                column: "CodigoSerial",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_CARRAPATOS_IdPatio",
                table: "CARRAPATOS",
                column: "IdPatio");

            migrationBuilder.CreateIndex(
                name: "IX_MOTOS_Chassi",
                table: "MOTOS",
                column: "Chassi",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_MOTOS_IdCarrapato",
                table: "MOTOS",
                column: "IdCarrapato",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_MOTOS_IdPatio",
                table: "MOTOS",
                column: "IdPatio");

            migrationBuilder.CreateIndex(
                name: "IX_MOTOS_Placa",
                table: "MOTOS",
                column: "Placa",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_PATIOS_Nome",
                table: "PATIOS",
                column: "Nome",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_USUARIOS_Email",
                table: "USUARIOS",
                column: "Email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_USUARIOS_IdPatio",
                table: "USUARIOS",
                column: "IdPatio");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MOTOS");

            migrationBuilder.DropTable(
                name: "MOTOS_MOTTU");

            migrationBuilder.DropTable(
                name: "USUARIOS");

            migrationBuilder.DropTable(
                name: "CARRAPATOS");

            migrationBuilder.DropTable(
                name: "PATIOS");
        }
    }
}
