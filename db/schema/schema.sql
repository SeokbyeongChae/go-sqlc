-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.2.0 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table bank.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `balance` bigint NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `accounts_index_0` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table bank.entries
CREATE TABLE IF NOT EXISTS `entries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint DEFAULT NULL,
  `amount` bigint NOT NULL COMMENT 'can be negative or positive',
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `entries_index_1` (`account_id`),
  CONSTRAINT `entries_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table bank.transfers
CREATE TABLE IF NOT EXISTS `transfers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_account_id` bigint NOT NULL,
  `to_account_id` bigint NOT NULL,
  `amount` bigint NOT NULL COMMENT 'must be positive',
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `transfers_index_2` (`from_account_id`),
  KEY `transfers_index_3` (`to_account_id`),
  KEY `transfers_index_4` (`from_account_id`,`to_account_id`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
