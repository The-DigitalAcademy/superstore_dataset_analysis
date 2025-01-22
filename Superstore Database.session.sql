CREATE TABLE Shipment (
    ShipmentID SERIAL PRIMARY KEY,
    ShipDate DATE NOT NULL,
    ShipMode VARCHAR(14) NOT NULL
);

CREATE TABLE "State" (
    StateID SERIAL PRIMARY KEY,
    "State" VARCHAR(27) NOT NULL
);

CREATE TABLE Region (
    RegionID SERIAL PRIMARY KEY,
    Region VARCHAR(7) NOT NULL
);

CREATE TABLE City (
    CityID SERIAL PRIMARY KEY,
    City VARCHAR(45) NOT NULL
);

CREATE TABLE PostalCode (
    PostalCodeID SERIAL PRIMARY KEY,
    PostalCode VARCHAR(6) NOT NULL
);

CREATE TABLE Segment (
    SegmentID SERIAL PRIMARY KEY,
    Segment VARCHAR(11) NOT NULL
);

CREATE TABLE Country (
    CountryID SERIAL PRIMARY KEY,
    Country VARCHAR(13) NOT NULL
);

CREATE TABLE Customers (
    CustomerID VARCHAR(8) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE Product (
    ProductID VARCHAR(15) PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL
);

CREATE TABLE StateMap (
    StateID INT,
    CustomerID VARCHAR(8),
    PRIMARY KEY (StateID, CustomerID),
    FOREIGN KEY (StateID) REFERENCES State(StateID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE RegionMap (
    RegionID INT,
    CustomerID VARCHAR(8),
    PRIMARY KEY (RegionID, CustomerID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE CityMap (
    CityID INT,
    CustomerID VARCHAR(8),
    PRIMARY KEY (CityID, CustomerID),
    FOREIGN KEY (CityID) REFERENCES City(CityID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE PostalCodeMap (
    PostalCodeID INT,
    CustomerID VARCHAR(8),
    PRIMARY KEY (PostalCodeID, CustomerID),
    FOREIGN KEY (PostalCodeID) REFERENCES PostalCode(PostalCodeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE SegmentMap (
    SegmentID INT,
    CustomerID VARCHAR(8),
    PRIMARY KEY (SegmentID, CustomerID),
    FOREIGN KEY (SegmentID) REFERENCES Segment(SegmentID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE "Order" (
    OrderID VARCHAR(14) PRIMARY KEY,
    OrderDate DATE,
    Sales DECIMAL(10, 5),
    Quantity INT,
    Discount DECIMAL(5, 2),
    Profit DECIMAL(10, 5),
    CustomerID VARCHAR(8),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE ProductMap (
    OrderID VARCHAR(14),
    ProductID VARCHAR(15),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Category (
    CategoryID SERIAL PRIMARY KEY,
    Category VARCHAR(15)
);

CREATE TABLE SubCategory (
    SubCategoryID SERIAL PRIMARY KEY,
    SubCategory VARCHAR(50),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE SuperStore(
    RowID INT
    OrderID VARCHAR(14),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(14),
    CustomerID VARCHAR(8),
    CustomerName VARCHAR(100),
    Segment VARCHAR(11),
    Country VARCHAR(13),
    City VARCHAR(45),
    "State" VARCHAR(27),
    PostalCode VARCHAR(6),
    Region VARCHAR(7),
    ProductID VARCHAR(15),
    Category VARCHAR(15),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Sales DECIMAL(10, 5),
    Quantity INT,
    Discount DECIMAL(5, 2),
    Profit DECIMAL(10, 5)
)