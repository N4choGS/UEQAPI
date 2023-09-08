using System.ComponentModel.DataAnnotations.Schema;

namespace UEQData.Models
{
    public class Questionnaire
    {
        public int Id { get; set; }
        public int? moduleId { get; set; }
        [ForeignKey("moduleId")]
        public Module? module { get; set; } // Navigation property
        public int? projectId{ get; set; }
        [ForeignKey("projectId")]
        public Project? project { get; set; } // Navigation property
        public DateTime? createdDate { get; set; }
        public int? annoying_enjoyable { get; set; }
        public int? notUnderstandable_understandable { get; set; }
        public int? dull_creative { get; set; }
        public int? difficultToLearn_easyToLearn { get; set; }
        public int? inferior_valuable { get; set; }
        public int? boring_exciting { get; set; }
        public int? notInteresting_interesting { get; set; }
        public int? unpredictable_predictable { get; set; }
        public int? slow_fast { get; set; }
        public int? conventional_inventive { get; set; }
        public int? obstructive_supportive { get; set; }
        public int? bad_good { get; set; }
        public int? complicated_easy { get; set; }
        public int? unlikable_pleasing { get; set; }
        public int? usual_leadingEdge { get; set; }
        public int? unpleasant_pleasant { get; set; }
        public int? notSecure_secure { get; set; }
        public int? motivating_demotivating { get; set; }
        public int? doesNotMeetExpectations_meetsExpectations { get; set; }
        public int? inefficient_efficient { get; set; }
        public int? confusing_clear { get; set; }
        public int? impractical_practical { get; set; }
        public int? cluttered_organized { get; set; }
        public int? unattractive_attractive { get; set; }
        public int? unfriendly_friendly { get; set; }
        public int? conservative_innovative { get; set; }
    }
}
