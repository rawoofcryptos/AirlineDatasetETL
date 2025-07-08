
CREATE TABLE DimDate (
    DateKey VARCHAR(15) PRIMARY KEY,
    Year INT NOT NULL,
    Month INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    Quarter INT NOT NULL ,
    YearQuarter VARCHAR(7) NOT NULL
);

Select * from DimDate where Year=2025

