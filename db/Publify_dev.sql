-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 12, 2011 at 09:39 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Publify_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE IF NOT EXISTS `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `ad_type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'inactive',
  `price` float DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ads_on_title` (`title`),
  KEY `index_ads_on_price` (`price`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `title`, `body`, `ad_type`, `ip`, `hits`, `status`, `price`, `user_id`, `location_id`, `created_at`, `updated_at`) VALUES
(3, 'Un anunt nou', 'dsf sa fsf sf sadf s sf sdf sadf sdf safdas', 'offer', NULL, NULL, 'inactive', 1100, 8, 5, '2011-03-27 10:12:09', '2011-03-27 10:12:09'),
(4, 'un alt anunt', 'fdfgs dfg dfg dsfg dfgs dg fsdsdf gsdfgs dgf sdgf', 'offer', NULL, NULL, 'inactive', 250, 8, 5, '2011-03-27 13:28:53', '2011-03-27 13:28:53'),
(5, 'un anunt si mai nou', 'dfsdf s sdf dfg d g sdsd g', 'offer', NULL, NULL, 'inactive', 150, 8, 4, '2011-03-30 18:59:03', '2011-03-30 18:59:03'),
(6, 'un anunt si mai nou', 'dfsdf s sdf dfg d g sdsd g', 'offer', NULL, NULL, 'inactive', 150, 8, 4, '2011-03-30 19:27:12', '2011-03-30 19:27:12'),
(7, 'un anunt si mai nou', 'dfsdf s sdf dfg d g sdsd g', 'offer', NULL, NULL, 'inactive', 150, 8, 4, '2011-03-30 19:27:58', '2011-03-30 19:27:58'),
(8, 'vand masina', 'wqer wer e ewtwe re ret yery ertyrre', 'offer', NULL, NULL, 'inactive', 149, 8, 5, '2011-03-30 19:30:12', '2011-03-30 19:30:12'),
(9, 'un anunt de la severica', 'wdfgdfg fdh fgh dfgh fgh dfgh ', 'offer', NULL, NULL, 'inactive', 100, 16, 5, '2011-03-31 05:45:24', '2011-03-31 05:45:24'),
(10, 'un anunt de la vasile', 'fgsdfg d g sdg g sd sdgf', 'offer', NULL, NULL, 'inactive', 200, 17, 5, '2011-03-31 06:04:58', '2011-03-31 06:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) NOT NULL,
  `location_type` varchar(255) NOT NULL,
  `location_parent_id` int(11) NOT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `latitude` decimal(12,9) DEFAULT '0.000000000',
  `longitude` decimal(12,9) DEFAULT '0.000000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_locations_on_location_name` (`location_name`),
  KEY `index_locations_on_postcode` (`postcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location_name`, `location_type`, `location_parent_id`, `postcode`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(1, 'romania', 'country', 0, NULL, '2011-02-05 17:16:17', '2011-02-05 17:16:17', '0.000000000', '0.000000000'),
(2, 'alba', 'county', 1, NULL, '2011-02-05 17:41:57', '2011-02-05 17:41:57', '0.000000000', '0.000000000'),
(3, 'timis', 'county', 1, NULL, '2011-02-05 17:42:24', '2011-02-05 17:42:24', '0.000000000', '0.000000000'),
(4, 'alba iulia', 'city', 2, NULL, '2011-02-05 17:43:14', '2011-02-05 17:43:14', '0.000000000', '0.000000000'),
(5, 'timisoara', 'city', 3, NULL, '2011-02-05 17:43:42', '2011-02-05 17:43:42', '0.000000000', '0.000000000'),
(6, 'Bulevard Republicii nr. 27-T; 22-T', 'street', 4, '510174', '2011-02-05 17:45:00', '2011-02-05 17:45:00', '0.000000000', '0.000000000'),
(7, 'Bulevard Republicii nr. 1-7', 'street', 4, '510177', '2011-02-05 17:46:09', '2011-02-05 17:46:09', '0.000000000', '0.000000000'),
(8, 'Strada Abrud nr. 23-T; 18-T', 'street', 5, '300100', '2011-02-05 17:47:57', '2011-02-05 17:47:57', '0.000000000', '0.000000000'),
(9, 'Splai Nistrului nr. 15-T; 16-T', 'street', 5, '300100', '2011-02-05 17:48:41', '2011-02-05 17:48:41', '0.000000000', '0.000000000'),
(10, 'Strada Zlatna nr. 1-3', 'street', 5, '300100', '2011-02-05 17:49:01', '2011-02-05 17:49:01', '0.000000000', '0.000000000'),
(11, 'Piata Romanilor', 'street', 5, '300100', '2011-02-05 17:49:14', '2011-02-05 17:49:14', '0.000000000', '0.000000000');

-- --------------------------------------------------------

--
-- Table structure for table `pair_tags`
--

CREATE TABLE IF NOT EXISTS `pair_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supertag_id` int(11) NOT NULL,
  `subtag_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `pair_tags`
--

INSERT INTO `pair_tags` (`id`, `supertag_id`, `subtag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 2, 4, NULL, NULL),
(4, 2, 5, NULL, NULL),
(5, 2, 6, NULL, NULL),
(6, 2, 7, NULL, NULL),
(7, 3, 6, NULL, NULL),
(8, 3, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20110115190208'),
('20110117202234'),
('20110124052455'),
('20110206151022'),
('20110206180011'),
('20110208194133'),
('20110208194509'),
('20110208195705'),
('20110405050346');

-- --------------------------------------------------------

--
-- Table structure for table `taggings`
--

CREATE TABLE IF NOT EXISTS `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `taggings`
--

INSERT INTO `taggings` (`id`, `tag_id`, `ad_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2011-03-27 10:12:09', '2011-03-27 10:12:09'),
(2, 4, 3, '2011-03-27 10:12:09', '2011-03-27 10:12:09'),
(3, 5, 4, '2011-03-27 13:28:54', '2011-03-27 13:28:54'),
(4, 4, 5, '2011-03-30 18:59:03', '2011-03-30 18:59:03'),
(5, 4, 6, '2011-03-30 19:27:12', '2011-03-30 19:27:12'),
(6, 4, 7, '2011-03-30 19:27:58', '2011-03-30 19:27:58'),
(7, 4, 8, '2011-03-30 19:30:12', '2011-03-30 19:30:12'),
(8, 4, 9, '2011-03-31 05:45:24', '2011-03-31 05:45:24'),
(9, 4, 10, '2011-03-31 06:04:58', '2011-03-31 06:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL,
  `no_of_supertags` int(11) DEFAULT '0',
  `no_of_subtags` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `no_of_supertags`, `no_of_subtags`, `created_at`, `updated_at`) VALUES
(1, 'Obiect', 0, 2, '2011-03-20 14:49:43', NULL),
(2, 'Masina', 1, 2, '2011-03-20 14:50:20', NULL),
(3, 'Motocicleta', 1, 2, NULL, NULL),
(4, 'Opel', 1, 0, NULL, NULL),
(5, 'Dacia', 1, 0, NULL, NULL),
(6, 'Honda', 2, 0, NULL, NULL),
(7, 'Suzuki', 2, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `location_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  KEY `index_users_on_name` (`name`),
  KEY `index_users_on_telephone` (`telephone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `telephone`, `encrypted_password`, `salt`, `admin`, `location_id`, `created_at`, `updated_at`) VALUES
(8, 'Cristian Ionitoiu', 'cristian.ionitoiu@ionicol.ro', '0746768430', '70e2e329afd00689d827be9bcd5c6808b2f418b2255e2eae98e48bc3dc6fc9d0', 'ee048042bf0ded8a71b16bbf829f30467e75c7b377d59d9151518bfb0ec24df1', 1, 11, '2011-02-05 14:23:48', '2011-02-05 14:24:23'),
(14, 'gigi duru', 'gigi.duru@aol.com', '0256034567', '60637447475e919d6501c9431fa12f14606827a9af3681299a01fddda244bb1c', '0cd90b922039e47dc9ed28eace9484d11e063c63941fb64b2619ea29cf7533d6', 0, 11, '2011-02-05 20:37:51', '2011-02-05 20:37:51'),
(15, 'John Doe', 'john.doe@aol.com', '0756345765', '983b02bbd7a290abbcb21511cab86c213dc7b08d4b89f14d4b608bb7cb0afd4a', 'cd8e53dad68ee56b930af07e31ea3f0b03bc95f00fe8562a60378336982c4a92', 0, 5, '2011-02-06 14:50:07', '2011-02-06 14:50:07'),
(16, 'Severica', 'severica@aol.com', '0256200503', 'b3b13bc842a5fc112565475a9ecd5bbe400a1985a85b36d3f880ff06ad2d4053', '4a047934aed4f03c0d64c9043a86a500ba6c3ba02a34d94e60a7ab497ec34fa2', 0, 4, '2011-03-31 05:45:24', '2011-03-31 05:45:24'),
(17, 'Vasilica', 'vasile@aol.com', '0356784567', 'b3df317a3e2f6b9389620f624e2917975aadf64ee624f9d603b779f7a5f1b269', '70d395a86905dc940c660989f7f6e51ac9d181e08882019b7e5c75833d5040af', 0, 4, '2011-03-31 06:04:58', '2011-03-31 06:04:58');
