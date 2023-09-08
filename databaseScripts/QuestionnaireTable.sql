CREATE TABLE Questionnaire (
    id INT IDENTITY(1,1) PRIMARY KEY,
    moduleId INT,
    projectId INT,
    createdDate DATE,
    annoying_enjoyable INT,
    notUnderstandable_understandable INT,
    dull_creative INT,
    difficultToLearn_easyToLearn INT,
    inferior_valuable INT,
    boring_exciting INT,
    notInteresting_interesting INT,
    unpredictable_predictable INT,
    slow_fast INT,
    conventional_inventive INT,
    obstructive_supportive INT,
    bad_good INT,
    complicated_easy INT,
    unlikable_pleasing INT,
    usual_leadingEdge INT,
    unpleasant_pleasant INT,
    notSecure_secure INT,
    motivating_demotivating INT,
    doesNotMeetExpectations_meetsExpectations INT,
    inefficient_efficient INT,
    confusing_clear INT,
    impractical_practical INT,
    cluttered_organized INT,
    unattractive_attractive INT,
    unfriendly_friendly INT,
    conservative_innovative INT,
    FOREIGN KEY (moduleId) REFERENCES Module(id),
    FOREIGN KEY (projectId) REFERENCES Project(id)
);



select * from Questionnaire