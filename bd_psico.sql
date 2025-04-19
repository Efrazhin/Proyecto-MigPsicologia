-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2025 a las 08:33:50
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
(56, 'Can view pago', 14, 'view_pago'),
(57, 'Can add codigo verificacion', 15, 'add_codigoverificacion'),
(58, 'Can change codigo verificacion', 15, 'change_codigoverificacion'),
(59, 'Can delete codigo verificacion', 15, 'delete_codigoverificacion'),
(60, 'Can view codigo verificacion', 15, 'view_codigoverificacion');

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
(15, 'myadmin', 'codigoverificacion'),
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
(1, 'myadmin', '0001_initial', '2025-04-10 07:57:14.796283'),
(2, 'contenttypes', '0001_initial', '2025-04-10 07:57:14.874411'),
(3, 'admin', '0001_initial', '2025-04-10 07:57:15.046290'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-04-10 07:57:15.061915'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-04-10 07:57:15.061915'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-04-10 07:57:15.171285'),
(7, 'auth', '0001_initial', '2025-04-10 07:57:15.452540'),
(8, 'auth', '0002_alter_permission_name_max_length', '2025-04-10 07:57:15.530663'),
(9, 'auth', '0003_alter_user_email_max_length', '2025-04-10 07:57:15.546295'),
(10, 'auth', '0004_alter_user_username_opts', '2025-04-10 07:57:15.561916'),
(11, 'auth', '0005_alter_user_last_login_null', '2025-04-10 07:57:15.561916'),
(12, 'auth', '0006_require_contenttypes_0002', '2025-04-10 07:57:15.577542'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2025-04-10 07:57:15.577542'),
(14, 'auth', '0008_alter_user_username_max_length', '2025-04-10 07:57:15.593165'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2025-04-10 07:57:15.593165'),
(16, 'auth', '0010_alter_group_name_max_length', '2025-04-10 07:57:15.624421'),
(17, 'auth', '0011_update_proxy_permissions', '2025-04-10 07:57:15.655664'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2025-04-10 07:57:15.671289'),
(19, 'myadmin', '0002_remove_servicio_duracion_min', '2025-04-10 07:57:15.718167'),
(20, 'myadmin', '0003_usuario_profile_picture', '2025-04-10 07:57:15.749414'),
(21, 'sessions', '0001_initial', '2025-04-10 07:57:15.796290'),
(22, 'myadmin', '0004_codigoverificacion', '2025-04-15 04:09:13.876149');

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
('1cg6na824yqfwnnai49wsjaup7bm7315', '.eJxVjEEOwiAQRe_C2pApDAVcuvcMhGFQqgaS0q6Md7dNutDte-__twhxXUpYe57DxOIstDj9Morpmesu-BHrvcnU6jJPJPdEHrbLa-P8uhzt30GJvWxrN2iCG2rICo1lPxreADq0kNBnQjvSYBkiJmCLnkxCcD6icVoro8TnC7k-Nn8:1u4Yqe:PADu4ZHrgPKmwwTyHIzByqaqr-PxcAwnw7biOlw4DPQ', '2025-04-29 05:28:40.084345'),
('25ctn17ac8kogmwc88jv3nhot0c0490l', 'e30:1u3TvB:ZdhV453RAG0QKzHxzKja03GbJBNe6LtiU_wIpPw0-Cg', '2025-04-26 06:00:53.552060'),
('bcwypo14qcu2onfvvm2i5yj6zhu1r2aa', 'e30:1u3TyU:e51XOyGTGYU71iFeKXX7zepRZBWAVQJlPhPihEo4ag0', '2025-04-26 06:04:18.269349'),
('ewso93ly3ccvicpfs6v501kiyqj6n96h', '.eJxVjEEOwiAQRe_C2hAYywAu3fcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnERVpx-t0jpkdsO-E7tNss0t3WZotwVedAux5nz83q4fweVev3WxiJicYo1RT2USAgpFwBGBtIDnk1WHryF4qwBbcknJoNeO2XYpCTeH9rcN3w:1u4ZnE:lCpWGxUonuv6KwLjrEUvZDTsgSv1JNOIESuDVLwfTCM', '2025-04-29 06:29:12.294277'),
('mc3lpxl2vhhs367hychvopio4xflwucl', 'eyJwcmVfMmZhX3VzZXJfaWQiOjN9:1u4Y8d:p1_1i1FJ4siI5YkRnbhwvVs5TwQ_NhMIJT2rDQSkGDk', '2025-04-29 04:43:11.065628');

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
-- Estructura de tabla para la tabla `myadmin_codigoverificacion`
--

CREATE TABLE `myadmin_codigoverificacion` (
  `id` bigint(20) NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `creado_en` datetime(6) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `myadmin_codigoverificacion`
--

INSERT INTO `myadmin_codigoverificacion` (`id`, `codigo`, `creado_en`, `usuario_id`) VALUES
(1, '496257', '2025-04-15 04:10:06.092407', 3),
(2, '443482', '2025-04-15 04:20:47.947108', 3),
(3, '394732', '2025-04-15 04:22:34.353864', 3),
(4, '892131', '2025-04-15 04:26:36.823450', 3),
(5, '209121', '2025-04-15 04:26:41.034099', 3),
(6, '259073', '2025-04-15 04:27:52.097350', 3),
(7, '484098', '2025-04-15 04:28:12.571126', 3),
(8, '590156', '2025-04-15 04:31:32.012693', 3),
(9, '744326', '2025-04-15 04:33:20.444656', 3),
(10, '569901', '2025-04-15 04:34:23.977958', 3),
(11, '715033', '2025-04-15 04:36:02.892516', 3),
(12, '795434', '2025-04-15 04:38:22.951795', 3),
(13, '715490', '2025-04-15 04:40:13.491510', 3),
(14, '769228', '2025-04-15 04:41:11.890337', 3),
(15, '817138', '2025-04-15 04:43:07.738679', 3),
(16, '696585', '2025-04-15 05:28:20.623472', 3),
(17, '811962', '2025-04-15 05:33:48.847606', 3),
(18, '748047', '2025-04-15 05:37:44.388181', 3),
(19, '393000', '2025-04-15 05:53:02.795113', 4),
(20, '550266', '2025-04-15 05:54:46.670373', 4),
(21, '411155', '2025-04-15 06:17:13.714275', 3),
(22, '387026', '2025-04-15 06:18:44.078276', 5),
(23, '171574', '2025-04-15 06:27:40.442274', 3),
(24, '937351', '2025-04-15 06:28:37.299275', 7);

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
  `is_staff` tinyint(1) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `myadmin_usuario`
--

INSERT INTO `myadmin_usuario` (`id`, `password`, `last_login`, `email`, `nombre`, `rol`, `is_active`, `is_staff`, `profile_picture`) VALUES
(1, 'ger1234', '2025-04-12 06:11:39.193273', 'germanvives40@gmail.com', 'german vives', 'admin', 1, 0, ''),
(2, 'pbkdf2_sha256$720000$VjWT353gzd1iUdlkda6ij7$Zm/wLmEVZRtqCAaTdTHlPxyFSnpSreu1aaOGYG8Rzp8=', '2025-04-12 05:54:46.452754', 'germanvives70@gmail.com', 'german vives', 'secretaria', 1, 0, 'profile_pics/Logo-Basualdo_IoTEo2G.jpeg'),
(3, 'pbkdf2_sha256$720000$NI6JTJnC8iVZxmwyBaEqaO$nnk3RZgtt/Q7acAHWzQDhnT2huH1WTN4WyriA1gD6ZQ=', '2025-04-15 06:27:55.125279', 'efrainbasualdo20@gmail.com', 'german vives', 'psicologa', 1, 0, 'profile_pics/ftoperfil_iqgo4I6.png'),
(4, 'pbkdf2_sha256$720000$VqPRSwgnxrUtPaftzhScHP$Pw1HuAqLQRqotpZ2NQooLL4oc+iSdTidvREjBW/dsq4=', '2025-04-15 05:54:59.081345', 'efrabasu@gmail.com', 'efrain re crack', 'admin', 1, 0, 'profile_pics/ftoperfil_nob38BM.png'),
(5, 'pbkdf2_sha256$720000$KtDuApcO6rCYo6EtzScYJy$ywvqu3C181iM3PvP5CnIl9GGyxSruhwh2dH46kxtigg=', '2025-04-15 06:19:59.848282', 'gonzalitoalarcon190asxs5@gmail.com', 'gonza', 'admin', 1, 0, 'profile_pics/Logo-Basualdo_gsvVFmB.jpeg'),
(7, 'pbkdf2_sha256$720000$KQePHtp2ShUH0UAwmrrMwC$7q13Hja4T2FG3CajvGi3sHrUYGTzwdlwQJuGwJhAlFA=', '2025-04-15 06:29:12.254280', 'gonzalitoalarcon1905@gmail.com', 'gonza', 'admin', 1, 0, 'profile_pics/Logo-Basualdo_E9RTcmr.jpeg');

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
-- Indices de la tabla `myadmin_codigoverificacion`
--
ALTER TABLE `myadmin_codigoverificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myadmin_codigoverifi_usuario_id_8847c3ad_fk_myadmin_u` (`usuario_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
-- AUTO_INCREMENT de la tabla `myadmin_codigoverificacion`
--
ALTER TABLE `myadmin_codigoverificacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Filtros para la tabla `myadmin_codigoverificacion`
--
ALTER TABLE `myadmin_codigoverificacion`
  ADD CONSTRAINT `myadmin_codigoverifi_usuario_id_8847c3ad_fk_myadmin_u` FOREIGN KEY (`usuario_id`) REFERENCES `myadmin_usuario` (`id`);

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
