-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 16, 2022 at 04:29 AM
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
                                                                                  ('Admin', '123', 'Hoang Thong', 'thong@gmail.com', 'no.png'),
                                                                                  ('Hoàng Thông', '$2a$10$e3EZS.92vxCI1cOfsqkWUuxuuviAoEvmv6V3MAzfabYxmMR.O.MyG', 'facebook', 'thonghtph15021@fpt.edu.vn', 'default.jpg'),
                                                                                  ('Staff', '123', 'Thong Hoang', 'thonghoang@gmail.com', 'n1.png'),
                                                                                  ('Thong', '123', 'Thong Customer', 'thong@gmail.com', 'v2.jpg'),
                                                                                  ('Thông Hoàng Trung', '$2a$10$i2nix35yn4STiI7FCzuwZuezRN.As2VfLYGJcQL73PARAW1O9rLnK', 'google', 'hoangthong190922@gmail.com', 'default.jpg');

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
                                                           (3, 'Thong', 'Customer'),
                                                           (10, 'Staff', 'Customer'),
                                                           (12, 'Admin', 'Staff'),
                                                           (14, 'Hoàng Thông', 'Customer'),
                                                           (19, 'Staff', 'Staff'),
                                                           (20, 'Thông Hoàng Trung', 'Customer');

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
                                            (1000, 'Quần Bò'),
                                            (1001, 'Áo sơ mi'),
                                            (1002, 'Giày Nam'),
                                            (1003, 'Áo Gió'),
                                            (2327, 'Túi xách'),
                                            (2328, 'Phụ kiện');

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
                                                                                   (28, 19, 1014, 10000000, 1),
                                                                                   (29, 19, 1005, 21.35, 1),
                                                                                   (30, 20, 1014, 10000000, 6),
                                                                                   (31, 22, 1014, 80, 2),
                                                                                   (32, 22, 1017, 10, 1),
                                                                                   (33, 23, 1016, 20, 1),
                                                                                   (34, 23, 1014, 80, 1),
                                                                                   (35, 24, 1014, 80, 1),
                                                                                   (36, 24, 1005, 21.35, 1),
                                                                                   (37, 25, 1005, 21.35, 6),
                                                                                   (38, 25, 1014, 80, 12),
                                                                                   (39, 25, 1017, 10, 1),
                                                                                   (40, 25, 1016, 20, 1),
                                                                                   (41, 25, 1003, 10, 1),
                                                                                   (42, 25, 1015, 10, 1),
                                                                                   (43, 26, 1026, 34, 1),
                                                                                   (44, 26, 1027, 23, 1),
                                                                                   (45, 27, 1021, 40, 3),
                                                                                   (46, 27, 1020, 30, 4),
                                                                                   (47, 28, 1024, 23, 1),
                                                                                   (48, 28, 1023, 20, 13),
                                                                                   (49, 28, 1022, 23, 1),
                                                                                   (50, 29, 1020, 30, 3),
                                                                                   (51, 29, 1019, 20, 4),
                                                                                   (52, 29, 1022, 23, 3),
                                                                                   (53, 30, 1021, 40, 1),
                                                                                   (54, 30, 1020, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
                          `Id` int NOT NULL,
                          `Username` varchar(50) NOT NULL,
                          `CreateDate` datetime NOT NULL,
                          `Address` varchar(100) NOT NULL,
                          `Status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `Username`, `CreateDate`, `Address`, `Status`) VALUES
                                                                               (26, 'Admin', '2022-08-16 00:00:00', 'Thái Bình', 0),
                                                                               (27, 'Thong', '2022-08-16 00:00:00', 'Hà Nội', 0),
                                                                               (28, 'Thong', '2022-08-16 00:00:00', 'Thanh Bình , Hà Nội', 0),
                                                                               (29, 'Thong', '2022-08-16 00:00:00', 'Hà Nam', 0),
                                                                               (30, 'Staff', '2022-08-16 00:00:00', 'Hà Nam', 0);

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
                                                                                                     (1019, 'Quần Bò Ngắn', 'quan1.jpg', 20, '2022-08-16', 1, 1000),
                                                                                                     (1020, 'Quần Bò X', 'quan2.jpg', 30, '2022-08-16', 1, 1000),
                                                                                                     (1021, 'Quân Bò KK', 'quan3.jpg', 40, '2022-08-16', 1, 1000),
                                                                                                     (1022, 'Quần Bò NM', 'quan4.jpg', 23, '2022-08-16', 1, 1000),
                                                                                                     (1023, 'Áo sơ mi trắng', 'ao1.jpg', 20, '2022-08-16', 1, 1001),
                                                                                                     (1024, 'Áo sơ mi sọc', 'ao5.jpeg', 23, '2022-08-16', 1, 1001),
                                                                                                     (1025, 'Áo sơ mi PR', 'ao4.jpg', 26, '2022-08-16', 1, 1001),
                                                                                                     (1026, 'Áo Limited', 'ao1.jpg', 34, '2022-08-16', 1, 1001),
                                                                                                     (1027, 'Thắt lưng cá sấu', 'pk1.jpg', 23, '2022-08-16', 1, 2328),
                                                                                                     (1028, 'Thăt lưng XO', 'pk2.jpg', 70, '2022-08-16', 1, 2328),
                                                                                                     (1029, 'Thắt lung rồng', 'pk3.jpg', 35, '2022-08-16', 1, 2328),
                                                                                                     (1030, 'Túi xách hàng hiệu', 'tui1.jpg', 231, '2022-08-16', 1, 2327),
                                                                                                     (1031, 'Túi Second Hand', 'tui2.jpg', 40, '2022-08-16', 1, 2327),
                                                                                                     (1032, 'Giày Second Hand', 'giay1.jpg', 30, '2022-08-16', 1, 1002),
                                                                                                     (1033, 'Giày XX', 'giay2.jpg', 23, '2022-08-16', 1, 1002),
                                                                                                     (1034, 'Giày Nike', 'giay3.jpg', 33, '2022-08-16', 1, 1002);

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
                                       ('Customer', 'Customer'),
                                       ('Staff', 'Staff');

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
    MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
    MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2329;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
    MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
    MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
    MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1035;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
