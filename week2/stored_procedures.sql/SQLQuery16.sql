create or alter procedure calculatecost
@heaterid int,
@usagedate date,
@rate DECIMAL(5,2) 
as
begin
  DECLARE @Power DECIMAL(5,2);
    DECLARE @Hours INT;
    DECLARE @Cost DECIMAL(10,2);

    select @Hours=d.WorkingHours , @power=h.PowerValue 
    from DailyUsage d join Heaters h on d.HeaterId=h.HeaterId
    where d.HeaterId=@heaterid and d.UsageDate=@usagedate
    IF @Power IS NULL OR @Hours IS NULL
BEGIN
    PRINT 'Invalid HeaterId or UsageDate';
    RETURN;
END

    set @Cost=@Power*@Hours*@rate
   SELECT 
        @Hours AS WorkingHours,
        @Power AS PowerValue,
        @Cost AS DailyCost;
END;