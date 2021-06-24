-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 21 juin 2021 à 18:43
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `api`
--

-- --------------------------------------------------------

--
-- Structure de la table `mean`
--

CREATE TABLE `mean` (
  `id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `read` int(1) NOT NULL DEFAULT 0,
  `fired` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mean`
--

INSERT INTO `mean` (`id`, `value`, `timestamp`, `read`, `fired`) VALUES
(4, 0, '2021-06-19 18:24:50', 0, 1),
(5, 0, '2021-06-19 18:24:52', 0, 0),
(6, 0, '2021-06-19 18:24:54', 0, 0),
(7, 0, '2021-06-19 18:24:56', 0, 0),
(8, 0, '2021-06-19 18:27:55', 0, 0),
(9, 12345, '2021-06-19 18:32:02', 0, 0),
(10, 0, '2021-06-19 18:32:40', 0, 0),
(11, 0, '2021-06-19 18:33:17', 0, 0),
(12, 1233445, '2021-06-19 18:33:44', 0, 0),
(13, 12, '2021-06-19 18:34:02', 0, 0),
(14, 2345, '2021-06-19 19:15:05', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `measurements`
--

CREATE TABLE `measurements` (
  `value` int(100) NOT NULL,
  `timestamp` int(100) NOT NULL,
  `read` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `measurements`
--

INSERT INTO `measurements` (`value`, `timestamp`, `read`) VALUES
(100, 1, 0),
(150, 2, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mean`
--
ALTER TABLE `mean`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`timestamp`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mean`
--
ALTER TABLE `mean`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `timestamp` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
