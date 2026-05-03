INSERT INTO Owners (OwnerName, Phone) VALUES
('Ahmed Adel', '0100000001'),
('Ali Hassan', '0100000002'),
('Omar Mahmoud', '0100000003');
INSERT INTO Houses (OwnerId, Location) VALUES
(1, 'Cairo'),
(1, 'Alexandria'),

(2, 'Giza'),
(2, 'Mansoura'),

(3, 'Tanta'),
(3, 'Aswan');
INSERT INTO Heaters (HouseId, HeaterType, PowerValue) VALUES
(1, 'Electric', 2.5), (1, 'Gas', 3.0),
(2, 'Electric', 2.2), (2, 'Gas', 3.1),
(3, 'Electric', 2.8), (3, 'Gas', 3.3),
(4, 'Electric', 2.6), (4, 'Gas', 3.5),
(5, 'Electric', 2.7), (5, 'Gas', 3.2),
(6, 'Electric', 2.9), (6, 'Gas', 3.6);
INSERT INTO MonthlyReport (HouseId, ReportMonth, TotalWorkingHours, TotalCost) VALUES
(1, '2026-01-01', 220, 300),
(2, '2026-01-01', 210, 280),
(3, '2026-01-01', 230, 320),
(4, '2026-01-01', 200, 260),
(5, '2026-01-01', 240, 330),
(6, '2026-01-01', 215, 290);