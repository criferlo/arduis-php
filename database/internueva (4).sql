-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-03-2015 a las 03:11:33
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `internueva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE IF NOT EXISTS `archivo` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `archivo`
--

INSERT INTO `archivo` (`id`, `nombre`) VALUES
(1, '01144fc150fcd6df9359343ef0ef0674'),
(2, '38998f58b1f36ccbfdd11291205cdf37'),
(3, 'db7cf820f583e24213148a9d5384000d'),
(4, '32d9cacd47973ac31c21687c94bca798.docx'),
(5, 'eea0c8e5dbcc399190684bd174999b1a.pdf'),
(6, '2c4324c3f93c233c4c35300855536345.pdf'),
(7, 'f901c24edaacb4d4be5d3765816127cf.pdf'),
(8, 'a401907b0c4c7fa0ed610fa7b4b7b57e.docx'),
(9, '4baca105b84528cc9cfd8be5ffc8a1bb.pdf'),
(10, '58ad23a7c2b80821a94ab9ea84ea311d.docx'),
(11, '0878befaee5766daf383dad86e31e7a5.pdf'),
(12, 'c967a89bf0ca5d07b4cafe95534e3039.docx'),
(13, '6dc526f50f429ae4bf09bb4219385060.pdf'),
(14, '2cf173b5f11157a9ab54f4a4c34b5c88.pdf'),
(15, '841568ab5df1b8a09efe0df43abda664.pdf'),
(16, '39743b72268a9c8c744850c626512b32.jpg'),
(17, '0cc8541b18eae1cfc46068f96bd8f62a.jpg'),
(18, '93635616b6ce4bbcf59d451eee3bc835.jpg'),
(19, 'a700a3f108a02cf872e956cff4735e84.jpg'),
(20, '63d7b26e3c0b39b7f32f0261f227ef3e.jpg'),
(21, 'acd0147910040c61c20dfd2b0f683c00.jpg'),
(22, '9b72b00dff9a287798dec5b13294b3e8.jpg'),
(23, '5d5077a02812c0b0e5c5dd7bdf16c3ef.pdf'),
(24, 'd49f2da2c649776b2eb808bfc682d6d6.pdf'),
(25, '860a09b09074b7e83a47c3a9c579dcda.pdf'),
(26, 'c44cec0ee07c961492bd460f17a63ac9.pdf'),
(27, '76fbcaca73ee878f97c849a23db34980.pdf'),
(28, '4dfe28f8701ee1aa060e7ab9bb90dadc.pdf'),
(29, '0a0a259ea0170c0b1d15cd92e4c9296d.pdf'),
(30, 'b2cedf6848aaf3a633cc4be203694f66.pdf'),
(31, 'adde20b8b1968b522429a45e6b3d9ce5.pdf'),
(32, 'eda5227fd335e30c9f96317923ce7c55.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventointernacional`
--

CREATE TABLE IF NOT EXISTS `eventointernacional` (
`id` int(11) NOT NULL,
  `tipoinstitucion_id` int(11) NOT NULL,
  `tiposemestre_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `nombreevento` varchar(200) DEFAULT NULL,
  `tipoevento_id` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `archivo_id` int(11) NOT NULL,
  `creado_at` datetime NOT NULL,
  `programaqueregistra_id` int(11) NOT NULL,
  `registradopor` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventointernacional`
--

INSERT INTO `eventointernacional` (`id`, `tipoinstitucion_id`, `tiposemestre_id`, `fecha`, `nombreevento`, `tipoevento_id`, `descripcion`, `archivo_id`, `creado_at`, `programaqueregistra_id`, `registradopor`) VALUES
(2, 4, 2, '2015-03-13', 'yyyyy', 2, 'dsfgsdgf', 25, '2015-03-10 20:36:37', 1, ''),
(3, 1, 1, '2015-03-11', 'sdafasfd', 1, 'dsafasdf', 26, '2015-03-10 20:59:04', 1, ''),
(4, 1, 2, '2015-03-12', 'dasfsfds', 1, 'dsfdsf', 31, '2015-03-10 21:47:29', 1, 'Cristhian Lombana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE IF NOT EXISTS `idioma` (
`id` int(11) NOT NULL,
  `tiponivelingles_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `tipoinstitucion_id` int(11) NOT NULL,
  `archivo_id` int(11) NOT NULL,
  `profesor` varchar(200) DEFAULT NULL,
  `creado_at` datetime NOT NULL,
  `programaqueregistra_id` int(11) NOT NULL,
  `registradopor` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `idioma`
--

INSERT INTO `idioma` (`id`, `tiponivelingles_id`, `persona_id`, `fechainicio`, `fechafin`, `tipoinstitucion_id`, `archivo_id`, `profesor`, `creado_at`, `programaqueregistra_id`, `registradopor`) VALUES
(2, 2, 12, '2015-03-05', '2015-03-06', 1, 17, 'ewarewre', '2015-03-01 12:09:54', 1, ''),
(3, 2, 15, '2015-03-05', '2015-03-06', 1, 18, 'ewarewre', '2015-03-01 13:42:26', 1, ''),
(4, 1, 12, '2015-03-12', '2015-03-06', 4, 19, 'gfdsgdfs', '2015-03-01 13:44:25', 1, ''),
(5, 1, 12, '2015-03-03', NULL, 3, 27, 'ryeryetr', '2015-03-10 21:04:36', 1, ''),
(6, 2, 12, '2015-03-11', '2015-03-13', 1, 29, 'rewrew', '2015-03-10 21:43:07', 1, 'Cristhian Lombana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucionvinculada`
--

CREATE TABLE IF NOT EXISTS `institucionvinculada` (
`id` int(11) NOT NULL,
  `investigacion_id` int(11) NOT NULL,
  `tipoinstitucion_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `institucionvinculada`
--

INSERT INTO `institucionvinculada` (`id`, `investigacion_id`, `tipoinstitucion_id`) VALUES
(1, 3, 3),
(3, 3, 4),
(4, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `investigacion`
--

CREATE TABLE IF NOT EXISTS `investigacion` (
`id` int(11) NOT NULL,
  `tiposemestre_id` int(11) NOT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechafinesperada` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `tipoestadoinvestigacion_id` int(11) NOT NULL,
  `archivo_id` int(11) NOT NULL,
  `titulo` varchar(700) NOT NULL,
  `creado_at` datetime NOT NULL,
  `programaqueregistra_id` int(11) NOT NULL,
  `registradopor` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `investigacion`
--

INSERT INTO `investigacion` (`id`, `tiposemestre_id`, `fechainicio`, `fechafinesperada`, `fechafin`, `tipoestadoinvestigacion_id`, `archivo_id`, `titulo`, `creado_at`, `programaqueregistra_id`, `registradopor`) VALUES
(2, 1, '2015-03-10', '2015-03-13', '2015-03-12', 1, 22, 'inv2', '2015-03-01 15:03:01', 1, ''),
(3, 1, '2015-03-06', '2015-03-13', '2015-03-18', 1, 23, 'otra inv', '2015-03-04 21:00:27', 1, ''),
(4, 1, '2015-03-03', '2015-03-05', '2015-03-13', 1, 30, 'erewraew', '2015-03-10 21:45:01', 1, 'Cristhian Lombana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `tipomenu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movilidad`
--

CREATE TABLE IF NOT EXISTS `movilidad` (
`id` int(11) NOT NULL,
  `tipomovilidad_id` int(11) NOT NULL,
  `tiposemestre_id` int(11) NOT NULL,
  `fechamovilidad` date DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  `areaconocimiento` varchar(200) DEFAULT NULL,
  `nombreevento` varchar(200) DEFAULT NULL,
  `tipoinstitucion_id` int(11) NOT NULL COMMENT 'institucion destino',
  `tipofinanciacion_id` int(11) NOT NULL,
  `descripcionexperiencia` varchar(45) DEFAULT NULL,
  `archivo_id` int(11) DEFAULT NULL,
  `creado_at` datetime DEFAULT NULL,
  `programaqueregistra_id` int(11) DEFAULT NULL,
  `registradopor` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movilidad`
--

INSERT INTO `movilidad` (`id`, `tipomovilidad_id`, `tiposemestre_id`, `fechamovilidad`, `persona_id`, `areaconocimiento`, `nombreevento`, `tipoinstitucion_id`, `tipofinanciacion_id`, `descripcionexperiencia`, `archivo_id`, `creado_at`, `programaqueregistra_id`, `registradopor`) VALUES
(3, 1, 2, '2015-02-05', 12, 'nose', 'edsfdsfd', 1, 2, 'nose', NULL, '2015-02-26 20:47:58', 1, NULL),
(4, 1, 1, '2005-01-01', 12, 'dsafads', 'dsfas', 1, 1, 'sareare', 15, '2015-02-26 20:57:23', 1, NULL),
(5, 1, 1, '2015-01-01', 12, 'sdafsfd', 'dsafads', 1, 2, 'dsafas', NULL, '2015-03-10 21:19:02', 1, 'Cristhian Lombana'),
(6, 2, 2, '2015-03-06', 12, 'tsert', 'retertr', 3, 2, 'rtseter', 32, '2015-03-10 21:50:35', 1, 'Cristhian Lombana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
`id` int(11) NOT NULL,
  `identificacion` varchar(45) DEFAULT NULL,
  `tipoidentificacion_id` int(11) NOT NULL,
  `tipopersona_id` int(11) NOT NULL,
  `nombrecompleto` varchar(300) DEFAULT NULL,
  `tipoprograma_id` int(11) DEFAULT NULL,
  `archivo_id` int(11) DEFAULT NULL,
  `creado_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `identificacion`, `tipoidentificacion_id`, `tipopersona_id`, `nombrecompleto`, `tipoprograma_id`, `archivo_id`, `creado_at`) VALUES
(12, '87069371', 1, 1, 'CRISTHIAN LOMBANA', 1, 6, '2015-02-22 16:18:45'),
(13, '888', 1, 1, 'klsdjfklajf', NULL, NULL, '2015-02-22 16:22:57'),
(14, '888', 1, 1, 'klsdjfklajf', NULL, 7, '2015-02-22 16:23:11'),
(15, '453454', 1, 1, 'fdsgdfg', 1, 8, '2015-02-22 16:23:25'),
(16, '897898', 1, 1, 'hdfdg', 1, 9, '2015-02-22 16:23:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaevento`
--

CREATE TABLE IF NOT EXISTS `personaevento` (
`id` int(11) NOT NULL,
  `eventointernacional_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personaevento`
--

INSERT INTO `personaevento` (`id`, `eventointernacional_id`, `persona_id`) VALUES
(2, 3, 12),
(3, 3, 16),
(4, 3, 13),
(5, 3, 14),
(6, 3, 12),
(7, 2, 15),
(8, 4, 12),
(9, 4, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personavinculada`
--

CREATE TABLE IF NOT EXISTS `personavinculada` (
`id` int(11) NOT NULL,
  `investigacion_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personavinculada`
--

INSERT INTO `personavinculada` (`id`, `investigacion_id`, `persona_id`) VALUES
(6, 2, 12),
(7, 3, 12),
(8, 3, 13),
(9, 3, 15),
(10, 3, 12),
(11, 3, 13),
(12, 3, 12),
(13, 3, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipociudad`
--

CREATE TABLE IF NOT EXISTS `tipociudad` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `tiipopais_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipociudad`
--

INSERT INTO `tipociudad` (`id`, `nombre`, `activo`, `tiipopais_id`) VALUES
(1, 'PASTO', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoestadoinvestigacion`
--

CREATE TABLE IF NOT EXISTS `tipoestadoinvestigacion` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoestadoinvestigacion`
--

INSERT INTO `tipoestadoinvestigacion` (`id`, `nombre`, `activo`) VALUES
(1, 'INSCRITA', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoevento`
--

CREATE TABLE IF NOT EXISTS `tipoevento` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoevento`
--

INSERT INTO `tipoevento` (`id`, `nombre`, `activo`) VALUES
(1, 'PRESENCIAL', 1),
(2, 'VIRTUAL', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipofacultad`
--

CREATE TABLE IF NOT EXISTS `tipofacultad` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `tipoinstitucion_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipofacultad`
--

INSERT INTO `tipofacultad` (`id`, `nombre`, `activo`, `tipoinstitucion_id`) VALUES
(1, 'INGENIERIA', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipofinanciacion`
--

CREATE TABLE IF NOT EXISTS `tipofinanciacion` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipofinanciacion`
--

INSERT INTO `tipofinanciacion` (`id`, `nombre`, `activo`) VALUES
(1, 'UNIVERSIDAD', 1),
(2, 'GOBIERNO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

CREATE TABLE IF NOT EXISTS `tipoidentificacion` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`id`, `nombre`, `activo`) VALUES
(1, 'CEDULA', '1'),
(2, 'PASAPORTE', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoinstitucion`
--

CREATE TABLE IF NOT EXISTS `tipoinstitucion` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` varchar(45) DEFAULT NULL,
  `tipociudad_id` int(11) NOT NULL,
  `creado_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoinstitucion`
--

INSERT INTO `tipoinstitucion` (`id`, `nombre`, `activo`, `tipociudad_id`, `creado_at`) VALUES
(1, 'UNIVERSIDAD MARIANA', '1', 1, NULL),
(3, 'UDENAR', NULL, 1, '2015-02-25 19:12:14'),
(4, 'UPALOALTO', NULL, 1, '2015-02-26 20:33:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomenu`
--

CREATE TABLE IF NOT EXISTS `tipomenu` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL COMMENT 'MENU PRINCIPAL',
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipomenu`
--

INSERT INTO `tipomenu` (`id`, `nombre`, `activo`) VALUES
(1, 'MENU PRINCIPAL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomovilidad`
--

CREATE TABLE IF NOT EXISTS `tipomovilidad` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL COMMENT 'MOVILIDAD DOCENTE DESDE UNIVERSIDAD MARIANA',
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipomovilidad`
--

INSERT INTO `tipomovilidad` (`id`, `nombre`, `activo`) VALUES
(1, 'MOVILIDAD DOCENTE DESDE UMARIANA', 1),
(2, 'MOVILIDAD DOCENTE HACIA UMARIANA', 1),
(3, 'MOVILIDAD ESTUDIANTE DESDE UMARIANA', 1),
(4, 'MOVILIDAD ESTUDIANTE HACIA UMARIANA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiponivelingles`
--

CREATE TABLE IF NOT EXISTS `tiponivelingles` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiponivelingles`
--

INSERT INTO `tiponivelingles` (`id`, `nombre`, `activo`) VALUES
(1, 'A1', 1),
(2, 'A2', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopais`
--

CREATE TABLE IF NOT EXISTS `tipopais` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopais`
--

INSERT INTO `tipopais` (`id`, `nombre`, `activo`) VALUES
(1, 'COLOMBIA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersona`
--

CREATE TABLE IF NOT EXISTS `tipopersona` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL COMMENT 'DOCENTE EXTERNO',
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopersona`
--

INSERT INTO `tipopersona` (`id`, `nombre`, `activo`) VALUES
(1, 'DOCENTE EXTERNO', 1),
(2, 'DOCENTE INTERNO', 1),
(3, 'ESTUDIANTE EXTERNO', 1),
(4, 'ESTUDIANTE INTERNO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoprograma`
--

CREATE TABLE IF NOT EXISTS `tipoprograma` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `tipofacultad_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoprograma`
--

INSERT INTO `tipoprograma` (`id`, `nombre`, `activo`, `tipofacultad_id`) VALUES
(1, 'ING. SISTEMAS', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposemestre`
--

CREATE TABLE IF NOT EXISTS `tiposemestre` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL COMMENT 'semestre por año',
  `activo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposemestre`
--

INSERT INTO `tiposemestre` (`id`, `nombre`, `activo`) VALUES
(1, 'SEMESTRE 1', '1'),
(2, 'SEMESTRE 2', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE IF NOT EXISTS `tipousuario` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `nombre`, `activo`) VALUES
(1, 'ADMINISTRADOR', 1),
(2, 'DOCENTE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `tipousuario_id` int(11) NOT NULL,
  `tipoprograma_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `cedula`, `clave`, `tipousuario_id`, `tipoprograma_id`) VALUES
(1, 'Cristhian Lombana', '888', '888', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariomenu`
--

CREATE TABLE IF NOT EXISTS `usuariomenu` (
`id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivo`
--
ALTER TABLE `archivo`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventointernacional`
--
ALTER TABLE `eventointernacional`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_eventointernacional_tipoinstitucion1_idx` (`tipoinstitucion_id`), ADD KEY `fk_eventointernacional_tiposemestre1_idx` (`tiposemestre_id`), ADD KEY `fk_eventointernacional_tipoevento1_idx` (`tipoevento_id`), ADD KEY `fk_eventointernacional_archivo1_idx` (`archivo_id`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_idioma_tiponivelingles1_idx` (`tiponivelingles_id`), ADD KEY `fk_idioma_persona1_idx` (`persona_id`), ADD KEY `fk_idioma_tipoinstitucion1_idx` (`tipoinstitucion_id`), ADD KEY `fk_idioma_archivo1_idx` (`archivo_id`), ADD KEY `programaqueregistra_id` (`programaqueregistra_id`);

--
-- Indices de la tabla `institucionvinculada`
--
ALTER TABLE `institucionvinculada`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_institucionvinculada_investigacion1_idx` (`investigacion_id`), ADD KEY `fk_institucionvinculada_tipoinstitucion1_idx` (`tipoinstitucion_id`);

--
-- Indices de la tabla `investigacion`
--
ALTER TABLE `investigacion`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_investigacion_tiposemestre1_idx` (`tiposemestre_id`), ADD KEY `fk_investigacion_tipoestadoinvestigacion1_idx` (`tipoestadoinvestigacion_id`), ADD KEY `fk_investigacion_archivo1_idx` (`archivo_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_menu_menu1_idx` (`menu_id`), ADD KEY `fk_menu_tipomenu1_idx` (`tipomenu_id`);

--
-- Indices de la tabla `movilidad`
--
ALTER TABLE `movilidad`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_movilidaddocente_tipomovilidad1_idx` (`tipomovilidad_id`), ADD KEY `fk_movilidaddocente_tiposemestre1_idx` (`tiposemestre_id`), ADD KEY `fk_movilidaddocente_persona1_idx` (`persona_id`), ADD KEY `fk_movilidaddocente_tipoinstitucion1_idx` (`tipoinstitucion_id`), ADD KEY `fk_movilidaddocente_tipofinanciacion1_idx` (`tipofinanciacion_id`), ADD KEY `fk_movilidaddocente_archivo1_idx` (`archivo_id`), ADD KEY `programaqueregistra_id` (`programaqueregistra_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_persona_tipoidentificacion1_idx` (`tipoidentificacion_id`), ADD KEY `fk_persona_tipopersona1_idx` (`tipopersona_id`), ADD KEY `fk_persona_tipoprograma1_idx` (`tipoprograma_id`), ADD KEY `fk_persona_archivo1_idx` (`archivo_id`);

--
-- Indices de la tabla `personaevento`
--
ALTER TABLE `personaevento`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_personaevento_eventointernacional1_idx` (`eventointernacional_id`), ADD KEY `fk_personaevento_persona1_idx` (`persona_id`);

--
-- Indices de la tabla `personavinculada`
--
ALTER TABLE `personavinculada`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_docentevinculado_investigacion1_idx` (`investigacion_id`), ADD KEY `fk_personavinculada_persona1_idx` (`persona_id`);

--
-- Indices de la tabla `tipociudad`
--
ALTER TABLE `tipociudad`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tipociudad_tiipopais1_idx` (`tiipopais_id`);

--
-- Indices de la tabla `tipoestadoinvestigacion`
--
ALTER TABLE `tipoestadoinvestigacion`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoevento`
--
ALTER TABLE `tipoevento`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipofacultad`
--
ALTER TABLE `tipofacultad`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tipofacultad_tipoinstitucion1_idx` (`tipoinstitucion_id`);

--
-- Indices de la tabla `tipofinanciacion`
--
ALTER TABLE `tipofinanciacion`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoidentificacion`
--
ALTER TABLE `tipoidentificacion`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoinstitucion`
--
ALTER TABLE `tipoinstitucion`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tipoinstitucion_tipociudad1_idx` (`tipociudad_id`);

--
-- Indices de la tabla `tipomenu`
--
ALTER TABLE `tipomenu`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipomovilidad`
--
ALTER TABLE `tipomovilidad`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiponivelingles`
--
ALTER TABLE `tiponivelingles`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipopais`
--
ALTER TABLE `tipopais`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipopersona`
--
ALTER TABLE `tipopersona`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoprograma`
--
ALTER TABLE `tipoprograma`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tipoprograma_tipofacultad_idx` (`tipofacultad_id`);

--
-- Indices de la tabla `tiposemestre`
--
ALTER TABLE `tiposemestre`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_usuario_tipousuario1_idx` (`tipousuario_id`), ADD KEY `fk_usuario_tipoprograma1_idx` (`tipoprograma_id`);

--
-- Indices de la tabla `usuariomenu`
--
ALTER TABLE `usuariomenu`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_usuariomenu_usuario1_idx` (`usuario_id`), ADD KEY `fk_usuariomenu_menu1_idx` (`menu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivo`
--
ALTER TABLE `archivo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `eventointernacional`
--
ALTER TABLE `eventointernacional`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `institucionvinculada`
--
ALTER TABLE `institucionvinculada`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `investigacion`
--
ALTER TABLE `investigacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `movilidad`
--
ALTER TABLE `movilidad`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `personaevento`
--
ALTER TABLE `personaevento`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `personavinculada`
--
ALTER TABLE `personavinculada`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `tipociudad`
--
ALTER TABLE `tipociudad`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipoestadoinvestigacion`
--
ALTER TABLE `tipoestadoinvestigacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipoevento`
--
ALTER TABLE `tipoevento`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipofacultad`
--
ALTER TABLE `tipofacultad`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipofinanciacion`
--
ALTER TABLE `tipofinanciacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipoidentificacion`
--
ALTER TABLE `tipoidentificacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipoinstitucion`
--
ALTER TABLE `tipoinstitucion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipomenu`
--
ALTER TABLE `tipomenu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipomovilidad`
--
ALTER TABLE `tipomovilidad`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tiponivelingles`
--
ALTER TABLE `tiponivelingles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipopais`
--
ALTER TABLE `tipopais`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipopersona`
--
ALTER TABLE `tipopersona`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipoprograma`
--
ALTER TABLE `tipoprograma`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tiposemestre`
--
ALTER TABLE `tiposemestre`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuariomenu`
--
ALTER TABLE `usuariomenu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventointernacional`
--
ALTER TABLE `eventointernacional`
ADD CONSTRAINT `fk_eventointernacional_archivo1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_eventointernacional_tipoevento1` FOREIGN KEY (`tipoevento_id`) REFERENCES `tipoevento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_eventointernacional_tipoinstitucion1` FOREIGN KEY (`tipoinstitucion_id`) REFERENCES `tipoinstitucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_eventointernacional_tiposemestre1` FOREIGN KEY (`tiposemestre_id`) REFERENCES `tiposemestre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `idioma`
--
ALTER TABLE `idioma`
ADD CONSTRAINT `fk_idioma_archivo1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_idioma_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_idioma_tipoinstitucion1` FOREIGN KEY (`tipoinstitucion_id`) REFERENCES `tipoinstitucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_idioma_tiponivelingles1` FOREIGN KEY (`tiponivelingles_id`) REFERENCES `tiponivelingles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `idioma_ibfk_1` FOREIGN KEY (`programaqueregistra_id`) REFERENCES `tipoprograma` (`id`);

--
-- Filtros para la tabla `institucionvinculada`
--
ALTER TABLE `institucionvinculada`
ADD CONSTRAINT `fk_institucionvinculada_investigacion1` FOREIGN KEY (`investigacion_id`) REFERENCES `investigacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_institucionvinculada_tipoinstitucion1` FOREIGN KEY (`tipoinstitucion_id`) REFERENCES `tipoinstitucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `investigacion`
--
ALTER TABLE `investigacion`
ADD CONSTRAINT `fk_investigacion_archivo1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_investigacion_tipoestadoinvestigacion1` FOREIGN KEY (`tipoestadoinvestigacion_id`) REFERENCES `tipoestadoinvestigacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_investigacion_tiposemestre1` FOREIGN KEY (`tiposemestre_id`) REFERENCES `tiposemestre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
ADD CONSTRAINT `fk_menu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_menu_tipomenu1` FOREIGN KEY (`tipomenu_id`) REFERENCES `tipomenu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movilidad`
--
ALTER TABLE `movilidad`
ADD CONSTRAINT `fk_movilidaddocente_archivo1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_movilidaddocente_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_movilidaddocente_tipofinanciacion1` FOREIGN KEY (`tipofinanciacion_id`) REFERENCES `tipofinanciacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_movilidaddocente_tipoinstitucion1` FOREIGN KEY (`tipoinstitucion_id`) REFERENCES `tipoinstitucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_movilidaddocente_tipomovilidad1` FOREIGN KEY (`tipomovilidad_id`) REFERENCES `tipomovilidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_movilidaddocente_tiposemestre1` FOREIGN KEY (`tiposemestre_id`) REFERENCES `tiposemestre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `movilidad_ibfk_1` FOREIGN KEY (`programaqueregistra_id`) REFERENCES `tipoprograma` (`id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
ADD CONSTRAINT `fk_persona_archivo1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_persona_tipoidentificacion1` FOREIGN KEY (`tipoidentificacion_id`) REFERENCES `tipoidentificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_persona_tipopersona1` FOREIGN KEY (`tipopersona_id`) REFERENCES `tipopersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_persona_tipoprograma1` FOREIGN KEY (`tipoprograma_id`) REFERENCES `tipoprograma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personaevento`
--
ALTER TABLE `personaevento`
ADD CONSTRAINT `fk_personaevento_eventointernacional1` FOREIGN KEY (`eventointernacional_id`) REFERENCES `eventointernacional` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_personaevento_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personavinculada`
--
ALTER TABLE `personavinculada`
ADD CONSTRAINT `fk_docentevinculado_investigacion1` FOREIGN KEY (`investigacion_id`) REFERENCES `investigacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_personavinculada_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipociudad`
--
ALTER TABLE `tipociudad`
ADD CONSTRAINT `fk_tipociudad_tiipopais1` FOREIGN KEY (`tiipopais_id`) REFERENCES `tipopais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipofacultad`
--
ALTER TABLE `tipofacultad`
ADD CONSTRAINT `fk_tipofacultad_tipoinstitucion1` FOREIGN KEY (`tipoinstitucion_id`) REFERENCES `tipoinstitucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipoinstitucion`
--
ALTER TABLE `tipoinstitucion`
ADD CONSTRAINT `fk_tipoinstitucion_tipociudad1` FOREIGN KEY (`tipociudad_id`) REFERENCES `tipociudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipoprograma`
--
ALTER TABLE `tipoprograma`
ADD CONSTRAINT `fk_tipoprograma_tipofacultad` FOREIGN KEY (`tipofacultad_id`) REFERENCES `tipofacultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
ADD CONSTRAINT `fk_usuario_tipoprograma1` FOREIGN KEY (`tipoprograma_id`) REFERENCES `tipoprograma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_usuario_tipousuario1` FOREIGN KEY (`tipousuario_id`) REFERENCES `tipousuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariomenu`
--
ALTER TABLE `usuariomenu`
ADD CONSTRAINT `fk_usuariomenu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_usuariomenu_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
