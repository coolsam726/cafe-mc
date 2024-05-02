/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_types` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'ACCT',
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_types_code_id_index` (`code_id`),
  KEY `account_types_owner_id_foreign` (`owner_id`),
  KEY `account_types_modified_by_foreign` (`modified_by`),
  KEY `account_types_submitted_by_foreign` (`submitted_by`),
  KEY `account_types_cancelled_by_foreign` (`cancelled_by`),
  KEY `account_types_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `account_types_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `account_types_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `account_types_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `account_types_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `account_types_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `accounting_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_categories` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'ACCCAT',
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounting_categories_code_id_index` (`code_id`),
  KEY `accounting_categories_owner_id_foreign` (`owner_id`),
  KEY `accounting_categories_modified_by_foreign` (`modified_by`),
  KEY `accounting_categories_submitted_by_foreign` (`submitted_by`),
  KEY `accounting_categories_cancelled_by_foreign` (`cancelled_by`),
  KEY `accounting_categories_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `accounting_categories_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_categories_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounting_categories_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_categories_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_categories_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `accounting_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_charts` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'ACH',
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cash_object_code` varchar(255) DEFAULT NULL,
  `payable_object_code` varchar(255) DEFAULT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounting_charts_code_id_index` (`code_id`),
  KEY `accounting_charts_owner_id_foreign` (`owner_id`),
  KEY `accounting_charts_modified_by_foreign` (`modified_by`),
  KEY `accounting_charts_submitted_by_foreign` (`submitted_by`),
  KEY `accounting_charts_cancelled_by_foreign` (`cancelled_by`),
  KEY `accounting_charts_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `accounting_charts_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_charts_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounting_charts_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_charts_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_charts_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `accounting_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_objects` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'OBJ',
  `code` varchar(255) NOT NULL,
  `object_code` varchar(255) NOT NULL,
  `chart_code` varchar(255) NOT NULL,
  `fiscal_year` year(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `object_type_code` varchar(255) NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounting_objects_object_code_chart_code_fiscal_year_unique` (`object_code`,`chart_code`,`fiscal_year`),
  KEY `accounting_objects_code_id_index` (`code_id`),
  KEY `accounting_objects_owner_id_foreign` (`owner_id`),
  KEY `accounting_objects_modified_by_foreign` (`modified_by`),
  KEY `accounting_objects_submitted_by_foreign` (`submitted_by`),
  KEY `accounting_objects_cancelled_by_foreign` (`cancelled_by`),
  KEY `accounting_objects_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `accounting_objects_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_objects_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounting_objects_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_objects_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_objects_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `accounting_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_periods` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'ACP',
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fiscal_period_code` enum('BB','01','02','03','04','05','06','07','08','09','10','11','12') NOT NULL,
  `fiscal_year` year(4) NOT NULL,
  `end_date` date NOT NULL,
  `budget_rollover` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounting_periods_code_id_index` (`code_id`),
  KEY `accounting_periods_owner_id_foreign` (`owner_id`),
  KEY `accounting_periods_modified_by_foreign` (`modified_by`),
  KEY `accounting_periods_submitted_by_foreign` (`submitted_by`),
  KEY `accounting_periods_cancelled_by_foreign` (`cancelled_by`),
  KEY `accounting_periods_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `accounting_periods_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_periods_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounting_periods_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_periods_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounting_periods_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'AC',
  `code` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `chart_code` varchar(255) NOT NULL,
  `organization_code` varchar(255) DEFAULT NULL,
  `account_type_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_number_chart_code_unique` (`account_number`,`chart_code`),
  KEY `accounts_code_id_index` (`code_id`),
  KEY `accounts_owner_id_foreign` (`owner_id`),
  KEY `accounts_modified_by_foreign` (`modified_by`),
  KEY `accounts_submitted_by_foreign` (`submitted_by`),
  KEY `accounts_cancelled_by_foreign` (`cancelled_by`),
  KEY `accounts_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `accounts_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounts_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `accounts_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounts_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` uuid DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_company_id_foreign` (`company_id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`),
  CONSTRAINT `activity_log_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `article_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `received_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `article_prices_article_id_foreign` (`article_id`),
  KEY `article_prices_supplier_id_foreign` (`supplier_id`),
  KEY `article_prices_created_by_foreign` (`created_by`),
  CONSTRAINT `article_prices_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_prices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `article_prices_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `article_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_types_slug_unique` (`slug`),
  UNIQUE KEY `article_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `article_type_id` bigint(20) unsigned NOT NULL,
  `item_group_id` bigint(20) unsigned NOT NULL,
  `default_depot_id` bigint(20) unsigned DEFAULT NULL,
  `storage_unit_id` bigint(20) unsigned NOT NULL,
  `last_purchase_price` double DEFAULT NULL,
  `last_ordered_quantity` double(8,2) DEFAULT NULL,
  `last_order_time` datetime DEFAULT NULL,
  `lifespan_days` int(11) NOT NULL DEFAULT 7,
  `is_product` tinyint(1) NOT NULL DEFAULT 0,
  `last_received_quantity` double DEFAULT NULL,
  `last_receiving_price` double DEFAULT NULL,
  `last_received_at` datetime DEFAULT NULL,
  `weighted_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_consumable` tinyint(1) NOT NULL DEFAULT 0,
  `stock_reorder_level` double NOT NULL DEFAULT 5,
  `purchase_unit_id` bigint(20) unsigned DEFAULT NULL,
  `unit_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `updater_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_immutable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_slug_unique` (`slug`),
  UNIQUE KEY `articles_name_unique` (`name`),
  KEY `articles_article_type_id_foreign` (`article_type_id`),
  KEY `articles_item_group_id_foreign` (`item_group_id`),
  KEY `articles_default_depot_id_foreign` (`default_depot_id`),
  KEY `articles_derived_unit_id_foreign` (`storage_unit_id`),
  KEY `articles_purchase_unit_id_foreign` (`purchase_unit_id`),
  KEY `articles_creator_id_foreign` (`creator_id`),
  KEY `articles_updater_id_foreign` (`updater_id`),
  CONSTRAINT `articles_article_type_id_foreign` FOREIGN KEY (`article_type_id`) REFERENCES `article_types` (`id`),
  CONSTRAINT `articles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `articles_default_depot_id_foreign` FOREIGN KEY (`default_depot_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `articles_derived_unit_id_foreign` FOREIGN KEY (`storage_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `articles_item_group_id_foreign` FOREIGN KEY (`item_group_id`) REFERENCES `item_groups` (`id`),
  CONSTRAINT `articles_purchase_unit_id_foreign` FOREIGN KEY (`purchase_unit_id`) REFERENCES `derived_units` (`id`) ON DELETE SET NULL,
  CONSTRAINT `articles_updater_id_foreign` FOREIGN KEY (`updater_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint(20) unsigned NOT NULL,
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(1023) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `balance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_types` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'BALT',
  `code` varchar(255) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `encumbrance` tinyint(1) NOT NULL,
  `offset_generation` tinyint(1) NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balance_types_code_id_index` (`code_id`),
  KEY `balance_types_owner_id_foreign` (`owner_id`),
  KEY `balance_types_modified_by_foreign` (`modified_by`),
  KEY `balance_types_submitted_by_foreign` (`submitted_by`),
  KEY `balance_types_cancelled_by_foreign` (`cancelled_by`),
  KEY `balance_types_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `balance_types_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `balance_types_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `balance_types_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `balance_types_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `balance_types_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `basic_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basic_units_slug_unique` (`slug`),
  UNIQUE KEY `basic_units_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `batch_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bu_quantity` double NOT NULL,
  `bu_price` double NOT NULL,
  `expiry_date` date NOT NULL,
  `batch_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batch_items_batch_id_foreign` (`batch_id`),
  KEY `batch_items_article_id_foreign` (`article_id`),
  CONSTRAINT `batch_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `batch_items_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `batch_number` varchar(255) NOT NULL,
  `batch_date` datetime NOT NULL,
  `narration` text DEFAULT NULL,
  `initial_quantity` decimal(20,8) DEFAULT NULL,
  `current_quantity` decimal(20,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `stockable_type` varchar(255) DEFAULT NULL,
  `stockable_id` bigint(20) unsigned DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `updater_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_immutable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `batches_batch_number_unique` (`batch_number`),
  KEY `batches_company_id_foreign` (`company_id`),
  KEY `batches_location_id_foreign` (`location_id`),
  KEY `batches_stockable_type_stockable_id_index` (`stockable_type`,`stockable_id`),
  KEY `batches_creator_id_foreign` (`creator_id`),
  KEY `batches_updater_id_foreign` (`updater_id`),
  CONSTRAINT `batches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL,
  CONSTRAINT `batches_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `batches_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `batches_updater_id_foreign` FOREIGN KEY (`updater_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `blog_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_authors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `bio` longtext DEFAULT NULL,
  `github_handle` varchar(255) DEFAULT NULL,
  `twitter_handle` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_authors_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 0,
  `seo_title` varchar(60) DEFAULT NULL,
  `seo_description` varchar(160) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_author_id` bigint(20) unsigned DEFAULT NULL,
  `blog_category_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `published_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_posts_slug_unique` (`slug`),
  KEY `blog_posts_blog_author_id_foreign` (`blog_author_id`),
  KEY `blog_posts_blog_category_id_foreign` (`blog_category_id`),
  CONSTRAINT `blog_posts_blog_author_id_foreign` FOREIGN KEY (`blog_author_id`) REFERENCES `blog_authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_posts_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bulk_dispatch_bulk_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_dispatch_bulk_request` (
  `bulk_dispatch_id` bigint(20) unsigned NOT NULL,
  `bulk_request_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`bulk_dispatch_id`,`bulk_request_id`),
  KEY `bd_id_idx` (`bulk_dispatch_id`),
  KEY `br_id_idx` (`bulk_request_id`),
  CONSTRAINT `bulk_dispatch_bulk_request_bulk_dispatch_id_foreign` FOREIGN KEY (`bulk_dispatch_id`) REFERENCES `bulk_dispatches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bulk_dispatch_bulk_request_bulk_request_id_foreign` FOREIGN KEY (`bulk_request_id`) REFERENCES `bulk_requests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bulk_dispatch_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_dispatch_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bulk_dispatch_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `source_id` bigint(20) unsigned NOT NULL,
  `required_quantity` double NOT NULL,
  `dispatched_quantity` double NOT NULL DEFAULT 0,
  `received_quantity` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_dispatch_items_bulk_dispatch_id_foreign` (`bulk_dispatch_id`),
  KEY `bulk_dispatch_items_article_id_foreign` (`article_id`),
  KEY `bulk_dispatch_items_derived_unit_id_foreign` (`derived_unit_id`),
  KEY `bulk_dispatch_items_source_id_foreign` (`source_id`),
  CONSTRAINT `bulk_dispatch_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `bulk_dispatch_items_bulk_dispatch_id_foreign` FOREIGN KEY (`bulk_dispatch_id`) REFERENCES `bulk_dispatches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bulk_dispatch_items_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `bulk_dispatch_items_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `depots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bulk_dispatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_dispatches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dispatch_number` varchar(255) NOT NULL,
  `destination_id` bigint(20) unsigned NOT NULL,
  `temporal_holding_id` bigint(20) unsigned NOT NULL,
  `dispatcher_id` bigint(20) unsigned DEFAULT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `dispatched_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `is_fulfilled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_dispatches_dispatch_number_unique` (`dispatch_number`),
  KEY `bulk_dispatches_destination_id_foreign` (`destination_id`),
  KEY `bulk_dispatches_temporal_holding_id_foreign` (`temporal_holding_id`),
  KEY `bulk_dispatches_dispatcher_id_foreign` (`dispatcher_id`),
  KEY `bulk_dispatches_recipient_id_foreign` (`recipient_id`),
  KEY `bulk_dispatches_status_id_foreign` (`status_id`),
  KEY `bulk_dispatches_company_id_foreign` (`company_id`),
  CONSTRAINT `bulk_dispatches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `bulk_dispatches_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `bulk_dispatches_dispatcher_id_foreign` FOREIGN KEY (`dispatcher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bulk_dispatches_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bulk_dispatches_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `bulk_dispatches_temporal_holding_id_foreign` FOREIGN KEY (`temporal_holding_id`) REFERENCES `depots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bulk_request_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_request_articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bulk_request_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL,
  `dispatched_quantity` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `received_quantity` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_request_articles_bulk_request_id_foreign` (`bulk_request_id`),
  KEY `bulk_request_articles_article_id_foreign` (`article_id`),
  KEY `bulk_request_articles_derived_unit_id_foreign` (`derived_unit_id`),
  CONSTRAINT `bulk_request_articles_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `bulk_request_articles_bulk_request_id_foreign` FOREIGN KEY (`bulk_request_id`) REFERENCES `bulk_requests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bulk_request_articles_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bulk_request_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_request_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bulk_request_id` bigint(20) unsigned NOT NULL,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `portions` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_request_items_bulk_request_id_foreign` (`bulk_request_id`),
  KEY `bulk_request_items_recipe_id_foreign` (`recipe_id`),
  CONSTRAINT `bulk_request_items_bulk_request_id_foreign` FOREIGN KEY (`bulk_request_id`) REFERENCES `bulk_requests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bulk_request_items_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bulk_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_number` varchar(255) NOT NULL,
  `destination_id` bigint(20) unsigned NOT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `requester_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `requested_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expected_dispatch_date` datetime DEFAULT NULL,
  `dispatched_by` bigint(20) unsigned DEFAULT NULL,
  `received_by` bigint(20) unsigned DEFAULT NULL,
  `dispatched_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_requests_request_number_unique` (`request_number`),
  KEY `bulk_requests_destination_id_foreign` (`destination_id`),
  KEY `bulk_requests_source_id_foreign` (`source_id`),
  KEY `bulk_requests_requester_id_foreign` (`requester_id`),
  KEY `bulk_requests_status_id_foreign` (`status_id`),
  KEY `bulk_requests_dispatched_by_foreign` (`dispatched_by`),
  KEY `bulk_requests_received_by_foreign` (`received_by`),
  KEY `bulk_requests_company_id_foreign` (`company_id`),
  CONSTRAINT `bulk_requests_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `bulk_requests_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `bulk_requests_dispatched_by_foreign` FOREIGN KEY (`dispatched_by`) REFERENCES `users` (`id`),
  CONSTRAINT `bulk_requests_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`),
  CONSTRAINT `bulk_requests_requester_id_foreign` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bulk_requests_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `bulk_requests_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `depot_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depot_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `depot_types_slug_unique` (`slug`),
  UNIQUE KEY `depot_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `depots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `depot_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `depots_slug_unique` (`slug`),
  UNIQUE KEY `depots_name_unique` (`name`),
  KEY `depots_depot_type_id_foreign` (`depot_type_id`),
  KEY `depots_company_id_foreign` (`company_id`),
  CONSTRAINT `depots_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `depots_depot_type_id_foreign` FOREIGN KEY (`depot_type_id`) REFERENCES `depot_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `derived_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `derived_units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `basic_unit_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `derived_units_slug_unique` (`slug`),
  UNIQUE KEY `derived_units_name_unique` (`name`),
  KEY `derived_units_basic_unit_id_foreign` (`basic_unit_id`),
  CONSTRAINT `derived_units_basic_unit_id_foreign` FOREIGN KEY (`basic_unit_id`) REFERENCES `basic_units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `direct_transfer_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direct_transfer_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `direct_transfer_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `requested_quantity` double NOT NULL,
  `dispatched_quantity` double DEFAULT NULL,
  `received_quantity` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `direct_transfer_items_direct_transfer_id_foreign` (`direct_transfer_id`),
  KEY `direct_transfer_items_article_id_foreign` (`article_id`),
  KEY `direct_transfer_items_derived_unit_id_foreign` (`derived_unit_id`),
  KEY `direct_transfer_items_source_id_foreign` (`source_id`),
  CONSTRAINT `direct_transfer_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `direct_transfer_items_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `direct_transfer_items_direct_transfer_id_foreign` FOREIGN KEY (`direct_transfer_id`) REFERENCES `direct_transfers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `direct_transfer_items_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `depots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `direct_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direct_transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_number` varchar(255) NOT NULL,
  `destination_id` bigint(20) unsigned NOT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `requester_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `dispatcher_id` bigint(20) unsigned DEFAULT NULL,
  `requested_at` datetime DEFAULT NULL,
  `dispatched_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expected_dispatch_date` datetime DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `direct_transfers_transfer_number_unique` (`transfer_number`),
  KEY `direct_transfers_destination_id_foreign` (`destination_id`),
  KEY `direct_transfers_source_id_foreign` (`source_id`),
  KEY `direct_transfers_requester_id_foreign` (`requester_id`),
  KEY `direct_transfers_status_id_foreign` (`status_id`),
  KEY `direct_transfers_recipient_id_foreign` (`recipient_id`),
  KEY `direct_transfers_dispatcher_id_foreign` (`dispatcher_id`),
  KEY `direct_transfers_company_id_foreign` (`company_id`),
  CONSTRAINT `direct_transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `direct_transfers_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `outlets` (`id`),
  CONSTRAINT `direct_transfers_dispatcher_id_foreign` FOREIGN KEY (`dispatcher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `direct_transfers_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `direct_transfers_requester_id_foreign` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`),
  CONSTRAINT `direct_transfers_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `direct_transfers_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `disposal_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposal_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `disposal_type_id` bigint(20) unsigned NOT NULL,
  `disposal_id` bigint(20) unsigned NOT NULL,
  `source_id` bigint(20) unsigned NOT NULL,
  `charity_name` varchar(255) DEFAULT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `disposal_items_disposal_type_id_foreign` (`disposal_type_id`),
  KEY `disposal_items_disposal_id_foreign` (`disposal_id`),
  KEY `disposal_items_source_id_foreign` (`source_id`),
  KEY `disposal_items_article_id_foreign` (`article_id`),
  KEY `disposal_items_derived_unit_id_foreign` (`derived_unit_id`),
  CONSTRAINT `disposal_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `disposal_items_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `disposal_items_disposal_id_foreign` FOREIGN KEY (`disposal_id`) REFERENCES `disposals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `disposal_items_disposal_type_id_foreign` FOREIGN KEY (`disposal_type_id`) REFERENCES `disposal_types` (`id`),
  CONSTRAINT `disposal_items_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `depots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `disposal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposal_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `disposal_types_slug_unique` (`slug`),
  UNIQUE KEY `disposal_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `disposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `disposal_number` varchar(255) NOT NULL,
  `requester_id` bigint(20) unsigned NOT NULL,
  `comments` text DEFAULT NULL,
  `requested_at` datetime DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `disposals_disposal_number_unique` (`disposal_number`),
  KEY `disposals_requester_id_foreign` (`requester_id`),
  KEY `disposals_status_id_foreign` (`status_id`),
  KEY `disposals_company_id_foreign` (`company_id`),
  CONSTRAINT `disposals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `disposals_requester_id_foreign` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`),
  CONSTRAINT `disposals_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `docs_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `docs_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `docs_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `docs_category_id` bigint(20) unsigned DEFAULT NULL,
  `author_id` bigint(20) unsigned NOT NULL,
  `tags` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `docs_pages_slug_unique` (`slug`),
  KEY `docs_pages_docs_category_id_foreign` (`docs_category_id`),
  KEY `docs_pages_author_id_foreign` (`author_id`),
  CONSTRAINT `docs_pages_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `docs_pages_docs_category_id_foreign` FOREIGN KEY (`docs_category_id`) REFERENCES `docs_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `finished_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finished_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `is_direct_item` tinyint(1) NOT NULL DEFAULT 0,
  `parent_article_id` bigint(20) unsigned DEFAULT NULL,
  `suggested_sale_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `updater_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_immutable` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finished_products_company_id_foreign` (`company_id`),
  KEY `finished_products_parent_article_id_foreign` (`parent_article_id`),
  KEY `finished_products_creator_id_foreign` (`creator_id`),
  KEY `finished_products_updater_id_foreign` (`updater_id`),
  KEY `finished_products_code_index` (`code`),
  CONSTRAINT `finished_products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finished_products_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `finished_products_parent_article_id_foreign` FOREIGN KEY (`parent_article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `finished_products_updater_id_foreign` FOREIGN KEY (`updater_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `fiscal_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiscal_years` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'FY',
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_years_code_id_index` (`code_id`),
  KEY `fiscal_years_owner_id_foreign` (`owner_id`),
  KEY `fiscal_years_modified_by_foreign` (`modified_by`),
  KEY `fiscal_years_submitted_by_foreign` (`submitted_by`),
  KEY `fiscal_years_cancelled_by_foreign` (`cancelled_by`),
  KEY `fiscal_years_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `fiscal_years_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `fiscal_years_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fiscal_years_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fiscal_years_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `fiscal_years_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `food_preparation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_preparation_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `expected_portions` double(8,2) NOT NULL,
  `produced_portions` double(8,2) NOT NULL,
  `prepared_at` datetime DEFAULT NULL,
  `dispatch_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `food_preparation_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_preparation_items_recipe_id_foreign` (`recipe_id`),
  KEY `food_preparation_items_food_preparation_id_foreign` (`food_preparation_id`),
  CONSTRAINT `food_preparation_items_food_preparation_id_foreign` FOREIGN KEY (`food_preparation_id`) REFERENCES `food_preparations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `food_preparation_items_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `food_preparations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_preparations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `preparation_number` varchar(255) NOT NULL,
  `comments` text DEFAULT NULL,
  `preparer_id` bigint(20) unsigned NOT NULL,
  `recipable_type` varchar(255) DEFAULT NULL,
  `recipable_id` bigint(20) unsigned DEFAULT NULL,
  `kitchen_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 2,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_preparations_preparation_number_unique` (`preparation_number`),
  KEY `food_preparations_preparer_id_foreign` (`preparer_id`),
  KEY `food_preparations_recipable_type_recipable_id_index` (`recipable_type`,`recipable_id`),
  KEY `food_preparations_kitchen_id_foreign` (`kitchen_id`),
  KEY `food_preparations_status_id_foreign` (`status_id`),
  KEY `food_preparations_company_id_foreign` (`company_id`),
  CONSTRAINT `food_preparations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `food_preparations_kitchen_id_foreign` FOREIGN KEY (`kitchen_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `food_preparations_preparer_id_foreign` FOREIGN KEY (`preparer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `food_preparations_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `food_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_return_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `food_return_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned DEFAULT NULL,
  `destination_id` bigint(20) unsigned NOT NULL,
  `returned_quantity` double NOT NULL,
  `received_quantity` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `food_return_items_food_return_id_foreign` (`food_return_id`),
  KEY `food_return_items_article_id_foreign` (`article_id`),
  KEY `food_return_items_destination_id_foreign` (`destination_id`),
  CONSTRAINT `food_return_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `food_return_items_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `food_return_items_food_return_id_foreign` FOREIGN KEY (`food_return_id`) REFERENCES `food_returns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `food_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_number` varchar(255) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `outlet_id` bigint(20) unsigned NOT NULL,
  `returned_at` datetime DEFAULT NULL,
  `returner_id` bigint(20) unsigned NOT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_returns_transfer_number_unique` (`transfer_number`),
  KEY `food_returns_status_id_foreign` (`status_id`),
  KEY `food_returns_outlet_id_foreign` (`outlet_id`),
  KEY `food_returns_returner_id_foreign` (`returner_id`),
  KEY `food_returns_recipient_id_foreign` (`recipient_id`),
  KEY `food_returns_company_id_foreign` (`company_id`),
  CONSTRAINT `food_returns_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `food_returns_outlet_id_foreign` FOREIGN KEY (`outlet_id`) REFERENCES `outlets` (`id`),
  CONSTRAINT `food_returns_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `food_returns_returner_id_foreign` FOREIGN KEY (`returner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `food_returns_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `grn_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grn_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_item_id` bigint(20) unsigned NOT NULL,
  `grn_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `required_quantity` double NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grn_items_purchase_order_item_id_foreign` (`purchase_order_item_id`),
  KEY `grn_items_grn_id_foreign` (`grn_id`),
  KEY `grn_items_derived_unit_id_foreign` (`derived_unit_id`),
  KEY `grn_items_article_id_foreign` (`article_id`),
  CONSTRAINT `grn_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `grn_items_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `grn_items_grn_id_foreign` FOREIGN KEY (`grn_id`) REFERENCES `grns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `grn_items_purchase_order_item_id_foreign` FOREIGN KEY (`purchase_order_item_id`) REFERENCES `purchase_order_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `grns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `grn_number` varchar(255) NOT NULL,
  `lpo_id` bigint(20) unsigned NOT NULL,
  `generator_id` bigint(20) unsigned NOT NULL,
  `generated_at` datetime NOT NULL,
  `delivery_note_number` varchar(255) DEFAULT NULL,
  `supplier_invoice_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `invoiced_at` datetime DEFAULT NULL,
  `invoicer_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `posted_to_kfs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grns_grn_number_unique` (`grn_number`),
  KEY `grns_lpo_id_foreign` (`lpo_id`),
  KEY `grns_generator_id_foreign` (`generator_id`),
  KEY `grns_recipient_id_foreign` (`recipient_id`),
  KEY `grns_invoicer_id_foreign` (`invoicer_id`),
  KEY `grns_batch_id_foreign` (`batch_id`),
  KEY `grns_status_id_foreign` (`status_id`),
  KEY `grns_company_id_foreign` (`company_id`),
  CONSTRAINT `grns_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`),
  CONSTRAINT `grns_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `grns_generator_id_foreign` FOREIGN KEY (`generator_id`) REFERENCES `users` (`id`),
  CONSTRAINT `grns_invoicer_id_foreign` FOREIGN KEY (`invoicer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `grns_lpo_id_foreign` FOREIGN KEY (`lpo_id`) REFERENCES `lpos` (`id`),
  CONSTRAINT `grns_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `grns_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `major_group_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kfs_ledger_object_code` varchar(255) NOT NULL DEFAULT '8400',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_groups_slug_unique` (`slug`),
  UNIQUE KEY `item_groups_name_unique` (`name`),
  KEY `item_groups_major_group_id_foreign` (`major_group_id`),
  CONSTRAINT `item_groups_major_group_id_foreign` FOREIGN KEY (`major_group_id`) REFERENCES `major_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `journal_accounting_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_accounting_lines` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'JAL',
  `code` varchar(255) NOT NULL,
  `narration` varchar(255) DEFAULT NULL,
  `parent_id` char(36) NOT NULL,
  `chart_code` varchar(255) NOT NULL,
  `object_code` varchar(255) NOT NULL,
  `account_id` char(36) NOT NULL,
  `account_type_id` char(36) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `sub_account_number` varchar(255) DEFAULT NULL,
  `party_type` varchar(255) DEFAULT NULL,
  `party_id` bigint(20) unsigned DEFAULT NULL,
  `project_code` varchar(255) DEFAULT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `reference_id` bigint(20) unsigned DEFAULT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `dr_cr` enum('D','C') NOT NULL,
  `debit` decimal(21,2) DEFAULT NULL,
  `credit` decimal(21,2) DEFAULT NULL,
  `account_currency` varchar(3) NOT NULL DEFAULT 'KES',
  `exchange_rate` decimal(21,8) NOT NULL DEFAULT 1.00000000,
  `debit_in_account_currency` decimal(21,2) NOT NULL DEFAULT 0.00,
  `credit_in_account_currency` decimal(21,2) NOT NULL DEFAULT 0.00,
  `user_remarks` text DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_accounting_lines_code_id_index` (`code_id`),
  KEY `journal_accounting_lines_parent_id_foreign` (`parent_id`),
  KEY `journal_accounting_lines_account_id_foreign` (`account_id`),
  KEY `journal_accounting_lines_account_type_id_foreign` (`account_type_id`),
  KEY `journal_accounting_lines_party_type_party_id_index` (`party_type`,`party_id`),
  KEY `journal_accounting_lines_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `journal_accounting_lines_company_id_foreign` (`company_id`),
  KEY `journal_accounting_lines_owner_id_foreign` (`owner_id`),
  KEY `journal_accounting_lines_modified_by_foreign` (`modified_by`),
  KEY `journal_accounting_lines_submitted_by_foreign` (`submitted_by`),
  KEY `journal_accounting_lines_cancelled_by_foreign` (`cancelled_by`),
  KEY `journal_accounting_lines_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `journal_accounting_lines_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `journal_accounting_lines_account_type_id_foreign` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `journal_accounting_lines_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `journal_accounting_lines_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `journal_accounting_lines_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `journal_accounting_lines_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `journal_accounting_lines_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `journal_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `journal_accounting_lines_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `journal_accounting_lines_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `journal_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_entries` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'JV',
  `code` varchar(255) NOT NULL,
  `journal_type` enum('JV','PV') NOT NULL,
  `transaction_date` timestamp NULL DEFAULT NULL,
  `chart_code` varchar(255) NOT NULL,
  `fiscal_year` year(4) NOT NULL,
  `accounting_period_code` varchar(255) NOT NULL,
  `balance_type_code` varchar(40) NOT NULL,
  `voucher_type` varchar(255) DEFAULT NULL,
  `voucher_id` bigint(20) unsigned DEFAULT NULL,
  `party_type` varchar(255) DEFAULT NULL,
  `party_id` bigint(20) unsigned DEFAULT NULL,
  `voucher_amount` decimal(21,2) NOT NULL DEFAULT 0.00,
  `principal_user_name` varchar(255) DEFAULT NULL,
  `voucher_code` varchar(255) DEFAULT NULL,
  `voucher_details` varchar(255) DEFAULT NULL,
  `description` varchar(40) NOT NULL,
  `should_post_to_kfs` tinyint(1) NOT NULL DEFAULT 1,
  `is_posted_to_kfs` tinyint(1) NOT NULL DEFAULT 0,
  `posted_to_kfs_at` timestamp NULL DEFAULT NULL,
  `last_kfs_response` text DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_remarks` text NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_entries_code_id_index` (`code_id`),
  KEY `journal_entries_voucher_type_voucher_id_index` (`voucher_type`,`voucher_id`),
  KEY `journal_entries_party_type_party_id_index` (`party_type`,`party_id`),
  KEY `journal_entries_company_id_foreign` (`company_id`),
  KEY `journal_entries_owner_id_foreign` (`owner_id`),
  KEY `journal_entries_modified_by_foreign` (`modified_by`),
  KEY `journal_entries_submitted_by_foreign` (`submitted_by`),
  KEY `journal_entries_cancelled_by_foreign` (`cancelled_by`),
  KEY `journal_entries_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `journal_entries_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `journal_entries_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `journal_entries_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `journal_entries_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `journal_entries_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `journal_entries_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `kfs_ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kfs_ledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL COMMENT 'Leave blank to use the company''s default account number',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kfs_ledgers_object_code_unique` (`object_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `kfs_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kfs_vendors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(255) NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `pre_format_code` varchar(5) NOT NULL,
  `pre_format_description` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kfs_vendors_vendor_no_unique` (`vendor_no`),
  UNIQUE KEY `kfs_vendors_pre_format_code_unique` (`pre_format_code`),
  UNIQUE KEY `kfs_vendors_pre_format_description_unique` (`pre_format_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lpos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lpo_number` varchar(255) NOT NULL,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lpos_lpo_number_unique` (`lpo_number`),
  KEY `lpos_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `lpos_creator_id_foreign` (`creator_id`),
  KEY `lpos_company_id_foreign` (`company_id`),
  CONSTRAINT `lpos_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `lpos_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
  CONSTRAINT `lpos_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `major_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `over_group_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `major_groups_slug_unique` (`slug`),
  UNIQUE KEY `major_groups_name_unique` (`name`),
  KEY `major_groups_over_group_id_foreign` (`over_group_id`),
  CONSTRAINT `major_groups_over_group_id_foreign` FOREIGN KEY (`over_group_id`) REFERENCES `over_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `media_chk_1` CHECK (json_valid(`manipulations`)),
  CONSTRAINT `media_chk_2` CHECK (json_valid(`custom_properties`)),
  CONSTRAINT `media_chk_3` CHECK (json_valid(`responsive_images`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_types` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'OBJT',
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dr_cr` enum('D','C') NOT NULL,
  `accounting_category_code` varchar(255) NOT NULL DEFAULT 'AS',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_types_code_id_index` (`code_id`),
  KEY `object_types_owner_id_foreign` (`owner_id`),
  KEY `object_types_modified_by_foreign` (`modified_by`),
  KEY `object_types_submitted_by_foreign` (`submitted_by`),
  KEY `object_types_cancelled_by_foreign` (`cancelled_by`),
  KEY `object_types_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `object_types_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `object_types_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `object_types_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `object_types_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `object_types_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `organization_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_types` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'ORGT',
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_types_code_id_index` (`code_id`),
  KEY `organization_types_owner_id_foreign` (`owner_id`),
  KEY `organization_types_modified_by_foreign` (`modified_by`),
  KEY `organization_types_submitted_by_foreign` (`submitted_by`),
  KEY `organization_types_cancelled_by_foreign` (`cancelled_by`),
  KEY `organization_types_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `organization_types_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `organization_types_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `organization_types_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `organization_types_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `organization_types_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` char(36) NOT NULL,
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code_prefix` varchar(255) NOT NULL DEFAULT 'ORG',
  `code` varchar(255) NOT NULL,
  `organization_code` varchar(255) NOT NULL,
  `chart_code` varchar(255) NOT NULL,
  `organization_type_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `reports_to_organization_code` varchar(255) DEFAULT NULL,
  `reports_to_chart_code` varchar(255) DEFAULT NULL,
  `organization_manager_username` varchar(255) DEFAULT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `doc_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `owner_id` bigint(20) unsigned DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `recalled_by` bigint(20) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `recalled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_organization_code_chart_code_unique` (`organization_code`,`chart_code`),
  KEY `organizations_code_id_index` (`code_id`),
  KEY `organizations_owner_id_foreign` (`owner_id`),
  KEY `organizations_modified_by_foreign` (`modified_by`),
  KEY `organizations_submitted_by_foreign` (`submitted_by`),
  KEY `organizations_cancelled_by_foreign` (`cancelled_by`),
  KEY `organizations_recalled_by_foreign` (`recalled_by`),
  CONSTRAINT `organizations_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `organizations_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `organizations_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `organizations_recalled_by_foreign` FOREIGN KEY (`recalled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `organizations_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `outlet_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outlet_product` (
  `outlet_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`outlet_id`,`product_id`),
  KEY `outlet_product_outlet_id_index` (`outlet_id`),
  KEY `outlet_product_product_id_index` (`product_id`),
  CONSTRAINT `outlet_product_outlet_id_foreign` FOREIGN KEY (`outlet_id`) REFERENCES `outlets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `outlet_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `outlet_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outlet_stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `outlet_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `prev_quantity` double NOT NULL,
  `current_quantity` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `batch_item_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outlet_stocks_outlet_id_foreign` (`outlet_id`),
  KEY `outlet_stocks_article_id_foreign` (`article_id`),
  KEY `outlet_stocks_batch_item_id_foreign` (`batch_item_id`),
  KEY `outlet_stocks_company_id_foreign` (`company_id`),
  CONSTRAINT `outlet_stocks_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `outlet_stocks_batch_item_id_foreign` FOREIGN KEY (`batch_item_id`) REFERENCES `batch_items` (`id`),
  CONSTRAINT `outlet_stocks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `outlet_stocks_outlet_id_foreign` FOREIGN KEY (`outlet_id`) REFERENCES `outlets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `outlets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outlets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pos_interface_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outlets_slug_unique` (`slug`),
  UNIQUE KEY `outlets_name_unique` (`name`),
  UNIQUE KEY `outlets_pos_interface_id_unique` (`pos_interface_id`),
  KEY `outlets_company_id_foreign` (`company_id`),
  CONSTRAINT `outlets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `over_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `over_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `over_groups_slug_unique` (`slug`),
  UNIQUE KEY `over_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `portion_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portion_sizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ratio` double NOT NULL,
  `pos_interface_id` bigint(20) unsigned DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portion_sizes_code_pos_interface_id_unique` (`code`,`pos_interface_id`),
  KEY `portion_sizes_company_id_foreign` (`company_id`),
  CONSTRAINT `portion_sizes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pos_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_integrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `base_url` varchar(255) NOT NULL,
  `pos_company_id` varchar(255) NOT NULL COMMENT 'This MC interface''s id on the POS side',
  `outlet_id` bigint(20) unsigned NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `secret` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pos_integrations_slug_unique` (`slug`),
  KEY `pos_integrations_outlet_id_foreign` (`outlet_id`),
  KEY `pos_integrations_company_id_foreign` (`company_id`),
  CONSTRAINT `pos_integrations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `pos_integrations_outlet_id_foreign` FOREIGN KEY (`outlet_id`) REFERENCES `outlets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `price_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_quotes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `unit_price` double NOT NULL DEFAULT 0,
  `percentage_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_quotes_supplier_id_article_id_derived_unit_id_unique` (`supplier_id`,`article_id`,`derived_unit_id`),
  KEY `price_quotes_article_id_foreign` (`article_id`),
  KEY `price_quotes_derived_unit_id_foreign` (`derived_unit_id`),
  CONSTRAINT `price_quotes_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `price_quotes_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `price_quotes_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_dispatch_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_dispatch_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL,
  `outlet_id` bigint(20) unsigned NOT NULL,
  `temporal_holding_id` bigint(20) unsigned DEFAULT NULL,
  `dispatched_portions` double(8,2) NOT NULL,
  `dispatched_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `received_portions` double DEFAULT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_dispatch_id` bigint(20) unsigned NOT NULL,
  `expected_portions` double(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_dispatch_items_article_id_foreign` (`article_id`),
  KEY `product_dispatch_items_outlet_id_foreign` (`outlet_id`),
  KEY `product_dispatch_items_temporal_holding_id_foreign` (`temporal_holding_id`),
  KEY `product_dispatch_items_recipient_id_foreign` (`recipient_id`),
  KEY `product_dispatch_items_product_dispatch_id_foreign` (`product_dispatch_id`),
  CONSTRAINT `product_dispatch_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `product_dispatch_items_outlet_id_foreign` FOREIGN KEY (`outlet_id`) REFERENCES `outlets` (`id`),
  CONSTRAINT `product_dispatch_items_product_dispatch_id_foreign` FOREIGN KEY (`product_dispatch_id`) REFERENCES `product_dispatches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_dispatch_items_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `product_dispatch_items_temporal_holding_id_foreign` FOREIGN KEY (`temporal_holding_id`) REFERENCES `depots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_dispatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_dispatches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dispatch_number` varchar(255) NOT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `review_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_dispatches_dispatch_number_unique` (`dispatch_number`),
  KEY `product_dispatches_source_id_foreign` (`source_id`),
  KEY `product_dispatches_creator_id_foreign` (`creator_id`),
  KEY `product_dispatches_review_id_foreign` (`review_id`),
  KEY `product_dispatches_status_id_foreign` (`status_id`),
  KEY `product_dispatches_company_id_foreign` (`company_id`),
  CONSTRAINT `product_dispatches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `product_dispatches_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
  CONSTRAINT `product_dispatches_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_dispatches_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `product_dispatches_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_tray_mutations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tray_mutations` (
  `id` char(36) NOT NULL,
  `product_tray_id` char(36) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `prev_portions` double NOT NULL,
  `new_portions` double NOT NULL,
  `description` text DEFAULT NULL,
  `mutator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_tray_mutations_product_tray_id_foreign` (`product_tray_id`),
  KEY `product_tray_mutations_product_id_foreign` (`product_id`),
  KEY `product_tray_mutations_mutator_id_foreign` (`mutator_id`),
  CONSTRAINT `product_tray_mutations_mutator_id_foreign` FOREIGN KEY (`mutator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_tray_mutations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_tray_mutations_product_tray_id_foreign` FOREIGN KEY (`product_tray_id`) REFERENCES `product_trays` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_trays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_trays` (
  `id` char(36) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_trays_user_id_unique` (`user_id`),
  CONSTRAINT `product_trays_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `portion_size_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned DEFAULT NULL,
  `pos_interface_id` bigint(20) unsigned DEFAULT NULL,
  `cost` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_pos_interface_id_unique` (`pos_interface_id`),
  KEY `products_portion_size_id_foreign` (`portion_size_id`),
  KEY `products_article_id_foreign` (`article_id`),
  KEY `products_company_id_foreign` (`company_id`),
  CONSTRAINT `products_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `products_portion_size_id_foreign` FOREIGN KEY (`portion_size_id`) REFERENCES `portion_sizes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `purchase_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_items_article_id_foreign` (`article_id`),
  KEY `purchase_order_items_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_items_derived_unit_id_foreign` (`derived_unit_id`),
  CONSTRAINT `purchase_order_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `purchase_order_items_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `purchase_order_items_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) NOT NULL,
  `generator_id` bigint(20) unsigned NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `depot_id` bigint(20) unsigned NOT NULL,
  `reviewer_id` bigint(20) unsigned DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `kfs_account_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_orders_order_number_unique` (`order_number`),
  KEY `purchase_orders_generator_id_foreign` (`generator_id`),
  KEY `purchase_orders_supplier_id_foreign` (`supplier_id`),
  KEY `purchase_orders_status_id_foreign` (`status_id`),
  KEY `purchase_orders_depot_id_foreign` (`depot_id`),
  KEY `purchase_orders_reviewer_id_foreign` (`reviewer_id`),
  KEY `purchase_orders_recipient_id_foreign` (`recipient_id`),
  KEY `purchase_orders_company_id_foreign` (`company_id`),
  CONSTRAINT `purchase_orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `purchase_orders_depot_id_foreign` FOREIGN KEY (`depot_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `purchase_orders_generator_id_foreign` FOREIGN KEY (`generator_id`) REFERENCES `users` (`id`),
  CONSTRAINT `purchase_orders_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `purchase_orders_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `purchase_orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `purchase_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `recipe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `major_group_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_groups_slug_unique` (`slug`),
  UNIQUE KEY `recipe_groups_name_unique` (`name`),
  KEY `recipe_groups_major_group_id_foreign` (`major_group_id`),
  CONSTRAINT `recipe_groups_major_group_id_foreign` FOREIGN KEY (`major_group_id`) REFERENCES `major_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `recipe_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` double NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `recipe_items_derived_unit_id_foreign` (`derived_unit_id`),
  KEY `recipe_items_article_id_foreign` (`article_id`),
  KEY `recipe_items_recipe_id_foreign` (`recipe_id`),
  CONSTRAINT `recipe_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `recipe_items_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `recipe_items_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `recipe_group_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `yield` double NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipes_slug_unique` (`slug`),
  UNIQUE KEY `recipes_name_unique` (`name`),
  KEY `recipes_recipe_group_id_foreign` (`recipe_group_id`),
  KEY `recipes_product_id_foreign` (`product_id`),
  KEY `recipes_company_id_foreign` (`company_id`),
  CONSTRAINT `recipes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `recipes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `recipes_recipe_group_id_foreign` FOREIGN KEY (`recipe_group_id`) REFERENCES `recipe_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `reviewed_at` datetime NOT NULL,
  `reviewable_type` varchar(255) NOT NULL,
  `reviewable_id` bigint(20) unsigned NOT NULL,
  `comments` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_reviewer_id_foreign` (`reviewer_id`),
  KEY `reviews_status_id_foreign` (`status_id`),
  KEY `reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  KEY `reviews_company_id_foreign` (`company_id`),
  CONSTRAINT `reviews_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `reviews_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `guard_name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `updater_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_immutable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `roles_creator_id_foreign` (`creator_id`),
  KEY `roles_updater_id_foreign` (`updater_id`),
  CONSTRAINT `roles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `roles_updater_id_foreign` FOREIGN KEY (`updater_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_date` datetime NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `outlet_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL,
  `unit_price` double NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_article_id_foreign` (`article_id`),
  KEY `sales_outlet_id_foreign` (`outlet_id`),
  KEY `sales_creator_id_foreign` (`creator_id`),
  KEY `sales_company_id_foreign` (`company_id`),
  CONSTRAINT `sales_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `sales_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `sales_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
  CONSTRAINT `sales_outlet_id_foreign` FOREIGN KEY (`outlet_id`) REFERENCES `outlets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_group_index` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `single_dispatch_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_dispatch_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `single_dispatch_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `source_id` bigint(20) unsigned NOT NULL,
  `required_quantity` double NOT NULL,
  `dispatched_quantity` double NOT NULL DEFAULT 0,
  `received_quantity` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `single_request_item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `single_dispatch_items_single_dispatch_id_foreign` (`single_dispatch_id`),
  KEY `single_dispatch_items_article_id_foreign` (`article_id`),
  KEY `single_dispatch_items_derived_unit_id_foreign` (`derived_unit_id`),
  KEY `single_dispatch_items_source_id_foreign` (`source_id`),
  KEY `single_dispatch_items_single_request_item_id_foreign` (`single_request_item_id`),
  CONSTRAINT `single_dispatch_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `single_dispatch_items_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `single_dispatch_items_single_dispatch_id_foreign` FOREIGN KEY (`single_dispatch_id`) REFERENCES `single_dispatches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `single_dispatch_items_single_request_item_id_foreign` FOREIGN KEY (`single_request_item_id`) REFERENCES `single_request_items` (`id`),
  CONSTRAINT `single_dispatch_items_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `depots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `single_dispatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_dispatches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dispatch_number` varchar(255) NOT NULL,
  `single_request_id` bigint(20) unsigned NOT NULL,
  `destination_id` bigint(20) unsigned NOT NULL,
  `temporal_holding_id` bigint(20) unsigned NOT NULL,
  `dispatcher_id` bigint(20) unsigned DEFAULT NULL,
  `recipient_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `dispatched_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `is_fulfilled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `single_dispatches_dispatch_number_unique` (`dispatch_number`),
  KEY `single_dispatches_single_request_id_foreign` (`single_request_id`),
  KEY `single_dispatches_destination_id_foreign` (`destination_id`),
  KEY `single_dispatches_temporal_holding_id_foreign` (`temporal_holding_id`),
  KEY `single_dispatches_dispatcher_id_foreign` (`dispatcher_id`),
  KEY `single_dispatches_recipient_id_foreign` (`recipient_id`),
  KEY `single_dispatches_status_id_foreign` (`status_id`),
  KEY `single_dispatches_company_id_foreign` (`company_id`),
  CONSTRAINT `single_dispatches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `single_dispatches_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `single_dispatches_dispatcher_id_foreign` FOREIGN KEY (`dispatcher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `single_dispatches_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `single_dispatches_single_request_id_foreign` FOREIGN KEY (`single_request_id`) REFERENCES `single_requests` (`id`),
  CONSTRAINT `single_dispatches_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `single_dispatches_temporal_holding_id_foreign` FOREIGN KEY (`temporal_holding_id`) REFERENCES `depots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `single_request_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_request_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `single_request_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `derived_unit_id` bigint(20) unsigned NOT NULL,
  `recipe_item_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dispatched_quantity` double DEFAULT NULL,
  `received_quantity` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `single_request_items_single_request_id_foreign` (`single_request_id`),
  KEY `single_request_items_article_id_foreign` (`article_id`),
  KEY `single_request_items_derived_unit_id_foreign` (`derived_unit_id`),
  KEY `single_request_items_recipe_item_id_foreign` (`recipe_item_id`),
  CONSTRAINT `single_request_items_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `single_request_items_derived_unit_id_foreign` FOREIGN KEY (`derived_unit_id`) REFERENCES `derived_units` (`id`),
  CONSTRAINT `single_request_items_recipe_item_id_foreign` FOREIGN KEY (`recipe_item_id`) REFERENCES `recipe_items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `single_request_items_single_request_id_foreign` FOREIGN KEY (`single_request_id`) REFERENCES `single_requests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `single_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_number` varchar(255) NOT NULL,
  `destination_id` bigint(20) unsigned NOT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `requester_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `recipe_id` bigint(20) unsigned DEFAULT NULL,
  `portions` double DEFAULT NULL,
  `requested_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expected_dispatch_date` date DEFAULT NULL,
  `dispatched_by` bigint(20) unsigned DEFAULT NULL,
  `received_by` bigint(20) unsigned DEFAULT NULL,
  `dispatched_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `single_requests_request_number_unique` (`request_number`),
  KEY `single_requests_destination_id_foreign` (`destination_id`),
  KEY `single_requests_source_id_foreign` (`source_id`),
  KEY `single_requests_requester_id_foreign` (`requester_id`),
  KEY `single_requests_status_id_foreign` (`status_id`),
  KEY `single_requests_recipe_id_foreign` (`recipe_id`),
  KEY `single_requests_dispatched_by_foreign` (`dispatched_by`),
  KEY `single_requests_received_by_foreign` (`received_by`),
  KEY `single_requests_company_id_foreign` (`company_id`),
  CONSTRAINT `single_requests_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `single_requests_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `single_requests_dispatched_by_foreign` FOREIGN KEY (`dispatched_by`) REFERENCES `users` (`id`),
  CONSTRAINT `single_requests_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`),
  CONSTRAINT `single_requests_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `single_requests_requester_id_foreign` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`),
  CONSTRAINT `single_requests_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `single_requests_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `statuses_slug_unique` (`slug`),
  UNIQUE KEY `statuses_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stock_mutations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_mutations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stockable_type` varchar(255) NOT NULL,
  `stockable_id` bigint(20) unsigned NOT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `reference_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `new_quantity` double(8,2) NOT NULL,
  `narration` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `prev_quantity` double DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `updater_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_immutable` tinyint(1) NOT NULL DEFAULT 0,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_mutations_stockable_type_stockable_id_index` (`stockable_type`,`stockable_id`),
  KEY `stock_mutations_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `stock_mutations_created_by_foreign` (`created_by`),
  KEY `stock_mutations_location_id_foreign` (`location_id`),
  KEY `stock_mutations_batch_id_foreign` (`batch_id`),
  KEY `stock_mutations_creator_id_foreign` (`creator_id`),
  KEY `stock_mutations_updater_id_foreign` (`updater_id`),
  KEY `stock_mutations_company_id_foreign` (`company_id`),
  CONSTRAINT `stock_mutations_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_mutations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_mutations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `stock_mutations_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_mutations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `depots` (`id`),
  CONSTRAINT `stock_mutations_updater_id_foreign` FOREIGN KEY (`updater_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stock_takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_takes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_takes_created_by_foreign` (`created_by`),
  CONSTRAINT `stock_takes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL,
  `batch_item_id` bigint(20) unsigned NOT NULL,
  `depot_id` bigint(20) unsigned NOT NULL,
  `stock_date` datetime NOT NULL,
  `prev_quantity` double NOT NULL,
  `new_quantity` double NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stocks_article_id_foreign` (`article_id`),
  KEY `stocks_batch_item_id_foreign` (`batch_item_id`),
  KEY `stocks_depot_id_foreign` (`depot_id`),
  CONSTRAINT `stocks_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `stocks_batch_item_id_foreign` FOREIGN KEY (`batch_item_id`) REFERENCES `batch_items` (`id`),
  CONSTRAINT `stocks_depot_id_foreign` FOREIGN KEY (`depot_id`) REFERENCES `depots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `more_details` longtext DEFAULT NULL,
  `last_order_date` timestamp NULL DEFAULT NULL,
  `last_delivery_date` timestamp NULL DEFAULT NULL,
  `supplier_number` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `percentage_vat` double(8,2) NOT NULL DEFAULT 16.00,
  `currency` varchar(100) DEFAULT 'kes',
  `address_part_1` varchar(100) DEFAULT NULL,
  `address_part_2` varchar(100) DEFAULT NULL,
  `address_part_3` varchar(100) DEFAULT NULL,
  `address_part_4` varchar(100) DEFAULT NULL,
  `address_part_5` varchar(100) DEFAULT NULL,
  `address_part_6` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kfs_preformat` varchar(255) DEFAULT NULL,
  `kfs_vendor_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suppliers_name_unique` (`name`),
  UNIQUE KEY `suppliers_kfs_preformat_unique` (`kfs_preformat`),
  KEY `suppliers_kfs_vendor_id_foreign` (`kfs_vendor_id`),
  CONSTRAINT `suppliers_kfs_vendor_id_foreign` FOREIGN KEY (`kfs_vendor_id`) REFERENCES `kfs_vendors` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `taggables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggables` (
  `tag_id` bigint(20) unsigned NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `taggable_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `taggables_tag_id_taggable_id_taggable_type_unique` (`tag_id`,`taggable_id`,`taggable_type`),
  KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `slug` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`slug`)),
  `type` varchar(255) DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_user` (
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`company_id`),
  KEY `team_user_company_id_foreign` (`company_id`),
  CONSTRAINT `team_user_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kfs_chart_code` varchar(255) NOT NULL DEFAULT 'SC' COMMENT 'Default: SC - Strathmore Cafeteria',
  `kfs_account_number` varchar(255) DEFAULT NULL,
  `kfs_document_type` varchar(255) NOT NULL DEFAULT 'PV' COMMENT 'default: PV for Payment Voucher',
  `kfs_financial_document_number` varchar(255) DEFAULT NULL,
  `kfs_system_origination_code` varchar(255) NOT NULL DEFAULT 'ST',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `trolley_mutations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trolley_mutations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trollable_type` varchar(255) NOT NULL,
  `trollable_id` bigint(20) unsigned NOT NULL,
  `stockable_type` varchar(255) NOT NULL,
  `stockable_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL COMMENT 'in the default units of the article',
  `description` text DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trolley_mutations_trollable_type_trollable_id_index` (`trollable_type`,`trollable_id`),
  KEY `trolley_mutations_stockable_type_stockable_id_index` (`stockable_type`,`stockable_id`),
  KEY `trolley_mutations_creator_id_foreign` (`creator_id`),
  CONSTRAINT `trolley_mutations_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `uac` varchar(4) DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `guid` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `updater_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_immutable` tinyint(1) NOT NULL DEFAULT 0,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_guid_unique` (`guid`),
  KEY `users_company_id_foreign` (`company_id`),
  KEY `users_creator_id_foreign` (`creator_id`),
  KEY `users_updater_id_foreign` (`updater_id`),
  KEY `users_code_index` (`code`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `users_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_updater_id_foreign` FOREIGN KEY (`updater_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4,'2019_12_14_000001_create_personal_access_tokens_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5,'2020_07_05_094241_create_sessions_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6,'2020_07_05_094246_create_jobs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7,'2020_07_24_114250_create_permission_tables',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8,'2020_08_01_094733_seed_administrator_role_and_user',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9,'2020_08_01_100652_fill_permissions_for_roles',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10,'2020_08_01_101643_fill_permissions_for_users',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11,'2020_08_12_154013_create_data_types_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12,'2020_08_12_162850_create_settings_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13,'2020_08_12_163146_fill_permissions_for_settings',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14,'2020_08_12_164410_fill_permissions_for_data_types',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15,'2020_08_15_162918_create_loan_types_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16,'2020_08_15_163027_create_time_units_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17,'2020_08_15_163041_create_interest_frequencies_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18,'2020_08_15_163108_create_compounding_periods_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (19,'2020_08_15_163137_create_clients_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (20,'2020_08_15_163143_create_loan_statuses_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (21,'2020_08_15_163247_create_products_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22,'2020_08_15_163255_create_loans_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23,'2020_08_15_170016_fill_permissions_for_loan_types',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (24,'2020_08_15_170030_fill_permissions_for_time_units',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25,'2020_08_15_170043_fill_permissions_for_interest_frequencies',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26,'2020_08_15_170100_fill_permissions_for_compounding_periods',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (27,'2020_08_15_170119_fill_permissions_for_clients',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28,'2020_08_15_170131_fill_permissions_for_loan_statuses',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (29,'2020_08_15_170146_fill_permissions_for_products',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (30,'2020_08_15_173006_add_time_unit_to_interest_frequencies_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (31,'2020_08_15_174015_change_max_amount_in_products_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (32,'2020_08_15_174305_fill_permissions_for_loans',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (33,'2020_08_16_111543_make_reviewer_id_null_in_loans_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (34,'2020_08_16_121338_fill_additional_loan_permissions',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (35,'2020_08_16_163027_create_notifications_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (36,'2020_08_17_081557_create_bills_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (37,'2020_08_17_081610_create_payments_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (38,'2020_08_17_082757_fill_permissions_for_bills',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (39,'2020_08_17_082808_fill_permissions_for_payments',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (40,'2020_08_17_083537_add_percentage_interest_rate_to_loans_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (41,'2020_08_17_115505_change_unique_date_key_in_bills_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (42,'2020_08_17_143216_add_interest_field_to_bills_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (43,'2020_08_18_201221_rename_principal_in_bills_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (44,'2020_08_20_184228_create_article_types_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (45,'2020_08_20_184251_create_outlets_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (46,'2020_08_20_184318_create_over_groups_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (47,'2020_08_20_184334_create_basic_units_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (48,'2020_08_20_184345_create_depot_types_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (49,'2020_08_20_184402_create_disposal_types_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (50,'2020_08_20_184413_create_statuses_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (51,'2020_08_20_185010_create_major_groups_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (52,'2020_08_20_185019_create_item_groups_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (53,'2020_08_20_185025_create_derived_units_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (54,'2020_08_20_185035_create_recipe_groups_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (55,'2020_08_20_185045_create_depots_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (56,'2020_08_20_185604_create_suppliers_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (57,'2020_08_20_185612_create_articles_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (58,'2020_08_20_185620_create_recipes_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (59,'2020_08_20_185627_create_recipe_items_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (60,'2020_08_20_185642_create_price_quotes_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (61,'2020_08_31_145219_fill_permissions_for_article_types',4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (62,'2020_08_31_145241_fill_permissions_for_outlets',5);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (63,'2020_08_31_145303_fill_permissions_for_over_groups',6);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (64,'2020_08_31_145313_fill_permissions_for_basic_units',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (65,'2020_08_31_145326_fill_permissions_for_depot_types',8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (66,'2020_08_31_145339_fill_permissions_for_disposal_types',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (67,'2020_08_31_145358_fill_permissions_for_statuses',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (68,'2020_08_31_145408_fill_permissions_for_major_groups',11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (69,'2020_08_31_145416_fill_permissions_for_item_groups',12);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (70,'2020_08_31_145434_fill_permissions_for_derived_units',13);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (71,'2020_08_31_145449_fill_permissions_for_recipe_groups',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (72,'2020_08_31_145506_fill_permissions_for_depots',15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (73,'2020_08_31_145519_fill_permissions_for_suppliers',16);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (74,'2020_08_31_145533_fill_permissions_for_articles',17);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (75,'2020_08_31_164513_fill_permissions_for_recipes',18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (76,'2020_08_31_164533_fill_permissions_for_recipe_items',18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (77,'2020_08_31_164554_fill_permissions_for_price_quotes',18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (79,'2020_08_31_171222_add_fields_to_recipe_items_table',19);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (80,'2020_08_31_164949_add_activated_field_to_users_table',20);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (81,'2020_08_31_173030_add_is_consumable_to_articles_table',21);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (82,'2020_08_31_180505_add_dob_and_gender_to_users_table',22);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (83,'2020_09_01_081453_create_purchase_orders_table',23);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (84,'2020_09_01_081517_create_purchase_order_items_table',23);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (85,'2020_09_01_083026_create_lpos_table',23);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (86,'2020_09_01_083552_create_grns_table',23);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (87,'2020_09_01_083558_create_grn_items_table',23);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (88,'2020_09_01_084212_fill_permissions_for_purchase_orders',24);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (89,'2020_09_01_084227_fill_permissions_for_purchase_order_items',25);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (90,'2020_09_01_084245_fill_permissions_for_lpos',26);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (91,'2020_09_01_084255_fill_permissions_for_grns',27);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (92,'2020_09_01_084304_fill_permissions_for_grn_items',28);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (93,'2020_09_01_154432_add_review_purchase_order_permission',29);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (94,'2020_09_02_105342_create_reviews_table',30);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (95,'2020_09_02_110123_fill_permissions_for_reviews',31);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (96,'2020_09_04_095637_add_fields_to_grn_items_table',32);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (97,'2020_09_04_101307_add_received_fields_to_grns_table',32);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (98,'2020_09_04_124953_add_article_id_to_grn_items_table',33);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (101,'2020_09_04_144406_add_lpo_related_statuses',34);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (102,'2020_09_04_165051_add_invoiced_at_field_to_grns_table',34);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (103,'2020_09_04_172251_add_invoicer_to_grns',35);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (104,'2014_10_12_200000_add_two_factor_columns_to_users_table',36);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (105,'2020_09_17_165525_create_batches_table',36);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (106,'2020_09_17_165541_create_batch_items_table',36);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (107,'2020_09_17_165548_create_stocks_table',36);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (108,'2020_09_17_170415_fill_permissions_for_batches',37);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (109,'2020_09_17_170431_fill_permissions_for_batch_items',38);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (110,'2020_09_17_170447_fill_permissions_for_stocks',39);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (111,'2020_09_17_175411_add_batch_id_to_grns_table',40);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (112,'2020_09_19_131026_create_single_requests_table',41);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (113,'2020_09_19_131058_create_single_request_items_table',41);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (114,'2020_09_19_131109_create_bulk_requests_table',41);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (115,'2020_09_19_131120_create_bulk_request_items_table',41);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (116,'2020_09_19_133457_create_bulk_request_articles_table',41);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (117,'2020_09_19_133848_fill_permissions_for_single_requests',42);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (118,'2020_09_19_133906_fill_permissions_for_single_request_items',43);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (119,'2020_09_19_133923_fill_permissions_for_bulk_requests',44);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (120,'2020_09_19_133941_fill_permissions_for_bulk_request_items',45);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (121,'2020_09_19_134007_fill_permissions_for_bulk_request_articles',46);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (122,'2020_09_25_070012_create_single_dispatches_table',47);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (123,'2020_09_25_070707_create_single_dispatch_items_table',47);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (124,'2020_09_25_071324_create_bulk_dispatches_table',47);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (125,'2020_09_25_071331_create_bulk_dispatch_items_table',47);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (127,'2020_09_25_071805_create_bulk_dispatch_bulk_request_pivot',48);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (128,'2020_09_25_072440_fill_permissions_for_single_dispatches',49);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (129,'2020_09_25_072451_fill_permissions_for_single_dispatch_items',50);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (130,'2020_09_25_072503_fill_permissions_for_bulk_dispatches',51);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (131,'2020_09_25_072512_fill_permissions_for_bulk_dispatch_items',52);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (132,'2020_09_25_073126_make_dispatcher_and_recipient_fields_null_on_single_dispatches_table',53);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (133,'2020_09_25_073223_make_dispatcher_and_recipient_fields_null_on_bulk_dispatches_table',53);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (134,'2020_09_25_073733_link_single_dispatch_items_to_single_request_items',54);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (135,'2020_09_25_081618_add_review_permissions',55);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (136,'2020_09_25_084423_add_review_bulk_permissions',56);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (137,'2020_09_25_093835_remove_bulk_request_id_from_bulk_dispatches_table',57);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (138,'2020_09_25_113457_add_processing_status',58);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (139,'2020_09_29_080851_create_portion_sizes_table',59);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (140,'2020_09_29_080919_add_pos_interface_id_to_outlets',59);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (141,'2020_09_29_080852_drop_useless_tables',60);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (142,'2020_09_29_080947_create_products_table',60);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (143,'2020_09_29_082218_create_product_quantities_table',60);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (144,'2020_09_29_084810_fill_permissions_for_portion_sizes',61);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (145,'2020_09_29_085023_fill_permissions_for_products',62);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (146,'2020_09_29_085046_fill_permissions_for_product_quantities',63);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (147,'2020_09_29_152809_create_food_preparations_table',64);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (148,'2020_09_29_153445_create_food_preparation_items_table',64);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (149,'2020_09_29_153458_create_product_dispatches_table',64);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (151,'2020_09_29_171240_fill_permissions_for_food_preparations',65);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (152,'2020_09_29_171247_fill_permissions_for_food_preparation_items',66);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (153,'2020_09_29_171259_fill_permissions_for_product_dispatches',67);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (154,'2020_09_29_171310_fill_permissions_for_product_dispatch_items',68);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (155,'2020_09_29_153607_create_product_dispatch_items_table',69);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (156,'2020_09_29_182520_add_food_preparation_fk_to_food_preparation_items_table',70);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (157,'2020_09_29_182738_add_product_dispatch_fk_to_product_dispatch_items_table',70);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (158,'2020_09_29_190907_add_status_id_to_food_preparations_table',71);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (159,'2020_09_30_102002_add_expected_portions_field_to_product_dispatch_items_table',72);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (160,'2020_09_30_141711_create_product_dispatch_permissions',73);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (161,'2020_09_30_155505_adjust_products_table',74);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (162,'2020_09_30_161511_make_article_id_nullable_in_products',75);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (163,'2020_10_01_065830_drop_product_quantities_table',76);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (164,'2020_10_01_065938_create_outlet_stocks_table',77);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (165,'2020_10_01_070139_fill_permissions_for_outlet_stocks',78);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (166,'2020_10_01_092127_add_batch_item_id_to_outlet_stocks_table',79);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (167,'2020_10_01_164149_add_product_dispatch_receive_permissions',80);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (168,'2020_10_02_140438_create_sales_table',81);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (169,'2020_10_02_140750_fill_permissions_for_sales',82);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (170,'2020_10_02_144352_add_creator_foreign_key_to_sales',83);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (171,'2020_10_03_175741_create_food_returns_table',84);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (172,'2020_10_03_175759_create_food_return_items',84);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (173,'2020_10_03_181242_fill_permissions_for_food_returns',85);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (174,'2020_10_03_181250_fill_permissions_for_food_return_items',86);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (175,'2020_10_04_080814_add_temporal_holding_outlet',87);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (176,'2020_10_04_084828_add_food_returns_review_and_receive_permissions',88);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (177,'2020_10_07_172114_create_direct_transfers_table',89);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (178,'2020_10_07_172145_create_direct_transfer_items_table',89);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (179,'2020_10_07_174619_fill_permissions_for_direct_transfers',90);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (180,'2020_10_07_174627_fill_permissions_for_direct_transfer_items',91);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (181,'2020_10_07_175348_add_direct_transfer_permissions',92);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (182,'2020_11_05_193843_create_disposals_table',93);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (183,'2020_11_05_193856_create_disposal_items_table',93);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (184,'2020_11_05_200738_fill_permissions_for_disposals',94);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (185,'2020_11_05_200745_fill_permissions_for_disposal_items',95);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (186,'2020_11_06_174047_add_disposal_review_permissions',96);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (187,'2020_11_07_063118_add_amount_to_disposal_items',97);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (188,'2020_11_26_115401_add_backend_browse_permissions',98);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (189,'2020_11_27_092947_add_bulk_requests_receive_permission',99);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (190,'2020_11_27_094940_add_single_requests_receive_permission',100);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (191,'2020_11_30_143309_add_logs_permissions',101);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (192,'2020_11_30_182843_create_audits_table',101);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (193,'2020_11_30_182843_create_media_table',101);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (194,'2020_11_30_185937_add_audit_permissions',101);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (195,'2020_12_05_073212_add_stocks_permissions',101);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (196,'2021_01_14_133839_add_synchronize_recipes_permission',102);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (197,'2021_05_25_060439_create_pos_integrations_table',103);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (198,'2021_05_25_061645_fill_permissions_for_pos_integrations',103);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (199,'2021_05_25_081522_add_api_key_to_pos_integrations_table',103);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (200,'2021_05_25_085946_adjust_fields_in_pos_integrations_table',103);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (201,'2021_05_25_101718_add_product_dispatches_execute_permission',103);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (202,'2021_05_25_125904_add_partially_received_status',103);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (203,'2022_07_08_164213_modify_source_id_in_bulk_requests_table',104);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (204,'2022_07_08_181932_add_expected_dispatch_date_to_bulk_requests_table',104);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (205,'2022_07_12_145135_modify_fields_in_direct_transfers_table',105);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (206,'2020_02_12_100000_create_stock_mutations_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (207,'2022_08_01_123610_create_spatie_settings_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (208,'2022_08_01_130144_create_general_settings',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (209,'2022_08_01_130144_create_procurement_settings',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (210,'2022_08_01_150759_add_null_source_id_to_single_requests_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (211,'2022_08_01_151516_add_expected_dispatch_date_to_single_requests_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (212,'2022_08_14_185956_create_stock_takes_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (213,'2022_08_14_194408_rename_name_in_roles_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (214,'2022_08_15_082427_add_dispatched_quantity_to_single_request_items_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (215,'2022_08_15_082625_add_dispatch_and_recipient_fields_to_single_requests_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (216,'2022_08_18_173238_add_dispatch_and_receiving_details_to_bulk_requests_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (217,'2022_08_18_173610_add_received_quantity_to_bulk_request_articles_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (218,'2022_08_18_200913_make_source_id_nullable_in_direct_transfer_items',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (219,'2022_08_18_201049_remove_portions_from_direct_transfers',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (220,'2022_08_18_213026_add_objectguid_to_users_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (221,'2022_08_18_223901_make_first_name_and_last_name_nullable_in_users_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (222,'2022_08_23_090007_remove_cost_from_recipes_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (223,'2022_08_23_091037_remove_price_from_recipe_items_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (224,'2022_08_24_183351_create_article_prices_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (225,'2022_08_24_191955_add_quantity_to_article_prices_table',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (226,'2022_08_24_194803_add_stock_reorder_level_to_articles',106);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (227,'2022_09_01_081503_add_status_id_to_grns_table',107);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (228,'2022_09_07_093001_create_companies_table',108);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (229,'2022_09_07_095534_add_company_id_to_users_table',108);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (230,'2022_09_07_113229_add_company_id_to_bulk_dispatch_table',108);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (231,'2022_09_07_114943_add_company_id_to_bulk_requests_table',108);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (232,'2022_09_07_145234_add_company_id_to_depot_table',108);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (233,'2022_09_07_145828_add_company_id_to_tables',108);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (234,'2022_09_08_124904_add_unscoped_roles_setting',108);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (235,'2022_09_09_114412_drop_column_sale_price_on_recipe_table',108);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (236,'2022_09_23_154044_create_trolley_stocks_table',109);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (237,'2022_10_24_121609_make_fields_nullable_in_product_dispatch_items_table',110);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (238,'2022_10_24_191052_modify_fields_in_stock_mutations_table',110);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (239,'2022_10_25_114751_add_pos_link_setting',110);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (240,'2022_11_18_133049_create_filament_blog_tables',110);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (241,'2022_11_18_133049_create_tag_tables',110);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (242,'2022_11_18_214844_create_docs_categories_table',110);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (243,'2022_11_18_214908_create_docs_pages_table',110);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (244,'2022_12_16_204310_create_kfs_ledgers_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (245,'2022_12_16_204658_add_kfs_ledger_object_code_to_item_groups_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (246,'2022_12_16_205055_add_kfs_account_number_to_purchase_orders_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (247,'2023_01_09_084030_add_more_settings_fields_to_companies_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (248,'2023_01_09_121845_add_account_number_to_kfs_ledgers_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (249,'2023_01_10_160914_add_kfs_posted_flag_to_grns_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (250,'2023_01_14_142130_remove_destination_from_food_preparation_items_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (251,'2023_01_16_193448_create_product_trays_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (252,'2023_01_16_194334_create_product_tray_mutations_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (253,'2023_01_18_211444_make_source_id_nullable_in_product_dispatches_table',111);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (254,'2023_05_17_205357_add_kfs_preformat_to_suppliers_table',112);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (255,'2023_05_23_021953_create_kfs_vendors_table',112);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (256,'2023_05_23_022411_add_kfs_vendor_id_to_suppliers_table',112);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (257,'2023_09_25_130059_create_balance_types_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (258,'2023_09_25_130113_create_account_types_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (259,'2023_09_25_130124_create_accounting_categories_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (260,'2023_09_25_130136_create_organization_types_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (261,'2023_09_25_130153_create_object_types_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (262,'2023_09_25_130213_create_fiscal_years_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (263,'2023_09_25_130324_create_accounting_charts_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (264,'2023_09_25_130344_create_organizations_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (265,'2023_09_25_130405_create_accounting_periods_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (266,'2023_09_25_130429_create_accounts_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (267,'2023_09_25_130441_create_accounting_objects_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (268,'2023_09_25_130455_create_journal_entries_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (269,'2023_09_25_130511_create_journal_accounting_lines_table',113);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (270,'2024_04_03_084622_add_ldap_columns_to_users_table',114);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (271,'2024_04_15_225105_create_teams_table',114);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (272,'2024_04_15_225127_add_core_fields_to_users_table',114);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (273,'2024_04_15_233354_create_team_user_pivot_table',114);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (274,'2024_04_16_064345_add_audit_fields_to_roles_table',114);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (275,'0001_01_01_000001_create_cache_table',115);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (276,'2024_04_03_101213_create_webservice_settings',116);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (280,'2024_04_18_090610_create_activity_log_table',117);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (281,'2024_04_18_090611_add_event_column_to_activity_log_table',117);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (282,'2024_04_18_090612_add_batch_uuid_column_to_activity_log_table',117);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (283,'2024_04_26_121637_remove_required_default_depot_id_in_articles_table',118);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (284,'2024_04_26_130419_add_purchase_unit_id_to_articles_table',119);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (288,'2024_04_26_170319_modify_fields_in_stock_mutations_table',120);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (291,'2024_04_26_171430_add_fields_to_batches_table',121);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (292,'2024_04_26_182645_add_audit_fields_to_articles_table',121);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (293,'2024_04_27_041057_create_products_table',122);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (294,'2024_04_27_101913_add_user_settings_to_users_table',122);
