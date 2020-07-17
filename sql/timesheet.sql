-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jul 17, 2020 at 10:38 AM
-- Server version: 8.0.19
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timesheet`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id_action` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card_states`
--

CREATE TABLE `card_states` (
  `id_card_state` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id_employee` int NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `SAP_CC_Name` varchar(255) NOT NULL,
  `WS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id_employee`, `employee_name`, `SAP_CC_Name`, `WS`) VALUES
(1, 'Juliana Lenda Chimpolo', 'DENF - Auxiliares de Enfermagem', 'De acordo com Escala'),
(3, 'Luidmila Katyla Lopes Martins', 'Recepção', 'De acordo com Escala'),
(7, 'José Queba', 'Laboratório', 'De acordo com Escala'),
(1134, 'Pedro Eduardo', 'Serviços de Apoio', 'Horário Regular'),
(1135, 'Elizabeth da Glória Sarrote', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1139, 'Magalhães Joaquim', 'DENF - Bloco Operatório', 'Horário Regular'),
(1142, 'Paulina da Silva Magalhães', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1146, 'Maria Emília da Silva Inácio', 'DENF - Serviço de Medicina Ocupacional', 'Turnos Alternados'),
(1149, 'Pedro Gil Mateus Ferreira', 'Conselho de Administração', 'Horário Regular'),
(1150, 'José Antunes Gil Ferreira', 'Conselho de Administração', 'Horário Regular'),
(1155, 'Eugénia Lourenço da Silva', 'GH - Serviço de Higiene e Limpeza', 'De acordo com Escala'),
(1160, 'Ana Maria Anjos da Costa', 'Laboratório', 'Horário Regular'),
(1162, 'Maria Júlia Rodrigues Cardoso Soeiro', 'Farmácia', 'Turnos Alternados'),
(1164, 'Major Manuel Da Silva Neto', 'Laboratório', 'Horário Regular'),
(1165, 'Rui Manuel da Costa Carvalho', 'Imagiologia', 'Horário Regular'),
(1174, 'Marcos Simba Ngaca', 'Serviços de Apoio', 'De acordo com Escala'),
(1176, 'Filomena Maria Ferreira Honorio Bastos', 'DENF - Bloco Operatório', 'Horário Regular'),
(1180, 'Ana Paula Massochi', 'Recepção', 'Horário Regular'),
(1181, 'Gilson Gustavo de Miranda Gourgel', 'Conselho de Administração', 'Horário Regular'),
(1182, 'Maria de Fatima Massengo Choffray', 'Laboratório', 'Turnos Tabela'),
(1184, 'Madalena Zinga', 'DENF - Sala de Partos', 'Turnos Diurnos'),
(1192, 'Joaquim Paulo Guilherme Franque', 'Laboratório', 'De acordo com Escala'),
(1197, 'Catarina Dos Santos Correia', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(1207, 'Deolinda de Jesus Ribeiro', 'DENF - Bloco Operatório', 'Turnos Alternados'),
(1208, 'Albertina Isabel Soca', 'DENF - Bloco Operatório', 'Turnos Tabela'),
(1209, 'Luisa Mário Manuel Martins', 'DENF - Bloco Operatório', 'Turnos Alternados'),
(1217, 'Raquel Fernanda Vontade da Silva', 'Laboratório', 'Turnos Alternados'),
(1224, 'Ana Maria Cotovia da Silva', 'Staff Apoio CA', 'Horário Regular'),
(1226, 'Joelma Cafala Moura de Campos António', 'Imagiologia', 'Turnos Tabela'),
(1228, 'Eulália Maria Cardoso Simões Alexandre', 'DM - Obstetrícia / Ginecologia', 'Horário Regular'),
(1230, 'Sérgio Delgado Travieso', 'DM - Cirurgia', 'Horário Regular'),
(1235, 'Alzira da Conceição Domingos Kinkela', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1253, 'Marisa Vontade da Silva Pinto', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1258, 'Carla Maria Boaventura da Silva', 'Laboratório', 'Horário Regular'),
(1262, 'Armando José Sicondo', 'Direcção de Operações', 'Turnos Alternados'),
(1263, 'Henda Cristina Chagas Evaristo da Silva', 'Farmácia', 'Horário Regular'),
(1264, 'Gabriel Cassinda', 'Serviços de Apoio', 'Turnos Alternados'),
(1271, 'Ana Paula Nobre de Andrade de Oliveira Pinto', 'Laboratório', 'Horário Regular'),
(1274, 'Fátima Cristina Epalanga', 'DENF - Supervisão Enfermagem', 'Horário Regular'),
(1276, 'Beatriz João Félix Neto Manuel', 'Farmácia', 'Turnos Alternados'),
(1281, 'Vânia Nadir Teixeira Lopes Mateus', 'DENF - Supervisão Enfermagem', 'Horário Regular'),
(1285, 'Isabel Dinis Lua Franga Pedro', 'DENF - Bloco Operatório', 'Turnos Tabela'),
(1296, 'Maria Amélia da Silva Gonçalves Mateus', 'Direcção Comercial', 'Horário Regular'),
(1297, 'Maria Manuela da Conceição Boaventura', 'DENF - Enfermagem Geral', 'Horário Regular'),
(1300, 'Vânia Gizelda da Silva Policarpo', 'Direcção Financeira', 'Horário Regular'),
(1303, 'Ilda da Conceição Cruz Pitra Macaia', 'Recepção', 'De acordo com Escala'),
(1307, 'Maria Luciano Correia Leitão', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(1311, 'Teresa Francisco Rodrigues Bernardo', 'DENF - Bloco Operatório', 'Turnos Alternados'),
(1316, 'Marisa da Silva Magalhães', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1317, 'Irina Silvestre Pereira Dos Santos De Almeida', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1326, 'Graciete Andrade Costa', 'Farmácia', 'Turnos Alternados'),
(1329, 'Jacinta da Conceição Francisco', 'Supervisão de Agendas e Infraestruturas', 'Horário Regular'),
(1331, 'Catarina Ngoma Lelo Nguimbi', 'Farmácia', 'Turnos Alternados'),
(1332, 'Francisca Domingas Dos Santos', 'Recepção', 'De acordo com Escala'),
(1334, 'Lúcia de Fatima Bueia', 'GH - Serviço de Higiene e Limpeza', 'De acordo com Escala'),
(1336, 'Margarida Cardoso Ambrósio', 'Recepção', 'Turnos Diurnos'),
(1341, 'Suzana Valentina Epalanga', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1344, 'Mozalina Cristina Nkosi', 'Laboratório', 'Horário Regular'),
(1345, 'Lukulo de Adelina Mendes Pambo', 'Direcção de Informática, Organização e Métodos', 'Horário Regular'),
(1352, 'Cecília Amélia Lembe Gabriel', 'Recepção', 'De acordo com Escala'),
(1353, 'Adelaide João Constantino', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1354, 'Celma Maria da Cruz Manuel Silva Fortes', 'Imagiologia', 'Turnos Tabela'),
(1356, 'Leila de Macedo Vasconcelos Cunha', 'Direcção Comercial', 'Horário Regular'),
(1358, 'Armando Luta', 'Segurança', 'Turnos Alternados'),
(1359, 'Isabel Lima de Melo', 'Direcção Comercial', 'Horário Regular'),
(1362, 'Narcisa André Lima', 'Farmácia', 'Turnos Alternados'),
(1366, 'Matilde Sambo António', 'Direcção de Recursos Humanos', 'Horário Regular'),
(1369, 'Maria Paulo João Manuel dos Santos', 'Gabinete de Controlo de Qualidade', 'Turnos Diurnos'),
(1370, 'Nádia Mavitidi Ramos Mavungo Manuel', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1373, 'Filomena Domingos Manuel', 'DENF - Bloco Operatório', 'Turnos Tabela'),
(1377, 'Pedro Calonda Magalhães', 'Direcção de Manutenção', 'Horário Regular'),
(1381, 'Laura Isabel Paulo', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1384, 'Delfina Faustino Vinte e Cinco', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1387, 'Odete do Céu Ferraz António Manuel', 'Recepção', 'Turnos Alternados'),
(1388, 'Rita Sardinha Bastos', 'Recepção', 'Turnos Alternados'),
(1389, 'Elisa Conceição da Fonseca Tanda', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1392, 'Manuel de Almeida Kitoco', 'Laboratório', 'De acordo com Escala'),
(1397, 'Andrea de Andrade Pedro', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1404, 'Domingas Viegas Tavares Alberto', 'Imagiologia', ''),
(1418, 'Júlia de Oliveira Prazeres', 'Staff Apoio CA', 'Horário Regular'),
(1419, 'Basilia Antónia Pedro da Costa', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(1420, 'Júlia João Cristóvão Pascoal', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(1423, 'Emilia Armando', 'Laboratório', 'Turnos Alternados'),
(1428, 'Maria Filomena Francisco Jamba', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1429, 'Dulce Emiliana Goma Abraão Bonifacio', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1431, 'Isamento Paulo Mbundo António', 'Direcção de Operações', 'Horário Regular'),
(1433, 'Paulina Pires', 'Supervisão de Agendas e Infraestruturas', 'Horário Regular'),
(1434, 'Maneco Correia Quipuco', 'Direcção Comercial', 'Turnos Diurnos'),
(1435, 'Yara Andrea do Nascimento Mateus', 'Recepção', 'Turnos Alternados'),
(1439, 'Elsa Tatiana Manuel Divengle', 'Recepção', 'Turnos Diurnos'),
(1440, 'Márcia da Graça Ventura Lopes', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1451, 'Adacilpa Alina Guimarães Suami', 'Direcção Financeira', 'Horário Regular'),
(1452, 'Joana Rodrigues José', 'Direcção de Recursos Humanos', 'Horário Regular'),
(1454, 'Maura Uguet Victor Madeira Luís', 'DM - Serviço de Medicina Ocupacional', 'Turnos Diurnos'),
(1467, 'Maria Eugénia Fernandes da Silva', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(1470, 'Francisca Paula Agostinho', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(1472, 'Florinda Marisa Fernandes da Cruz Miguel', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1473, 'Victoria Domingos Gaieta', 'DENF - Bloco Operatório', 'Turnos Alternados'),
(1481, 'Feliciana Lopes de Almeida', 'DENF - Bloco Operatório', 'Horário Regular'),
(1482, 'Maria Antónia de Oliveira Mafuca Dó', 'Imagiologia', 'Turnos Tabela'),
(1489, 'Regina da Assunção G.de C. Kiomboleca', 'DENF - Supervisão Enfermagem', 'Horário Regular'),
(1490, 'Leonilde Eluise Pacavira Buta', 'Laboratório', 'Horário Regular'),
(1494, 'Maria Antónia Paulo Teixeira', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1509, 'Otália de Melo Silvestre', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1511, 'Perdão da Costa', 'Direcção de Manutenção', 'Turnos Diurnos'),
(1514, 'Maria Barros Miguel Augusto', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(1515, 'Joaquina Augusta Soares da Silva Andrade', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1516, 'Margarida Helena Adão Júnior', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(1526, 'Manuel António', 'Direcção de Manutenção', 'Turnos Diurnos'),
(1527, 'Joana Manuel Romão', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1533, 'Tânia Patrícia de Abreu Lopes', 'Administração', 'Horário Regular'),
(1541, 'Leonor Isabel Correia Pitra', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(1543, 'Eva Lázaro Lau', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1554, 'Yolanda Bernadete Chefe Gumbi', 'Laboratório', 'Turnos Alternados'),
(1556, 'Tiago Ambrósio Sunda Tembo', 'Laboratório', 'De acordo com Escala'),
(1563, 'Piedade de Fátima José Novais', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1567, 'Luisa Maria José Rodrigues dos Santos', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1572, 'Marília Jandira da Fonseca Fula da Silva', 'Supervisão de Agendas e Infraestruturas', 'Horário Regular'),
(1576, 'Lisangela Teofánia de Melo Lopes', 'Direcção Comercial', 'Horário Regular'),
(1577, 'Cecilia Tadeu Paulino', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1578, 'Madalena Maria Manuel João Paulo Ventura', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(1579, 'Cláudia Teresa de Ascenção Calongi', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(1582, 'Agostinho Teixeira', 'Serviços de Apoio', 'Horário Regular'),
(1584, 'Laurinda Chinjomba', 'Supervisão de Agendas e Infraestruturas', 'Horário Regular'),
(1586, 'Sónia Marisa Gomes de Oliveira', 'Administração', 'Horário Regular'),
(1587, 'Maria Margarida Queiróz Fortes', 'Recepção', 'Horário Regular'),
(1591, 'Costa Miguel Manzanza', 'Segurança', 'Turnos Alternados'),
(1595, 'Manuela Cândido de Freitas', 'Farmácia', 'Turnos Alternados'),
(1597, 'Domingas da Ressurreição Fernando António', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1598, 'Taina Josina Simões Tavares Manuel', 'Recepção', 'Turnos Alternados'),
(1602, 'Matilde Ngala Quinjila Miranda', 'Laboratório', 'Turnos Alternados'),
(1608, 'Cristina Domingos João', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(1610, 'Eugénio Fernandes Pangungo', 'Direcção de Informática, Organização e Métodos', 'Horário Regular'),
(1613, 'Evanini Conceição da Silva Mariano Ngungo', 'Administração', 'De acordo com Escala'),
(1615, 'Rossana Bernardo da Silva', 'Recepção', 'Turnos Diurnos'),
(1617, 'Alexandre Saúl', 'DM - Serviço de Medicina Ocupacional', 'Horário Regular'),
(1619, 'Estalina Nany Morais Queta', 'DENF - Supervisão Enfermagem', 'Horário Regular'),
(1626, 'João Canda Zua', 'Direcção de Operações', 'Turnos Diurnos'),
(1637, 'Kilelessa Sebastião', 'DENF - Bloco Operatório', 'Turnos Tabela'),
(1638, 'Tiago Martins Mateus', 'Direcção de Manutenção', 'Horário Regular'),
(1643, 'Tomás António Justino', 'Segurança', 'Turnos Alternados'),
(1644, 'Catarina Neusa Mateus Lumbi', 'Direcção Comercial', 'Horário Regular'),
(1646, 'Yara Marinela da Fonseca Fula', 'Direcção Financeira', 'Horário Regular'),
(1649, 'Helton de Oliveira Chapim', 'Conselho de Administração', 'Horário Regular'),
(1658, 'Fernanda Luis', 'DENF - Sala de Partos', 'Turnos Tabela'),
(1659, 'Elsa Mariza Moreira dos Reis', 'Laboratório', 'Turnos Alternados'),
(1660, 'Inês Helena Mateus Cimosso', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1662, 'Conceição António Vieira D. João Gaspar', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(1664, 'Rosa Lubako Manuel', 'Laboratório', 'Horário Regular'),
(1666, 'Josefa Pires', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1669, 'Verónica Brás Muila Poba', 'DENF - Supervisão Enfermagem', 'De acordo com Escala'),
(1673, 'Aída Luisa Cacuete', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1677, 'Josefa Fueiro Manuel Neto', 'DENF - Sala de Partos', 'Turnos Tabela'),
(1678, 'Marlene Josefa Francisco Calandissa', 'Laboratório', 'Turnos Alternados'),
(1682, 'Gizela Ndimu Miangu Mpaca António', 'Direcção Financeira', 'Horário Regular'),
(1688, 'Domingas Pereira Monteiro', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1689, 'Inocência Judith Matias Simwassili', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1691, 'Amélia Ruth Catela Tavares Pimenta', 'Administração', 'Horário Regular'),
(1692, 'Maria Rebeca Fernandes Quimuanga Quiçama', 'Administração', 'Horário Regular'),
(1696, 'Helena da Cunha Fernando de Almeida', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1697, 'Esperança António Falcão', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1701, 'Felisbina Delfina Francisco', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1702, 'Isabel Grosso Manico Paulo', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(1704, 'Maria Imaculada', 'DM - Obstetrícia / Ginecologia', 'Horário Regular'),
(1705, 'Emília Rosa Escrivão dos Santos', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1707, 'Suzana Miguel Mateus', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1708, 'Eduardo Justino Fonseca Taca', 'Serviços de Apoio', 'Turnos Alternados'),
(1711, 'Cristina Nunes Soares Gouveia Leite', 'Laboratório', 'Turnos Tabela'),
(1716, 'Suzana Ferreira Simão', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(1717, 'Mampuya Didi', 'Segurança', 'Turnos Alternados'),
(1718, 'António Bento Kula', 'Segurança', 'Turnos Alternados'),
(1721, 'Eugénia Adriana Venâncio José', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(1722, 'Eliseu José', 'Serviços de Apoio', 'Turnos Alternados'),
(1731, 'Denise Mikaela da Conceição Branco Tchipilica', 'Direcção Comercial', 'Horário Regular'),
(1734, 'Nicole Lázaro', 'Direcção Comercial', 'Horário Regular'),
(1737, 'Yara Teresa Calumbo Cauanda', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(1740, 'Andrade Francisco Bondo', 'Direcção de Manutenção', 'Horário Regular'),
(1741, 'André Nganga Paulo', 'Direcção de Informática, Organização e Métodos', 'Horário Regular'),
(1747, 'Noemia Manguangua António', 'Recepção', 'Horário Regular'),
(1750, 'Jandira Roberta da Conceição Joveth Fernandes', 'Laboratório', 'Turnos Diurnos'),
(1756, 'Indira Tukayana Quintas dos Reis e Almeida Leovigildo', 'Administração', 'Horário Regular'),
(1757, 'João Agostinho Domingos', 'Direcção de Operações', 'Horário Regular'),
(1759, 'Maria Fernandes de Barros Martins', 'DENF - Sala de Partos', 'Turnos Tabela'),
(1761, 'Emília Cassova Mande', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1765, 'Lourdes Canga Artur', 'Direcção de Recursos Humanos', 'Horário Regular'),
(1771, 'Óscar Rui Videira', 'DM - Clínica Geral', 'Horário Regular'),
(1773, 'Emília Solange Gama João Malale', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(1777, 'Edmar Jorge Pires Domingos', 'Nucal', 'Horário Regular'),
(1785, 'Vanila Vissolela Simão Miguel', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1786, 'Patrícia Domingos Félix Vunge Fortunato', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(1788, 'Vanda Benvinda Calonda Magalhães', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1792, 'Tânia Ceriana Romão Camilo Kundy', 'ADMIN - Serviço de Medicina Ocupacional', 'Horário Regular'),
(1793, 'Isabel Formosa Comba Falcão Gavião', 'Administração', 'Horário Regular'),
(1794, 'Tuzizila João Fonseca', 'Serviços de Apoio', 'Turnos Alternados'),
(1795, 'Elba Renata da Silva Rita', 'Recepção', 'Turnos Alternados'),
(1803, 'Lucrécia Pedro Paulo Sousa', 'Imagiologia', 'Turnos Tabela'),
(1806, 'Júlia Mbande José André da Silva', 'Farmácia', 'Turnos Alternados'),
(1815, 'Gabriela Sambongue Sambanda Manico', 'Recepção', 'Turnos Alternados'),
(1820, 'Celma Joaquina Agostinho João Ferreira', 'Recepção', 'Turnos Alternados'),
(1823, 'Dária Cristina Coelho da Silva', 'Recepção', 'Turnos Diurnos'),
(1825, 'Maria Isabel José da Costa', 'Laboratório', 'Turnos Alternados'),
(1831, 'António Lourenço Adão', 'Direcção de Operações', 'Turnos Diurnos'),
(1840, 'Maria Luísa Manuel Mateus Tavares', 'DM - Obstetrícia / Ginecologia', 'Horário Regular'),
(1842, 'Kiwamena da Conceição Bento Borges', 'Direcção de Manutenção', 'Horário Regular'),
(1850, 'Madalena Agostinho', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(1854, 'Stela Muahendelu Muoma Haichamina', 'Recepção', 'Turnos Alternados'),
(1855, 'Leónia Kauliwanwa', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(1856, 'Téofilo David Eduardo', 'Direcção de Operações', 'Turnos Diurnos'),
(1859, 'Luciana Antónia Ferreira', 'DENF - Sala de Partos', 'Turnos Tabela'),
(1864, 'Maria Cândida Lopes Cordeiro', 'GH - Cozinha', 'Horário Regular'),
(1869, 'Maria de Fátima Andrade Bonda', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(1872, 'João Luís Kambuende', 'Direcção de Manutenção', 'Turnos Alternados'),
(1878, 'Sebastião Campos', 'DENF - Bloco Operatório', 'Turnos Diurnos'),
(1880, 'Luís Mário Malebo Zua', 'Direcção de Manutenção', 'Turnos Diurnos'),
(1890, 'Felícia Maria Gongos Viagem', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(1891, 'Nádia Carolina Bequengue Messo', 'Recepção', 'Turnos Tabela'),
(1894, 'Paula Alexandra de O. e Silva Lopes da Silva', 'Direcção de Recursos Humanos', 'Horário Regular'),
(1895, 'Joana Vanessa Paulo Gaspar', 'Direcção Comercial', 'Horário Regular'),
(1926, 'Gonga José Quingalo', 'Recepção', 'Turnos Tabela'),
(1927, 'Tânia Stella Mateus Paulo', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1928, 'Etiandra Isabel Dias Joaquim', 'Direcção de Recursos Humanos', 'Horário Regular'),
(1930, 'Guiomar Paulo Teixeira', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1932, 'Ana Bela André José', 'Laboratório', 'Turnos Alternados'),
(1933, 'Adelia de Fátima Brinca Caricôcô', 'Direcção Comercial', 'Horário Regular'),
(1937, 'Mateus Cardoso Hebo', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1938, 'Maria Gouveia Bessa', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(1939, 'Marcos Francisco Salvador', 'DENF - Bloco Operatório', 'Turnos Tabela'),
(1941, 'Lourenço Domingos Cândido', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1942, 'José Cirilo Tavares Fernando', 'Recepção', 'Turnos Diurnos'),
(1944, 'Osvaldo Moura Damião', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(1945, 'Elisa João Mateus Monteiro', 'DENF - Bloco Operatório', 'Horário Regular'),
(1946, 'Norberto Mateus Zua', 'Direcção Comercial', 'Horário Regular'),
(1948, 'Dulce Sheziane Martins Correia', 'Direcção Financeira', 'Horário Regular'),
(1950, 'Evaldo Manuel Rodrigues da Costa', 'Serviços de Apoio', 'Horário Regular'),
(1961, 'Délio Ivanir Pintar Semedo', 'Direcção de Informática, Organização e Métodos', 'Horário Regular'),
(1973, 'Vanuza Rodrigues Carvalho Antas', 'Laboratório', 'Horário Regular'),
(1975, 'João Francisco Neto', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(1977, 'Alice Nachivela Bastos', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1978, 'Jaime da Costa Quioco', 'Direcção Financeira', 'Horário Regular'),
(1980, 'Teresa Lassaleth Damião', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(1986, 'Ágata Nafela', 'DENF - Auxiliares de Enfermagem', 'Horário Regular'),
(1989, 'Maka Feliciana Camessa Moisés', 'DENF - Enfermagem Geral', 'Turnos Diurnos'),
(1992, 'Sílvio da Silva Carvalho dos Santos', 'Recepção', 'Turnos Alternados'),
(2002, 'Sandra Filomena da Graça Virgílio', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2007, 'Lando Garcia Domingos', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2009, 'Rebeca Malonda Bungo', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2012, 'Adão Fernando Lufala', 'Direcção de Manutenção', 'Turnos Diurnos'),
(2015, 'Joceline Alfredo de Oliveira da Silva Neto', 'Direcção Comercial', 'Horário Regular'),
(2016, 'Edna Marina Domingos Lourenço', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2018, 'Hermenegilda Gorett Assongola da Silva', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2020, 'Manuela Patrícia Lopes Francisco e Francisco', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(2024, 'Francisca Maria José dos Santos Manuel', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2025, 'João José', 'Serviços de Apoio', 'Turnos Alternados'),
(2026, 'Sara Calumbo', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(2027, 'Ana Valquiria dos Santos Simão', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2030, 'Ângela Antónia de Sousa Cardoso António', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2033, 'Rosária Monteiro', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(2036, 'Beatriz Miguel Caculama', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2039, 'Horácio Raúl Vieira Miquenha', 'Recepção', 'Turnos Tabela'),
(2040, 'Joana Marta José Camilo', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(2041, 'Patrícia de Fátima Esteves', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(2042, 'Adriano António Zeferino', 'Direcção Financeira', 'Horário Regular'),
(2044, 'Daniel Cucuama Gonga', 'Laboratório', 'Turnos Tabela'),
(2065, 'Elias Venceslau Abel Muciande', 'Serviços de Apoio', 'Horário Regular'),
(2067, 'Maria Karina Van-Duném Filipe', 'Gabinete de Comunicação e Imagem', 'Horário Regular'),
(2069, 'Maria Joana Santana Pradiné', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2072, 'Cecília da Conceição Ribas Fernandes', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(2074, 'Helena Suelene Marques Samuel', 'Direcção de Contabilidade', 'Horário Regular'),
(2079, 'Nara Conceição Lopes da Cruz', 'Direcção de Recursos Humanos', 'Horário Regular'),
(2080, 'Hamilton do Rosário Mateus Mapange', 'Direcção de Informática, Organização e Métodos', 'Horário Regular'),
(2084, 'Candida Senga Gonçalves', 'GH - Cozinha', 'Horário Regular'),
(2085, 'Ana José Afonso', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2087, 'Cláudia Margarida Correia Muenga', 'Laboratório', 'Horário Regular'),
(2088, 'Maria Caculama', 'DENF - Bloco Operatório', 'Turnos Alternados'),
(2091, 'Vanusa da Conceição Teixeira Chico', 'Administração', 'Horário Regular'),
(2092, 'Estefânia Paula Quente Matranga', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2093, 'Aguinaldo Pedro Sango', 'Direcção de Operações', 'Turnos Diurnos'),
(2097, 'Whitney Anaíse Paiva da Rocha Ganga', 'Direcção de Recursos Humanos', 'Horário Regular'),
(2098, 'Teresa da Conceição José Rodrigues dos Santos', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(2099, 'Francelina Tânia António Marques', 'DENF - Auxiliares de Enfermagem', 'Horário Regular'),
(2100, 'Odeth Maria José dos Santos', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2101, 'Felizarda de Jesus da Costa Correia', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(2105, 'Ifica João Pedro Dias', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2111, 'Josefa da Silva Cristovão', 'Recepção', 'Turnos Alternados'),
(2112, 'Eunice Maria de Carvalho Campos', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(2114, 'Isila Vanilda Gomes de Oliveira', 'Direcção Comercial', 'Turnos Diurnos'),
(2117, 'Valter Ribas Cordeiro', 'Serviços de Apoio', 'Turnos Alternados'),
(2122, 'Natacha Maria Manuel Leonardo', 'Farmácia', 'Turnos Alternados'),
(2128, 'Dércio Mário de Almeida Ribas', 'Direcção de Informática, Organização e Métodos', 'Horário Regular'),
(2135, 'Vanuza Nazareth Almeida da Silva', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2140, 'Mário Francisco António', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(2144, 'Francisco Sebastião Kixeque', 'Direcção de Operações', 'Horário Regular'),
(2146, 'Ana Adriano Samacai', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2148, 'Antónia de Jesus Fernando Raimundo Silvério', 'DENF - Enfermagem Geral', 'Turnos Diurnos'),
(2149, 'Fernando Quimuanga Manuel Muenga', 'Segurança', 'Turnos Alternados'),
(2151, 'Luís Caputo André', 'Segurança', 'Turnos Alternados'),
(2153, 'Mário da Conceição Joaquim', 'Segurança', 'Turnos Alternados'),
(2154, 'Paulo João Francisco', 'Segurança', 'Turnos Alternados'),
(2156, 'Marta Dávila Rodrigues Luís', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2160, 'Gemima Gaspar Lourenço', 'Direcção Comercial', 'Horário Regular'),
(2161, 'Gerson Afonso Vangue', 'Administração', 'Horário Regular'),
(2162, 'Lúcia Morena Baptista Bongue', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2165, 'Manuel Alfredo de Castro Adão', 'Direcção de Manutenção', 'Turnos Diurnos'),
(2169, 'Petra Marisa Bebiano Correia dos Santos', 'Gabinete Juridico', 'Horário Regular'),
(2174, 'Hernani Manuel Lino Pires Martins', 'Direcção de Manutenção', 'Horário Regular'),
(2177, 'Paulo Afonso Bamba Sami', 'Segurança', 'Turnos Alternados'),
(2178, 'Angelina Odete Paulo', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2179, 'Laurindo Manuel João Cassinda', 'Direcção de Manutenção', 'Turnos Diurnos'),
(2183, 'Simão José Paulo', 'Segurança', 'Turnos Alternados'),
(2184, 'Selmis Miranda Zeferino', 'Segurança', 'Turnos Alternados'),
(2185, 'Domingos Muconda Dungo Incha', 'Segurança', 'Turnos Alternados'),
(2187, 'Félix Domingos André', 'Segurança', 'Turnos Alternados'),
(2192, 'Nzuzi Maria Pedro Kianica Fernandes', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2193, 'Elda Isabel Raimundo Tuela Bumba', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2194, 'Elisa Ngololo Paulo', 'DENF - Enfermagem Geral', 'Turnos Diurnos'),
(2197, 'Eugénia Vaz de Bom Jesus', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2199, 'Elias Manuel Pedro Paulo', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2202, 'Maria Luisa José Inerço Sebastião', 'DENF - Bloco Operatório', 'Turnos Tabela'),
(2203, 'Leodmila Vanessa Teixeira Duarte', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(2204, 'Antónia Diogo Sousa Silva Júlio', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2205, 'Eunice Van-Dúnen Pereira António', 'Laboratório', 'Turnos Alternados'),
(2206, 'Lúcia David Murima Troco', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2208, 'Guilhermina Sebastião João Diogo Mateus', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2209, 'Brilhante Kemalandua Mayembe', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2214, 'Eugénia Martins Lopes', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2220, 'Vanusa Esperança de Almeida Amador da Costa', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2222, 'Lundoluka Matumona', 'Direcção de Manutenção', 'Turnos Diurnos'),
(2224, 'Gonçalves Manuel Luiba', 'Direcção de Manutenção', 'Turnos Diurnos'),
(2226, 'Érica De Fátima Valente Pedrosa', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2228, 'Helena Boaventura de Almeida', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2230, 'Loide Lina Rodrigues Carvalho', 'Laboratório', 'Horário Regular'),
(2231, 'Gilberto Adolfo dos Santos Gonçalves', 'Direcção de Manutenção', 'Horário Regular'),
(2233, 'Maria Helena da Fonseca Lobato Pires Armando', 'Departamento de Procriação Médicamente Assistida', 'Turnos Tabela'),
(2234, 'Hilária Vaz Sacramento Pinho', 'Direcção de Recursos Humanos', 'Horário Regular'),
(2240, 'Jurema de Jesus Nobre Ernesto', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2241, 'Makaia Madaleno Samuel David', 'Laboratório', 'Turnos Tabela'),
(2242, 'Márcia da Conceição Francisco', 'GH - Serviço de Higiene e Limpeza', 'Turnos Diurnos'),
(2246, 'Adélia António Pacheco', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2247, 'Edília Gaspar Jerónimo', 'DENF - Supervisão Enfermagem', 'Turnos Diurnos'),
(2249, 'Vital Fonseca', 'Serviços de Apoio', 'Horário Regular'),
(2250, 'Benvinda Amélia Torres', 'Recepção', 'Turnos Alternados'),
(2253, 'Ivone Josefa Francisco Lopes', 'Farmácia', 'Turnos Alternados'),
(2255, 'Elsa Fernanda de Oliveira Cabral', 'DM - Clínica Geral', 'Horário Regular'),
(2258, 'Domingas Cassova Teleha Bernardo', 'GH - Serviço de Higiene e Limpeza', 'Horário Regular'),
(2259, 'Teresa Gandi de Miranda Lima', 'Laboratório', 'Turnos Alternados'),
(2263, 'Belmira Barata Branco', 'Administração', 'Horário Regular'),
(2269, 'Felizardo Paulo João', 'Segurança', 'Turnos Alternados'),
(2271, 'Suely Marisa Rosa Moutinho', 'Direcção Comercial', 'Horário Regular'),
(2272, 'Manuel Lema Vasco', 'Direcção Comercial', 'Horário Regular'),
(2273, 'Elisandro Patrício Borges de Oliveira', 'Segurança', 'Horário Regular'),
(2274, 'Estefânio Morais Gonçalves', 'Direcção Comercial', 'Horário Regular'),
(2275, 'Samuel Campos', 'Direcção Comercial', 'Horário Regular'),
(2277, 'Minianga Panda Kaparakata', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2278, 'Aldina João Nunda', 'DENF - Sala de Partos', ''),
(2280, 'Nicha Kuanzambi Matondo', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(2281, 'Francisca Filomena Lopes da Paixão', 'DENF - Auxiliares de Enfermagem', 'Turnos Alternados'),
(2282, 'Quintino Paulo Sebastião', 'Direcção de Manutenção', 'Turnos Diurnos'),
(2283, 'Maria Elizete Lubaco Manuel', 'Recepção', 'Turnos Tabela'),
(2284, 'Elisabete Ribeiro de Figueiredo Cardoso Sampaio', 'Imagiologia', ''),
(2285, 'Francisco Miguel Júlio da Costa', 'GH - Cozinha', 'Horário Regular'),
(2287, 'Nazaré de Fátima dos Santos David Sebastião', 'Laboratório', 'Turnos Tabela'),
(2289, 'Luzia Manuel dos Santos', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2290, 'Fernanda Catumbo de Oliveira', 'DENF - Sala de Partos', 'Turnos Tabela'),
(2292, 'José Miguel Manuel', 'GH - Cozinha', 'Horário Regular'),
(2294, 'Mariete Rosária Chimuma Upika Mayamba', 'Direcção Comercial', 'Horário Regular'),
(2295, 'Amélia Patrícia Manuel Eduardo', 'Laboratório', 'Turnos Alternados'),
(2297, 'Judite Praia Macedo', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2301, 'Josemar Aguinaldo Gomes da Silva', 'Direcção de Contabilidade', 'Horário Regular'),
(2304, 'Alberto Villar Rojas', 'Farmácia', 'Turnos Alternados'),
(2305, 'Ana Maria José', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2307, 'Florentina Silva Piedade Lumbo Chiteculo', 'Imagiologia', 'Turnos Tabela'),
(2309, 'Cita Teresa da Silva António Francisco', 'Direcção Comercial', 'Horário Regular'),
(2310, 'Daniel João Quissanga', 'Serviços de Apoio', 'Turnos Diurnos'),
(2313, 'Juan Carlos Leiva Rodriguez', 'Direcção de Manutenção', 'Horário Regular'),
(2315, 'Mariana Lito Joaquim', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2318, 'Inácio Chivangulula Cassinda', 'Recepção', 'Horário Regular'),
(2321, 'Maria Das Dores Puati Zau', 'Farmácia', 'De acordo com Escala'),
(2324, 'Alda Celeste Augusto Galheiro', 'DENF - Enfermagem Geral', 'Horário Regular'),
(2325, 'Wilma Maria Marcos Pequeno', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(2326, 'Paula Nazaré dos Santos', 'DENF - Supervisão Enfermagem', 'Turnos Tabela'),
(2332, 'Laurinda Chihonga Santana', 'DENF - Enfermagem Geral', 'Turnos Diurnos'),
(2333, 'Joana Paulo Agostinho', 'GH - Serviço de Higiene e Limpeza', 'Turnos Alternados'),
(2335, 'Abrão Salumu Kanenga', 'Segurança', 'Turnos Alternados'),
(2337, 'Dulcinio Alves da Cruz Lima', 'DENF - Serviço de Medicina Ocupacional', 'Turnos Alternados'),
(2342, 'Edna Campos Alves Cardoso Agostinho', 'DM - Imagiologia', 'Horário Regular'),
(2346, 'Filipa Solange Telo Brunhoso', 'DM - Serviço de Medicina Ocupacional', 'Turnos Diurnos'),
(2347, 'Rosa Monteiro da Silva', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(2348, 'Narciso Miguel António', 'Direcção de Manutenção', 'Turnos Alternados'),
(2349, 'Natália Uakaiela De Almeida Mendes Maia', 'Gabinete de Nutrição', 'Turnos Tabela'),
(2350, 'Emília Cristovão Rodrigues Mapange', 'Direcção de Recursos Humanos', 'Horário Regular'),
(2351, 'Joice Laurinda Falcão Simões', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(2352, 'Tiago César Sovite Vindindi', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(2353, 'Djanira Albertina Adão', 'DENF - Supervisão Enfermagem', 'Turnos Alternados'),
(2355, 'Alfredo Ramiro Jeremias', 'Serviços de Apoio', 'Horário Regular'),
(2356, 'António Francisco Joaquim', 'Direcção de Manutenção', 'Horário Regular'),
(2358, 'Emanuel de Oliveira João', 'Direcção de Manutenção', 'Horário Regular'),
(2359, 'Ferreira António Gembo', 'Direcção de Manutenção', 'Horário Regular'),
(2361, 'Francisco Ndoluvualo', 'Direcção de Manutenção', 'Horário Regular'),
(2362, 'Jesus Domingos', 'DM - Clínica Geral', 'Horário Regular'),
(2363, 'Domingas Sebastião Pedro', 'DENF - Enfermagem Geral', ''),
(2364, 'Joaquim Gaspar Miguel', 'DENF - Supervisão Enfermagem', 'Turnos Tabela'),
(2366, 'Mauro Kingue Piedade', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(2367, 'Délcia Zange', 'Imagiologia', 'Turnos Tabela'),
(2370, 'Estefânia Etelvina Manuel João António', 'DENF - Enfermagem Geral', ''),
(2371, 'Mampuya Filipe', 'Direcção de Manutenção', 'Horário Regular'),
(2372, 'Gabriel Domingos Sebastião', 'Direcção de Manutenção', 'Horário Regular'),
(2373, 'Santos Carlos', 'Direcção de Manutenção', 'Horário Regular'),
(2374, 'Sesse António Maria', 'Direcção de Manutenção', 'Horário Regular'),
(2376, 'Neusa Marina de Oliveira dos Santos', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2377, 'Ana Esmeralda Pascoal dos Santos', 'Recepção', 'Turnos Alternados'),
(2379, 'Stianeth da Cunha Ferreira', 'Recepção', 'Horário Regular'),
(2386, 'Nádia Francisco Félix', 'Laboratório', 'De acordo com Escala'),
(2389, 'Hally Graciano Francisco Gabriel', 'Direcção Comercial', 'Horário Regular'),
(2390, 'Alfredo Manuel Martins de Oliveira', 'Direcção de Operações', 'Horário Regular'),
(2394, 'Nataliya Melnychenko', 'DM - Anestesia', 'Horário Regular'),
(2395, 'Monalinda de África dos Santos Ferreira', 'GH - Serviço de Higiene e Limpeza', 'De acordo com Escala'),
(2396, 'Valéria Beatriz Lauriano Quioco Bravo', 'GH - Serviço de Higiene e Limpeza', 'De acordo com Escala'),
(2397, 'Cecília Futi Nhongo Mavungo', 'Departamento Médico', 'Horário Regular'),
(2398, 'Laurinda Domingos Adriano', 'DENF - Auxiliares de Enfermagem', 'Horário Regular'),
(2399, 'Elma Priscila Rodrigues Madaleno', 'Direcção Comercial', 'Horário Regular'),
(2400, 'Madalena Tavira Fernandes Teixeira', 'Imagiologia', 'Turnos Tabela'),
(2403, 'Carla Macedo Gaspar', 'Laboratório', 'Horário Regular'),
(2404, 'Márcio Fernando da Silva Vasconcelos', 'Direcção Financeira', 'Horário Regular'),
(2405, 'Marinela Andrea Fernandes da Silva', 'DENF - Enfermagem Geral', 'Turnos Tabela'),
(2408, 'Luiz Carlos Grego', 'Conselho de Administração', 'Horário Regular'),
(2409, 'Marinela Januário Ferreira', 'DENF - Supervisão Enfermagem', 'De acordo com Escala'),
(2410, 'Onésima Ernesto Cacumba Francisco Miguel', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2411, 'Luzia da Conceição Ribeiro Cosme', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2412, 'Nilton Domingos Sebastião André', 'DENF - Supervisão Enfermagem', 'De acordo com Escala'),
(2413, 'Linda Antunes de Almeida Ngando', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2417, 'Cláudia Marieth António Cardoso Garcia', 'Recepção', 'De acordo com Escala'),
(2418, 'João Simão Guilherme', 'Direcção Comercial', 'De acordo com Escala'),
(2419, 'Iracelma de Almeida Viegas', 'Recepção', 'De acordo com Escala'),
(2420, 'Inácio Fernando Paixão', 'Direcção Comercial', 'Horário Regular'),
(2421, 'Meychel Perez Silva', 'DM - Cirurgia', 'De acordo com Escala'),
(2423, 'Luisa Henriques Paulo Fialho', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2424, 'Catarina José Zangão', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2425, 'Amélia Suraya Fernandes Lopes', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2426, 'Elda Nzuanga Bambi', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2427, 'Edmilson dos Anjos Tomás André', 'Segurança', 'De acordo com Escala'),
(2431, 'Genilda Felicidade Pemba Ndenga', 'DENF - Auxiliares de Enfermagem', 'Turnos Tabela'),
(2432, 'Angelina Olo Dongo', 'DENF - Bloco Operatório', 'Flexível'),
(2443, 'Elsa Fortunato Quintas', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2444, 'Magalys Xiomara Reyes Aguiar', 'DENF - Supervisão Enfermagem', 'Horário Regular'),
(2445, 'Aida Elena García Del Collado', 'DM - Pediatria', 'Horário Regular'),
(2447, 'Albano Isaías Sangombo', 'Segurança', 'Turnos Alternados'),
(2448, 'Júlia Ermelinda Boaventura Donga', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2449, 'Maria Helena Pascoal Gongo', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2451, 'Alcina Joaquina Rafael Pombo', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2452, 'Marioneth da Silva João', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2454, 'Daniela Sofia Fernandes Simão de Almeida e Sousa', 'Direcção de Recursos Humanos', 'Horário Regular'),
(2455, 'Maro da Conceição Guia Fernando', 'Direcção Comercial', 'Horário Regular'),
(2457, 'Francisca Cláudia Manuel Domingos', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2458, 'Manuel Fernando Mucaji', 'Direcção Comercial', 'Horário Regular'),
(2459, 'Moisés Mário Mateus Príncipe', 'Direcção Comercial', 'Horário Regular'),
(2460, 'Nelza Makiesse Bavambo', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2461, 'Victória Luis Victorino', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2462, 'Elisa Martinho Alberto', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2463, 'Vaiquiana Dala Sabino', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2464, 'Loide Pedro Afonso', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2465, 'Manuel Lopes Correia', 'Segurança', 'Turnos Alternados'),
(2466, 'Déborah da Conceição Van Duném Filipe', 'Recepção', 'De acordo com Escala'),
(2467, 'Maria Tomé Nascimento Silva', 'Staff Apoio CA', 'Horário Regular'),
(2468, 'Priscila Gonçalves Ângelo', 'Recepção', 'Horário Regular'),
(2469, 'Edson Stimo da Silva', 'Recepção', 'De acordo com Escala'),
(2470, 'Edson Domingos Muhongo Cachibo', 'GH - Cozinha', 'De acordo com Escala'),
(2471, 'Suelly Gonçalves Vieira Lopes', 'DM - Anestesia', 'De acordo com Escala'),
(2473, 'Gilda Vivianne Figueira Lopes da Silva Mariano', 'DM - Infecciologia', 'Horário Regular'),
(2474, 'Jerzy Wojciech Niekowal', 'DM - Obstetrícia / Ginecologia', 'Horário Regular'),
(2475, 'Ermelinda Carlota Teresa Monteiro de Oliveira Tati', 'DENF - Sala de Partos', 'De acordo com Escala'),
(2476, 'Daciano Txiculo Segunda Martins', 'DM - Clínica Geral', 'Horário Regular'),
(2477, 'Jéssika Amélia Jerónimo do Carmo dos Santos', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2478, 'Judith Semedo Moreira', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2479, 'Jonissa Maria Alexandra Tavares', 'DENF - Enfermagem Geral', 'De acordo com Escala'),
(2480, 'Matilde da Conceição André Fonseca', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2481, 'Nzinga Augusta Bingu', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2482, 'Jomarcia Renata Alexandre Silvério', 'DENF - Bloco Operatório', 'De acordo com Escala'),
(2483, 'Juelma Renata Alexandre Silvério', 'DENF - Bloco Operatório', 'De acordo com Escala'),
(2484, 'Helcia Deolinda Cipriano Santana Dambi', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2485, 'Lucilia Marlene Manuel Gonçalves', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(2486, 'Yesse Eulária Waite', 'DENF - Enfermagem Geral', 'Turnos Alternados'),
(12128, 'Berulcha Martinha Bernardo da Silva', 'Compras', 'Horário Regular'),
(12129, 'Belmir Barata Branco', 'Compras', 'Horário Regular'),
(12131, 'Nivaldo Anisio da Silva Lopes', 'Logística', 'Horário Regular'),
(12132, 'Nuno Rafael Rodrigo', 'Compras', 'Horário Regular'),
(12133, 'Andronico Loth Sombreiro', 'Logística', 'Horário Regular'),
(12140, 'Mateus Manuel António', 'Logística', 'Horário Regular');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id_location` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_card_action`
--

CREATE TABLE `log_card_action` (
  `id_card` varchar(8) NOT NULL,
  `id_employee` int NOT NULL,
  `datetime` datetime NOT NULL,
  `id_device` int NOT NULL,
  `id_action` int NOT NULL,
  `image_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_card_state`
--

CREATE TABLE `log_card_state` (
  `id_card` varchar(8) NOT NULL,
  `id_seq` int NOT NULL,
  `datetime` datetime NOT NULL,
  `card_state` int NOT NULL,
  `id_employee` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timesheet_devices`
--

CREATE TABLE `timesheet_devices` (
  `id_device` int NOT NULL,
  `id_location` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id_action`);

--
-- Indexes for table `card_states`
--
ALTER TABLE `card_states`
  ADD PRIMARY KEY (`id_card_state`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id_location`);

--
-- Indexes for table `log_card_action`
--
ALTER TABLE `log_card_action`
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_device` (`id_device`),
  ADD KEY `id_action` (`id_action`);

--
-- Indexes for table `log_card_state`
--
ALTER TABLE `log_card_state`
  ADD KEY `card_state_log_ibfk_1` (`id_employee`),
  ADD KEY `id_card` (`id_card`,`id_seq`,`datetime`,`card_state`,`id_employee`),
  ADD KEY `card_state` (`card_state`);

--
-- Indexes for table `timesheet_devices`
--
ALTER TABLE `timesheet_devices`
  ADD PRIMARY KEY (`id_device`),
  ADD KEY `id_location` (`id_location`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_card_action`
--
ALTER TABLE `log_card_action`
  ADD CONSTRAINT `log_card_action_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id_employee`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `log_card_action_ibfk_2` FOREIGN KEY (`id_device`) REFERENCES `timesheet_devices` (`id_device`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `log_card_action_ibfk_3` FOREIGN KEY (`id_action`) REFERENCES `actions` (`id_action`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `log_card_state`
--
ALTER TABLE `log_card_state`
  ADD CONSTRAINT `log_card_state_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id_employee`) ON DELETE RESTRICT,
  ADD CONSTRAINT `log_card_state_ibfk_2` FOREIGN KEY (`card_state`) REFERENCES `card_states` (`id_card_state`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `timesheet_devices`
--
ALTER TABLE `timesheet_devices`
  ADD CONSTRAINT `timesheet_devices_ibfk_1` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
