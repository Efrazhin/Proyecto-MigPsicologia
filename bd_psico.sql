-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2025 a las 22:39:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_psico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add usuario', 6, 'add_usuario'),
(22, 'Can change usuario', 6, 'change_usuario'),
(23, 'Can delete usuario', 6, 'delete_usuario'),
(24, 'Can view usuario', 6, 'view_usuario'),
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add curso', 8, 'add_curso'),
(30, 'Can change curso', 8, 'change_curso'),
(31, 'Can delete curso', 8, 'delete_curso'),
(32, 'Can view curso', 8, 'view_curso'),
(33, 'Can add servicio', 9, 'add_servicio'),
(34, 'Can change servicio', 9, 'change_servicio'),
(35, 'Can delete servicio', 9, 'delete_servicio'),
(36, 'Can view servicio', 9, 'view_servicio'),
(37, 'Can add blog', 10, 'add_blog'),
(38, 'Can change blog', 10, 'change_blog'),
(39, 'Can delete blog', 10, 'delete_blog'),
(40, 'Can view blog', 10, 'view_blog'),
(41, 'Can add inscripcion curso', 11, 'add_inscripcioncurso'),
(42, 'Can change inscripcion curso', 11, 'change_inscripcioncurso'),
(43, 'Can delete inscripcion curso', 11, 'delete_inscripcioncurso'),
(44, 'Can view inscripcion curso', 11, 'view_inscripcioncurso'),
(45, 'Can add psicologo', 12, 'add_psicologo'),
(46, 'Can change psicologo', 12, 'change_psicologo'),
(47, 'Can delete psicologo', 12, 'delete_psicologo'),
(48, 'Can view psicologo', 12, 'view_psicologo'),
(49, 'Can add sesion', 13, 'add_sesion'),
(50, 'Can change sesion', 13, 'change_sesion'),
(51, 'Can delete sesion', 13, 'delete_sesion'),
(52, 'Can view sesion', 13, 'view_sesion'),
(53, 'Can add pago', 14, 'add_pago'),
(54, 'Can change pago', 14, 'change_pago'),
(55, 'Can delete pago', 14, 'delete_pago'),
(56, 'Can view pago', 14, 'view_pago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(10, 'myadmin', 'blog'),
(7, 'myadmin', 'cliente'),
(8, 'myadmin', 'curso'),
(11, 'myadmin', 'inscripcioncurso'),
(14, 'myadmin', 'pago'),
(12, 'myadmin', 'psicologo'),
(9, 'myadmin', 'servicio'),
(13, 'myadmin', 'sesion'),
(6, 'myadmin', 'usuario'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'myadmin', '0001_initial', '2025-04-09 19:57:33.620656'),
(2, 'contenttypes', '0001_initial', '2025-04-09 19:57:33.700218'),
(3, 'admin', '0001_initial', '2025-04-09 19:57:33.889157'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-04-09 19:57:33.905213'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-04-09 19:57:33.936892'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-04-09 19:57:34.130294'),
(7, 'auth', '0001_initial', '2025-04-09 19:57:34.550472'),
(8, 'auth', '0002_alter_permission_name_max_length', '2025-04-09 19:57:34.631304'),
(9, 'auth', '0003_alter_user_email_max_length', '2025-04-09 19:57:34.646932'),
(10, 'auth', '0004_alter_user_username_opts', '2025-04-09 19:57:34.662554'),
(11, 'auth', '0005_alter_user_last_login_null', '2025-04-09 19:57:34.681966'),
(12, 'auth', '0006_require_contenttypes_0002', '2025-04-09 19:57:34.685046'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2025-04-09 19:57:34.699070'),
(14, 'auth', '0008_alter_user_username_max_length', '2025-04-09 19:57:34.710621'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2025-04-09 19:57:34.715045'),
(16, 'auth', '0010_alter_group_name_max_length', '2025-04-09 19:57:34.749629'),
(17, 'auth', '0011_update_proxy_permissions', '2025-04-09 19:57:34.773786'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2025-04-09 19:57:34.773786'),
(19, 'myadmin', '0002_remove_servicio_duracion_min', '2025-04-09 19:57:34.789386'),
(20, 'sessions', '0001_initial', '2025-04-09 19:57:34.835671');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('zrih2bt8gkqfpkyrqqb1gq7gs4n78ub6', '.eJxVjDEOwjAMAP-SGUUOdUzDyN43RE7skAJqpaadEH9HlTrAene6t4m8rTVuTZc4irkaZ06_LHF-6rQLefB0n22ep3UZk90Te9hmh1n0dTvav0HlVvdtnxhSHwqlouiROwUlJOmSFFF0FCDghaFHKejJaS7gSdXJGYjIfL72KTgH:1u2c9u:zjX3TXOL_zGf3NoQMkVPYZF530-OJbhFT9evMDYUxLw', '2025-04-23 20:36:30.809111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_blog`
--

CREATE TABLE `myadmin_blog` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `contenido` longtext NOT NULL,
  `fecha_publicacion` datetime(6) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `autor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_cliente`
--

CREATE TABLE `myadmin_cliente` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_curso`
--

CREATE TABLE `myadmin_curso` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `temario` longtext DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_inscripcioncurso`
--

CREATE TABLE `myadmin_inscripcioncurso` (
  `id` bigint(20) NOT NULL,
  `fecha_inscripcion` datetime(6) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `curso_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_pago`
--

CREATE TABLE `myadmin_pago` (
  `id` bigint(20) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `fecha_pago` datetime(6) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `sesion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_psicologo`
--

CREATE TABLE `myadmin_psicologo` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `especialidad` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `usuario_admin_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_servicio`
--

CREATE TABLE `myadmin_servicio` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_sesion`
--

CREATE TABLE `myadmin_sesion` (
  `id` bigint(20) NOT NULL,
  `fecha_hora` datetime(6) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `observaciones` longtext DEFAULT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `psicologo_id` bigint(20) NOT NULL,
  `servicio_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myadmin_usuario`
--

CREATE TABLE `myadmin_usuario` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `myadmin_usuario`
--

INSERT INTO `myadmin_usuario` (`id`, `password`, `last_login`, `email`, `nombre`, `rol`, `is_active`, `is_staff`) VALUES
(1, 'pbkdf2_sha256$720000$Bw0ocUAv2YyPXKDyKbHFvB$+jpp+aMWxFI+WkR14iCvMP/QQf2B/hT0wHKEmohDpk0=', '2025-04-09 20:36:30.791822', 'efrainbasualdo20@gmail.com', 'efrain', 'secretaria', 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_myadmin_usuario_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `myadmin_blog`
--
ALTER TABLE `myadmin_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myadmin_blog_autor_id_fee9d4e0_fk_myadmin_usuario_id` (`autor_id`);

--
-- Indices de la tabla `myadmin_cliente`
--
ALTER TABLE `myadmin_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `myadmin_curso`
--
ALTER TABLE `myadmin_curso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `myadmin_inscripcioncurso`
--
ALTER TABLE `myadmin_inscripcioncurso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myadmin_inscripcionc_cliente_id_6e640baf_fk_myadmin_c` (`cliente_id`),
  ADD KEY `myadmin_inscripcioncurso_curso_id_c4ebb324_fk_myadmin_curso_id` (`curso_id`);

--
-- Indices de la tabla `myadmin_pago`
--
ALTER TABLE `myadmin_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myadmin_pago_cliente_id_faa64803_fk_myadmin_cliente_id` (`cliente_id`),
  ADD KEY `myadmin_pago_sesion_id_c387508c_fk_myadmin_sesion_id` (`sesion_id`);

--
-- Indices de la tabla `myadmin_psicologo`
--
ALTER TABLE `myadmin_psicologo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myadmin_psicologo_usuario_admin_id_fc31bf35_fk_myadmin_u` (`usuario_admin_id`);

--
-- Indices de la tabla `myadmin_servicio`
--
ALTER TABLE `myadmin_servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `myadmin_sesion`
--
ALTER TABLE `myadmin_sesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myadmin_sesion_cliente_id_42535318_fk_myadmin_cliente_id` (`cliente_id`),
  ADD KEY `myadmin_sesion_psicologo_id_430a2ae7_fk_myadmin_psicologo_id` (`psicologo_id`),
  ADD KEY `myadmin_sesion_servicio_id_2ead27ae_fk_myadmin_servicio_id` (`servicio_id`);

--
-- Indices de la tabla `myadmin_usuario`
--
ALTER TABLE `myadmin_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `myadmin_blog`
--
ALTER TABLE `myadmin_blog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `myadmin_cliente`
--
ALTER TABLE `myadmin_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `myadmin_curso`
--
ALTER TABLE `myadmin_curso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `myadmin_inscripcioncurso`
--
ALTER TABLE `myadmin_inscripcioncurso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `myadmin_pago`
--
ALTER TABLE `myadmin_pago`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `myadmin_psicologo`
--
ALTER TABLE `myadmin_psicologo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `myadmin_servicio`
--
ALTER TABLE `myadmin_servicio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `myadmin_sesion`
--
ALTER TABLE `myadmin_sesion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `myadmin_usuario`
--
ALTER TABLE `myadmin_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_myadmin_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `myadmin_usuario` (`id`);

--
-- Filtros para la tabla `myadmin_blog`
--
ALTER TABLE `myadmin_blog`
  ADD CONSTRAINT `myadmin_blog_autor_id_fee9d4e0_fk_myadmin_usuario_id` FOREIGN KEY (`autor_id`) REFERENCES `myadmin_usuario` (`id`);

--
-- Filtros para la tabla `myadmin_inscripcioncurso`
--
ALTER TABLE `myadmin_inscripcioncurso`
  ADD CONSTRAINT `myadmin_inscripcionc_cliente_id_6e640baf_fk_myadmin_c` FOREIGN KEY (`cliente_id`) REFERENCES `myadmin_cliente` (`id`),
  ADD CONSTRAINT `myadmin_inscripcioncurso_curso_id_c4ebb324_fk_myadmin_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `myadmin_curso` (`id`);

--
-- Filtros para la tabla `myadmin_pago`
--
ALTER TABLE `myadmin_pago`
  ADD CONSTRAINT `myadmin_pago_cliente_id_faa64803_fk_myadmin_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `myadmin_cliente` (`id`),
  ADD CONSTRAINT `myadmin_pago_sesion_id_c387508c_fk_myadmin_sesion_id` FOREIGN KEY (`sesion_id`) REFERENCES `myadmin_sesion` (`id`);

--
-- Filtros para la tabla `myadmin_psicologo`
--
ALTER TABLE `myadmin_psicologo`
  ADD CONSTRAINT `myadmin_psicologo_usuario_admin_id_fc31bf35_fk_myadmin_u` FOREIGN KEY (`usuario_admin_id`) REFERENCES `myadmin_usuario` (`id`);

--
-- Filtros para la tabla `myadmin_sesion`
--
ALTER TABLE `myadmin_sesion`
  ADD CONSTRAINT `myadmin_sesion_cliente_id_42535318_fk_myadmin_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `myadmin_cliente` (`id`),
  ADD CONSTRAINT `myadmin_sesion_psicologo_id_430a2ae7_fk_myadmin_psicologo_id` FOREIGN KEY (`psicologo_id`) REFERENCES `myadmin_psicologo` (`id`),
  ADD CONSTRAINT `myadmin_sesion_servicio_id_2ead27ae_fk_myadmin_servicio_id` FOREIGN KEY (`servicio_id`) REFERENCES `myadmin_servicio` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
