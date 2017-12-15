-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2017 at 01:08 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ams`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAddLog` (IN `id` INT, IN `araw` DATE, IN `oras` DATE, IN `stats` INT)  NO SQL
INSERT INTO tbllogs  (tbllogs.empId,tbllogs.Status,tbllogs.date,tbllogs.time)
VALUES (id,stats,araw,oras)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spAddPerson` (IN `fname` VARCHAR(70), IN `mname` VARCHAR(50), IN `lname` VARCHAR(50), IN `bd` DATE, IN `suf` VARCHAR(5), IN `sex` VARCHAR(6))  NO SQL
INSERT into tblperson (tblperson.firstName, tblperson.middleName, tblperson.lastName, tblperson.suffix,tblperson.birthdate,tblperson.gender)
VALUES (fname,mname,lname,suf,bd,sex)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spStatus` (IN `id` INT, IN `petsa` DATE)  NO SQL
select count(logid) as log, CONCAT(p.lastName,", ",p.firstName) as Fullname 
from tbllogs t JOIN tblperson p 
	on t.empId = p.personId
WHERE t.empId = id and t.date = petsa$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbllogs`
--

CREATE TABLE `tbllogs` (
  `logId` int(11) NOT NULL,
  `empId` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllogs`
--

INSERT INTO `tbllogs` (`logId`, `empId`, `Status`, `date`, `time`) VALUES
(1, 1, 0, '2017-12-14', '2017-12-14'),
(2, 1, 0, '2017-12-15', '0000-00-00'),
(3, 1, 1, '2017-12-15', '0000-00-00'),
(4, 1, 2, '2017-12-15', '0000-00-00'),
(5, 1, 3, '2017-12-15', '0000-00-00'),
(6, 1, 4, '2017-12-15', '0000-00-00'),
(7, 1, 5, '2017-12-15', '0000-00-00'),
(8, 1, 6, '2017-12-15', '0000-00-00'),
(9, 1, 7, '2017-12-15', '0000-00-00'),
(10, 1, 8, '2017-12-15', '0000-00-00'),
(11, 1, 9, '2017-12-15', '0000-00-00'),
(12, 1, 10, '2017-12-15', '0000-00-00'),
(13, 1, 11, '2017-12-15', '0000-00-00'),
(14, 1, 0, '2017-12-16', '0000-00-00'),
(15, 1, 1, '2017-12-16', '0000-00-00'),
(16, 1, 2, '2017-12-16', '0000-00-00'),
(17, 1, 3, '2017-12-16', '0000-00-00'),
(18, 1, 4, '2017-12-16', '0000-00-00'),
(19, 1, 5, '2017-12-16', '0000-00-00'),
(20, 1, 6, '2017-12-16', '0000-00-00'),
(21, 1, 7, '2017-12-16', '0000-00-00'),
(22, 1, 8, '2017-12-16', '0000-00-00'),
(23, 1, 9, '2017-12-16', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tblperson`
--

CREATE TABLE `tblperson` (
  `personId` int(11) NOT NULL,
  `firstName` varchar(70) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `suffix` varchar(5) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblperson`
--

INSERT INTO `tblperson` (`personId`, `firstName`, `middleName`, `lastName`, `suffix`, `birthdate`, `gender`) VALUES
(1, 'dasd', 'adsa', 'dad', 'jr', '2017-06-21', 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbllogs`
--
ALTER TABLE `tbllogs`
  ADD PRIMARY KEY (`logId`);

--
-- Indexes for table `tblperson`
--
ALTER TABLE `tblperson`
  ADD PRIMARY KEY (`personId`),
  ADD KEY `personId` (`personId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbllogs`
--
ALTER TABLE `tbllogs`
  MODIFY `logId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblperson`
--
ALTER TABLE `tblperson`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
