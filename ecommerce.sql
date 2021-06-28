-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2021 a las 01:53:36
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--
DROP DATABASE IF EXISTS `ecommerce`;
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `id` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `valor` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`id`, `producto`, `cliente`, `valor`) VALUES
(1, 358, 2, 4),
(2, 70, 4, 3),
(3, 351, 1, 5),
(4, 351, 3, 4),
(5, 358, 3, 3),
(6, 176, 10, 5),
(7, 215, 2, 5),
(8, 109, 3, 3),
(9, 84, 10, 4),
(10, 176, 2, 3),
(11, 238, 3, 5),
(12, 84, 2, 4),
(13, 64, 5, 5),
(14, 472, 1, 4),
(15, 215, 1, 5),
(16, 249, 1, 4),
(17, 84, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(35, 'Bebidas'),
(20, 'Lácteos'),
(9, 'Sandwich'),
(17, 'Snack');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `producto`, `cliente`, `descripcion`) VALUES
(1, 64, 3, 'Rica y refrescante, aunque dura poco en la garganta.'),
(2, 70, 4, 'Demasiado salados para mi gusto.'),
(3, 472, 1, 'El mejor pollo que he probado, la palta muy aguada.'),
(4, 249, 4, '¿Saladas? Las encontré más bien dulces.'),
(5, 215, 2, 'Nunca he sabido porque le dicen azul, yo lo veo blanco con pintas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `fechahora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `cliente`, `fechahora`) VALUES
(6, 1, '2021-06-25 17:32:01'),
(7, 4, '2021-06-25 17:40:12'),
(8, 5, '2021-06-25 17:40:36'),
(9, 2, '2021-06-25 17:41:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `region` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `nombre`, `region`) VALUES
(1101, 'Iquique', 1),
(1107, 'Alto Hospicio', 1),
(1401, 'Pozo Almonte', 1),
(1402, 'Camiña', 1),
(1403, 'Colchane', 1),
(1404, 'Huara', 1),
(1405, 'Pica', 1),
(2101, 'Antofagasta', 2),
(2102, 'Mejillones', 2),
(2103, 'Sierra Gorda', 2),
(2104, 'Taltal', 2),
(2201, 'Calama', 2),
(2202, 'Ollagüe', 2),
(2203, 'San Pedro de Atacama', 2),
(2301, 'Tocopilla', 2),
(2302, 'María Elena', 2),
(3101, 'Copiapó', 3),
(3102, 'Caldera', 3),
(3103, 'Tierra Amarilla', 3),
(3201, 'Chañaral', 3),
(3202, 'Diego de Almagro', 3),
(3301, 'Vallenar', 3),
(3302, 'Alto del Carmen', 3),
(3303, 'Freirina', 3),
(3304, 'Huasco', 3),
(4101, 'La Serena', 4),
(4102, 'Coquimbo', 4),
(4103, 'Andacollo', 4),
(4104, 'La Higuera', 4),
(4105, 'Paiguano', 4),
(4106, 'Vicuña', 4),
(4201, 'Illapel', 4),
(4202, 'Canela', 4),
(4203, 'Los Vilos', 4),
(4204, 'Salamanca', 4),
(4301, 'Ovalle', 4),
(4302, 'Combarbalá', 4),
(4303, 'Monte Patria', 4),
(4304, 'Punitaqui', 4),
(4305, 'Río Hurtado', 4),
(5101, 'Valparaíso', 5),
(5102, 'Casablanca', 5),
(5103, 'Concón', 5),
(5104, 'Juan Fernández', 5),
(5105, 'Puchuncaví', 5),
(5107, 'Quintero', 5),
(5109, 'Viña del Mar', 5),
(5201, 'Isla de Pascua', 5),
(5301, 'Los Andes', 5),
(5302, 'Calle Larga', 5),
(5303, 'Rinconada', 5),
(5304, 'San Esteban', 5),
(5401, 'La Ligua', 5),
(5402, 'Cabildo', 5),
(5403, 'Papudo', 5),
(5404, 'Petorca', 5),
(5405, 'Zapallar', 5),
(5501, 'Quillota', 5),
(5502, 'Calera', 5),
(5503, 'Hijuelas', 5),
(5504, 'La Cruz', 5),
(5506, 'Nogales', 5),
(5601, 'San Antonio', 5),
(5602, 'Algarrobo', 5),
(5603, 'Cartagena', 5),
(5604, 'El Quisco', 5),
(5605, 'El Tabo', 5),
(5606, 'Santo Domingo', 5),
(5701, 'San Felipe', 5),
(5702, 'Catemu', 5),
(5703, 'Llaillay', 5),
(5704, 'Panquehue', 5),
(5705, 'Putaendo', 5),
(5706, 'Santa María', 5),
(5801, 'Quilpué', 5),
(5802, 'Limache', 5),
(5803, 'Olmué', 5),
(5804, 'Villa Alemana', 5),
(6101, 'Rancagua', 6),
(6102, 'Codegua', 6),
(6103, 'Coinco', 6),
(6104, 'Coltauco', 6),
(6105, 'Doñihue', 6),
(6106, 'Graneros', 6),
(6107, 'Las Cabras', 6),
(6108, 'Machalí', 6),
(6109, 'Malloa', 6),
(6110, 'Mostazal', 6),
(6111, 'Olivar', 6),
(6112, 'Peumo', 6),
(6113, 'Pichidegua', 6),
(6114, 'Quinta de Tilcoco', 6),
(6115, 'Rengo', 6),
(6116, 'Requínoa', 6),
(6117, 'San Vicente', 6),
(6201, 'Pichilemu', 6),
(6202, 'La Estrella', 6),
(6203, 'Litueche', 6),
(6204, 'Marchihue', 6),
(6205, 'Navidad', 6),
(6206, 'Paredones', 6),
(6301, 'San Fernando', 6),
(6302, 'Chépica', 6),
(6303, 'Chimbarongo', 6),
(6304, 'Lolol', 6),
(6305, 'Nancagua', 6),
(6306, 'Palmilla', 6),
(6307, 'Peralillo', 6),
(6308, 'Placilla', 6),
(6309, 'Pumanque', 6),
(6310, 'Santa Cruz', 6),
(7101, 'Talca', 7),
(7102, 'Constitución', 7),
(7103, 'Curepto', 7),
(7104, 'Empedrado', 7),
(7105, 'Maule', 7),
(7106, 'Pelarco', 7),
(7107, 'Pencahue', 7),
(7108, 'Río Claro', 7),
(7109, 'San Clemente', 7),
(7110, 'San Rafael', 7),
(7201, 'Cauquenes', 7),
(7202, 'Chanco', 7),
(7203, 'Pelluhue', 7),
(7301, 'Curicó', 7),
(7302, 'Hualañé', 7),
(7303, 'Licantén', 7),
(7304, 'Molina', 7),
(7305, 'Rauco', 7),
(7306, 'Romeral', 7),
(7307, 'Sagrada Familia', 7),
(7308, 'Teno', 7),
(7309, 'Vichuquén', 7),
(7401, 'Linares', 7),
(7402, 'Colbún', 7),
(7403, 'Longaví', 7),
(7404, 'Parral', 7),
(7405, 'Retiro', 7),
(7406, 'San Javier', 7),
(7407, 'Villa Alegre', 7),
(7408, 'Yerbas Buenas', 7),
(8101, 'Concepción', 8),
(8102, 'Coronel', 8),
(8103, 'Chiguayante', 8),
(8104, 'Florida', 8),
(8105, 'Hualqui', 8),
(8106, 'Lota', 8),
(8107, 'Penco', 8),
(8108, 'San Pedro de la Paz', 8),
(8109, 'Santa Juana', 8),
(8110, 'Talcahuano', 8),
(8111, 'Tomé', 8),
(8112, 'Hualpén', 8),
(8201, 'Lebu', 8),
(8202, 'Arauco', 8),
(8203, 'Cañete', 8),
(8204, 'Contulmo', 8),
(8205, 'Curanilahue', 8),
(8206, 'Los Alamos', 8),
(8207, 'Tirúa', 8),
(8301, 'Los Angeles', 8),
(8302, 'Antuco', 8),
(8303, 'Cabrero', 8),
(8304, 'Laja', 8),
(8305, 'Mulchén', 8),
(8306, 'Nacimiento', 8),
(8307, 'Negrete', 8),
(8308, 'Quilaco', 8),
(8309, 'Quilleco', 8),
(8310, 'San Rosendo', 8),
(8311, 'Santa Bárbara', 8),
(8312, 'Tucapel', 8),
(8313, 'Yumbel', 8),
(8314, 'Alto Biobío', 8),
(9101, 'Temuco', 9),
(9102, 'Carahue', 9),
(9103, 'Cunco', 9),
(9104, 'Curarrehue', 9),
(9105, 'Freire', 9),
(9106, 'Galvarino', 9),
(9107, 'Gorbea', 9),
(9108, 'Lautaro', 9),
(9109, 'Loncoche', 9),
(9110, 'Melipeuco', 9),
(9111, 'Nueva Imperial', 9),
(9112, 'Padre Las Casas', 9),
(9113, 'Perquenco', 9),
(9114, 'Pitrufquén', 9),
(9115, 'Pucón', 9),
(9116, 'Saavedra', 9),
(9117, 'Teodoro Schmidt', 9),
(9118, 'Toltén', 9),
(9119, 'Vilcún', 9),
(9120, 'Villarrica', 9),
(9121, 'Cholchol', 9),
(9201, 'Angol', 9),
(9202, 'Collipulli', 9),
(9203, 'Curacautín', 9),
(9204, 'Ercilla', 9),
(9205, 'Lonquimay', 9),
(9206, 'Los Sauces', 9),
(9207, 'Lumaco', 9),
(9208, 'Purén', 9),
(9209, 'Renaico', 9),
(9210, 'Traiguén', 9),
(9211, 'Victoria', 9),
(10101, 'Puerto Montt', 10),
(10102, 'Calbuco', 10),
(10103, 'Cochamó', 10),
(10104, 'Fresia', 10),
(10105, 'Frutillar', 10),
(10106, 'Los Muermos', 10),
(10107, 'Llanquihue', 10),
(10108, 'Maullín', 10),
(10109, 'Puerto Varas', 10),
(10201, 'Castro', 10),
(10202, 'Ancud', 10),
(10203, 'Chonchi', 10),
(10204, 'Curaco de Vélez', 10),
(10205, 'Dalcahue', 10),
(10206, 'Puqueldón', 10),
(10207, 'Queilén', 10),
(10208, 'Quellón', 10),
(10209, 'Quemchi', 10),
(10210, 'Quinchao', 10),
(10301, 'Osorno', 10),
(10302, 'Puerto Octay', 10),
(10303, 'Purranque', 10),
(10304, 'Puyehue', 10),
(10305, 'Río Negro', 10),
(10306, 'San Juan de la Costa', 10),
(10307, 'San Pablo', 10),
(10401, 'Chaitén', 10),
(10402, 'Futaleufú', 10),
(10403, 'Hualaihué', 10),
(10404, 'Palena', 10),
(11101, 'Coihaique', 11),
(11102, 'Lago Verde', 11),
(11201, 'Aisén', 11),
(11202, 'Cisnes', 11),
(11203, 'Guaitecas', 11),
(11301, 'Cochrane', 11),
(11302, 'O\'Higgins', 11),
(11303, 'Tortel', 11),
(11401, 'Chile Chico', 11),
(11402, 'Río Ibáñez', 11),
(12101, 'Punta Arenas', 12),
(12102, 'Laguna Blanca', 12),
(12103, 'Río Verde', 12),
(12104, 'San Gregorio', 12),
(12201, 'Cabo de Hornos', 12),
(12202, 'Antártica', 12),
(12301, 'Porvenir', 12),
(12302, 'Primavera', 12),
(12303, 'Timaukel', 12),
(12401, 'Natales', 12),
(12402, 'Torres del Paine', 12),
(13101, 'Santiago', 13),
(13102, 'Cerrillos', 13),
(13103, 'Cerro Navia', 13),
(13104, 'Conchalí', 13),
(13105, 'El Bosque', 13),
(13106, 'Estación Central', 13),
(13107, 'Huechuraba', 13),
(13108, 'Independencia', 13),
(13109, 'La Cisterna', 13),
(13110, 'La Florida', 13),
(13111, 'La Granja', 13),
(13112, 'La Pintana', 13),
(13113, 'La Reina', 13),
(13114, 'Las Condes', 13),
(13115, 'Lo Barnechea', 13),
(13116, 'Lo Espejo', 13),
(13117, 'Lo Prado', 13),
(13118, 'Macul', 13),
(13119, 'Maipú', 13),
(13120, 'Ñuñoa', 13),
(13121, 'Pedro Aguirre Cerda', 13),
(13122, 'Peñalolén', 13),
(13123, 'Providencia', 13),
(13124, 'Pudahuel', 13),
(13125, 'Quilicura', 13),
(13126, 'Quinta Normal', 13),
(13127, 'Recoleta', 13),
(13128, 'Renca', 13),
(13129, 'San Joaquín', 13),
(13130, 'San Miguel', 13),
(13131, 'San Ramón', 13),
(13132, 'Vitacura', 13),
(13201, 'Puente Alto', 13),
(13202, 'Pirque', 13),
(13203, 'San José de Maipo', 13),
(13301, 'Colina', 13),
(13302, 'Lampa', 13),
(13303, 'Tiltil', 13),
(13401, 'San Bernardo', 13),
(13402, 'Buin', 13),
(13403, 'Calera de Tango', 13),
(13404, 'Paine', 13),
(13501, 'Melipilla', 13),
(13502, 'Alhué', 13),
(13503, 'Curacaví', 13),
(13504, 'María Pinto', 13),
(13505, 'San Pedro', 13),
(13601, 'Talagante', 13),
(13602, 'El Monte', 13),
(13603, 'Isla de Maipo', 13),
(13604, 'Padre Hurtado', 13),
(13605, 'Peñaflor', 13),
(14101, 'Valdivia', 14),
(14102, 'Corral', 14),
(14103, 'Lanco', 14),
(14104, 'Los Lagos', 14),
(14105, 'Máfil', 14),
(14106, 'Mariquina', 14),
(14107, 'Paillaco', 14),
(14108, 'Panguipulli', 14),
(14201, 'La Unión', 14),
(14202, 'Futrono', 14),
(14203, 'Lago Ranco', 14),
(14204, 'Río Bueno', 14),
(15101, 'Arica', 15),
(15102, 'Camarones', 15),
(15201, 'Putre', 15),
(15202, 'General Lagos', 15),
(16101, 'Chillán', 16),
(16102, 'Bulnes', 16),
(16103, 'Chillán Viejo', 16),
(16104, 'El Carmen', 16),
(16105, 'Pemuco', 16),
(16106, 'Pinto', 16),
(16107, 'Quillón', 16),
(16108, 'San Ignacio', 16),
(16109, 'Yungay', 16),
(16201, 'Quirihue', 16),
(16202, 'Cobquecura', 16),
(16203, 'Coelemu', 16),
(16204, 'Ninhue', 16),
(16205, 'Portezuelo', 16),
(16206, 'Ranquil', 16),
(16207, 'Treguaco', 16),
(16301, 'San Carlos', 16),
(16302, 'Coihueco', 16),
(16303, 'Ñiquén', 16),
(16304, 'San Fabián', 16),
(16305, 'San Nicolás', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id` int(11) NOT NULL,
  `compra` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `precio` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`id`, `compra`, `producto`, `cantidad`, `precio`) VALUES
(17, 6, 358, 1, 1300),
(18, 6, 109, 1, 1080),
(19, 7, 64, 2, 1000),
(20, 7, 472, 2, 1360),
(21, 7, 249, 1, 940),
(22, 7, 238, 1, 1260),
(23, 8, 70, 1, 580),
(24, 9, 84, 3, 810),
(25, 9, 351, 2, 1200),
(26, 9, 472, 1, 1360),
(27, 9, 176, 2, 1130),
(28, 9, 64, 1, 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` int(7) NOT NULL,
  `stock` int(5) NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`, `stock`, `categoria`) VALUES
(64, 'Fanta Zero', 1000, 24, 35),
(70, 'Doritos', 580, 10, 17),
(84, 'Yogu-yogu', 810, 27, 20),
(109, 'Atún con huevo', 1080, 21, 9),
(176, 'Papas fritas', 1130, 26, 17),
(215, 'Queso azul', 2490, 18, 20),
(238, 'Coca Cola', 1260, 34, 35),
(249, 'Cabritas saladas', 940, 9, 17),
(351, 'Jamón-Queso', 1200, 12, 9),
(358, 'Chocolact', 1300, 26, 20),
(472, 'Pollo con palta', 1360, 20, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `nombre`) VALUES
(1, 'Tarapacá'),
(2, 'Antofagasta'),
(3, 'Atacama'),
(4, 'Coquimbo'),
(5, 'Valparaíso'),
(6, 'Libertador General Bernardo O\'Higgins'),
(7, 'Maule'),
(8, 'Biobío'),
(9, 'La Araucanía'),
(10, 'Los Lagos'),
(11, 'Aysén del General Carlos Ibáñez del Campo'),
(12, 'Magallanes y de la Antártica Chilena'),
(13, 'Metropolitana de Santiago'),
(14, 'Los Ríos'),
(15, 'Arica y Parinacota'),
(16, 'Ñuble');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `rut` int(8) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo` enum('cliente','admin') NOT NULL DEFAULT 'cliente',
  `nombres` varchar(100) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `rut`, `password`, `tipo`, `nombres`, `apellido1`, `apellido2`, `direccion`, `email`, `comuna`) VALUES
(1, 8922819, '$2y$10$qOuK7nYn.sBQ4z8L4AI0DelpR.MNpU70mK1hBLlYSj3IpLkW5z1LC', 'admin', 'Alejandro Estaban', 'Ayala', 'Retamales', 'Av. El Dorado 4833, casa D2', 'ayalaforever@hotmail.com', 5602),
(2, 17352827, '$2y$10$qOuK7nYn.sBQ4z8L4AI0DelpR.MNpU70mK1hBLlYSj3IpLkW5z1LC', 'cliente', 'Laura Linda', 'Omedo', 'Donoso', 'Calle Larga s/n, paradero 13', 'estrelladelsur@gmail.com', 8203),
(3, 20569471, '$2y$10$qOuK7nYn.sBQ4z8L4AI0DelpR.MNpU70mK1hBLlYSj3IpLkW5z1LC', 'cliente', 'Marta Flor', 'Silva', 'González', 'Tierra del Fuego 322, depto. 620', 'silva1989@gail.com', 16302),
(4, 16233014, '$2y$10$qOuK7nYn.sBQ4z8L4AI0DelpR.MNpU70mK1hBLlYSj3IpLkW5z1LC', 'cliente', 'Lorenzo', 'Martínez', 'López', 'Parque Marino, casa 17', 'lorenzomartlop@yahoo.es', 5107),
(5, 6136549, '$2y$10$qOuK7nYn.sBQ4z8L4AI0DelpR.MNpU70mK1hBLlYSj3IpLkW5z1LC', 'cliente', 'Carlos Antonio', 'Costa', 'Fonseca', 'El Alamo 455', 'carant-costa@gmail.com', 8301),
(10, 12845006, '$2y$10$c4gl2RqDp01/uVK0Mu3Y8ulyKQ1bg8jWbUz7ekfI8j9/SZpDwLal.', 'cliente', 'Karina', 'Jofré', 'Lorenzo', 'Pasaje Carmela Carvajal 25', 'kkkarinnna@gmail.com', 5802);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_calificacion_producto1_idx` (`producto`),
  ADD KEY `fk_calificacion_cliente1_idx` (`cliente`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comentario_producto1_idx` (`producto`),
  ADD KEY `fk_comentario_cliente1_idx` (`cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compra_usuario1_idx` (`cliente`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comuna_region1_idx` (`region`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contenido_producto1_idx` (`producto`),
  ADD KEY `fk_detalle_compra1_idx` (`compra`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_categoria1_idx` (`categoria`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rut_UNIQUE` (`rut`),
  ADD KEY `fk_usuario_comuna_idx` (`comuna`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `fk_calificacion_cliente1` FOREIGN KEY (`cliente`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_calificacion_producto1` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_cliente1` FOREIGN KEY (`cliente`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentario_producto1` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_usuario1` FOREIGN KEY (`cliente`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `fk_comuna_region` FOREIGN KEY (`region`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `fk_contenido_producto10` FOREIGN KEY (`producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_compra1` FOREIGN KEY (`compra`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_comuna` FOREIGN KEY (`comuna`) REFERENCES `comuna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `mydb`
--
DROP DATABASE IF EXISTS `mydb`;
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;
--
-- Base de datos: `phpmyadmin`
--
DROP DATABASE IF EXISTS `phpmyadmin`;
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-06-26 23:53:09', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
DROP DATABASE IF EXISTS `test`;
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
