-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Sep 08, 2023 at 04:58 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelnepal`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `number_of_people` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `package_id`, `customer_name`, `customer_email`, `booking_date`, `number_of_people`) VALUES
(1, 2, 'umesh', 'umesh@gmail.com', '2023-06-28', 5),
(2, 3, 'Distrack', 'dis@gmail.ccom', '2023-06-28', 2),
(4, 5, 'Distrack', 'dis@gmail.ccom', '2023-06-28', 2),
(5, 3, 'umesh', 'umesh@gmail.com', '2023-06-28', 1),
(6, 3, 'umesh', 'umesh@gmail.com', '2023-06-28', 1),
(7, 3, 'umesh', 'umesh@gmail.com', '2023-06-28', 1),
(8, 2, 'umesh', 'umesh@gmail.com', '2023-08-10', 5),
(9, 2, 'umesh', 'umesh@gmail.com', '2023-08-29', 5);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Adventure Travel'),
(2, 'Cultural and Historical Tours'),
(5, 'Wildlife and Nature Excursions'),
(6, 'City Breaks'),
(7, 'Wellness and Spa Retreats'),
(8, 'Educational and Study Tours');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `category` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `location` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  `agencyid` int(11) NOT NULL,
  `picture` varchar(200) NOT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `category`, `description`, `price`, `location`, `duration`, `people`, `agencyid`, `picture`, `updated_date`) VALUES
(1, 'hendrila tour', 6, 'werf werf erg  rhy', 2000, 'asfsdf', 2, 3, 4, 'hendrila tour-vendor4.jpg', '2023-05-19'),
(2, 'Muktinath-Darshan', 2, 'Great retreat for cultural and religious visit', 10000, 'Nepal', 4, 5, 3, 'Muktinath-Darshan-vendor3.jpg', '2023-06-27'),
(3, 'Taj mahal', 2, 'Historical and cultural visit to Indi\'s famous wonder', 5000, 'India', 2, 4, 3, 'Taj mahal-vendor3.jpg', '2023-06-29'),
(4, 'Sea Life', 1, 'A sea life is all you need.', 5000, 'Maldives', 2, 4, 3, 'Sea Life-vendor3.jpg', '2023-06-27'),
(5, 'Sea Life', 1, 'A sea life is all you need.', 5000, 'Maldives', 2, 4, 3, 'Sea Life-vendor3.jpg', '2023-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `dob` date DEFAULT NULL,
  `pan` bigint(20) DEFAULT NULL,
  `password` varchar(257) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `email`, `phone`, `dob`, `pan`, `password`, `user_type`) VALUES
(1, 'umesh niure', NULL, 'apple@gmail.com', 1234321234, '2023-05-01', NULL, '123', 1),
(2, 'umesh', NULL, 'umesh@gmail.com', 1231231233, '2023-05-04', NULL, 'UGFzc3dvcmQ=', 1),
(3, 'Hendra travel and tour', 'kharibot, kathmandu', 'handra@info.com', 1234567890, NULL, 39895345, 'UGFzc3dvcmQ=', 2),
(4, 'Mahendra Gyawali', NULL, 'hendra@gmail.com', 982035912, '2023-05-02', 982035912, 'UGFzc3dvcmQ=', 2),
(5, 'Distrack', NULL, 'dis@gmail.ccom', 983098909, '2001-12-12', 983098909, 'UGFzc3dvcmQ=', 1),
(6, 'Ramajan Shrestha', 'New Baneshwor, Kathmandu', 'ramazan@gmail.com', 9802987656, NULL, 298765, 'UGFzc3dvcmQx', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type`) VALUES
(1, 'User'),
(2, 'Agency'),
(3, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_package` (`package_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendorid` (`agencyid`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_type` (`user_type`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_package` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`agencyid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `packages_ibfk_2` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
