-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-03-2025 a las 16:25:45
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
-- Base de datos: `petsapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adoptions`
--

CREATE TABLE `adoptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pet_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_06_160641_create_pets_table', 1),
(5, '2025_03_06_160650_create_adoptions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets`
--

CREATE TABLE `pets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL DEFAULT 'no-imgage.png',
  `kind` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `breed` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pets`
--

INSERT INTO `pets` (`id`, `name`, `imagen`, `kind`, `weight`, `age`, `breed`, `location`, `description`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Firulais', 'no-imgage.png', 'skinwalker', 80, 24, 'Demoniaca', 'Kioto', 'Tiene cancer y es el terror andante de la ciudad, ademas en el dia mide 20 cm y en la noche 2 metros y le gusta robar las almas de los niños', '2025-03-20 17:40:47', NULL, 0),
(2, 'Michi', 'no-imgage.png', 'Cthulhu', 100, 12, 'Rompe Hogares', 'La calle de la amargura', 'Es un gato que en realidad es un ser de otra dimension y le gusta destruir matrimonios', '2025-03-20 17:40:47', NULL, 0),
(3, 'Killer', 'no-imgage.png', 'Dog', 50, 48, 'Pincher', 'Tokio', 'El perro mas peligroso de la ciudad y el destructor de mundos', '2025-03-20 17:40:47', NULL, 0),
(4, 'satterfield', 'no-imgage.png', 'dog', 3, 56, 'LightGoldenRodYellow', 'Strackechester', 'Magni maxime dolore soluta officiis maiores tenetur.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(5, 'howe', 'no-imgage.png', 'fish', 8, 10, 'Silver', 'Lake Delaneyfurt', 'Molestias iure consequatur eveniet temporibus saepe qui.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(6, 'lynch', 'no-imgage.png', 'rodent', 2, 49, 'NavajoWhite', 'North Bobbieborough', 'Doloribus rerum et eius provident nihil ut.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(7, 'turner', 'no-imgage.png', 'rodent', 2, 33, 'DarkTurquoise', 'Schillerland', 'Aut quas exercitationem possimus itaque eligendi voluptas voluptatum eum veritatis.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(8, 'hartmann', 'no-imgage.png', 'dog', 3, 75, 'LawnGreen', 'East Destanyland', 'Alias non ipsa beatae omnis officiis id doloremque neque ut.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(9, 'volkman', 'no-imgage.png', 'rodent', 6, 83, 'Coral', 'West Jennifer', 'Voluptatibus blanditiis aliquam dicta corporis quidem qui optio illum autem quia.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(10, 'johnston', 'no-imgage.png', 'dog', 8, 76, 'DarkRed', 'North Crawfordfurt', 'Rerum sit vitae doloribus reprehenderit vel nisi autem voluptatum voluptatum et maxime nobis vitae.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(11, 'krajcik', 'no-imgage.png', 'rodent', 2, 88, 'MediumOrchid', 'South Ladarius', 'Qui illo omnis eveniet non incidunt aspernatur et nisi dicta ut provident consequatur.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(12, 'monahan', 'no-imgage.png', 'pig', 2, 27, 'PapayaWhip', 'Wittingmouth', 'Similique eos voluptatem aut qui voluptatem in saepe aliquam.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(13, 'kuphal', 'no-imgage.png', 'cat', 7, 54, 'Magenta', 'Verdaville', 'Tenetur sequi laudantium molestiae explicabo et qui illum.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(14, 'kessler', 'no-imgage.png', 'cat', 4, 66, 'Darkorange', 'Kreigerbury', 'Beatae et et aut velit voluptatem perspiciatis blanditiis blanditiis ut sequi fugiat qui aliquid.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(15, 'zemlak', 'no-imgage.png', 'pig', 4, 15, 'Black', 'Cummerataberg', 'Sapiente est assumenda quia commodi autem unde necessitatibus.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(16, 'runolfsson', 'no-imgage.png', 'rodent', 5, 66, 'LightPink', 'Bartolettiton', 'Maxime velit mollitia vitae aut totam praesentium et.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(17, 'rath', 'no-imgage.png', 'rodent', 2, 99, 'Purple', 'Lake Henriette', 'Ab rerum doloremque qui animi quidem exercitationem et iure.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(18, 'rutherford', 'no-imgage.png', 'dog', 6, 40, 'MediumTurquoise', 'North Ethyl', 'Aut corporis doloribus sunt sed amet vero eos consequuntur.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(19, 'kohler', 'no-imgage.png', 'pig', 9, 88, 'GoldenRod', 'North Ottofort', 'Temporibus earum id qui quod odit cupiditate id enim numquam fugiat.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(20, 'waters', 'no-imgage.png', 'rodent', 6, 29, 'Red', 'Susiefort', 'Quam quasi id est et officiis sunt iure pariatur.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(21, 'prosacco', 'no-imgage.png', 'fish', 5, 33, 'SaddleBrown', 'Dachtown', 'Voluptas eum quia in blanditiis minima non ut quia eveniet nihil dolorem deleniti.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(22, 'zieme', 'no-imgage.png', 'cat', 8, 17, 'LightSteelBlue', 'Luettgenton', 'Esse qui sint architecto consequuntur numquam dolor minima necessitatibus voluptates minus a.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(23, 'runolfsdottir', 'no-imgage.png', 'cat', 4, 41, 'BlanchedAlmond', 'Pagacbury', 'Qui quos quia illum voluptatem culpa blanditiis ut.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(24, 'bailey', 'no-imgage.png', 'cat', 2, 62, 'MediumPurple', 'West Jorge', 'Aut velit facere voluptatem veritatis earum ut nemo sunt incidunt nesciunt.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(25, 'olson', 'no-imgage.png', 'pig', 7, 65, 'Gold', 'Port Carleychester', 'Doloribus omnis aut officia illo non voluptas esse veritatis impedit quibusdam provident temporibus nulla.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(26, 'stiedemann', 'no-imgage.png', 'fish', 2, 30, 'Turquoise', 'New Dusty', 'Distinctio quia veritatis veniam perspiciatis et maxime sit consequatur quas asperiores distinctio impedit.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(27, 'windler', 'no-imgage.png', 'fish', 4, 31, 'Brown', 'Port Kayleeland', 'Aspernatur quo cum voluptas nulla accusantium molestiae similique et.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(28, 'huels', 'no-imgage.png', 'pig', 5, 56, 'DarkMagenta', 'Lednerside', 'Consectetur qui quia assumenda sed nihil sint recusandae commodi minus.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(29, 'turcotte', 'no-imgage.png', 'rodent', 1, 84, 'Gray', 'North Giovannymouth', 'Voluptas soluta accusamus et eum rem tempora est vero.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(30, 'krajcik', 'no-imgage.png', 'cat', 1, 53, 'LightSteelBlue', 'Adamsport', 'Dolores sint itaque ut aperiam rerum hic natus rem.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(31, 'johnson', 'no-imgage.png', 'rodent', 1, 73, 'FloralWhite', 'South Aurore', 'Non porro ipsum eum ipsa nihil blanditiis necessitatibus qui dolorem.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(32, 'flatley', 'no-imgage.png', 'pig', 7, 45, 'DarkSlateBlue', 'New Carmelomouth', 'Maiores sunt odit consequatur quia numquam autem quia nam ea quis quo illum enim.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(33, 'kiehn', 'no-imgage.png', 'fish', 8, 79, 'MediumTurquoise', 'New Kennedi', 'Perspiciatis odio quia voluptas itaque ipsam ex accusamus quis quam doloremque iusto et.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(34, 'torp', 'no-imgage.png', 'fish', 2, 87, 'Moccasin', 'Aracelychester', 'Ea aut blanditiis dolores accusamus recusandae eum suscipit vero.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(35, 'sporer', 'no-imgage.png', 'rodent', 3, 74, 'Blue', 'West Alysa', 'Possimus id dolorem autem unde asperiores reiciendis eos dolorum sit veritatis ipsa possimus perferendis.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(36, 'runolfsdottir', 'no-imgage.png', 'rodent', 5, 97, 'DarkGreen', 'South Lawrenceborough', 'Sed quia quis et quisquam sequi ut.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(37, 'volkman', 'no-imgage.png', 'pig', 6, 92, 'Gold', 'North Jadonburgh', 'Eligendi ut totam facilis quis impedit eaque non voluptatem.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(38, 'sauer', 'no-imgage.png', 'pig', 5, 54, 'Blue', 'North Nikkoland', 'Debitis libero consequuntur ab placeat doloremque architecto atque totam.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(39, 'oreilly', 'no-imgage.png', 'rodent', 9, 79, 'CadetBlue', 'North Declantown', 'Sed neque mollitia qui quasi laborum eaque dicta accusantium.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(40, 'bosco', 'no-imgage.png', 'dog', 5, 64, 'Fuchsia', 'Giovannihaven', 'Impedit voluptas ut enim hic tempora ullam.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(41, 'emmerich', 'no-imgage.png', 'rodent', 5, 56, 'MidnightBlue', 'Josieside', 'Qui ratione et adipisci corporis corrupti fuga aspernatur et.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(42, 'dubuque', 'no-imgage.png', 'dog', 9, 33, 'DarkOrchid', 'Alessandroburgh', 'Est nostrum esse repudiandae veritatis architecto suscipit hic dicta.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(43, 'mosciski', 'no-imgage.png', 'cat', 8, 17, 'DarkTurquoise', 'West Shakira', 'A beatae at nobis suscipit corporis nemo quia.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(44, 'kling', 'no-imgage.png', 'pig', 3, 82, 'SpringGreen', 'New Albafort', 'Non nihil consequatur consequatur architecto amet sunt doloribus tempora.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(45, 'blick', 'no-imgage.png', 'pig', 2, 79, 'Aquamarine', 'Donnellybury', 'Corporis aliquid velit voluptatum sint optio iusto ea molestias error.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(46, 'nitzsche', 'no-imgage.png', 'rodent', 6, 60, 'MintCream', 'North Jamar', 'Porro deleniti autem eius officiis maiores et tempora earum nam.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(47, 'mueller', 'no-imgage.png', 'pig', 7, 70, 'LightCyan', 'East Adelbert', 'Ratione dolor at eos voluptatem rem odit omnis esse dolorem dignissimos voluptatibus amet.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(48, 'lebsack', 'no-imgage.png', 'fish', 2, 28, 'LemonChiffon', 'New Eric', 'Perspiciatis at tenetur repudiandae aut maxime eum incidunt accusamus voluptates minus vitae doloribus.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(49, 'boehm', 'no-imgage.png', 'fish', 1, 35, 'LightSalmon', 'Dessieville', 'Modi nihil enim et explicabo eaque voluptates quos.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(50, 'simonis', 'no-imgage.png', 'pig', 6, 22, 'Beige', 'Terryhaven', 'Accusantium perspiciatis quis voluptas autem sit perspiciatis.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(51, 'yundt', 'no-imgage.png', 'cat', 7, 62, 'FireBrick', 'Wehnermouth', 'Ad et tempore earum assumenda voluptatem corrupti necessitatibus ut accusantium natus eveniet.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(52, 'bartoletti', 'no-imgage.png', 'rodent', 4, 21, 'Maroon', 'New Clovis', 'Facilis accusamus numquam odio impedit quas ad illum ex sint sed eligendi facere.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(53, 'smitham', 'no-imgage.png', 'pig', 7, 31, 'Bisque', 'Deshawnside', 'Officiis explicabo magnam distinctio ut natus illum voluptas molestias quod.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(54, 'herzog', 'no-imgage.png', 'rodent', 1, 40, 'LightCoral', 'North Lottie', 'Illo quos quo dolorem consequatur natus rerum.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(55, 'carter', 'no-imgage.png', 'cat', 1, 73, 'Ivory', 'Barrowsfort', 'Aut aperiam reiciendis doloribus in ratione et qui repellat nostrum a.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(56, 'legros', 'no-imgage.png', 'rodent', 2, 74, 'DarkMagenta', 'Raheemmouth', 'Aut quia et rerum tempora deleniti et laborum veritatis id.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(57, 'renner', 'no-imgage.png', 'pig', 9, 16, 'BurlyWood', 'Larissaberg', 'Ullam ut tempore ut ullam aut nesciunt eius sit est iusto neque et amet.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(58, 'goldner', 'no-imgage.png', 'fish', 6, 65, 'Olive', 'Jazminfort', 'Est inventore est non libero est neque qui.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(59, 'kling', 'no-imgage.png', 'cat', 5, 25, 'LightCoral', 'West Urbanview', 'Doloremque aut aut eos at ut ipsa corporis consectetur vero et fugit.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(60, 'harvey', 'no-imgage.png', 'dog', 5, 71, 'MediumVioletRed', 'Chaimbury', 'Repudiandae quod natus tempora suscipit eius facilis.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(61, 'rutherford', 'no-imgage.png', 'pig', 7, 89, 'AliceBlue', 'North Aricberg', 'Totam quis porro ullam excepturi tenetur voluptatem ut repellat impedit.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(62, 'glover', 'no-imgage.png', 'dog', 6, 85, 'Chartreuse', 'West Jazmyn', 'Cupiditate magni cumque id impedit nesciunt cupiditate explicabo eveniet aut at modi esse libero.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(63, 'aufderhar', 'no-imgage.png', 'fish', 8, 77, 'Yellow', 'South Shyanne', 'Quia est voluptate eius ut voluptas quasi corporis est corrupti.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(64, 'mraz', 'no-imgage.png', 'fish', 5, 53, 'Moccasin', 'Lockmantown', 'Rem accusantium nesciunt provident recusandae error neque ut quis sit rem architecto earum.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(65, 'macejkovic', 'no-imgage.png', 'cat', 4, 54, 'PaleGoldenRod', 'North Jedediahhaven', 'Dolores ea nisi odio consequatur itaque beatae ex nobis autem tempore.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(66, 'hayes', 'no-imgage.png', 'cat', 3, 66, 'DarkGray', 'South Floy', 'Voluptates non voluptatem perspiciatis fuga saepe delectus.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(67, 'muller', 'no-imgage.png', 'pig', 9, 86, 'Violet', 'Magnoliastad', 'Atque distinctio magnam inventore saepe impedit nesciunt at repudiandae in sequi.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(68, 'feest', 'no-imgage.png', 'dog', 4, 80, 'BlueViolet', 'Pourosburgh', 'Iste voluptas doloremque et ipsam id blanditiis inventore fuga provident error.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(69, 'fay', 'no-imgage.png', 'rodent', 6, 38, 'Crimson', 'Glenburgh', 'Nihil et aut quis error inventore accusamus repudiandae quisquam accusamus.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(70, 'bauch', 'no-imgage.png', 'pig', 9, 56, 'Fuchsia', 'Tremainefurt', 'Beatae sed cupiditate sint saepe sunt quo molestiae.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(71, 'price', 'no-imgage.png', 'pig', 1, 78, 'Violet', 'Lake Alessiabury', 'Ex sit quis ipsum corrupti asperiores excepturi eum molestiae repellendus.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(72, 'haley', 'no-imgage.png', 'pig', 9, 51, 'DarkTurquoise', 'Lilianahaven', 'Et quia eum non sed et voluptates voluptatum nobis doloribus nihil.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(73, 'larson', 'no-imgage.png', 'cat', 5, 96, 'Fuchsia', 'Titusstad', 'Et dolorem aut dolore quam perferendis voluptatem provident cupiditate corporis qui quia nostrum illo molestiae.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(74, 'brakus', 'no-imgage.png', 'cat', 6, 32, 'DimGray', 'South Maudbury', 'Non incidunt in aut magni aut natus repellat consequatur consequuntur a illum repudiandae cupiditate.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(75, 'mcclure', 'no-imgage.png', 'rodent', 3, 65, 'Darkorange', 'Henriburgh', 'Eligendi tempora et eum alias laborum nam qui eveniet sit eum.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(76, 'wisoky', 'no-imgage.png', 'cat', 3, 22, 'RoyalBlue', 'East Ubaldomouth', 'Labore nihil ea nobis voluptates magnam expedita in qui.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(77, 'doyle', 'no-imgage.png', 'pig', 9, 59, 'DarkCyan', 'Lynchbury', 'Consectetur molestiae id ut debitis ut cumque dolor sequi accusantium rerum dolorem cum vero.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(78, 'schneider', 'no-imgage.png', 'dog', 2, 40, 'Olive', 'Lindburgh', 'Magnam necessitatibus nemo eum ducimus omnis omnis.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(79, 'mosciski', 'no-imgage.png', 'rodent', 4, 17, 'Cyan', 'Schaeferhaven', 'Et sit consequatur exercitationem pariatur enim vitae.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(80, 'stroman', 'no-imgage.png', 'fish', 1, 31, 'BlanchedAlmond', 'West Rick', 'Sed rerum autem fuga atque est ut illo quis.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(81, 'wunsch', 'no-imgage.png', 'fish', 5, 19, 'DarkGreen', 'South Effieshire', 'Similique excepturi velit ut et rerum voluptas voluptatem eum suscipit quo ratione eius.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(82, 'brown', 'no-imgage.png', 'pig', 5, 43, 'LightGreen', 'North Omamouth', 'Exercitationem laudantium sit quia alias sed sed sint tenetur dolorem distinctio.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(83, 'ullrich', 'no-imgage.png', 'rodent', 8, 48, 'LightSlateGray', 'Koelpinshire', 'Illum soluta nihil fuga ratione consequatur et non.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(84, 'armstrong', 'no-imgage.png', 'dog', 8, 36, 'Salmon', 'North Karine', 'Fuga est aperiam excepturi in at illum consequuntur est.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(85, 'schamberger', 'no-imgage.png', 'dog', 3, 58, 'DimGrey', 'South Alessandrostad', 'Praesentium maiores ipsa tempora nam dolorem non magnam ea quos.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(86, 'mills', 'no-imgage.png', 'rodent', 1, 43, 'SkyBlue', 'West Carolynbury', 'Voluptatibus vero aut veniam autem quod iure ut est.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(87, 'medhurst', 'no-imgage.png', 'cat', 5, 65, 'LightGoldenRodYellow', 'Flaviemouth', 'Veniam inventore quasi sequi laborum velit sint.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(88, 'graham', 'no-imgage.png', 'cat', 6, 60, 'Lavender', 'South Raymond', 'Officiis dolorum et repellat perspiciatis est ut aut asperiores ut non necessitatibus itaque itaque.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(89, 'glover', 'no-imgage.png', 'pig', 1, 56, 'IndianRed', 'South Demond', 'Eos et ut est sunt repellendus quaerat maxime.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(90, 'bernier', 'no-imgage.png', 'rodent', 6, 83, 'LightGoldenRodYellow', 'Boscoburgh', 'Ut aut blanditiis explicabo commodi corrupti eaque fuga eius voluptates officiis quam in.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(91, 'walsh', 'no-imgage.png', 'rodent', 8, 58, 'BurlyWood', 'East Jovannyland', 'Voluptatum perspiciatis molestias rerum similique enim non atque cum ratione.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(92, 'erdman', 'no-imgage.png', 'cat', 9, 35, 'RosyBrown', 'Nealborough', 'Omnis voluptatem nam consequatur qui et amet.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(93, 'hill', 'no-imgage.png', 'pig', 3, 42, 'Blue', 'Paigeburgh', 'Reiciendis quos voluptas veritatis consectetur ducimus voluptatem.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(94, 'mitchell', 'no-imgage.png', 'pig', 5, 11, 'MediumSpringGreen', 'South Annettehaven', 'Et illo non qui vel nobis quidem quibusdam distinctio commodi.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(95, 'olson', 'no-imgage.png', 'pig', 5, 20, 'MediumTurquoise', 'North Harleymouth', 'Mollitia optio magnam consectetur porro voluptatem fugit vel corrupti est eaque.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(96, 'cruickshank', 'no-imgage.png', 'cat', 2, 96, 'LemonChiffon', 'South Rubyeshire', 'Dolores velit aperiam quisquam est error libero similique dignissimos vitae.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(97, 'sporer', 'no-imgage.png', 'rodent', 9, 17, 'DarkGreen', 'West Evansville', 'Enim quam et necessitatibus eum at culpa ut a accusamus est.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(98, 'ruecker', 'no-imgage.png', 'dog', 7, 70, 'DimGray', 'Henryland', 'Architecto maxime et quibusdam laboriosam eveniet voluptatem eligendi odit rerum natus deleniti aut adipisci.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(99, 'walsh', 'no-imgage.png', 'dog', 4, 73, 'DarkTurquoise', 'Hesselburgh', 'Adipisci illo ullam fugit sit illo voluptas ex qui alias quisquam.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(100, 'hansen', 'no-imgage.png', 'cat', 9, 40, 'SeaShell', 'Lake Heidi', 'Ullam perferendis dicta natus porro et possimus qui ullam id.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(101, 'orn', 'no-imgage.png', 'pig', 6, 92, 'Cyan', 'Soledadville', 'Ab consequatur voluptatem labore dolorem est ut minima exercitationem.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(102, 'morissette', 'no-imgage.png', 'fish', 4, 87, 'MediumSpringGreen', 'New Arjun', 'Enim dolor nihil tenetur dolor consequuntur magnam corrupti veniam eius ut.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0),
(103, 'renner', 'no-imgage.png', 'fish', 6, 38, 'Orchid', 'East Sallieport', 'Necessitatibus magni dolorem expedita sapiente ipsa provident.', '2025-03-20 17:40:50', '2025-03-20 17:40:51', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Kqv3BjokcGemhDSuhlDwdWU9Rig7w18vkPVmaLt9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHlqR0FmWHpFZGVxbk5nNXVJTkV5WkdDU0toWkdXa3FTWVUzSWRVOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG93L3VzZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742483784);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document` bigint(20) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'no-photo.png',
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `document`, `fullname`, `gender`, `birthdate`, `photo`, `phone`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 75000001, 'John Wick', 'Male', '1980-10-10', 'no-photo.png', '32056373456', 'jwick@gmail.com', NULL, '$2y$12$f7BrxfheXzejJFtthx2C1enzbPb6CVDoZepajFip6SZYOQEf0DzNu', 'Admin', NULL, '2025-03-20 17:40:47', '2025-03-20 17:40:47'),
(2, 75000002, 'Lara Croft', 'Female', '1994-08-05', 'no-photo.png', '321518963', 'lara@gmail.com', NULL, '$2y$12$J4fk20akTeLp.9ZoZ7lPmuxHG31ROkpGL/WnX2pfyltAM/Dj3oQwa', 'customer', NULL, '2025-03-20 17:40:47', '2025-03-20 17:40:47'),
(3, 75113343, 'Larissa Gusikowski', 'Female', '1994-11-14', '75113343.png', '320414375', 'mylene98@example.com', '2025-03-20 17:40:54', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'JYBdLaVfs8', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(4, 75557226, 'Lauretta Goodwin', 'Female', '2001-08-06', '75557226.png', '320374765', 'carroll.rosalyn@example.com', '2025-03-20 17:40:57', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'oEpQ9mDr0y', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(5, 75144038, 'Arlie Douglas', 'Female', '1992-11-23', '75144038.png', '320371868', 'oquigley@example.net', '2025-03-20 17:41:02', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'x5DrM0VNTg', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(6, 75941108, 'Orlando McGlynn', 'Male', '2002-08-05', '75941108.png', '320013394', 'cbeer@example.net', '2025-03-20 17:41:13', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'FXdUBvPexg', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(7, 75205781, 'June Conn', 'Female', '1981-11-20', '75205781.png', '320409051', 'schuppe.merl@example.net', '2025-03-20 17:41:16', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'FYrc5bZ80T', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(8, 75298602, 'Estevan Pfannerstill', 'Male', '1988-09-30', '75298602.png', '320916794', 'tierra93@example.org', '2025-03-20 17:41:19', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'Bj3FIGYMZB', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(9, 75528178, 'Adell Keebler', 'Female', '1997-03-24', '75528178.png', '320098153', 'johns.roberta@example.org', '2025-03-20 17:41:21', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'mOkeFrreFt', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(10, 75497304, 'Herman Cremin', 'Male', '1996-11-06', '75497304.png', '320533863', 'heffertz@example.com', '2025-03-20 17:41:25', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'lG16vr8vPF', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(11, 75114461, 'Josh Konopelski', 'Male', '1979-03-12', '75114461.png', '320074857', 'faustino.stroman@example.net', '2025-03-20 17:41:27', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'UHpcUoCrOF', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(12, 75924572, 'Wilfred Runolfsson', 'Male', '1999-10-27', '75924572.png', '320775672', 'markus19@example.net', '2025-03-20 17:41:29', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'XsPudtqBgj', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(13, 75523604, 'Christiana Waters', 'Female', '1986-05-25', '75523604.png', '320703624', 'ujohns@example.net', '2025-03-20 17:41:32', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'f7VBzSUUyx', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(14, 75694058, 'Viola Herman', 'Female', '1994-03-15', '75694058.png', '320324878', 'malachi61@example.net', '2025-03-20 17:41:35', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', '5BSNlXrbqE', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(15, 75962964, 'Maureen Okuneva', 'Female', '1988-06-28', '75962964.png', '320346309', 'nat.erdman@example.net', '2025-03-20 17:41:38', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', '11cDoYQeNa', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(16, 75781143, 'Margarette Barrows', 'Female', '1995-12-17', '75781143.png', '320880323', 'mccullough.cordell@example.net', '2025-03-20 17:41:41', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'R2vuusLu11', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(17, 75810040, 'Emmet Ankunding', 'Male', '1998-10-19', '75810040.png', '320572477', 'hollis.renner@example.net', '2025-03-20 17:41:43', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'K2DyMrWsTT', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(18, 75895006, 'Quinton Reynolds', 'Male', '1982-12-22', '75895006.png', '320525283', 'eldred38@example.com', '2025-03-20 17:41:45', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'gtVz3jwjXh', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(19, 75950714, 'Nyasia Turcotte', 'Female', '1981-07-31', '75950714.png', '320086668', 'xwalsh@example.com', '2025-03-20 17:41:48', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 't4w4M16yew', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(20, 75182901, 'Manuel Zboncak', 'Male', '1975-05-25', '75182901.png', '320250664', 'jenifer33@example.org', '2025-03-20 17:41:55', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'l9OwC4B0jm', '2025-03-20 17:42:25', '2025-03-20 17:42:25'),
(21, 75568533, 'Jazmin Runolfsson', 'Female', '1975-02-05', '75568533.png', '320946294', 'tolson@example.org', '2025-03-20 17:41:58', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'FPCUXeGyRt', '2025-03-20 17:42:26', '2025-03-20 17:42:26'),
(22, 75327485, 'Rory Abernathy', 'Male', '1986-11-09', '75327485.png', '320326982', 'kreichel@example.com', '2025-03-20 17:42:11', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', '0FLNh73Y1S', '2025-03-20 17:42:26', '2025-03-20 17:42:26'),
(23, 75630917, 'Bridget Fay', 'Female', '1979-11-22', '75630917.png', '320988041', 'mruecker@example.net', '2025-03-20 17:42:14', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'bdwqaPsh9v', '2025-03-20 17:42:26', '2025-03-20 17:42:26'),
(24, 75015502, 'Jules Wolf', 'Male', '1977-11-13', '75015502.png', '320678230', 'botsford.alvera@example.net', '2025-03-20 17:42:17', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'MZ7r1p4CIW', '2025-03-20 17:42:26', '2025-03-20 17:42:26'),
(25, 75474430, 'Magnus Veum', 'Male', '1974-12-21', '75474430.png', '320353443', 'olson.birdie@example.net', '2025-03-20 17:42:20', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'J1NNlhsglE', '2025-03-20 17:42:26', '2025-03-20 17:42:26'),
(26, 75442074, 'Verlie Rogahn', 'Female', '1980-08-22', '75442074.png', '320562286', 'berta.ruecker@example.org', '2025-03-20 17:42:23', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'Byqp0KyGlO', '2025-03-20 17:42:26', '2025-03-20 17:42:26'),
(27, 75138153, 'Geovany Purdy', 'Male', '2001-11-07', '75138153.png', '320686158', 'homenick.aylin@example.net', '2025-03-20 17:42:25', '$2y$12$G.OpSDpZ45FoV6TuwhLAAuZWYv8HxI.sCls/kzIs8pOE5YsosTCVy', 'customer', 'b8PnByQ2Sb', '2025-03-20 17:42:26', '2025-03-20 17:42:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adoptions_user_id_foreign` (`user_id`),
  ADD KEY `adoptions_pet_id_foreign` (`pet_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_document_unique` (`document`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pets`
--
ALTER TABLE `pets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  ADD CONSTRAINT `adoptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
