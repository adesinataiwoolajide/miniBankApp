-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2019 at 06:25 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountid` bigint(20) NOT NULL,
  `accountnumber` bigint(20) DEFAULT NULL,
  `customer_customerid` bigint(20) DEFAULT NULL,
  `account_category_accountcategoryid` bigint(20) DEFAULT NULL,
  `currency_currencyid` bigint(20) DEFAULT NULL,
  `account_officer_officerid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountid`, `accountnumber`, `customer_customerid`, `account_category_accountcategoryid`, `currency_currencyid`, `account_officer_officerid`) VALUES
(1, 14451673, 9, 3, 3, 4),
(2, 63054995, 8, 1, 3, 1),
(3, 78259799, 8, 2, 3, 4),
(4, 22301987, 9, 4, 3, 4),
(5, 65597409, 3, 3, 3, 1),
(6, 70671180, 8, 3, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_category`
--

CREATE TABLE `account_category` (
  `accountcategoryid` bigint(20) NOT NULL,
  `accountcategoryname` varchar(255) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_category`
--

INSERT INTO `account_category` (`accountcategoryid`, `accountcategoryname`, `amount`) VALUES
(1, 'Current Account', 12000),
(2, 'Savings Account', 5500),
(3, 'Student Account', 0),
(4, 'Fixed Deposit Account', 20000),
(11, 'Daily Contribution', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `account_officer`
--

CREATE TABLE `account_officer` (
  `officerid` bigint(20) NOT NULL,
  `officername` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_officer`
--

INSERT INTO `account_officer` (`officerid`, `officername`) VALUES
(1, 'Adesina Adedayo U'),
(2, 'Ajibade Samson Opeyemi'),
(4, 'Adedeji Omobosola Nofisat'),
(6, 'Adesina Adekunle');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currencyid` bigint(20) NOT NULL,
  `currencymnemonic` varchar(255) DEFAULT NULL,
  `currencyname` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currencyid`, `currencymnemonic`, `currencyname`) VALUES
(3, 'NGR', 'Naira'),
(4, 'USD', 'US Dollar'),
(5, 'GHS', 'Ghana Cides'),
(7, 'PDS', 'Pounds');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerid` bigint(20) NOT NULL,
  `customername` varchar(255) DEFAULT NULL,
  `mnemonic` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phonenumber` bigint(20) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `kinname` varchar(255) DEFAULT NULL,
  `kinaddress` varchar(255) DEFAULT NULL,
  `sector_sectorid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerid`, `customername`, `mnemonic`, `gender`, `phonenumber`, `nationality`, `address`, `kinname`, `kinaddress`, `sector_sectorid`) VALUES
(2, 'Adeola Tolayemi', 'TOLA', 'Male', 9087654321, 'Nigerian', '   Oyo state  Ibadan     ', 'Tola Adeola', '                                                                                        Ibadan                                                                 Bodija\r\n                                    \r\n                                    \r\n            ', 5),
(3, 'Deborah Akingbala', 'Debby', 'Male', 9087654321, 'Nigerian', '   Lagos State  ', 'Akingbala Tolulope', '                                                                                 Coker Area\r\n                                    \r\n                                    ', 3),
(8, 'Akinola Joseph H', 'JOSH', 'Male', 9087654232, 'Nigerian', ' Lagos Highland ', 'Akinola Bosede', '                                        Lagos Mainland\r\n                                    \r\n                                    ', 5),
(9, 'Adesina Taiwo V', 'VICKY', 'Male', 8138139333, 'Nigerian', ' 8 Sotomi Street, Makola Ibadan', 'Adesina Kehinde Victoria', ' 4 Prince O Street Ororuwo', 2),
(10, 'Oladimeji Bola', 'OLAB', 'Male', 8021234444, 'Nigerian', '  21 Ladoke Akintola Strret Ibdan ', 'Mr Oladimeji Goke', '                                         21 Ladoke Akintola Strret Ibadan\r\n                                    ', 2),
(12, 'Dolakola Mayor', 'DOLCOL', 'Male', 8021234422, 'Nigerian', 'Ibadan Oyo State', 'Solomon', 'Ladoke Akintola\r\n                                    ', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer_balance`
--

CREATE TABLE `customer_balance` (
  `balanceid` bigint(20) NOT NULL,
  `closeab` bigint(20) DEFAULT NULL,
  `onlineac` bigint(20) DEFAULT NULL,
  `onlinecb` bigint(20) DEFAULT NULL,
  `openab` bigint(20) DEFAULT NULL,
  `workingb` bigint(20) DEFAULT NULL,
  `account_accountid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_balance`
--

INSERT INTO `customer_balance` (`balanceid`, `closeab`, `onlineac`, `onlinecb`, `openab`, `workingb`, `account_accountid`) VALUES
(1, 40000, 40000, 40000, 40000, 40000, 1),
(2, 31500, 31500, 31500, 31500, 31500, 4),
(3, 9000, 9000, 9000, 9000, 9000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `deposite`
--

CREATE TABLE `deposite` (
  `depositeid` bigint(20) NOT NULL,
  `account_accountid` bigint(20) DEFAULT NULL,
  `sendername` varchar(255) DEFAULT NULL,
  `senderphone` bigint(20) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `depositedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_customerid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deposite`
--

INSERT INTO `deposite` (`depositeid`, `account_accountid`, `sendername`, `senderphone`, `amount`, `depositedate`, `customer_customerid`) VALUES
(1, 1, 'Self', 908463743, 20000, NULL, 9),
(2, 1, 'Self', 9083743233, 20000, NULL, 9),
(3, 4, 'Self', 9084643444, 10500, NULL, 9),
(4, 4, 'Jethro System', 8137464433, 12000, NULL, 9),
(5, 6, 'Adesina Taiwo', 8137474333, 9000, NULL, 8),
(6, 4, 'Jethro System', 9083743322, 9000, NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer`
--

CREATE TABLE `fund_transfer` (
  `fundtransferid` bigint(20) NOT NULL,
  `debitamount` bigint(20) DEFAULT NULL,
  `reciever` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `currency_currencyid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'Admin'),
(2, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `sectorid` bigint(20) NOT NULL,
  `sectorname` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`sectorid`, `sectorname`) VALUES
(2, 'Education'),
(3, 'Agriculture'),
(4, 'Finance'),
(5, 'Banking and Finance'),
(6, 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactionid` bigint(20) NOT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `transactiontype` varchar(255) DEFAULT NULL,
  `account_accountid` bigint(20) DEFAULT NULL,
  `customer_customerid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionid`, `amount`, `transactiontype`, `account_accountid`, `customer_customerid`) VALUES
(1, 20000, 'CR', 1, 9),
(2, 20000, 'CR', 1, 9),
(3, 10500, 'CR', 4, 9),
(4, 12000, 'CR', 4, 9),
(5, 9000, 'CR', 6, 8),
(6, 9000, 'CR', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `user_name`, `password`, `role`, `status`) VALUES
(1, 'Adesina Taiwo Ola', 'tolajide74@gmail.com', '$2a$10$8v89tOMbQM3fUEAebfBjSOlSyqh05Y5.322iDnEVQruf6sTFoSaxK', 'ADMIN', 1),
(4, 'Adesina Kehinde', 'tolajumoke@gmail.com', '$2a$10$W2bC50ho0trP/IAbSE.gg.XDcMkpG/SzT8AvlziEDBBp0gU7E29d.', 'ADMIN', 1),
(7, 'Adekunle', 'kunle@gmail.com', '$2a$10$QOWxKvN2p6.JaVOltcfAfOkfsudJ9vdzeSzXZ9594zyjn.7pG3e9.', 'Sales Girl', 0),
(6, 'Akinloye Eliz', 'titi@gmail.com', '$2a$10$bvMM7p1qrNpJ3LzvZ6J0O.xW74hWuPMrrUnqGeJWcKC/2DiJ/h7i6', 'Sales Girl', 1),
(8, 'Adedayo', 'dayo@gmail.com', '$2a$10$WzSU8lQpxlA7p0zXnJ36P.wVsrbxJzFzMioffbmJHYH2tjdV5bj/q', 'Sales Girl', 1),
(9, 'Samson', 'samson@gmail.com', '$2a$10$AQ7Pky3lNlyIL/XEnAA.ieNQcKe.Q63IlqP1ZoULygpCt.Pvhesfm', 'Sales Girl', 1);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawer`
--

CREATE TABLE `withdrawer` (
  `withdrawerid` bigint(20) NOT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `account_accountid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountid`),
  ADD KEY `FKni6dkj3qumk4voahojdhv6qia` (`account_category_accountcategoryid`),
  ADD KEY `FK5qm31anpk5isqprnl4dv1s551` (`account_officer_officerid`),
  ADD KEY `FKp1n59bxaikojurx3fnav2a7j3` (`currency_currencyid`),
  ADD KEY `FKj8ltcqfm9jhtppkb5qenqu0v5` (`customer_customerid`);

--
-- Indexes for table `account_category`
--
ALTER TABLE `account_category`
  ADD PRIMARY KEY (`accountcategoryid`);

--
-- Indexes for table `account_officer`
--
ALTER TABLE `account_officer`
  ADD PRIMARY KEY (`officerid`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currencyid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerid`),
  ADD KEY `FKdwq5y35s4yorypiqldnv7uuvy` (`sector_sectorid`);

--
-- Indexes for table `customer_balance`
--
ALTER TABLE `customer_balance`
  ADD PRIMARY KEY (`balanceid`),
  ADD KEY `FKrrrnvej0d84a0bcpn2wuegvh0` (`account_accountid`);

--
-- Indexes for table `deposite`
--
ALTER TABLE `deposite`
  ADD PRIMARY KEY (`depositeid`),
  ADD KEY `FKpg0b4uwq83l6d0tn46dghue1d` (`account_accountid`),
  ADD KEY `FK3b62316otndijub1cvoj6anoa` (`customer_customerid`);

--
-- Indexes for table `fund_transfer`
--
ALTER TABLE `fund_transfer`
  ADD PRIMARY KEY (`fundtransferid`),
  ADD KEY `FKf1w8d9u1jbrivxj9a5f5ecdeh` (`currency_currencyid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`sectorid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionid`),
  ADD KEY `FKlobtkaultrtxuwp6t920fckdy` (`account_accountid`),
  ADD KEY `FKd8cnf4lxwl3dpsau18dnevuhn` (`customer_customerid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `withdrawer`
--
ALTER TABLE `withdrawer`
  ADD PRIMARY KEY (`withdrawerid`),
  ADD KEY `FKjg2nvobhnts5yw749fnagh3nk` (`account_accountid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_category`
--
ALTER TABLE `account_category`
  MODIFY `accountcategoryid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `account_officer`
--
ALTER TABLE `account_officer`
  MODIFY `officerid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currencyid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_balance`
--
ALTER TABLE `customer_balance`
  MODIFY `balanceid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposite`
--
ALTER TABLE `deposite`
  MODIFY `depositeid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fund_transfer`
--
ALTER TABLE `fund_transfer`
  MODIFY `fundtransferid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `sectorid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `withdrawer`
--
ALTER TABLE `withdrawer`
  MODIFY `withdrawerid` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
