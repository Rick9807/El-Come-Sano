-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla come_sano.consejos
CREATE TABLE IF NOT EXISTS `consejos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `platillo_id` bigint(20) unsigned NOT NULL,
  `cons_contenido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.consejos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `consejos` DISABLE KEYS */;
/*!40000 ALTER TABLE `consejos` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.dietas
CREATE TABLE IF NOT EXISTS `dietas` (
  `plat_id` bigint(20) unsigned NOT NULL,
  `us_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`plat_id`,`us_id`),
  KEY `dietas_us_id_foreign` (`us_id`),
  CONSTRAINT `dietas_plat_id_foreign` FOREIGN KEY (`plat_id`) REFERENCES `platillos` (`id`),
  CONSTRAINT `dietas_us_id_foreign` FOREIGN KEY (`us_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.dietas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `dietas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietas` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.historiales
CREATE TABLE IF NOT EXISTS `historiales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `us_id` bigint(20) unsigned NOT NULL,
  `his_peso_inicial` double(8,2) NOT NULL,
  `his_peso_actual` double(8,2) NOT NULL,
  `his_altura` double(8,2) NOT NULL,
  `his_imc_inicial` double(8,2) NOT NULL,
  `his_imc_actual` double(8,2) NOT NULL,
  `his_ejerc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `his_vegano` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `his_diabetes` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `historiales_us_id_foreign` (`us_id`),
  CONSTRAINT `historiales_us_id_foreign` FOREIGN KEY (`us_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.historiales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `historiales` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.ingredientes
CREATE TABLE IF NOT EXISTS `ingredientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ingre_nombre` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingre_cal` double(8,2) NOT NULL,
  `ingre_tipo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingre_marca` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingre_vega` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingre_azucares` double(8,2) NOT NULL,
  `ingre_carbohidratos` double(8,2) NOT NULL,
  `ingre_colesterol` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.ingredientes: ~29 rows (aproximadamente)
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` (`id`, `ingre_nombre`, `ingre_cal`, `ingre_tipo`, `ingre_marca`, `ingre_vega`, `ingre_azucares`, `ingre_carbohidratos`, `ingre_colesterol`, `created_at`, `updated_at`) VALUES
	(1, 'Aguacate', 160.00, 'Fruta', '', 'Si', 0.70, 9.00, 0.00, '2020-12-04 08:50:55', '2020-12-04 08:50:55'),
	(2, 'Mayonesa', 680.00, 'Aderezo', '', 'No', 0.60, 0.60, 42.00, '2020-12-04 08:54:05', '2020-12-04 08:54:05'),
	(3, 'Pan Integral', 247.00, 'Pan', '', 'Si', 6.00, 41.00, 0.00, '2020-12-04 08:58:01', '2020-12-04 08:58:01'),
	(4, 'Jamon', 145.00, 'Cerdo', '', 'No', 0.00, 1.50, 53.00, '2020-12-04 08:59:31', '2020-12-04 08:59:31'),
	(5, 'Tomate', 18.00, 'Fruta', '', 'Si', 2.60, 3.90, 0.00, '2020-12-04 09:02:01', '2020-12-04 09:02:01'),
	(6, 'Jalapeño', 28.00, 'Picante', '', 'Si', 4.10, 7.00, 0.00, '2020-12-04 09:03:52', '2020-12-04 09:03:52'),
	(7, 'Pan Hamburguesa', 284.00, 'Pan', '', 'Si', 2.00, 46.00, 0.00, '2020-12-04 09:17:53', '2020-12-04 09:17:53'),
	(8, 'Lechuga', 15.00, 'Vegetal', '', 'Si', 0.80, 2.90, 0.00, '2020-12-04 09:20:23', '2020-12-04 09:20:23'),
	(9, 'Cebolla', 40.00, 'Vegetal', '', 'Si', 4.20, 9.00, 0.00, '2020-12-04 09:21:28', '2020-12-04 09:21:28'),
	(10, 'Pepinillos', 11.00, 'Fruta', '', 'Si', 1.10, 2.30, 0.00, '2020-12-04 09:23:23', '2020-12-04 09:23:23'),
	(11, 'Queso', 402.00, 'Producto lacteo', '', 'No', 0.50, 1.30, 105.00, '2020-12-04 09:25:24', '2020-12-04 09:25:24'),
	(12, 'Tocino', 541.00, 'Cerdo', '', 'No', 0.00, 1.40, 110.00, '2020-12-04 09:26:31', '2020-12-04 09:26:31'),
	(13, 'Carne Hamburguesa', 248.00, 'Cocinada', '', 'No', 0.00, 0.90, 86.00, '2020-12-04 09:29:55', '2020-12-04 09:29:55'),
	(14, 'Leche', 42.00, 'Bebida', '', 'No', 5.00, 5.00, 5.00, '2020-12-04 09:35:02', '2020-12-04 09:35:02'),
	(15, 'Cereal', 378.00, 'Granos', '', 'Si', 10.00, 87.00, 0.00, '2020-12-04 09:37:08', '2020-12-04 09:37:08'),
	(16, 'Huevo', 155.00, 'Gallina', '', 'No', 1.10, 1.10, 373.00, '2020-12-04 09:52:42', '2020-12-04 09:52:42'),
	(17, 'Mantequilla', 717.00, 'Producto lácteo', '', 'No', 0.10, 0.10, 215.00, '2020-12-04 09:56:35', '2020-12-04 09:56:35'),
	(18, 'Arroz', 130.00, 'Grano de cereal', '', 'Si', 0.10, 28.00, 0.00, '2020-12-04 09:59:08', '2020-12-04 09:59:08'),
	(19, 'Aceite', 884.00, 'Grasa Liquida', '', 'Si', 0.00, 0.00, 0.00, '2020-12-04 10:01:18', '2020-12-04 10:01:18'),
	(20, 'Sal', 0.00, 'condimento', '', 'Si', 0.00, 0.00, 0.00, '2020-12-04 10:04:05', '2020-12-04 10:04:05'),
	(21, 'Penne', 118.00, 'Pasta', '', 'Si', 1.90, 17.00, 12.00, '2020-12-04 10:17:21', '2020-12-04 10:17:21'),
	(22, 'Atun enlatado', 186.00, 'pez', '', 'No', 0.00, 0.00, 31.00, '2020-12-04 10:19:26', '2020-12-04 10:19:26'),
	(23, 'Salsa de tomate al pesto', 161.00, 'Salsa', '', 'Si', 8.10, 14.50, 7.00, '2020-12-04 10:21:46', '2020-12-04 10:21:46'),
	(24, 'Queso Cheddar', 402.00, 'Producto lácteo', '', 'No', 0.50, 1.30, 105.00, '2020-12-04 10:23:06', '2020-12-04 10:23:06'),
	(25, 'Tomates cherry', 18.60, 'Fruta', '', 'Si', 2.80, 4.00, 0.00, '2020-12-04 10:24:53', '2020-12-04 10:24:53'),
	(26, 'Cebollin', 30.00, 'Planta', '', 'Si', 1.90, 4.40, 0.00, '2020-12-04 19:17:11', '2020-12-04 19:17:11'),
	(27, 'Perejil', 36.00, 'Hierba', '', 'Si', 0.90, 0.60, 0.00, '2020-12-04 19:18:35', '2020-12-04 19:18:35'),
	(28, 'Platano', 89.00, 'Fruta', '', 'Si', 12.00, 23.00, 0.00, '2020-12-04 19:31:17', '2020-12-04 19:31:17'),
	(29, 'mantequilla de maní', 588.00, 'untable', '', 'Si', 9.00, 20.00, 0.00, '2020-12-04 19:33:26', '2020-12-04 19:33:26'),
	(30, 'Canela', 247.00, 'especia', '', 'Si', 2.20, 81.00, 0.00, '2020-12-04 19:34:27', '2020-12-04 19:34:27'),
	(31, 'Avena', 68.00, 'Planta', '', 'Si', 0.50, 12.00, 0.00, '2020-12-04 19:37:03', '2020-12-04 19:37:03'),
	(32, 'Espinacas', 23.00, 'Planta', '', 'Si', 0.40, 3.60, 0.40, '2020-12-04 19:50:39', '2020-12-04 19:50:39');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.ingrediente_platillo
CREATE TABLE IF NOT EXISTS `ingrediente_platillo` (
  `platillo_id` bigint(20) unsigned NOT NULL,
  `ingrediente_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`platillo_id`,`ingrediente_id`),
  KEY `ingrediente_platillo_ingrediente_id_foreign` (`ingrediente_id`),
  CONSTRAINT `ingrediente_platillo_ingrediente_id_foreign` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingredientes` (`id`),
  CONSTRAINT `ingrediente_platillo_platillo_id_foreign` FOREIGN KEY (`platillo_id`) REFERENCES `platillos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.ingrediente_platillo: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `ingrediente_platillo` DISABLE KEYS */;
INSERT INTO `ingrediente_platillo` (`platillo_id`, `ingrediente_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(10, 2),
	(1, 3),
	(9, 3),
	(10, 3),
	(1, 4),
	(10, 4),
	(1, 5),
	(2, 5),
	(1, 6),
	(2, 6),
	(2, 7),
	(2, 8),
	(2, 9),
	(2, 10),
	(2, 11),
	(2, 12),
	(9, 12),
	(2, 13),
	(3, 14),
	(3, 15),
	(4, 16),
	(10, 16),
	(4, 17),
	(5, 18),
	(5, 19),
	(5, 20),
	(10, 20),
	(9, 24),
	(8, 28),
	(8, 29),
	(8, 30),
	(8, 31),
	(10, 32);
/*!40000 ALTER TABLE `ingrediente_platillo` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.migrations: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2020_10_24_214754_create_ingredientes_table', 1),
	(7, '2020_10_28_000406_create_platillos_table', 1),
	(8, '2020_10_28_001406_create_usuarios_table', 1),
	(9, '2020_10_28_003329_create_historiales_table', 1),
	(10, '2020_10_28_004411_create_consejos_table', 1),
	(11, '2020_10_28_010155_create_dietas_table', 1),
	(12, '2020_11_06_061718_create_sessions_table', 1),
	(13, '2020_11_13_175441_create_ingrediente_platillo_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.personal_access_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.platillos
CREATE TABLE IF NOT EXISTS `platillos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plat_nombre` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_cal` double(8,2) NOT NULL,
  `plat_azucares` double(8,2) NOT NULL,
  `plat_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_vegano` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_carbohidratos` double(8,2) NOT NULL,
  `plat_colesterol` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.platillos: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `platillos` DISABLE KEYS */;
INSERT INTO `platillos` (`id`, `plat_nombre`, `plat_cal`, `plat_azucares`, `plat_desc`, `plat_vegano`, `plat_carbohidratos`, `plat_colesterol`, `created_at`, `updated_at`) VALUES
	(1, 'Sandwich de Jamon', 252.00, 3.40, 'Es un tipo de hamburguesa, a modo de tentempié, aperitivo o la comida que se suele hacer a diario​ típica de la gastronomía inglesa', 'No', 27.20, 17.00, '2020-12-04 09:08:39', '2020-12-04 09:08:39'),
	(2, 'Hamburguesa', 677.00, 12.00, 'Es un sandwich hecho a base de carne molida o de origen vegetal, aglutinada en forma de filete cocinado a la parrilla o a la plancha, aunque tambien puede freirse o hornearse.', 'No', 54.00, 87.00, '2020-12-04 09:33:10', '2020-12-04 09:45:42'),
	(3, 'Plato de Cereal', 379.00, 1.00, 'Es un desayuno tradicional elaborado con cereales procesados.', 'No', 68.00, 0.00, '2020-12-04 09:39:18', '2020-12-04 09:39:18'),
	(4, 'Revuelto de huevo', 326.00, 3.10, 'Los huevos revueltos son un plato hecho con huevos revueltos o batidos mientras se calientan suavemente, generalmente con sal, mantequilla y, a veces, con otros ingredientes.', 'No', 3.50, 609.00, '2020-12-04 09:55:29', '2020-12-04 09:56:54'),
	(5, 'Arroz Blanco', 205.00, 0.10, 'Arroz cocido al vapor o hirviendo.', 'Si', 44.50, 0.00, '2020-12-04 10:08:59', '2020-12-04 10:08:59'),
	(6, 'Pasta de pesto de atún con queso', 696.00, 5.00, 'Es una salsa originaria de Génova, la capital de Liguria, Italia.', 'No', 79.00, 27.00, '2020-12-04 10:27:29', '2020-12-04 10:27:29'),
	(7, 'Sandwich de Huevo', 849.00, 8.20, 'Un sándwich de huevo es un sándwich con una especie de relleno de huevo cocido. Los huevos fritos, los huevos revueltos, los huevos cocidos en rodajas y la ensalada de huevo son opciones populares.', 'No', 37.00, 266.00, '2020-12-04 19:22:25', '2020-12-04 19:22:25'),
	(8, 'Knock-Oats', 902.00, 36.80, 'Avena con platano', 'Si', 107.00, 0.00, '2020-12-04 19:43:07', '2020-12-04 19:43:07'),
	(9, 'Tocino y queso cheddar a la parrilla', 822.00, 6.40, 'Sandwich con alto contenido calorico', 'No', 46.00, 130.00, '2020-12-04 19:47:11', '2020-12-04 19:47:11'),
	(10, 'Tostada de jamón y huevo escalfado', 804.00, 5.50, 'Un huevo escalfado es un huevo que se ha cocinado, fuera de la cáscara, por escalfado, en lugar de hervir a fuego lento o hervir.', 'No', 39.00, 726.00, '2020-12-04 19:53:10', '2020-12-04 19:53:10');
/*!40000 ALTER TABLE `platillos` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.sessions: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('J0vjma5NjzdwjBnTUh8kguEL3ZVChRoGpjrkvt7u', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoicWd0Q1I2S2dvWXlscGpVbjZXR3hROW9mVGtvZG92Z0ZRY2pQQWxjayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9lbC1jb21lLXNhbm8udGVzdC9pbmdyZWRpZW50ZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFFNU2FMaVAzRHBncTZidDBrdS81Zy5Fb0VEWENzMTBuL0dwVlBhM2FKbjY2RTBmdGwwZFFlIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRRTVNhTGlQM0RwZ3E2YnQwa3UvNWcuRW9FRFhDczEwbi9HcFZQYTNhSm42NkUwZnRsMGRRZSI7fQ==', 1607114535);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
	(1, 'Alan', 'a@a.com', NULL, '$2y$10$QMSaLiP3Dpgq6bt0ku/5g.EoEDXCs10n/GpVPa3aJn66E0ftl0dQe', NULL, NULL, NULL, NULL, NULL, '2020-12-04 07:40:22', '2020-12-04 07:40:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `us_nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `us_apellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `us_edad` int(11) NOT NULL,
  `us_email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `us_pass` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `us_date` date NOT NULL,
  `us_genero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
