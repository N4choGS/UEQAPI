using System.ComponentModel.DataAnnotations.Schema;

namespace UEQData.Models
{
    public class QuestionnaireResponse
    {
        public int Id { get; set; }
        public int? moduleId { get; set; }
        public int? projectId{ get; set; }
        public DateTime? createdDate { get; set; }
        public Attractiveness? attractiveness { get; set; }
        public Novelty? novelty { get; set; }
        public Dependability? dependability { get; set; }
        public Efficiency? efficiency { get; set; } 
        public Perspecuity? perspecuity { get; set; }   
        public Stimulation? stimulation { get; set; } 
    }
}
