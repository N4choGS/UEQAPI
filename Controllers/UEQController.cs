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
        public async Task<ActionResult<IEnumerable<QuestionnaireResponse>>> GetQuestionnaireData(string projectIds,  string startDate, string? moduleIds, string? endDate) { 
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

            List<QuestionnaireResponse> listQuestResponse = new List<QuestionnaireResponse>();

            foreach (Questionnaire quest in filteredProducts)
            {
                QuestionnaireResponse questResponse = new QuestionnaireResponse
                {
                    Id = quest.Id,
                    moduleId = quest.moduleId,
                    projectId = quest.projectId,
                    createdDate = quest.createdDate,
                    attractiveness = new Attractiveness {
                        annoying_enjoyable = quest.annoying_enjoyable,
                        bad_good = quest.bad_good,
                        unlikable_pleasing = quest.unlikable_pleasing,
                        unpleasant_pleasant  = quest.unpleasant_pleasant,
                        unattractive_attractive = quest.unattractive_attractive,
                        unfriendly_friendly  = quest.unfriendly_friendly,

                    },
                    novelty = new Novelty {
                        dull_creative = quest.dull_creative,
                        usual_leadingEdge = quest.usual_leadingEdge,
                        conventional_inventive = quest.conventional_inventive,
                        conservative_innovative = quest.conservative_innovative,
                    },
                    dependability = new Dependability {
                        unpredictable_predictable = quest.unpredictable_predictable ,
                        notSecure_secure = quest.notSecure_secure ,
                        doesNotMeetExpectations_meetsExpectations = quest.doesNotMeetExpectations_meetsExpectations ,
                        obstructive_supportive = quest.obstructive_supportive ,

                    },
                    efficiency = new Efficiency {
                        slow_fast = quest.slow_fast ,
                        inefficient_efficient = quest.inefficient_efficient ,
                        impractical_practical = quest.impractical_practical,
                        cluttered_organized = quest.cluttered_organized ,
                    },
                    perspecuity = new Perspecuity {
                        notUnderstandable_understandable = quest.notUnderstandable_understandable,
                        difficultToLearn_easyToLearn= quest.difficultToLearn_easyToLearn,
                        complicated_easy = quest.complicated_easy,
                        confusing_clear= quest.confusing_clear,
                    },
                    stimulation = new Stimulation {
                        inferior_valuable = quest.inferior_valuable,
                        boring_exciting = quest.boring_exciting,
                        notInteresting_interesting = quest.notInteresting_interesting ,
                        motivating_demotivating = quest.motivating_demotivating,
                    } ,
                };

                listQuestResponse.Add(questResponse);
            }

            return listQuestResponse;
        } 
    }
}
