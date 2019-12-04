-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Nov 2019 pada 10.42
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voucher`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_rows`
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
(22, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 9, 'gift', 'text', 'Gift', 0, 1, 1, 1, 1, 1, '{}', 2),
(24, 9, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(25, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(26, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(27, 9, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 0, '{}', 6),
(28, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(29, 10, 'voucher_code', 'text', 'Voucher Code', 0, 1, 1, 0, 0, 0, '{}', 2),
(30, 10, 'gift_id', 'hidden', 'Gift', 0, 1, 1, 1, 1, 1, '{}', 3),
(31, 10, 'redeemed', 'text', 'Redeemed', 0, 1, 1, 1, 0, 0, '{}', 4),
(32, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5),
(33, 10, 'updated_at', 'timestamp', 'Updated At', 0, 1, 0, 1, 0, 0, '{}', 6),
(34, 10, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 1, '{}', 7),
(35, 9, 'gift_hasmany_voucher_relationship', 'relationship', 'Vouchers', 0, 1, 1, 1, 0, 1, '{\"model\":\"App\\\\Model\\\\Voucher\",\"table\":\"vouchers\",\"type\":\"hasMany\",\"column\":\"gift_id\",\"key\":\"id\",\"label\":\"voucher_code\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(36, 10, 'voucher_belongsto_gift_relationship', 'relationship', 'Gift Item', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Model\\\\Gift\",\"table\":\"gifts\",\"type\":\"belongsTo\",\"column\":\"gift_id\",\"key\":\"id\",\"label\":\"gift\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(37, 10, 'no_hp', 'text', 'No Hp', 0, 1, 1, 1, 1, 1, '{}', 8),
(38, 9, 'packet_id', 'hidden', 'Packet Id', 0, 0, 0, 1, 1, 1, '{}', 7),
(39, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(40, 11, 'packet_name', 'text', 'Packet Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(41, 11, 'packet_code', 'hidden', 'Packet Code', 0, 1, 1, 0, 0, 0, '{}', 3),
(42, 11, 'voucher_limit', 'number', 'Voucher Limit', 0, 1, 1, 1, 1, 1, '{}', 4),
(43, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(44, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(45, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 1, '{}', 7),
(46, 11, 'packet_hasmany_gift_relationship', 'relationship', 'Gifts', 0, 1, 1, 1, 0, 1, '{\"model\":\"App\\\\Model\\\\Gift\",\"table\":\"gifts\",\"type\":\"hasMany\",\"column\":\"packet_id\",\"key\":\"id\",\"label\":\"gift\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(47, 9, 'gift_belongsto_packet_relationship', 'relationship', 'Packets', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Model\\\\Packet\",\"table\":\"packets\",\"type\":\"belongsTo\",\"column\":\"packet_id\",\"key\":\"id\",\"label\":\"packet_name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(48, 9, 'percentage_win', 'number', 'Percentage Win', 0, 1, 1, 1, 1, 1, '{}', 8),
(49, 11, 'current_used', 'number', 'Current Used', 0, 1, 1, 1, 1, 1, '{}', 8),
(50, 10, 'author_id', 'hidden', 'Author Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(51, 10, 'voucher_belongsto_user_relationship', 'relationship', 'Issued By', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(52, 11, 'author_id', 'hidden', 'Author Id', 0, 0, 0, 1, 1, 1, '{}', 9),
(53, 9, 'gift_belongsto_user_relationship', 'relationship', 'Created By', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(54, 9, 'author_id', 'hidden', 'Created By', 0, 0, 0, 1, 1, 1, '{}', 9),
(55, 11, 'packet_belongsto_user_relationship', 'relationship', 'Created By', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-11-17 01:55:58', '2019-11-17 01:55:58'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-11-17 01:55:59', '2019-11-17 01:55:59'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-11-17 01:55:59', '2019-11-17 01:55:59'),
(4, 'Gift', 'gift', 'Gift', 'Gifts', 'voyager-gift', 'App\\Gift', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"gift\",\"order_display_column\":\"gift\",\"order_direction\":\"asc\",\"default_search_key\":\"gift\"}', '2019-11-17 02:00:47', '2019-11-17 02:00:47'),
(9, 'gifts', 'gifts', 'Gift', 'Gifts', 'voyager-gift', 'App\\Model\\Gift', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"gift\",\"order_display_column\":\"gift\",\"order_direction\":\"asc\",\"default_search_key\":\"gift\",\"scope\":\"currentUser\"}', '2019-11-17 02:37:47', '2019-11-21 23:24:20'),
(10, 'vouchers', 'vouchers', 'Voucher', 'Vouchers', 'voyager-ticket', 'App\\Model\\Voucher', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"created_at\",\"order_display_column\":\"created_at\",\"order_direction\":\"asc\",\"default_search_key\":\"voucher_code\",\"scope\":\"currentUser\"}', '2019-11-17 02:38:41', '2019-11-21 20:57:41'),
(11, 'packets', 'packets', 'Packet', 'Packets', 'voyager-categories', 'App\\Model\\Packet', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"packet_name\",\"order_display_column\":\"packet_name\",\"order_direction\":\"asc\",\"default_search_key\":\"packet_name\",\"scope\":\"currentUser\"}', '2019-11-20 21:20:15', '2019-11-21 22:37:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gifts`
--

CREATE TABLE `gifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `gift` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `packet_id` int(11) DEFAULT NULL,
  `percentage_win` int(11) DEFAULT 0,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `gifts`
--

INSERT INTO `gifts` (`id`, `gift`, `description`, `created_at`, `updated_at`, `deleted_at`, `packet_id`, `percentage_win`, `author_id`) VALUES
(1, 'Es Teh Manis', 'Gratis es the manis untuk pembelian 1 nasi goreng telur', '2019-11-17 02:45:36', '2019-11-21 22:47:30', NULL, 5, 75, 3),
(2, 'Diskon 20%', 'Diskon 20% untuk minimal pembelian 75rb', '2019-11-20 21:25:08', '2019-11-21 22:47:17', NULL, 5, 25, 3),
(3, 'Es Teh Manis', NULL, '2019-11-21 01:22:00', '2019-11-21 22:46:37', '2019-11-21 22:46:37', NULL, NULL, NULL),
(4, 'Diskon 20%', NULL, '2019-11-21 01:22:06', '2019-11-21 22:46:30', '2019-11-21 22:46:30', NULL, NULL, NULL),
(5, 'sadadasdasd', NULL, '2019-11-21 01:22:11', '2019-11-21 22:44:03', '2019-11-21 22:44:03', NULL, NULL, NULL),
(6, 'Bakso Bakar', NULL, '2019-11-21 22:38:52', '2019-11-21 22:39:18', NULL, 4, 20, 2),
(7, 'Es Teh Manis', 'Gratis es the manis untuk pembelian 1 nasi goreng telur', '2019-11-22 02:10:57', '2019-11-22 02:10:57', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-11-17 01:56:02', '2019-11-17 01:56:02'),
(2, 'staff', '2019-11-17 02:42:38', '2019-11-17 02:42:38'),
(3, 'client', '2019-11-21 22:41:11', '2019-11-21 22:41:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-11-17 01:56:02', '2019-11-17 01:56:02', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2019-11-17 01:56:02', '2019-11-17 01:56:02', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-11-17 01:56:02', '2019-11-17 01:56:02', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-11-17 01:56:02', '2019-11-17 01:56:02', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-11-17 01:56:03', '2019-11-17 01:56:03', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2019-11-17 01:56:03', '2019-11-17 01:56:03', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2019-11-17 01:56:03', '2019-11-17 01:56:03', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2019-11-17 01:56:03', '2019-11-17 01:56:03', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2019-11-17 01:56:03', '2019-11-17 01:56:03', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2019-11-17 01:56:03', '2019-11-17 01:56:03', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2019-11-17 01:56:11', '2019-11-17 01:56:11', 'voyager.hooks', NULL),
(17, 1, 'Gifts', '', '_self', 'voyager-gift', NULL, NULL, 16, '2019-11-17 02:37:47', '2019-11-17 02:37:47', 'voyager.gifts.index', NULL),
(18, 1, 'Vouchers', '', '_self', 'voyager-ticket', NULL, NULL, 17, '2019-11-17 02:38:41', '2019-11-17 02:38:41', 'voyager.vouchers.index', NULL),
(19, 2, 'Voucher', '', '_self', NULL, '#000000', NULL, 18, '2019-11-17 02:43:03', '2019-11-17 02:43:28', 'voyager.vouchers.index', 'null'),
(20, 1, 'Packets', '', '_self', 'voyager-categories', NULL, NULL, 19, '2019-11-20 21:20:15', '2019-11-20 21:20:15', 'voyager.packets.index', NULL),
(21, 3, 'Gifts', '', '_self', 'voyager-gift', '#000000', NULL, 2, '2019-11-21 22:41:58', '2019-11-21 22:43:03', 'voyager.gifts.index', NULL),
(22, 3, 'Vouchers', '', '_self', 'voyager-ticket', '#000000', NULL, 3, '2019-11-21 22:42:13', '2019-11-21 22:43:03', 'voyager.vouchers.index', NULL),
(23, 3, 'Packets', '', '_self', 'voyager-categories', '#000000', NULL, 1, '2019-11-21 22:42:35', '2019-11-21 22:43:03', 'voyager.packets.index', 'null');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
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
(23, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `packets`
--

CREATE TABLE `packets` (
  `id` int(10) UNSIGNED NOT NULL,
  `packet_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packet_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_limit` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `current_used` int(11) DEFAULT 0,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `packets`
--

INSERT INTO `packets` (`id`, `packet_name`, `packet_code`, `voucher_limit`, `created_at`, `updated_at`, `deleted_at`, `current_used`, `author_id`) VALUES
(2, 'Paket Natal', '0HLQRHV6BI', 1000, '2019-11-20 21:46:59', '2019-11-21 01:17:09', NULL, 7, NULL),
(3, 'Paket Tahun Baru', 'X48DYG5HG0', 1000, '2019-11-21 19:02:34', '2019-11-21 22:39:29', '2019-11-21 22:39:29', NULL, NULL),
(4, 'Paket Tahun Baru', 'CCKNSNJE0M', 1000, '2019-11-21 22:39:07', '2019-11-21 22:39:07', NULL, NULL, 2),
(5, 'Paket Tahun Baru Cleint', '4OC65VFN92', 1000, '2019-11-21 22:43:54', '2019-11-21 22:43:54', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-11-17 01:56:04', '2019-11-17 01:56:04'),
(2, 'browse_bread', NULL, '2019-11-17 01:56:04', '2019-11-17 01:56:04'),
(3, 'browse_database', NULL, '2019-11-17 01:56:04', '2019-11-17 01:56:04'),
(4, 'browse_media', NULL, '2019-11-17 01:56:04', '2019-11-17 01:56:04'),
(5, 'browse_compass', NULL, '2019-11-17 01:56:04', '2019-11-17 01:56:04'),
(6, 'browse_menus', 'menus', '2019-11-17 01:56:05', '2019-11-17 01:56:05'),
(7, 'read_menus', 'menus', '2019-11-17 01:56:05', '2019-11-17 01:56:05'),
(8, 'edit_menus', 'menus', '2019-11-17 01:56:05', '2019-11-17 01:56:05'),
(9, 'add_menus', 'menus', '2019-11-17 01:56:05', '2019-11-17 01:56:05'),
(10, 'delete_menus', 'menus', '2019-11-17 01:56:05', '2019-11-17 01:56:05'),
(11, 'browse_roles', 'roles', '2019-11-17 01:56:05', '2019-11-17 01:56:05'),
(12, 'read_roles', 'roles', '2019-11-17 01:56:05', '2019-11-17 01:56:05'),
(13, 'edit_roles', 'roles', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(14, 'add_roles', 'roles', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(15, 'delete_roles', 'roles', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(16, 'browse_users', 'users', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(17, 'read_users', 'users', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(18, 'edit_users', 'users', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(19, 'add_users', 'users', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(20, 'delete_users', 'users', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(21, 'browse_settings', 'settings', '2019-11-17 01:56:06', '2019-11-17 01:56:06'),
(22, 'read_settings', 'settings', '2019-11-17 01:56:07', '2019-11-17 01:56:07'),
(23, 'edit_settings', 'settings', '2019-11-17 01:56:07', '2019-11-17 01:56:07'),
(24, 'add_settings', 'settings', '2019-11-17 01:56:07', '2019-11-17 01:56:07'),
(25, 'delete_settings', 'settings', '2019-11-17 01:56:07', '2019-11-17 01:56:07'),
(26, 'browse_hooks', NULL, '2019-11-17 01:56:11', '2019-11-17 01:56:11'),
(27, 'browse_Gift', 'Gift', '2019-11-17 02:00:47', '2019-11-17 02:00:47'),
(28, 'read_Gift', 'Gift', '2019-11-17 02:00:47', '2019-11-17 02:00:47'),
(29, 'edit_Gift', 'Gift', '2019-11-17 02:00:47', '2019-11-17 02:00:47'),
(30, 'add_Gift', 'Gift', '2019-11-17 02:00:47', '2019-11-17 02:00:47'),
(31, 'delete_Gift', 'Gift', '2019-11-17 02:00:47', '2019-11-17 02:00:47'),
(52, 'browse_gifts', 'gifts', '2019-11-17 02:37:47', '2019-11-17 02:37:47'),
(53, 'read_gifts', 'gifts', '2019-11-17 02:37:47', '2019-11-17 02:37:47'),
(54, 'edit_gifts', 'gifts', '2019-11-17 02:37:47', '2019-11-17 02:37:47'),
(55, 'add_gifts', 'gifts', '2019-11-17 02:37:47', '2019-11-17 02:37:47'),
(56, 'delete_gifts', 'gifts', '2019-11-17 02:37:47', '2019-11-17 02:37:47'),
(57, 'browse_vouchers', 'vouchers', '2019-11-17 02:38:41', '2019-11-17 02:38:41'),
(58, 'read_vouchers', 'vouchers', '2019-11-17 02:38:41', '2019-11-17 02:38:41'),
(59, 'edit_vouchers', 'vouchers', '2019-11-17 02:38:41', '2019-11-17 02:38:41'),
(60, 'add_vouchers', 'vouchers', '2019-11-17 02:38:41', '2019-11-17 02:38:41'),
(61, 'delete_vouchers', 'vouchers', '2019-11-17 02:38:41', '2019-11-17 02:38:41'),
(62, 'browse_packets', 'packets', '2019-11-20 21:20:15', '2019-11-20 21:20:15'),
(63, 'read_packets', 'packets', '2019-11-20 21:20:15', '2019-11-20 21:20:15'),
(64, 'edit_packets', 'packets', '2019-11-20 21:20:15', '2019-11-20 21:20:15'),
(65, 'add_packets', 'packets', '2019-11-20 21:20:15', '2019-11-20 21:20:15'),
(66, 'delete_packets', 'packets', '2019-11-20 21:20:15', '2019-11-20 21:20:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
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
(27, 4),
(28, 1),
(28, 4),
(29, 1),
(30, 1),
(31, 1),
(52, 1),
(52, 4),
(53, 1),
(53, 4),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(57, 3),
(57, 4),
(58, 1),
(58, 3),
(58, 4),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(62, 1),
(62, 4),
(63, 1),
(63, 4),
(64, 1),
(65, 1),
(66, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-11-17 01:56:03', '2019-11-17 01:56:03'),
(2, 'user', 'Normal User', '2019-11-17 01:56:04', '2019-11-17 01:56:04'),
(3, 'staff', 'Staff', '2019-11-17 02:41:46', '2019-11-17 02:41:46'),
(4, 'client', 'Client', '2019-11-21 22:40:55', '2019-11-21 22:40:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'D\'Betjak', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'D\'Betjak', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'D\'Betjak Admin Panel', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to D\'Betjak', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$aICth0HLxbYFjE.zA8uS..pCf8m6eOrh7Hq6By7CPN65Sd/UTH2oe', NULL, NULL, '2019-11-17 01:57:13', '2019-11-17 01:57:14'),
(2, 3, 'Staff', 'staff@betjak.com', 'users/default.png', NULL, '$2y$10$BKFJZZpNyKUzMpogASTtkOZ/j/Rv3neKDncycjEWEMlg1Yx./4.sK', NULL, '{\"locale\":\"en\"}', '2019-11-17 04:17:32', '2019-11-17 04:17:32'),
(3, 4, 'Client 1', 'client@betjak.com', 'users/default.png', NULL, '$2y$10$AcNMKy1BUnswvfl8jVZcLOwrei8Vt6eLxfZpAR3s2KKI9R6Q1/0mO', NULL, '{\"locale\":\"en\"}', '2019-11-21 22:43:27', '2019-11-21 22:43:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `voucher_code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gift_id` int(11) DEFAULT NULL,
  `redeemed` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_hp` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `vouchers`
--

INSERT INTO `vouchers` (`id`, `voucher_code`, `gift_id`, `redeemed`, `created_at`, `updated_at`, `deleted_at`, `no_hp`, `author_id`) VALUES
(43, 'DNFHW-SSO7S-SBN95-H8HDA', 1, 'N', '2019-11-18 22:00:05', '2019-11-20 22:08:16', '2019-11-20 22:08:16', '089668639048', NULL),
(44, 'LSTEX-BQEUD-I2OEL-OV4L7', 1, 'N', '2019-11-18 22:00:07', '2019-11-21 02:26:27', '2019-11-21 02:26:27', '089668639048', NULL),
(45, 'TUL0V-0GBQE-9DRTH-NOE9Z', 1, 'N', '2019-11-09 22:00:09', '2019-11-20 22:08:04', '2019-11-20 22:08:04', '089668639048', NULL),
(46, 'XLXUB-IING1-OSLQC-E9TO4', 1, 'N', '2019-11-18 22:01:02', '2019-11-20 22:08:20', '2019-11-20 22:08:20', '089668639048', NULL),
(49, 'TPTGM-NZFX3-MEAVL-7DRGE', 1, 'N', '2019-11-20 21:13:47', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '0897875744', NULL),
(50, 'J2AO4-MXJTK-1UIKA-RF6WY', 1, 'N', '2019-11-20 21:15:06', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '0897875744', NULL),
(51, 'KOUAH-BWRIR-ZDUY1-GIWPD', 1, 'N', '2019-11-20 21:15:15', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '0897875744', NULL),
(52, 'UHRVF-5NBMR-19PMR-I4CXE', 1, 'N', '2019-11-20 23:23:05', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(53, '8CPXH-JPO65-4NUQO-WIBAN', 1, 'N', '2019-11-20 23:24:40', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '08966826323', NULL),
(54, 'WQ3XJ-MPBHD-NGQWW-WADFC', 1, 'N', '2019-11-20 23:24:51', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(55, '0WUPM-RGTTF-LPAOL-TPO8G', 1, 'N', '2019-11-20 23:31:48', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '08966826323', NULL),
(56, 'SHMGS-XZ5BW-O1VXH-IN0GM', 1, 'N', '2019-11-20 23:35:00', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(57, 'SIC78-U1KB5-HJUR8-JJX7B', 2, 'N', '2019-11-20 23:35:07', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(58, 'ZKQVH-ZNBNT-XZI7V-6PTLX', 1, 'N', '2019-11-20 23:35:10', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(59, 'JJKPX-ZOLQD-SJOHL-PQ7AO', 1, 'N', '2019-11-20 23:35:12', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '08966826323', NULL),
(60, 'ZWHSL-NBN6U-EPWHD-MDUZF', 1, 'N', '2019-11-20 23:35:14', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(61, '7VXPX-VA9WU-IY5KO-WMGY6', 2, 'N', '2019-11-20 23:35:16', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '08966826323', NULL),
(62, 'PARU6-8BD6M-UV8QT-K3KPM', 1, 'N', '2019-11-20 23:35:20', '2019-11-21 02:26:27', '2019-11-21 02:26:27', '08966826323', NULL),
(63, 'RVW3V-K5P6L-LYXQN-U5Q6W', 2, 'N', '2019-11-20 23:35:22', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(64, 'CYVPL-R1TQX-DQDCA-P6C2Z', 2, 'N', '2019-11-20 23:35:23', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '08966826323', NULL),
(65, 'WJBJS-VZUER-ZRHKL-EPYHZ', 1, 'N', '2019-11-20 23:35:25', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(66, '9CR0H-FABQD-ZDAP5-ARTXM', 1, 'N', '2019-11-20 23:35:26', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '08966826323', NULL),
(67, 'LLNSW-LJJGL-WUS7T-JJ1XA', 2, 'N', '2019-11-20 23:37:27', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '08966826323', NULL),
(68, 'W9QZH-DLLQK-LZR7E-F5EBY', 1, 'N', '2019-11-20 23:37:45', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966826323', NULL),
(69, 'VI72N-0NVLI-HMWH7-KV0DL', 2, 'N', '2019-11-21 00:04:21', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '0896687827', NULL),
(70, 'NQUFX-XANOO-ZYBLG-UOXLH', 2, 'N', '2019-11-21 00:11:24', '2019-11-21 02:26:27', '2019-11-21 02:26:27', '0878998775', NULL),
(71, 'I35KK-FG0SK-GAJ8K-GNKTJ', 1, 'N', '2019-11-21 00:11:45', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '0896687574', NULL),
(72, 'Q7HIA-MIAET-ZX2CR-WBGXQ', 1, 'N', '2019-11-21 00:12:27', '2019-11-21 02:26:27', '2019-11-21 02:26:27', '0897785725', NULL),
(73, 'ZCMDC-WJ8BS-PRDR6-7HMUV', 1, 'N', '2019-11-21 00:12:59', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08785578257', NULL),
(74, 'UME2Y-F0MPX-WVRN5-A3L76', NULL, 'N', '2019-11-21 01:03:31', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '0898785787', NULL),
(75, 'YNSVA-PKRAC-0UEB8-IL21U', NULL, 'N', '2019-11-21 01:03:37', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '0898785787', NULL),
(76, 'LTZ3A-U9W4K-ZB27G-TLF64', NULL, 'N', '2019-11-21 01:06:25', '2019-11-21 02:26:27', '2019-11-21 02:26:27', '08966826323', NULL),
(77, '10BUD-HUDVU-QXQMI-S34OD', 2, 'N', '2019-11-21 01:17:09', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '0896687857', NULL),
(78, '41PBK-4ODU9-Q4XCW-YWUUG', 3, 'N', '2019-11-21 01:22:57', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '08998877858', NULL),
(79, 'KPOWY-GSXBX-CWBOC-P0XJJ', 3, 'N', '2019-11-21 01:24:55', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '0896887857', NULL),
(80, 'XHW5J-E71IH-95EWI-MEZEC', 4, 'N', '2019-11-21 01:26:29', '2019-11-21 02:26:23', '2019-11-21 02:26:23', '08966878582', NULL),
(81, '1DXKL-N75VY-OJLNC-FXMJS', 1, 'N', '2019-11-21 02:23:14', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '0897875744', NULL),
(82, 'E15KQ-FJFNH-NOESL-DRYR1', 1, 'N', '2019-11-21 02:26:03', '2019-11-21 02:26:17', '2019-11-21 02:26:17', '0897875744', NULL),
(83, '3SHA2-HCSCN-INS69-ZNMBC', 2, 'N', '2019-11-21 19:03:21', '2019-11-21 19:51:10', '2019-11-21 19:51:10', '0897875744', NULL),
(84, 'GA6LL-GHHKW-OM9HG-U1UIE', 1, 'N', '2019-11-21 19:36:03', '2019-11-21 19:51:06', '2019-11-21 19:51:06', '0897875744', 3),
(85, 'TQCJA-WDA98-NLIRM-YTEE5', 1, 'N', '2019-11-21 19:37:53', '2019-11-21 19:50:54', '2019-11-21 19:50:54', '0897875744', 1),
(86, 'QEHLV-TIIW8-LTK1S-FE3LW', 1, 'N', '2019-11-21 20:18:26', '2019-11-21 21:03:58', '2019-11-21 21:03:58', '0897875744', 1),
(87, 'BDDAR-K5NZO-IH2VV-HS5GF', 4, 'N', '2019-11-21 20:18:36', '2019-11-21 21:03:58', '2019-11-21 21:03:58', '0897875744', 2),
(88, 'SFOUB-MFUQE-I48EZ-SNGM7', 1, 'N', '2019-11-21 20:32:09', '2019-11-21 21:03:58', '2019-11-21 21:03:58', '0897875744', 2),
(89, 'BDXUC-FFKPK-7OQFQ-F04S2', 1, 'N', '2019-11-21 20:32:17', '2019-11-21 21:03:58', '2019-11-21 21:03:58', '0897875744', 1),
(90, '4ENOA-N70CI-9ZVQH-IOM3S', 1, 'N', '2019-11-21 20:45:15', '2019-11-21 21:03:58', '2019-11-21 21:03:58', NULL, NULL),
(91, 'JEVU6-EZRRP-SR5HT-3YB6I', 3, 'N', '2019-11-21 21:03:34', '2019-11-21 21:03:58', '2019-11-21 21:03:58', '0897875744', NULL),
(92, 'AHOH4-4SGJG-HB7WP-FND5W', 1, 'N', '2019-11-21 21:04:08', '2019-11-21 21:04:08', NULL, '0897875744', 1),
(93, '0LVCD-RRC9B-SUQVB-QJEG2', 4, 'N', '2019-11-21 21:04:35', '2019-11-21 22:10:31', '2019-11-21 22:10:31', '0897875744', 2),
(94, 'PV3O0-X9E5K-YCFXW-KV8YU', 1, 'N', '2019-11-21 22:10:17', '2019-11-21 22:10:31', '2019-11-21 22:10:31', '0897875744', 2),
(95, '8FOPX-9VVPM-GP7ZY-ETSZ9', 4, 'N', '2019-11-21 22:10:24', '2019-11-21 22:10:32', '2019-11-21 22:10:32', '0897875744', 2),
(96, '8HQEI-0GINQ-GRKOG-WZK99', 4, 'N', '2019-11-21 22:10:38', '2019-11-21 22:10:38', NULL, '0897875744', 2),
(97, 'HFMU7-MC7HY-25UJH-GERLS', 1, 'N', '2019-11-21 22:10:47', '2019-11-21 22:10:47', NULL, NULL, 2),
(98, 'ZLLR3-IYECI-1ZFSP-JQ3AX', 5, 'N', '2019-11-21 22:11:18', '2019-11-21 22:11:18', NULL, '0897875744', 1),
(99, 'MGK0B-ZIPZZ-NPKSZ-BSVAV', 5, 'N', '2019-11-21 22:11:31', '2019-11-21 22:11:31', NULL, '08978757446', 2),
(100, 'SFEHY-THSKK-SWO0O-OHWAS', 7, 'N', '2019-11-22 02:13:25', '2019-11-22 02:13:25', NULL, '0896687852', NULL),
(101, 'RNZLL-NFCC3-WY4VL-QZZ3V', 7, 'N', '2019-11-22 02:20:09', '2019-11-22 02:20:09', NULL, '0896687575', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indeks untuk tabel `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gifts_packet_id_index` (`packet_id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indeks untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `packets`
--
ALTER TABLE `packets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indeks untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indeks untuk tabel `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indeks untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `packets`
--
ALTER TABLE `packets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
