namespace UEQData.Models
{
    public class Dependability
    {
        public int? unpredictable_predictable { get; set; }
        public int? notSecure_secure { get; set; }
        public int? doesNotMeetExpectations_meetsExpectations { get; set; }
        public int? obstructive_supportive { get; set; }
    }
}
