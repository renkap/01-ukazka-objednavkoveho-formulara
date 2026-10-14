-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: St 14.Okt 2026, 21:54
-- Verzia serveru: 10.4.28-MariaDB
-- Verzia PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `reklamne_studio`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `objednavka`
--

CREATE TABLE `objednavka` (
  `ID_objednavky` int(10) UNSIGNED NOT NULL,
  `Obj_Datum_vytvorenia` date NOT NULL,
  `Obj_Datum_upravy` date NOT NULL,
  `Obj_Nazov_firmy` varchar(50) DEFAULT NULL,
  `Obj_Meno` varchar(50) NOT NULL,
  `Obj_Priezvisko` varchar(50) NOT NULL,
  `Obj_Email` varchar(50) NOT NULL,
  `Obj_Telefon` varchar(20) NOT NULL,
  `Obj_Ulica_cislo_fakturacna` varchar(50) NOT NULL,
  `Obj_Mesto_fakturacna` varchar(50) NOT NULL,
  `Obj_PSC_fakturacna` varchar(5) NOT NULL,
  `Obj_Ulica_cislo_dodacia` varchar(50) DEFAULT NULL,
  `Obj_Mesto_dodacia` varchar(50) DEFAULT NULL,
  `Obj_PSC_dodacia` varchar(5) DEFAULT NULL,
  `Obj_ICO` varchar(8) DEFAULT NULL,
  `Obj_DIC` varchar(10) DEFAULT NULL,
  `Obj_IC_DPH` varchar(12) DEFAULT NULL,
  `Stav_objednavky` int(10) UNSIGNED DEFAULT NULL,
  `Obj_Poznamka` varchar(200) DEFAULT NULL,
  `ID_pouzivatela` int(10) UNSIGNED DEFAULT NULL,
  `ID_zakaznika` int(10) UNSIGNED NOT NULL,
  `ID_zamestnanca` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `objednavka`
--
ALTER TABLE `objednavka`
  ADD PRIMARY KEY (`ID_objednavky`),
  ADD KEY `IXFK_Objednavka_Registrovany_Pouzivatel` (`ID_pouzivatela`),
  ADD KEY `IXFK_Objednavka_Zakaznik` (`ID_zakaznika`),
  ADD KEY `IXFK_Objednavka_Zamestnanec` (`ID_zamestnanca`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `objednavka`
--
ALTER TABLE `objednavka`
  MODIFY `ID_objednavky` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
  
CREATE TABLE `sluzba` (
  `ID_sluzby` int(10) UNSIGNED NOT NULL,
  `Nazov` varchar(100) NOT NULL,
  `Farby` varchar(200) DEFAULT NULL,
  `Dostupne_formaty` varchar(200) DEFAULT NULL,
  `Zobrazit_rozmery` tinyint(1) DEFAULT NULL,
  `Zobrazit_velkost` tinyint(1) DEFAULT NULL,
  `Zobrazovat_sluzbu` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `sluzba`
--

INSERT INTO `sluzba` (`ID_sluzby`, `Nazov`, `Farby`, `Dostupne_formaty`, `Zobrazit_rozmery`, `Zobrazit_velkost`, `Zobrazovat_sluzbu`) VALUES
(3, 'Pečiatky COLOP Printer s čiernym atramentom', 'bielo-čierna,\r\nbielo-červená,\r\nbielo-zelená,\r\nbielo-modrá,\r\nčierno-červená,\r\nčierno-zelená,\r\nčierno-modrá', '27x10 mm,38x14 mm,47x18 mm,59x18 mm', 0, 0, 1),
(4, 'Potlač trička vlastným motívom - bavlna', 'červená,modrá,čierna,biela,zelená,žltá,fialová,hnedá', '', 1, 1, 1),
(5, 'Potlač trička vlastným motívom - bio bavlna', 'červená,modrá,čierna,biela,zelená,žltá,fialová,hnedá', '', 1, 1, 1),
(6, 'Potlač trička vlastným motívom - polyester', 'červená,modrá,čierna,biela,zelená,žltá,fialová,hnedá', '', 1, 1, 1),
(9, 'Pečiatky COLOP Printer s modrým atramentom', 'bielo-čierna,\r\nbielo-červená,\r\nbielo-zelená,\r\nbielo-modrá,\r\nčierno-červená,\r\nčierno-zelená,\r\nčierno-modrá', '27x10 mm,38x14 mm,47x18 mm,59x18 mm', 0, 0, 1),
(10, 'Pečiatky COLOP Printer s červeným atramentom', 'bielo-čierna,\r\nbielo-červená,\r\nbielo-zelená,\r\nbielo-modrá,\r\nčierno-červená,\r\nčierno-zelená,\r\nčierno-modrá', '27x10 mm,38x14 mm,47x18 mm,59x18 mm', 0, 0, 1),
(11, 'Pečiatky COLOP Printer Green Line so zeleným atramentom', 'čierno-zelená', '38x14 mm,47x18 mm,59x18 mm', 0, 0, 1),
(12, 'Tlač vizitiek', '', '90x50mm', 0, 0, 1),
(13, 'Tlač samolepiek z matnej fólie', 'biela,zlatá,šedá,modrá,zelená,červená,strieborná,čierna,transparentná', '50x50mm,100x100mm,100x150mm,100x200mm', 1, 0, 1),
(14, 'Tlač samolepiek z lesklej fólie', 'biela,zlatá,šedá,modrá,zelená,červená,strieborná,čierna,transparentná', '50x50mm,100x100mm,100x150mm,100x200mm', 1, 0, 1),
(15, 'Tlač letáku s vlastným motívom', '', '', 1, 0, 1),
(16, 'Tlač plagátu s vlastným motívom', '', '', 1, 0, 1),
(19, 'Tlač banneru', '', '1500x1000mm,1000x1500,2000x1500mm,2000x1000mm', 1, 0, 1),
(20, 'Potlač keramických hrnčekov', 'biela,čierna,modrá,žltá,zelená,červená', '250ml,300ml,350ml', 0, 0, 1),
(21, 'Potlač vlastného textilu', '', '', 1, 0, 1),
(22, 'Potlač odznakov', 'biela,žltá,modrá,čierna,modrá,zlatá,strieborná', '37mm,56mm', 0, 0, 1),
(23, 'Tlač fotoobrazu', '', '300x450mm,500x700mm,300x900mm,800x800mm,450x300mm,700x500mm,900x300mm', 1, 0, 1),
(25, 'Potlač príveskov', 'biela,žltá,modrá,čierna,modrá,zlatá,strieborná', '37mm,56mm', 0, 0, 1),
(26, 'Potlač sviečok s vlastným motívom', 'oranžová,žltá,ružová,fialová,modrá', 'malá Ø7x7 cm,stredná Ø7x10cm,veľká Ø7x12cm', 0, 0, 1);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `sluzba`
--
ALTER TABLE `sluzba`
  ADD PRIMARY KEY (`ID_sluzby`);
  

--
-- Obmedzenie pre exportované tabuľky
--

--
-- 
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
