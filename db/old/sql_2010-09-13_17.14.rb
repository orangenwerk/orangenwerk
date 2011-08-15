-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 13. September 2010 um 17:13
-- Server Version: 5.4.1
-- PHP-Version: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Datenbank: `rails1_dev`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `agbs`
--

CREATE TABLE IF NOT EXISTS `agbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `paragraf` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_agbs_on_paragraf` (`paragraf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `agbs`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `bild_file_name` varchar(255) DEFAULT NULL,
  `bild_content_type` varchar(255) DEFAULT NULL,
  `bild_file_size` int(11) DEFAULT NULL,
  `bild_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `banners`
--

INSERT INTO `banners` (`id`, `name`, `link`, `sorter`, `bild_file_name`, `bild_content_type`, `bild_file_size`, `bild_updated_at`, `created_at`, `updated_at`, `titel`) VALUES
(1, 'beschriftungen', '', 1, 'header-beschriftungen1.psd', 'application/x-photoshop', 401738, '2010-09-12 03:57:53', '2010-09-12 03:39:47', '2010-09-12 03:57:55', ''),
(2, 'textil', '', 1, 'header-textilien.jpg', 'image/jpeg', 402966, '2010-09-12 06:42:47', '2010-09-12 06:42:47', '2010-09-12 06:42:47', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `branchen`
--

CREATE TABLE IF NOT EXISTS `branchen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `sorter` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_branchen_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `branchen`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `faqs`
--

CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `frage` varchar(255) DEFAULT NULL,
  `antwort` text,
  `sorter` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_faqs_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `faqs`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kontakt_bereiche`
--

CREATE TABLE IF NOT EXISTS `kontakt_bereiche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `inhalt` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kontakt_bereiche_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `kontakt_bereiche`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden`
--

CREATE TABLE IF NOT EXISTS `kunden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `datum` datetime DEFAULT NULL,
  `branche_id` int(11) DEFAULT NULL,
  `produkt_bereich_id` int(11) DEFAULT NULL,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kunden_on_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `kunden`
--

INSERT INTO `kunden` (`id`, `name`, `titel`, `inhalt`, `datum`, `branche_id`, `produkt_bereich_id`, `icon_file_name`, `icon_content_type`, `icon_file_size`, `icon_updated_at`, `created_at`, `updated_at`) VALUES
(1, 'raabkarcher', 'Raab Karcher', '<p><span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">Raab Karcher</span></p>', '2007-09-11 00:00:00', NULL, 3, 'raabk_sw.png', 'image/png', 9922, '2010-09-11 18:54:45', '2010-09-11 18:54:46', '2010-09-11 18:54:46'),
(2, 'carlsberg', 'Carlsberg', '<p>&nbsp;<span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">Carlsberg</span></p>', '2010-09-11 00:00:00', NULL, 3, 'carlsberg-pf.png', 'image/png', 19871, '2010-09-11 18:58:31', '2010-09-11 18:58:32', '2010-09-11 18:58:32');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden_meinungen`
--

CREATE TABLE IF NOT EXISTS `kunden_meinungen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `kunden_name` varchar(255) DEFAULT NULL,
  `firma` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `kunde_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `kunden_meinungen`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news_bereiche`
--

CREATE TABLE IF NOT EXISTS `news_bereiche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `inhalt` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_news_bereiche_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `news_bereiche`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news_eintraege`
--

CREATE TABLE IF NOT EXISTS `news_eintraege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_news_eintraege_on_name` (`name`),
  KEY `index_news_eintraege_on_datum` (`datum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `news_eintraege`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `portfolio_bereiche`
--

CREATE TABLE IF NOT EXISTS `portfolio_bereiche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `inhalt` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_portfolio_bereiche_on_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `portfolio_bereiche`
--

INSERT INTO `portfolio_bereiche` (`id`, `name`, `titel`, `sorter`, `inhalt`, `created_at`, `updated_at`) VALUES
(1, 'projekte', 'Projekte', 1, '<p>&nbsp;<span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">Projekte</span></p>', '2010-09-09 22:24:51', '2010-09-09 22:24:51'),
(2, 'kunden', 'Kunden', 2, '<p>&nbsp;<span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">Kunden</span></p>', '2010-09-09 22:25:12', '2010-09-09 22:25:12');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `produkte`
--

CREATE TABLE IF NOT EXISTS `produkte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `inhalt` text,
  `beschreibung` text,
  `produkt_kategorie_id` int(11) DEFAULT NULL,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `produktbild_file_name` varchar(255) DEFAULT NULL,
  `produktbild_content_type` varchar(255) DEFAULT NULL,
  `produktbild_file_size` int(11) DEFAULT NULL,
  `produktbild_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_produkte_on_name` (`name`),
  KEY `index_produkte_on_produkt_kategorie_id` (`produkt_kategorie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `produkte`
--

INSERT INTO `produkte` (`id`, `name`, `titel`, `sorter`, `inhalt`, `beschreibung`, `produkt_kategorie_id`, `icon_file_name`, `icon_content_type`, `icon_file_size`, `icon_updated_at`, `produktbild_file_name`, `produktbild_content_type`, `produktbild_file_size`, `produktbild_updated_at`, `created_at`, `updated_at`) VALUES
(1, 'acryl', 'Acryl-Schilder', 1, '<p>&nbsp;<span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">Acryl-Schilder</span></p>', '<p>&nbsp;<span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">Acryl-Schilder</span></p>', 1, 'acr.png', 'image/png', 8430, '2010-09-10 03:43:32', 'p_beschreibung.png', 'image/png', 70027, '2010-09-10 03:43:33', '2010-09-10 03:43:33', '2010-09-10 03:43:33');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `produkt_bereiche`
--

CREATE TABLE IF NOT EXISTS `produkt_bereiche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `inhalt` text,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_produkt_bereiche_on_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `produkt_bereiche`
--

INSERT INTO `produkt_bereiche` (`id`, `name`, `titel`, `sorter`, `inhalt`, `icon_file_name`, `icon_content_type`, `icon_file_size`, `icon_updated_at`, `created_at`, `updated_at`) VALUES
(3, 'werbetechnik', 'Werbetechnik', 2, '<p>&nbsp;Werbetechnik</p>', 'werbetechnik.png', 'image/png', 12771, '2010-09-09 23:41:22', '2010-09-09 23:41:22', '2010-09-09 23:41:22');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `produkt_detail_bilder`
--

CREATE TABLE IF NOT EXISTS `produkt_detail_bilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `inhalt` text,
  `produkt_id` int(11) DEFAULT NULL,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_produkt_detail_bilder_on_produkt_id` (`produkt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `produkt_detail_bilder`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `produkt_kategorien`
--

CREATE TABLE IF NOT EXISTS `produkt_kategorien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `inhalt` text,
  `produkt_bereich_id` int(11) DEFAULT NULL,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_produkt_kategorien_on_name` (`name`),
  KEY `index_produkt_kategorien_on_produkt_bereich_id` (`produkt_bereich_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `produkt_kategorien`
--

INSERT INTO `produkt_kategorien` (`id`, `name`, `titel`, `sorter`, `inhalt`, `produkt_bereich_id`, `icon_file_name`, `icon_content_type`, `icon_file_size`, `icon_updated_at`, `created_at`, `updated_at`) VALUES
(1, 'schilder', 'Schilder', 1, '<p>&nbsp;<span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">Schilder</span></p>', 3, 'schilder.png', 'image/png', 4479, '2010-09-10 03:41:23', '2010-09-10 03:41:23', '2010-09-10 03:41:23'),
(2, '3d-buchstaben', '3D-Buchstaben', 4, '<p><span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">3D-Buchstaben</span>&nbsp;</p>', 3, '3d-buchstaben.png', 'image/png', 8467, '2010-09-10 03:42:08', '2010-09-10 03:42:08', '2010-09-10 03:42:08'),
(3, 'lichtwerbung', 'Lichtwerbung', 2, '<p>&nbsp;<span class="Apple-style-span" style="font-family: ''Lucida Grande''; font-size: 11px; white-space: pre; ">Lichtwerbung</span></p>', 3, 'lichtwerbung.png', 'image/png', 6294, '2010-09-10 03:44:56', '2010-09-10 03:44:56', '2010-09-10 03:44:56');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `referenzen`
--

CREATE TABLE IF NOT EXISTS `referenzen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `objekt` varchar(255) DEFAULT NULL,
  `ort` varchar(255) DEFAULT NULL,
  `webref` tinyint(1) DEFAULT '0',
  `branche_id` int(11) DEFAULT NULL,
  `produkt_bereich_id` int(11) DEFAULT NULL,
  `produkt_kategorie_id` int(11) DEFAULT NULL,
  `produkt_id` int(11) DEFAULT NULL,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_referenzen_on_branche_id` (`branche_id`),
  KEY `index_referenzen_on_produkt_bereich_id` (`produkt_bereich_id`),
  KEY `index_referenzen_on_produkt_kategorie_id` (`produkt_kategorie_id`),
  KEY `index_referenzen_on_produkt_id` (`produkt_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `referenzen`
--

INSERT INTO `referenzen` (`id`, `name`, `titel`, `inhalt`, `objekt`, `ort`, `webref`, `branche_id`, `produkt_bereich_id`, `produkt_kategorie_id`, `produkt_id`, `icon_file_name`, `icon_content_type`, `icon_file_size`, `icon_updated_at`, `created_at`, `updated_at`, `datum`) VALUES
(1, 'ccccc', 'cccc', '<p>&nbsp;cccc</p>', 'ccc', 'ccc', 0, NULL, 3, 1, 1, 'p_details2.png', 'image/png', 28212, '2010-09-10 03:52:10', '2010-09-10 03:52:11', '2010-09-11 09:05:20', '2010-09-11 00:00:00'),
(2, 'dd', 'dd', '', 'dd', 'dd', 0, NULL, 3, 1, 1, 'Top-Logo.png', 'image/png', 45857, '2010-09-11 09:01:13', '2010-09-11 09:01:14', '2010-09-11 09:01:14', '2010-09-11 00:00:00'),
(3, 'cxvxvx', 'vvxcvcxv', '<p>vxvcxvxcvxcv&nbsp;</p>', 'vxcvxv', 'xcvxvv', 0, NULL, 3, 1, 1, 'eins_on.png', 'image/png', 44552, '2010-09-11 09:08:16', '2010-09-11 09:08:16', '2010-09-11 09:08:16', '2010-09-11 00:00:00'),
(4, '12333', '2222', '<p>222222&nbsp;</p>', '2222', '2222', 0, NULL, NULL, NULL, NULL, 'eins_off.png', 'image/png', 35161, '2010-09-11 09:13:45', '2010-09-11 09:13:46', '2010-09-11 09:13:46', '2010-09-11 00:00:00'),
(5, 'vs4vv', 'vs4vv', '<p>vs4vv vs4vv vs4vv&nbsp;</p>', 'vs4vv', 'vs4vv', 0, NULL, 3, 1, 1, 'munkelt_web_ref.png', 'image/png', 42024, '2010-09-11 09:15:46', '2010-09-11 09:15:47', '2010-09-11 09:37:49', '2010-09-11 00:00:00'),
(6, 'carollis', 'Carollis', '<p>&nbsp;pic pic pic pic</p>', 'Carollis', 'Oranienburg', 1, NULL, NULL, NULL, NULL, 'carollis_web_ref.png', 'image/png', 66164, '2010-09-11 13:15:19', '2010-09-11 13:15:21', '2010-09-11 13:15:21', '2009-09-11 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `referenz_bilder`
--

CREATE TABLE IF NOT EXISTS `referenz_bilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `sorter` int(11) DEFAULT NULL,
  `referenz_id` int(11) DEFAULT NULL,
  `bild_file_name` varchar(255) DEFAULT NULL,
  `bild_content_type` varchar(255) DEFAULT NULL,
  `bild_file_size` int(11) DEFAULT NULL,
  `bild_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_referenz_bilder_on_referenz_id` (`referenz_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `referenz_bilder`
--

INSERT INTO `referenz_bilder` (`id`, `name`, `titel`, `inhalt`, `sorter`, `referenz_id`, `bild_file_name`, `bild_content_type`, `bild_file_size`, `bild_updated_at`, `created_at`, `updated_at`) VALUES
(1, 'xxxxxxx', 'xxxxxxx', '<p>&nbsp;xxxx</p>', 1, 1, 'carlberg.png', 'image/png', 19959, '2010-09-11 09:09:05', '2010-09-10 03:55:37', '2010-09-11 09:09:05'),
(3, 'vs4vvs4vv', 'vs4vv vs4vv', 'vs4vv', 2, 5, 'carollis_web_ref.png', 'image/png', 198029, '2010-09-11 09:36:30', '2010-09-11 09:15:47', '2010-09-11 09:36:30'),
(4, 'ccccc', 'ccccc', 'cccc', 0, 5, 'carollis_web.png', 'image/png', 142659, '2010-09-11 09:36:29', '2010-09-11 09:18:25', '2010-09-11 09:36:30'),
(5, 'dddd', 'dddd', 'ddd', 2, 4, 'Top-Logo.png', 'image/png', 88361, '2010-09-11 09:38:41', '2010-09-11 09:38:41', '2010-09-11 09:38:41');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20100909071953'),
('20100909072248'),
('20100909072408'),
('20100909072637'),
('20100909072846'),
('20100909073006'),
('20100909073206'),
('20100909073326'),
('20100909073608'),
('20100909073712'),
('20100909073817'),
('20100909074106'),
('20100909074248'),
('20100909074348'),
('20100909074508'),
('20100909074633'),
('20100909074738'),
('20100909163828'),
('20100910234646'),
('20100912013541'),
('20100912031804'),
('20100912033616'),
('20100912054437'),
('20100912055550');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sliders`
--

CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sorter` int(11) DEFAULT NULL,
  `bild_file_name` varchar(255) DEFAULT NULL,
  `bild_content_type` varchar(255) DEFAULT NULL,
  `bild_file_size` int(11) DEFAULT NULL,
  `bild_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `von_horizontal` varchar(255) DEFAULT NULL,
  `von_vertikal` varchar(255) DEFAULT NULL,
  `von_zoom` varchar(255) DEFAULT NULL,
  `zu_horizontal` varchar(255) DEFAULT NULL,
  `zu_vertikal` varchar(255) DEFAULT NULL,
  `zu_zoom` varchar(255) DEFAULT NULL,
  `dauer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `link`, `sorter`, `bild_file_name`, `bild_content_type`, `bild_file_size`, `bild_updated_at`, `created_at`, `updated_at`, `titel`, `von_horizontal`, `von_vertikal`, `von_zoom`, `zu_horizontal`, `zu_vertikal`, `zu_zoom`, `dauer`) VALUES
(3, 'digi', '', 3, 'header_std.jpg', 'image/jpeg', 79078, '2010-09-12 06:23:18', '2010-09-12 06:23:18', '2010-09-12 06:23:18', '', 'top', 'right', '1x', 'bottom', 'left', '1.4x', 5),
(4, 'digi2', '', 4, 'header-digitaldruck.jpg', 'image/jpeg', 88920, '2010-09-12 06:28:16', '2010-09-12 06:28:16', '2010-09-12 06:35:39', '', 'top', 'center', '1x', 'center', 'center', '1.6x', 4),
(5, 'grafik', '', 0, 'header-grafik.jpg', 'image/jpeg', 118424, '2010-09-12 07:17:13', '2010-09-12 07:17:13', '2010-09-12 07:20:23', '', 'center', 'center', '', 'center', 'center', '1.3x', 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `strangemaster` tinyint(1) DEFAULT '0',
  `autor` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_name` (`name`),
  KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `encrypted_password`, `salt`, `admin`, `strangemaster`, `autor`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@2strange.net', '79d485e7df0b5497e56a0bc37ae39c9161054bbddef35d95f1015d9b65744ae3', '48a1e247f6565ed404b5026dc43351d2e495544c27d0de55feb6fb919453eaab', 1, 1, 1, '2010-09-09 22:45:59', '2010-09-09 22:45:59');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `web_referenzen`
--

CREATE TABLE IF NOT EXISTS `web_referenzen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `referenz_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_web_referenzen_on_name` (`name`),
  KEY `index_web_referenzen_on_referenz_id` (`referenz_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `web_referenzen`
--

INSERT INTO `web_referenzen` (`id`, `name`, `titel`, `inhalt`, `referenz_id`, `created_at`, `updated_at`) VALUES
(1, 'Carollis', 'Carollis', '<p>Carollis Carollis Carollis</p>', 6, '2010-09-11 13:15:21', '2010-09-11 13:15:21');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `web_referenz_bilder`
--

CREATE TABLE IF NOT EXISTS `web_referenz_bilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `inhalt` text,
  `sorter` int(11) DEFAULT NULL,
  `web_referenz_id` int(11) DEFAULT NULL,
  `screenshot_file_name` varchar(255) DEFAULT NULL,
  `screenshot_content_type` varchar(255) DEFAULT NULL,
  `screenshot_file_size` int(11) DEFAULT NULL,
  `screenshot_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_web_referenz_bilder_on_web_referenz_id` (`web_referenz_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `web_referenz_bilder`
--

INSERT INTO `web_referenz_bilder` (`id`, `name`, `titel`, `inhalt`, `sorter`, `web_referenz_id`, `screenshot_file_name`, `screenshot_content_type`, `screenshot_file_size`, `screenshot_updated_at`, `created_at`, `updated_at`) VALUES
(1, 'start', 'start', '<p>start</p>', 1, 1, 'carollis_web_ref.png', 'image/png', 198029, '2010-09-11 13:15:20', '2010-09-11 13:15:21', '2010-09-11 13:15:21'),
(2, 'pic', 'pic', '<p>pic pic</p>', 2, 1, 'carollis_web.png', 'image/png', 142659, '2010-09-11 13:15:20', '2010-09-11 13:15:21', '2010-09-11 13:15:21');
