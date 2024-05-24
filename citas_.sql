-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2024 a las 00:38:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citas_`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendar_citas`
--

CREATE TABLE `agendar_citas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `especialidad` varchar(255) NOT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `medico` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agendar_citas`
--

INSERT INTO `agendar_citas` (`id`, `fecha`, `hora`, `motivo`, `especialidad`, `paciente_id`, `medico`) VALUES
(26, '2024-05-15', '15:38:00', 'Fiebre ', 'Medicina General', 1193358966, 'camiloo'),
(27, '2024-05-07', '15:45:00', 'Cáncer ', 'Medicina General', 1193358966, 'AlexX'),
(28, '2024-05-02', '16:12:00', 'xxxx', 'Medicina General', 1193358966, 'camiloo'),
(29, '2024-05-30', '09:20:00', 'dxxx', 'Medicina General', 1193358966, 'AlexX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `id_paciente` varchar(100) NOT NULL,
  `medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id`, `Nombre`, `archivo`, `id_paciente`, `medico`) VALUES
(3, 'Formulas', '../../Documentos/3.pdf', '1193358966', 121321),
(4, 'Medicinas', '../../Documentos/Acta reactivacion de la asociacion (mat. inactiva).docx', '1193358966', 1193118830);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `especialidad` varchar(255) NOT NULL,
  `cita` int(11) DEFAULT NULL,
  `medico` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `fecha`, `hora`, `especialidad`, `cita`, `medico`) VALUES
(7, '2024-05-15', '15:38:00', 'Medicina General', 26, 'camiloo'),
(8, '2024-05-07', '15:45:00', 'Medicina General', 27, 'AlexX'),
(9, '2024-05-02', '16:12:00', 'Medicina General', 28, 'camiloo'),
(10, '2024-05-01', '17:27:00', 'Medicina General', NULL, 'camiloo'),
(11, '2024-05-11', '16:31:00', 'Medicina General', NULL, 'camiloo'),
(12, '2024-05-08', '17:30:00', 'Medicina General', NULL, 'camiloo'),
(13, '2024-05-30', '09:20:00', 'Medicina General', 29, 'AlexX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `TipoIdentificacion` varchar(255) NOT NULL,
  `Num_identificacion` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `correo` varchar(100) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Nombre`, `Apellido`, `TipoIdentificacion`, `Num_identificacion`, `direccion`, `Fecha_nacimiento`, `correo`, `Contraseña`, `rol`) VALUES
('camiloo', 'Tuñon', 'CC', 121321, 'Calle 27a #31-5', '2024-05-20', 'Camilo@gmail.com', '1234', 'medico'),
('Alex', 'Jose', 'Cédula de Ciudadanía (CC)', 11923838, 'Calle 25a #33-5', '2024-05-05', 'alex@gmail.com', '123', 'administrador'),
('AlexX', 'Gonzalez', 'CC', 1193118830, 'Corozal', '2024-05-09', 'alexxx@dadss', 'asssaa', 'medico'),
('Andres', 'Arrieta', 'Cédula de Ciudadanía (CC)', 1193358966, 'Calle 27a #31A-3', '2024-05-05', 'juandanielarrieta23@gmail.com', '123', ''),
('Silvestre', 'Dangond', 'Cédula de Ciudadanía (CC)', 1194589644, 'Calle 27a #31-3', '1939-05-12', 'silvestredangond@gmail.com', '123', 'medico');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agendar_citas`
--
ALTER TABLE `agendar_citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cita` (`cita`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Num_identificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agendar_citas`
--
ALTER TABLE `agendar_citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agendar_citas`
--
ALTER TABLE `agendar_citas`
  ADD CONSTRAINT `agendar_citas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `usuarios` (`Num_identificacion`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`cita`) REFERENCES `agendar_citas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
