CREATE OR ALTER TRIGGER trg_UpdateMonthlyReport
ON dbo.DailyUsage
AFTER INSERT
AS
BEGIN
    DECLARE @HouseId INT;
    DECLARE @Month INT;
    DECLARE @Year INT;

    SELECT TOP 1 
        @HouseId = h.HouseId,
        @Month = MONTH(i.UsageDate),
        @Year = YEAR(i.UsageDate)
    FROM inserted i
    JOIN dbo.Heaters h ON i.HeaterId = h.HeaterId;

    EXEC CalculateMonthlyReport 
        @HouseId = @HouseId,
        @Month = @Month,
        @Year = @Year,
        @Rate = 0.5;
END;