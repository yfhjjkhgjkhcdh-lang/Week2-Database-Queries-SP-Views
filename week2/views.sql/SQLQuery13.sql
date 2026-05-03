CREATE OR ALTER VIEW vw_HouseHeaterSummary
AS
SELECT 
    h.HouseId,
    he.HeaterId,
    he.HeaterType,
    he.PowerValue
FROM dbo.Heaters he
JOIN dbo.Houses h 
    ON h.HouseId = he.HouseId;
