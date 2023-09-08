using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UEQAPI.Migrations
{
    /// <inheritdoc />
    public partial class Migrations : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Module",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Module", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Project",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Project", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Questionnaire",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    moduleId = table.Column<int>(type: "int", nullable: true),
                    projectId = table.Column<int>(type: "int", nullable: true),
                    createdDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    annoying_enjoyable = table.Column<int>(type: "int", nullable: true),
                    notUnderstandable_understandable = table.Column<int>(type: "int", nullable: true),
                    dull_creative = table.Column<int>(type: "int", nullable: true),
                    difficultToLearn_easyToLearn = table.Column<int>(type: "int", nullable: true),
                    inferior_valuable = table.Column<int>(type: "int", nullable: true),
                    boring_exciting = table.Column<int>(type: "int", nullable: true),
                    notInteresting_interesting = table.Column<int>(type: "int", nullable: true),
                    unpredictable_predictable = table.Column<int>(type: "int", nullable: true),
                    slow_fast = table.Column<int>(type: "int", nullable: true),
                    conventional_inventive = table.Column<int>(type: "int", nullable: true),
                    obstructive_supportive = table.Column<int>(type: "int", nullable: true),
                    bad_good = table.Column<int>(type: "int", nullable: true),
                    complicated_easy = table.Column<int>(type: "int", nullable: true),
                    unlikable_pleasing = table.Column<int>(type: "int", nullable: true),
                    usual_leadingEdge = table.Column<int>(type: "int", nullable: true),
                    unpleasant_pleasant = table.Column<int>(type: "int", nullable: true),
                    notSecure_secure = table.Column<int>(type: "int", nullable: true),
                    motivating_demotivating = table.Column<int>(type: "int", nullable: true),
                    doesNotMeetExpectations_meetsExpectations = table.Column<int>(type: "int", nullable: true),
                    inefficient_efficient = table.Column<int>(type: "int", nullable: true),
                    confusing_clear = table.Column<int>(type: "int", nullable: true),
                    impractical_practical = table.Column<int>(type: "int", nullable: true),
                    cluttered_organized = table.Column<int>(type: "int", nullable: true),
                    unattractive_attractive = table.Column<int>(type: "int", nullable: true),
                    unfriendly_friendly = table.Column<int>(type: "int", nullable: true),
                    conservative_innovative = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Questionnaire", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Questionnaire_Module_moduleId",
                        column: x => x.moduleId,
                        principalTable: "Module",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Questionnaire_Project_projectId",
                        column: x => x.projectId,
                        principalTable: "Project",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Questionnaire_moduleId",
                table: "Questionnaire",
                column: "moduleId");

            migrationBuilder.CreateIndex(
                name: "IX_Questionnaire_projectId",
                table: "Questionnaire",
                column: "projectId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Questionnaire");

            migrationBuilder.DropTable(
                name: "Module");

            migrationBuilder.DropTable(
                name: "Project");
        }
    }
}
