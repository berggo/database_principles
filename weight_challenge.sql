CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    StartDate DATE,
    Goal DECIMAL(10, 2)
);

CREATE TABLE Challenge (
    ChallengeID INT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE,
    Amount DECIMAL(10, 2)
);

CREATE TABLE Measurement (
    MeasurementID INT PRIMARY KEY,
    Date DATE,
    CustomerID INT,
    ChallengeID INT,
    Weight DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ChallengeID) REFERENCES Challenge(ChallengeID)
);
