using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UEQData.Models;

namespace UEQData.Controllers
{
    [ApiController]
    [Route("Project")]
    public class ProjectController : ControllerBase
    {
        private readonly UEQContext _dbContext;
        public ProjectController(UEQContext dbContext) {
            _dbContext = dbContext;
        }

        // GET: api/Projects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Project>>> GetProjectData() { 
            if(_dbContext == null)
            {
                return NotFound();
            }
    
            return await _dbContext.Project.ToListAsync();   
        } 
    }
}
