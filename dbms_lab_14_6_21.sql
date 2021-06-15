-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2021 at 06:04 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms_lab_7/6/21`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientmaster`
--

CREATE TABLE `clientmaster` (
  `client_no` int(11) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clientmaster`
--

INSERT INTO `clientmaster` (`client_no`, `cname`, `city`) VALUES
(101, 'senchu', 'kannur'),
(102, 'sobin', 'kannur'),
(103, 'sajan', 'mumbai'),
(104, 'siju', 'gujarath'),
(105, 'george', 'kottayam'),
(108, 'abhi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salesmaster`
--

CREATE TABLE `salesmaster` (
  `salesmanno` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesmaster`
--

INSERT INTO `salesmaster` (`salesmanno`, `sname`, `city`) VALUES
(1, 'biju', 'mumbai'),
(2, 'amith', 'mumbai'),
(3, 'sreelal', 'kannur'),
(4, 'anoop', 'thrissur'),
(5, 'goutham', 'pala');

-- --------------------------------------------------------

--
-- Table structure for table `salesorder`
--

CREATE TABLE `salesorder` (
  `order_no` int(11) NOT NULL,
  `client_no` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesorder`
--

INSERT INTO `salesorder` (`order_no`, `client_no`, `order_date`) VALUES
(0, 101, '2013-06-01'),
(1, 103, '2013-02-01'),
(2, 103, '2013-03-21'),
(3, 102, '2013-03-02'),
(4, 105, '2013-04-02'),
(8, NULL, '2017-11-28');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`order_no` int(11)
,`order_date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2`
-- (See below for the actual view)
--
CREATE TABLE `view2` (
`client_no` int(11)
,`cname` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3`
-- (See below for the actual view)
--
CREATE TABLE `view3` (
`salesmanno` int(11)
,`sname` varchar(20)
,`city` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4`
-- (See below for the actual view)
--
CREATE TABLE `view4` (
`cname` varchar(20)
,`ccity` varchar(20)
,`sname` varchar(20)
,`city` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5`
-- (See below for the actual view)
--
CREATE TABLE `view5` (
`cname` varchar(20)
,`sname` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS SELECT `salesorder`.`order_no` AS `order_no`, `salesorder`.`order_date` AS `order_date` FROM `salesorder` ;

-- --------------------------------------------------------

--
-- Structure for view `view2`
--
DROP TABLE IF EXISTS `view2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2`  AS SELECT `clientmaster`.`client_no` AS `client_no`, `clientmaster`.`cname` AS `cname` FROM `clientmaster` ;

-- --------------------------------------------------------

--
-- Structure for view `view3`
--
DROP TABLE IF EXISTS `view3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3`  AS SELECT `salesmaster`.`salesmanno` AS `salesmanno`, `salesmaster`.`sname` AS `sname`, `salesmaster`.`city` AS `city` FROM `salesmaster` WHERE `salesmaster`.`city` = 'mumbai' ;

-- --------------------------------------------------------

--
-- Structure for view `view4`
--
DROP TABLE IF EXISTS `view4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4`  AS SELECT `clientmaster`.`cname` AS `cname`, `clientmaster`.`city` AS `ccity`, `salesmaster`.`sname` AS `sname`, `salesmaster`.`city` AS `city` FROM (`clientmaster` join `salesmaster`) ;

-- --------------------------------------------------------

--
-- Structure for view `view5`
--
DROP TABLE IF EXISTS `view5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5`  AS SELECT `view4`.`cname` AS `cname`, `view4`.`sname` AS `sname` FROM `view4` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientmaster`
--
ALTER TABLE `clientmaster`
  ADD PRIMARY KEY (`client_no`);

--
-- Indexes for table `salesmaster`
--
ALTER TABLE `salesmaster`
  ADD PRIMARY KEY (`salesmanno`);

--
-- Indexes for table `salesorder`
--
ALTER TABLE `salesorder`
  ADD PRIMARY KEY (`order_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
