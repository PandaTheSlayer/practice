-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Фев 05 2018 г., 07:10
-- Версия сервера: 5.5.51-38.2
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `paulined_moodle`
--

-- --------------------------------------------------------

--
-- Структура таблицы `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='feedback_items';

--
-- Дамп данных таблицы `mdl_feedback_item`
--

INSERT INTO `mdl_feedback_item` (`id`, `feedback`, `template`, `name`, `label`, `presentation`, `typ`, `hasvalue`, `position`, `required`, `dependitem`, `dependvalue`, `options`) VALUES
(1, 1, 0, 'Фамилия (на украинском языке)', '', '70|255', 'textfield', 1, 1, 1, 0, '', ''),
(2, 1, 0, 'Имя (на украинском языке)', '', '70|255', 'textfield', 1, 2, 1, 0, '', ''),
(3, 1, 0, 'Отчество (на украинском языке)', '', '70|255', 'textfield', 1, 3, 1, 0, '', ''),
(4, 1, 0, 'Фамилия (на английском языке, в соответствии с загран.паспортом)', '', '70|255', 'textfield', 1, 4, 1, 0, '', ''),
(5, 1, 0, 'Имя  (на английском языке, в соответствии с загран.паспортом)', '', '70|255', 'textfield', 1, 5, 1, 0, '', ''),
(7, 1, 0, 'Выберите курс', '', 'r>>>>>Web-дизайн', 'multichoice', 1, 6, 1, 0, '', 'h'),
(8, 1, 0, 'Планируете ли Вы стать слушателем углубленного курса "Front-End Разработка. Javascript"', '', 'r>>>>>Да\r|Нет', 'multichoice', 1, 7, 1, 0, '', 'h'),
(9, 2, 0, 'Последовательно ли изложение дисциплин, преподаваемых на кафедре? (Например, сначала основы физики, потом электротехника, затем роботехнические системы)', '', 'r>>>>>Да\n|Нет<<<<<1', 'multichoice', 1, 2, 1, 0, '', 'h'),
(10, 2, 0, 'Как Вы считаете, нужна ли Вашей кафедре реорганизация - обновление учебных материалов, изменение преподавательского состава, улучшение качества преподавания и т.д.?', '', 'r>>>>>Да\n|Нет<<<<<1', 'multichoice', 1, 1, 1, 0, '', 'h'),
(11, 2, 0, 'Необходимы ли Вам конспекты лекций в электронном виде?', '', 'r>>>>>Да\n|Нет<<<<<1', 'multichoice', 1, 3, 1, 0, '', 'h'),
(12, 2, 0, 'Оцените качество методических изданий.', '', 'r>>>>>1\n|2\n|3\n|4\n|5<<<<<1', 'multichoice', 1, 4, 1, 0, '', 'h'),
(13, 2, 0, 'Оцените качество материала на лекциях.', '', 'r>>>>>1\n|2\n|3\n|4\n|5<<<<<1', 'multichoice', 1, 5, 1, 0, '', 'h'),
(14, 2, 0, 'Бывает ли у Вас такое ощущение, будто Вы знаете дисциплину лучше преподавателя?', '', 'r>>>>>Да\n|Нет<<<<<1', 'multichoice', 1, 6, 1, 0, '', 'h'),
(15, 2, 0, 'Считаете ли Вы, что стоит обновить учебную программу?', '', 'r>>>>>Да\n|Нет<<<<<1', 'multichoice', 1, 7, 1, 0, '', 'h'),
(16, 2, 0, 'Оцените качество лабораторных и практических занятий.', '', 'r>>>>>1\n|2\n|3\n|4\n|5<<<<<1', 'multichoice', 1, 8, 1, 0, '', 'h'),
(17, 2, 0, 'Каких направлений или предметов не хватает на кафедре?', '', '70|255', 'textfield', 1, 9, 1, 0, '', ''),
(37, 4, 0, 'Участвовали ли Вы когда-нибудь в подобного рода дистанционных курсах ранее?', '', 'r>>>>>Да\r|Нет<<<<<1', 'multichoice', 1, 1, 1, 0, '', 'h'),
(38, 4, 0, 'Как Вы считаете, повлияло ли количество материалов, размещенных на сайте, на итоговую оценку по дисциплине?', '', 'r>>>>>Количество материалов лекций, представленных на сайте, достаточно для успешного обучения\r|Количество материалов лекций было недостаточно для обучения - часто я пользовался(лась) сторонними ресурсами\r|Я не пользовался(лась) конспектами лекций вообще', 'multichoice', 1, 2, 1, 0, '', 'h'),
(39, 4, 0, 'Как Вы считаете, повлияло ли количество тестов на Вашу подготовку к модулю?', '', 'r>>>>>Тесты помогли мне разобраться с темой\r|Тесты мне только мешали, не давали возможности пройти дальше', 'multichoice', 1, 3, 1, 0, '', 'h'),
(40, 4, 0, 'Как Вы считаете, повлияло ли время, которое Вы затратили на прохождение теста, на итоговую оценку по дисциплине?', '', 'r>>>>>Чем дольше я сидел(а) над тестом, тем лучше понимал(а) вопрос, тем больше получал(а) баллов за тест\r|Чем дольше я сидел(а) над тестом, тем больше сомнений появлялось насчет вопросов, тем меньше получал(а) баллов за тест', 'multichoice', 1, 4, 1, 0, '', 'h'),
(41, 4, 0, 'Как Вы считаете, повлияло ли количество лабораторных работ на итоговую оценку по дисциплине?', '', 'r>>>>>Количество лабораторных работ давали мне более широкое представление о теме\r|Количество лабораторных работ только сбивало меня, порождало ряд новых вопросов\r|Мне все равно на количество лабораторных, для меня главное - сдать предмет', 'multichoice', 1, 5, 1, 0, '', 'h'),
(42, 4, 0, 'Как Вы считаете, сколько времени (в среднем) Вы тратили на подготовку к модулю?', '', 'r>>>>>До 30 минут\r|До 1 часа\r|До 2 часов\r|Более 2 часов', 'multichoice', 1, 6, 1, 0, '', 'h'),
(43, 5, 0, 'Участвовали ли Вы когда-нибудь в подобного рода дистанционных курсах ранее?', '', 'r>>>>>Да\n|Нет<<<<<1', 'multichoice', 1, 1, 1, 0, '', 'h'),
(44, 5, 0, 'Как Вы считаете, повлияло ли количество материалов, размещенных на сайте, на итоговую оценку по дисциплине?', '', 'r>>>>>Количество материалов лекций, представленных на сайте, достаточно для успешного обучения\r|Количество материалов лекций было недостаточно для обучения - часто я пользовался(лась) сторонними ресурсами\r|Я не пользовался(лась) конспектами лекций вообще', 'multichoice', 1, 2, 1, 0, '', 'h'),
(45, 5, 0, 'Как Вы считаете, повлияло ли количество тестов на Вашу подготовку к модулю?', '', 'r>>>>>Тесты помогли мне разобраться с темой\n|Тесты мне только мешали, не давали возможности пройти дальше', 'multichoice', 1, 3, 1, 0, '', 'h'),
(46, 5, 0, 'Как Вы считаете, повлияло ли время, которое Вы затратили на прохождение теста, на итоговую оценку по дисциплине?', '', 'r>>>>>Чем дольше я сидел(а) над тестом, тем лучше понимал(а) вопрос, тем больше получал(а) баллов за тест\n|Чем дольше я сидел(а) над тестом, тем больше сомнений появлялось насчет вопросов, тем меньше получал(а) баллов за тест', 'multichoice', 1, 4, 1, 0, '', 'h'),
(47, 5, 0, 'Как Вы считаете, повлияло ли количество лабораторных работ на итоговую оценку по дисциплине?', '', 'r>>>>>Количество лабораторных работ давали мне более широкое представление о теме\n|Количество лабораторных работ только сбивало меня, порождало ряд новых вопросов\n|Мне все равно на количество лабораторных, для меня главное - сдать предмет', 'multichoice', 1, 5, 1, 0, '', 'h'),
(48, 5, 0, 'Как Вы считаете, сколько времени (в среднем) Вы тратили на подготовку к модулю?', '', 'r>>>>>До 30 минут\n|До 1 часа\n|До 2 часов\n|Более 2 часов', 'multichoice', 1, 6, 1, 0, '', 'h'),
(69, 9, 0, 'Как Вы считаете, повлияло ли количество материалов, размещенных на сайте, на итоговую оценку по дисциплине?', '', 'r>>>>>Количество материалов лекций, представленных на сайте, достаточно для успешного обучения\n|Количество материалов лекций было недостаточно для обучения - часто я пользовался(лась) сторонними ресурсами\n|Я не пользовался(лась) конспектами лекций вообще', 'multichoice', 1, 1, 1, 0, '', 'h'),
(70, 9, 0, 'Как Вы считаете, повлияло ли количество тестов на Вашу подготовку к модулю?', '', 'r>>>>>Тесты помогли мне разобраться с темой\n|Тесты мне только мешали, не давали возможности пройти дальше', 'multichoice', 1, 2, 1, 0, '', 'h'),
(71, 9, 0, 'Как Вы считаете, повлияло ли время, которое Вы затратили на прохождение теста, на итоговую оценку по дисциплине?', '', 'r>>>>>Чем дольше я сидел(а) над тестом, тем лучше понимал(а) вопрос, тем больше получал(а) баллов за тест\n|Чем дольше я сидел(а) над тестом, тем больше сомнений появлялось насчет вопросов, тем меньше получал(а) баллов за тест', 'multichoice', 1, 3, 1, 0, '', 'h'),
(72, 9, 0, 'Как Вы считаете, повлияло ли количество лабораторных работ на итоговую оценку по дисциплине?', '', 'r>>>>>Количество лабораторных работ давали мне более широкое представление о теме\r|Количество лабораторных работ только сбивало меня, порождало ряд новых вопросов\r|Мне все равно на количество лабораторных, для меня главное - сдать предмет', 'multichoice', 1, 4, 1, 0, '', 'h'),
(73, 9, 0, 'Как Вы считаете, сколько времени (в среднем) Вы тратили на подготовку к модулю?', '', 'r>>>>>До 30 минут\n|До 1 часа\n|До 2 часов\n|Более 2 часов', 'multichoice', 1, 5, 1, 0, '', 'h'),
(74, 10, 0, 'Фамилия, имя, отчество на русском языке', '', '50|255', 'textfield', 1, 1, 1, 0, '', ''),
(75, 10, 0, 'Фамилия, имя, отчество на украинском языке (согласно паспорту или другому документу, удостоверяющего личность)', '', '50|255', 'textfield', 1, 2, 1, 0, '', ''),
(76, 10, 0, 'Фамилия, имя на английском языке (согласно загран. паспорту)', '', '50|255', 'textfield', 1, 3, 1, 0, '', ''),
(77, 10, 0, 'Отметьте, с какими из предложенных приложений Вы уже знакомы (работали)', '', 'c>>>>>Microsoft Office Word\r|Microsoft Paint\r|Paint.NET\r|GIMP\r|Adobe Lightroom\r|Adobe Photoshop\r|CorelDraw\r|Adobe Illustrator', 'multichoice', 1, 4, 1, 0, '', 'h'),
(78, 10, 0, 'Какова Ваша цель обучения на курсе?', '', '60|255', 'textfield', 1, 5, 1, 0, '', ''),
(80, 10, 0, 'Имеете ли Вы уже собственное онлайн-портфолио?', '', 'r>>>>>Да\r|Нет<<<<<1', 'multichoice', 1, 6, 1, 0, '', 'h'),
(81, 10, 0, 'Если на предыдущий вопрос Вы ответили "Да", укажите в поле внизу ссылку на свое онлайн-портфолио', '', '30|255', 'textfield', 1, 7, 0, 0, '', ''),
(82, 12, 0, 'Первая попытка', '', '0|20', 'numeric', 1, 1, 0, 0, '', ''),
(83, 12, 0, 'Вторая попытка', '', '0|20', 'numeric', 1, 2, 0, 0, '', ''),
(84, 12, 0, 'Третья попытка', '', '0|20', 'numeric', 1, 3, 0, 0, '', ''),
(85, 13, 0, 'Первая попытка', '', '0|20', 'numeric', 1, 1, 0, 0, '', ''),
(87, 13, 0, 'Вторая попытка', '', '0|20', 'numeric', 1, 2, 0, 0, '', ''),
(88, 13, 0, 'Третья попытка', '', '0|20', 'numeric', 1, 3, 0, 0, '', ''),
(89, 14, 0, 'Первая попытка', '', '0|20', 'numeric', 1, 1, 0, 0, '', ''),
(90, 14, 0, 'Вторая попытка', '', '0|20', 'numeric', 1, 2, 0, 0, '', ''),
(91, 14, 0, 'Третья попытка', '', '0|20', 'numeric', 1, 3, 0, 0, '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
  ADD PRIMARY KEY (`id`), ADD KEY `mdl_feeditem_fee_ix` (`feedback`), ADD KEY `mdl_feeditem_tem_ix` (`template`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
