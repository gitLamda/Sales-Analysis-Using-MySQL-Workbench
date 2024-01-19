CREATE DATABASE SalesAnalysis;
USE SalesAnalysis;

-- Creating tables
CREATE TABLE ProductsT (ProductID INT PRIMARY KEY,ProductName VARCHAR(225),Category VARCHAR(25),Price DECIMAL(10,2));
CREATE TABLE CustomersT (CustomerID INT PRIMARY KEY,FirstName VARCHAR(25),LastName VARCHAR (25),Email VARCHAR(25));
CREATE TABLE SalesT (SalesID INT PRIMARY KEY,ProductID INT,CustomerID INT,SalesDate DATE,Quantity INT,TotalAmount DECIMAL(10,2),FOREIGN KEY (ProductID) REFERENCES ProductsT(ProductID),FOREIGN KEY (CustomerID) REFERENCES CustomersT(CustomerID));

-- Insert sample data
INSERT INTO ProductsT VALUES (1,"Laptop","Electronic",160),(2,"Smartphone","Electronic",200),(3,"Desk Chair","Furniture",300),(4,"Coffee Table","Furniture",250);
INSERT INTO CustomersT VALUES (1,"Joseph","Banes","joseph.bains@gmail.com"),(2,"Nimal","Fernando","nimal.fernando@gmail.com"),(3,"Kamal","Akalanka","kamal.akalanka@gmail.com");
INSERT INTO SalesT VALUES (1,1,1,"2024-01-07",2,150),(2,2,2,"2024-01-09",1,200),(3,3,3,"2024-01-17",3,350),(4,1,3,"2024-01-25",4,130);

-- Top Selling Products
SELECT ProductName,SUM(Quantity) AS TotalSold FROM SalesT JOIN ProductsT ON SalesT.ProductID=ProductsT.ProductID GROUP BY ProductName ORDER By TotalSold DESC;

-- Total Revenue
SELECT SUM(TotalAmount) AS TotalRevenue FROM SalesT;

-- Customer Purchase History
SELECT CustomersT.FirstName,CustomersT.LastName,ProductName,SalesDate,Quantity,TotalAmount FROM SalesT JOIN CustomersT ON SalesT.CustomerID=CustomersT.CustomerID JOIN productsT ON SalesT.ProductID=ProductsT.ProductID ORDER BY SalesDate;