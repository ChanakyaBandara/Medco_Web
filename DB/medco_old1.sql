-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2021 at 05:39 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medco`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DID` int(11) NOT NULL,
  `D_name` varchar(200) NOT NULL,
  `phone` int(10) NOT NULL,
  `medicalRegID` varchar(200) NOT NULL,
  `nic` varchar(10) NOT NULL,
  `email` varchar(200) NOT NULL,
  `LID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DID`, `D_name`, `phone`, `medicalRegID`, `nic`, `email`, `LID`) VALUES
(12, 'samanera\r\n', 717456526, '14141', '9824568454', 'samanera@gmail.com', 10),
(13, 'kater', 71745623, '4324', '9824284542', 'asaasa@gmail.com', 13);

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `drg_ID` int(11) NOT NULL,
  `drg_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `manf_comp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `drg_strength` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `drg_Desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `drg_Img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`drg_ID`, `drg_name`, `manf_comp`, `drg_strength`, `drg_Desc`, `drg_Img`) VALUES
(1, 'Panadol', 'SPC', '20mg', 'oluywe kakkumata hodai', 'pabaya.jpg'),
(2, 'Vitamin C', 'CPC', '200mg', 'Semata hodai', 'aliya.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `LID` int(11) NOT NULL,
  `Username` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`LID`, `Username`, `Password`, `Type`) VALUES
(7, 'Chanubandara5@gmail.com', '$2a$04$6pOcmKC7eqcmsxXVrrthNehgr3FmLGlmwRiL88h/34JM11BeXD5FG', 0),
(8, 'kusalsiriwardena@gmail.com', '$2y$10$DO61MfL46N.xKsQENzvLUOHboAUK0sgSR5ZofJanYPOlcmRFSxHS2', 0),
(10, 'gihan@gmail.com', 'pakaya123', 1),
(13, 'aliya@gmail.com', 'asdasd', 1),
(14, 'samana@gmail.com', 'dffgdfgdfg', 2),
(15, 'kabaraya@gmail.com', '321321', 2);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nic` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `LID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MID`, `name`, `email`, `nic`, `age`, `phone`, `gender`, `LID`) VALUES
(2, 'Sachini Abeysinghe', 'SachiniAbeysighe@gmail.com', '966838901v', 25, 768389031, 'Female', 7),
(3, 'Kusal Lahiru', 'kusalsiriwardena@gmail.com', '982862442v', 22, 717453144, 'Male', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oders`
--

CREATE TABLE `oders` (
  `oder_id` int(11) NOT NULL,
  `oder_date` date NOT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `Cost` int(11) NOT NULL,
  `PHID` int(11) NOT NULL,
  `PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oders`
--

INSERT INTO `oders` (`oder_id`, `oder_date`, `reference`, `Cost`, `PHID`, `PID`) VALUES
(1, '2021-07-08', 'asdasdads', 200, 1, 4),
(2, '2021-07-01', 'la', 3000, 1, 2),
(3, '2021-07-16', '', 2323, 2, 1),
(4, '2021-08-13', 'asas', 450, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `ph_ID` int(11) NOT NULL,
  `Ph_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `Ph_reg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `LID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`ph_ID`, `Ph_name`, `Ph_reg`, `LID`) VALUES
(1, 'ashoka pharmacy', '12541', 14),
(2, 'sumane pharmacy ', '56565', 15);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `Pre_ID` int(11) NOT NULL,
  `Pre_Date` date NOT NULL,
  `QR_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `MID` int(11) NOT NULL,
  `DID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`Pre_ID`, `Pre_Date`, `QR_ID`, `MID`, `DID`) VALUES
(1, '2021-06-16', '123123123123', 3, 13),
(2, '2021-06-12', '369365', 2, 13),
(3, '2021-06-16', '456456', 3, 12),
(4, '2021-06-11', '434234', 3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `pre_drg`
--

CREATE TABLE `pre_drg` (
  `PDID` int(11) NOT NULL,
  `PRID` int(11) NOT NULL,
  `DRID` int(11) NOT NULL,
  `dose` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_drg`
--

INSERT INTO `pre_drg` (`PDID`, `PRID`, `DRID`, `dose`) VALUES
(1, 3, 1, '20'),
(2, 3, 2, '25'),
(3, 4, 2, '50'),
(4, 3, 1, '20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DID`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `LID` (`LID`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drg_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`LID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MID`),
  ADD KEY `LID` (`LID`);

--
-- Indexes for table `oders`
--
ALTER TABLE `oders`
  ADD PRIMARY KEY (`oder_id`),
  ADD KEY `PHID` (`PHID`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`ph_ID`),
  ADD KEY `LID` (`LID`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`Pre_ID`),
  ADD KEY `DID` (`DID`),
  ADD KEY `MID` (`MID`);

--
-- Indexes for table `pre_drg`
--
ALTER TABLE `pre_drg`
  ADD PRIMARY KEY (`PDID`),
  ADD KEY `DRID` (`DRID`),
  ADD KEY `PRID` (`PRID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drg_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `LID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `MID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oders`
--
ALTER TABLE `oders`
  MODIFY `oder_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `ph_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `Pre_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pre_drg`
--
ALTER TABLE `pre_drg`
  MODIFY `PDID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `login` (`LID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `login` (`LID`);

--
-- Constraints for table `oders`
--
ALTER TABLE `oders`
  ADD CONSTRAINT `oders_ibfk_1` FOREIGN KEY (`PHID`) REFERENCES `pharmacy` (`ph_ID`),
  ADD CONSTRAINT `oders_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `prescription` (`Pre_ID`);

--
-- Constraints for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD CONSTRAINT `pharmacy_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `login` (`LID`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`DID`) REFERENCES `doctor` (`DID`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`MID`) REFERENCES `member` (`MID`);

--
-- Constraints for table `pre_drg`
--
ALTER TABLE `pre_drg`
  ADD CONSTRAINT `pre_drg_ibfk_1` FOREIGN KEY (`DRID`) REFERENCES `drugs` (`drg_ID`),
  ADD CONSTRAINT `pre_drg_ibfk_2` FOREIGN KEY (`PRID`) REFERENCES `prescription` (`Pre_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
