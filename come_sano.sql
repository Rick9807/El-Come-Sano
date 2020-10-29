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
  `plat_id` bigint(20) unsigned NOT NULL,
  `cons_contenido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consejos_plat_id_foreign` (`plat_id`),
  CONSTRAINT `consejos_plat_id_foreign` FOREIGN KEY (`plat_id`) REFERENCES `platillos` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.ingredientes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
REPLACE INTO `ingredientes` (`id`, `ingre_nombre`, `ingre_cal`, `ingre_tipo`, `ingre_marca`, `ingre_vega`, `ingre_azucares`, `ingre_carbohidratos`, `ingre_colesterol`, `created_at`, `updated_at`) VALUES
	(2, 'Lechuga', 15.00, 'Verdura', NULL, 'Si', 0.80, 2.90, 0.00, '2020-10-28 07:12:06', '2020-10-28 07:12:06'),
	(3, 'Pepino', 16.00, 'Verdura', NULL, 'Si', 1.67, 2.00, 0.00, '2020-10-28 17:33:04', '2020-10-29 21:54:00');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.migrations: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2020_10_24_214754_create_ingredientes_table', 1),
	(2, '2020_10_28_000406_create_platillos_table', 1),
	(3, '2020_10_28_001406_create_usuarios_table', 1),
	(4, '2020_10_28_003329_create_historiales_table', 1),
	(5, '2020_10_28_004411_create_consejos_table', 1),
	(6, '2020_10_28_010155_create_dietas_table', 1),
	(7, '2020_10_28_010359_create_platillos_ingredientes_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.platillos
CREATE TABLE IF NOT EXISTS `platillos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plat_cal` double(8,2) NOT NULL,
  `plat_azucares` double(8,2) NOT NULL,
  `plat_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_vegano` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat_carbohidratos` double(8,2) NOT NULL,
  `plat_colesterol` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.platillos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `platillos` DISABLE KEYS */;
/*!40000 ALTER TABLE `platillos` ENABLE KEYS */;

-- Volcando estructura para tabla come_sano.platillos_ingredientes
CREATE TABLE IF NOT EXISTS `platillos_ingredientes` (
  `plat_id` bigint(20) unsigned NOT NULL,
  `ingre_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`plat_id`,`ingre_id`),
  KEY `platillos_ingredientes_ingre_id_foreign` (`ingre_id`),
  CONSTRAINT `platillos_ingredientes_ingre_id_foreign` FOREIGN KEY (`ingre_id`) REFERENCES `ingredientes` (`id`),
  CONSTRAINT `platillos_ingredientes_plat_id_foreign` FOREIGN KEY (`plat_id`) REFERENCES `platillos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla come_sano.platillos_ingredientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `platillos_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `platillos_ingredientes` ENABLE KEYS */;

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
