-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Agu 2025 pada 08.28
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bps_montify`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}', 1755048091);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_kegiatans`
--

CREATE TABLE `data_kegiatans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_tim_kerja` int(11) NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `objek_kegiatan` enum('Rumah Tangga','Usaha','Lainnya') NOT NULL,
  `periode_kegiatan` enum('Bulanan','Triwulan','Semesteran','Tahunan') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_kegiatans`
--

INSERT INTO `data_kegiatans` (`id`, `id_tim_kerja`, `nama_kegiatan`, `objek_kegiatan`, `periode_kegiatan`, `created_at`, `updated_at`) VALUES
(90, 23, 'INDUSTRI BESAR DAN SEDANG', 'Usaha', 'Bulanan', '2025-07-31 22:02:19', '2025-08-01 01:36:39'),
(91, 22, 'HARGA PRODUSEN', 'Usaha', 'Bulanan', '2025-07-31 22:04:36', '2025-08-01 01:36:29'),
(95, 30, 'SAKERNAS', 'Rumah Tangga', 'Semesteran', '2025-07-31 22:13:53', '2025-08-01 01:36:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `edit_sertifikats`
--

CREATE TABLE `edit_sertifikats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `edit_sertifikats`
--

INSERT INTO `edit_sertifikats` (`id`, `nama`, `jabatan`, `created_at`, `updated_at`) VALUES
(1, 'Ahmadriswan Nasution, S.Si., M.T.', 'Kepala Badan Pusat Statistik', '2025-05-18 10:10:44', '2025-08-01 12:56:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_06_053708_create_satuan_kerjas_table', 1),
(5, '2024_12_09_072803_create_penilaians_table', 1),
(6, '2024_12_09_073032_create_sertifikats_table', 1),
(7, '2024_12_12_015841_create_data_kegiatans_table', 1),
(8, '2024_12_12_015846_create_tim_kerjas_table', 1),
(9, '2024_12_12_042521_create_monitoring_kegiatans_table', 1),
(10, '2024_12_13_031708_create_target_realisasi_satkers_table', 1),
(11, '2024_12_13_032355_create_update_target_realisasis_table', 1),
(12, '2024_12_12_015842_create_data_kegiatans_table', 2),
(13, '2024_12_12_015843_create_data_kegiatans_table', 3),
(14, '2024_12_12_042522_create_monitoring_kegiatans_table', 4),
(15, '2024_12_12_042524_create_monitoring_kegiatans_table', 5),
(16, '2024_12_13_031709_create_target_realisasi_satkers_table', 6),
(17, '2024_12_13_031710_create_target_realisasi_satkers_table', 7),
(18, '2024_12_09_072804_create_penilaians_table', 8),
(19, '2024_12_09_073033_create_sertifikats_table', 9),
(20, '2024_12_09_073036_create_sertifikats_table', 10),
(21, '0001_01_01_000004_create_users_table', 11),
(22, '2025_02_10_093717_create_update_target_realisasis_table', 12),
(23, '2025_02_10_093718_create_update_target_realisasis_table', 13),
(24, '2024_12_09_072806_create_penilaians_table', 14),
(25, '2024_12_09_073037_create_sertifikats_table', 14),
(26, '2025_02_17_044146_create_permission_tables', 14),
(27, '0001_01_01_000006_create_users_table', 15),
(28, '2025_02_10_093719_create_update_target_realisasis_table', 16),
(29, '2025_03_25_130132_add_kondisi_column_to_update_target_realisasis_table', 17),
(30, '2024_12_12_015847_create_tim_kerjas_table', 18),
(31, '2024_12_12_015844_create_data_kegiatans_table', 19),
(32, '2024_12_12_015845_create_data_kegiatans_table', 20),
(33, '2024_12_12_042525_create_monitoring_kegiatans_table', 21),
(34, '2024_12_12_042526_create_monitoring_kegiatans_table', 22),
(35, '2024_12_12_042527_create_monitoring_kegiatans_table', 23),
(36, '2024_12_12_042528_create_monitoring_kegiatans_table', 24),
(37, '2024_12_12_042529_create_monitoring_kegiatans_table', 25),
(38, '2025_02_10_093720_create_update_target_realisasis_table', 26),
(39, '2025_05_18_160026_create_edit_sertifikats_table', 27),
(40, '2024_12_13_031712_create_target_realisasi_satkers_table', 28),
(41, '2025_02_10_093722_create_update_target_realisasis_table', 28);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `monitoring_kegiatans`
--

CREATE TABLE `monitoring_kegiatans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_kegiatan` int(11) NOT NULL,
  `kode_tim` int(11) NOT NULL,
  `waktu_mulai` date NOT NULL,
  `waktu_selesai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `monitoring_kegiatans`
--

INSERT INTO `monitoring_kegiatans` (`id`, `kode_kegiatan`, `kode_tim`, `waktu_mulai`, `waktu_selesai`, `created_at`, `updated_at`) VALUES
(120, 90, 23, '2025-08-01', '2025-08-25', '2025-07-31 22:07:25', '2025-07-31 22:07:25'),
(121, 91, 22, '2025-08-01', '2025-08-20', '2025-07-31 22:09:08', '2025-07-31 22:09:08'),
(123, 95, 30, '2025-07-01', '2025-07-31', '2025-07-31 22:15:18', '2025-08-01 13:07:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `username` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaians`
--

CREATE TABLE `penilaians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_satuan_kerja` int(11) NOT NULL,
  `periode_kinerja` varchar(255) NOT NULL,
  `nilai_kinerja` double NOT NULL,
  `peringkat` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penilaians`
--

INSERT INTO `penilaians` (`id`, `kode_satuan_kerja`, `periode_kinerja`, `nilai_kinerja`, `peringkat`, `created_at`, `updated_at`) VALUES
(181, 98, 'Juli 2025', 1, 6, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(182, 97, 'Juli 2025', 1, 7, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(183, 96, 'Juli 2025', 1.7, 3, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(184, 95, 'Juli 2025', 1, 8, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(185, 94, 'Juli 2025', 2.4, 1, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(186, 93, 'Juli 2025', 2.4, 2, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(187, 92, 'Juli 2025', 1.7, 4, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(188, 91, 'Juli 2025', 1, 9, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(189, 102, 'Juli 2025', 1, 10, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(190, 90, 'Juli 2025', 1, 11, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(191, 89, 'Juli 2025', 1, 12, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(192, 88, 'Juli 2025', 1.7, 5, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(193, 99, 'Juli 2025', 1, 13, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(194, 101, 'Juli 2025', 1, 14, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(195, 95, 'Agustus 2025', 2.5, 1, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(196, 96, 'Agustus 2025', 1, 7, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(197, 97, 'Agustus 2025', 1, 8, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(198, 98, 'Agustus 2025', 2.5, 2, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(199, 99, 'Agustus 2025', 2.5, 3, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(200, 101, 'Agustus 2025', 1, 9, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(201, 102, 'Agustus 2025', 1, 10, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(202, 94, 'Agustus 2025', 1, 11, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(203, 93, 'Agustus 2025', 2.5, 4, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(204, 92, 'Agustus 2025', 1.35, 5, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(205, 91, 'Agustus 2025', 1, 12, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(206, 90, 'Agustus 2025', 1, 13, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(207, 89, 'Agustus 2025', 1.35, 6, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(208, 88, 'Agustus 2025', 1, 14, '2025-08-12 01:21:45', '2025-08-12 01:21:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan_kerjas`
--

CREATE TABLE `satuan_kerjas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_satuan_kerja` int(11) NOT NULL,
  `nama_satuan_kerja` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `satuan_kerjas`
--

INSERT INTO `satuan_kerjas` (`id`, `kode_satuan_kerja`, `nama_satuan_kerja`, `created_at`, `updated_at`) VALUES
(88, 1801, ' LAMPUNG BARAT', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(89, 1802, ' TANGGAMUS', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(90, 1803, ' LAMPUNG SELATAN', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(91, 1804, ' LAMPUNG TIMUR', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(92, 1805, ' LAMPUNG TENGAH', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(93, 1806, ' LAMPUNG UTARA', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(94, 1807, ' WAY KANAN', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(95, 1808, ' TULANGBAWANG', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(96, 1809, ' PESAWARAN', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(97, 1810, ' PRINGSEWU', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(98, 1811, ' MESUJI', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(99, 1812, ' TULANG BAWANG BARAT', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(101, 1871, ' BANDAR LAMPUNG', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(102, 1872, ' METRO', '2025-04-11 08:09:43', '2025-04-11 08:09:43'),
(107, 1800, 'LAMPUNG', '2025-04-15 13:27:09', '2025-07-09 05:11:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sertifikats`
--

CREATE TABLE `sertifikats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomor_sertifikat` varchar(255) NOT NULL,
  `id_penilaian` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sertifikats`
--

INSERT INTO `sertifikats` (`id`, `nomor_sertifikat`, `id_penilaian`, `created_at`, `updated_at`) VALUES
(161, '1/BPS/KINERJA/VII/2025', 185, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(162, '2/BPS/KINERJA/VII/2025', 186, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(163, '3/BPS/KINERJA/VII/2025', 183, '2025-08-01 01:23:34', '2025-08-01 01:23:34'),
(164, '1/BPS/KINERJA/VIII/2025', 195, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(165, '2/BPS/KINERJA/VIII/2025', 198, '2025-08-12 01:21:45', '2025-08-12 01:21:45'),
(166, '3/BPS/KINERJA/VIII/2025', 199, '2025-08-12 01:21:45', '2025-08-12 01:21:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `target_realisasi_satkers`
--

CREATE TABLE `target_realisasi_satkers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_monitoring_kegiatan` bigint(20) UNSIGNED NOT NULL,
  `kode_satuan_kerja` int(11) NOT NULL,
  `target_satker` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `target_realisasi_satkers`
--

INSERT INTO `target_realisasi_satkers` (`id`, `id_monitoring_kegiatan`, `kode_satuan_kerja`, `target_satker`, `created_at`, `updated_at`) VALUES
(136, 120, 88, 10, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(137, 120, 89, 13, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(138, 120, 90, 15, '2025-07-31 22:07:25', '2025-07-31 22:07:25'),
(139, 120, 91, 12, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(140, 120, 92, 16, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(141, 120, 93, 11, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(142, 120, 94, 14, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(143, 120, 95, 11, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(144, 120, 96, 11, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(145, 120, 97, 12, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(146, 120, 98, 12, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(147, 120, 99, 13, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(148, 120, 101, 12, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(149, 120, 102, 14, '2025-07-31 22:07:25', '2025-08-01 06:33:21'),
(150, 121, 88, 9, '2025-07-31 22:09:08', '2025-07-31 22:09:08'),
(151, 121, 89, 7, '2025-07-31 22:09:08', '2025-07-31 22:09:08'),
(152, 121, 90, 10, '2025-07-31 22:09:08', '2025-07-31 22:09:08'),
(153, 121, 91, 2, '2025-07-31 22:09:08', '2025-07-31 22:09:08'),
(154, 121, 92, 4, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(155, 121, 93, 3, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(156, 121, 94, 3, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(157, 121, 95, 1, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(158, 121, 96, 13, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(159, 121, 97, 2, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(160, 121, 98, 1, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(161, 121, 99, 1, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(162, 121, 101, 4, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(163, 121, 102, 3, '2025-07-31 22:09:09', '2025-07-31 22:09:09'),
(165, 123, 88, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(166, 123, 89, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(167, 123, 90, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(168, 123, 91, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(169, 123, 92, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(170, 123, 93, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(171, 123, 94, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(172, 123, 95, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(173, 123, 96, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(174, 123, 97, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(175, 123, 98, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(176, 123, 99, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(177, 123, 101, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18'),
(178, 123, 102, 15, '2025-07-31 22:15:18', '2025-07-31 22:15:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tim_kerjas`
--

CREATE TABLE `tim_kerjas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_tim` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tim_kerjas`
--

INSERT INTO `tim_kerjas` (`id`, `nama_tim`, `created_at`, `updated_at`) VALUES
(20, 'NERACA WILAYAH DAN ANALISIS STATISTIK', '2025-04-15 13:17:08', '2025-08-01 01:27:16'),
(21, 'PENGOLAHAN DAN TEKNOLOGI INFORMASI', '2025-04-15 13:17:08', '2025-08-01 01:27:32'),
(22, 'STATISTIK DISTRIBUSI', '2025-04-15 13:17:08', '2025-08-01 01:27:42'),
(23, 'STATISTIK PRODUKSI', '2025-04-15 13:17:08', '2025-08-01 01:30:07'),
(30, 'STATISTIK SOSIAL', '2025-06-04 06:11:58', '2025-08-01 01:30:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `update_target_realisasis`
--

CREATE TABLE `update_target_realisasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_target_realisasi` bigint(20) UNSIGNED NOT NULL,
  `realisasi_satker` int(11) NOT NULL,
  `bukti_dukung_realisasi` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `pesan` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `update_target_realisasis`
--

INSERT INTO `update_target_realisasis` (`id`, `id_target_realisasi`, `realisasi_satker`, `bukti_dukung_realisasi`, `keterangan`, `pesan`, `status`, `created_at`, `updated_at`) VALUES
(31, 177, 2, 'bukti-dukung/D8C7vTdeh5sqLuTFzsruzlUgT2lLEzDtck7fkQGV.pdf', '-', '', 'diterima', '2025-07-31 22:18:59', '2025-07-31 23:18:50'),
(32, 177, 5, 'bukti-dukung/vOlG7QIFG1HDVBug8GJ6wqWcevD9iZ61Ps627tq1.pdf', '-', '', 'diterima', '2025-07-31 23:19:22', '2025-07-31 23:20:12'),
(33, 178, 3, 'bukti-dukung/0rCkZSx7BFoenytCMxLRBvO0FOK7ff3bbCuSjDsW.pdf', '-', '', 'diterima', '2025-07-31 23:42:49', '2025-08-01 00:07:16'),
(34, 168, 6, 'bukti-dukung/VkJsez181AMMPKN8bYWQ7WUCjedIy30iAwH1TYnm.pdf', '-', '', 'diterima', '2025-07-31 23:43:24', '2025-08-01 00:07:21'),
(35, 167, 4, 'bukti-dukung/dDWJlF8SfWzgmSH4STzbJVljBWXYJQw8LKk9XNWU.pdf', '-', '', 'diterima', '2025-07-31 23:43:55', '2025-08-01 00:07:10'),
(36, 174, 3, 'bukti-dukung/Z6wtqF7BxJPjJvc1KDVkdNfKDNjLHahOUjBlQm0n.pdf', '-', '', 'diterima', '2025-07-31 23:44:24', '2025-08-01 00:07:43'),
(37, 173, 9, 'bukti-dukung/VDqPYVN1d49ZkQj43jockx22NxtZLPte5J7Jmqg3.pdf', '-', '', 'diterima', '2025-07-31 23:44:53', '2025-08-01 00:07:40'),
(38, 176, 5, 'bukti-dukung/Sg5oydwj3B3QpSMHw6lp4gfSQsXJhTsDaNsqRq53.pdf', '-', '', 'diterima', '2025-07-31 23:46:12', '2025-08-01 00:06:57'),
(39, 166, 7, 'bukti-dukung/1c3LoCoB2JO7epmlzm6vWBY103rwWjL5hqNh3TAM.pdf', '-', '', 'diterima', '2025-07-31 23:48:20', '2025-08-01 00:07:05'),
(40, 169, 11, 'bukti-dukung/VncW5j5z7pC7Az76edJdtX5zPj9x4novw217kkz1.pdf', '-', '', 'diterima', '2025-08-01 00:01:20', '2025-08-01 00:07:25'),
(41, 172, 8, 'bukti-dukung/JpS1Z6R5HjpCnemrikRw7qDLQ7xVAHQP32EgH1VY.pdf', '-', '', 'diterima', '2025-08-01 00:03:05', '2025-08-01 00:07:37'),
(42, 170, 14, 'bukti-dukung/ksCe0CF8kj5FDakYksLcbdnWcEmCJkBmLGNhoi5x.pdf', '-', '', 'diterima', '2025-08-01 00:03:51', '2025-08-01 00:07:29'),
(43, 171, 12, 'bukti-dukung/VeBYn8yJvZV38rvcK3TqRMTfwcqFsCWvVmEPfvZ1.pdf', '-', '', 'diterima', '2025-08-01 00:04:16', '2025-08-01 00:07:33'),
(44, 175, 4, 'bukti-dukung/U9nsvYvM9gKQ1B3CqJiwlnEyday15evmMDpFYk0d.pdf', '-', '', 'diterima', '2025-08-01 00:06:19', '2025-08-01 00:07:47'),
(45, 165, 10, 'bukti-dukung/jqGDvoki945W5Dqw0BAuQ54iNdE2O7Jp1ZVecnj2.pdf', '-', '', 'diterima', '2025-08-01 00:06:43', '2025-08-01 00:07:01'),
(46, 148, 2, 'bukti-dukung/HtcWZ4485b8wr4HpceHiMhxAsoSXsd8Eqc4PZ84X.pdf', '-', '', 'diterima', '2025-08-01 15:36:32', '2025-08-01 15:50:25'),
(47, 149, 2, 'bukti-dukung/0xqalZix2ANGaU0Qvhj2xDYunWIarDM15VDyeojr.pdf', '-', '', 'diterima', '2025-08-01 15:38:21', '2025-08-01 15:50:29'),
(48, 145, 1, 'bukti-dukung/Q4nRS1v9n113B5n9443dYEYnZLJ27DuHCwX4zERM.pdf', '-', '', 'diterima', '2025-08-01 15:38:53', '2025-08-01 15:50:14'),
(49, 144, 1, 'bukti-dukung/3WaurKSv3TMwbclbDM12JXSjoGnMfindI9hD6ByQ.pdf', '-', '', 'diterima', '2025-08-01 15:39:22', '2025-08-01 15:50:09'),
(50, 137, 2, 'bukti-dukung/fxYdjr695TAiDTT4JBmUi0aGgd5DWxGCqbdXR5Tt.pdf', '-', '', 'diterima', '2025-08-01 15:39:52', '2025-08-01 15:49:37'),
(51, 136, 1, 'bukti-dukung/JhFs1CRpIWVodWEcWT939HKS4lTxqQGaSl9xjoez.pdf', '-', '', 'diterima', '2025-08-01 15:40:31', '2025-08-01 15:49:33'),
(52, 138, 3, 'bukti-dukung/B9A6vTNjgQ7FjGb3flgq6eGR92xXU1J5JyfsDQEo.pdf', '-', '', 'diterima', '2025-08-01 15:41:30', '2025-08-01 15:49:41'),
(53, 140, 2, 'bukti-dukung/mFg8C1fudzotXCWmtQ3UYELHTFKMjuv2qOtLGWMY.pdf', '-', '', 'diterima', '2025-08-01 15:42:20', '2025-08-01 15:49:48'),
(54, 142, 3, 'bukti-dukung/e6R8OkcRqLfjdtwx92bk0YN1X4IiajHdvHOJ8w96.pdf', '-', '', 'diterima', '2025-08-01 15:43:30', '2025-08-01 15:49:56'),
(55, 143, 1, 'bukti-dukung/3s7cjogRm5FaZ5HD3UEk516d8RZMJWOBqy4zUqQc.pdf', '-', '', 'diterima', '2025-08-01 15:44:06', '2025-08-01 15:49:59'),
(56, 147, 1, 'bukti-dukung/ocjLr1c0RdDMjLFqZoqNakFPdhdtH9snDFUSkGkn.pdf', '-', '', 'diterima', '2025-08-01 15:46:53', '2025-08-01 15:50:21'),
(57, 146, 1, 'bukti-dukung/BGPzzrrhRKuGM0IMv476DdUSMjN43bXv00UcfNCH.pdf', '-', '', 'diterima', '2025-08-01 15:47:27', '2025-08-01 15:50:17'),
(58, 141, 1, 'bukti-dukung/DtAY9h7cFPmnNeLW7nk6RQhcCMr7rzsJ7z7QdLoS.pdf', '-', '', 'diterima', '2025-08-01 15:47:56', '2025-08-01 15:49:52'),
(59, 139, 1, 'bukti-dukung/tfiNIOQIqscFvAwIoWjnksdu9z8AjhFSYDJbHcbP.pdf', '-', '', 'diterima', '2025-08-01 15:48:24', '2025-08-01 15:49:44'),
(60, 162, 2, 'bukti-dukung/vm0SZPH0U1HxXG7XNYZnip6BgBKuuOppBRQr7kuo.pdf', '-', '', 'diterima', '2025-08-01 15:53:56', '2025-08-01 16:06:25'),
(61, 163, 1, 'bukti-dukung/M37FGpXyRZLdIE2ldjTYnMhLsd6cfBP1XNCp9Dsp.pdf', '-', '', 'diterima', '2025-08-01 15:55:24', '2025-08-01 16:06:21'),
(62, 158, 4, 'bukti-dukung/wRgzGnBKwhHL2OQcjYq7lz9pzHe9Upe8mcCnQYbb.pdf', '-', '', 'diterima', '2025-08-01 15:56:00', '2025-08-01 16:07:01'),
(63, 159, 1, 'bukti-dukung/nKqchIjNMqneykxSSlKIL73T1nHYhq5aGoc9jQsK.pdf', '-', '', 'diterima', '2025-08-01 15:56:40', '2025-08-01 16:06:56'),
(64, 151, 5, 'bukti-dukung/EVnjW3g4KmhZFMnMIcZLo7Eol4lEm7JY6n6WMVHn.pdf', '-', '', 'diterima', '2025-08-01 15:58:56', '2025-08-01 16:05:53'),
(65, 150, 4, 'bukti-dukung/6CDCSXb45Yc1JqeoDN6NgDntX5mJiZxu298AXUAL.pdf', '-', '', 'diterima', '2025-08-01 15:59:47', '2025-08-01 16:03:29'),
(66, 152, 2, 'bukti-dukung/qymC3838osgJhu9wtoqxgMXkCnFvnp28DeVuyq5V.pdf', '-', '', 'diterima', '2025-08-01 16:00:26', '2025-08-01 16:05:58'),
(67, 154, 3, 'bukti-dukung/Q4PeJrNK4How2SA9zTKDc98tbJbi0BjLcjP3B47a.pdf', '-', '', 'diterima', '2025-08-01 16:00:51', '2025-08-01 16:06:07'),
(68, 155, 3, 'bukti-dukung/up9vMvcQdui43pvePiNLkgzPMz6WO8R8N57Czho0.pdf', '-', '', 'diterima', '2025-08-01 16:01:27', '2025-08-01 16:06:11'),
(69, 156, 1, 'bukti-dukung/YuYiK9gGEHYVNc2v1mVthR4rEmEjrEEuaTkIej0I.pdf', '-', '', 'diterima', '2025-08-01 16:01:52', '2025-08-01 16:06:15'),
(70, 157, 1, 'bukti-dukung/afBSahsuuUV858hHPejVhzKORM2YXc9TwEfOxduX.pdf', '-', '', 'diterima', '2025-08-01 16:02:22', '2025-08-01 16:07:06'),
(71, 161, 1, 'bukti-dukung/jZDEj9tjb85ESmM8WuYpIuvMnCuxejOlYs9ebRUn.pdf', '-', '', 'diterima', '2025-08-01 16:02:48', '2025-08-01 16:06:29'),
(72, 153, 1, 'bukti-dukung/w29e00OerXg71WmOnt2Gt0ptKDsRc5bn8Nr0T49T.pdf', '-', '', 'diterima', '2025-08-01 16:04:33', '2025-08-01 16:06:03'),
(73, 160, 1, 'bukti-dukung/faDEsqgnpYINkcIg8qXQnochkOT2CsGHbD1wI3TU.pdf', '-', '', 'diterima', '2025-08-01 16:05:04', '2025-08-01 16:06:51'),
(74, 170, 15, 'bukti-dukung/XeJZ9JGDzHMSOdQIwCmphFMEeWHhXBuKJQQoq5jg.pdf', '-', '', 'diterima', '2025-08-01 06:30:14', '2025-08-01 06:30:48'),
(75, 162, 3, 'bukti-dukung/n2z4JH46iT5pKhQCyN42IQPVhXmWaYq14BYvw3wp.pdf', '-', NULL, 'Menunggu Verifikasi', '2025-08-03 01:14:47', '2025-08-03 01:14:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `kode_satuan_kerja` int(11) NOT NULL,
  `kode_tim` int(11) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `kode_satuan_kerja`, `kode_tim`, `remember_token`, `created_at`, `updated_at`) VALUES
(353, 'Admin', 'admin', '$2y$12$8/bL3wSJkK7/Y9Zzm3oWB.2O/uSDbDUstnwx.NRK5y7b7JyuUOxUu', 'Admin', 107, 21, 'OJSltpH1JudRRrAA7lYdvgP5pABqp59YdYWhC4Z3QlenTk9nM1Gs4x1wiHMQ', NULL, '2025-05-21 14:34:15'),
(366, 'M', 'kabalam', '$2y$12$Q6Kh2zW6S4zHjRvfjX8LWeCW0QrNiNHgjWAhbO4oJ51blNPXvBM4G', 'Kepala BPS', 101, 21, NULL, '2025-05-21 14:34:29', '2025-05-21 14:34:29'),
(368, 'O', 'kaprov', '$2y$12$.VozR.sK.9aso.PjUT0AieHO/zAytre32XVhlYn7iq1YdLZm/UQ8O', 'Kepala BPS', 107, 21, NULL, '2025-05-21 14:34:30', '2025-05-21 14:34:30'),
(369, 'A', 'adminneraca', '$2y$12$WpJ38EAF4cpWAiizWrJnAu7gOmELWPb17C4wPEp8wtW2SICArXMGe', 'Admin Provinsi', 107, 20, NULL, '2025-05-21 14:34:30', '2025-05-21 14:34:30'),
(370, 'B', 'adminti', '$2y$12$CyDZg0Pu/SoiTtCbLu5ADuf5xnxd9aJM/E/hcoIaoY8ftNN0Ui8Si', 'Admin Provinsi', 107, 21, NULL, '2025-05-21 14:34:30', '2025-05-21 14:34:30'),
(371, 'C', 'admindistribusi', '$2y$12$Wo5uZQfgbAQc8B4TTgqpI.9EOF51D/3JNrhhnuvaaIJxcRQ12Ylo6', 'Admin Provinsi', 107, 22, NULL, '2025-05-21 14:34:31', '2025-05-21 14:34:31'),
(372, 'D', 'adminproduksi', '$2y$12$xUJfUhsO80C/M9hq2uAwJuCEBBr3SjOtE4LhALsY5N8P8wL8.SsKW', 'Admin Provinsi', 107, 23, NULL, '2025-05-21 14:34:31', '2025-07-31 23:36:07'),
(373, 'E', 'adminsosial', '$2y$12$L3x2BjF6bfisbYvXoFk/oee/v0nv7ZboB/eUvGHdy1BiNBc5S6HV.', 'Admin Provinsi', 107, 30, NULL, '2025-05-21 14:34:31', '2025-07-31 23:32:04'),
(388, 'A', 'neracalambar', '$2y$12$nQ3vwiQArLy3V5xa7/eGO.qGWJExh2xKI.yQ.EJYT1JE/9gqMEQOG', 'Operator', 88, 20, NULL, '2025-05-21 14:34:35', '2025-05-21 14:34:35'),
(389, 'B', 'neracatanggamus', '$2y$12$zzWqkK00XBVJKcQ8q7.I5eOtHBTrEglki7QEBaZLOsRvGYC0BK/KW', 'Operator', 89, 20, NULL, '2025-05-21 14:34:35', '2025-05-21 14:34:35'),
(390, 'C', 'neracalamsel', '$2y$12$WO9AexrPIlKd7H.VbV7ZCuDq2CASxOElnwbG5hiED4BeT5qXp2AAq', 'Operator', 90, 20, NULL, '2025-05-21 14:34:36', '2025-05-21 14:34:36'),
(391, 'D', 'neracalamtim', '$2y$12$A1oXwOJ2WB.dGCrNH7aeDevUKDYhvw0H63jscYBmN1yxnQz8zn4Gq', 'Operator', 91, 20, NULL, '2025-05-21 14:34:36', '2025-05-21 14:34:36'),
(392, 'E', 'neracalamteng', '$2y$12$wopyFc5Fth2/K05afvUx.Oud3C.etcCHobLMVuF.Zytqchx1tB0eS', 'Operator', 92, 20, NULL, '2025-05-21 14:34:36', '2025-05-21 14:34:36'),
(393, 'F', 'neracalamut', '$2y$12$MKuPCrUR6rWqE7IwUeGzhu.FXQz31rxvshy89y71cwgpY9hCIwY3G', 'Operator', 93, 20, NULL, '2025-05-21 14:34:36', '2025-05-21 14:34:36'),
(394, 'G', 'neracawaykanan', '$2y$12$.m8.CV/1RzsW7aQJPvBx/O4JxKseGhvlWoeHC20sPJ9JgEBJH0o4S', 'Operator', 94, 20, NULL, '2025-05-21 14:34:37', '2025-05-21 14:34:37'),
(395, 'H', 'neracatuba', '$2y$12$CWfEGwlFHp5eIXyLSO/xDODp7dBD/K8nRvHbQxqRk051f5rzGNPrC', 'Operator', 95, 20, NULL, '2025-05-21 14:34:37', '2025-05-21 14:34:37'),
(396, 'I', 'neracapesawaran', '$2y$12$Q0tEcHsxYeWfcWRs6Wdp3u8w8kHdsKVhV7nBXmwzZyJ6KGnZEv9y2', 'Operator', 96, 20, NULL, '2025-05-21 14:34:37', '2025-05-21 14:34:37'),
(397, 'J', 'neracapsw', '$2y$12$bsxBq4ui24rBrHNDK/cF3Op86dTGCjQfP2ABmMIo5e1Axx17y.b9G', 'Operator', 97, 20, NULL, '2025-05-21 14:34:37', '2025-05-21 14:34:37'),
(398, 'K', 'neracamesuji', '$2y$12$GO89rq58c9GAshCwc590i.iqp07lYACkj0FrD36TC6.nskaDMj.OO', 'Operator', 98, 20, NULL, '2025-05-21 14:34:38', '2025-05-21 14:34:38'),
(399, 'L', 'neracatubaba', '$2y$12$Bkm.tAVaHy3GVWxMQJucxu22WIx9LgPDvic15mwZQSGHm20zThE.6', 'Operator', 99, 20, NULL, '2025-05-21 14:34:38', '2025-05-21 14:34:38'),
(400, 'M', 'neracabalam', '$2y$12$096jKcTkGoApuOCrbbSvn.4NSvTkkW1QJKSmw65CnnbgaYMvgnNWu', 'Operator', 101, 20, NULL, '2025-05-21 14:34:38', '2025-05-21 14:34:38'),
(401, 'N', 'neracametro', '$2y$12$D51VGarT.mrZTVP/e0Tv8.l2donc1Vfc9TUt/uGO0QaPxDXeSVQES', 'Operator', 102, 20, NULL, '2025-05-21 14:34:38', '2025-05-21 14:34:38'),
(402, 'A', 'tilambar', '$2y$12$yao6jCVMHH1lgCMervbGl.0BWJSI8qR9p1N8to2Wk5HcQcCp/bpDu', 'Operator', 88, 21, NULL, '2025-05-21 14:34:39', '2025-05-21 14:34:39'),
(403, 'B', 'titanggamus', '$2y$12$Zu57e1FC6RvBgR42u3r2yeOAGnSo3I.BLs6ktQGFNehjhqKrPrpIG', 'Operator', 89, 21, NULL, '2025-05-21 14:34:39', '2025-05-21 14:34:39'),
(404, 'C', 'tilamsel', '$2y$12$dK4f2v1kpigHUzEON4UUpeWZO0LSFXazcLAy.hvqP2EVdaqDAI.tS', 'Operator', 90, 21, NULL, '2025-05-21 14:34:39', '2025-05-21 14:34:39'),
(405, 'D', 'tilamtim', '$2y$12$MwbqL0e9AmykV44wZmeGWuMb2re8LOhWAK6lYZHpK5EZTAH2.bxES', 'Operator', 91, 21, NULL, '2025-05-21 14:34:39', '2025-05-21 14:34:39'),
(406, 'E', 'tilamteng', '$2y$12$S2E3JVbOsWsdcQ3yFXe4vubNKdH05ZMKMVyiAni5OwG3s6b0PKNAa', 'Operator', 92, 21, NULL, '2025-05-21 14:34:40', '2025-05-21 14:34:40'),
(407, 'F', 'tilamut', '$2y$12$S27QcCGxufW/JiONCd54H.k42BuNmJn4WxxR/rUq/r2fVcHlTXLvG', 'Operator', 93, 21, NULL, '2025-05-21 14:34:40', '2025-05-21 14:34:40'),
(408, 'G', 'tiwaykanan', '$2y$12$e3Lt9TYDKz2UHym5L7gaVufSGInCRIvaATa1VkWfiEvPTzQoJxpXu', 'Operator', 94, 21, NULL, '2025-05-21 14:34:40', '2025-05-21 14:34:40'),
(409, 'H', 'tituba', '$2y$12$Af.aM9ZYXB9xpfGTUyTNv.ilmKUb6ZEyjOSoYU8sBtNisdy14z.76', 'Operator', 95, 21, NULL, '2025-05-21 14:34:40', '2025-05-21 14:34:40'),
(410, 'I', 'tipesawaran', '$2y$12$KKJswXVLQ.RPhcrsFBEoCOnDmSQkVzCiYzIfkgzu9UeQN3OC5.uMW', 'Operator', 96, 21, NULL, '2025-05-21 14:34:41', '2025-05-21 14:34:41'),
(411, 'J', 'tipsw', '$2y$12$WQo7e7zDBGhBaiROO3eGH.uJ3sVLNU722T2eWuP2NKBNvcFplSlQ2', 'Operator', 97, 21, NULL, '2025-05-21 14:34:41', '2025-05-21 14:34:41'),
(412, 'K', 'timesuji', '$2y$12$vdDgzdKPxzFeskVLoM7RYuFGv/1qQx9XYaxaafYBDHhQD3K4TdHMO', 'Operator', 98, 21, NULL, '2025-05-21 14:34:41', '2025-05-21 14:34:41'),
(413, 'L', 'titubaba', '$2y$12$W4UwF58GfY36KOiVyHDT2.BUT6VIFPF407mdO7nVF9Rj03hMrJYqG', 'Operator', 99, 21, NULL, '2025-05-21 14:34:41', '2025-05-21 14:34:41'),
(414, 'M', 'tibalam', '$2y$12$IjlrYlEi1Qg7N4DvezBk6.zsxCYfIDbEbm8ma12lE9UCu8cfT1x.6', 'Operator', 101, 21, NULL, '2025-05-21 14:34:42', '2025-05-21 14:34:42'),
(415, 'N', 'timetro', '$2y$12$eRejERtBsq6f4RsZ4XDmm.1WFCzWlqjQCBqDo.5kdUJfPyXjuh9CS', 'Operator', 102, 21, NULL, '2025-05-21 14:34:42', '2025-05-21 14:34:42'),
(416, 'A', 'distribusilambar', '$2y$12$DxfLD.hoaEy14F3xkQzv4O8e2AzclLTCk22HucUqTIuBuvygTwv2C', 'Operator', 88, 22, NULL, '2025-05-21 14:34:42', '2025-05-21 14:34:42'),
(417, 'B', 'distribusitanggamus', '$2y$12$V7/1SfMk9QNmO.Ofc6QYWe5sYbSwOnpzOo0i1D6tHUeVuJ4P5YYH6', 'Operator', 89, 22, NULL, '2025-05-21 14:34:42', '2025-05-21 14:34:42'),
(418, 'C', 'distribusilamsel', '$2y$12$EVRLMFGJgtBpLYcDjTP0Pe5VB4uR0sP3z3rkt0grv.B96/bRykbPq', 'Operator', 90, 22, NULL, '2025-05-21 14:34:43', '2025-05-21 14:34:43'),
(419, 'D', 'distribusilamtim', '$2y$12$h2eA2NimN9MiJSPiPLUSRuWBs07QCsKPb.QkpaL0C8KvqQ0go7KyW', 'Operator', 91, 22, NULL, '2025-05-21 14:34:43', '2025-05-21 14:34:43'),
(420, 'E', 'distribusilamteng', '$2y$12$OCxWMV/KUFNcrC8OPSNIB.MOsvdJTKB3pMPuBRjGqkO4YXPPbNR96', 'Operator', 92, 22, NULL, '2025-05-21 14:34:43', '2025-05-21 14:34:43'),
(421, 'F', 'distribusilamut', '$2y$12$atsXF9MOZo0GpVKqeN9g7OkKbZfc59GoFSb/XckMgYnLPAi9MsUpK', 'Operator', 93, 22, NULL, '2025-05-21 14:34:43', '2025-05-21 14:34:43'),
(422, 'G', 'distribusiwaykanan', '$2y$12$SY3GdBbQj8Ft/5CtwnkqRuUwBwUqeskmvfQi2CerLyZqUysb0iuo.', 'Operator', 94, 22, NULL, '2025-05-21 14:34:44', '2025-05-21 14:34:44'),
(423, 'H', 'distribusituba', '$2y$12$Lo4cy/p5RTkSLypiu6.bwuxXxjouBg.H9TR4PdHIDW2qH8Zq/XimC', 'Operator', 95, 22, NULL, '2025-05-21 14:34:44', '2025-05-21 14:34:44'),
(424, 'I', 'distribusipesawaran', '$2y$12$a8eeB2XjJ89zHUcaFa6rmeAlOT75hRnyHItUd1W.lAJ3NuAMDdAKG', 'Operator', 96, 22, NULL, '2025-05-21 14:34:44', '2025-05-21 14:34:44'),
(425, 'J', 'distribusipsw', '$2y$12$tR0xlOwD0tUYH8Cb17uF.OK34YBEzcfjp1hMeUeH4wuirjejVYiTq', 'Operator', 97, 22, NULL, '2025-05-21 14:34:44', '2025-05-21 14:34:44'),
(426, 'K', 'distribusimesuji', '$2y$12$HZ50Cvi3C9G1qc8xRUyI9uB5.YYsQNN/TA6hPnqYWkAW.2cMY7O5e', 'Operator', 98, 22, NULL, '2025-05-21 14:34:45', '2025-05-21 14:34:45'),
(427, 'L', 'distribusitubaba', '$2y$12$ANt1jcR5LI0.kiJzD5CIKuEJjOoCmgMJHhPH64NEIWGzeNn0JmJLC', 'Operator', 99, 22, NULL, '2025-05-21 14:34:45', '2025-05-21 14:34:45'),
(428, 'M', 'distribusibalam', '$2y$12$fmmClw/6LSL/sacN0DltlOYdOXcUKVxpNKRVfXV3SH4e9mlJyTExO', 'Operator', 101, 22, NULL, '2025-05-21 14:34:45', '2025-05-21 14:34:45'),
(429, 'N', 'distribusimetro', '$2y$12$2MP6sQuFaDyvKdZI2.ujbu9zUxd73HhqvF/6WzESBw/Yo1GZtv22e', 'Operator', 102, 22, NULL, '2025-05-21 14:34:45', '2025-05-21 14:34:45'),
(430, 'A', 'produksilambar', '$2y$12$fvnNp/CLS3NJmyLaa2DjN.lBZyyh1JqfAOFqbndcgdSkmjsknalIi', 'Operator', 88, 23, NULL, '2025-05-21 14:34:46', '2025-05-21 14:34:46'),
(431, 'B', 'produksitanggamus', '$2y$12$HKLo3yBvgUiJP7kkLE39FuUONxvMew4SS7VRPNfnr9O9QDk1.16RO', 'Operator', 89, 23, NULL, '2025-05-21 14:34:46', '2025-05-21 14:34:46'),
(432, 'C', 'produksilamsel', '$2y$12$u/z84vtevdNk8RF1TxtR2.S6LF8JCrFZqfLvbz8hXKvgxQ4G9T5RC', 'Operator', 90, 23, NULL, '2025-05-21 14:34:46', '2025-05-21 14:34:46'),
(433, 'D', 'produksilamtim', '$2y$12$M6pMTUr1zB8LCecFGEneCeaT65hrQLtqvNA6GpGtYQhUMMye7uOlC', 'Operator', 91, 23, NULL, '2025-05-21 14:34:47', '2025-05-21 14:34:47'),
(434, 'E', 'produksilamteng', '$2y$12$VzAAOOXO4uXlCnWPwDUJcOQlzcTLnzL/k65uSs7k/SVE3ZxUxoHmi', 'Operator', 92, 23, NULL, '2025-05-21 14:34:47', '2025-05-21 14:34:47'),
(435, 'F', 'produksilamut', '$2y$12$d8cpj3gVSeBkB5MO1kOXpOdzgzxNt6ucdA0ZLbzi4.TBOIzVj/UY6', 'Operator', 93, 23, NULL, '2025-05-21 14:34:47', '2025-05-21 14:34:47'),
(436, 'G', 'produksiwaykanan', '$2y$12$kyYAOJfSL3Qq1z0BrvTuReqx33kwmg98qsnTIzZ5PANnFBkWbe36.', 'Operator', 94, 23, NULL, '2025-05-21 14:34:47', '2025-05-21 14:34:47'),
(437, 'H', 'produksituba', '$2y$12$BH2XNz8ED2uJN/.mkS021.PkzjTJ2FcQECY12aI4uS1g0.itF34uK', 'Operator', 95, 23, NULL, '2025-05-21 14:34:48', '2025-05-21 14:34:48'),
(438, 'I', 'produksipesawaran', '$2y$12$vHQx56izTTxoV4qrf7.oc.3VoGBv4XqpctcjhwCdNNbAd0cO8RrKW', 'Operator', 96, 23, NULL, '2025-05-21 14:34:48', '2025-05-21 14:34:48'),
(439, 'J', 'produksipsw', '$2y$12$RiXh9tJP6HGPrbrZlkjlT.I.YE3wY7MRPs7H7Fz54Sfx3W9hXCLnq', 'Operator', 97, 23, NULL, '2025-05-21 14:34:48', '2025-05-21 14:34:48'),
(440, 'K', 'produksimesuji', '$2y$12$OXM5eA8yKxvn7DbA90niT.hRlcGtJy60a7vV3cqnBuP6QFHabQ/rq', 'Operator', 98, 23, NULL, '2025-05-21 14:34:48', '2025-05-21 14:34:48'),
(442, 'M', 'produksibalam', '$2y$12$vN8FHrmFUp1maoN.Qy3EIOBMlRRTMw8.nq3tdMZp3XC8b3eiGB4dK', 'Operator', 101, 23, NULL, '2025-05-21 14:34:49', '2025-05-21 14:34:49'),
(443, 'N', 'produksimetro', '$2y$12$E.SJvVhHfr.JkoHZZVX2vOjNybriczyOzM3E.lQeG1Q/REe1Jsyj6', 'Operator', 102, 23, NULL, '2025-05-21 14:34:49', '2025-05-21 14:34:49'),
(444, 'A', 'sosiallambar', '$2y$12$5iPWGfDh7RRM7cAjRvk09uzuTZoJ9HMDbggqgSBUdyg8ZbSVYkUVS', 'Operator', 88, 30, NULL, '2025-05-21 14:34:49', '2025-08-01 00:05:02'),
(445, 'B', 'sosialtanggamus', '$2y$12$XnWxjho15ggPX3xlQ0yeyeghusy1FUwUSj0nH6DzSMjTZ5nC5IyQ6', 'Operator', 89, 30, NULL, '2025-05-21 14:34:50', '2025-07-31 23:32:57'),
(446, 'C', 'sosiallamsel', '$2y$12$EwgYdoFnGYblYbhJXPxvquTcjdiw6myBWYU37Ej91Ot1E5IAMJ94m', 'Operator', 90, 30, NULL, '2025-05-21 14:34:50', '2025-07-31 23:33:40'),
(447, 'D', 'sosiallamtim', '$2y$12$1d9U9ylEEHT8afL7cDSt3ONox/0VMo/Z5MIH8NY.JWDl3vpRDtmqm', 'Operator', 91, 30, NULL, '2025-05-21 14:34:50', '2025-07-31 23:34:29'),
(448, 'E', 'sosiallamteng', '$2y$12$Bfhs2mTzNUULrBADcocW7Ovpk6h1AlQydjRQtf2JAdzdBfSr.FacS', 'Operator', 92, 30, NULL, '2025-05-21 14:34:50', '2025-07-31 23:35:11'),
(449, 'F', 'sosiallamut', '$2y$12$7In4toBak5OH0Y9NZ.kFheTlxBIp3yWj0Knu7V63Pb8QKwT645vV2', 'Operator', 93, 30, NULL, '2025-05-21 14:34:51', '2025-07-31 23:34:50'),
(450, 'G', 'sosialwaykanan', '$2y$12$yb6KtfODzNAmvycFn/9rx.zPbmTELZ8pBFHECAAvpDpPqQG22WF2m', 'Operator', 94, 30, NULL, '2025-05-21 14:34:51', '2025-07-31 23:33:52'),
(451, 'H', 'sosialtuba', '$2y$12$OjjKwEToeuOFxRpi1tFkeukvFFBMT4umn6.qxuQ3CyG.06099QPuy', 'Operator', 95, 30, NULL, '2025-05-21 14:34:51', '2025-07-31 23:33:24'),
(452, 'I', 'sosialpesawaran', '$2y$12$jSyfutLhhqL4eLi8WTQ9cunUwocky8sE3.LmkmSxyI7EkVofD2vM.', 'Operator', 96, 30, NULL, '2025-05-21 14:34:51', '2025-07-31 23:33:09'),
(453, 'J', 'sosialpsw', '$2y$12$csuEZcBh6PHawdla0NWf4OFNv4nBVgw3uyFb7RbHEEy2rz5ONsMw2', 'Operator', 97, 30, NULL, '2025-05-21 14:34:52', '2025-06-24 10:10:03'),
(455, 'L', 'sosialtubaba', '$2y$12$wzR71siBT4PXXdG0hElavOefU50R7YrCsf2srFd87AyTSqDl8t6iq', 'Operator', 99, 30, NULL, '2025-05-21 14:34:52', '2025-07-31 23:35:34'),
(456, 'M', 'sosialbalam', '$2y$12$CagJzSTV0SaKC6REmJ34fuetWmlIHqmxTxCvLO3c/9.WRZmvx89tS', 'Operator', 101, 30, NULL, '2025-05-21 14:34:52', '2025-07-31 22:18:33'),
(457, 'N', 'sosialmetro', '$2y$12$oWx8PVpdvHTqbVvA7dJ4luMwHUCIxG07ygwEddvNSFk/tKfzLDCuK', 'Operator', 102, 30, NULL, '2025-05-21 14:34:53', '2025-07-31 23:34:18'),
(567, 'sosialmesuji', 'sosialmesuji', '$2y$12$al81bmw0eGgjIRvLjpHKIOFyj9AJRlFUTOHVD2Vpd74u/wpLXwfuO', 'Operator', 98, 30, NULL, '2025-08-01 00:05:41', '2025-08-01 00:05:41'),
(569, 'produksi tubaba', 'produksitubaba', '$2y$12$iGxgxdN.otcad1SvIqeMd.uNXmDWJwdD.ETB2vYw5.fX0WI.w/yi6', 'Operator', 99, 23, NULL, '2025-08-01 15:45:45', '2025-08-01 15:45:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `data_kegiatans`
--
ALTER TABLE `data_kegiatans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_kegiatans_nama_kegiatan_unique` (`nama_kegiatan`);

--
-- Indeks untuk tabel `edit_sertifikats`
--
ALTER TABLE `edit_sertifikats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `edit_sertifikats_nama_unique` (`nama`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `monitoring_kegiatans`
--
ALTER TABLE `monitoring_kegiatans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `penilaians`
--
ALTER TABLE `penilaians`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `satuan_kerjas`
--
ALTER TABLE `satuan_kerjas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `satuan_kerjas_kode_satuan_kerja_unique` (`kode_satuan_kerja`);

--
-- Indeks untuk tabel `sertifikats`
--
ALTER TABLE `sertifikats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sertifikats_nomor_sertifikat_unique` (`nomor_sertifikat`),
  ADD KEY `sertifikats_id_penilaian_foreign` (`id_penilaian`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `target_realisasi_satkers`
--
ALTER TABLE `target_realisasi_satkers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_realisasi_satkers_id_monitoring_kegiatan_foreign` (`id_monitoring_kegiatan`);

--
-- Indeks untuk tabel `tim_kerjas`
--
ALTER TABLE `tim_kerjas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tim_kerjas_nama_tim_unique` (`nama_tim`);

--
-- Indeks untuk tabel `update_target_realisasis`
--
ALTER TABLE `update_target_realisasis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `update_target_realisasis_id_target_realisasi_foreign` (`id_target_realisasi`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_kegiatans`
--
ALTER TABLE `data_kegiatans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `edit_sertifikats`
--
ALTER TABLE `edit_sertifikats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `monitoring_kegiatans`
--
ALTER TABLE `monitoring_kegiatans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT untuk tabel `penilaians`
--
ALTER TABLE `penilaians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `satuan_kerjas`
--
ALTER TABLE `satuan_kerjas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT untuk tabel `sertifikats`
--
ALTER TABLE `sertifikats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT untuk tabel `target_realisasi_satkers`
--
ALTER TABLE `target_realisasi_satkers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT untuk tabel `tim_kerjas`
--
ALTER TABLE `tim_kerjas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT untuk tabel `update_target_realisasis`
--
ALTER TABLE `update_target_realisasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=571;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sertifikats`
--
ALTER TABLE `sertifikats`
  ADD CONSTRAINT `sertifikats_id_penilaian_foreign` FOREIGN KEY (`id_penilaian`) REFERENCES `penilaians` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `target_realisasi_satkers`
--
ALTER TABLE `target_realisasi_satkers`
  ADD CONSTRAINT `target_realisasi_satkers_id_monitoring_kegiatan_foreign` FOREIGN KEY (`id_monitoring_kegiatan`) REFERENCES `monitoring_kegiatans` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `update_target_realisasis`
--
ALTER TABLE `update_target_realisasis`
  ADD CONSTRAINT `update_target_realisasis_id_target_realisasi_foreign` FOREIGN KEY (`id_target_realisasi`) REFERENCES `target_realisasi_satkers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
