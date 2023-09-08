using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using UEQData.Models;

namespace UEQData.Controllers
{
    [ApiController]
    [Route("Questionnaire")]
    public class UEQController : ControllerBase
    {
        private readonly UEQContext _dbContext;
        public UEQController(UEQContext dbContext) {
            _dbContext = dbContext;
        }

        // GET: api/Questionnaires
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Questionnaire>>> GetQuestionnaireData(string projectIds,  string startDate, string? moduleIds, string? endDate) { 
            if(_dbContext == null)
            {
                return NotFound();
            }

            string[] projectIdsArray = projectIds.Split(',');
            int[] intProjectIdsArray = projectIdsArray.Select(int.Parse).ToArray();

            // Use DateTime.ParseExact to parse the date string with the specified format
            DateTime startDateTime = DateTime.ParseExact(startDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);


            DateTime endDateTime = DateTime.Now;
            if (endDate!= null) {
                endDateTime  = DateTime.ParseExact(endDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
            }
                
               
    
            var questionnaireValues = await _dbContext.Questionnaire.ToListAsync();
            List<Questionnaire> filteredProducts = questionnaireValues.Where(question => intProjectIdsArray.Contains(question!.projectId!.Value) && question.createdDate >= startDateTime && question.createdDate <= endDateTime ).ToList();


            int[] intModuleIdsArray;
            if (moduleIds != null)
            {
                string[] moduletIdsArray = moduleIds.Split(',');
                intModuleIdsArray = moduletIdsArray.Select(int.Parse).ToArray();
                filteredProducts = filteredProducts.Where(question => intModuleIdsArray.Contains(question!.moduleId!.Value)).ToList();
            }

            return filteredProducts;
        } 
    }
}
