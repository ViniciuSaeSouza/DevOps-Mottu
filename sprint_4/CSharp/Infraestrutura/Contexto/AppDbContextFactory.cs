using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System.IO;

namespace Infraestrutura.Contexto
{
    public class AppDbContextFactory : IDesignTimeDbContextFactory<AppDbContext>
    {
        public AppDbContext CreateDbContext(string[] args)
        {
            // Caminho absoluto para garantir que o arquivo seja encontrado
            var appSettingsPath = Path.Combine(Directory.GetCurrentDirectory(), "..", "API", "appsettings.json");
            if (!File.Exists(appSettingsPath))
                throw new FileNotFoundException($"Arquivo de configuração não encontrado: {appSettingsPath}");

            var config = new ConfigurationBuilder()
                .AddJsonFile(appSettingsPath)
                .Build();
            var connectionString = config.GetConnectionString("SqlServer");
            if (string.IsNullOrWhiteSpace(connectionString))
                throw new InvalidOperationException($"String de conexão 'SqlServer' não encontrada em {appSettingsPath}.");

            var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();
            optionsBuilder.UseSqlServer(connectionString);

            return new AppDbContext(optionsBuilder.Options);
        }
    }
}
