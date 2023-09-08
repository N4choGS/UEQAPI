using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UEQData.Models;

namespace UEQData.Controllers
{
    [ApiController]
    [Route("Module")]
    public class ModuleController : ControllerBase
    {
        private readonly UEQContext _dbContext;
        public ModuleController(UEQContext dbContext) {
            _dbContext = dbContext;
        }

        // GET: api/Module
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Module>>> GetModuleData() { 
            if(_dbContext == null)
            {
                return NotFound();
            }
 
            return await _dbContext.Module.ToListAsync();
        } 
    }
}
