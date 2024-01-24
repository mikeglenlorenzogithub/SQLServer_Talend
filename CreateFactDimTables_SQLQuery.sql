--CHECK STAGING DATABASE

SELECT * FROM Staging.dbo.customer;
SELECT * FROM Staging.dbo.product;
SELECT * FROM Staging.dbo.status_order;
SELECT * FROM Staging.dbo.sales_order;

--CREATE DWH AND TABLES

CREATE DATABASE DWH_Project;

CREATE TABLE DWH_Project.dbo.DimCustomer (
	CustomerID int NOT NULL PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50),
	Age int NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	City VARCHAR(50) NOT NULL,
	NoHP VARCHAR(20) NOT NULL
);

CREATE TABLE DWH_Project.dbo.DimProduct (
	ProductID int NOT NULL PRIMARY KEY,
	ProductName VARCHAR(50) NOT NULL,
	ProductCategory VARCHAR(50) NOT NULL,
	ProductUnitPrice int NOT NULL,
);

CREATE TABLE DWH_Project.dbo.DimStatusOrder (
	StatusID int NOT NULL PRIMARY KEY,
	StatusOrder VARCHAR(50) NOT NULL,
	StatusOrderDesc VARCHAR(50) NOT NULL,
);

CREATE TABLE DWH_Project.dbo.FactSalesOrder (
	OrderID int NOT NULL PRIMARY KEY,
	CustomerID int FOREIGN KEY REFERENCES DimCustomer(CustomerID),
	ProductID int FOREIGN KEY REFERENCES DimProduct(ProductID),
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int FOREIGN KEY REFERENCES DimStatusOrder(StatusID),
	OrderDate DATE NOT NULL
);

SELECT * FROM DWH_Project.dbo.DimCustomer;
SELECT * FROM DWH_Project.dbo.DimProduct;
SELECT * FROM DWH_Project.dbo.DimStatusOrder;
SELECT * FROM DWH_Project.dbo.FactSalesOrder;

ALTER TABLE DWH_Project.dbo.DimCustomer
ADD CustomerName VARCHAR(100);

