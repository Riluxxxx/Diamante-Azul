-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2025 a las 21:44:50
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
-- Base de datos: `diamanteazul_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `identificacion` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `apellido`, `email`, `estado`, `fecha_registro`, `identificacion`, `nombre`, `telefono`) VALUES
(1, 'Vacca', 'vacca@gmail.com', 'ACTIVO', '2025-12-02', '11415678', 'Andres', '321464');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotas`
--

CREATE TABLE `cuotas` (
  `id_cuota` bigint(20) NOT NULL,
  `estado_cuota` varchar(20) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `fecha_vencimiento` date NOT NULL,
  `numero_cuota` int(11) NOT NULL,
  `valor_cuota` decimal(12,2) NOT NULL,
  `id_cliente_fk` int(11) NOT NULL,
  `id_factura_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura_venta`
--

CREATE TABLE `detalle_factura_venta` (
  `id_detalle_fv` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL,
  `id_factura_venta_fk` int(11) NOT NULL,
  `id_producto_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empeno`
--

CREATE TABLE `empeno` (
  `id_empeno` bigint(20) NOT NULL,
  `estado_empeno` varchar(20) NOT NULL,
  `fecha_empeno` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `interes` decimal(12,2) NOT NULL,
  `monto_prestado` decimal(12,2) NOT NULL,
  `tasa_interes` decimal(5,2) NOT NULL,
  `id_cliente_fk` int(11) NOT NULL,
  `id_producto_fk` int(11) NOT NULL,
  `id_usuario_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empeno`
--

INSERT INTO `empeno` (`id_empeno`, `estado_empeno`, `fecha_empeno`, `fecha_vencimiento`, `interes`, `monto_prestado`, `tasa_interes`, `id_cliente_fk`, `id_producto_fk`, `id_usuario_fk`) VALUES
(1, 'ACTIVO', '2025-12-02', '2026-01-02', 0.00, 450000.00, 10.00, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_venta`
--

CREATE TABLE `factura_venta` (
  `id_factura_venta` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `id_cliente_fk` int(11) NOT NULL,
  `id_usuario_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `descripcion_producto` varchar(300) NOT NULL,
  `estado_producto` varchar(255) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `descripcion_producto`, `estado_producto`, `nombre_producto`, `precio_producto`) VALUES
(1, 'aaaaaaaaaaaaaaaa', 'EN EMPENO', 'Watch ON', 1231231.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(3, 'Cliente'),
(2, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `contrasena_usuario` varchar(60) NOT NULL,
  `dirreccion` varchar(60) NOT NULL,
  `documento_usuario` varchar(20) NOT NULL,
  `email_usuario` varchar(60) NOT NULL,
  `estado_usuario` varchar(255) DEFAULT NULL,
  `nombre_usuario` varchar(60) NOT NULL,
  `telefono_usuario` varchar(20) NOT NULL,
  `tipo_documento_usuario` varchar(255) DEFAULT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `contrasena_usuario`, `dirreccion`, `documento_usuario`, `email_usuario`, `estado_usuario`, `nombre_usuario`, `telefono_usuario`, `tipo_documento_usuario`, `id_rol`) VALUES
(2, 'ajsajajaja', 'bosanova', '11231231312', 'gjufu@gmail.com', 'ACTIVO', 'Franco', '412412312312', 'CC', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `UK147rikqkb68rxqijmxxgpjwot` (`identificacion`),
  ADD UNIQUE KEY `UKcmxo70m08n43599l3h0h07cc6` (`email`);

--
-- Indices de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD PRIMARY KEY (`id_cuota`),
  ADD KEY `FK946e32nmemynfeivea5450v2i` (`id_cliente_fk`),
  ADD KEY `FK4p55aumr5daam79q4af7l4yoc` (`id_factura_fk`);

--
-- Indices de la tabla `detalle_factura_venta`
--
ALTER TABLE `detalle_factura_venta`
  ADD PRIMARY KEY (`id_detalle_fv`),
  ADD KEY `FKksklb2c7mr8p5k9mbuyeeg6d1` (`id_factura_venta_fk`),
  ADD KEY `FK95dlanwxa0mpmi8iunmvipnqq` (`id_producto_fk`);

--
-- Indices de la tabla `empeno`
--
ALTER TABLE `empeno`
  ADD PRIMARY KEY (`id_empeno`),
  ADD KEY `FK13tt50bkavv41ulku2if52o8k` (`id_cliente_fk`),
  ADD KEY `FKtfmo3g9sasdpqo0px5lxptyot` (`id_producto_fk`),
  ADD KEY `FKaltwuq5yrlem8xnayugm8yyg0` (`id_usuario_fk`);

--
-- Indices de la tabla `factura_venta`
--
ALTER TABLE `factura_venta`
  ADD PRIMARY KEY (`id_factura_venta`),
  ADD KEY `FK44a1uu1vtkc3g4lql0hxuptnm` (`id_cliente_fk`),
  ADD KEY `FK5wvl1rk5or8946oq52ybw8imp` (`id_usuario_fk`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK43kr6s7bts1wqfv43f7jd87kp` (`nombre`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `UK367t7u0pqi1nwo9ung2qkrohl` (`documento_usuario`),
  ADD UNIQUE KEY `UKpuhr3k3l7bj71hb7hk7ktpxn0` (`nombre_usuario`),
  ADD KEY `FKmyv3138vvci6kaq3y5kt4cntu` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  MODIFY `id_cuota` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_factura_venta`
--
ALTER TABLE `detalle_factura_venta`
  MODIFY `id_detalle_fv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empeno`
--
ALTER TABLE `empeno`
  MODIFY `id_empeno` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura_venta`
--
ALTER TABLE `factura_venta`
  MODIFY `id_factura_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD CONSTRAINT `FK4p55aumr5daam79q4af7l4yoc` FOREIGN KEY (`id_factura_fk`) REFERENCES `factura_venta` (`id_factura_venta`),
  ADD CONSTRAINT `FK946e32nmemynfeivea5450v2i` FOREIGN KEY (`id_cliente_fk`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `detalle_factura_venta`
--
ALTER TABLE `detalle_factura_venta`
  ADD CONSTRAINT `FK95dlanwxa0mpmi8iunmvipnqq` FOREIGN KEY (`id_producto_fk`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `FKksklb2c7mr8p5k9mbuyeeg6d1` FOREIGN KEY (`id_factura_venta_fk`) REFERENCES `factura_venta` (`id_factura_venta`);

--
-- Filtros para la tabla `empeno`
--
ALTER TABLE `empeno`
  ADD CONSTRAINT `FK13tt50bkavv41ulku2if52o8k` FOREIGN KEY (`id_cliente_fk`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `FKaltwuq5yrlem8xnayugm8yyg0` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `FKtfmo3g9sasdpqo0px5lxptyot` FOREIGN KEY (`id_producto_fk`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `factura_venta`
--
ALTER TABLE `factura_venta`
  ADD CONSTRAINT `FK44a1uu1vtkc3g4lql0hxuptnm` FOREIGN KEY (`id_cliente_fk`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `FK5wvl1rk5or8946oq52ybw8imp` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FKmyv3138vvci6kaq3y5kt4cntu` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
