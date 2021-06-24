-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 25 juin 2021 à 00:50
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

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
CREATE DATABASE IF NOT EXISTS `api` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `api`;

-- --------------------------------------------------------

--
-- Structure de la table `mean`
--

CREATE TABLE `mean` (
  `id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `read` int(1) NOT NULL DEFAULT 0,
  `fired` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONS POUR LA TABLE `mean`:
--

--
-- Déchargement des données de la table `mean`
--

INSERT INTO `mean` (`id`, `value`, `read`, `fired`) VALUES
(9, 142, 0, 1),
(10, 245, 0, 1),
(11, 354, 0, 1),
(12, 455, 0, 1),
(13, 854, 0, 1),
(15, 745, 0, 1),
(16, 475, 0, 1),
(17, 854, 0, 1),
(18, 256, 0, 1),
(20, 133, 0, 1),
(21, 48, 0, 1),
(22, 52, 0, 1),
(23, 43, 0, 1),
(24, 41, 0, 1),
(25, 43, 0, 1),
(26, 51, 0, 1),
(27, 62, 0, 1),
(28, 498, 0, 1),
(29, 115, 0, 1),
(30, 948, 0, 1),
(31, 944, 0, 1),
(32, 826, 0, 1),
(33, 950, 0, 1),
(34, 759, 0, 1),
(35, 976, 0, 1),
(36, 1024, 0, 1),
(37, 1024, 0, 1),
(38, 1024, 0, 1),
(39, 1024, 0, 1),
(40, 1024, 0, 1),
(41, 1024, 0, 1),
(42, 1024, 0, 1),
(43, 1024, 0, 1),
(44, 378, 0, 1),
(45, 397, 0, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mean`
--
ALTER TABLE `mean`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mean`
--
ALTER TABLE `mean`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
