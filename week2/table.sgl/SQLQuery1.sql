
USE IceCity;
GO


CREATE TABLE Owners (
    OwnerId INT IDENTITY PRIMARY KEY,
    OwnerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20)
);

CREATE TABLE Houses (
    HouseId INT IDENTITY PRIMARY KEY,
    OwnerId INT NOT NULL,
    Location VARCHAR(100) NOT NULL,

    FOREIGN KEY (OwnerId)
    REFERENCES Owners(OwnerId)
);


CREATE TABLE Heaters (
    HeaterId INT IDENTITY PRIMARY KEY,
    HouseId INT NOT NULL,
    HeaterType VARCHAR(50) NOT NULL,
    PowerValue DECIMAL(5,2) NOT NULL,

    FOREIGN KEY (HouseId)
    REFERENCES Houses(HouseId),

    CHECK (PowerValue > 0)
);


CREATE TABLE DailyUsage (
    UsageId INT IDENTITY PRIMARY KEY,
    HeaterId INT NOT NULL,
    UsageDate DATE NOT NULL,
    WorkingHours INT NOT NULL,

    FOREIGN KEY (HeaterId)
    REFERENCES Heaters(HeaterId),

    CHECK (WorkingHours BETWEEN 0 AND 24),

    UNIQUE (HeaterId, UsageDate)
);


CREATE TABLE MonthlyReport (
    ReportId INT IDENTITY PRIMARY KEY,
    HouseId INT NOT NULL,
    ReportMonth DATE NOT NULL,
    TotalWorkingHours DECIMAL(10,2) NOT NULL,
    TotalCost DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (HouseId)
    REFERENCES Houses(HouseId),

    CHECK (TotalWorkingHours >= 0),
    CHECK (TotalCost >= 0),

    UNIQUE (HouseId, ReportMonth)
);