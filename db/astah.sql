-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 29 2019 г., 16:28
-- Версия сервера: 5.7.25
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `astah`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attachedsubject`
--

CREATE TABLE `attachedsubject` (
  `idAttachedSubject` int(11) NOT NULL,
  `idSubjects` int(11) DEFAULT NULL,
  `idDepartment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attachedsubject`
--

INSERT INTO `attachedsubject` (`idAttachedSubject`, `idSubjects`, `idDepartment`) VALUES
(1, 2, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `block`
--

CREATE TABLE `block` (
  `BMinVolume` int(11) NOT NULL,
  `BMaxVolume` int(11) NOT NULL,
  `BName` varchar(50) NOT NULL,
  `idBlock` int(11) NOT NULL,
  `idValidityPeriod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `block`
--

INSERT INTO `block` (`BMinVolume`, `BMaxVolume`, `BName`, `idBlock`, `idValidityPeriod`) VALUES
(216, 219, 'Дисциплины (модули)', 1, 1),
(12, 18, 'Практики', 2, 1),
(6, 9, 'Государственная итоговая аттестация', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `competence`
--

CREATE TABLE `competence` (
  `CCode` varchar(20) NOT NULL,
  `CContent` varchar(700) NOT NULL,
  `idCompetence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `competence`
--

INSERT INTO `competence` (`CCode`, `CContent`, `idCompetence`) VALUES
('ОК-1', 'владение культурой мышления, способность к обобщению, анализу, восприятию информации, постановке цели и выбору путей ее достижения ', 1),
('ОК-2', 'умение логически верно, аргументированно и ясно строить устную и письменную речь ', 2),
('ОК-3', 'готовность к кооперации с коллегами, работе в коллективе', 3),
('ОК-4', 'способность  находить  организационно-управленческие  решения  в  нестандартных  ситуациях  и  готовность нести за них ответственность', 4),
('ОК-5', 'умение использовать нормативные правовые документы в своей деятельности', 5),
('ОК-6', 'стремление к саморазвитию, повышению своей квалификации и мастерства ', 6),
('ОК-7', 'умение критически оценивать свои достоинства и недостатки, наметить пути и выбрать средства развития достоинств и устранения недостатков', 7),
('ОК-8', 'осознание социальной значимости своей будущей профессии, обладание высокой мотивацией к выполнению профессиональной деятельности', 8),
('ОК-9', 'способность использовать основные положения и методы социальных, гуманитарных и экономических наук при решении социальных и профессиональных задач, способность анализировать социально значимые проблемы и процессы', 9),
('ОК-10', 'готовность использовать основные законы естественнонаучных дисциплин в профессиональной деятельности, применять методы математического анализа и моделирования, теоретического и экспериментального исследования', 10),
('ОК-11', 'владение одним из иностранных языков на уровне не ниже разговорного', 11),
('ОК-12', 'владение основными методами защиты производственного персонала и населения от возможных последствий аварий, катастроф, стихийных бедствий', 12),
('ОК-13', 'владение  средствами  самостоятельного,  методически  правильного  использования  методов  физического воспитания и укрепления здоровья, готовность к достижению должного уровня физической подготовленности для обеспечения полноценной социальной и профессиональной деятельности', 13),
('ПК-1', 'понимание основных концепций, принципов, теорий и фактов, связанных с информатикой', 14),
('ПК-2', 'способность  к  формализации в  своей  предметной  области  с  учетом  ограничений  используемых  методов исследования', 15),
('ПК-3', 'готовность к использованию методов и инструментальных средств исследования объектов профессиональной деятельности', 16),
('ПК-4', 'готовность  обосновать  принимаемые  проектные решения,  осуществлять  постановку  и  выполнение экспериментов по проверке их корректности и эффективности', 17),
('ПК-5', 'умение готовить презентации, оформлять научно-технические отчеты по результатам выполненной работы, публиковать результаты исследований в виде статей и докладов на научно-технических конференциях', 18);

-- --------------------------------------------------------

--
-- Структура таблицы `competencefordepartment`
--

CREATE TABLE `competencefordepartment` (
  `idCompetenceForDepartment` int(11) NOT NULL,
  `idSubjects` int(11) DEFAULT NULL,
  `idCompetence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `competencefordepartment`
--

INSERT INTO `competencefordepartment` (`idCompetenceForDepartment`, `idSubjects`, `idCompetence`) VALUES
(1, 1, 2),
(2, 1, 6),
(3, 2, 14),
(4, 2, 16),
(5, 2, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `CCourceNumber` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idEducationLevel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`CCourceNumber`, `idCourse`, `idEducationLevel`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `DCode` varchar(20) NOT NULL,
  `DName` varchar(200) NOT NULL,
  `idDepartment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`DCode`, `DName`, `idDepartment`) VALUES
('ПМ', 'Прикладной математики', 1),
('ИО', 'Истории Отечества', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `educationlevel`
--

CREATE TABLE `educationlevel` (
  `ELQualification` varchar(50) NOT NULL,
  `ELFormOfEducation` varchar(50) NOT NULL,
  `idEducationLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `educationlevel`
--

INSERT INTO `educationlevel` (`ELQualification`, `ELFormOfEducation`, `idEducationLevel`) VALUES
('бакалавр', 'очная', 1),
('специалитет', 'очная', 3),
('бакалавр', 'заочная', 4),
('специалитет', 'заочная', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `maindocument`
--

CREATE TABLE `maindocument` (
  `MDName` varchar(200) NOT NULL,
  `idMainDocument` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `maindocument`
--

INSERT INTO `maindocument` (`MDName`, `idMainDocument`) VALUES
('ФГОС ВО', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `semestr`
--

CREATE TABLE `semestr` (
  `SNumber` int(11) NOT NULL,
  `SWeekInSemestr` int(11) NOT NULL,
  `idSemest` int(11) NOT NULL,
  `idCourse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `semestr`
--

INSERT INTO `semestr` (`SNumber`, `SWeekInSemestr`, `idSemest`, `idCourse`) VALUES
(1, 17, 1, 1),
(2, 17, 2, 1),
(3, 17, 3, 2),
(4, 17, 4, 2),
(5, 17, 5, 3),
(6, 17, 6, 3),
(7, 17, 7, 4),
(8, 13, 8, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `semestrproperties`
--

CREATE TABLE `semestrproperties` (
  `SPCountLections` int(11) NOT NULL,
  `SPLabWork` int(11) NOT NULL,
  `SPPracticalWork` int(11) NOT NULL,
  `SPSelfOnSemestr` int(11) NOT NULL,
  `SPSelfOnSession` int(11) NOT NULL,
  `idSemestrProperties` int(11) NOT NULL,
  `idSubjects` int(11) DEFAULT NULL,
  `idSevest` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `semestrproperties`
--

INSERT INTO `semestrproperties` (`SPCountLections`, `SPLabWork`, `SPPracticalWork`, `SPSelfOnSemestr`, `SPSelfOnSession`, `idSemestrProperties`, `idSubjects`, `idSevest`) VALUES
(2, 2, 1, 45, 36, 1, 2, 1),
(1, 2, 1, 45, 45, 2, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `speciality`
--

CREATE TABLE `speciality` (
  `SCode` varchar(20) NOT NULL,
  `SName` varchar(50) NOT NULL,
  `isAcademic` tinyint(1) NOT NULL,
  `idSpeciality` int(11) NOT NULL,
  `idEducationLevel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `speciality`
--

INSERT INTO `speciality` (`SCode`, `SName`, `isAcademic`, `idSpeciality`, `idEducationLevel`) VALUES
('09.03.04', 'Программная инженерия', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `subblock`
--

CREATE TABLE `subblock` (
  `SBName` varchar(50) NOT NULL,
  `SBMinVolume` int(11) NOT NULL,
  `SBMaxVolume` int(11) NOT NULL,
  `idSubBlock` int(11) NOT NULL,
  `idBlock` int(11) NOT NULL,
  `idValidityPeriod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subblock`
--

INSERT INTO `subblock` (`SBName`, `SBMinVolume`, `SBMaxVolume`, `idSubBlock`, `idBlock`, `idValidityPeriod`) VALUES
('Базовая часть', 102, 111, 1, 1, 1),
('Вариативная часть', 108, 114, 2, 1, 1),
('Вариативная часть', 12, 18, 3, 2, 1),
('Базовая часть', 6, 9, 4, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `subjectdata`
--

CREATE TABLE `subjectdata` (
  `SDExams` int(11) NOT NULL,
  `SDTest` int(11) NOT NULL,
  `SDCoursework` int(11) NOT NULL,
  `SDCalculationTask` int(11) NOT NULL,
  `idSubjectData` int(11) NOT NULL,
  `idSubjects` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subjectdata`
--

INSERT INTO `subjectdata` (`SDExams`, `SDTest`, `SDCoursework`, `SDCalculationTask`, `idSubjectData`, `idSubjects`) VALUES
(1, 0, 0, 0, 1, 1),
(12, 1, 0, 0, 2, 2),
(234, 0, 0, 23, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `SName` varchar(200) NOT NULL,
  `idSubjects` int(11) NOT NULL,
  `idSubBlock` int(11) DEFAULT NULL,
  `idBlock` int(11) DEFAULT NULL,
  `idValidityPeriod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subjects`
--

INSERT INTO `subjects` (`SName`, `idSubjects`, `idSubBlock`, `idBlock`, `idValidityPeriod`) VALUES
('История', 1, 1, 1, 1),
('Основы программирования', 2, 1, 1, 1),
('Математический анализ', 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `validityperiod`
--

CREATE TABLE `validityperiod` (
  `VPDateCreation` date NOT NULL,
  `VPStartYear` year(4) NOT NULL,
  `VPEndYear` year(4) DEFAULT NULL,
  `VPProfile` varchar(200) NOT NULL,
  `idValidityPeriod` int(11) NOT NULL,
  `idSpeciality` int(11) DEFAULT NULL,
  `idMainDocument` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `validityperiod`
--

INSERT INTO `validityperiod` (`VPDateCreation`, `VPStartYear`, `VPEndYear`, `VPProfile`, `idValidityPeriod`, `idSpeciality`, `idMainDocument`) VALUES
('2018-05-28', 2018, NULL, 'Разработка программно-информационных систем', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `weekproperties`
--

CREATE TABLE `weekproperties` (
  `WPStartDate` date NOT NULL,
  `WPEndDate` date NOT NULL,
  `idWeekProperties` int(11) NOT NULL,
  `idValidityPeriod` int(11) DEFAULT NULL,
  `idCourse` int(11) DEFAULT NULL,
  `idWeekType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `weekproperties`
--

INSERT INTO `weekproperties` (`WPStartDate`, `WPEndDate`, `idWeekProperties`, `idValidityPeriod`, `idCourse`, `idWeekType`) VALUES
('2018-09-01', '2018-12-28', 1, 1, 1, 1),
('2018-09-01', '2018-12-28', 3, 1, 2, 1),
('2018-09-01', '2018-12-28', 4, 1, 3, 1),
('2018-09-01', '2018-12-28', 5, 1, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `weektype`
--

CREATE TABLE `weektype` (
  `CName` varchar(20) NOT NULL,
  `idWeekType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `weektype`
--

INSERT INTO `weektype` (`CName`, `idWeekType`) VALUES
('Теоритическое обучен', 1),
('Нерабочие праздничны', 2),
('Производственная пра', 3),
('Экзаменационная сесс', 4),
('Учебная практика', 5),
('Государственная итог', 6),
('Каникулы', 7),
('Научно-исследователь', 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attachedsubject`
--
ALTER TABLE `attachedsubject`
  ADD PRIMARY KEY (`idAttachedSubject`),
  ADD KEY `indSubject` (`idSubjects`),
  ADD KEY `indDepartment` (`idDepartment`);

--
-- Индексы таблицы `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`idBlock`,`idValidityPeriod`),
  ADD KEY `PlanToBlock` (`idValidityPeriod`);

--
-- Индексы таблицы `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`idCompetence`);

--
-- Индексы таблицы `competencefordepartment`
--
ALTER TABLE `competencefordepartment`
  ADD PRIMARY KEY (`idCompetenceForDepartment`),
  ADD KEY `indSubject` (`idSubjects`),
  ADD KEY `indCompetence` (`idCompetence`);

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`idCourse`),
  ADD KEY `IX_Relationship7` (`idEducationLevel`);

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`idDepartment`);

--
-- Индексы таблицы `educationlevel`
--
ALTER TABLE `educationlevel`
  ADD PRIMARY KEY (`idEducationLevel`);

--
-- Индексы таблицы `maindocument`
--
ALTER TABLE `maindocument`
  ADD PRIMARY KEY (`idMainDocument`);

--
-- Индексы таблицы `semestr`
--
ALTER TABLE `semestr`
  ADD PRIMARY KEY (`idSemest`),
  ADD KEY `IX_Relationship1` (`idCourse`);

--
-- Индексы таблицы `semestrproperties`
--
ALTER TABLE `semestrproperties`
  ADD PRIMARY KEY (`idSemestrProperties`),
  ADD KEY `indSubjects` (`idSubjects`),
  ADD KEY `IX_Relationship5` (`idSevest`);

--
-- Индексы таблицы `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`idSpeciality`),
  ADD KEY `indEducationLevel` (`idEducationLevel`);

--
-- Индексы таблицы `subblock`
--
ALTER TABLE `subblock`
  ADD PRIMARY KEY (`idSubBlock`,`idBlock`,`idValidityPeriod`),
  ADD KEY `BlockToSubBlock` (`idBlock`,`idValidityPeriod`);

--
-- Индексы таблицы `subjectdata`
--
ALTER TABLE `subjectdata`
  ADD PRIMARY KEY (`idSubjectData`),
  ADD KEY `indSubject` (`idSubjects`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`idSubjects`),
  ADD KEY `BlockSBlockPlan` (`idSubBlock`,`idBlock`,`idValidityPeriod`);

--
-- Индексы таблицы `validityperiod`
--
ALTER TABLE `validityperiod`
  ADD PRIMARY KEY (`idValidityPeriod`),
  ADD KEY `indSpeciality` (`idSpeciality`),
  ADD KEY `indMainDocument` (`idMainDocument`);

--
-- Индексы таблицы `weekproperties`
--
ALTER TABLE `weekproperties`
  ADD PRIMARY KEY (`idWeekProperties`),
  ADD KEY `indValidityPeriod` (`idValidityPeriod`),
  ADD KEY `indCourse` (`idCourse`),
  ADD KEY `indWeekType` (`idWeekType`);

--
-- Индексы таблицы `weektype`
--
ALTER TABLE `weektype`
  ADD PRIMARY KEY (`idWeekType`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attachedsubject`
--
ALTER TABLE `attachedsubject`
  MODIFY `idAttachedSubject` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `block`
--
ALTER TABLE `block`
  MODIFY `idBlock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `competence`
--
ALTER TABLE `competence`
  MODIFY `idCompetence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `competencefordepartment`
--
ALTER TABLE `competencefordepartment`
  MODIFY `idCompetenceForDepartment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `idCourse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `idDepartment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `educationlevel`
--
ALTER TABLE `educationlevel`
  MODIFY `idEducationLevel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `maindocument`
--
ALTER TABLE `maindocument`
  MODIFY `idMainDocument` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `semestr`
--
ALTER TABLE `semestr`
  MODIFY `idSemest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `semestrproperties`
--
ALTER TABLE `semestrproperties`
  MODIFY `idSemestrProperties` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `speciality`
--
ALTER TABLE `speciality`
  MODIFY `idSpeciality` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `subblock`
--
ALTER TABLE `subblock`
  MODIFY `idSubBlock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `subjectdata`
--
ALTER TABLE `subjectdata`
  MODIFY `idSubjectData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `idSubjects` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `validityperiod`
--
ALTER TABLE `validityperiod`
  MODIFY `idValidityPeriod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `weekproperties`
--
ALTER TABLE `weekproperties`
  MODIFY `idWeekProperties` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `weektype`
--
ALTER TABLE `weektype`
  MODIFY `idWeekType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `attachedsubject`
--
ALTER TABLE `attachedsubject`
  ADD CONSTRAINT `DepartmentToAttachment` FOREIGN KEY (`idDepartment`) REFERENCES `department` (`idDepartment`),
  ADD CONSTRAINT `SubjToAttachment` FOREIGN KEY (`idSubjects`) REFERENCES `subjects` (`idSubjects`);

--
-- Ограничения внешнего ключа таблицы `block`
--
ALTER TABLE `block`
  ADD CONSTRAINT `PlanToBlock` FOREIGN KEY (`idValidityPeriod`) REFERENCES `validityperiod` (`idValidityPeriod`);

--
-- Ограничения внешнего ключа таблицы `competencefordepartment`
--
ALTER TABLE `competencefordepartment`
  ADD CONSTRAINT `CFDToCompetence` FOREIGN KEY (`idCompetence`) REFERENCES `competence` (`idCompetence`),
  ADD CONSTRAINT `SubjectToCFD` FOREIGN KEY (`idSubjects`) REFERENCES `subjects` (`idSubjects`);

--
-- Ограничения внешнего ключа таблицы `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `ELevelToCource` FOREIGN KEY (`idEducationLevel`) REFERENCES `educationlevel` (`idEducationLevel`);

--
-- Ограничения внешнего ключа таблицы `semestr`
--
ALTER TABLE `semestr`
  ADD CONSTRAINT `CourseToSemestr` FOREIGN KEY (`idCourse`) REFERENCES `course` (`idCourse`);

--
-- Ограничения внешнего ключа таблицы `semestrproperties`
--
ALTER TABLE `semestrproperties`
  ADD CONSTRAINT `SemestrToSemProps` FOREIGN KEY (`idSevest`) REFERENCES `semestr` (`idSemest`),
  ADD CONSTRAINT `SubjectToSemProps` FOREIGN KEY (`idSubjects`) REFERENCES `subjects` (`idSubjects`);

--
-- Ограничения внешнего ключа таблицы `speciality`
--
ALTER TABLE `speciality`
  ADD CONSTRAINT `LevelToSpeciality` FOREIGN KEY (`idEducationLevel`) REFERENCES `educationlevel` (`idEducationLevel`);

--
-- Ограничения внешнего ключа таблицы `subblock`
--
ALTER TABLE `subblock`
  ADD CONSTRAINT `BlockToSubBlock` FOREIGN KEY (`idBlock`,`idValidityPeriod`) REFERENCES `block` (`idBlock`, `idValidityPeriod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subjectdata`
--
ALTER TABLE `subjectdata`
  ADD CONSTRAINT `SubjToData` FOREIGN KEY (`idSubjects`) REFERENCES `subjects` (`idSubjects`);

--
-- Ограничения внешнего ключа таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `SubBlockToSubject` FOREIGN KEY (`idSubBlock`,`idBlock`,`idValidityPeriod`) REFERENCES `subblock` (`idSubBlock`, `idBlock`, `idValidityPeriod`);

--
-- Ограничения внешнего ключа таблицы `validityperiod`
--
ALTER TABLE `validityperiod`
  ADD CONSTRAINT `DocumentToPlan` FOREIGN KEY (`idMainDocument`) REFERENCES `maindocument` (`idMainDocument`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SpecialityToPlan` FOREIGN KEY (`idSpeciality`) REFERENCES `speciality` (`idSpeciality`);

--
-- Ограничения внешнего ключа таблицы `weekproperties`
--
ALTER TABLE `weekproperties`
  ADD CONSTRAINT `CourseToWeekProps` FOREIGN KEY (`idCourse`) REFERENCES `course` (`idCourse`),
  ADD CONSTRAINT `PlanToWeekProps` FOREIGN KEY (`idValidityPeriod`) REFERENCES `validityperiod` (`idValidityPeriod`),
  ADD CONSTRAINT `WeekTypeToWeekProps` FOREIGN KEY (`idWeekType`) REFERENCES `weektype` (`idWeekType`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
