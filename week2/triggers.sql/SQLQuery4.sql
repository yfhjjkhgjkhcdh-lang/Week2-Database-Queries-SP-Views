USE IceCity;
GO

CREATE TRIGGER trg_AutoInsertDailyUsage
ON dbo.Heaters
AFTER INSERT
AS
BEGIN
    DECLARE @day INT = 0;

    WHILE @day < 30
    BEGIN
        INSERT INTO dbo.DailyUsage (HeaterId, UsageDate, WorkingHours)
        SELECT 
            i.HeaterId,
            DATEADD(DAY, -@day, GETDATE()),
            6 + ABS(CHECKSUM(NEWID()) % 6)
        FROM inserted i;

        SET @day = @day + 1;
    END
END;