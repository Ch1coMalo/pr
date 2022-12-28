using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Text;
using System.IO;



namespace EfCoreTest1
{
    public class ApplicationContext : DbContext
    {
        public DbSet<Reception> Reception { get; set; }
        public DbSet<Pacient> Pacient { get; set; }
        public DbSet<Prepar> Prepar { get; set; }
        public DbSet<Analyses> Analyses { get; set; }
        public DbSet<Doc> Doc { get; set; }
        public DbSet<Specialty> Specialty { get; set; }

        public DbSet<Conclusion> Conclusion { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var builder = new ConfigurationBuilder();
            builder.SetBasePath(Directory.GetCurrentDirectory());
            builder.AddJsonFile("jsconfig1.json");
            var config = builder.Build();
            string connectionString = config.GetConnectionString("DefaultConnection");

            optionsBuilder.UseSqlServer(connectionString);
        }
    }
}
