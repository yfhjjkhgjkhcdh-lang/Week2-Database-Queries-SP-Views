USE IceCity;
GO

CREATE OR ALTER PROCEDURE CalculateMonthlyReport
    @HouseId INT,
    @Month INT,
    @Year INT,
    @Rate DECIMAL(5,2)
AS
BEGIN
    DECLARE @TotalHours DECIMAL(10,2);
    DECLARE @TotalCost DECIMAL(10,2);

   
    SELECT 
        @TotalHours = SUM(d.WorkingHours),
        @TotalCost = SUM(d.WorkingHours * h.PowerValue * @Rate)
    FROM dbo.Heaters h
    JOIN dbo.DailyUsage d ON h.HeaterId = d.HeaterId
    WHERE h.HouseId = @HouseId
      AND MONTH(d.UsageDate) = @Month
      AND YEAR(d.UsageDate) = @Year;

   
    IF @TotalHours IS NULL
    BEGIN
        PRINT 'No data for this month';
        RETURN;
    END

    
    IF EXISTS (
        SELECT 1
        FROM dbo.MonthlyReport
        WHERE HouseId = @HouseId  
          AND MONTH(ReportMonth) = @Month
          AND YEAR(ReportMonth) = @Year
    )
    BEGIN
        UPDATE dbo.MonthlyReport
        SET TotalWorkingHours = @TotalHours,
            TotalCost = @TotalCost
        WHERE HouseId = @HouseId
          AND MONTH(ReportMonth) = @Month
          AND YEAR(ReportMonth) = @Year;
    END

  
    ELSE
    BEGIN
        INSERT INTO dbo.MonthlyReport
            (HouseId, ReportMonth, TotalWorkingHours, TotalCost)
        VALUES
            (@HouseId, DATEFROMPARTS(@Year, @Month, 1), @TotalHours, @TotalCost);
    END
END;