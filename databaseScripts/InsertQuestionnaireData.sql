-- Generate and insert 10,000 questionnaire records
DECLARE @counter INT
SET @counter = 0

WHILE @counter < 10000
BEGIN
    INSERT INTO Questionnaire (
        moduleId,
        projectId,
        createdDate,
        annoying_enjoyable,
        notUnderstandable_understandable,
        dull_creative,
        difficultToLearn_easyToLearn,
        inferior_valuable,
        boring_exciting,
        notInteresting_interesting,
        unpredictable_predictable,
        slow_fast,
        conventional_inventive,
        obstructive_supportive,
        bad_good,
        complicated_easy,
        unlikable_pleasing,
        usual_leadingEdge,
        unpleasant_pleasant,
        notSecure_secure,
        motivating_demotivating,
        doesNotMeetExpectations_meetsExpectations,
        inefficient_efficient,
        confusing_clear,
        impractical_practical,
        cluttered_organized,
        unattractive_attractive,
        unfriendly_friendly,
        conservative_innovative
    )
    VALUES (
        CAST(CEILING(RAND() * 20) AS INT),  -- moduleId (Random between 1 and 20)
        CAST(CEILING(RAND() * 10) AS INT),  -- projectId (Random between 1 and 10)
        DATEADD(DAY, CAST(RAND() * 1000 AS INT), '2021-01-01'),  -- createdDate (Random date between Jan 1, 2021, and Sep 1, 2023)
        CAST(CEILING(RAND() * 7) AS INT),  -- annoying_enjoyable
        CAST(CEILING(RAND() * 7) AS INT),  -- notUnderstandable_understandable
        CAST(CEILING(RAND() * 7) AS INT),  -- dull_creative
        CAST(CEILING(RAND() * 7) AS INT),  -- difficultToLearn_easyToLearn
        CAST(CEILING(RAND() * 7) AS INT),  -- inferior_valuable
        CAST(CEILING(RAND() * 7) AS INT),  -- boring_exciting
        CAST(CEILING(RAND() * 7) AS INT),  -- notInteresting_interesting
        CAST(CEILING(RAND() * 7) AS INT),  -- unpredictable_predictable
        CAST(CEILING(RAND() * 7) AS INT),  -- slow_fast
        CAST(CEILING(RAND() * 7) AS INT),  -- conventional_inventive
        CAST(CEILING(RAND() * 7) AS INT),  -- obstructive_supportive
        CAST(CEILING(RAND() * 7) AS INT),  -- bad_good
        CAST(CEILING(RAND() * 7) AS INT),  -- complicated_easy
        CAST(CEILING(RAND() * 7) AS INT),  -- unlikable_pleasing
        CAST(CEILING(RAND() * 7) AS INT),  -- usual_leadingEdge
        CAST(CEILING(RAND() * 7) AS INT),  -- unpleasant_pleasant
        CAST(CEILING(RAND() * 7) AS INT),  -- notSecure_secure
        CAST(CEILING(RAND() * 7) AS INT),  -- motivating_demotivating
        CAST(CEILING(RAND() * 7) AS INT),  -- doesNotMeetExpectations_meetsExpectations
        CAST(CEILING(RAND() * 7) AS INT),  -- inefficient_efficient
        CAST(CEILING(RAND() * 7) AS INT),  -- confusing_clear
        CAST(CEILING(RAND() * 7) AS INT),  -- impractical_practical
        CAST(CEILING(RAND() * 7) AS INT),  -- cluttered_organized
        CAST(CEILING(RAND() * 7) AS INT),  -- unattractive_attractive
        CAST(CEILING(RAND() * 7) AS INT),  -- unfriendly_friendly
        CAST(CEILING(RAND() * 7) AS INT)   -- conservative_innovative
    )

    SET @counter = @counter + 1
END
