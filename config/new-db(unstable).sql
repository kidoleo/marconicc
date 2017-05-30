-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2017 at 09:44 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `composizione_classi`
--

DROP DATABASE IF EXISTS composizione_classi;
CREATE DATABASE composizione_classi;
USE composizione_classi;

-- --------------------------------------------------------

--
-- Table structure for table `alunni`
--

CREATE TABLE `alunni` (
  `id` int(11) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `matricola` varchar(50) NOT NULL,
  `cf` char(16) NOT NULL,
  `desiderata` char(16) DEFAULT NULL,
  `sesso` char(1) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `cap` varchar(15) NOT NULL,
  `nazionalita` varchar(25) NOT NULL,
  `legge_107` varchar(25) DEFAULT NULL,
  `legge_104` varchar(25) DEFAULT NULL,
  `classe_precedente` varchar(5) DEFAULT NULL,
  `scelta_indirizzo` varchar(50) NOT NULL,
  `anno_scolastico` varchar(15) NOT NULL,
  `cod_cat` varchar(10) NOT NULL,
  `voto` int(1) NOT NULL,
  `classe_futura` varchar(50) NOT NULL,
  `scuola` int(11) DEFAULT NULL,
  `utente` int(11) DEFAULT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alunni`
--


--
-- Table structure for table `classi`
--

CREATE TABLE `classi` (
  `id` int(11) NOT NULL,
  `nome` varchar(5) NOT NULL,
  `anno_scolastico` varchar(15) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `scuola` int(11) DEFAULT NULL,
  `classe_futura` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classi_composte`
--

CREATE TABLE `classi_composte` (
  `classe` int(11) NOT NULL,
  `alunno` int(11) NOT NULL,
  `configurazione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `configurazione`
--

CREATE TABLE `configurazione` (
  `id` int(11) NOT NULL,
  `attiva` int DEFAULT 0,
  `scuola` int(11) DEFAULT NULL,
  `anno_scolastico` varchar(15) DEFAULT NULL,
  `data` date NOT NULL,
  `nome` varchar(100) NOT NULL,
  `min_alunni` int(11) NOT NULL,
  `max_alunni` int(11) NOT NULL,
  `gruppo_femmine` int(11) DEFAULT NULL,
  `gruppo_cap` int(11) DEFAULT NULL,
  `gruppo_nazionalita` int(11) DEFAULT NULL,
  `nazionalita_per_classe` int(11) DEFAULT NULL,
  `numero_alunni_con_104` int(11) DEFAULT NULL,
  `classe` varchar(25) NOT NULL COMMENT 'PRIMA = prime , TERZA = terze'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configurazione`
--

INSERT INTO `configurazione` (`id`, `attiva`, `scuola`, `anno_scolastico`, `data`, `nome`, `min_alunni`, `max_alunni`, `gruppo_femmine`, `gruppo_cap`, `gruppo_nazionalita`, `nazionalita_per_classe`, `numero_alunni_con_104`, `classe`) VALUES
(1, 1, 0, '2017-2018', '2017-05-09', 'Default config', 25, 28, 4, 4, 4, 3, 23, 'PRIMA');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `alunno` int(11) DEFAULT NULL,
  `classe_precedente` int(11) DEFAULT NULL,
  `classe_successiva` int(11) DEFAULT NULL,
  `scuola` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `utente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indirizzi`
--

CREATE TABLE `indirizzi` (
  `id` int(11) NOT NULL,
  `indirizzo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indirizzi`
--

INSERT INTO `indirizzi` (`id`, `indirizzo`) VALUES
(1, 'informatica'),
(2, 'logistica');

-- --------------------------------------------------------

--
-- Table structure for table `indirizzi_configurazione`
--

CREATE TABLE `indirizzi_configurazione` (
  `configurazione` int(11) NOT NULL,
  `indirizzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indirizzi_configurazione`
--

INSERT INTO `indirizzi_configurazione` (`configurazione`, `indirizzo`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `scuole`
--

CREATE TABLE `scuole` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero_di_telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scuole`
--

INSERT INTO `scuole` (`id`, `nome`, `descrizione`, `indirizzo`, `email`, `numero_di_telefono`) VALUES
(0, 'ITIS G. Marconi', 'scuola superiore di Verona(informatica,logistica,elettronica)', 'piazzale Guardini 7, Vr', 'gmarconi@marconivr.it', '0456500190');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `scuola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `type`, `scuola`) VALUES
(1, 'religione sikh', 0),
(4, 'buddista', 0);

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(60) NOT NULL,
  `diritti` int(11) NOT NULL COMMENT '0 = admin 1 = modifica 2 = visualizza',
  `scuola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`id`, `username`, `password`, `diritti`, `scuola`) VALUES
(5, 'root', '$2a$10$9TwgVRUMdBjpajCtXb7sWOmQ5JZqkxYKwMcB5TbMUW8MnkU3jWApy', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunni`
--
ALTER TABLE `alunni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scuola` (`scuola`),
  ADD KEY `utente` (`utente`),
  ADD KEY `tag_fk` (`tag`);

--
-- Indexes for table `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`,`scuola`,`anno_scolastico`),
  ADD KEY `scuola` (`scuola`);

--
-- Indexes for table `classi_composte`
--
ALTER TABLE `classi_composte`
  ADD PRIMARY KEY (`classe`,`alunno`),
  ADD KEY `alunno` (`alunno`),
  ADD KEY `configurazione` (`configurazione`);

--
-- Indexes for table `configurazione`
--
ALTER TABLE `configurazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scuola` (`scuola`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alunno` (`alunno`),
  ADD KEY `classe_precedente` (`classe_precedente`),
  ADD KEY `classe_successiva` (`classe_successiva`),
  ADD KEY `scuola` (`scuola`),
  ADD KEY `utente` (`utente`);

--
-- Indexes for table `indirizzi`
--
ALTER TABLE `indirizzi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indirizzi_configurazione`
--
ALTER TABLE `indirizzi_configurazione`
  ADD PRIMARY KEY (`configurazione`,`indirizzo`),
  ADD KEY `indirizzo` (`indirizzo`);

--
-- Indexes for table `scuole`
--
ALTER TABLE `scuole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scuola` (`scuola`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utenti_ibfk_1` (`scuola`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alunni`
--
ALTER TABLE `alunni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;
--
-- AUTO_INCREMENT for table `classi`
--
ALTER TABLE `classi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `configurazione`
--
ALTER TABLE `configurazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `indirizzi`
--
ALTER TABLE `indirizzi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `scuole`
--
ALTER TABLE `scuole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `alunni`
--
ALTER TABLE `alunni`
  ADD CONSTRAINT `alunni_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`),
  ADD CONSTRAINT `alunni_ibfk_2` FOREIGN KEY (`utente`) REFERENCES `utenti` (`id`),
  ADD CONSTRAINT `tag_fk` FOREIGN KEY (`tag`) REFERENCES `tag` (`id`);

--
-- Constraints for table `classi`
--
ALTER TABLE `classi`
  ADD CONSTRAINT `classi_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`);

--
-- Constraints for table `classi_composte`
--
ALTER TABLE `classi_composte`
  ADD CONSTRAINT `classi_composte_ibfk_1` FOREIGN KEY (`classe`) REFERENCES `classi` (`id`),
  ADD CONSTRAINT `classi_composte_ibfk_2` FOREIGN KEY (`alunno`) REFERENCES `alunni` (`id`),
  ADD CONSTRAINT `classi_composte_ibfk_3` FOREIGN KEY (`configurazione`) REFERENCES `configurazione` (`id`) on DELETE CASCADE;

--
-- Constraints for table `configurazione`
--
ALTER TABLE `configurazione`
  ADD CONSTRAINT `configurazione_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`alunno`) REFERENCES `alunni` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`classe_precedente`) REFERENCES `classi` (`id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`classe_successiva`) REFERENCES `classi` (`id`),
  ADD CONSTRAINT `history_ibfk_4` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`),
  ADD CONSTRAINT `history_ibfk_5` FOREIGN KEY (`utente`) REFERENCES `utenti` (`id`);

--
-- Constraints for table `indirizzi_configurazione`
--
ALTER TABLE `indirizzi_configurazione`
  ADD CONSTRAINT `indirizzi_configurazione_ibfk_1` FOREIGN KEY (`configurazione`) REFERENCES `configurazione`  (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indirizzi_configurazione_ibfk_2` FOREIGN KEY (`indirizzo`) REFERENCES `indirizzi` (`id`);

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`);

--
-- Constraints for table `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `scuola_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`),
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`);-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2017 at 09:44 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `composizione_classi`
--

DROP DATABASE IF EXISTS composizione_classi;
CREATE DATABASE composizione_classi;
USE composizione_classi;

-- --------------------------------------------------------

--
-- Table structure for table `alunni`
--

CREATE TABLE `alunni` (
  `id` int(11) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `matricola` varchar(50) NOT NULL,
  `cf` char(16) NOT NULL,
  `desiderata` char(16) DEFAULT NULL,
  `sesso` char(1) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `cap` varchar(15) NOT NULL,
  `nazionalita` varchar(25) NOT NULL,
  `legge_107` varchar(25) DEFAULT NULL,
  `legge_104` varchar(25) DEFAULT NULL,
  `classe_precedente` varchar(5) DEFAULT NULL,
  `scelta_indirizzo` varchar(50) NOT NULL,
  `anno_scolastico` varchar(15) NOT NULL,
  `cod_cat` varchar(10) NOT NULL,
  `voto` int(1) NOT NULL,
  `classe_futura` varchar(50) NOT NULL,
  `scuola` int(11) DEFAULT NULL,
  `utente` int(11) DEFAULT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alunni`
--

INSERT INTO `alunni` (`id`, `cognome`, `nome`, `matricola`, `cf`, `desiderata`, `sesso`, `data_di_nascita`, `cap`, `nazionalita`, `legge_107`, `legge_104`, `classe_precedente`, `scelta_indirizzo`, `anno_scolastico`, `cod_cat`, `voto`, `classe_futura`, `scuola`, `utente`, `descrizione`, `tag`) VALUES
(2, 'VINCO', 'JACOPO', '17258', 'VNCJCP03C28F861N', 'SSSNDR03E03L781F', 'M', '2003-03-28', '37021', 'ITALIANA', 'DSA', '', '1A', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B073', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(3, 'PILOTTO', 'DAMIANO', '17644', 'PLTDMN03P04L781K', 'BRTPLR03M15F861D', 'M', '2003-09-04', '37030', 'ITALIANA', '', '', '1A', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E489', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(4, 'ZEGGIOTTI', 'ETTORE', '17652', 'ZGGTTR03H14I775O', 'MRCGRL03D16B296S', 'M', '2003-06-14', '37038', 'CINGALESE', '', '', '1A', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I775', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(5, 'DEL FAVERO', 'MASSIMO', '17467', 'DLFMSM03R27F241I', 'CSTNCL03T08L781J', 'M', '2003-10-27', '31030', 'ITALIANA', '', 'cieco', '1A', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'A360', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(6, 'MALVEZZI', 'NICHOLAS', '17620', 'MLVNHL03C20G489G', 'DMRFNC03R21L781A', 'M', '2003-03-20', '37013', 'BANGLADESE', '', '', '1B', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B709', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(7, 'ARCARI', 'MATTEO', '17655', 'RCRMTT03E30L781M', 'CCCLSN03E10L781V', 'M', '2003-05-30', '37030', 'ROMENA', '', '', '1B', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E489', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(8, 'ZATTONI', 'MATTIA', '17010', 'ZTTMTT03D16F861C', 'FGNDRD03C20L781X', 'M', '2003-04-16', '37131', 'CINGALESE', '', '', '1B', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(9, 'SPERI', 'ROBERTO', '17347', 'SPRRRT03T30F861B', 'SPTNDR03S17G791O', 'M', '2003-12-30', '37026', 'ITALIANA', 'DSA', '', '1C', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'G481', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(10, 'BISCA', 'ROBERTO-MARIO', '17408', 'BSCRRT02M20Z129J', 'DBTTMS03R01L781V', 'M', '2002-08-20', '37066', 'ITALIANA', '', '', '1C', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(11, 'GUARINON', 'ANNIE', '17159', 'GRNNNA03T63F861Q', 'CNTSML03B28L781K', 'F', '2003-12-23', '37030', 'ITALIANA', '', '', '1C', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E489', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(12, 'SOSSELLA', 'ANDREA', '17403', 'SSSNDR03E03L781F', 'VNCJCP03C28F861N', 'M', '2003-05-03', '37050', 'ITALIANA', '', '', '1C', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'G080', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(13, 'BERTANI', 'PIERLORENZO', '17619', 'BRTPLR03M15F861D', 'PLTDMN03P04L781K', 'M', '2003-08-15', '37011', 'CINESE', '', '', '1C', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'A650', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(14, 'MARCONI', 'GABRIELE', '17421', 'MRCGRL03D16B296S', 'ZGGTTR03H14I775O', 'M', '2003-04-16', '37026', 'ROMENA', '', '', '1D', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G481', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(15, 'CASTAGNA', 'NICOLO''', '17441', 'CSTNCL03T08L781J', 'DLFMSM03R27F241I', 'M', '2003-12-08', '37100', 'ROMENA', '', '', '1D', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(16, 'DE MARTINI DI VALLE APERTA', 'FRANCESCO', '17485', 'DMRFNC03R21L781A', 'MLVNHL03C20G489G', 'M', '2003-10-21', '37126', 'ITALIANA', '', '', '1D', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(17, 'CICCHELLERO', 'ALESSANDRO', '17508', 'CCCLSN03E10L781V', 'RCRMTT03E30L781M', 'M', '2003-05-10', '37100', 'MAROCCHINA', '', '', '1E', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(18, 'FAGNANI', 'EDOARDO', '17569', 'FGNDRD03C20L781X', 'ZTTMTT03D16F861C', 'M', '2003-03-20', '37122', 'ITALIANA', '', '', '1E', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(19, 'SPATARO', 'ANDREA', '17585', 'SPTNDR03S17G791O', 'SPRRRT03T30F861B', 'M', '2003-11-17', '37063', 'PARAGUAIANA', '', '', '1E', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E349', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(20, 'DE BATTISTI', 'TOMMASO', '17115', 'DBTTMS03R01L781V', 'BSCRRT02M20Z129J', 'M', '2003-10-01', '37063', 'ITALIANA', '', '', '1F', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E349', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(21, 'CANTERI', 'SAMUELE', '17118', 'CNTSML03B28L781K', 'GRNNNA03T63F861Q', 'M', '2003-02-28', '37030', 'ROMENA', '', '', '1F', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'E489', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(22, 'ARMANI', 'MARCO', '17255', 'RMNMRC03B14L949D', '', 'M', '2003-02-14', '37067', 'ITALIANA', '', '', '1F', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L567', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(23, 'ANASTASOV', 'KONSTANTIN', '17545', 'NSTKST03T18L781L', '', 'M', '2003-12-18', '37020', 'ITALIANA', '', '', '1G', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C538', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(24, 'DI BERARDINO', 'LORENZO', '17674', 'DBRLNZ03C16L781D', '', 'M', '2003-03-16', '37138', 'TUNISINA', '', '', '1G', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(25, 'FASOLI', 'JACOPO', '17312', 'FSLJCP03M01L781S', '', 'M', '2003-08-01', '37066', 'FILIPPINA', '', '', '1G', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(26, 'FRACCA', 'ALBERTO', '17449', 'FRCLRT03P20L781P', '', 'M', '2003-09-20', '37100', 'ITALIANA', '', '', '1G', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(27, 'CHINOTTI', 'GABRIELE', '17457', 'CHNGRL03D15B296I', '', 'M', '2003-04-15', '37026', 'ITALIANA', '', '', '1G', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G481', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(28, 'FERRARI', 'FRANCESCO', '17492', 'FRRFNC03E15F861S', '', 'M', '2003-05-15', '37066', 'ALBANESE', '', '', '1G', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(29, 'CERIANI', 'LUCA', '17631', 'CRNLCU03P12L781X', '', 'M', '2003-09-12', '37135', 'ROMENA', '', '', '1G', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(30, 'FERRARI', 'MARIO', '17036', 'FRRMRA03T16L781Y', '', 'M', '2003-12-16', '37136', 'MOLDAVA', '', '', '1G', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(31, 'BEVERARI', 'MICHELE', '17337', 'BVRMHL03L11L781K', '', 'M', '2003-07-11', '37026', 'ITALIANA', '', '', '1G', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'G481', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(32, 'NOGARA', 'LUCA', '17372', 'NGRLCU03L02I775Y', '', 'M', '2003-07-02', '37030', 'PARAGUAIANA', '', '', '1H', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'C897', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(33, 'GHERMANSCHI', 'SERGIU', '17450', 'GHRSRG02D14Z140I', '', 'M', '2002-04-14', '37135', 'CINGALESE', '', '', '1H', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(34, 'FRAZZA', 'GIOVANNI', '17517', 'FRZGNN03M28L781P', '', 'M', '2003-08-28', '37066', 'ITALIANA', '', '', '1H', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(35, 'PERINA', 'EDOARDO', '17526', 'PRNDRD03L09L781P', '', 'M', '2003-07-09', '37060', 'ITALIANA', '', '', '1H', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'F789', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(36, 'HODEA', 'VASILE', '17668', 'VRTF03000V069138', '', 'M', '2003-07-04', '37020', 'ITALIANA', '', '', '1H', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'C538', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(37, 'PAVONI', 'ALBERTO', '17395', 'PVNLRT03L07F861H', '', 'M', '2003-07-07', '37012', 'ITALIANA', '', '', '1I', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B296', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(38, 'VERONESI', 'ELISA', '17456', 'VRNLSE03H46L781U', '', 'F', '2003-06-06', '37023', 'ROMENA', '', '', '1I', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E171', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(39, 'LUPO', 'ALESSANDRO', '17507', 'LPULSN03D12L781U', '', 'M', '2003-04-12', '37066', 'ITALIANA', 'DSA', '', '1I', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(40, 'MILANI', 'FILIPPO', '17580', 'MLNFPP03R01L781Q', '', 'M', '2003-10-01', '37131', 'ALBANESE', '', '', '1I', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(41, 'BALLA', 'FILIPPO', '17656', 'BLLFPP03L10B296A', '', 'M', '2003-07-10', '37060', 'CINGALESE', '', '', '1I', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'I826', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(42, 'LORENZINI', 'MATTEO', '17399', 'LRNMTT03P08E34VH', '', 'M', '2003-09-08', '37068', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L869', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(43, 'LUZENTI', 'SILVIA', '17599', 'LZNSLV03B43F861H', '', 'F', '2003-02-03', '37014', 'MOLDAVA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C225', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(44, 'FORONCELLI', 'CLAUDIO', '17610', 'FRNCLD03S02L781M', '', 'M', '2003-11-02', '37069', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L869', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(45, 'LORENZINI', 'MATTIA', '17235', 'LRNMTT03P08E3Q9E', '', 'M', '2003-09-08', '37068', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L869', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(46, 'MIRANDOLA', 'MICHAEL', '17475', 'MRNMHL03T11I775D', '', 'M', '2003-12-11', '37059', 'MOLDAVA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'M172', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(47, 'PASOTTO', 'GIOELE', '16958', 'PSTGLI03P27G224X', '', 'M', '2003-09-27', '37058', 'MAROCCHINA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'H944', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(48, 'BRUSCO', 'AURORA', '17043', 'BRSRRA03T48G489J', '', 'F', '2003-12-08', '37014', 'LETTONE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C225', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(49, 'BATTISTONI', 'MARCO', '17243', 'BTTMRC03T09E349A', '', 'M', '2003-12-09', '37068', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L869', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(50, 'MARINI', 'ANDREA', '17594', 'MRNNDR03A14B296H', '', 'M', '2003-01-14', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'B154', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(51, 'BAZGU', 'CLAUDIO', '17802', 'BZGCLD03D11I775C', '', 'M', '2003-04-11', '37060', 'BRASILIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B304', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(52, 'ZORZI', 'ALEX', '17925', 'ZRZLXA03A02G489X', '', 'M', '2003-01-02', '37011', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'A650', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(53, 'CASTELLANI', 'DAVIDE', '17957', 'CSTDVD03M05F861O', '', 'M', '2003-08-05', '37100', 'MAROCCHINA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(54, 'FALSAROLO', 'LEONARDO', '17972', 'FLSLRD03E19L781Z', '', 'M', '2003-05-19', '37121', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(55, 'SACCHETTO', 'RICCARDO', '18038', 'SCCRCR03C11F861U', '', 'M', '2003-03-11', '37024', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F861', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(56, 'CALIARI', 'FEDERICO', '18041', 'CLRFRC03C06G489D', '', 'M', '2003-03-06', '37012', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'B296', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(57, 'GRIGOR', 'CORNEL', '17893', 'GRGCNL03H26L781Y', '', 'M', '2003-06-26', '', 'NIGERIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(58, 'FAKRI', 'HAMZA', '17908', 'FKRHMZ03B26L781I', '', 'M', '2003-02-26', '37134', 'GHANESE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(59, 'FIORIO', 'ASIA', '17877', 'FRISAI03E50E512O', '', 'F', '2003-05-10', '37050', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E358', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(60, 'FONTANA', 'SAMUELE', '18025', 'FNTSML03R09B296U', '', 'M', '2003-10-09', '37010', 'GHANESE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'A061', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(61, 'BENETTON', 'DIEGO', '17297', 'BNTDGI03A09I775U', '', 'M', '2003-01-09', '37038', 'GHANESE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I775', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(62, 'OJOG', 'MARIO STELIAN', '17489', 'JGOMST03D26L781P', 'MRTNCL03B14F861S', 'M', '2003-04-26', '37136', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(63, 'MARCOLINI', 'MATTIA', '17593', 'MRCMTT03B05L781I', 'GRMNRC03B01F861D', 'M', '2003-02-05', '37030', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'E489', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(64, 'FERRARI', 'FILIPPO', '17673', 'FRRFPP03C21L949Z', 'FVTMKL03M06G489Y', 'M', '2003-03-21', '37067', 'ITALIANA', 'DSA', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L567', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(65, 'GROSSELLI', 'RICCARDO', '17677', 'GRSRCR03D04L781J', 'TRJLSN03P19L781X', 'M', '2003-04-04', '37029', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I109', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(66, 'OTTAVIANI', 'MATTIA', '17678', 'TTVMTT03D02L781K', 'PUIRRT03C11L781C', 'M', '2003-04-02', '37030', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C897', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(67, 'SIGNORATO', 'FILIPPO', '17679', 'SGNFPP03M12F861P', 'BLLTMS03T10L781W', 'M', '2003-08-12', '37036', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I003', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(68, 'CINQUETTI', 'THOMAS', '17680', 'CNQTMS03S01L781B', 'ZNTNRC03L06F861W', 'M', '2003-11-01', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'C078', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(69, 'VENTURINI', 'GABRIELE', '17681', 'VNTGRL03H29L781M', 'MNDDNL03H15B296H', 'M', '2003-06-29', '37131', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(70, 'COASSIN', 'DOMINIC', '17682', 'CSSDNC03R30G888Y', 'GRLCRS03M21B296O', 'M', '2003-10-30', '37138', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(71, 'ZANIN', 'DAVIDE', '17683', 'ZNNDVD03S02L781Z', 'MRNMTT03E28E349O', 'M', '2003-11-02', '37131', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(72, 'POIATA', 'ANDRIAN', '17685', 'PTONRN02H23Z140W', 'MRCFNC02H01L781T', 'M', '2002-06-23', '37134', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(73, 'COMERLATI', 'FRANCESCO ANGELO', '17686', 'CMRFNC03T07B296N', 'BTNRDN02M18Z140R', 'M', '2003-12-07', '37010', 'PERUVIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'G365', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(74, 'PAMPALONE', 'FEDERICO', '17687', 'PMPFRC03R31F861A', '', 'M', '2003-10-31', '37136', 'CUBANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(75, 'ALDRIGHETTI', 'MAXIMO', '17688', 'LDRMXM03L04L781N', '', 'M', '2003-07-04', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C078', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(76, 'VITALE', 'DANIELE', '17689', 'VTLDNL03T03L781Y', '', 'M', '2003-12-03', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(77, 'CELLA', 'RAFFAELE', '17690', 'CLLRFL03T20I775X', '', 'M', '2003-12-20', '37014', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'C225', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(78, 'KAUR', 'RITIKA', '17691', 'KRARTK03L41Z222G', '', 'F', '2003-07-01', '37051', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B107', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(79, 'GIRARDI', 'NICCOLO''', '17692', 'GRRNCL03T30B296R', '', 'M', '2003-12-30', '37026', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G481', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(80, 'SACCO', 'DIEGO', '17693', 'SCCDGI03M03L781G', '', 'M', '2003-08-03', '37139', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(81, 'BRUTTI', 'RICCARDO ANTONIO', '17694', 'BRTRCR02D03L781T', '', 'M', '2002-04-03', '37100', 'ITALIANA', 'DSA', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(82, 'MARTIGNONI', 'NICOLO''', '17695', 'MRTNCL03B14F861S', 'JGOMST03D26L781P', 'M', '2003-02-14', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'G365', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(83, 'GIRIMONDO', 'ENRICO', '17696', 'GRMNRC03B01F861D', 'MRCMTT03B05L781I', 'M', '2003-02-01', '37022', 'NIGERIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'D818', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(84, 'FAVETTA', 'MIKAEL', '17697', 'FVTMKL03M06G489Y', 'FRRFPP03C21L949Z', 'M', '2003-08-06', '37013', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'B709', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(85, 'TRAJANOVSKI', 'ALEKSANDAR', '17698', 'TRJLSN03P19L781X', 'GRSRCR03D04L781J', 'M', '2003-09-19', '37023', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E171', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(86, 'PUIU', 'ROBERT', '17699', 'PUIRRT03C11L781C', 'TTVMTT03D02L781K', 'M', '2003-03-11', '37131', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(87, 'BELLE''', 'TOMMASO', '17700', 'BLLTMS03T10L781W', 'SGNFPP03M12F861P', 'M', '2003-12-10', '37134', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(88, 'ZANETTI', 'ENRICO', '17701', 'ZNTNRC03L06F861W', 'CNQTMS03S01L781B', 'M', '2003-07-06', '37141', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(89, 'MONDIA', 'DANILO', '17703', 'MNDDNL03H15B296H', 'VNTGRL03H29L781M', 'M', '2003-06-15', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C370', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(90, 'GIRELLA', 'CHRISTIAN', '17705', 'GRLCRS03M21B296O', 'CSSDNC03R30G888Y', 'M', '2003-08-21', '37064', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G945', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(91, 'MIRANDOLA', 'MATTIA', '17706', 'MRNMTT03E28E349O', 'ZNNDVD03S02L781Z', 'M', '2003-05-28', '37068', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L869', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(92, 'MARCHIO', 'FRANCESCO', '17707', 'MRCFNC02H01L781T', 'PTONRN02H23Z140W', 'M', '2002-06-01', '37137', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(93, 'BUTNARU', 'RODION', '17708', 'BTNRDN02M18Z140R', 'CMRFNC03T07B296N', 'M', '2002-08-18', '37030', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C412', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(94, 'CESARO', 'ANDREA', '17709', 'CSRNDR03C06L781Y', '', 'M', '2003-03-06', '37136', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(95, 'SOFFIATI', 'LORENZO', '17710', 'SFFLNZ03P24L781K', '', 'M', '2003-09-24', '37134', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(96, 'ZAMBELLI', 'MATTEO', '17711', 'ZMBMTT03P20F861Q', '', 'M', '2003-09-20', '37020', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'C538', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(97, 'ROMIO', 'LORENZO', '17712', 'RMOLNZ03L21L781D', '', 'M', '2003-07-21', '37136', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(98, 'SANDON', 'OLIVER THOMAS', '17713', 'SNDLRT03H30G489J', '', 'M', '2003-06-30', '37019', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'G489', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(99, 'BARBI', 'PIETRO', '17715', 'BRBPTR03T03B296O', '', 'M', '2003-12-03', '37012', 'CUBANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'B296', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(100, 'CONTI', 'ILARIA', '17716', 'CNTLRI03D59L781C', '', 'F', '2003-04-19', '37131', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(101, 'BERTAGNIN', 'RICCARDO', '17717', 'BRTRCR03C20I775X', '', 'M', '2003-03-20', '37032', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F508', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(102, 'SALZANI', 'LUCA', '17718', 'SLZLCU03H20L781M', '', 'M', '2003-06-20', '37057', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(103, 'BRUTTI', 'ELIA', '17719', 'BRTLEI03A26B107V', '', 'M', '2003-01-26', '37063', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E349', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(104, 'PAROLINI', 'NICOLO''', '17720', 'PRLNCL03P10G489C', '', 'M', '2003-09-10', '37019', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'G489', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(105, 'GIURIATO', 'ANDREA', '17721', 'GRTNDR03E01I775L', '', 'M', '2003-05-01', '37042', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B402', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(106, 'SCHINO', 'ROMOLO GABRIELE', '17722', 'SCHRLG03A07L781M', '', 'M', '2003-01-07', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(107, 'KPOTOSU ENGUIX', 'CARLOS ANGEL', '17723', 'KPTCLS02L06Z131B', '', 'M', '2002-07-06', '37138', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(108, 'GIACOMI', 'FRANCESCO MARIA', '17724', 'GCMFNC03S12B296K', '', 'M', '2003-11-12', '37139', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(109, 'BERTOLO', 'MATTEO', '17725', 'BRTMTT03L20L781T', '', 'M', '2003-07-20', '37141', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(110, 'SCASSERLE', 'MATTIA', '17726', 'SCSMTT03H27B296L', '', 'M', '2003-06-27', '37026', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G481', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(111, 'PAOLINI', 'SIMONE', '17727', 'PLNSMN03D16L781Q', '', 'M', '2003-04-16', '37062', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L949', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(112, 'BAISEL', 'JAMES OBED', '17728', 'BSLJSB03A29L781E', '', 'M', '2003-01-29', '37138', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(113, 'MERLO', 'SARA', '17729', 'MRLSRA03T64F861Y', '', 'F', '2003-12-24', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(114, 'FERNANDO', 'RICHARD JUNIOR', '17730', 'FRNRHR03A14L949R', '', 'M', '2003-01-14', '37129', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(115, 'CIOT', 'ANDREI', '17731', 'CTINDR02S23Z129W', '', 'M', '2002-11-23', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(116, 'LIAO', 'EMILIANO', '17732', 'LIAMLN03A27I838L', '', 'M', '2003-01-27', '33100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L483', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(117, 'RIGO', 'DANIEL', '17733', 'RGIDNL03L09L781C', '', 'M', '2003-07-09', '37026', 'MAROCCHINA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'G481', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(118, 'BERTOLDO', 'MATTEO', '17734', 'BRTMTT03H19I775I', '', 'M', '2003-06-19', '37047', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'H783', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(119, 'SCAMPERLE', 'MATTIA', '17735', 'SCMMTT03C13L781A', '', 'M', '2003-03-13', '37066', 'TUNISINA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(120, 'BABIC', 'STEFAN', '17736', 'BBCSFN03E08L174F', '', 'M', '2003-05-08', '37014', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C225', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(121, 'FERRARI', 'RICCARDO', '17737', 'FRRRCR03L16E349H', '', 'M', '2003-07-16', '37057', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(122, 'GALLI', 'MARCO', '17738', 'GLLMRC03C26L781K', '', 'M', '2003-03-26', '37139', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(123, 'POLICANTE', 'FRANCESCA', '17739', 'PLCFNC03A64L781Y', '', 'F', '2003-01-24', '37135', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(124, 'NAPA', 'LIFE ALESSANDRO', '17740', 'NPALLS04A23Z404X', '', 'M', '2004-01-23', '37057', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(125, 'CARLUCCIO', 'GABRIELE', '17741', 'CRLGRL03A20L781R', '', 'M', '2003-01-20', '37066', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(126, 'CASTAGNA', 'FILIPPO', '17742', 'CSTFPP03P10E512O', '', 'M', '2003-09-10', '37050', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G297', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(127, 'SALGARI', 'FRANCESCO', '17743', 'SLGFNC03A02L781H', '', 'M', '2003-01-02', '37059', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'M172', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(128, 'ZAMBALDO', 'MICHELE', '17744', 'ZMBMHL03S07L781O', '', 'M', '2003-11-07', '37132', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(129, 'SABAINI', 'CHIARA', '17745', 'SBNCHR04B65L781Z', '', 'F', '2004-02-25', '37011', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'A650', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(130, 'PASOTTO', 'MATTIA', '17746', 'PSTMTT03T15L781S', '', 'M', '2003-12-15', '37059', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'M172', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(131, 'ZANONI', 'FABIO', '17747', 'ZNNFBA02P07B296K', '', 'M', '2002-09-07', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I826', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(132, 'GHELLERE', 'NICOLO''', '17748', 'GHLNCL03R16I775Y', '', 'M', '2003-10-16', '37055', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H540', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(133, 'KAUR', 'JASMEEN', '17749', 'KRAJMN02S46Z222B', '', 'F', '2002-11-06', '37042', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B402', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(134, 'SCOGNAMIGLIO', 'STEFANO', '17751', 'SCGSFN03R06L781G', '', 'M', '2003-10-06', '37068', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L869', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(135, 'MODESTI', 'DAVIDE', '17752', 'MDSDVD03R03L781A', '', 'M', '2003-10-03', '37026', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G481', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(136, 'PEZZO', 'MICHELE', '17753', 'PZZMHL03B24F861G', '', 'M', '2003-02-24', '37023', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E171', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(137, 'PRETTO', 'SAMUELE LUIGI', '17754', 'PRTSLL03M29L781S', '', 'M', '2003-08-29', '37066', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(138, 'CASTAGNEDI', 'DAVIDE', '17755', 'CSTDVD03L05F861A', '', 'M', '2003-07-05', '37132', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(139, 'BERTAIOLA', 'MATTEO', '17756', 'BRTMTT03A24B296S', '', 'M', '2003-01-24', '37023', 'MOLDAVA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E171', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(140, 'BELLAMOLI', 'RICCARDO', '17757', 'BLLRCR03H24G489A', '', 'M', '2003-06-24', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I826', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(141, 'DI STEFANO', 'CARLOTTA', '17758', 'DSTCLT03M57D284D', '', 'F', '2003-08-17', '37030', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E489', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(142, 'CONTRI', 'EMANUELE', '17759', 'CNTMNL03S03L781E', '', 'M', '2003-11-03', '37042', 'MOLDAVA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B402', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(143, 'GALLUCCI', 'ARMANDO', '17760', 'GLLRND03S27L781L', '', 'M', '2003-11-27', '37134', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(144, 'GIRELLI', 'ALESSANDRO', '17761', 'GRLLSN03B25G489F', '', 'M', '2003-02-25', '37013', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B709', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(145, 'NDOKAJ', 'ELVIS', '17762', 'NDKLVS03T03L781V', '', 'M', '2003-12-03', '37059', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'M172', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(146, 'CASTELLO', 'ANDREA', '17763', 'CSTNDR03E07E897X', '', 'M', '2003-05-07', '37030', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C897', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(147, 'TODESCHINI', 'RICCARDO', '17764', 'TDSRCR03T16L781I', '', 'M', '2003-12-16', '38138', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(148, 'SENHAJ', 'MEHDI', '17765', 'SNHMHD03L17E349G', '', 'M', '2003-07-17', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'D419', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(149, 'PICOTTINI', 'FILIPPO', '17766', 'PCTFPP03B25L781T', '', 'M', '2003-02-25', '37017', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E502', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(150, 'VERDEFLOR', 'JONAS JAMES MENDAZA', '17767', 'VRDJSJ03T13L781W', '', 'M', '2003-12-13', '37132', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(151, 'CASIELLO', 'GIOELE', '17768', 'CSLGLI03T22F861W', '', 'M', '2003-12-22', '37024', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'D818', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(152, 'PRINCIPE', 'GABRIELE', '17769', 'PRNGRL03R06B296S', '', 'M', '2003-10-06', '37012', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'B296', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(153, 'BOROTTO', 'LORENZO', '17770', 'BRTLNZ03S11L781K', '', 'M', '2003-11-11', '37131', 'ITALIANA', '', 'cieco', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(154, 'CIANCETTA', 'THOMAS', '17771', 'CNCTMS03R10G489G', 'NTNDVD03P29L781L', 'M', '2003-10-10', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'A061', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(155, 'BACCO', 'MICHELE', '17772', 'BCCMHL02M16F861K', 'KCOMLD03E13Z100D', 'M', '2002-08-16', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I826', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(156, 'GENTILE', 'DANIELE', '17773', 'GNTDNL03D24L781E', 'JTIBNS03A12Z222Q', 'M', '2003-04-24', '37050', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G080', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(157, 'UEBERBACHER', 'RICCARDO', '17774', 'BRBRCR03R22A952C', 'PRTNCL03H02I775E', 'M', '2003-10-22', '37011', 'MOLDAVA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'A650', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(158, 'ZANETTI', 'NICOLO''', '17775', 'ZNTNCL03C28G489X', 'GRNGLI02B28G914B', 'M', '2003-03-28', '37017', 'CROATA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E502', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(159, 'STRUGARU', 'IOAN CRISTIAN', '17776', 'STRNRS03R07B296H', 'SCLLNZ03L14L781Y', 'M', '2003-10-07', '37069', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L949', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(160, 'SANDRI', 'MICHELE', '17777', 'SNDMHL03D01L781P', 'TBRLND03A18Z140I', 'M', '2003-04-01', '37135', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(161, 'SANTARPIA', 'THOMAS', '17778', 'SNTTMS03A19L781B', 'FRNMRC03S17L781M', 'M', '2003-01-19', '37068', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L869', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(162, 'ZUANAZZI', 'ALESSANDRO', '17779', 'ZNZLSN03L05B296Q', 'DTTDNC04A16H224G', 'M', '2003-07-05', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(163, 'ZANCANARO', 'DAVIDE', '17780', 'ZNCDVD03H26F861V', 'FRNDVD03S17L781G', 'M', '2003-06-26', '37024', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'F861', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(164, 'DI CESARE', 'DANIELE', '17781', 'DCSDNL03L12B296V', 'MLTSNM03S23F861S', 'M', '2003-07-12', '37138', 'MOLDAVA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(165, 'CRISTANELLI', 'ALESSANDRO', '17782', 'CRSLSN03R21B296K', 'DSLTMS03P24F861C', 'M', '2003-10-21', '37026', 'GHANESE', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'G481', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(166, 'TINAZZI', 'PATRICK', '17783', 'TNZPRC02D17F382Y', 'BLKHMD01S17Z330F', 'M', '2002-04-17', '37038', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'I775', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(167, 'BRUNO', 'GIACOMO', '17784', 'BRNGCM03L08F861N', 'MCCGCM04A30E335H', 'M', '2003-07-08', '37132', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(168, 'RASITI', 'SENDIN', '17785', 'RSTSDN03H21L781H', 'MRLPTR03L27E349S', 'M', '2003-06-21', '37135', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(169, 'MAGGIO', 'MARCO', '17786', 'MGGMRC03D01L781E', 'MRNDVD03M19I775E', 'M', '2003-04-01', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C078', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(170, 'CARCERERI', 'NICOLA', '17787', 'CRCNCL03C03L781E', 'CMBDVD03H09L781H', 'M', '2003-03-03', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'I826', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(171, 'RIGONI', 'NICOLO''', '17788', 'RGNNCL03S15E349Z', 'ZHRMDO03D09I775S', 'M', '2003-11-15', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L396', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(172, 'PANAROTTO', 'ALEX', '17789', 'PNRLXA03R30I775R', 'LTTMTT03H07L781A', 'M', '2003-10-30', '37035', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H916', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(173, 'D''ANIELLO', 'GIOSUE'' PETRIT', '17790', 'DNLGPT03T26L781T', 'VNNLSN03D21E349Y', 'M', '2003-12-26', '37138', 'SENEGALESE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(174, 'MICHELONI', 'MICHELE', '17791', 'MCHMHL02L01B107Y', 'PRNNRC03C05L781R', 'M', '2002-07-01', '37057', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(175, 'ZORZI', 'IRENE', '17792', 'ZRZRNI03E47B296Q', 'GRMSMN03P15B296U', 'F', '2003-05-07', '37068', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L869', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(176, 'ANTONELLO', 'MATTIA', '17793', 'NTNMTT03H20L781I', 'MCCLNZ02B02F861P', 'M', '2003-06-20', '37124', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(177, 'BUSSOLA', 'FILIPPO', '17794', 'BSSFPP03S25L781Q', 'CMPDVD03P19B296R', 'M', '2003-11-25', '37135', 'CINESE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(178, 'SINGH', 'AMRITPAL', '17795', 'SNGMTP03P04I775M', 'BNFLSN03H28L781K', 'M', '2003-09-04', '37032', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F508', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(179, 'LAVARINI', 'DAVIDE', '17796', 'LVRDVD03M12F861D', 'BNFLNZ03B07E349J', 'M', '2003-08-12', '37020', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'E911', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(180, 'RAMADANI', 'BLEND', '17797', 'RMDBND03D28E349P', 'FRNLSS03C17I775H', 'M', '2003-04-28', '37063', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E349', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(181, 'DAL POZZO', 'RICCARDO', '17798', 'DLPRCR03A17L781P', 'CGLCRS03M30L781B', 'M', '2003-01-17', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C078', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(182, 'AARIFI', 'BADER', '17799', 'RFABDR03R05E349W', 'PRTCRS03A14G489R', 'M', '2003-10-05', '37060', 'MAROCCHINA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F789', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(183, 'DANZI', 'FRANCESCO WAHL', '17800', 'DNZFNC02T30D284M', 'GLBBRD03L09L781Z', 'M', '2002-12-30', '37019', 'CROATA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G489', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(184, 'LORENTINO', 'PIETRO', '17801', 'LRNPTR03S04F861M', 'CLTZNE03P26L781J', 'M', '2003-11-04', '37024', 'NIGERIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F861', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(185, 'ZANELLA', 'ALESSIO', '17803', 'ZNLLSS03T28L781A', 'TMSFRC03E07G633K', 'M', '2003-12-28', '46040', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F705', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(186, 'TRAINA', 'NICOLO''', '17804', 'TRNNCL03P19F861J', 'FRRNDR03E10B296Q', 'M', '2003-09-19', '37139', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(187, 'BOSCO', 'MARCO', '17805', 'BSCMRC03H07B296J', '', 'M', '2003-06-07', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G365', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(188, 'POPA', 'IONUT-CIPRIAN', '17806', 'PPONCP03D13Z129Z', '', 'M', '2003-04-13', '37013', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B709', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(189, 'GARMACIA', 'MARCO-ANDREI', '17807', 'GRMMCN03R10L781A', '', 'M', '2003-10-10', '37057', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'H924', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(190, 'GRANZOTTO', 'LUDOVICO', '17808', 'GRNLVC03B12F443G', '', 'M', '2003-02-12', '37026', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G481', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(191, 'CAPUZZO', 'FILIPPO', '17809', 'CPZFPP03C24F861M', '', 'M', '2003-03-24', '37015', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'I259', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(192, 'ZAMPIERI', 'DAVIDE', '17810', 'ZMPDVD03L10L781W', '', 'M', '2003-07-10', '37066', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'I821', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(193, 'OLIVIERI', 'MICHELE', '17811', 'LVRMHL03S08B296I', '', 'M', '2003-11-08', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'I826', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(194, 'TOFFALINI', 'FEDERICO', '17812', 'TFFFRC03H01L781A', '', 'M', '2003-06-01', '37069', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L949', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(195, 'FINI', 'TOMMASO', '17813', 'FNITMS03D10L781T', '', 'M', '2003-04-10', '37124', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(196, 'EDEGBE', 'OSAGIE MILTON', '17814', 'DGBSML03L19F861Q', '', 'M', '2003-07-19', '37036', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I003', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(197, 'CIVADDA', 'GABRIELE', '17815', 'CVDGRL03H10L781N', '', 'M', '2003-06-10', '37131', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(198, 'BERBEGLIA', 'WALTER', '17816', 'BRBWTR03M05A176X', '', 'M', '2003-08-05', '37068', 'CINGALESE', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L869', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(199, 'TOTARO', 'PIERLUCA', '17817', 'TTRPLC03D22G489U', '', 'M', '2003-04-22', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'D118', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(200, 'MORI', 'MATTIA', '17818', 'MROMTT03L24L781Q', '', 'M', '2003-07-24', '37059', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'M172', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(201, 'ATZERI', 'ANDREA', '17819', 'TZRNDR03R28L781X', '', 'M', '2003-10-28', '37134', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(202, 'GIUZIO', 'MATTIA', '17820', 'GZIMTT03L05B296Z', '', 'M', '2003-07-05', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'A061', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(203, 'CARCERERI', 'MASSIMO', '17821', 'CRCMSM03M13B296T', '', 'M', '2003-08-13', '37017', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E502', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(204, 'SIMONETTI', 'FILIPPO', '17822', 'SMNFPP03E02L781R', '', 'M', '2003-05-02', '37020', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'D317', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(205, 'SABRI', 'OMAR', '17823', 'SBRMRO03P08F861H', '', 'M', '2003-09-08', '37015', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I259', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(206, 'ANTONELLI', 'DAVIDE', '17824', 'NTNDVD03P29L781L', 'CNCTMS03R10G489G', 'M', '2003-09-29', '37142', 'MOLDAVA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(207, 'KOCI', 'AMARILDO', '17825', 'KCOMLD03E13Z100D', 'BCCMHL02M16F861K', 'M', '2003-05-13', '37030', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C897', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(208, 'JIT', 'BANSU', '17826', 'JTIBNS03A12Z222Q', 'GNTDNL03D24L781E', 'M', '2003-01-12', '37068', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L869', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(209, 'PORTA', 'NICCOLO''', '17827', 'PRTNCL03H02I775E', 'BRBRCR03R22A952C', 'M', '2003-06-02', '37042', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B402', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(210, 'GUERNIERI', 'GIULIO', '17828', 'GRNGLI02B28G914B', 'ZNTNCL03C28G489X', 'M', '2002-02-28', '37121', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(211, 'SCALFO', 'LORENZO', '17829', 'SCLLNZ03L14L781Y', 'STRNRS03R07B296H', 'M', '2003-07-14', '37069', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L949', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(212, 'TABARCEA', 'ALEXANDRU', '17831', 'TBRLND03A18Z140I', 'SNDMHL03D01L781P', 'M', '2003-01-18', '', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(213, 'FRANZINI', 'MARCO', '17833', 'FRNMRC03S17L781M', 'SNTTMS03A19L781B', 'M', '2003-11-17', '37050', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'I105', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(214, 'DATTOLA', 'DOMENICO', '17834', 'DTTDNC04A16H224G', 'ZNZLSN03L05B296Q', 'M', '2004-01-16', '37057', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(215, 'FRANZINI', 'DAVIDE', '17835', 'FRNDVD03S17L781G', 'ZNCDVD03H26F861V', 'M', '2003-11-17', '37050', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'I105', 8, 'PRIMA', 0, 5, 'descrizione', NULL);
INSERT INTO `alunni` (`id`, `cognome`, `nome`, `matricola`, `cf`, `desiderata`, `sesso`, `data_di_nascita`, `cap`, `nazionalita`, `legge_107`, `legge_104`, `classe_precedente`, `scelta_indirizzo`, `anno_scolastico`, `cod_cat`, `voto`, `classe_futura`, `scuola`, `utente`, `descrizione`, `tag`) VALUES
(216, 'MELOTTI', 'SIMONE MARIO', '17836', 'MLTSNM03S23F861S', 'DCSDNL03L12B296V', 'M', '2003-11-23', '37020', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'C538', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(217, 'DE SILVESTRI', 'THOMAS', '17837', 'DSLTMS03P24F861C', 'CRSLSN03R21B296K', 'M', '2003-09-24', '37023', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E171', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(218, 'OUBALKACEM', 'AHMID', '17839', 'BLKHMD01S17Z330F', 'TNZPRC02D17F382Y', 'M', '2001-11-17', '37138', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(219, 'MACIOCIA', 'GIACOMO', '17840', 'MCCGCM04A30E335H', 'BRNGCM03L08F861N', 'M', '2004-01-30', '86093', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B830', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(220, 'MORELLATO', 'PIETRO', '17841', 'MRLPTR03L27E349S', 'RSTSDN03H21L781H', 'M', '2003-07-27', '37063', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E349', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(221, 'MORANDO', 'DAVIDE', '17842', 'MRNDVD03M19I775E', 'MGGMRC03D01L781E', 'M', '2003-08-19', '37132', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(222, 'CAMBIOLI', 'DAVIDE', '17843', 'CMBDVD03H09L781H', 'CRCNCL03C03L781E', 'M', '2003-06-09', '37141', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(223, 'ZOUHRI', 'MOAAD', '17844', 'ZHRMDO03D09I775S', 'RGNNCL03S15E349Z', 'M', '2003-04-09', '37050', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'A737', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(224, 'ALIOTTA', 'MATTEO', '17846', 'LTTMTT03H07L781A', 'PNRLXA03R30I775R', 'M', '2003-06-07', '37137', 'ALBANESE', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(225, 'VANONI', 'ALESSANDRO', '17847', 'VNNLSN03D21E349Y', 'DNLGPT03T26L781T', 'M', '2003-04-21', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'F789', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(226, 'PERONI', 'ENRICO', '17848', 'PRNNRC03C05L781R', 'MCHMHL02L01B107Y', 'M', '2003-03-05', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(227, 'GERMINIANI', 'SIMONE', '17849', 'GRMSMN03P15B296U', 'ZRZRNI03E47B296Q', 'M', '2003-09-15', '37067', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L567', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(228, 'MECCHI', 'LORENZO', '17850', 'MCCLNZ02B02F861P', 'NTNMTT03H20L781I', 'M', '2002-02-02', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B304', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(229, 'COMPARIN', 'DAVIDE', '17851', 'CMPDVD03P19B296R', 'BSSFPP03S25L781Q', 'M', '2003-09-19', '37069', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L949', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(230, 'BONFANTE', 'ALESSANDRO', '17852', 'BNFLSN03H28L781K', 'SNGMTP03P04I775M', 'M', '2003-06-28', '37020', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F861', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(231, 'BONFANTE', 'LORENZO', '17853', 'BNFLNZ03B07E349J', 'LVRDVD03M12F861D', 'M', '2003-02-07', '37063', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'E349', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(232, 'FRANCHI', 'ALESSIO', '17854', 'FRNLSS03C17I775H', 'RMDBND03D28E349P', 'M', '2003-03-17', '37031', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E284', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(233, 'CUGILDI', 'CHRISTIAN', '17855', 'CGLCRS03M30L781B', 'DLPRCR03A17L781P', 'M', '2003-08-30', '37023', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E171', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(234, 'PEROTTI', 'CHRISTIAN', '17856', 'PRTCRS03A14G489R', 'RFABDR03R05E349W', 'M', '2003-01-14', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L287', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(235, 'GLIBA', 'BADEREDDINE', '17857', 'GLBBRD03L09L781Z', 'DNZFNC02T30D284M', 'M', '2003-07-09', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(236, 'COLATO', 'ZENO', '17858', 'CLTZNE03P26L781J', 'LRNPTR03S04F861M', 'M', '2003-09-26', '37057', 'ROMENA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(237, 'TAMASSIA', 'FEDERICO', '17859', 'TMSFRC03E07G633K', 'ZNLLSS03T28L781A', 'M', '2003-05-07', '37054', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F918', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(238, 'FERRO', 'ANDREA', '17860', 'FRRNDR03E10B296Q', 'TRNNCL03P19F861J', 'M', '2003-05-10', '37066', 'MAROCCHINA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'I821', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(239, 'MANTOVAN', 'ENRICO', '17862', 'MNTNRC03M25L781L', '', 'M', '2003-08-25', '37029', 'ALBANESE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I109', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(240, 'PANTALENA', 'LEONARDO', '17864', 'PNTLRD03P20L781U', '', 'M', '2003-09-20', '37060', 'CUBANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C078', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(241, 'HARKA', 'DANIEL', '17865', 'HRKDNL03A11D662B', '', 'M', '2003-01-11', '37020', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'D317', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(242, 'ILIEVSKI', 'ANDREJ', '17866', 'LVSNRJ03R14F861P', '', 'M', '2003-10-14', '37023', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E171', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(243, 'MASSELLA', 'KEVIN', '17867', 'MSSKVN03B25L949B', '', 'M', '2003-02-25', '37069', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L949', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(244, 'TAROCCO', 'MATTEO', '17868', 'TRCMTT03P05F861B', '', 'M', '2003-09-05', '37029', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I109', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(245, 'DELLA MORTE', 'ALESSANDRO', '17869', 'DLLLSN03S09B296V', '', 'M', '2003-11-09', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'I826', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(246, 'BORINI', 'SEBASTIANO', '17870', 'BRNSST03S26L781Z', '', 'M', '2003-11-26', '37051', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B107', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(247, 'TRUSCIGLIO', 'SALVATORE', '17873', 'TRSSVT03A10L781D', '', 'M', '2003-01-10', '37138', 'CINESE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(248, 'BIZZARRI', 'DAVIDE', '17874', 'BZZDVD03A29D284N', '', 'M', '2003-01-29', '37014', 'MAROCCHINA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C225', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(249, 'BONAFINI', 'NICOLE', '17875', 'BNFNCL03R64L781O', '', 'F', '2003-10-24', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I414', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(250, 'BOGONI', 'ANDREA', '17876', 'BGNNDR03B19L781V', '', 'M', '2003-02-19', '37142', 'ITALIANA', 'DSA', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(251, 'ORTOLANI', 'ANDREA', '17878', 'RTLNDR03A02L781K', '', 'M', '2003-01-02', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(252, 'DOS SANTOS', 'JHONATHAN', '17879', 'DSSJNT03H29Z602S', '', 'M', '2003-06-29', '37129', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(253, 'CORDIOLI', 'SIMONE', '17880', 'CRDSMN03C10F861P', '', 'M', '2003-03-10', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'I826', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(254, 'IANNUZZI', 'GIOVANNI PIO', '17881', 'NNZGNN03M27L781Q', '', 'M', '2003-08-27', '37062', 'ALBANESE', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L949', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(255, 'CASALI', 'ELIA', '17882', 'CSLLEI03B24D611L', '', 'M', '2003-02-24', '37131', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(256, 'PANIZZI', 'SIMONE', '17883', 'PNZSMN03M16L781G', '', 'M', '2003-08-16', '37131', 'TUNISINA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(257, 'PULLIA', 'DOMENICO GABRIELE', '17884', 'PLLDNC03D08L781F', '', 'M', '2003-04-08', '37132', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(258, 'FONTANABONA', 'LEONARDO', '17885', 'FNTLRD03H28L781K', '', 'M', '2003-06-28', '37012', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B296', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(259, 'PERLATO', 'DAVIDE', '17886', 'PRLDVD03T09I775U', '', 'M', '2003-12-09', '37039', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L364', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(260, 'ROLLI', 'ELIA', '17887', 'RLLLEI03B26B107M', '', 'M', '2003-02-26', '37050', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'I105', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(261, 'BARONE', 'NICOLAS', '17888', 'BRNNLS03B15L949R', '', 'M', '2003-02-15', '37066', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(262, 'BERTASSELLO', 'DAVIDE', '17889', 'BRTDVD03D21I775B', '', 'M', '2003-04-21', '37050', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'G297', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(263, 'LORENZINI', 'EDOARDO', '17890', 'LRNDRD03M10F861F', '', 'M', '2003-08-10', '37031', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'E284', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(264, 'VILLARDI', 'ALESSANDRO', '17891', 'VLLLSN03E11I775Q', '', 'M', '2003-05-11', '37062', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L949', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(265, 'CARAJOV', 'SERGIU', '17892', 'CRJSRG03M11Z140Y', '', 'M', '2003-08-11', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(266, 'CRISTANELLI', 'CAMILLA', '17894', 'CRSCLL03R58L781T', '', 'F', '2003-10-18', '37057', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(267, 'PIZZINI', 'LEONARDO', '17895', 'PZZLRD03C17L781G', '', 'M', '2003-03-17', '37014', 'MAROCCHINA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C225', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(268, 'CECCHINI', 'NICOLA', '17896', 'CCCNCL03M09F861K', '', 'M', '2003-08-09', '37015', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I259', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(269, 'PASQUETTO', 'MARCO', '17897', 'PSQMRC03H22G489R', '', 'M', '2003-06-22', '37064', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'G945', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(270, 'MARCHI', 'NICOLAS', '17898', 'MRCNLS03E01E512H', '', 'M', '2003-05-01', '37059', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'M172', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(271, 'CERESER', 'MATTEO', '17899', 'CRSMTT03T11F861Y', '', 'M', '2003-12-11', '37015', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I259', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(272, 'SCAGLIA', 'TOMMASO', '17900', 'SCGTMS03B10F861Q', '', 'M', '2003-02-10', '37015', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I259', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(273, 'MUNTEANU', 'ROBERTO ANDREI', '17901', 'MNTRRT03L24G489W', '', 'M', '2003-07-24', '37015', 'TUNISINA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I259', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(274, 'AYARI', 'AHMED', '17902', 'YRAHMD02S22L949T', '', 'M', '2002-11-22', '37066', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I821', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(275, 'MARCHESINI', 'FRANCESCO', '17903', 'MRCFNC03L09L781C', '', 'M', '2003-07-09', '37062', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L949', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(276, 'IABONI', 'MATTEO', '17904', 'BNIMTT03S13D810V', '', 'M', '2003-11-13', '37057', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(277, 'JACE', 'ARDIT', '17905', 'JCARDT03R18G489N', '', 'M', '2003-10-18', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L287', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(278, 'SONNANTE', 'DAVIDE', '17906', 'SNNDVD02P01G489H', '', 'M', '2002-09-01', '37013', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'B709', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(279, 'MARASINGHE ARACHCHILAGE', 'MINOL LAKSHAN', '17907', 'MRSMLL03B08Z209S', '', 'M', '2003-02-08', '37139', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(280, 'FRACCAROLI', 'LUCA', '17909', 'FRCLCU03R14L781Z', '', 'M', '2003-10-14', '37122', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(281, 'MISIANO', 'ANDREA', '17910', 'MSNNDR03D07F861V', '', 'M', '2003-04-07', '37026', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G481', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(282, 'MARCU', 'JIMMY MIHAITA', '17911', 'VRTF03000V077338', '', 'M', '2003-03-20', '37026', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'G481', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(283, 'BOADU', 'ISACCO', '17912', 'BDOSCC03A18F861Q', '', 'M', '2003-01-18', '37024', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F861', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(284, 'FATTAH', 'HASSNA', '17913', 'FTTHSN03E49Z330W', '', 'F', '2003-05-09', '37059', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'M172', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(285, 'MOKTADER', 'WALID', '17914', 'MKTWLD03S02L781Y', '', 'M', '2003-11-02', '37142', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(286, 'EDDAOUDI', 'MAROUANE', '17915', 'DDDMRN04A28L781J', '', 'M', '2004-01-28', '37100', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(287, 'ZANETTI', 'DAVIDE', '17916', 'ZNTDVD03S03D284K', '', 'M', '2003-11-03', '37010', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'C370', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(288, 'MILLI', 'MANUEL', '17917', 'MLLMNL03P12A459U', 'CRSMTT03T11F861Y', 'M', '2003-09-12', '37036', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'I003', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(289, 'RUBINO', 'NICOLO''', '17918', 'RBNNCL03M28L781H', 'SCGTMS03B10F861Q', 'M', '2003-08-28', '37132', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(290, 'RAZA', 'ABDULLAH', '17919', 'RZABLL02M03Z236W', 'MNTRRT03L24G489W', 'M', '2002-08-03', '37131', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(291, 'RAZA', 'ALI', '17920', 'RZALAI02M19Z236P', 'YRAHMD02S22L949T', 'M', '2002-08-19', '37132', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(292, 'FIORILLO', 'MATTIA', '17921', 'FRLMTT03M26B296S', 'MRCFNC03L09L781C', 'M', '2003-08-26', '37136', 'CINGALESE', '', 'cieco', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(293, 'JIN', 'JIACHENG', '17922', 'JNIJHN02P10L949B', 'BNIMTT03S13D810V', 'M', '2002-09-10', '37060', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'F789', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(294, 'FUGATTI', 'SAMUELE', '17923', 'FGTSML03S17B296O', 'JCARDT03R18G489N', 'M', '2003-11-17', '37026', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'G481', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(295, 'CASTENEDOLI', 'MARCO', '17924', 'CSTMRC03L29L781W', 'SNNDVD02P01G489H', 'M', '2003-07-29', '37124', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 9, 'PRIMA', 0, 5, 'descrizione', NULL),
(296, 'RONCA', 'EDOARDO', '17926', 'RNCDRD03D03L781Q', 'MRSMLL03B08Z209S', 'M', '2003-04-03', '37132', 'MOLDAVA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(297, 'ZENTI', 'IVAN', '17927', 'ZNTVNI03T21L781Z', 'FRCLCU03R14L781Z', 'M', '2003-12-21', '37134', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(298, 'STA ANA', 'DAVE JEZRELLE', '17929', 'STNDJZ02S23Z216O', 'MSNNDR03D07F861V', 'M', '2002-11-23', '37131', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - ELETTRONICA ED ELETTROTECNICA', '2017-2018', 'L781', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(299, 'BUSSINELLO', 'FILIPPO', '17930', 'BSSFPP03T20I775P', '', 'M', '2003-12-20', '37030', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'C897', 7, 'PRIMA', 0, 5, 'descrizione', NULL),
(300, 'SORIO', 'STEFANO', '17931', 'SROSFN03P12F861X', '', 'M', '2003-09-12', '37124', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - TRASPORTI E LOGISTICA', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL),
(301, 'NEGRETTO', 'GABRIELE', '17932', 'NGRGRL02P20L781A', '', 'M', '2002-09-20', '37057', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 6, 'PRIMA', 0, 5, 'descrizione', NULL),
(302, 'LALA', 'ENRICO', '17934', 'LLANRC02H13L781Z', '', 'M', '2002-06-13', '37057', 'MOLDAVA', 'DSA', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'H924', 8, 'PRIMA', 0, 5, 'descrizione', NULL),
(303, 'BEN AMMAR', 'SABRI', '17935', 'BNMSBR02R25L781Y', '', 'M', '2002-10-25', '37135', 'ITALIANA', '', '', '', 'PR-BIENNIO COMUNE - INFORMATICA E TELECOMUNICAZION', '2017-2018', 'L781', 10, 'PRIMA', 0, 5, 'descrizione', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classi`
--

CREATE TABLE `classi` (
  `id` int(11) NOT NULL,
  `nome` varchar(5) NOT NULL,
  `anno_scolastico` varchar(15) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `scuola` int(11) DEFAULT NULL,
  `classe_futura` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classi_composte`
--

CREATE TABLE `classi_composte` (
  `classe` int(11) NOT NULL,
  `alunno` int(11) NOT NULL,
  `configurazione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `configurazione`
--

CREATE TABLE `configurazione` (
  `id` int(11) NOT NULL,
  `attiva` int DEFAULT 0,
  `scuola` int(11) DEFAULT NULL,
  `anno_scolastico` varchar(15) DEFAULT NULL,
  `data` date NOT NULL,
  `nome` varchar(100) NOT NULL,
  `min_alunni` int(11) NOT NULL,
  `max_alunni` int(11) NOT NULL,
  `gruppo_femmine` int(11) DEFAULT NULL,
  `gruppo_cap` int(11) DEFAULT NULL,
  `gruppo_nazionalita` int(11) DEFAULT NULL,
  `nazionalita_per_classe` int(11) DEFAULT NULL,
  `numero_alunni_con_104` int(11) DEFAULT NULL,
  `classe` varchar(25) NOT NULL COMMENT 'PRIMA = prime , TERZA = terze'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configurazione`
--

INSERT INTO `configurazione` (`id`, `attiva`, `scuola`, `anno_scolastico`, `data`, `nome`, `min_alunni`, `max_alunni`, `gruppo_femmine`, `gruppo_cap`, `gruppo_nazionalita`, `nazionalita_per_classe`, `numero_alunni_con_104`, `classe`) VALUES
(1, 1, 0, '2017-2018', '2017-05-09', 'Default config', 25, 28, 4, 4, 4, 3, 23, 'PRIMA');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `alunno` int(11) DEFAULT NULL,
  `classe_precedente` int(11) DEFAULT NULL,
  `classe_successiva` int(11) DEFAULT NULL,
  `scuola` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `utente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indirizzi`
--

CREATE TABLE `indirizzi` (
  `id` int(11) NOT NULL,
  `indirizzo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indirizzi`
--

INSERT INTO `indirizzi` (`id`, `indirizzo`) VALUES
(1, 'informatica'),
(2, 'logistica');

-- --------------------------------------------------------

--
-- Table structure for table `indirizzi_configurazione`
--

CREATE TABLE `indirizzi_configurazione` (
  `configurazione` int(11) NOT NULL,
  `indirizzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indirizzi_configurazione`
--

INSERT INTO `indirizzi_configurazione` (`configurazione`, `indirizzo`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `scuole`
--

CREATE TABLE `scuole` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero_di_telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scuole`
--

INSERT INTO `scuole` (`id`, `nome`, `descrizione`, `indirizzo`, `email`, `numero_di_telefono`) VALUES
(0, 'ITIS G. Marconi', 'scuola superiore di Verona(informatica,logistica,elettronica)', 'piazzale Guardini 7, Vr', 'gmarconi@marconivr.it', '0456500190');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `scuola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `type`, `scuola`) VALUES
(1, 'religione sikh', 0),
(4, 'buddista', 0);

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(60) NOT NULL,
  `diritti` int(11) NOT NULL COMMENT '0 = admin 1 = modifica 2 = visualizza',
  `scuola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`id`, `username`, `password`, `diritti`, `scuola`) VALUES
(5, 'root', '$2a$10$9TwgVRUMdBjpajCtXb7sWOmQ5JZqkxYKwMcB5TbMUW8MnkU3jWApy', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunni`
--
ALTER TABLE `alunni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scuola` (`scuola`),
  ADD KEY `utente` (`utente`),
  ADD KEY `tag_fk` (`tag`);

--
-- Indexes for table `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`,`scuola`,`anno_scolastico`),
  ADD KEY `scuola` (`scuola`);

--
-- Indexes for table `classi_composte`
--
ALTER TABLE `classi_composte`
  ADD PRIMARY KEY (`classe`,`alunno`),
  ADD KEY `alunno` (`alunno`),
  ADD KEY `configurazione` (`configurazione`);

--
-- Indexes for table `configurazione`
--
ALTER TABLE `configurazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scuola` (`scuola`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alunno` (`alunno`),
  ADD KEY `classe_precedente` (`classe_precedente`),
  ADD KEY `classe_successiva` (`classe_successiva`),
  ADD KEY `scuola` (`scuola`),
  ADD KEY `utente` (`utente`);

--
-- Indexes for table `indirizzi`
--
ALTER TABLE `indirizzi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indirizzi_configurazione`
--
ALTER TABLE `indirizzi_configurazione`
  ADD PRIMARY KEY (`configurazione`,`indirizzo`),
  ADD KEY `indirizzo` (`indirizzo`);

--
-- Indexes for table `scuole`
--
ALTER TABLE `scuole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scuola` (`scuola`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utenti_ibfk_1` (`scuola`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alunni`
--
ALTER TABLE `alunni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;
--
-- AUTO_INCREMENT for table `classi`
--
ALTER TABLE `classi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `configurazione`
--
ALTER TABLE `configurazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `indirizzi`
--
ALTER TABLE `indirizzi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `scuole`
--
ALTER TABLE `scuole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `alunni`
--
ALTER TABLE `alunni`
  ADD CONSTRAINT `alunni_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`),
  ADD CONSTRAINT `alunni_ibfk_2` FOREIGN KEY (`utente`) REFERENCES `utenti` (`id`),
  ADD CONSTRAINT `tag_fk` FOREIGN KEY (`tag`) REFERENCES `tag` (`id`);

--
-- Constraints for table `classi`
--
ALTER TABLE `classi`
  ADD CONSTRAINT `classi_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`);

--
-- Constraints for table `classi_composte`
--
ALTER TABLE `classi_composte`
  ADD CONSTRAINT `classi_composte_ibfk_1` FOREIGN KEY (`classe`) REFERENCES `classi` (`id`),
  ADD CONSTRAINT `classi_composte_ibfk_2` FOREIGN KEY (`alunno`) REFERENCES `alunni` (`id`),
  ADD CONSTRAINT `classi_composte_ibfk_3` FOREIGN KEY (`configurazione`) REFERENCES `configurazione` (`id`) on DELETE CASCADE;

--
-- Constraints for table `configurazione`
--
ALTER TABLE `configurazione`
  ADD CONSTRAINT `configurazione_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`alunno`) REFERENCES `alunni` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`classe_precedente`) REFERENCES `classi` (`id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`classe_successiva`) REFERENCES `classi` (`id`),
  ADD CONSTRAINT `history_ibfk_4` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`),
  ADD CONSTRAINT `history_ibfk_5` FOREIGN KEY (`utente`) REFERENCES `utenti` (`id`);

--
-- Constraints for table `indirizzi_configurazione`
--
ALTER TABLE `indirizzi_configurazione`
  ADD CONSTRAINT `indirizzi_configurazione_ibfk_1` FOREIGN KEY (`configurazione`) REFERENCES `configurazione`  (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indirizzi_configurazione_ibfk_2` FOREIGN KEY (`indirizzo`) REFERENCES `indirizzi` (`id`);

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`);

--
-- Constraints for table `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `scuola_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`),
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`scuola`) REFERENCES `scuole` (`id`);