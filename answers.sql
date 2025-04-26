-- Question 1: Achieving 1NF (First Normal Form)

-- Step 1: Create a new table with single product entries
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Step 2: Insert normalized data into the new table
INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Question 2: Achieving 2NF (Second Normal Form)

-- Step 1: Create a Customer table to store CustomerName separately
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255)
);

-- Step 2: Insert customers (without redundancy)
INSERT INTO Customer (CustomerName) VALUES
('John Doe'),
('Jane Smith'),
('Emily Clark');

-- Step 3: Create an OrderDetails table that references CustomerID instead of CustomerName
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Step 4: Insert normalized order details
-- (Assuming CustomerIDs assigned as: John Doe=1, Jane Smith=2, Emily Clark=3)
INSERT INTO OrderDetails (OrderID, CustomerID, Product, Quantity) VALUES
(101, 1, 'Laptop', 2),
(101, 1, 'Mouse', 1),
(102, 2, 'Tablet', 3),
(102, 2, 'Keyboard', 1),
(102, 2, 'Mouse', 2),
(103, 3, 'Phone', 1);
