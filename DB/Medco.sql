-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 09, 2021 at 09:26 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Medco`
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
  `QRID` varchar(50) NOT NULL,
  `LID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DID`, `D_name`, `phone`, `medicalRegID`, `nic`, `email`, `QRID`, `LID`) VALUES
(14, 'KusalDoca', 123456789, '123456789', '123456789', 'KusalDoca@gmail.com', 'DOC_611e19052f22a', 18),
(16, 'Medhani', 77636358, '14141414141', '925658341v', 'Medhani@gmail.com', 'DOC_611e19052f22d', 21);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_queue`
--

CREATE TABLE `doctor_queue` (
  `DQID` int(11) NOT NULL,
  `DID` int(11) NOT NULL,
  `MID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_queue`
--

INSERT INTO `doctor_queue` (`DQID`, `DID`, `MID`, `timestamp`, `status`) VALUES
(1, 14, 2, '2021-09-09 09:33:53', 0),
(2, 16, 3, '2021-09-09 12:29:46', 0),
(3, 16, 3, '2021-09-09 12:32:31', 0);

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
(2, 'Vitamin C', 'CPC', '200mg', 'Semata hodai', 'aliya.jpg'),
(3, 'diabitasol', 'SPC', '20mg', 'good for vomiting', 'alia.jpg');

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
(1, '2021-07-08', 'asdasdads', 200, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `phamacy_queue`
--

CREATE TABLE `phamacy_queue` (
  `PQID` int(11) NOT NULL,
  `PHID` int(11) NOT NULL,
  `PREID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phamacy_queue`
--

INSERT INTO `phamacy_queue` (`PQID`, `PHID`, `PREID`, `timestamp`, `status`) VALUES
(1, 4, 13, '2021-09-09 09:41:19', 0),
(2, 4, 4, '2021-09-09 12:13:09', 0),
(3, 4, 13, '2021-09-09 12:18:59', 0),
(4, 5, 3, '2021-09-09 12:43:43', 0),
(5, 5, 13, '2021-09-09 12:48:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `ph_ID` int(11) NOT NULL,
  `Ph_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `Ph_reg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `location` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `ph_email` varchar(100) NOT NULL,
  `QRID` varchar(50) NOT NULL,
  `LID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`ph_ID`, `Ph_name`, `Ph_reg`, `location`, `phone`, `ph_email`, `QRID`, `LID`) VALUES
(4, 'Osu sewawna', '234', 'No 200 Narahenpita - Nawala Rd, Sri Jayawardenepura Kotte', '011256254785', 'osusewana@gmail.com', 'PHA_611e19eeae526', 20),
(5, 'Nimali Pharmacy', '151611718', 'Kurunegala', '0457484111', 'Nimali@gmail.com', 'PHA_611e19eeae525', 22);

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
(3, '2021-06-16', '456456', 3, 14),
(4, '2021-06-11', '434234', 3, 14),
(13, '2021-08-19', '123456', 3, 14);

-- --------------------------------------------------------

--
-- Table structure for table `pre_drg`
--

CREATE TABLE `pre_drg` (
  `PDID` int(11) NOT NULL,
  `PRID` int(11) NOT NULL,
  `DRID` int(11) NOT NULL,
  `dose` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `Remark` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_drg`
--

INSERT INTO `pre_drg` (`PDID`, `PRID`, `DRID`, `dose`, `Remark`) VALUES
(1, 3, 1, '20', ''),
(2, 3, 2, '25', ''),
(3, 4, 2, '50', ''),
(4, 3, 1, '20', ''),
(5, 13, 1, '20', 'Morning'),
(6, 13, 2, '10', 'Evining');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `LID` int(11) NOT NULL,
  `Username` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`LID`, `Username`, `Password`, `Type`) VALUES
(7, 'Chanubandara5@gmail.com', '$2y$10$ECLxBz3sVc5Nurm8IJZefu1ob5bD5WYnGJx4bViUDpgSP4BZbivsS', 0),
(8, 'kusalsiriwardena@gmail.com', '$2y$10$ECLxBz3sVc5Nurm8IJZefu1ob5bD5WYnGJx4bViUDpgSP4BZbivsS', 0),
(16, 'Admin@gmail.com', '$2y$10$ECLxBz3sVc5Nurm8IJZefu1ob5bD5WYnGJx4bViUDpgSP4BZbivsS', 1),
(18, 'KusalDoca@gmail.com', '$2y$10$ECLxBz3sVc5Nurm8IJZefu1ob5bD5WYnGJx4bViUDpgSP4BZbivsS', 3),
(20, 'osusewana@gmail.com', '$2y$10$ECLxBz3sVc5Nurm8IJZefu1ob5bD5WYnGJx4bViUDpgSP4BZbivsS', 2),
(21, 'Medhani@gmail.com', '$2y$10$zDJL28UUGiSq.BTJIqRhFO0H8WROA5dF.f2AO7GZvHnt6llmhw7QK', 3),
(22, 'Nimali@gmail.com', '$2y$10$d55.RMZhvlTWxAk9O12cAu5xcqV9bbBq9Hs.wSqC7w79UjRdvMgOq', 2);

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
-- Indexes for table `doctor_queue`
--
ALTER TABLE `doctor_queue`
  ADD PRIMARY KEY (`DQID`),
  ADD KEY `DID` (`DID`),
  ADD KEY `MID` (`MID`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drg_ID`);

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
-- Indexes for table `phamacy_queue`
--
ALTER TABLE `phamacy_queue`
  ADD PRIMARY KEY (`PQID`),
  ADD KEY `PHID` (`PHID`),
  ADD KEY `PREID` (`PREID`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`LID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `doctor_queue`
--
ALTER TABLE `doctor_queue`
  MODIFY `DQID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drg_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `phamacy_queue`
--
ALTER TABLE `phamacy_queue`
  MODIFY `PQID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `ph_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `Pre_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pre_drg`
--
ALTER TABLE `pre_drg`
  MODIFY `PDID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `LID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `users` (`LID`);

--
-- Constraints for table `doctor_queue`
--
ALTER TABLE `doctor_queue`
  ADD CONSTRAINT `doctor_queue_ibfk_1` FOREIGN KEY (`DID`) REFERENCES `doctor` (`DID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctor_queue_ibfk_2` FOREIGN KEY (`MID`) REFERENCES `member` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `users` (`LID`);

--
-- Constraints for table `oders`
--
ALTER TABLE `oders`
  ADD CONSTRAINT `oders_ibfk_1` FOREIGN KEY (`PHID`) REFERENCES `pharmacy` (`ph_ID`),
  ADD CONSTRAINT `oders_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `prescription` (`Pre_ID`);

--
-- Constraints for table `phamacy_queue`
--
ALTER TABLE `phamacy_queue`
  ADD CONSTRAINT `phamacy_queue_ibfk_1` FOREIGN KEY (`PHID`) REFERENCES `pharmacy` (`ph_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phamacy_queue_ibfk_2` FOREIGN KEY (`PREID`) REFERENCES `prescription` (`Pre_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD CONSTRAINT `pharmacy_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `users` (`LID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
