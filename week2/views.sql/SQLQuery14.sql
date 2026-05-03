CREATE OR ALTER VIEW vw_MonthlyCostSummary
AS
SELECT
    mr.HouseId AS HouseId,         
    mr.ReportMonth,
    mr.TotalWorkingHours,
    mr.TotalCost / DAY(EOMONTH(mr.ReportMonth)) AS MonthlyAverageCost
FROM dbo.MonthlyReport mr;