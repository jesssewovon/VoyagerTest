-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 17 mars 2021 à 18:29
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp_log`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-03-13 19:02:05', '2021-03-13 19:02:05'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-03-13 19:02:05', '2021-03-13 19:02:05');

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 8, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'libelle', 'text', 'Libelle', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 10, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(59, 10, 'message', 'text', 'Message', 1, 1, 1, 1, 1, 1, '{}', 2),
(60, 10, 'date_heure', 'timestamp', 'Date Heure', 1, 1, 1, 1, 1, 1, '{}', 3),
(61, 10, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"Info\",\"options\":{\"option1\":\"Info\",\"option2\":\"Erreur\",\"option3\":\"Warning\"}}', 4),
(62, 10, 'projet_id', 'number', 'Projet Id', 1, 0, 0, 0, 0, 0, '{}', 5),
(63, 10, 'log_belongsto_projet_relationship', 'relationship', 'Projet', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Projet\",\"table\":\"projets\",\"type\":\"belongsTo\",\"column\":\"projet_id\",\"key\":\"id\",\"label\":\"libelle\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(64, 8, 'updated_at', 'text', 'Updated At', 1, 1, 1, 0, 0, 0, '{}', 3),
(65, 8, 'created_at', 'text', 'Created At', 1, 1, 1, 0, 0, 0, '{}', 4),
(66, 10, 'updated_at', 'text', 'Updated At', 1, 1, 1, 0, 0, 0, '{}', 6),
(67, 10, 'created_at', 'text', 'Created At', 1, 1, 1, 0, 0, 0, '{}', 7);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-03-13 19:01:42', '2021-03-13 19:01:42'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-03-13 19:01:42', '2021-03-13 19:01:42'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-03-13 19:01:42', '2021-03-13 19:01:42'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-03-13 19:02:04', '2021-03-13 19:02:04'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-03-13 19:02:05', '2021-03-13 19:02:05'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-03-13 19:02:07', '2021-03-13 19:02:07'),
(8, 'projets', 'projets', 'Projet', 'Projets', NULL, 'App\\Models\\Projet', NULL, 'App\\Http\\Controllers\\VoyagerProjetsController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-03-13 19:15:36', '2021-03-13 19:37:59'),
(10, 'logs', 'logs', 'Log', 'Logs', NULL, 'App\\Models\\Log', NULL, 'App\\Http\\Controllers\\VoyagerLogsController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-03-13 19:22:18', '2021-03-17 15:54:56');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `date_heure` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `projet_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `projet_id` (`projet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `logs`
--

INSERT INTO `logs` (`id`, `message`, `date_heure`, `type`, `projet_id`, `updated_at`, `created_at`) VALUES
(1, 'Sit saepe maxime perspiciatis et dolorem nisi.', '2021-03-17 17:19:57', 'option1', 3, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(2, 'Autem debitis aliquam totam non blanditiis.', '2021-03-17 17:19:57', 'option1', 3, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(3, 'Ut et praesentium pariatur ipsam sed pariatur.', '2021-03-17 17:19:57', 'option1', 11, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(4, 'Dolor impedit et aut.', '2021-03-17 17:19:57', 'option2', 19, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(5, 'Ab et tempore fugiat suscipit fuga maxime qui officia.', '2021-03-17 17:19:57', 'option2', 9, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(6, 'Illo error optio qui a maiores.', '2021-03-17 17:19:57', 'option3', 3, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(7, 'Quis porro enim praesentium totam enim delectus.', '2021-03-17 17:19:57', 'option1', 1, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(8, 'Unde voluptate in nam laboriosam.', '2021-03-17 17:19:57', 'option1', 4, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(9, 'Occaecati rerum possimus voluptatem cumque molestias.', '2021-03-17 17:19:57', 'option1', 8, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(10, 'Ullam consequatur mollitia expedita iusto.', '2021-03-17 17:19:57', 'option1', 13, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(11, 'Quia rerum harum nobis commodi.', '2021-03-17 17:19:57', 'option1', 7, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(12, 'Et quibusdam tempora doloribus.', '2021-03-17 17:19:57', 'option2', 12, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(13, 'Odit eveniet voluptatem eum ad vero at.', '2021-03-17 17:19:57', 'option1', 16, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(14, 'Doloribus nemo et quam.', '2021-03-17 17:19:57', 'option3', 12, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(15, 'Omnis porro voluptas quo.', '2021-03-17 17:19:57', 'option1', 15, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(16, 'Omnis asperiores consequatur unde asperiores consequuntur voluptate nam.', '2021-03-17 17:19:57', 'option2', 8, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(17, 'Asperiores neque iste magnam nesciunt tempora.', '2021-03-17 17:19:57', 'option1', 3, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(18, 'Commodi qui est dolorem omnis eveniet occaecati sed quia.', '2021-03-17 17:19:57', 'option3', 16, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(19, 'Quos sapiente nesciunt cupiditate.', '2021-03-17 17:19:57', 'option1', 13, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(20, 'Veritatis velit quia quis sunt amet ut.', '2021-03-17 17:19:57', 'option2', 6, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(21, 'Quo et unde et.', '2021-03-17 17:19:57', 'option3', 2, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(22, 'Minus ut id et qui.', '2021-03-17 17:19:57', 'option3', 12, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(23, 'Dolores provident praesentium laboriosam.', '2021-03-17 17:19:57', 'option2', 15, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(24, 'Beatae iusto consectetur error quia delectus maiores eveniet occaecati.', '2021-03-17 17:19:57', 'option3', 11, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(25, 'Est et consequatur sint maxime omnis repellat.', '2021-03-17 17:19:57', 'option3', 18, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(26, 'Reiciendis qui sed rerum numquam culpa sed.', '2021-03-17 17:19:57', 'option1', 1, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(27, 'Doloremque accusantium atque quibusdam quos necessitatibus consequatur.', '2021-03-17 17:19:57', 'option3', 3, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(28, 'Velit possimus consequatur eum.', '2021-03-17 17:19:57', 'option3', 18, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(29, 'Omnis quo recusandae harum architecto aut quia.', '2021-03-17 17:19:57', 'option2', 11, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(30, 'Quos dolorem aut provident ut qui minima.', '2021-03-17 17:19:57', 'option1', 12, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(31, 'Suscipit vel itaque possimus veniam praesentium repellat qui.', '2021-03-17 17:19:57', 'option1', 12, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(32, 'Non maiores veritatis iste aliquid dolore.', '2021-03-17 17:19:57', 'option1', 5, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(33, 'Amet neque vel natus dolores architecto et.', '2021-03-17 17:19:57', 'option1', 17, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(34, 'Ea voluptatum sunt omnis velit voluptas dolore dolorum et.', '2021-03-17 17:19:57', 'option1', 15, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(35, 'Ut perspiciatis et voluptas ea omnis molestias consequatur.', '2021-03-17 17:19:57', 'option3', 2, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(36, 'Labore quidem qui aliquid ullam.', '2021-03-17 17:19:57', 'option1', 10, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(37, 'Reiciendis ea quia quae nam praesentium architecto.', '2021-03-17 17:19:57', 'option2', 17, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(38, 'Ab aut assumenda corporis modi sunt consequatur inventore.', '2021-03-17 17:19:57', 'option2', 8, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(39, 'Occaecati sapiente ducimus illo hic.', '2021-03-17 17:19:57', 'option3', 15, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(40, 'Debitis eligendi similique aut voluptas iure sint et corporis.', '2021-03-17 17:19:57', 'option1', 2, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(41, 'Cum modi sunt ut consequuntur.', '2021-03-17 17:19:57', 'option1', 19, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(42, 'Qui perferendis doloremque aut odio quaerat praesentium.', '2021-03-17 17:19:57', 'option1', 11, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(43, 'Tenetur autem nam et molestiae consectetur cum.', '2021-03-17 17:19:57', 'option3', 16, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(44, 'Sit ipsam magnam quis distinctio laboriosam.', '2021-03-17 17:19:57', 'option3', 19, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(45, 'Reprehenderit est pariatur maiores vero quis.', '2021-03-17 17:19:57', 'option3', 20, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(46, 'Non repellendus aut modi facere.', '2021-03-17 17:19:57', 'option3', 20, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(47, 'Esse iure et qui dignissimos exercitationem possimus.', '2021-03-17 17:19:57', 'option3', 19, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(48, 'Consequatur ut esse aliquam nemo totam.', '2021-03-17 17:19:57', 'option1', 17, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(49, 'Magni beatae esse quasi magni labore beatae.', '2021-03-17 17:19:57', 'option3', 19, '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(50, 'Voluptatum sed fugiat illum.', '2021-03-17 17:19:57', 'option3', 14, '2021-03-17 17:19:57', '2021-03-17 17:19:57');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-03-13 19:01:43', '2021-03-13 19:01:43');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-03-13 19:01:43', '2021-03-13 19:01:43', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-03-13 19:01:43', '2021-03-13 19:01:43', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-03-13 19:01:43', '2021-03-13 19:01:43', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-03-13 19:01:43', '2021-03-13 19:01:43', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-03-13 19:01:43', '2021-03-13 19:01:43', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-03-13 19:01:44', '2021-03-13 19:01:44', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-03-13 19:01:44', '2021-03-13 19:01:44', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-03-13 19:01:44', '2021-03-13 19:01:44', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-03-13 19:01:44', '2021-03-13 19:01:44', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-03-13 19:01:44', '2021-03-13 19:01:44', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-03-13 19:02:04', '2021-03-13 19:02:04', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-03-13 19:02:06', '2021-03-13 19:02:06', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-03-13 19:02:07', '2021-03-13 19:02:07', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-03-13 19:02:11', '2021-03-13 19:02:11', 'voyager.hooks', NULL),
(15, 1, 'Projets', '', '_self', NULL, NULL, NULL, 15, '2021-03-13 19:15:36', '2021-03-13 19:15:36', 'voyager.projets.index', NULL),
(16, 1, 'Logs', '', '_self', NULL, NULL, NULL, 16, '2021-03-13 19:22:19', '2021-03-13 19:22:19', 'voyager.logs.index', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text,
  `body` text,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages\\March2021\\MEi41JZH7uABBSan51Ej.png', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-03-13 19:02:08', '2021-03-16 18:45:55');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-03-13 19:01:44', '2021-03-13 19:01:44'),
(2, 'browse_bread', NULL, '2021-03-13 19:01:44', '2021-03-13 19:01:44'),
(3, 'browse_database', NULL, '2021-03-13 19:01:44', '2021-03-13 19:01:44'),
(4, 'browse_media', NULL, '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(5, 'browse_compass', NULL, '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(6, 'browse_menus', 'menus', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(7, 'read_menus', 'menus', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(8, 'edit_menus', 'menus', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(9, 'add_menus', 'menus', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(10, 'delete_menus', 'menus', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(11, 'browse_roles', 'roles', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(12, 'read_roles', 'roles', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(13, 'edit_roles', 'roles', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(14, 'add_roles', 'roles', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(15, 'delete_roles', 'roles', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(16, 'browse_users', 'users', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(17, 'read_users', 'users', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(18, 'edit_users', 'users', '2021-03-13 19:01:45', '2021-03-13 19:01:45'),
(19, 'add_users', 'users', '2021-03-13 19:01:46', '2021-03-13 19:01:46'),
(20, 'delete_users', 'users', '2021-03-13 19:01:46', '2021-03-13 19:01:46'),
(21, 'browse_settings', 'settings', '2021-03-13 19:01:46', '2021-03-13 19:01:46'),
(22, 'read_settings', 'settings', '2021-03-13 19:01:46', '2021-03-13 19:01:46'),
(23, 'edit_settings', 'settings', '2021-03-13 19:01:46', '2021-03-13 19:01:46'),
(24, 'add_settings', 'settings', '2021-03-13 19:01:46', '2021-03-13 19:01:46'),
(25, 'delete_settings', 'settings', '2021-03-13 19:01:46', '2021-03-13 19:01:46'),
(26, 'browse_categories', 'categories', '2021-03-13 19:02:04', '2021-03-13 19:02:04'),
(27, 'read_categories', 'categories', '2021-03-13 19:02:04', '2021-03-13 19:02:04'),
(28, 'edit_categories', 'categories', '2021-03-13 19:02:04', '2021-03-13 19:02:04'),
(29, 'add_categories', 'categories', '2021-03-13 19:02:05', '2021-03-13 19:02:05'),
(30, 'delete_categories', 'categories', '2021-03-13 19:02:05', '2021-03-13 19:02:05'),
(31, 'browse_posts', 'posts', '2021-03-13 19:02:06', '2021-03-13 19:02:06'),
(32, 'read_posts', 'posts', '2021-03-13 19:02:06', '2021-03-13 19:02:06'),
(33, 'edit_posts', 'posts', '2021-03-13 19:02:06', '2021-03-13 19:02:06'),
(34, 'add_posts', 'posts', '2021-03-13 19:02:06', '2021-03-13 19:02:06'),
(35, 'delete_posts', 'posts', '2021-03-13 19:02:06', '2021-03-13 19:02:06'),
(36, 'browse_pages', 'pages', '2021-03-13 19:02:07', '2021-03-13 19:02:07'),
(37, 'read_pages', 'pages', '2021-03-13 19:02:07', '2021-03-13 19:02:07'),
(38, 'edit_pages', 'pages', '2021-03-13 19:02:07', '2021-03-13 19:02:07'),
(39, 'add_pages', 'pages', '2021-03-13 19:02:07', '2021-03-13 19:02:07'),
(40, 'delete_pages', 'pages', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(41, 'browse_hooks', NULL, '2021-03-13 19:02:11', '2021-03-13 19:02:11'),
(42, 'browse_projets', 'projets', '2021-03-13 19:15:36', '2021-03-13 19:15:36'),
(43, 'read_projets', 'projets', '2021-03-13 19:15:36', '2021-03-13 19:15:36'),
(44, 'edit_projets', 'projets', '2021-03-13 19:15:36', '2021-03-13 19:15:36'),
(45, 'add_projets', 'projets', '2021-03-13 19:15:36', '2021-03-13 19:15:36'),
(46, 'delete_projets', 'projets', '2021-03-13 19:15:36', '2021-03-13 19:15:36'),
(47, 'browse_logs', 'logs', '2021-03-13 19:22:18', '2021-03-13 19:22:18'),
(48, 'read_logs', 'logs', '2021-03-13 19:22:18', '2021-03-13 19:22:18'),
(49, 'edit_logs', 'logs', '2021-03-13 19:22:18', '2021-03-13 19:22:18'),
(50, 'add_logs', 'logs', '2021-03-13 19:22:18', '2021-03-13 19:22:18'),
(51, 'delete_logs', 'logs', '2021-03-13 19:22:18', '2021-03-13 19:22:18');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-13 19:02:06', '2021-03-13 19:02:06'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-13 19:02:06', '2021-03-13 19:02:06'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-13 19:02:06', '2021-03-13 19:02:06'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-13 19:02:06', '2021-03-13 19:02:06');

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

DROP TABLE IF EXISTS `projets`;
CREATE TABLE IF NOT EXISTS `projets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`id`, `libelle`, `updated_at`, `created_at`) VALUES
(1, 'Deleniti dolores quia deleniti aut.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(2, 'Ut provident voluptates et amet et voluptatem atque id.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(3, 'Sunt veniam numquam molestiae ad explicabo.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(4, 'Maxime sint porro fuga id.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(5, 'Architecto voluptas maxime recusandae.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(6, 'Laboriosam et ipsa adipisci esse quia.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(7, 'Iure sit officiis et voluptatum animi exercitationem aut quas.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(8, 'Odio qui recusandae velit.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(9, 'Nisi accusamus in accusamus eligendi.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(10, 'Quod ut voluptatem sunt aliquid quis aut.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(11, 'Qui aut unde ipsum numquam.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(12, 'Velit voluptas omnis aut et nemo consequuntur esse.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(13, 'Iure est maiores quisquam sequi in voluptatem.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(14, 'Ut necessitatibus laborum eum hic est enim.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(15, 'Aut omnis voluptatem hic veniam non.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(16, 'Est nihil et magni aperiam aut.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(17, 'Nulla quo cupiditate aut.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(18, 'Dolor autem quo a atque aut.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(19, 'Dicta doloremque consequatur voluptatem dicta officia quaerat quasi.', '2021-03-17 17:19:57', '2021-03-17 17:19:57'),
(20, 'Fugit dolore fugit nihil qui id reprehenderit voluptate.', '2021-03-17 17:19:57', '2021-03-17 17:19:57');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-03-13 19:01:44', '2021-03-13 19:01:44'),
(2, 'user', 'Normal User', '2021-03-13 19:01:44', '2021-03-13 19:01:44');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text,
  `details` text,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\March2021\\JS6J8IlXttZ7FEaFeoKF.png', '', 'image', 4, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 3, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-03-13 19:02:08', '2021-03-13 19:02:08'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-03-13 19:02:09', '2021-03-13 19:02:09'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-03-13 19:02:10', '2021-03-13 19:02:10'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-03-13 19:02:10', '2021-03-13 19:02:10'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-03-13 19:02:10', '2021-03-13 19:02:10');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$XFhdN./7FW80IdR3j98XyONG0tCYEX.7IcdfmmZ.oz69uml7UkLUO', '9VCd1X28au5ZK7CSYlVEea7ezWoGvdbIYIOQv9XHucFauR6lO4ffjeiebW03', NULL, '2021-03-13 19:02:05', '2021-03-13 19:02:05'),
(2, 2, 'ABALO Jean', 'abalo.jean@gmail.com', 'users/default.png', NULL, '$2y$10$3ijFqIfQTLWHk1i0vWJVfOmR1X1YLxcsP4dE6tUNaUSL5Q.jejEQ2', NULL, '{\"locale\":\"en\"}', '2021-03-13 23:16:30', '2021-03-13 23:16:30');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
