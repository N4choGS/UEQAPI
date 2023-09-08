using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace UEQData.Models
{
    public class UEQContext: DbContext
    {
        public UEQContext(DbContextOptions<UEQContext> options) : base(options) {
        }

        public DbSet<Module> Module { get; set; } = null!;
        public DbSet<Project> Project { get; set; } = null!;
        public DbSet<Questionnaire> Questionnaire { get; set; } = null!;
    }
}
