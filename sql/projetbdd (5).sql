-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 08 Novembre 2016 à 18:21
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `projetbdd`
--
CREATE DATABASE IF NOT EXISTS `projetbdd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projetbdd`;

-- --------------------------------------------------------

--
-- Structure de la table `catincident`
--

CREATE TABLE IF NOT EXISTS `catincident` (
  `id_catincident` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_catincident`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `catincident`
--

INSERT INTO `catincident` (`id_catincident`, `libelle`) VALUES
(1, 'Avaloir'),
(2, 'canalisation'),
(3, 'canniveau'),
(4, 'egout'),
(5, 'regard');

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE IF NOT EXISTS `commune` (
  `id_commune` int(11) NOT NULL AUTO_INCREMENT,
  `nom_commune` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_commune`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `commune`
--

INSERT INTO `commune` (`id_commune`, `nom_commune`) VALUES
(1, 'Abobo'),
(2, 'Adjame'),
(3, 'Anyama'),
(4, 'Attecoube'),
(5, 'Cocody'),
(6, 'Koumassi'),
(7, 'Marcory'),
(8, 'Plateau'),
(9, 'Treichville'),
(10, 'Port-Bouet'),
(11, 'Yopougon');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `num_cpt` int(5) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `etat_cpt` int(1) NOT NULL,
  `id_user` int(5) DEFAULT NULL,
  `id_tc` int(1) DEFAULT NULL,
  `dispo` int(1) NOT NULL,
  `respo` int(1) NOT NULL,
  PRIMARY KEY (`num_cpt`),
  KEY `fk_user` (`id_user`),
  KEY `fk_tc` (`id_tc`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`num_cpt`, `pseudo`, `mdp`, `etat_cpt`, `id_user`, `id_tc`, `dispo`, `respo`) VALUES
(1, 'freewheels', 'thereaper', 1, 8, 1, 0, 0),
(2, 'Mastermind', 'andy1992', 1, 9, 2, 0, 0),
(3, 'larkange', 'queenye', 1, 10, 3, 1, 1),
(4, 'Block13', 'monvich', 1, 11, 2, 0, 1),
(5, 'winzin', 'fourier', 1, 12, 4, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `incident`
--

CREATE TABLE IF NOT EXISTS `incident` (
  `id_incident` int(11) NOT NULL AUTO_INCREMENT,
  `num_incident` varchar(255) DEFAULT NULL,
  `lib_incident` varchar(255) DEFAULT NULL,
  `date_incident` date DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `lattitude` double DEFAULT NULL,
  `descr_incident` text,
  `pre_sup` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id_catincident` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
  `num_cpt` int(5) NOT NULL,
  `statut` int(1) NOT NULL,
  PRIMARY KEY (`id_incident`),
  KEY `fk_catincident` (`id_catincident`),
  KEY `fk_zone` (`id_zone`),
  KEY `fk_copt` (`num_cpt`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `incident`
--

INSERT INTO `incident` (`id_incident`, `num_incident`, `lib_incident`, `date_incident`, `longitude`, `lattitude`, `descr_incident`, `pre_sup`, `image`, `id_catincident`, `id_zone`, `num_cpt`, `statut`) VALUES
(15, '16/15/110/Att', 'Bouche', '2016-11-07', 0, 0, 'GFGDFGFD', 'QsdFQDFDGFFGFFFB', NULL, 4, 110, 1, 1),
(16, '16/16/19/Adj', 'Cassee', '2016-11-08', 0, 0, 'c''est urgent', 'vers la gare d''abobo', NULL, 3, 19, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE IF NOT EXISTS `intervention` (
  `id_intervention` int(11) NOT NULL AUTO_INCREMENT,
  `desc_intervention` text,
  `status_intervention` varchar(255) DEFAULT NULL,
  `id_incident` int(5) NOT NULL,
  PRIMARY KEY (`id_intervention`),
  KEY `fk_incident` (`id_incident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `num_msg` int(5) NOT NULL AUTO_INCREMENT,
  `desc_msg` text,
  `date_msg` datetime DEFAULT NULL,
  `num_cpt` int(5) DEFAULT NULL,
  `id_sujet` int(5) DEFAULT NULL,
  PRIMARY KEY (`num_msg`),
  KEY `fk_sujet` (`id_sujet`),
  KEY `fk_cpt` (`num_cpt`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`num_msg`, `desc_msg`, `date_msg`, `num_cpt`, `id_sujet`) VALUES
(4, 'wsdfdsfwgsdfdbd', '2016-11-07 00:00:00', 1, 17);

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

CREATE TABLE IF NOT EXISTS `sujet` (
  `id_sujet` int(5) NOT NULL AUTO_INCREMENT,
  `lib_sujet` varchar(255) NOT NULL,
  `obj_sujet` varchar(255) NOT NULL,
  `date_sujet` datetime DEFAULT NULL,
  `num_cpt` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_sujet`),
  KEY `fk_compte` (`num_cpt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `type_compte`
--

CREATE TABLE IF NOT EXISTS `type_compte` (
  `id_tc` int(1) NOT NULL AUTO_INCREMENT,
  `lib_tc` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tc`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `type_compte`
--

INSERT INTO `type_compte` (`id_tc`, `lib_tc`) VALUES
(1, 'utilisateur simple'),
(2, 'agent decideur'),
(3, 'agent de terrain'),
(4, 'administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(5) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `datenais` date NOT NULL,
  `num_phone` varchar(8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `datenais`, `num_phone`, `email`) VALUES
(1, 'Beugre', 'Axel', '1994-05-27', '87573423', 'axel.beugre1@gmail.com'),
(2, 'Beugre', 'Axel', '1994-05-27', '87573423', 'axel.beugre1@gmail.com'),
(3, 'Beugre', 'Axel', '1994-05-27', '87573423', 'axel.beugre1@gmail.com'),
(4, 'Beugre', 'Axel', '1994-05-27', '87573423', 'axel.beugre1@gmail.com'),
(5, 'Beugre', 'Axel', '1994-05-27', '87573423', 'axel.beugre1@gmail.com'),
(6, 'Beugre', 'Axel', '1994-05-27', '87573423', 'axel.beugre1@gmail.com'),
(7, 'Beugre', 'Axel', '1994-05-27', '87573423', 'axel.beugre1@gmail.com'),
(8, 'Beugre', 'Axel', '1994-05-27', '87573423', 'axel.beugre1@gmail.com'),
(9, 'Dalo', 'Waly', '1992-03-25', '47427163', 'dalomarc92@gmail.com'),
(10, 'Mady', 'Josue', '1990-05-02', '47427161', 'larkange@gmail.com'),
(11, 'Dalo', 'Ange-Richmond', '2016-05-26', '08501465', 'angerich@gmail.com'),
(12, 'N''zi', 'Armand', '1988-06-26', '08551465', 'armand@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `id_zone` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_zone` varchar(255) DEFAULT NULL,
  `id_commune` int(11) NOT NULL,
  PRIMARY KEY (`id_zone`),
  KEY `fk_id_commune` (`id_commune`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=146 ;

--
-- Contenu de la table `zone`
--

INSERT INTO `zone` (`id_zone`, `libelle_zone`, `id_commune`) VALUES
(1, 'Plaque', 1),
(2, 'Anador', 1),
(3, 'Agbekoi', 1),
(4, 'Akeikoi', 1),
(5, 'Derriere rail', 1),
(6, 'samake', 1),
(7, 'Les 4 etages', 1),
(8, 'PK18', 1),
(9, 'Avocatier', 1),
(10, 'N''Dotre', 1),
(11, 'Belleville', 1),
(12, 'Dokui', 1),
(13, 'Sogefia', 1),
(14, 'Abobo Baoule', 1),
(15, 'Abobo Clotcha', 1),
(16, 'Williamsville', 2),
(17, 'Mosquee', 2),
(18, 'Bracodi', 2),
(19, 'Liberte', 2),
(20, '220 Logements', 2),
(21, 'Adjame marche', 2),
(22, 'Anyama residentiel', 3),
(23, 'Anyama Berthe', 3),
(24, 'Anyama Cisse', 3),
(25, 'Ancienne Gendarmerie', 3),
(26, 'A la morgue', 3),
(27, 'Angre', 5),
(28, 'Riviera palmerais', 5),
(29, 'Riviera 2', 5),
(30, 'Riviera 3', 5),
(31, 'Riviera 4', 5),
(32, 'Riviera Golf', 5),
(33, 'Bonoumin', 5),
(34, '2 Plateau', 5),
(35, 'Attogban', 5),
(36, 'Gobelet', 5),
(37, '147 Logements', 6),
(38, 'Campement', 6),
(39, 'Prodomo', 6),
(40, 'Agouti', 6),
(41, 'Sopim', 6),
(42, 'Inchallah', 6),
(43, '32', 6),
(44, '05', 6),
(45, 'Divo', 6),
(46, 'Sicogi', 6),
(47, 'Soweto', 6),
(48, 'Boston', 6),
(49, 'Baudelaire', 6),
(50, 'Quartier du maire (Canetons)', 6),
(51, '3 Ampoules', 6),
(52, 'Remblais (Colombe)', 6),
(53, 'Sans fils', 6),
(54, 'Akwaba', 6),
(55, 'Sogefia', 6),
(56, 'St Etienne', 6),
(57, 'Anoumambo', 7),
(58, 'Remblais', 7),
(59, 'Residentiel', 7),
(60, 'Centre Commercial', 7),
(61, 'Sicogi', 7),
(62, 'Massarana', 7),
(63, 'Konankro', 7),
(64, 'Cite Administrative', 8),
(65, 'Sorbonne', 8),
(66, 'Quartier chien mechant', 8),
(67, 'Carena', 8),
(68, 'Cite Esculable', 8),
(69, 'Avenue 14', 9),
(70, 'Rue 12', 9),
(71, 'Rue des Brasseries', 9),
(72, 'Biafra', 9),
(73, 'A la rass', 9),
(74, 'Gare de Bassam', 9),
(75, 'Nanan Yamousso', 9),
(76, 'Mobibois', 10),
(77, 'Jean Folly', 10),
(78, 'Rue 12', 10),
(79, 'Adjoufou', 10),
(80, 'Casier', 10),
(81, 'Phare', 10),
(82, 'Gonzagueville', 10),
(83, 'Anani', 10),
(84, 'Derriere Warf', 10),
(85, 'Abattoir', 10),
(86, 'Siporex', 11),
(87, 'Sideci', 11),
(88, 'Gesco', 11),
(89, 'Maroc', 11),
(90, 'Ananerais', 11),
(91, 'Niangon', 11),
(92, 'Selmer', 11),
(93, 'Andokoi', 11),
(94, 'Koweit', 11),
(95, 'Sicogi', 11),
(96, 'Songon', 11),
(97, 'Toit rouge', 11),
(98, 'Kilometre 17', 11),
(99, 'Rue Princesse', 11),
(100, 'Port-Bouet 2', 11),
(101, 'Wassakara', 11),
(102, 'Sable', 11),
(103, 'Banco', 11),
(104, 'Abobodoume', 11),
(105, 'Quartier Millionnaire', 11),
(106, 'Cite verte', 11),
(107, 'Sogefia', 11),
(108, 'Cite CIE (Niangon)', 11),
(109, 'Academie (Niangon)', 11),
(110, 'Agban Attie', 4),
(111, 'Attecoube 3', 4),
(112, 'Djene Ecare', 4),
(113, 'Sante Ecole', 4),
(114, 'Sante 3 Residentiel 1', 4),
(115, 'Sant??« 3 R??«sidentiel 2', 4),
(116, 'Sant??« 3 Extension', 4),
(117, 'Fromager', 4),
(118, 'Deinde', 4),
(119, 'Asapsu', 4),
(120, 'Awa', 4),
(121, 'Jean-Paul 2', 4),
(122, 'Sante Carrefour', 4),
(123, 'Ak??«li??«', 4),
(124, 'Lackman', 4),
(125, 'Douagoville', 4),
(126, 'Camp Douane', 4),
(127, 'Jerusalem Residentiel', 4),
(128, 'J??«rusalem 1', 4),
(129, 'J??«rusalem 2', 4),
(130, 'J??«rusalem 3', 4),
(131, 'Sebroko', 4),
(132, 'La Paix', 4),
(133, 'Lagune', 4),
(134, 'Espoir', 4),
(135, 'Mosqu??«e', 4),
(136, 'Saint-Joseph', 4),
(137, 'Ecole', 4),
(138, 'Gbebouto', 4),
(139, 'Cantonnement Forestier', 4),
(140, 'Cite Fairmont 1', 4),
(141, 'Cite Fairmont 2', 4),
(142, 'Ecole Forestiere', 4),
(143, 'Bidjante', 4),
(145, 'Dokui', 5);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `fk_tc` FOREIGN KEY (`id_tc`) REFERENCES `type_compte` (`id_tc`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `fk_catincident` FOREIGN KEY (`id_catincident`) REFERENCES `catincident` (`id_catincident`),
  ADD CONSTRAINT `fk_copt` FOREIGN KEY (`num_cpt`) REFERENCES `compte` (`num_cpt`),
  ADD CONSTRAINT `fk_zone` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`id_zone`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `fk_incident` FOREIGN KEY (`id_incident`) REFERENCES `incident` (`id_incident`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_cpt` FOREIGN KEY (`num_cpt`) REFERENCES `compte` (`num_cpt`);

--
-- Contraintes pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD CONSTRAINT `fk_compte` FOREIGN KEY (`num_cpt`) REFERENCES `compte` (`num_cpt`);

--
-- Contraintes pour la table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `fk_id_commune` FOREIGN KEY (`id_commune`) REFERENCES `commune` (`id_commune`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
