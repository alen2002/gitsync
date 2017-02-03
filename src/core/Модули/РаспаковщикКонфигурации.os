﻿///////////////////////////////////////////////////////////////////
//
// Служебный модуль с набором методов работы с распаковщиком
//
// Представляет собой модификацию приложения gitsync от 
// команды oscript-library
//
///////////////////////////////////////////////////////////////////

Функция ПолучитьИНастроитьРаспаковщик(Знач ПараметрыЗапуска, Знач ДополнительныеПараметры) Экспорт

	Распаковщик = ПолучитьРаспаковщик(ДополнительныеПараметры);
	Распаковщик.ДоменПочтыДляGitПоУмолчанию = ПараметрыЗапуска["-email"];
	Возврат Распаковщик;

КонецФункции // ПолучитьИНастроитьРаспаковщик

Функция ПолучитьРаспаковщик(ПараметрыРаспаковщика) Экспорт

	Распаковщик = Новый МенеджерСинхронизации();
	Распаковщик.УстановитьРежимУдаленияВременныхФайлов(ПараметрыРаспаковщика.УдалятьВременныеФайлы);
	Возврат Распаковщик;

КонецФункции // ПолучитьРаспаковщик