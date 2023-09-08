CREATE PROCEDURE GetQuestionnaireData
    @ProjectIds NVARCHAR(MAX),
    @ModuleIds NVARCHAR(MAX) = NULL,
    @StartDate DATE,
    @EndDate DATE = NULL
AS
BEGIN
    -- Create a temporary table to store the list of project IDs
    CREATE TABLE #TempProjectIds (Id INT)

    -- Split the comma-separated list of project IDs and insert them into the temporary table
    INSERT INTO #TempProjectIds (Id)
    SELECT value
    FROM STRING_SPLIT(@ProjectIds, ',')

    -- Create a temporary table to store the list of module IDs (if provided)
    IF @ModuleIds IS NOT NULL
    BEGIN
        CREATE TABLE #TempModuleIds (Id INT)

        -- Split the comma-separated list of module IDs and insert them into the temporary table
        INSERT INTO #TempModuleIds (Id)
        SELECT value
        FROM STRING_SPLIT(@ModuleIds, ',')
    END

    -- Retrieve the matching records based on the provided criteria
    SELECT *
    FROM Questionnaire
    WHERE
        ProjectId IN (SELECT Id FROM #TempProjectIds)
        AND (@ModuleIds IS NULL OR ModuleId IN (SELECT Id FROM #TempModuleIds))
        AND createdDate >= @StartDate
        AND (@EndDate IS NULL OR createdDate <= @EndDate)

    -- Drop the temporary tables
    DROP TABLE #TempProjectIds

    IF @ModuleIds IS NOT NULL
    BEGIN
        DROP TABLE #TempModuleIds
    END
END
