
CREATE TABLE DimDate (
    DateKey VARCHAR(15) PRIMARY KEY,
    Year INT NOT NULL,
    Month INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    Quarter INT NOT NULL ,
    YearQuarter VARCHAR(7) NOT NULL
);

CREATE TABLE DimAirline (
    AirlineKey INT PRIMARY KEY IDENTITY(1,1), -- Surrogate Key
    AirlineCode VARCHAR(5) NOT NULL,         -- Natural Key
    AirlineName VARCHAR(50) NOT NULL
);

CREATE TABLE DimAirport (
    AirportKey INT PRIMARY KEY IDENTITY(1,1), -- Surrogate Key
    AirportCode VARCHAR(3) NOT NULL,         -- Natural Key
    AirportName VARCHAR(70) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(15) NOT NULL
);

CREATE TABLE FactFlightSummary (
    DateKey VARCHAR(15) NOT NULL,
    AirlineKey INT NOT NULL,
    AirportKey INT NOT NULL,
    ArrivalFlights INT,
    DelayedFlightsCount INT,
    CarrierDelayCount FLOAT,
    WeatherDelayCount FLOAT,
    NASDelayCount FLOAT,
    SecurityDelayCount FLOAT,
    LateAircraftDelayCount FLOAT,
    CancelledFlights INT,
    DivertedFlights INT,
    TotalArrivalDelayMinutes INT,
    CarrierDelayMinutes INT,
    WeatherDelayMinutes INT,
    NASDelayMinutes INT,
    SecurityDelayMinutes INT,
    LateAircraftDelayMinutes INT,
    
    -- Define the Composite Primary Key
    PRIMARY KEY (DateKey, AirlineKey, AirportKey),
    
    -- Define the Foreign Key Constraints
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (AirlineKey) REFERENCES DimAirline(AirlineKey),
    FOREIGN KEY (AirportKey) REFERENCES DimAirport(AirportKey)
);

Select top 10* from DimDate where Year=2025
Select * from DimAirline;
Select top 10 * from DimAirport;
Select top 10 * From FactFlightSummary;

Truncate table FactFlightSummary;
Truncate TAble DimAirline;
Truncate table DimAirport;
Truncate Table DimDate;

Delete From DimAirline;
Delete from DimAirport;
Delete from DimDate;


DBCC CHECKIDENT ('DimAirline', RESEED, 0);
DBCC CHECKIDENT ('DimAirport', RESEED, 0);
