-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2025 a las 09:15:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `boletin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnado`
--

CREATE TABLE `alumnado` (
  `id` int(50) NOT NULL,
  `usuario_id` int(50) NOT NULL,
  `estudiante_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletín`
--

CREATE TABLE `boletín` (
  `id usuario` int(11) NOT NULL,
  `id_materias` int(11) NOT NULL,
  `id_notas` int(11) NOT NULL,
  `id_boletin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materias` int(50) NOT NULL,
  `software` int(50) NOT NULL,
  `hardware` int(50) NOT NULL,
  `programación` int(50) NOT NULL,
  `redes` int(50) NOT NULL,
  `asistencia` int(50) NOT NULL,
  `matemáticas` int(50) NOT NULL,
  `marco jurídico` int(50) NOT NULL,
  `ingles` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `informe_2` text NOT NULL,
  `informe_1` text NOT NULL,
  `informe_3` text NOT NULL,
  `nota_final` text NOT NULL,
  `id_nota` int(11) NOT NULL,
  `id_boletin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnado`
--
ALTER TABLE `alumnado`
  ADD PRIMARY KEY (`estudiante_id`);

--
-- Indices de la tabla `boletín`
--
ALTER TABLE `boletín`
  ADD PRIMARY KEY (`id_boletin`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materias`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnado`
--
ALTER TABLE `alumnado`
  ADD CONSTRAINT `alumnado_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `boletín`
--
ALTER TABLE `boletín`
  ADD CONSTRAINT `boletín_ibfk_1` FOREIGN KEY (`id_boletin`) REFERENCES `estudiante` (`id_estudiante`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `alumnado` (`estudiante_id`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_materias`) REFERENCES `notas` (`id_nota`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_nota`) REFERENCES `boletín` (`id_boletin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
