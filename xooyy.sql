-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 07:23 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xooyy`
--

-- --------------------------------------------------------

--
-- Table structure for table `calculate`
--

CREATE TABLE `calculate` (
  `Calculate_ID` int(11) NOT NULL,
  `Product_Price` int(11) NOT NULL,
  `Silver_Discount_code` varchar(25) NOT NULL,
  `Gold_Discount_code` varchar(25) NOT NULL,
  `Platinum_Discount_code` varchar(25) NOT NULL,
  `Payment_ID` int(11) NOT NULL,
  `Summary_Price` int(11) NOT NULL,
  `promotion_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `calculate`
--

INSERT INTO `calculate` (`Calculate_ID`, `Product_Price`, `Silver_Discount_code`, `Gold_Discount_code`, `Platinum_Discount_code`, `Payment_ID`, `Summary_Price`, `promotion_ID`) VALUES
(100000, 100, 'none', 'B4G1F', 'none', 100000, 500, 0),
(100001, 180, 'none', 'none', 'DC150B', 100001, 360, 0);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `Delivery_ID` int(11) NOT NULL,
  `Transport_Name` varchar(25) NOT NULL,
  `Export_Date` date NOT NULL,
  `Calculate_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`Delivery_ID`, `Transport_Name`, `Export_Date`, `Calculate_ID`) VALUES
(600000, 'Kerry Express', '2022-10-18', 100000),
(600001, 'FedEx', '2022-11-02', 100001);

-- --------------------------------------------------------

--
-- Table structure for table `gold member`
--

CREATE TABLE `gold member` (
  `Member_Gold` int(11) NOT NULL,
  `Gold_Discount_Code` varchar(25) NOT NULL,
  `Gold_Privilege` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gold member`
--

INSERT INTO `gold member` (`Member_Gold`, `Gold_Discount_Code`, `Gold_Privilege`) VALUES
(0, 'none', 'not a gold member'),
(1, 'FD112', 'Free Dilivery'),
(2, 'B4G1F', 'Buy 4 get 1 Free'),
(3, 'DC150B', 'Discount 150 Baht x1'),
(4, 'DC100B', 'Discount 100 Baht x2');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Member_Type` varchar(25) NOT NULL,
  `Member_Silver` int(11) DEFAULT NULL,
  `Member_Gold` int(11) DEFAULT NULL,
  `Member_Platinum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Member_Type`, `Member_Silver`, `Member_Gold`, `Member_Platinum`) VALUES
('Gold Member', 0, 2, 0),
('No Member', 0, 0, 0),
('Platinum Member', 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Mobile Banking` tinyint(1) NOT NULL,
  `Creditcard` tinyint(1) NOT NULL,
  `Recipe_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Mobile Banking`, `Creditcard`, `Recipe_ID`) VALUES
(100000, 1, 0, 1000),
(100001, 0, 1, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `platinum member`
--

CREATE TABLE `platinum member` (
  `Member_Platinum` int(11) NOT NULL,
  `Platinum_Discount_Code` varchar(25) NOT NULL,
  `Platinum_Privilege` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `platinum member`
--

INSERT INTO `platinum member` (`Member_Platinum`, `Platinum_Discount_Code`, `Platinum_Privilege`) VALUES
(0, 'none', 'not a platinum member'),
(1, 'FD112', 'Free Dilivery'),
(2, 'B3G1F', 'Buy 3 get 1 Free'),
(3, 'GFNPT', 'Get free new product test'),
(4, 'DC150B', 'Discount 150 Baht x4');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Flavour` varchar(25) NOT NULL,
  `imgname` varchar(100) NOT NULL,
  `Product_price` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Flavour`, `imgname`, `Product_price`) VALUES
(100004, 'Orange', 'org s.png', 100),
(100005, 'Raspberry Small', 'ras s.png', 100),
(100006, 'Grape Small', 'gp s.png', 100),
(100007, 'Orange Large', 'org l.png', 180),
(100008, 'Raspberry Large', 'ras l.png', 180),
(100009, 'Grape Large', 'gp l.png', 180);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_ID` int(11) NOT NULL,
  `Ongoing_Promotion` varchar(50) NOT NULL,
  `SDate` date NOT NULL,
  `EDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotion_ID`, `Ongoing_Promotion`, `SDate`, `EDate`) VALUES
(0, 'none', '0000-00-00', '0000-00-00'),
(1, 'Christmas Sales', '2022-12-24', '2022-12-25'),
(2, 'Special Anniversary', '2022-10-20', '2022-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `Recipe_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`Recipe_ID`, `User_ID`, `Amount`) VALUES
(1002, 1, 875),
(1004, 14, 315),
(1005, 15, 335),
(1006, 15, 135),
(1007, 19, 100),
(1008, 20, 135),
(1009, 21, 135),
(1010, 1, 215);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `Product_ID` int(11) NOT NULL,
  `Size` varchar(25) DEFAULT NULL,
  `Delivery_ID` int(11) DEFAULT NULL,
  `Product_Price` int(11) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`Product_ID`, `Size`, `Delivery_ID`, `Product_Price`, `User_ID`) VALUES
(100000, 'Small', 600001, 100, 0),
(100001, 'Large', 600000, 100, 2),
(100002, 'Medium', 600001, 180, 1);

-- --------------------------------------------------------

--
-- Table structure for table `silver member`
--

CREATE TABLE `silver member` (
  `Member_Silver` int(11) NOT NULL,
  `Silver_Discount_Code` varchar(25) NOT NULL,
  `Silver_Privilege` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `silver member`
--

INSERT INTO `silver member` (`Member_Silver`, `Silver_Discount_Code`, `Silver_Privilege`) VALUES
(0, 'none', 'not a silver member'),
(1, 'FD112', 'Free Dilivery'),
(2, 'B7GD120B', 'Buy 700 get discount 120 '),
(3, 'DC150B', 'Discount 150 Baht x1'),
(4, 'DC100B', 'Disount 100 Baht x1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(25) DEFAULT NULL,
  `Password` varchar(25) DEFAULT NULL,
  `FName` varchar(25) DEFAULT NULL,
  `LName` varchar(25) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `national_id` varchar(13) DEFAULT NULL,
  `Member_Type` varchar(25) DEFAULT NULL,
  `usertype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Username`, `Password`, `FName`, `LName`, `Email`, `Phone`, `Address`, `national_id`, `Member_Type`, `usertype`) VALUES
(1, 'preravitch.s@gmail.com', '1234', 'Preravitch', 'Siripanich', 'preravitch.s@gmail.com', '0838927476', 'navamin bangkok', '1103900089857', 'Gold Member', 'admin'),
(2, 'phanuwichsis9@gmail.com', '12345678', 'Phanuwich', 'Thepnok', 'phanuwichsis9@gmail.com', '0872612540', 'Mars', '1102948594123', 'No Member', 'user'),
(19, 'angelts@hotmail.co.th', '1234', ' ', ' ', 'angelts@hotmail.co.th', ' ', ' ', ' ', 'No member', 'user'),
(21, 'user@hotmail.co.th', '1234', ' ', ' ', 'user@hotmail.co.th', ' ', ' ', '1234', 'No member', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calculate`
--
ALTER TABLE `calculate`
  ADD PRIMARY KEY (`Calculate_ID`),
  ADD KEY `Product_Price` (`Product_Price`,`Silver_Discount_code`,`Gold_Discount_code`,`Platinum_Discount_code`,`Payment_ID`),
  ADD KEY `Silver_Discount_code` (`Silver_Discount_code`),
  ADD KEY `Gold_Discount_code` (`Gold_Discount_code`),
  ADD KEY `Payment_ID` (`Payment_ID`),
  ADD KEY `Platinum_Discount_code` (`Platinum_Discount_code`),
  ADD KEY `promotion_ID` (`promotion_ID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Delivery_ID`),
  ADD KEY `Calculate_ID` (`Calculate_ID`);

--
-- Indexes for table `gold member`
--
ALTER TABLE `gold member`
  ADD PRIMARY KEY (`Member_Gold`),
  ADD KEY `Gold_Discount_Code` (`Gold_Discount_Code`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`Member_Type`),
  ADD KEY `Member_Silver` (`Member_Silver`),
  ADD KEY `Member_Gold` (`Member_Gold`),
  ADD KEY `Member_Platinum` (`Member_Platinum`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Recipe_ID` (`Recipe_ID`);

--
-- Indexes for table `platinum member`
--
ALTER TABLE `platinum member`
  ADD PRIMARY KEY (`Member_Platinum`),
  ADD KEY `Platinum_Discount_Code` (`Platinum_Discount_Code`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_ID`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`Recipe_ID`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Delivery_ID` (`Delivery_ID`,`Product_Price`,`User_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Product_Price` (`Product_Price`);

--
-- Indexes for table `silver member`
--
ALTER TABLE `silver member`
  ADD PRIMARY KEY (`Member_Silver`),
  ADD KEY `Silver_Discount_Code` (`Silver_Discount_Code`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `Member_Type` (`Member_Type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100012;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `Recipe_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calculate`
--
ALTER TABLE `calculate`
  ADD CONSTRAINT `calculate_ibfk_1` FOREIGN KEY (`Silver_Discount_code`) REFERENCES `silver member` (`Silver_Discount_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calculate_ibfk_2` FOREIGN KEY (`Gold_Discount_code`) REFERENCES `gold member` (`Gold_Discount_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calculate_ibfk_4` FOREIGN KEY (`Payment_ID`) REFERENCES `payment` (`Payment_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calculate_ibfk_5` FOREIGN KEY (`Platinum_Discount_code`) REFERENCES `platinum member` (`Platinum_Discount_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calculate_ibfk_6` FOREIGN KEY (`promotion_ID`) REFERENCES `promotion` (`promotion_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Calculate_ID`) REFERENCES `calculate` (`Calculate_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Member_Gold`) REFERENCES `gold member` (`Member_Gold`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`Member_Silver`) REFERENCES `silver member` (`Member_Silver`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_ibfk_3` FOREIGN KEY (`Member_Platinum`) REFERENCES `platinum member` (`Member_Platinum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`Delivery_ID`) REFERENCES `delivery` (`Delivery_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_ibfk_3` FOREIGN KEY (`Product_Price`) REFERENCES `calculate` (`Product_Price`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
