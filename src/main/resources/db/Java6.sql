-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 10, 2022 at 01:22 AM
-- Server version: 8.0.28
-- PHP Version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Java6`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Photo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES
('abc', '123', 'abc', 'thongzz', 'v5.jpg'),
('Admin', '123', 'Hoang Thong', 'thong@gmail.com', 'no.png'),
('Hoàng Thông', '$2a$10$zcXSak5NWyA4DHS/kB0Suugt5mzFXMEHd20HtUL0nBqGpN4PNqyVa', 'facebook', 'thonghtph15021@fpt.edu.vn', 'default.jpg'),
('Hoang Trung Thong PH 1 5 0 2 1', '$2a$10$gdtIXDbvvU4Zb73zL54Vy.6bq5TtB5PTmA2CEdswR1kZ.zqJZeHRu', 'google', 'thonghtph15021@fpt.edu.vn', 'default.jpg'),
('Staff', '123', 'Thong Hoang', 'thonghoang@gmail.com', 'n1.png'),
('thong', '123', 'abc', 'thong@gmail.com', 'v2.jpg'),
('Thông Hoàng Trung', '$2a$10$EJ93fvmTY2BY5n.rRla2..Lo9iwA1HMOvs64ykcb3vJsenRpQmPDe', 'google', 'hoangthong190922@gmail.com', 'default.jpg'),
('thong123', '123', 'abc', 'thong@gmail.com', 'n4.jpg'),
('vippro', '12345', 'Hoàng Trung Thông', 'thong1@gmail.com', 'v2.jpg'),
('vippro1', '12345', 'Hoàng Trung Thông', 'thong1@gmail.com', 'v2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `Id` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `RoleId` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`Id`, `Username`, `RoleId`) VALUES
(1, 'Admin', 'Admin'),
(2, 'Staff', 'Staff'),
(3, 'thong', 'thong');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Id` int NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Id`, `Name`) VALUES
(1000, 'Đồng hồ đeo tay'),
(1001, 'Máy tính xách tay'),
(1002, 'Máy ảnh'),
(1003, 'Ngu XYZ'),
(2327, 'aaaaaaaaa'),
(2328, 'bbbbbbbbbb');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `Id` int NOT NULL,
  `OrderId` int NOT NULL,
  `ProductId` int NOT NULL,
  `Price` double NOT NULL,
  `Quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`Id`, `OrderId`, `ProductId`, `Price`, `Quantity`) VALUES
(1, 2, 1002, 19, 1),
(2, 2, 1003, 10, 1),
(3, 3, 1003, 10, 1),
(4, 3, 1004, 22, 1),
(5, 4, 1004, 22, 1),
(6, 4, 1003, 10, 1),
(7, 5, 1004, 22, 3),
(8, 5, 1002, 19, 1),
(9, 6, 1004, 22, 1),
(10, 6, 1003, 10, 1),
(11, 7, 1002, 19, 3),
(12, 8, 1004, 22, 14),
(13, 9, 1004, 22, 1),
(14, 10, 1009, 123, 1),
(15, 11, 1015, 10000000, 1),
(16, 12, 1009, 123, 1),
(17, 13, 1009, 123, 1),
(18, 14, 1003, 10, 1),
(19, 15, 1015, 10000000, 1),
(20, 15, 1005, 21.35, 2),
(21, 15, 1004, 22, 1),
(22, 16, 1005, 21.35, 1),
(23, 16, 1004, 22, 1),
(24, 17, 1005, 21.35, 3),
(25, 17, 1004, 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `Username`, `CreateDate`, `Address`) VALUES
(1, 'thong', '2022-07-27 00:00:00', ''),
(2, 'thong', '2022-07-27 00:00:00', ''),
(3, 'thong', '2022-07-27 00:00:00', ''),
(4, 'thong', '2022-08-04 00:00:00', ''),
(5, 'thong', '2022-08-04 00:00:00', 'ewfew'),
(6, 'thong', '2022-08-04 00:00:00', 'abc'),
(7, 'thong', '2022-08-04 00:00:00', 'abc'),
(8, 'Admin', '2022-08-07 00:00:00', '123'),
(9, 'Admin', '2022-08-08 00:00:00', '1221321432'),
(10, 'Admin', '2022-08-08 00:00:00', '123'),
(11, 'Admin', '2022-08-08 00:00:00', '123'),
(12, 'Admin', '2022-08-08 00:00:00', 'gdfgfd'),
(13, 'Admin', '2022-08-08 00:00:00', 'esfdsfds'),
(14, 'Admin', '2022-08-08 00:00:00', '123'),
(15, 'Hoang Trung Thong PH 1 5 0 2 1', '2022-08-09 00:00:00', '123'),
(16, 'Hoang Trung Thong PH 1 5 0 2 1', '2022-08-09 00:00:00', 'ngu'),
(17, 'Hoàng Thông', '2022-08-09 00:00:00', '123');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `Price` double NOT NULL,
  `CreateDate` date NOT NULL,
  `Available` tinyint NOT NULL,
  `Categoryid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Id`, `Name`, `Image`, `Price`, `CreateDate`, `Available`, `Categoryid`) VALUES
(1003, 'Aniseed Syrup1', '1003.jpg', 10, '2022-07-14', 1, 1001),
(1004, 'Chef Seasoning12', '1004.jpg', 22, '2022-07-14', 0, 1003),
(1005, 'Chef Gumbo Mix1', '1005.jpg', 21.35, '2022-07-07', 1, 1002),
(1007, 'abc123', 'v6.png', 2222, '2022-08-04', 0, 1001),
(1014, 'hdsjhfdf', 'upload.jpg', 10000000, '2022-08-08', 1, 1002),
(1015, 'asdfasfds', 'n2.png', 10000000, '2022-08-08', 1, 1001),
(1016, 'Hợp Đồng Cho Thuê', '1061.jpg', 10000000, '2022-08-08', 1, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Id` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Id`, `Name`) VALUES
('Admin', 'Admin'),
('Staff', 'Staff'),
('thong', 'thong');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2329;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
