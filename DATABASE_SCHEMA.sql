-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2024 at 11:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `92_donner_kings`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_ID` int(11) NOT NULL,
  `Drinks` tinyint(1) NOT NULL DEFAULT 0,
  `Kebabs` tinyint(1) NOT NULL DEFAULT 0,
  `Burgers` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_ID`, `Drinks`, `Kebabs`, `Burgers`) VALUES
(1, 1, 0, 0),
(2, 0, 1, 0),
(3, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_ID` int(11) NOT NULL,
  `catagory_ID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `alt_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_ID`, `catagory_ID`, `price`, `description`, `image_path`, `alt_text`) VALUES
(1, 1, 2, 'Coca-Cola', '/images/drinks/coke.jpg', 'Image of a Coca-Cola can'),
(2, 1, 2, 'Capri-Sun', '/images/drinks/caprisun.jpg', 'Image of a Capri-Sun'),
(3, 2, 8, 'Doner Kebab', '/images/kebabs/doner_kebab.jpg', 'Image of a Donner Kebab'),
(4, 2, 9, 'Chicken Kebab', '/images/kebabs/chicken_kebab.jpg', 'Image of a Chicken Kebab'),
(5, 3, 7, 'Beef Burger', '/images/burgers/beef_burger.jpg', 'Image of a Beef Burger '),
(6, 3, 8, 'Veggie Burger', '/images/burgers/veggie_burger.jpg', 'Image of a Veggie Burger'),
(7, 1, 2, 'Sprite', '/images/drinks/sprite.jpg', 'Image of a Sprite can'),
(8, 1, 2, 'Pepsi', '/images/drinks/pepsi.jpg', 'Image of a Pepsi can'),
(9, 2, 10, 'Mixed Kebab', '/images/kebabs/mixed_kebab.jpg', 'Image of a Mixed Kebab with salad'),
(10, 2, 9, 'Lamb Kebab', '/images/kebabs/lamb_kebab.jpg', 'Image of a Lamb Kebab'),
(11, 2, 12, 'Beef Shawarma', '/images/kebabs/beef_shawarma.jpg', 'Image of a Beef Shawarma wrap'),
(12, 3, 7, 'Chicken Burger', '/images/burgers/chicken_burger.jpg', 'Image of a Chicken Burger'),
(13, 3, 6, 'Fish Burger', '/images/burgers/fish_burger.jpg', 'Image of a Fish Burger'),
(14, 3, 9, 'Cheeseburger', '/images/burgers/cheeseburger.jpg', 'Image of a Cheeseburger with toppings'),
(15, 3, 8, 'Spicy Veggie Burger', '/images/burgers/spicy_veggie_burger.jpg', 'Image of a Spicy Veggie Burger'),
(16, 2, 11, 'Falafel Wrap', '/images/kebabs/falafel_wrap.jpg', 'Image of a Falafel Wrap with sauce');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_number`, `user_id`, `order_date`) VALUES
(1, 2, '2024-10-25'),
(2, 4, '2024-10-26'),
(3, 6, '2024-10-27'),
(4, 1, '2024-10-28'),
(5, 1, '2024-10-28'),
(6, 1, '2024-10-28'),
(7, 36, '2024-10-28'),
(8, 36, '2024-10-30'),
(9, 36, '2024-10-30'),
(10, 36, '2024-10-30'),
(11, 36, '2024-10-30');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_number` int(11) NOT NULL,
  `menu_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_number`, `menu_ID`, `quantity`) VALUES
(1, 3, 2),
(1, 1, 1),
(2, 5, 1),
(3, 4, 2),
(3, 2, 1),
(4, 2, 1),
(4, 3, 1),
(5, 2, 1),
(5, 3, 1),
(6, 2, 1),
(6, 3, 1),
(7, 4, 2),
(7, 5, 1),
(7, 6, 2),
(7, 2, 1),
(7, 1, 1),
(7, 3, 1),
(8, 7, 1),
(8, 2, 1),
(8, 4, 1),
(8, 3, 1),
(9, 10, 1),
(9, 5, 1),
(9, 1, 1),
(9, 2, 1),
(10, 7, 1),
(10, 2, 2),
(10, 4, 1),
(11, 10, 1),
(11, 9, 1),
(11, 3, 2),
(11, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_ID` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_ID`, `item_name`, `amount`) VALUES
(1, 'Lettuce', 200),
(2, 'Tomato', 80),
(3, 'Beef Patty', 85),
(4, 'Chicken Breast', 50),
(5, 'Coca-Cola Can', 240),
(6, 'Capri-Sun', 100),
(7, 'Doner Meat', 120),
(8, 'Pitta Bread', 200),
(9, 'Chilli Sauce', 150),
(10, 'Garlic Mayo', 100),
(11, 'French Fries', 300),
(12, 'Naan Bread', 75),
(13, 'Kebab Skewers', 500),
(14, 'Cucumber', 60),
(15, 'Onion', 90),
(16, 'Cheese Slice', 100),
(17, 'Fanta Can', 200),
(18, 'Falafel', 60),
(19, 'Hummus', 80),
(20, 'Garlic Sauce', 120),
(21, 'Pickles', 70),
(22, 'Kebab Wraps', 150),
(23, 'Mint Sauce', 90),
(24, 'Yoghurt Sauce', 100),
(25, 'Beef Doner Meat', 110),
(26, 'Lamb Doner Meat', 95),
(27, 'BBQ Sauce', 85);

-- --------------------------------------------------------

--
-- Table structure for table `stock_amount`
--

CREATE TABLE `stock_amount` (
  `stock_ID` int(11) NOT NULL,
  `menu_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_amount`
--

INSERT INTO `stock_amount` (`stock_ID`, `menu_ID`, `quantity`) VALUES
(1, 3, 1),
(2, 3, 1),
(4, 4, 1),
(7, 3, 1),
(8, 3, 2),
(9, 3, 1),
(1, 4, 2),
(2, 4, 1),
(8, 4, 1),
(9, 4, 1),
(3, 5, 1),
(10, 5, 1),
(1, 5, 1),
(2, 5, 1),
(9, 5, 1),
(1, 6, 2),
(2, 6, 2),
(11, 6, 2),
(8, 6, 1),
(9, 6, 1),
(5, 1, 1),
(6, 2, 1),
(14, 9, 2),
(1, 9, 1),
(2, 9, 1),
(9, 9, 1),
(15, 10, 4),
(1, 10, 2),
(2, 10, 2),
(8, 10, 1),
(9, 10, 1),
(16, 11, 1),
(10, 11, 1),
(1, 11, 1),
(2, 11, 1),
(9, 11, 1),
(18, 12, 1),
(20, 13, 1),
(21, 14, 5),
(22, 14, 3),
(23, 14, 1),
(24, 15, 3),
(2, 15, 2),
(19, 13, 10),
(25, 15, 1),
(26, 15, 1),
(9, 13, 2),
(2, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `credit-debit card` varchar(200) NOT NULL,
  `csv` int(3) NOT NULL,
  `staff` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `pass`, `first_name`, `last_name`, `address`, `postcode`, `credit-debit card`, `csv`, `staff`) VALUES
(1, 'Manager@92donnerkings.com', 'Manager_Password123!', 'John', 'Smith', '6 Roman Rd\r\nSalisbury, England', 'SP2 9BH', '3141-5926-5358-9793', 123, 1),
(2, 'Alice_Johnson@gmail.com', 'Password1!', 'Alice', 'Johnson', '123 Maple St\r\nLondon, England', 'LN1 2BG', '1111-2222-3333-4444', 123, 0),
(3, 'Chef@92donnerkings.com', 'Chef_Password123!', 'Bob', 'Williams', '456 Elm St\r\nManchester, England', 'MN3 4JL', '2222-3333-4444-5555', 234, 1),
(4, 'Charlie_Brown@gmail.com', 'Password3!', 'Charlie', 'Brown', '789 Pine St\r\nBirmingham, England', 'BM4 5KL', '3333-4444-5555-6666', 345, 0),
(5, 'David_clark@gmail.com', 'Password4!', 'David', 'Clark', '321 Oak St\r\nLeeds, England', 'LS6 7HG', '4444-5555-6666-7777', 456, 0),
(6, 'Eve_Adams@gmail.com', 'Password5!', 'Eve', 'Adams', '654 Willow St\r\nLiverpool, England', 'LV9 8JK', '5555-6666-7777-8888', 567, 0),
(7, 'Frank_Davis@gmail.com', 'Password6!', 'Frank', 'Davis', '987 Cedar St\r\nBristol, England', 'BS1 4GH', '6666-7777-8888-9999', 678, 0),
(8, 'GraceEvans@gmail.com', 'Password7!', 'Grace', 'Evans', '159 Birch St\r\nSheffield, England', 'SH2 8YZ', '7777-8888-9999-0000', 789, 0),
(9, 'Counter@92donnerkings.com', 'Counter_Password123!', 'Hannah', 'Garcia', '753 Ash St\r\nNottingham, England', 'NG3 9XW', '8888-9999-0000-1111', 890, 1),
(10, 'IsaacHarris@gmail.com', 'Password9!', 'Isaac', 'Harris', '951 Fir St\r\nNewcastle, England', 'NC5 7QR', '9999-0000-1111-2222', 901, 0),
(11, 'Jane_Martinez@gmail.com', 'Password10!', 'Jane', 'Martinez', '369 Redwood St\r\nLeicester, England', 'LC2 8DF', '0000-1111-2222-3333', 12, 0),
(12, 'KevinMoore@gmail.com', 'Password11!', 'Kevin', 'Moore', '147 Spruce St\r\nBrighton, England', 'BN1 3HT', '1111-3333-4444-5555', 123, 0),
(13, 'Delivery@92donnerkings.com', 'Delivery_Password123!', 'Laura', 'Scott', '258 Cypress St\r\nReading, England', 'RG2 5NL', '2222-4444-5555-6666', 234, 1),
(14, 'Mike_Lopez@gmail.com', 'Password13!', 'Mike', 'Lopez', '369 Palm St\r\nOxford, England', 'OX4 1ZB', '3333-5555-6666-7777', 345, 0),
(15, 'Nina_Walker@gmail.com', 'Password14!', 'Nina', 'Walker', '741 Chestnut St\r\nCambridge, England', 'CB3 6ZY', '4444-6666-7777-8888', 456, 0),
(16, 'Owen_Hill@gmail.com', 'Password15!', 'Owen', 'Hill', '852 Maple St\r\nYork, England', 'YK5 7UJ', '5555-7777-8888-9999', 567, 0),
(17, 'PaulaGreen@gmail.com', 'Password16!', 'Paula', 'Green', '963 Oak St\r\nBath, England', 'BA1 1JG', '6666-8888-9999-0000', 678, 0),
(18, 'QuinnNelson@gmail.com', 'Password17!', 'Quinn', 'Nelson', '174 Elm St\r\nExeter, England', 'EX4 3SP', '7777-9999-0000-1111', 789, 0),
(19, 'RachelPerry@gmail.com', 'Password18!', 'Rachel', 'Perry', '285 Cedar St\r\nNorwich, England', 'NR1 3QF', '8888-0000-1111-2222', 890, 0),
(20, 'Chef2@92donnerkings.com', 'Chef_Password123!', 'Sam', 'Young', '396 Birch St\r\nGloucester, England', 'GL1 2HP', '9999-1111-2222-3333', 901, 1),
(21, 'Tina_Brooks@gmail.com', 'Password20!', 'Tina', 'Brooks', '417 Fir St\r\nSouthampton, England', 'SO1 5JK', '0000-2222-3333-4444', 12, 0),
(22, 'UmaBailey@gmail.com', 'Password21!', 'Uma', 'Bailey', '528 Redwood St\r\nPlymouth, England', 'PL4 6KL', '1111-3333-4444-5555', 123, 0),
(23, 'Delivery@92donnerkings.com', 'Delivery_Password123!', 'Victor', 'Rivera', '639 Spruce St\r\nHull, England', 'HU3 8MN', '2222-4444-5555-6666', 234, 1),
(24, 'Wendy_Cox@gmail.com', 'Password23!', 'Wendy', 'Cox', '741 Palm St\r\nDerby, England', 'DE1 4GH', '3333-5555-6666-7777', 345, 0),
(25, 'Xaiver_Ward@gmail.com', 'Password24!', 'Xavier', 'Ward', '852 Chestnut St\r\nWolverhampton, England', 'WV1 2FD', '4444-6666-7777-8888', 456, 0),
(26, 'Yara_Reed@gmail.com', 'Password25!', 'Yara', 'Reed', '963 Cypress St\r\nCoventry, England', 'CV5 9BL', '5555-7777-8888-9999', 567, 0),
(27, 'Zack_King@gmail.com', 'Password26!', 'Zack', 'King', '174 Palm St\r\nLeeds, England', 'LS6 7FD', '6666-8888-9999-0000', 678, 0),
(28, 'AlexTurner@gmail.com', 'Password27!', 'Alex', 'Turner', '285 Maple St\r\nCardiff, Wales', 'CF1 4LN', '7777-9999-0000-1111', 789, 0),
(29, 'BettyGray@gmail.com', 'Password28!', 'Betty', 'Gray', '396 Oak St\r\nSwansea, Wales', 'SA2 7HJ', '8888-0000-1111-2222', 890, 0),
(30, 'Chris_White@gmail.com', 'Password29!', 'Chris', 'White', '417 Elm St\r\nNewport, Wales', 'NP4 5JH', '9999-1111-2222-3333', 901, 0),
(31, 'Counter@92donnerkings.com', 'Counter_Password123!', 'Dana', 'Scott', '528 Cedar St\r\nAberdeen, Scotland', 'AB1 2KL', '0000-2222-3333-4444', 12, 1),
(32, 'Eli_Mitchell@gmail.com', 'Password31!', 'Eli', 'Mitchell', '639 Birch St\r\nGlasgow, Scotland', 'G1 5LN', '1111-3333-4444-5555', 123, 0),
(33, 'Manager@92donnerkings.com', 'Manager_Password123!', 'Fay', 'Roberts', '741 Fir St\r\nEdinburgh, Scotland', 'EH4 2GH', '2222-4444-5555-6666', 234, 1),
(34, 'GinaRussell@gmail.com', 'Password33!', 'Gina', 'Russell', '852 Redwood St\r\nInverness, Scotland', 'IV5 3KL', '3333-5555-6666-7777', 345, 0),
(35, 'Harry_Fisher@gmail.com', 'Password34!', 'Harry', 'Fisher', '963 Spruce St\r\nDundee, Scotland', 'DD2 9BL', '4444-6666-7777-8888', 456, 0),
(36, 'test@test.com', 'test', 'test_first_name', 'test_last_name', 'test_address', 'test_post_code', 'this-card-isnt-real', 0, 1),
(38, 'customer@gmail.com', 'Customer_Password123!', 'Adam', 'Wheatman', '16 Longmere Avenue', 'M22 9ST', '1598-1456-1234', 122, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_ID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_ID`),
  ADD KEY `catagory_ID` (`catagory_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD KEY `menu_ID` (`menu_ID`),
  ADD KEY `order_number` (`order_number`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_ID`);

--
-- Indexes for table `stock_amount`
--
ALTER TABLE `stock_amount`
  ADD KEY `menu_ID` (`menu_ID`),
  ADD KEY `stock_ID` (`stock_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`catagory_ID`) REFERENCES `category` (`category_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`menu_ID`) REFERENCES `menu` (`menu_ID`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`);

--
-- Constraints for table `stock_amount`
--
ALTER TABLE `stock_amount`
  ADD CONSTRAINT `stock_amount_ibfk_1` FOREIGN KEY (`menu_ID`) REFERENCES `menu` (`menu_ID`),
  ADD CONSTRAINT `stock_amount_ibfk_2` FOREIGN KEY (`stock_ID`) REFERENCES `stock` (`stock_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- IMPORTANT  IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT
-----------------------------------------------------------------------------------------------------------------
-- MAKE SURE TO INCLUDE THESE USERS INTO THE DATABASE OTHERWISE THE DATABASE CONNECTIONS WILL NOT WORK |
-- MAKE SURE TO INCLUDE THESE USERS INTO THE DATABASE OTHERWISE THE DATABASE CONNECTIONS WILL NOT WORK |
-- MAKE SURE TO INCLUDE THESE USERS INTO THE DATABASE OTHERWISE THE DATABASE CONNECTIONS WILL NOT WORK |
-- MAKE SURE TO INCLUDE THESE USERS INTO THE DATABASE OTHERWISE THE DATABASE CONNECTIONS WILL NOT WORK |
-- MAKE SURE TO INCLUDE THESE USERS INTO THE DATABASE OTHERWISE THE DATABASE CONNECTIONS WILL NOT WORK v

-- DATABASE CONNECTIONS ARE MADE THROUGH INDIVIDUAL ACCOUNTS WITH PERMISSIONS VARYING TO INCREASE SECURITY

-- # Privileges for `insert`@`%`

GRANT INSERT ON *.* TO `insert`@`%` IDENTIFIED BY PASSWORD '*B615518A6E69339C60385B323AC8F375C1FEF2F4';


-- # Privileges for `select`@`%`

GRANT SELECT ON *.* TO `select`@`%` IDENTIFIED BY PASSWORD '*AE966157232E64920F76434614FC341B94BA0CBA';


-- # Privileges for `selectupdate`@`%`

GRANT SELECT, UPDATE ON *.* TO `selectupdate`@`%` IDENTIFIED BY PASSWORD '*FC2F3EF17C37ECD102D93A40E80C83186D5EAE00';


-- # Privileges for `update`@`%`

GRANT UPDATE ON *.* TO `update`@`%` IDENTIFIED BY PASSWORD '*1A39587FE06390D4517146CCAE45F13A54707086';