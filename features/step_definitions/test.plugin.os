﻿// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd
#Использовать tempfiles

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("КоличествоКоммитовДолжноБыть");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	// ВременныеФайлы.Удалить();
КонецПроцедуры

//Количество коммитов должно быть "5"
Процедура КоличествоКоммитовДолжноБыть(Знач ЧислоПроверки) Экспорт
	
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ПутьКаталогаИсходников = БДД.ПолучитьИзКонтекста("ПутьКаталогаИсходников");
	ГитРепозиторий.УстановитьРабочийКаталог(ПутьКаталогаИсходников);

	ПараметрыКоманды = Новый Массив;
	ПараметрыКоманды.Добавить("log");
	ПараметрыКоманды.Добавить("--pretty=oneline");
	ГитРепозиторий.ВыполнитьКоманду(ПараметрыКоманды);
	Вывод = ГитРепозиторий.ПолучитьВыводКоманды();

	МассивСтрок = СтрРазделить(Вывод, Символы.ПС);

	КоличествоКоммитов = МассивСтрок.Количество();
		
	Утверждения.ПроверитьРавенство(Число(ЧислоПроверки), КоличествоКоммитов, "Количество коммитов должно быть равно");
	
КонецПроцедуры
