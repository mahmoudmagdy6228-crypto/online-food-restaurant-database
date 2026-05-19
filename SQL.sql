CREATE DATABASE FoodOrder;
USE FoodOrder;
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(100),
    RegistrationDate DATE
);
CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    Name VARCHAR(50),
    Location VARCHAR(100),
    Phone VARCHAR(20),
    OpeningHours VARCHAR(50)
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL(10,2),
    Description VARCHAR(100),
    RestaurantID INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,

    PRIMARY KEY (OrderID, ProductID),

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
INSERT INTO Customer VALUES 
(1, 'Ahmed', 'ahmed@gmail.com', '0100', 'Tanta', '2024-01-01'),
(2, 'Ali', 'ali@gmail.com', '0111', 'Cairo', '2024-02-01'),
(3, 'Sara', 'sara@gmail.com', '0122', 'Alex', '2024-03-01');
INSERT INTO Restaurant VALUES
(1, 'Pizza King', 'Tanta', '0105', '10AM-12PM'),
(2, 'Burger House', 'Cairo', '0115', '9AM-11PM'); 
INSERT INTO Product VALUES
(1, 'Pizza', 50.00, 'Cheese Pizza', 1),
(2, 'Burger', 40.00, 'Beef Burger', 2),
(3, 'Fries', 20.00, 'French Fries', 2);
INSERT INTO Orders VALUES
(1, '2024-05-01', 90.00, 'Done', 1),
(2, '2024-05-02', 40.00, 'Pending', 2);
INSERT INTO OrderDetails VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1);
SELECT * FROM Customer;
SELECT Name, Email FROM Customer;
SELECT Customer.Name, Orders.OrderID
FROM Customer
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID;
SELECT Customer.Name, Orders.OrderID
FROM Customer
LEFT JOIN Orders
ON Customer.CustomerID = Orders.CustomerID;
SELECT Customer.Name, Orders.OrderID
FROM Customer
right JOIN Orders
ON Customer.CustomerID = Orders.CustomerID;
SELECT COUNT(*) FROM Orders;
SELECT SUM(TotalAmount) FROM Orders;
SELECT AVG(Price) FROM Product;
SELECT MAX(Price) FROM Product;
SELECT MIN(Price) FROM Product;
SELECT CustomerID, COUNT(OrderID)
FROM Orders
GROUP BY CustomerID;
SELECT CustomerID, COUNT(OrderID)
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 1;