-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2024 at 03:30 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pro1014`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `BrandID` int NOT NULL,
  `BrandName` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`BrandID`, `BrandName`, `Country`) VALUES
(1, 'Apple', 'USA'),
(2, 'Samsung', 'South Korea'),
(3, 'Xiaomi', 'China');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int NOT NULL,
  `CustomerID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`CartID`, `CustomerID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cartdetail`
--

CREATE TABLE `cartdetail` (
  `CartDetailID` int NOT NULL,
  `CartID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cartdetail`
--

INSERT INTO `cartdetail` (`CartDetailID`, `CartID`, `ProductID`, `Quantity`) VALUES
(1, 1, 3, 2),
(2, 2, 4, 1),
(3, 3, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FullName`, `Address`, `Phone`, `Email`, `RegistrationDate`) VALUES
(1, 'Nguyễn Văn A', '123 Đường ABC, Hà Nội', '0123456789', 'vana@example.com', '2023-01-10'),
(2, 'Trần Thị B', '456 Đường XYZ, TP HCM', '0987654321', 'thib@example.com', '2023-02-15'),
(3, 'Lê Văn C', '789 Đường QRS, Đà Nẵng', '0912345678', 'vanc@example.com', '2023-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `CustomerID`, `OrderDate`, `TotalAmount`, `Status`) VALUES
(1, 1, '2023-10-01', '20000000.00', 'Completed'),
(2, 2, '2023-10-05', '22000000.00', 'Pending'),
(3, 3, '2023-10-07', '15000000.00', 'Shipped');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderDetailID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `PriceAtOrder` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `PriceAtOrder`) VALUES
(1, 1, 1, 1, '20000000.00'),
(2, 2, 2, 1, '22000000.00'),
(3, 3, 5, 1, '15000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `OrderID`, `PaymentMethod`, `PaymentStatus`, `PaymentDate`) VALUES
(1, 1, 'Credit Card', 'Paid', '2023-10-02'),
(2, 2, 'Cash on Delivery', 'Pending', NULL),
(3, 3, 'Bank Transfer', 'Paid', '2023-10-08');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Description` text,
  `Price` decimal(10,2) DEFAULT NULL,
  `StockQuantity` int DEFAULT NULL,
  `BrandID` int DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Storage` varchar(50) DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Description`, `Price`, `StockQuantity`, `BrandID`, `Color`, `Storage`, `Size`, `SKU`) VALUES
(1, 'iPhone 13', 'Apple iPhone 13', '20000000.00', 50, 1, 'Blue', '128GB', '6.1 inch', 'IP13-128GB-BLUE'),
(2, 'iPhone 13', 'Apple iPhone 13', '22000000.00', 30, 1, 'Red', '256GB', '6.1 inch', 'IP13-256GB-RED'),
(3, 'Galaxy S21', 'Samsung Galaxy S21', '18000000.00', 40, 2, 'White', '128GB', '6.2 inch', 'GS21-128GB-WHITE'),
(4, 'Galaxy S21', 'Samsung Galaxy S21', '20000000.00', 25, 2, 'Black', '256GB', '6.2 inch', 'GS21-256GB-BLACK'),
(5, 'Mi 11', 'Xiaomi Mi 11', '15000000.00', 60, 3, 'Gray', '128GB', '6.81 inch', 'MI11-128GB-GRAY'),
(6, 'Mi 11', 'Xiaomi Mi 11', '17000000.00', 35, 3, 'Blue', '256GB', '6.81 inch', 'MI11-256GB-BLUE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`BrandID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD UNIQUE KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `cartdetail`
--
ALTER TABLE `cartdetail`
  ADD PRIMARY KEY (`CartDetailID`),
  ADD KEY `CartID` (`CartID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `OrderID` (`OrderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD UNIQUE KEY `SKU` (`SKU`),
  ADD KEY `BrandID` (`BrandID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `BrandID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cartdetail`
--
ALTER TABLE `cartdetail`
  MODIFY `CartDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE;

--
-- Constraints for table `cartdetail`
--
ALTER TABLE `cartdetail`
  ADD CONSTRAINT `cartdetail_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cartdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`BrandID`) REFERENCES `brand` (`BrandID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
