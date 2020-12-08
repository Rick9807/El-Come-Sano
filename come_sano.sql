-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla come_sano.consejos
DROP TABLE IF EXISTS `consejos`;
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
DELETE FROM `consejos`;
/*!40000 ALTER TABLE `consejos` DISABLE KEYS */;
/*!40000 ALTER TABLE `consejos` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.dietas
DROP TABLE IF EXISTS `dietas`;
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
DELETE FROM `dietas`;
/*!40000 ALTER TABLE `dietas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietas` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
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
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.historiales
DROP TABLE IF EXISTS `historiales`;
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
DELETE FROM `historiales`;
/*!40000 ALTER TABLE `historiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `historiales` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.ingredientes
DROP TABLE IF EXISTS `ingredientes`;
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.ingredientes: ~75 rows (aproximadamente)
DELETE FROM `ingredientes`;
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
	(32, 'Espinacas', 23.00, 'Planta', '', 'Si', 0.40, 3.60, 0.40, '2020-12-04 19:50:39', '2020-12-04 19:50:39'),
	(33, 'Ajo', 139.00, 'Verdura', '', 'Si', 2.21, 30.50, 0.00, '2020-12-08 02:24:22', '2020-12-08 02:24:22'),
	(34, 'Sesamo', 573.00, 'Semilla', '', 'Si', 0.30, 23.00, 0.00, '2020-12-08 02:26:52', '2020-12-08 02:26:52'),
	(35, 'Almendra', 580.00, 'Semilla', '', 'Si', 4.35, 21.55, 0.00, '2020-12-08 02:30:16', '2020-12-08 02:30:16'),
	(36, 'Comino molido', 375.00, 'Planta', '', 'Si', 0.25, 44.20, 0.00, '2020-12-08 02:34:38', '2020-12-08 02:34:38'),
	(37, 'Jugo de limon', 25.00, 'Fruta', '', 'Si', 2.50, 7.00, 0.00, '2020-12-08 02:36:26', '2020-12-08 02:36:26'),
	(38, 'Lentejas', 352.00, 'Legumbres', '', 'Si', 0.20, 63.40, 0.00, '2020-12-08 02:38:36', '2020-12-08 02:38:36'),
	(39, 'Arroz integral', 215.00, 'Grano', '', 'Si', 0.70, 44.42, 0.00, '2020-12-08 02:51:02', '2020-12-08 02:51:02'),
	(40, 'Elote', 122.00, 'Hortaliza', '', 'Si', 4.70, 29.30, 0.00, '2020-12-08 02:52:21', '2020-12-08 02:52:21'),
	(41, 'Piña', 74.00, 'Fruta', '', 'Si', 15.00, 20.00, 0.00, '2020-12-08 02:56:32', '2020-12-08 02:56:32'),
	(42, 'Queso Gouda', 356.00, 'Lacteo', '', 'No', 2.22, 2.22, 0.11, '2020-12-08 02:57:38', '2020-12-08 02:57:38'),
	(43, 'Granada', 105.00, 'Fruta', '', 'Si', 26.00, 27.00, 0.00, '2020-12-08 02:59:01', '2020-12-08 02:59:01'),
	(44, 'Pollo', 200.00, 'Carne', '', 'No', 0.00, 0.00, 83.00, '2020-12-08 03:07:31', '2020-12-08 03:07:31'),
	(45, 'Queso crema', 51.00, 'Lacteo', '', 'No', 0.03, 0.39, 16.00, '2020-12-08 03:11:27', '2020-12-08 03:11:27'),
	(46, 'Nata para cocinar', 189.00, 'Lacteo', '', 'No', 3.70, 4.40, 0.00, '2020-12-08 03:12:17', '2020-12-08 03:12:17'),
	(47, 'Kiwi', 46.00, 'Fruta', '', 'No', 6.80, 11.20, 0.00, '2020-12-08 03:21:55', '2020-12-08 03:21:55'),
	(48, 'Mango', 107.00, '107', '', 'Si', 25.00, 28.00, 0.00, '2020-12-08 03:22:54', '2020-12-08 03:22:54'),
	(49, 'Esparragos', 20.00, 'Planta', '', 'Si', 2.00, 4.00, 0.00, '2020-12-08 03:28:23', '2020-12-08 03:28:23'),
	(50, 'Queso parmesano', 392.00, 'Producto lácteo', '', 'No', 0.80, 3.22, 68.00, '2020-12-08 08:31:50', '2020-12-08 08:31:50'),
	(51, 'Caldo de pollo', 12.00, 'Condimento', '', 'No', 0.70, 1.51, 0.00, '2020-12-08 08:36:52', '2020-12-08 08:36:52'),
	(52, 'Aceite de oliva', 884.00, 'Grasa líquida', '', 'Si', 0.00, 0.00, 0.00, '2020-12-08 08:42:21', '2020-12-08 08:42:21'),
	(53, 'Tomillo', 101.00, 'Hierba', '', 'Si', 0.00, 24.50, 0.00, '2020-12-08 08:44:59', '2020-12-08 08:44:59'),
	(54, 'Pimienta negra', 0.00, 'Fruta', NULL, 'Si', 0.00, 0.06, 0.00, '2020-12-08 08:48:11', '2020-12-08 09:34:50'),
	(55, 'Lasagna', 154.00, 'Pasta', NULL, 'Si', 2.43, 17.08, 19.00, '2020-12-08 09:05:51', '2020-12-08 09:07:10'),
	(56, 'Puerro', 321.00, 'Hortaliza', '', 'Si', 0.00, 74.70, 0.00, '2020-12-08 09:09:56', '2020-12-08 09:09:56'),
	(57, 'Pimiento rojo', 26.00, 'Verdura', '', 'Si', 4.20, 6.03, 0.00, '2020-12-08 09:13:14', '2020-12-08 09:13:14'),
	(58, 'Pimiento verde', 20.00, 'Verdura', '', 'Si', 2.40, 4.64, 0.00, '2020-12-08 09:14:05', '2020-12-08 09:14:05'),
	(59, 'Orégano', 306.00, 'Hierba', NULL, 'Si', 4.09, 64.43, 0.00, '2020-12-08 09:18:32', '2020-12-08 09:50:54'),
	(60, 'Harina', 364.00, 'Harina', '', 'Si', 0.27, 76.31, 0.00, '2020-12-08 09:28:55', '2020-12-08 09:28:55'),
	(61, 'Nuez Moscada', 525.00, 'Fruta', '', 'Si', 28.49, 49.29, 0.00, '2020-12-08 09:32:20', '2020-12-08 09:32:20'),
	(62, 'Pimienta blanca', 0.00, 'Fruta', '', 'Si', 0.00, 0.03, 0.00, '2020-12-08 09:38:15', '2020-12-08 09:38:15'),
	(63, 'Cilantro', 23.00, 'Hierba', '', 'Si', 0.87, 3.67, 0.00, '2020-12-08 09:53:03', '2020-12-08 09:53:03'),
	(64, 'Chile serrano', 32.00, 'Chile', '', 'Si', 4.06, 6.70, 0.00, '2020-12-08 09:55:24', '2020-12-08 09:55:24'),
	(65, 'Guindilla', 47.20, 'Chile', '', 'Si', 0.20, 6.70, 0.00, '2020-12-08 10:23:30', '2020-12-08 10:23:30'),
	(66, 'Chorizo', 333.00, 'Embutido', '', 'No', 0.00, 2.85, 74.00, '2020-12-08 10:25:27', '2020-12-08 10:25:27'),
	(67, 'Papa', 77.00, 'Tubérculo', '', 'Si', 0.78, 17.47, 0.00, '2020-12-08 10:27:22', '2020-12-08 10:27:22'),
	(68, 'Hoja de laurel', 313.00, 'Planta', '', 'Si', 0.00, 75.00, 0.00, '2020-12-08 10:30:51', '2020-12-08 10:30:51'),
	(69, 'Cava', 75.00, 'Vino', '', 'No', 0.87, 2.58, 0.00, '2020-12-08 10:42:53', '2020-12-08 10:42:53'),
	(70, 'Alga wakame', 45.00, 'Alga comestible', '', 'Si', 0.00, 9.10, 0.00, '2020-12-08 10:45:21', '2020-12-08 10:45:21'),
	(71, 'Pan rallado', 395.00, 'Pan', '', 'Si', 6.20, 71.98, 0.00, '2020-12-08 11:07:49', '2020-12-08 11:07:49'),
	(72, 'Calabacín', 16.00, 'Hortaliza', '', 'Si', 1.73, 3.35, 0.00, '2020-12-08 11:44:38', '2020-12-08 11:44:38'),
	(73, 'Champiñones', 22.00, 'Hongo', '', 'Si', 1.65, 3.28, 0.00, '2020-12-08 11:46:14', '2020-12-08 11:46:14'),
	(74, 'Lomo de cerdo', 136.00, 'Cerdo', '', 'No', 0.00, 0.00, 66.00, '2020-12-08 12:00:02', '2020-12-08 12:00:02'),
	(75, 'Clavo de olor', 274.00, 'Hierba aromática', '', 'Si', 2.40, 65.50, 0.00, '2020-12-08 12:04:07', '2020-12-08 12:04:07');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.ingrediente_platillo
DROP TABLE IF EXISTS `ingrediente_platillo`;
CREATE TABLE IF NOT EXISTS `ingrediente_platillo` (
  `platillo_id` bigint(20) unsigned NOT NULL,
  `ingrediente_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`platillo_id`,`ingrediente_id`),
  KEY `ingrediente_platillo_ingrediente_id_foreign` (`ingrediente_id`),
  CONSTRAINT `ingrediente_platillo_ingrediente_id_foreign` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingredientes` (`id`),
  CONSTRAINT `ingrediente_platillo_platillo_id_foreign` FOREIGN KEY (`platillo_id`) REFERENCES `platillos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.ingrediente_platillo: ~173 rows (aproximadamente)
DELETE FROM `ingrediente_platillo`;
/*!40000 ALTER TABLE `ingrediente_platillo` DISABLE KEYS */;
INSERT INTO `ingrediente_platillo` (`platillo_id`, `ingrediente_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(10, 2),
	(1, 3),
	(9, 3),
	(10, 3),
	(23, 3),
	(1, 4),
	(10, 4),
	(15, 4),
	(26, 4),
	(1, 5),
	(2, 5),
	(13, 5),
	(22, 5),
	(24, 5),
	(28, 5),
	(1, 6),
	(2, 6),
	(2, 7),
	(2, 8),
	(14, 8),
	(16, 8),
	(2, 9),
	(18, 9),
	(22, 9),
	(23, 9),
	(24, 9),
	(25, 9),
	(27, 9),
	(28, 9),
	(29, 9),
	(2, 10),
	(2, 11),
	(22, 11),
	(28, 11),
	(30, 11),
	(2, 12),
	(9, 12),
	(27, 12),
	(2, 13),
	(3, 14),
	(20, 14),
	(22, 14),
	(23, 14),
	(3, 15),
	(4, 16),
	(10, 16),
	(15, 16),
	(17, 16),
	(18, 16),
	(20, 16),
	(23, 16),
	(26, 16),
	(30, 16),
	(4, 17),
	(22, 17),
	(5, 18),
	(25, 18),
	(26, 18),
	(5, 19),
	(13, 19),
	(15, 19),
	(18, 19),
	(29, 19),
	(30, 19),
	(5, 20),
	(10, 20),
	(11, 20),
	(12, 20),
	(13, 20),
	(15, 20),
	(18, 20),
	(20, 20),
	(21, 20),
	(22, 20),
	(23, 20),
	(24, 20),
	(25, 20),
	(26, 20),
	(28, 20),
	(29, 20),
	(30, 20),
	(15, 21),
	(22, 22),
	(23, 22),
	(9, 24),
	(12, 27),
	(30, 27),
	(8, 28),
	(19, 28),
	(8, 29),
	(8, 30),
	(29, 30),
	(8, 31),
	(14, 31),
	(10, 32),
	(21, 32),
	(11, 33),
	(12, 33),
	(21, 33),
	(24, 33),
	(25, 33),
	(27, 33),
	(29, 33),
	(30, 33),
	(11, 34),
	(11, 35),
	(11, 37),
	(21, 37),
	(11, 38),
	(12, 38),
	(13, 39),
	(13, 40),
	(14, 41),
	(15, 41),
	(16, 41),
	(29, 41),
	(14, 42),
	(14, 43),
	(16, 44),
	(21, 44),
	(17, 45),
	(17, 46),
	(19, 46),
	(21, 46),
	(19, 47),
	(19, 48),
	(20, 49),
	(21, 50),
	(25, 50),
	(26, 50),
	(21, 51),
	(21, 52),
	(22, 52),
	(24, 52),
	(25, 52),
	(27, 52),
	(28, 52),
	(21, 53),
	(23, 54),
	(25, 54),
	(28, 54),
	(29, 54),
	(22, 55),
	(22, 56),
	(30, 56),
	(22, 57),
	(24, 57),
	(22, 58),
	(24, 58),
	(22, 59),
	(22, 60),
	(23, 60),
	(30, 60),
	(22, 61),
	(23, 61),
	(29, 61),
	(22, 62),
	(24, 65),
	(24, 66),
	(24, 67),
	(27, 67),
	(24, 68),
	(25, 69),
	(25, 70),
	(26, 71),
	(28, 72),
	(30, 72),
	(28, 73),
	(29, 74),
	(29, 75);
/*!40000 ALTER TABLE `ingrediente_platillo` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.migrations: ~13 rows (aproximadamente)
DELETE FROM `migrations`;
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
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
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
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.platillos
DROP TABLE IF EXISTS `platillos`;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.platillos: ~30 rows (aproximadamente)
DELETE FROM `platillos`;
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
	(10, 'Tostada de jamón y huevo escalfado', 804.00, 5.50, 'Un huevo escalfado es un huevo que se ha cocinado, fuera de la cáscara, por escalfado, en lugar de hervir a fuego lento o hervir.', 'No', 39.00, 726.00, '2020-12-04 19:53:10', '2020-12-04 19:53:10'),
	(11, 'Hummus de lentejas', 257.00, 0.10, 'Delicioso hummus para una comida rapida y saludable', 'Si', 10.30, 0.00, '2020-12-08 02:42:58', '2020-12-08 02:42:58'),
	(12, 'Lentejas cocidas', 89.00, 0.40, 'Delicioso platillo sencillo para cualquier momento.', 'Si', 13.40, 0.00, '2020-12-08 02:45:48', '2020-12-08 02:45:48'),
	(13, 'Arroz con elote', 245.00, 0.90, 'Arroz para una comida sencilla acompañada con elotes', 'Si', 47.40, 0.00, '2020-12-08 02:54:44', '2020-12-08 02:54:44'),
	(14, 'Ensalada de frutas', 371.00, 8.00, 'Deliciosa ensalada para un dia con clima fresco.', 'No', 42.00, 41.00, '2020-12-08 03:01:50', '2020-12-08 03:01:50'),
	(15, 'Ensalada de pasta tropical', 723.00, 21.00, 'Ensalada con frutass y pasta para una combinacion exquisita.', 'No', 80.00, 260.00, '2020-12-08 03:05:42', '2020-12-08 03:05:42'),
	(16, 'Ensalada de pollo con manzanas', 490.00, 200.00, 'Ensalada de pollo con frutas para una comida balanceada.', 'No', 25.00, 106.00, '2020-12-08 03:09:28', '2020-12-08 03:09:28'),
	(17, 'Flan de queso', 300.00, 29.00, 'Postre para terminar cualquier comida con mucho sabor.', 'No', 32.00, 100.00, '2020-12-08 03:14:36', '2020-12-08 03:14:36'),
	(18, 'Huevo con cebolla', 89.00, 0.40, 'Platillo que se adapta para cualquier momento del dia.', 'No', 0.50, 210.00, '2020-12-08 03:17:55', '2020-12-08 03:17:55'),
	(19, 'Macedonia tropical', 48.00, 9.70, 'Deliciosa macedonia con frutas tropicales para epocas calurosas', 'No', 10.00, 0.00, '2020-12-08 03:25:34', '2020-12-08 03:25:34'),
	(20, 'Mousse de espárragos', 167.00, 2.00, 'Delicioso mousse de esparragos con pocos ingredientes para una receta economica.', 'No', 6.00, 0.00, '2020-12-08 03:30:51', '2020-12-08 03:30:51'),
	(21, 'Pollo con salsa de limón y espinacas', 530.52, 2.36, 'Plato de pollo y espinacas,  la salsa de limón y espinacas le dan un toque fascinante a las pechugas, y las hace más jugosas y sabrosas.', 'No', 18.93, 130.00, '2020-12-08 08:59:32', '2020-12-08 08:59:32'),
	(22, 'Lasaña de atún y verduras', 508.00, 8.02, 'Deliciosa lasaña de atún y verduras muy sencilla, rica y saludable.', 'No', 41.67, 31.80, '2020-12-08 09:48:58', '2020-12-08 09:50:23'),
	(23, 'Croquetas de huevos duros y atún', 374.00, 7.16, 'Plato sencillo que podemos acompañar de una ensalada.', 'No', 24.32, 168.00, '2020-12-08 10:13:00', '2020-12-08 10:13:00'),
	(24, 'Papas con chorizo a la riojana', 584.80, 7.14, 'Guiso tradicional ideal para tomar en los meses fríos porque resultan reconfortantes, son muy fáciles de preparar y gracias al chorizo y los condimentos tienen un sabor riquísimo.', 'No', 46.60, 59.00, '2020-12-08 10:34:49', '2020-12-08 10:34:49'),
	(25, 'Risotto de alga wakame al cava', 404.82, 2.15, 'El risotto es un clásico de la cocina italiana que suele complacer a la mayoría de los paladares.', 'No', 31.19, 0.00, '2020-12-08 11:01:39', '2020-12-08 11:01:39'),
	(26, 'Bolas de arroz con jamón y queso', 305.00, 0.50, 'Económico y sano, el arroz es un ingrediente que puede prepararse de muchas maneras.', 'No', 32.90, 207.00, '2020-12-08 11:12:34', '2020-12-08 11:12:34'),
	(27, 'Ensalada templada de papa', 473.00, 3.51, 'Se trata de un plato cargado de ingredientes que nos van a aportar una amplia variedad de nutrientes.', 'No', 47.37, 170.00, '2020-12-08 11:21:08', '2020-12-08 11:21:08'),
	(28, 'Canelones de calabacín rellenos', 294.00, 4.35, 'Los canelones de calabacín están buenísimos y con este relleno de queso de cabra, champiñones y tomate son irresistibles.', 'No', 7.90, 6.62, '2020-12-08 11:52:21', '2020-12-08 11:52:21'),
	(29, 'Lomo mechado con piña', 704.90, 30.60, 'Receta exótica y muy sabrosa ideal para celebraciones como Navidad o Fin de año.', 'No', 46.47, 96.70, '2020-12-08 12:08:21', '2020-12-08 12:08:21'),
	(30, 'Buñuelos de calabacín y queso fresco', 301.50, 3.97, 'Estos buñuelos ó tortitas son muy sabrosos, crujientes por fuera y suaves por dentro, ideal como aperitivo ó como un primer plato.', 'No', 23.16, 32.00, '2020-12-08 12:15:07', '2020-12-08 12:15:07');
/*!40000 ALTER TABLE `platillos` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.sessions
DROP TABLE IF EXISTS `sessions`;
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
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('Zpn6ndcY5J7cWEMix5yr4u9JyL0MVgbZkU1GusQt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoieGptVzBOcEgxRlBLRnNjRENTOVF1RTRFWHBLWnZZam1QMXU1NlpwQiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vZWwtY29tZS1zYW5vLnRlc3QvcGxhdGlsbG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFFNU2FMaVAzRHBncTZidDBrdS81Zy5Fb0VEWENzMTBuL0dwVlBhM2FKbjY2RTBmdGwwZFFlIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRRTVNhTGlQM0RwZ3E2YnQwa3UvNWcuRW9FRFhDczEwbi9HcFZQYTNhSm42NkUwZnRsMGRRZSI7fQ==', 1607429708);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.users
DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.users: ~2 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
	(1, 'Alan', 'a@a.com', NULL, '$2y$10$QMSaLiP3Dpgq6bt0ku/5g.EoEDXCs10n/GpVPa3aJn66E0ftl0dQe', NULL, NULL, NULL, NULL, NULL, '2020-12-04 07:40:22', '2020-12-04 07:40:22'),
	(2, 'Luis', 'luis@comesano.com', NULL, '$2y$10$PRlW8Ls35GH0qhiELzi9o.tyliGVulfNZdzm70S.6NTOFkk5AtKJO', NULL, NULL, NULL, NULL, NULL, '2020-12-08 02:18:19', '2020-12-08 02:18:19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.usuarios
DROP TABLE IF EXISTS `usuarios`;
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
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
