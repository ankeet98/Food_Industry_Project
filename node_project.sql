-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2022 at 04:43 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `products_ids` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cost`, `name`, `email`, `status`, `city`, `address`, `phone`, `date`, `products_ids`) VALUES
(1670507726827, '43.98', 'Michael Scott', 'michaelscott@gmail.com', 'paid', 'Scranton, Pennsylvania', '215 Vine St, Scranton, PA 18501, USA', '01924358', '2022-12-08 19:25:26', ',1'),
(1670508124544, '34.97', 'Michael Scott', 'michaelscott@gmail.com', 'paid', 'Scranton, Pennsylvania', '215 Vine St, Scranton, PA 18501, USA', '01983432', '2022-12-08 19:32:04', ',2,8'),
(1670508575077, '11.99', 'Jan Levinson', 'janlevinson@gmail.com', 'paid', 'New York', '546 NY, USA', '01983434', '2022-12-08 19:39:35', ',6'),
(1670510111991, '16.99', 'Dwight Schrute', 'dwight@gmail.com', 'paid', 'Scranton', '1725 Slough Avenue, Suite 200', '01982434', '2022-12-08 20:05:11', ',3'),
(1670512407372, '39.97', 'Kevin Malone', 'Kevinmalone@gmail.com', 'paid', 'Scranton', '215 Vine St, Scranton, PA 18501, USA', '01983435', '2022-12-08 20:43:27', ',5,8,1');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `order_date`) VALUES
(3, 1670507726827, 1, 'Chicken Mozzarella Pizza', '24.99', 'f1.png', 2, '2022-12-08'),
(4, 1670508124544, 2, 'Chicken Cheese Hamburger', '14.99', 'f2.png', 2, '2022-12-08'),
(5, 1670508124544, 8, 'French fries', '4.99', 'f5.png', 1, '2022-12-08'),
(6, 1670508575077, 6, 'Delicious Chicken Pasta', '11.99', 'f9.png', 1, '2022-12-08'),
(8, 1670510111991, 3, 'Delicious cheese pizza with Blueberries', '18.99', 'f3.png', 1, '2022-12-08'),
(9, 1670512407372, 5, 'Hot Chicken Burger', '14.99', 'f7.png', 1, '2022-12-08'),
(10, 1670512407372, 8, 'French fries', '4.99', 'f5.png', 1, '2022-12-08'),
(11, 1670512407372, 1, 'Chicken Mozzarella Pizza', '24.99', 'f1.png', 1, '2022-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `transaction_id` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `transaction_id`, `date`) VALUES
(1, 1670507726827, '4Y912297G2011764W', '2022-12-08 19:26:34'),
(2, 1670508124544, '43K185885Y8950702', '2022-12-08 19:34:15'),
(3, 1670508575077, '4S166172M72627503', '2022-12-08 19:40:24'),
(4, 1670510111991, '1LH26016NY691805N', '2022-12-08 20:10:57'),
(5, 1670512407372, '4M489720K4051254W', '2022-12-08 20:45:13');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float(8,2) NOT NULL,
  `sale_price` float(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `image` text NOT NULL,
  `catagory` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `sale_price`, `quantity`, `image`, `catagory`, `type`) VALUES
(1, 'Chicken Mozzarella Pizza', 'Chicken pizza with Mozzarella cheese and pawn toppings', 24.99, 21.99, 0, 'f1.png', 'Pizza', 'Non-veg'),
(2, 'Chicken Cheese Hamburger', 'Chicken burger with American cheese and Hot Sauce', 14.99, NULL, 0, 'f2.png', 'Burger', 'Non-veg'),
(3, 'Delicious cheese pizza with Blueberries', 'Shredded Cheese with fresh Blueberries', 18.99, 16.99, 0, 'f3.png', 'Pizza', 'Veg'),
(4, 'Delicious Macaroni', 'Macaroni with Mushrooms and Cheese', 10.99, 9.99, 0, 'f4.png', 'Pasta', 'Veg'),
(5, 'Hot Chicken Burger', 'Chicken burger filled with bacon', 14.99, 12.99, 0, 'f7.png', 'Burger', 'Non-veg'),
(6, 'Delicious Chicken Pasta', 'Chicken pasta with white sauce ', 11.99, NULL, 0, 'f9.png', 'Pasta', 'Non-veg'),
(7, 'Chicken burger', 'Single patty regular burger', 10.99, NULL, 0, 'f8.png', 'Burger', 'Non-veg'),
(8, 'French fries', 'All time favorite French fries', 4.99, NULL, 0, 'f5.png', 'Fries', 'Veg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1670512407373;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
