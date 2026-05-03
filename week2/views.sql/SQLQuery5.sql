select * from dbo.Owners
where OwnerId=1;
select * from Heaters where HeaterId=1;
select * from DailyUsage
where WorkingHours<=8;
select * from MonthlyReport
where MONTH(ReportMonth)=1;
select HouseId,  TotalCost from MonthlyReport

order by TotalCost DESC;
select  HeaterId,PowerValue from  Heaters
order by PowerValue DESC;
select  h.HouseId ,sum( m.WorkingHours) as totalhours, MONTH ( m.UsageDate) as month from  Houses h
join Heaters he on h.HouseId=he.HouseId
join DailyUsage m on m.HeaterId=he.HeaterId
Group by h.HouseId, MONTH ( m.UsageDate);
select h.HeaterId,avg( d.WorkingHours)from Heaters h
join DailyUsage d on h.HeaterId=d.HeaterId
group by h.HeaterId
select max(he.PowerValue) AS maxpower ,h.HouseId  from Houses h
join Heaters he on h.HouseId=he.HouseId
group by h.HouseId;


select  h.HouseId ,sum( m.WorkingHours) as totalhours from  Houses h
join Heaters he on h.HouseId=he.HouseId
join DailyUsage m on m.HeaterId=he.HeaterId
Group by h.HouseId;

SELECT 
    o.OwnerId,
    COUNT(m.ReportId) AS ReportsCount
FROM Owners o
JOIN Houses h ON o.OwnerId = h.OwnerId
JOIN MonthlyReport m ON h.HouseId = m.HouseId
GROUP BY o.OwnerId;


SELECT 
    o.OwnerName,
    h.HouseId,
    h.Location
FROM Owners o
JOIN Houses h ON o.OwnerId = h.OwnerId;

SELECT 
    o.OwnerName,
    h.HouseId,
    h.Location
FROM Owners o
JOIN Houses h ON o.OwnerId = h.OwnerId;
SELECT 
    h.HouseId,
    ht.HeaterId,
    ht.HeaterType,
    ht.PowerValue
FROM Houses h
JOIN Heaters ht ON h.HouseId = ht.HouseId;


SELECT 
    ht.HeaterId,
    d.UsageDate,
    d.WorkingHours
FROM Heaters ht
JOIN DailyUsage d ON ht.HeaterId = d.HeaterId;


SELECT 
    h.HouseId,
    m.ReportMonth,
    m.TotalWorkingHours,
    m.TotalCost
FROM Houses h
JOIN MonthlyReport m ON h.HouseId = m.HouseId;




