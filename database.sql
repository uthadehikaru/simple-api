-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2020 at 03:27 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simple-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(17, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(18, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(19, '2016_06_01_000004_create_oauth_clients_table', 1),
(20, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(21, '2020_06_04_135005_create_users_table', 1),
(22, '2020_06_04_140513_create_ratings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('92d9854f8e27c7f034935ad67e8ef9ab4a851299ef20ae8ab75c8f1c1cf6c6d02d0f9404aea00cef', 1, 2, NULL, '[]', 0, '2020-06-04 15:17:38', '2020-06-04 15:17:38', '2021-06-04 15:17:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Lumen Personal Access Client', 'YrIsbN8XB1XKeqdoF7prCX3SFFnUW2Y6IlscwiTh', NULL, 'http://localhost', 1, 0, 0, '2020-06-04 15:16:15', '2020-06-04 15:16:15'),
(2, NULL, 'Lumen Password Grant Client', 'zZQBbHZKkcmSFKoHMRRreBsaw5gpsRiHMoQ0Uplz', 'users', 'http://localhost', 0, 1, 0, '2020-06-04 15:16:15', '2020-06-04 15:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-06-04 15:16:15', '2020-06-04 15:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('c7307c42191a407d3cee2ba69443adfa4db591eda4d9ca49986d6e29a1b8bb4ff37c3a511bcf81cb', '92d9854f8e27c7f034935ad67e8ef9ab4a851299ef20ae8ab75c8f1c1cf6c6d02d0f9404aea00cef', 0, '2021-06-04 15:17:38');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `created_at`, `updated_at`, `sender_id`, `recipient_id`, `rating`) VALUES
(1, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 19, 2, 9),
(2, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 2, 5, 7),
(3, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 21, 29, 5),
(4, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 10, 10, 2),
(5, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 46, 6, 6),
(6, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 45, 41, 9),
(7, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 25, 50, 1),
(8, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 29, 18, 2),
(9, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 44, 36, 8),
(10, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 19, 29, 7),
(11, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 14, 6, 2),
(12, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 12, 8, 3),
(13, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 41, 25, 4),
(14, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 48, 1, 2),
(15, '2020-06-04 15:15:51', '2020-06-04 15:15:51', 1, 33, 6),
(16, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 41, 41, 8),
(17, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 12, 9, 8),
(18, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 22, 12, 10),
(19, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 27, 35, 8),
(20, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 44, 47, 0),
(21, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 5, 13, 3),
(22, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 48, 19, 4),
(23, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 21, 39, 4),
(24, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 42, 43, 5),
(25, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 38, 13, 3),
(26, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 29, 42, 0),
(27, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 27, 8, 0),
(28, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 26, 8, 10),
(29, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 44, 47, 4),
(30, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 5, 14, 3),
(31, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 34, 25, 4),
(32, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 32, 26, 1),
(33, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 34, 27, 5),
(34, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 23, 19, 9),
(35, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 15, 38, 9),
(36, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 43, 25, 5),
(37, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 50, 24, 0),
(38, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 6, 36, 10),
(39, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 49, 40, 7),
(40, '2020-06-04 15:15:52', '2020-06-04 15:15:52', 45, 40, 10),
(41, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 26, 22, 5),
(42, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 27, 28, 8),
(43, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 42, 43, 0),
(44, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 32, 3, 5),
(45, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 30, 21, 4),
(46, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 18, 25, 8),
(47, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 25, 3, 3),
(48, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 21, 36, 2),
(49, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 15, 24, 4),
(50, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 4, 26, 1),
(51, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 43, 41, 0),
(52, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 17, 26, 8),
(53, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 20, 23, 10),
(54, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 20, 45, 5),
(55, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 8, 32, 2),
(56, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 31, 37, 4),
(57, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 15, 10, 1),
(58, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 23, 45, 8),
(59, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 3, 12, 0),
(60, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 18, 30, 3),
(61, '2020-06-04 15:15:53', '2020-06-04 15:15:53', 5, 19, 5),
(62, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 39, 19, 1),
(63, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 4, 13, 4),
(64, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 20, 13, 9),
(65, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 28, 5, 2),
(66, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 37, 42, 3),
(67, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 14, 4, 8),
(68, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 17, 46, 7),
(69, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 37, 46, 3),
(70, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 11, 28, 1),
(71, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 29, 2, 5),
(72, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 23, 19, 1),
(73, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 22, 40, 9),
(74, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 2, 26, 3),
(75, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 18, 27, 3),
(76, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 25, 17, 10),
(77, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 5, 17, 4),
(78, '2020-06-04 15:15:54', '2020-06-04 15:15:54', 20, 3, 1),
(79, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 23, 2, 3),
(80, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 34, 19, 8),
(81, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 32, 27, 0),
(82, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 36, 6, 6),
(83, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 17, 25, 10),
(84, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 10, 11, 9),
(85, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 35, 33, 9),
(86, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 11, 10, 6),
(87, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 38, 18, 6),
(88, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 3, 4, 9),
(89, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 22, 32, 9),
(90, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 5, 39, 5),
(91, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 20, 44, 4),
(92, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 49, 34, 8),
(93, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 20, 30, 1),
(94, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 46, 37, 7),
(95, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 50, 49, 0),
(96, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 13, 4, 2),
(97, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 4, 37, 5),
(98, '2020-06-04 15:15:55', '2020-06-04 15:15:55', 4, 24, 5),
(99, '2020-06-04 15:15:56', '2020-06-04 15:15:56', 26, 6, 2),
(100, '2020-06-04 15:15:56', '2020-06-04 15:15:56', 33, 26, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_logged_in` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `last_logged_in`, `created_at`, `updated_at`) VALUES
(1, 'Braxton Lesch', 'kuhn.annabelle@yahoo.com', '$2y$10$VIjWmRUlBgmHFaXiBUrUi.4TghSkh95la4QoCsoZWuJYCkMq5DILi', NULL, '2020-06-04 15:15:48', '2020-06-04 15:15:48'),
(2, 'Ms. Aubree Runte DDS', 'ariane42@yahoo.com', '$2y$10$IdJryDggIvlY8dao49oxcu0N7oNFI6qxJINNX91GxB.FiajVyWXSm', NULL, '2020-06-04 15:15:48', '2020-06-04 15:15:48'),
(3, 'Prof. Santa McDermott', 'beatty.jewell@mccullough.org', '$2y$10$ozh/5TiZxZS7S4PJjrHgPOQpcF7So5AFka8rU0ZjVfyVI/uq8YNm.', NULL, '2020-06-04 15:15:48', '2020-06-04 15:15:48'),
(4, 'Anissa Bartoletti', 'soledad.friesen@yahoo.com', '$2y$10$oF9EAitspkEqQQeROKjZJe5fXQ2x/j8VA3LNAdbgFQ/OnwygvtgeO', NULL, '2020-06-04 15:15:48', '2020-06-04 15:15:48'),
(5, 'Neva Kuphal', 'hshields@yahoo.com', '$2y$10$6WJ.6pD30qFASXPs46fD0utHDJYFBkP.ZzHbzu1tTWmcU15rDwy3.', NULL, '2020-06-04 15:15:48', '2020-06-04 15:15:48'),
(6, 'Lisette Morar Jr.', 'rjacobi@yahoo.com', '$2y$10$HRaCJYlsQLvRgT04y/zNcOJoNCIo2ajvDdKBisVPpOoVCklvlnFea', NULL, '2020-06-04 15:15:48', '2020-06-04 15:15:48'),
(7, 'Mrs. Alysson Smith PhD', 'ischimmel@yahoo.com', '$2y$10$/vJSajzzYcxjyKkCXL3edOnSJO4ZONvsmz1tcNuk8en9A83egAh.u', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(8, 'Emanuel Walker', 'abner51@hotmail.com', '$2y$10$tKu0uzkkHSoZeCLMZeA4fOq49o.zVj2cpkzh4oFfOVUmeoLSNjdHK', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(9, 'Aron Daugherty', 'crona.emerald@yahoo.com', '$2y$10$GN/GAxEh92J7miQEULxUF.i2uxVkyzekLY3BUbWjlzjQfRfEkElD2', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(10, 'Mrs. Frances Koch Jr.', 'rebekah.metz@yahoo.com', '$2y$10$0tqhlgOeO1upV/.T25Bn4e5dv3oQKH9O1EUxmKvM97c3t46TjkPCq', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(11, 'Margarita Ruecker', 'karelle.senger@gleichner.com', '$2y$10$8vurlHRHpV3gKwMso/6kY.fi3GxvOBDDHAqtzcgIRxYqq9zCvjnh.', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(12, 'Miss Jeanie Willms DVM', 'misael.crooks@yahoo.com', '$2y$10$vC7vjq8Gpr9fR6PPPRnehuFDpsFohbEqrTgJDY2Tm28xuIgM3Q1k6', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(13, 'Gregoria Walsh', 'rhea27@gmail.com', '$2y$10$h8nDP.YXNBYyQyZ/vspkgOTvoet.AGJVTZyDYJ05AEUuJ7US.BmRC', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(14, 'Sandy Sipes', 'malachi79@beatty.info', '$2y$10$AaXuLNoU5Dk0FiQVZT870uVZF2TielGCTrz/MBgnG7yiN5PITXCre', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(15, 'Kayli Fay', 'lschneider@hotmail.com', '$2y$10$BqmXvKVZ79RFIYyOqq6aA.22WOK3fQxrTlLaCjbUhdHdn4YIvPsW.', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(16, 'Furman Veum', 'delbert82@schaden.com', '$2y$10$UaOMdm5BHA6MZckMySW5XeKg3AaCqH6wb3nPx1tLTijBZrIrTWOne', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(17, 'Miss Vallie Koelpin II', 'rmaggio@jenkins.com', '$2y$10$FEW0nIcazgMeVyS7Vlcb/uhpc/WHzyIvnzzrpJB6Hk24mjKkaB/Ry', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(18, 'Kiera Windler', 'aurore.harvey@kuhn.biz', '$2y$10$4m5zA/GcZpRGgA041kHcp.nU.Buk0isl0a9r/q3H/dqCyGYakgoku', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(19, 'Miss Ressie Douglas V', 'joaquin30@friesen.com', '$2y$10$HcEGqzktoXaR/BlMVfWdKeoXBo.NuYCsY4j.Hqi0iSItYJiR1MMKy', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(20, 'Ignatius Kris', 'alexzander30@wilkinson.biz', '$2y$10$PKJKv.A9ytcHFL4yaVyZfeofNWvoM0e6DQNvCbtIatUC/5tBYfJ0.', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(21, 'Heber Block', 'zromaguera@hotmail.com', '$2y$10$ugSer0WoAyWCvnnv71H07.hyyUvLdEK19as3CdRFbUDklZhqSp.ne', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(22, 'Prof. Vern Hermann', 'camryn.stokes@senger.org', '$2y$10$6FKnxVyQGOtZyEpZHx/5f.lhf8rls7fn27O7RSfmj5zeen9xLjQkW', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(23, 'Miss Zoila Sanford IV', 'chanelle90@weber.biz', '$2y$10$YBivJM/2ikRk8y7Gy9OZSepir5L8Q000y8B2Re6XDYRZpkjiqz9Pe', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(24, 'Verlie Romaguera Sr.', 'ebruen@yahoo.com', '$2y$10$VmMYrInvRYxG/2.cucbGmuFFqFfkM9gdsWCbZNJHF8wT9N7wzXjt2', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(25, 'Karson Schaden', 'prunolfsson@gmail.com', '$2y$10$mw2y6H.Lx7WoO6x77ZNRVOpVjq9WdNYemvio7oHOfVH95Ik/egAse', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(26, 'Prof. Jeffrey Schuster', 'klocko.lyric@hahn.info', '$2y$10$/eXaV0ox6FaOd4aBxSl.HeAOApVYOMWHKAaw8FJxqakDVr0o.zC8G', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(27, 'Ms. Valentina Bins MD', 'danielle70@yahoo.com', '$2y$10$M56O5W3DQu2KMIaPbYLtPOI/utKJj8fLYp0Fz49lghkMVCzybtxXG', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(28, 'Domenico Murphy Jr.', 'rowan.corwin@hotmail.com', '$2y$10$EW0U43FZCKuBaKNqw0J4QOlq.8UyBlLIme5z.UOVdMKh7YC0WdGnS', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(29, 'Prof. Cary Prohaska DDS', 'phyllis90@bernhard.com', '$2y$10$JVfuKmvUHHF6R4T6JlULsuIQsSd6hAM8SXa.tMGhQpVf22Q826Kbe', NULL, '2020-06-04 15:15:49', '2020-06-04 15:15:49'),
(30, 'Prof. Abe Swift Jr.', 'keebler.peyton@hotmail.com', '$2y$10$4rZJK54lHypInXDcKpImg.EIiZYD9u9kvt.QRmV40UkCOuuH7ioEu', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(31, 'Laisha Kohler DVM', 'kauer@mcclure.net', '$2y$10$e2NqpqnijI5jBBEZ49Hb5eFpQumNYPEOjtLFaC9nbBpYnZGFl5m0W', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(32, 'Dr. Houston Steuber', 'abshire.miguel@hotmail.com', '$2y$10$Xwg85J0KPPVsfrJOKtIABesWnrZevGSwvueBepXNVehp7xorEP/.e', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(33, 'Maya Gibson', 'mariano38@yahoo.com', '$2y$10$xKTdhNi90SiFw2xti2fGAeb5p3iqdCvG0InB0S5X88fA7KtvWHgbK', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(34, 'Prof. Electa Mills Sr.', 'goldner.mayra@yahoo.com', '$2y$10$/4XAoCQQ4Zb5V1R4gGeHk.1SEO6WV2UacRPrl/OLW5HlBJj6LDeZu', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(35, 'Cynthia Bayer', 'john80@gutkowski.com', '$2y$10$mEIgyOFu0nyQ4nUwmfa.7ubFeveD8lVyt0Op/WDn6Bmw7vpsTEtYC', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(36, 'Ms. Lavonne Christiansen III', 'daniella81@franecki.com', '$2y$10$87JxqKVZK9Ep4vrp4hLLXuCgelk8dA9Wc5jm..pbnXYlTfs6vejpS', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(37, 'Ramiro Stanton', 'jordon20@hotmail.com', '$2y$10$yy.buo/6GFlcCzSsF2VwiuiYuQtZ8b2PB2jQH4TviztbFU6Ox.d3m', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(38, 'Michel Leuschke', 'oberbrunner.pierre@hotmail.com', '$2y$10$SDtF1qW6q4wyFbE9yJam7.T2SF5Iq3rhQjyUQHto6xzU2Hmaj3imG', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(39, 'Ms. Lauriane Jacobson', 'lauriane.mraz@hotmail.com', '$2y$10$w7OYsbMcB.KskDe.E8A/aOzxCFgd1m7gMaYXo6yttMWwaHIgAbRhS', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(40, 'Christa Bode', 'melody55@yahoo.com', '$2y$10$bv/jGGO8p37QVrP/Y0rNFOY1lK1XlWEtWdGuLxE7JA3/NzLVXiK5S', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(41, 'Ms. Dannie Parker Sr.', 'esta72@stokes.com', '$2y$10$L/Gj0oe6He1nkXf/C7KHVOAGPf3u0XrG9lfRgJjbZWx3.l7QkUmsS', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(42, 'Rylan Lakin', 'alysson11@langosh.com', '$2y$10$vVD7NLiXnp7XX/Idh4qkTuWOhYdpUB2RJFDRMoTcp2xav9YAIPVTm', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(43, 'Omari Cremin PhD', 'olson.bridget@braun.biz', '$2y$10$xit681JLgWjImt1r54147uMCgs8iW9QsLzH27tiitKdaWlDrh5r8G', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(44, 'Noel Hoeger', 'bartoletti.khalid@yahoo.com', '$2y$10$OXAl4cZiWfEJl5kdWlbyXOYyYzRt9h5NxV6N86W6setFy0JpWXSbC', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(45, 'Kendall Sauer DDS', 'bednar.vivian@pagac.com', '$2y$10$uUXxKmRgGERVnhS0y.20yuu34vWNPVgeiOF0t76LOnSOzA7qjQkDa', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(46, 'Prof. Francisca Conn PhD', 'beatrice99@friesen.com', '$2y$10$yRsGG3wdBMYzlVUehl/rDOueOwFLSRjyWL36Ld9nBEQOOZXRW3hNe', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(47, 'Alexzander Jerde II', 'dashawn.stracke@gmail.com', '$2y$10$iY9uaEO8W6ihEmsmGxgSiek1DbZRVUTr2jBH0Xq1MAIRyZULCKvTq', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(48, 'Mellie Jaskolski', 'emil54@gislason.com', '$2y$10$/WHDHpQw3ehjfWHmTJ/5aeFNmDCa7Rsh5zy0UEUKvk2zqYxL7SWPa', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(49, 'Talia Erdman', 'else87@yahoo.com', '$2y$10$e2lOvGwGMw6SquSkocZm3.6ASLAPdqxCz9GR./LuFz3zTLgXxOKqi', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50'),
(50, 'Russel Kilback', 'armand.osinski@gmail.com', '$2y$10$l.4fHammI7fD0kWSpauyV.8u87XyvhcgkilcccwRnbeFrirbxjT1y', NULL, '2020-06-04 15:15:50', '2020-06-04 15:15:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_sender_id_foreign` (`sender_id`),
  ADD KEY `ratings_recipient_id_foreign` (`recipient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ratings_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
