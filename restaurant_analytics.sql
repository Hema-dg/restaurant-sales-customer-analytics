Create DATABASE restaurent_analytics;
USE restaurent_analytics;

-- CREATE TABLE FOR Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    City VARCHAR(50) NOT NULL,
    RegistrationDate DATE NOT NULL
);
DESC Customer;

-- CREATE TABLE FOR Menu
CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CHECK (Price > 0)
);
DESC Menu;

-- CREATE TABLE FOR Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID),
    CHECK (OrderStatus IN ('Pending', 'Preparing', 'Completed', 'Cancelled'))
);

DESC Orders;

SHOW CREATE table Orders;

-- CREATE TABLE FOR  OrderDetails 
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    MenuID INT NOT NULL,
    Quantity INT NOT NULL,
    
    CONSTRAINT fk_orderdetails_order
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),
        
    CONSTRAINT fk_orderdetails_menu
        FOREIGN KEY (MenuID)
        REFERENCES Menu(MenuID),
        
    CHECK (Quantity > 0)
);
DESC OrderDetails;

-- CREATE TABLE FOR Payment
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL UNIQUE,
    PaymentDate DATETIME NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL,
    PaymentAmount DECIMAL(10,2) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,

    CONSTRAINT fk_payment_order
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    CHECK (PaymentAmount >= 0),
    CHECK (PaymentMethod IN ('Cash', 'UPI', 'Card')),
    CHECK (PaymentStatus IN ('Paid', 'Pending', 'Failed'))
);
DESC Payment;

-- CREATE TABLE FOR Feedback
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    OrderID INT NOT NULL UNIQUE,
    Rating INT NOT NULL,
    FeedbackDate DATE NOT NULL,

    CONSTRAINT fk_feedback_order
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    CHECK (Rating BETWEEN 1 AND 5)
);
DESC Feedback;

SHOW Tables;

-- VERYFY Payment RELATIONSHIP WITH Orders
SHOW CREATE TABLE Payment;

-- VERYFY Feedback RELATIONSHIP WITH Orders
SHOW CREATE TABLE Feedback;




-- INSERT VALUES TO Menu
INSERT INTO Menu (MenuID, ItemName, Category, Price) VALUES
(1, 'Paneer Tikka', 'Starter', 220.00),
(2, 'Chicken 65', 'Starter', 250.00),
(3, 'Veg Spring Rolls', 'Starter', 180.00),
(4, 'Gobi Manchurian', 'Starter', 190.00),
(5, 'Chicken Lollipop', 'Starter', 280.00),

(6, 'Paneer Butter Masala', 'Main Course', 260.00),
(7, 'Butter Chicken', 'Main Course', 320.00),
(8, 'Dal Tadka', 'Main Course', 180.00),
(9, 'Veg Kadai', 'Main Course', 230.00),
(10, 'Chicken Kadai', 'Main Course', 300.00),

(11, 'Margherita Pizza', 'Pizza', 299.00),
(12, 'Farmhouse Pizza', 'Pizza', 349.00),
(13, 'Paneer Tikka Pizza', 'Pizza', 379.00),
(14, 'Chicken Pepperoni Pizza', 'Pizza', 429.00),

(15, 'Veg Burger', 'Burger', 180.00),
(16, 'Paneer Burger', 'Burger', 220.00),
(17, 'Chicken Burger', 'Burger', 260.00),
(18, 'Cheese Burger', 'Burger', 240.00),

(19, 'Veg Biryani', 'Biryani', 220.00),
(20, 'Chicken Biryani', 'Biryani', 280.00),
(21, 'Mutton Biryani', 'Biryani', 340.00),
(22, 'Egg Biryani', 'Biryani', 240.00),

(23, 'Gulab Jamun', 'Dessert', 120.00),
(24, 'Brownie', 'Dessert', 160.00),
(25, 'Ice Cream', 'Dessert', 140.00),
(26, 'Chocolate Cake', 'Dessert', 180.00),

(27, 'Fresh Lime Soda', 'Beverage', 100.00),
(28, 'Cold Coffee', 'Beverage', 150.00),
(29, 'Masala Tea', 'Beverage', 80.00),
(30, 'Fresh Fruit Juice', 'Beverage', 130.00);

SELECT COUNT(*) FROM Menu;
select * from Menu;

-- INSERT VALUES INTO Customer
INSERT INTO Customer
(CustomerID, CustomerName, PhoneNumber, City, RegistrationDate)
VALUES
(1, 'Aarav Sharma', '9000000001', 'Bengaluru', '2025-01-05'),
(2, 'Ananya Patel', '9000000002', 'Mysuru', '2025-01-08'),
(3, 'Arjun Reddy', '9000000003', 'Hubballi', '2025-01-11'),
(4, 'Diya Nair', '9000000004', 'Mangaluru', '2025-01-14'),
(5, 'Rohan Kumar', '9000000005', 'Chennai', '2025-01-17'),
(6, 'Sneha Sharma', '9000000006', 'Hyderabad', '2025-01-20'),
(7, 'Vikram Patel', '9000000007', 'Bengaluru', '2025-01-23'),
(8, 'Priya Reddy', '9000000008', 'Mysuru', '2025-01-26'),
(9, 'Karthik Nair', '9000000009', 'Hubballi', '2025-01-29'),
(10, 'Meera Kumar', '9000000010', 'Mangaluru', '2025-02-01'),
(11, 'Rahul Sharma', '9000000011', 'Chennai', '2025-02-04'),
(12, 'Kavya Patel', '9000000012', 'Hyderabad', '2025-02-07'),
(13, 'Aditya Reddy', '9000000013', 'Bengaluru', '2025-02-10'),
(14, 'Nisha Nair', '9000000014', 'Mysuru', '2025-02-13'),
(15, 'Sanjay Kumar', '9000000015', 'Hubballi', '2025-02-16'),
(16, 'Pooja Sharma', '9000000016', 'Mangaluru', '2025-02-19'),
(17, 'Vivek Patel', '9000000017', 'Chennai', '2025-02-22'),
(18, 'Isha Reddy', '9000000018', 'Hyderabad', '2025-02-25'),
(19, 'Manoj Nair', '9000000019', 'Bengaluru', '2025-02-28'),
(20, 'Aishwarya Kumar', '9000000020', 'Mysuru', '2025-03-03'),
(21, 'Aarav Patel', '9000000021', 'Hubballi', '2025-03-06'),
(22, 'Ananya Reddy', '9000000022', 'Mangaluru', '2025-03-09'),
(23, 'Arjun Nair', '9000000023', 'Chennai', '2025-03-12'),
(24, 'Diya Kumar', '9000000024', 'Hyderabad', '2025-03-15'),
(25, 'Rohan Sharma', '9000000025', 'Bengaluru', '2025-03-18'),
(26, 'Sneha Patel', '9000000026', 'Mysuru', '2025-03-21'),
(27, 'Vikram Reddy', '9000000027', 'Hubballi', '2025-03-24'),
(28, 'Priya Nair', '9000000028', 'Mangaluru', '2025-03-27'),
(29, 'Karthik Kumar', '9000000029', 'Chennai', '2025-03-30'),
(30, 'Meera Sharma', '9000000030', 'Hyderabad', '2025-04-02'),
(31, 'Rahul Patel', '9000000031', 'Bengaluru', '2025-04-05'),
(32, 'Kavya Reddy', '9000000032', 'Mysuru', '2025-04-08'),
(33, 'Aditya Nair', '9000000033', 'Hubballi', '2025-04-11'),
(34, 'Nisha Kumar', '9000000034', 'Mangaluru', '2025-04-14'),
(35, 'Sanjay Sharma', '9000000035', 'Chennai', '2025-04-17'),
(36, 'Pooja Patel', '9000000036', 'Hyderabad', '2025-04-20'),
(37, 'Vivek Reddy', '9000000037', 'Bengaluru', '2025-04-23'),
(38, 'Isha Nair', '9000000038', 'Mysuru', '2025-04-26'),
(39, 'Manoj Kumar', '9000000039', 'Hubballi', '2025-04-29'),
(40, 'Aishwarya Sharma', '9000000040', 'Mangaluru', '2025-05-02'),
(41, 'Aarav Reddy', '9000000041', 'Chennai', '2025-05-05'),
(42, 'Ananya Nair', '9000000042', 'Hyderabad', '2025-05-08'),
(43, 'Arjun Kumar', '9000000043', 'Bengaluru', '2025-05-11'),
(44, 'Diya Sharma', '9000000044', 'Mysuru', '2025-05-14'),
(45, 'Rohan Patel', '9000000045', 'Hubballi', '2025-05-17'),
(46, 'Sneha Reddy', '9000000046', 'Mangaluru', '2025-05-20'),
(47, 'Vikram Nair', '9000000047', 'Chennai', '2025-05-23'),
(48, 'Priya Kumar', '9000000048', 'Hyderabad', '2025-05-26'),
(49, 'Karthik Sharma', '9000000049', 'Bengaluru', '2025-05-29'),
(50, 'Meera Patel', '9000000050', 'Mysuru', '2025-06-01'),
(51, 'Rahul Reddy', '9000000051', 'Hubballi', '2025-06-04'),
(52, 'Kavya Nair', '9000000052', 'Mangaluru', '2025-06-07'),
(53, 'Aditya Kumar', '9000000053', 'Chennai', '2025-06-10'),
(54, 'Nisha Sharma', '9000000054', 'Hyderabad', '2025-06-13'),
(55, 'Sanjay Patel', '9000000055', 'Bengaluru', '2025-06-16'),
(56, 'Pooja Reddy', '9000000056', 'Mysuru', '2025-06-19'),
(57, 'Vivek Nair', '9000000057', 'Hubballi', '2025-06-22'),
(58, 'Isha Kumar', '9000000058', 'Mangaluru', '2025-06-25'),
(59, 'Manoj Sharma', '9000000059', 'Chennai', '2025-06-28'),
(60, 'Aishwarya Patel', '9000000060', 'Hyderabad', '2025-07-01'),
(61, 'Aarav Nair', '9000000061', 'Bengaluru', '2025-07-04'),
(62, 'Ananya Kumar', '9000000062', 'Mysuru', '2025-07-07'),
(63, 'Arjun Sharma', '9000000063', 'Hubballi', '2025-07-10'),
(64, 'Diya Patel', '9000000064', 'Mangaluru', '2025-07-13'),
(65, 'Rohan Reddy', '9000000065', 'Chennai', '2025-07-16'),
(66, 'Sneha Nair', '9000000066', 'Hyderabad', '2025-07-19'),
(67, 'Vikram Kumar', '9000000067', 'Bengaluru', '2025-07-22'),
(68, 'Priya Sharma', '9000000068', 'Mysuru', '2025-07-25'),
(69, 'Karthik Patel', '9000000069', 'Hubballi', '2025-07-28'),
(70, 'Meera Reddy', '9000000070', 'Mangaluru', '2025-07-31'),
(71, 'Rahul Nair', '9000000071', 'Chennai', '2025-08-03'),
(72, 'Kavya Kumar', '9000000072', 'Hyderabad', '2025-08-06'),
(73, 'Aditya Sharma', '9000000073', 'Bengaluru', '2025-08-09'),
(74, 'Nisha Patel', '9000000074', 'Mysuru', '2025-08-12'),
(75, 'Sanjay Reddy', '9000000075', 'Hubballi', '2025-08-15'),
(76, 'Pooja Nair', '9000000076', 'Mangaluru', '2025-08-18'),
(77, 'Vivek Kumar', '9000000077', 'Chennai', '2025-08-21'),
(78, 'Isha Sharma', '9000000078', 'Hyderabad', '2025-08-24'),
(79, 'Manoj Patel', '9000000079', 'Bengaluru', '2025-08-27'),
(80, 'Aishwarya Reddy', '9000000080', 'Mysuru', '2025-08-30'),
(81, 'Aarav Kumar', '9000000081', 'Hubballi', '2025-09-02'),
(82, 'Ananya Sharma', '9000000082', 'Mangaluru', '2025-09-05'),
(83, 'Arjun Patel', '9000000083', 'Chennai', '2025-09-08'),
(84, 'Diya Reddy', '9000000084', 'Hyderabad', '2025-09-11'),
(85, 'Rohan Nair', '9000000085', 'Bengaluru', '2025-09-14'),
(86, 'Sneha Kumar', '9000000086', 'Mysuru', '2025-09-17'),
(87, 'Vikram Sharma', '9000000087', 'Hubballi', '2025-09-20'),
(88, 'Priya Patel', '9000000088', 'Mangaluru', '2025-09-23'),
(89, 'Karthik Reddy', '9000000089', 'Chennai', '2025-09-26'),
(90, 'Meera Nair', '9000000090', 'Hyderabad', '2025-09-29'),
(91, 'Rahul Kumar', '9000000091', 'Bengaluru', '2025-10-02'),
(92, 'Kavya Sharma', '9000000092', 'Mysuru', '2025-10-05'),
(93, 'Aditya Patel', '9000000093', 'Hubballi', '2025-10-08'),
(94, 'Nisha Reddy', '9000000094', 'Mangaluru', '2025-10-11'),
(95, 'Sanjay Nair', '9000000095', 'Chennai', '2025-10-14'),
(96, 'Pooja Kumar', '9000000096', 'Hyderabad', '2025-10-17'),
(97, 'Vivek Sharma', '9000000097', 'Bengaluru', '2025-10-20'),
(98, 'Isha Patel', '9000000098', 'Mysuru', '2025-10-23'),
(99, 'Manoj Reddy', '9000000099', 'Hubballi', '2025-10-26'),
(100, 'Aishwarya Nair', '9000000100', 'Mangaluru', '2025-10-29');

select * from Customer;

-- INSERT VALURS INTO Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderStatus)
WITH RECURSIVE OrderNumbers AS (
    SELECT 1001 AS OrderID
    UNION ALL
    SELECT OrderID + 1
    FROM OrderNumbers
    WHERE OrderID < 1500
)
SELECT
    OrderID,

    -- Assign an existing customer ID from 1 to 100
    ((OrderID - 1001) % 100) + 1 AS CustomerID,

    -- Generate dates and realistic restaurant ordering times
    TIMESTAMP(
        DATE_ADD('2026-01-01',
            INTERVAL ((OrderID - 1001) % 181) DAY
        ),
        CASE
            WHEN (OrderID - 1001) % 3 = 0
                THEN MAKETIME(12 + ((OrderID - 1001) % 3), 30, 0)
            WHEN (OrderID - 1001) % 3 = 1
                THEN MAKETIME(18 + ((OrderID - 1001) % 2), 15, 0)
            ELSE
                MAKETIME(20 + ((OrderID - 1001) % 2), 0, 0)
        END
    ) AS OrderDate,

    -- Deterministic order-status distribution
    CASE
        WHEN (OrderID - 1001) % 100 < 80 THEN 'Completed'
        WHEN (OrderID - 1001) % 100 < 88 THEN 'Preparing'
        WHEN (OrderID - 1001) % 100 < 93 THEN 'Pending'
        ELSE 'Cancelled'
    END AS OrderStatus

FROM OrderNumbers;

SELECT OrderStatus, COUNT(*) AS OrderCount
FROM Orders
GROUP BY OrderStatus
ORDER BY OrderStatus;

INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuID, Quantity)
SELECT
    ROW_NUMBER() OVER (ORDER BY o.OrderID, n.n) AS OrderDetailID,
    o.OrderID,
    ((o.OrderID + n.n * 7) % 30) + 1 AS MenuID,
    ((o.OrderID + n.n) % 5) + 1 AS Quantity
FROM Orders o
JOIN (
    SELECT 1 AS n
    UNION ALL SELECT 2
    UNION ALL SELECT 3
) n
    ON n.n <= CASE
        WHEN o.OrderStatus = 'Cancelled' THEN 0
        WHEN o.OrderID % 3 = 0 THEN 3
        WHEN o.OrderID % 2 = 0 THEN 2
        ELSE 1
    END;
    
    SELECT COUNT(*) AS TotalOrderDetails
FROM OrderDetails;

SELECT COUNT(*) AS CancelledOrderDetails
FROM OrderDetails od
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus = 'Cancelled';

SELECT *
FROM OrderDetails
limit 10;


-- INSERT VALUES INTO Payment
INSERT INTO Payment
(PaymentID, OrderID, PaymentDate, PaymentMethod, PaymentAmount, PaymentStatus)

SELECT
    o.OrderID + 4000 AS PaymentID,
    o.OrderID,
    o.OrderDate AS PaymentDate,

    CASE
        WHEN (o.OrderID - 1001) % 3 = 0 THEN 'Cash'
        WHEN (o.OrderID - 1001) % 3 = 1 THEN 'UPI'
        ELSE 'Card'
    END AS PaymentMethod,

    COALESCE(SUM(m.Price * od.Quantity), 0) AS PaymentAmount,

    CASE
        WHEN o.OrderStatus = 'Completed' THEN 'Paid'
        WHEN o.OrderStatus IN ('Preparing', 'Pending') THEN 'Pending'
        WHEN o.OrderStatus = 'Cancelled' THEN 'Failed'
    END AS PaymentStatus

FROM Orders o

LEFT JOIN OrderDetails od
    ON o.OrderID = od.OrderID

LEFT JOIN Menu m
    ON od.MenuID = m.MenuID

GROUP BY
    o.OrderID,
    o.OrderDate,
    o.OrderStatus;

SHOW CREATE TABLE Payment;

-- INSERT VALUES INTO Feedback
INSERT INTO Feedback
(FeedbackID, OrderID, Rating, FeedbackDate)

SELECT
    o.OrderID + 5000 AS FeedbackID,
    o.OrderID,

    CASE
        WHEN o.OrderID % 10 IN (0, 1) THEN 5
        WHEN o.OrderID % 10 IN (2, 3, 4) THEN 4
        WHEN o.OrderID % 10 IN (5, 6) THEN 3
        WHEN o.OrderID % 10 = 7 THEN 2
        ELSE 1
    END AS Rating,

    DATE(o.OrderDate) AS FeedbackDate

FROM Orders o;

SELECT COUNT(*) AS TotalFeedback
FROM Feedback;

SELECT Rating, COUNT(*) AS RatingCount
FROM Feedback
GROUP BY Rating
ORDER BY Rating;

SELECT *
FROM Feedback
LIMIT 10;


-- FINAL DATA VERIFICATION

-- 1. VERIFY Orders → Customer RELATIONSHIP
-- Checks whether every Order has a valid CustomerID.
-- Expected result: 0

SELECT COUNT(*) AS InvalidOrders
FROM Orders o
LEFT JOIN Customer c
    ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;


-- 2. VERIFY OrderDetails → Orders RELATIONSHIP
-- Checks whether every OrderDetail belongs to an existing Order.
-- Expected result: 0

SELECT COUNT(*) AS InvalidOrderDetails
FROM OrderDetails od
LEFT JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderID IS NULL;


-- 3. VERIFY OrderDetails → Menu RELATIONSHIP
-- Checks whether every OrderDetail refers to an existing Menu item.
-- Expected result: 0

SELECT COUNT(*) AS InvalidMenuReferences
FROM OrderDetails od
LEFT JOIN Menu m
    ON od.MenuID = m.MenuID
WHERE m.MenuID IS NULL;


-- 4. VERIFY Payment → Orders RELATIONSHIP
-- Checks whether every Payment belongs to an existing Order.
-- Expected result: 0

SELECT COUNT(*) AS InvalidPayments
FROM Payment p
LEFT JOIN Orders o
    ON p.OrderID = o.OrderID
WHERE o.OrderID IS NULL;


-- 5. VERIFY Feedback → Orders RELATIONSHIP
-- Checks whether every Feedback record belongs to an existing Order.
-- Expected result: 0

SELECT COUNT(*) AS InvalidFeedback
FROM Feedback f
LEFT JOIN Orders o
    ON f.OrderID = o.OrderID
WHERE o.OrderID IS NULL;


-- ============================================
-- FINAL TABLE RECORD COUNT VERIFICATION
-- Checks the total number of records in each table.
-- ============================================

SELECT 'Customer' AS TableName, COUNT(*) AS TotalRecords
FROM Customer

UNION ALL

SELECT 'Menu', COUNT(*)
FROM Menu

UNION ALL

SELECT 'Orders', COUNT(*)
FROM Orders

UNION ALL

SELECT 'OrderDetails', COUNT(*)
FROM OrderDetails

UNION ALL

SELECT 'Payment', COUNT(*)
FROM Payment

UNION ALL

SELECT 'Feedback', COUNT(*)
FROM Feedback;





-- ANALYSIS 1: TOTAL NUMBER OF ORDERS
-- Counts the total number of orders placed.

SELECT COUNT(*) AS TotalOrders
FROM Orders;


-- ANALYSIS 2: ORDERS BY STATUS
-- Shows how many orders are Pending,
-- Preparing, Completed, and Cancelled.

SELECT
    OrderStatus,
    COUNT(*) AS OrderCount
FROM Orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;


-- ANALYSIS 3: TOTAL SALES REVENUE
-- Calculates total revenue from successful payments.
-- Failed payments are excluded.

SELECT
    SUM(PaymentAmount) AS TotalRevenue
FROM Payment
WHERE PaymentStatus = 'Paid';


-- ANALYSIS 4: REVENUE BY PAYMENT METHOD
-- Calculates total paid revenue for each
-- payment method.

SELECT
    PaymentMethod,
    SUM(PaymentAmount) AS TotalRevenue
FROM Payment
WHERE PaymentStatus = 'Paid'
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;


-- ANALYSIS 5: TOP-SELLING MENU ITEMS
-- Finds the menu items with the highest
-- total quantity sold.

SELECT
    m.MenuID,
    m.ItemName,
    m.Category,
    SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Menu m
    ON od.MenuID = m.MenuID
GROUP BY
    m.MenuID,
    m.ItemName,
    m.Category
ORDER BY TotalQuantitySold DESC;


-- ANALYSIS 6: REVENUE BY MENU CATEGORY
-- Calculates the revenue generated by each
-- menu category.

SELECT
    m.Category,
    SUM(od.Quantity * m.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Menu m
    ON od.MenuID = m.MenuID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY m.Category
ORDER BY TotalRevenue DESC;


-- ANALYSIS 7: ORDERS BY CUSTOMER
-- Finds how many orders each customer has placed.

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customer c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY TotalOrders DESC;


-- ANALYSIS 8: TOP 10 CUSTOMERS
-- Finds the 10 customers with the highest
-- number of orders.

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customer c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY TotalOrders DESC
LIMIT 10;


-- ANALYSIS 9: ORDERS BY CUSTOMER CITY
-- Shows the number of orders received from
-- customers in each city

SELECT
    c.City,
    COUNT(o.OrderID) AS TotalOrders
FROM Customer c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY TotalOrders DESC;


-- ANALYSIS 10: AVERAGE ORDER VALUE
-- Calculates the average amount paid
-- for successful orders.

SELECT
    ROUND(AVG(PaymentAmount), 2) AS AverageOrderValue
FROM Payment
WHERE PaymentStatus = 'Paid';


-- ANALYSIS 11: COMPLETED VS CANCELLED ORDERS
-- Compares the number of completed and
-- cancelled orders.

SELECT
    OrderStatus,
    COUNT(*) AS OrderCount
FROM Orders
WHERE OrderStatus IN ('Completed', 'Cancelled')
GROUP BY OrderStatus
ORDER BY OrderCount DESC;


-- ANALYSIS 12: DAILY REVENUE
-- Calculates the total successful revenue
-- generated on each date.

SELECT
    DATE(PaymentDate) AS OrderDate,
    SUM(PaymentAmount) AS DailyRevenue
FROM Payment
WHERE PaymentStatus = 'Paid'
GROUP BY DATE(PaymentDate)
ORDER BY OrderDate;



-- ANALYSIS 13: POPULAR MENU CATEGORIES
-- Finds which category has the highest
-- number of items sold.

SELECT
    m.Category,
    SUM(od.Quantity) AS TotalItemsSold
FROM OrderDetails od
JOIN Menu m
    ON od.MenuID = m.MenuID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY m.Category
ORDER BY TotalItemsSold DESC;


-- ANALYSIS 14: TOP 10 MENU ITEMS BY REVENUE
-- Finds the menu items generating the
-- highest revenue.

SELECT
    m.MenuID,
    m.ItemName,
    m.Category,
    SUM(od.Quantity * m.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Menu m
    ON od.MenuID = m.MenuID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY
    m.MenuID,
    m.ItemName,
    m.Category
ORDER BY TotalRevenue DESC
LIMIT 10;


-- ANALYSIS 15: AVERAGE CUSTOMER RATING
-- Calculates the overall average rating
-- given by customers.

SELECT
    ROUND(AVG(Rating), 2) AS AverageRating
FROM Feedback;


-- ANALYSIS 16: PAYMENT METHOD USAGE
-- Counts how many successful payments were
-- made using each payment method.

SELECT
    PaymentMethod,
    COUNT(*) AS PaymentCount
FROM Payment
WHERE PaymentStatus = 'Paid'
GROUP BY PaymentMethod
ORDER BY PaymentCount DESC;

-- ANALYSIS 17: RATING DISTRIBUTION
-- Shows how many customers gave each
-- rating from 1 to 5.

SELECT
    Rating,
    COUNT(*) AS RatingCount
FROM Feedback
GROUP BY Rating
ORDER BY Rating;


-- ANALYSIS 18: REVENUE BY ORDER STATUS
-- Compares the payment amount associated
-- with each order status.

SELECT
    o.OrderStatus,
    SUM(p.PaymentAmount) AS TotalAmount
FROM Orders o
JOIN Payment p
    ON o.OrderID = p.OrderID
GROUP BY o.OrderStatus
ORDER BY TotalAmount DESC;


-- ANALYSIS 19: MONTHLY REVENUE
-- Calculates total successful revenue
-- for each month.

SELECT
    DATE_FORMAT(PaymentDate, '%Y-%m') AS RevenueMonth,
    SUM(PaymentAmount) AS MonthlyRevenue
FROM Payment
WHERE PaymentStatus = 'Paid'
GROUP BY DATE_FORMAT(PaymentDate, '%Y-%m')
ORDER BY RevenueMonth;


-- ANALYSIS 20: TOP 10 CUSTOMERS BY SPENDING
-- Finds customers who generated the highest
-- successful payment amount.

SELECT
    c.CustomerID,
    c.CustomerName,
    SUM(p.PaymentAmount) AS TotalSpent
FROM Customer c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN Payment p
    ON o.OrderID = p.OrderID
WHERE p.PaymentStatus = 'Paid'
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 10;


-- ANALYSIS 21: AVERAGE RATING BY ORDER STATUS
-- Compares customer ratings across different
-- order statuses.

SELECT
    o.OrderStatus,
    ROUND(AVG(f.Rating), 2) AS AverageRating
FROM Orders o
JOIN Feedback f
    ON o.OrderID = f.OrderID
GROUP BY o.OrderStatus
ORDER BY AverageRating DESC;


-- ANALYSIS 22: ORDERS BY MONTH
-- Shows the number of orders placed each month.

SELECT
    DATE_FORMAT(OrderDate, '%Y-%m') AS OrderMonth,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY OrderMonth;


-- ANALYSIS 23: CANCELLATION RATE
-- Calculates the percentage of orders
-- that were cancelled

SELECT
    ROUND(
        100.0 * SUM(OrderStatus = 'Cancelled') / COUNT(*),
        2
    ) AS CancellationRate
FROM Orders;

-- ANALYSIS 24: AVERAGE QUANTITY PER MENU ITEM
-- Finds the average quantity ordered whenever
-- each menu item appears in an order.

SELECT
    m.ItemName,
    ROUND(AVG(od.Quantity), 2) AS AverageQuantity
FROM OrderDetails od
JOIN Menu m
    ON od.MenuID = m.MenuID
GROUP BY
    m.MenuID,
    m.ItemName
ORDER BY AverageQuantity DESC;

-- ANALYSIS 25: FREQUENT CUSTOMERS
-- Finds customers who placed more than 5 orders.


SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customer c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
HAVING COUNT(o.OrderID) > 5
ORDER BY TotalOrders DESC;


-- ANALYSIS 26: MOST ORDERED ITEM BY CATEGORY
-- Finds the highest-selling item within
-- each menu category.

SELECT
    Category,
    ItemName,
    TotalQuantitySold
FROM (
    SELECT
        m.Category,
        m.ItemName,
        SUM(od.Quantity) AS TotalQuantitySold,
        RANK() OVER (
            PARTITION BY m.Category
            ORDER BY SUM(od.Quantity) DESC
        ) AS ItemRank
    FROM OrderDetails od
    JOIN Menu m
        ON od.MenuID = m.MenuID
    JOIN Orders o
        ON od.OrderID = o.OrderID
    WHERE o.OrderStatus <> 'Cancelled'
    GROUP BY
        m.Category,
        m.MenuID,
        m.ItemName
) ranked_items
WHERE ItemRank = 1
ORDER BY Category;


-- ANALYSIS 27: REVENUE PER CUSTOMER
-- Calculates the total successful revenue
-- generated by each customer.

SELECT
    c.CustomerID,
    c.CustomerName,
    COALESCE(SUM(
        CASE
            WHEN p.PaymentStatus = 'Paid'
            THEN p.PaymentAmount
            ELSE 0
        END
    ), 0) AS TotalRevenue
FROM Customer c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
LEFT JOIN Payment p
    ON o.OrderID = p.OrderID
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY TotalRevenue DESC;


-- ANALYSIS 28: PEAK ORDERING TIME
-- Identifies the hour during which the
-- restaurant receives the most orders.

SELECT
    HOUR(OrderDate) AS OrderHour,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY HOUR(OrderDate)
ORDER BY TotalOrders DESC;

-- ANALYSIS 29: TOP 10 MENU ITEMS BY REVENUE
-- Finds the menu items that generate
-- the highest revenue.

SELECT
    m.MenuID,
    m.ItemName,
    m.Category,
    SUM(od.Quantity * m.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Menu m
    ON od.MenuID = m.MenuID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY
    m.MenuID,
    m.ItemName,
    m.Category
ORDER BY TotalRevenue DESC
LIMIT 10;


-- ANALYSIS 30: OVERALL RESTAURANT PERFORMANCE
-- Provides key overall metrics for the
-- restaurant.

SELECT
    (SELECT COUNT(*) FROM Customer) AS TotalCustomers,
    (SELECT COUNT(*) FROM Orders) AS TotalOrders,
    (SELECT COUNT(*)
     FROM Orders
     WHERE OrderStatus = 'Completed') AS CompletedOrders,
    (SELECT COUNT(*)
     FROM Orders
     WHERE OrderStatus = 'Cancelled') AS CancelledOrders,
    (SELECT ROUND(SUM(PaymentAmount), 2)
     FROM Payment
     WHERE PaymentStatus = 'Paid') AS TotalRevenue,
    (SELECT ROUND(AVG(Rating), 2)
     FROM Feedback) AS AverageRating;
     

-- Finds orders that are either Pending
-- or Cancelled.

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    OrderStatus
FROM Orders
WHERE OrderStatus = 'Pending'
   OR OrderStatus = 'Cancelled';
   

-- Finds completed orders placed by customers
-- with a specific condition.

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    OrderStatus
FROM Orders
WHERE OrderStatus = 'Completed'
  AND CustomerID <= 10;
  

-- Finds all orders that are NOT cancelled.

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    OrderStatus
FROM Orders
WHERE NOT OrderStatus = 'Cancelled';

-- Finds orders whose status is Completed
-- or Preparing.

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    OrderStatus
FROM Orders
WHERE OrderStatus IN ('Completed', 'Preparing');


-- Finds menu items priced between ₹200 and ₹300.

SELECT
    MenuID,
    ItemName,
    Category,
    Price
FROM Menu
WHERE Price BETWEEN 200 AND 300
ORDER BY Price;


-- Finds customers whose names start with 'A'.

SELECT
    CustomerID,
    CustomerName,
    City
FROM Customer
WHERE CustomerName LIKE 'A%';


-- DISTINCT
-- Shows each different city only once.

SELECT DISTINCT City
FROM Customer
ORDER BY City;


-- MIN, MAX
-- Finds the lowest and highest menu prices.

SELECT
    MIN(Price) AS LowestPrice,
    MAX(Price) AS HighestPrice
FROM Menu;


-- AVG
-- Finds the average price of all menu items.

SELECT
    ROUND(AVG(Price), 2) AS AverageMenuPrice
FROM Menu;
  
-- HAVING
-- Finds customers who placed more than 5 orders.

SELECT
    CustomerID,
    COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 5
ORDER BY TotalOrders DESC;


-- COUNT
-- Counts the total number of customers.

SELECT
    COUNT(*) AS TotalCustomers
FROM Customer;


-- SUM
-- Calculates the total quantity of items ordered.


SELECT
    SUM(Quantity) AS TotalItemsOrdered
FROM OrderDetails;
  
  

-- UPDATE
-- Changes the city of CustomerID 1.

UPDATE Customer
SET City = 'Bengaluru'
WHERE CustomerID = 1;


-- DELETE
-- Deletes a specific feedback record.

DELETE FROM Feedback
WHERE FeedbackID = 6500;


-- COALESCE
-- Replaces NULL values with 0.
-- Shows the total revenue generated by each customer.

SELECT
    c.CustomerID,
    c.CustomerName,
    COALESCE(SUM(p.PaymentAmount), 0) AS TotalRevenue
FROM Customer c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
LEFT JOIN Payment p
    ON o.OrderID = p.OrderID
    AND p.PaymentStatus = 'Paid'
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY TotalRevenue DESC;


-- INNER JOIN
-- Shows each order along with the customer
-- who placed it.

SELECT
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    o.OrderStatus
FROM Orders o
INNER JOIN Customer c
    ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID;


-- LEFT JOIN
-- Shows all customers, including customers
-- who have not placed any orders.

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customer c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY TotalOrders DESC;

-- MULTIPLE TABLE JOIN
-- Shows the customer, order, menu item,
-- quantity, and item price for each order detail.

SELECT
    c.CustomerName,
    o.OrderID,
    m.ItemName,
    od.Quantity,
    m.Price
FROM Customer c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Menu m
    ON od.MenuID = m.MenuID
ORDER BY o.OrderID;

-- SUBQUERY WITH WHERE
-- Finds menu items whose price is higher
-- than the average menu price

SELECT
    MenuID,
    ItemName,
    Category,
    Price
FROM Menu
WHERE Price > (
    SELECT AVG(Price)
    FROM Menu
)
ORDER BY Price DESC;


-- SUBQUERY WITH IN
-- Finds customers who have placed at least
-- one completed order.

SELECT
    CustomerID,
    CustomerName,
    City
FROM Customer
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE OrderStatus = 'Completed'
)
ORDER BY CustomerID;


-- SUBQUERY WITH MAX
-- Finds the menu item with the highest price.

SELECT
    MenuID,
    ItemName,
    Category,
    Price
FROM Menu
WHERE Price = (
    SELECT MAX(Price)
    FROM Menu
);

-- CORRELATED SUBQUERY
-- Finds customers whose order count is
-- greater than the average order count
-- per customer.

SELECT
    c.CustomerID,
    c.CustomerName,
    (
        SELECT COUNT(*)
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
    ) AS TotalOrders
FROM Customer c
WHERE (
    SELECT COUNT(*)
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
) > (
    SELECT AVG(OrderCount)
    FROM (
        SELECT COUNT(*) AS OrderCount
        FROM Orders
        GROUP BY CustomerID
    ) AS CustomerOrders
)
ORDER BY TotalOrders DESC;


-- EXISTS
-- Finds customers who have at least one
-- completed order.

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customer c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
      AND o.OrderStatus = 'Completed'
);


-- NOT EXISTS
-- Finds customers who have never placed
-- a cancelled order.

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
      AND o.OrderStatus = 'Cancelled'
)
ORDER BY c.CustomerID;

-- UNION
-- Combines cities from Customer and
-- categories from Menu into one result.
-- Duplicate values are removed.

SELECT City AS Value
FROM Customer
UNION
SELECT Category
FROM Menu;


-- UNION ALL
-- Combines the same two result sets but
-- keeps duplicate values.

SELECT City AS Value
FROM Customer
UNION ALL
SELECT Category
FROM Menu;


-- CASE
-- Classifies menu items based on their price.

SELECT
    ItemName,
    Price,
    CASE
        WHEN Price >= 350 THEN 'High Price'
        WHEN Price >= 200 THEN 'Medium Price'
        ELSE 'Low Price'
    END AS PriceCategory
FROM Menu
ORDER BY Price DESC;

-- HAVING
-- Finds menu categories whose total revenue
-- is greater than ₹10,000.

SELECT
    m.Category,
    SUM(od.Quantity * m.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Menu m
    ON od.MenuID = m.MenuID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY m.Category
HAVING SUM(od.Quantity * m.Price) > 10000
ORDER BY TotalRevenue DESC;


-- CASE
-- Classifies orders based on their status.

SELECT
    OrderID,
    OrderStatus,
    CASE
        WHEN OrderStatus = 'Completed' THEN 'Successful'
        WHEN OrderStatus = 'Preparing' THEN 'In Progress'
        WHEN OrderStatus = 'Pending' THEN 'Waiting'
        ELSE 'Unsuccessful'
    END AS OrderCategory
FROM Orders;


-- SUBQUERY
-- Finds menu items whose price is higher
-- than the average menu price.

SELECT
    MenuID,
    ItemName,
    Category,
    Price
FROM Menu
WHERE Price > (
    SELECT AVG(Price)
    FROM Menu
)
ORDER BY Price DESC;

-- STRING FUNCTIONS
-- Converts customer names to uppercase and
-- shows the length of each name.

SELECT
    CustomerName,
    UPPER(CustomerName) AS UpperName,
    LENGTH(CustomerName) AS NameLength
FROM Customer
LIMIT 10;


-- DATE FUNCTIONS
-- Shows the number of orders placed on each day
-- of the week.

SELECT
    DAYNAME(OrderDate) AS DayName,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY DAYNAME(OrderDate)
ORDER BY TotalOrders DESC;


-- UNION ALL
-- Combines customer names from two different
-- city groups into one result.

SELECT
    CustomerName,
    City
FROM Customer
WHERE City = 'Bengaluru'

UNION ALL

SELECT
    CustomerName,
    City
FROM Customer
WHERE City = 'Mysuru';

-- CTE (COMMON TABLE EXPRESSION)
-- Finds the total revenue generated by
-- each customer.

WITH CustomerRevenue AS (
    SELECT
        o.CustomerID,
        SUM(p.PaymentAmount) AS TotalRevenue
    FROM Orders o
    JOIN Payment p
        ON o.OrderID = p.OrderID
    WHERE p.PaymentStatus = 'Paid'
    GROUP BY o.CustomerID
)
SELECT
    c.CustomerID,
    c.CustomerName,
    COALESCE(cr.TotalRevenue, 0) AS TotalRevenue
FROM Customer c
LEFT JOIN CustomerRevenue cr
    ON c.CustomerID = cr.CustomerID
ORDER BY TotalRevenue DESC;


-- VIEW
-- Creates a reusable view containing
-- customer order information.

CREATE OR REPLACE VIEW CustomerOrderDetails AS
SELECT
    o.OrderID,
    c.CustomerName,
    c.City,
    o.OrderDate,
    o.OrderStatus
FROM Orders o
JOIN Customer c
    ON o.CustomerID = c.CustomerID;


-- Use the created view
SELECT *
FROM CustomerOrderDetails
LIMIT 10;


-- INDEX
-- Creates an index on OrderStatus to improve
-- searching/filtering performance.

CREATE INDEX idx_order_status
ON Orders(OrderStatus);


-- Verify the index
SHOW INDEX FROM Orders;

-- 1. START TRANSACTION
-- Starts a transaction so changes can be
-- committed or rolled back.

START TRANSACTION;

UPDATE Customer
SET City = 'Bengaluru'
WHERE CustomerID = 2;

SELECT *
FROM Customer
WHERE CustomerID = 2;


-- 2. ROLLBACK
-- Cancels the change made inside the transaction.

ROLLBACK;

SELECT *
FROM Customer
WHERE CustomerID = 2;


-- 3. COMMIT
-- Permanently saves a change.

START TRANSACTION;

UPDATE Customer
SET City = 'Mysuru'
WHERE CustomerID = 2;

COMMIT;

SELECT *
FROM Customer
WHERE CustomerID = 2;

-- 1. CREATE USER
-- Creates a separate user for the restaurant
-- analytics database.

CREATE USER IF NOT EXISTS 'restaurant_user'@'localhost'
IDENTIFIED BY 'Restaurant@123';


-- 2. GRANT
-- Gives the user permission to read data
-- from the restaurant database.

GRANT SELECT
ON restaurent_analytics.*
TO 'restaurant_user'@'localhost';


-- 3. REVOKE
-- Removes the SELECT permission from the user.

REVOKE SELECT
ON restaurent_analytics.*
FROM 'restaurant_user'@'localhost';

-- FINAL DATABASE VERIFICATION
-- Checks the number of records in every table.

SELECT 'Customer' AS TableName, COUNT(*) AS TotalRecords
FROM Customer

UNION ALL

SELECT 'Menu', COUNT(*)
FROM Menu

UNION ALL

SELECT 'Orders', COUNT(*)
FROM Orders

UNION ALL

SELECT 'OrderDetails', COUNT(*)
FROM OrderDetails

UNION ALL

SELECT 'Payment', COUNT(*)
FROM Payment

UNION ALL

SELECT 'Feedback', COUNT(*)
FROM Feedback;

-- FINAL OBJECT VERIFICATION
-- Shows the tables and the created view.

SHOW TABLES;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';

SHOW INDEX FROM Orders;