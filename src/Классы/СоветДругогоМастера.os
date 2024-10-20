#Область ОписаниеПеременных

// Соответствие - Значения деталек в виде соответствия
// для последующей передачи в МенеджерПараметров.
//
Перем ЗначенияДеталек;

// Строка - префикс переменных среды, хранящих значения деталек.
//
Перем ПрефиксПеременныхСреды;

// Строка - имя файла (без расширения), в котором хранятся значения деталек.
//
Перем ИмяФайлаСоЗначениямиДеталек;

// Строка - Относительный путь к каталогу, где хранятся файл со значениями деталек.
//
Перем ДополнительныйКаталогПоискаФайлаСоЗначениямиДеталек;

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Установить/получить значения деталек.
//
// Параметры:
//   НовоеЗначение - Соответствие - устанавливаемые значения деталек.
//
//  Возвращаемое значение:
//   Соответствие, СоветДругогоМастера - Текущее установленное значение для гетера, ЭтотОбъект для сеттера.
//
Функция ЗначенияДеталек(НовоеЗначение = Неопределено) Экспорт

	Если НовоеЗначение <> Неопределено Тогда
		ЗначенияДеталек = НовоеЗначение;
		Возврат ЭтотОбъект;
	КонецЕсли;

	Возврат ЗначенияДеталек;

КонецФункции

// Установить/получить префикс переменных среды, хранящих значения деталек.
//
// Параметры:
//   НовоеЗначение - Строка - устанавливаемый префикс переменных среды.
//
//  Возвращаемое значение:
//   Строка, СоветДругогоМастера - Текущее установленное значение для гетера, ЭтотОбъект для сеттера.
//
Функция ПрефиксПеременныхСреды(НовоеЗначение = Неопределено) Экспорт
	
	Если НовоеЗначение <> Неопределено Тогда
		ПрефиксПеременныхСреды = НовоеЗначение;
		Возврат ЭтотОбъект;
	КонецЕсли;
	
	Возврат ПрефиксПеременныхСреды;

КонецФункции

// Установить/получить имя файла (без расширения), в котором хранятся значения деталек.
//
// Параметры:
//   НовоеЗначение - Строка - устанавливаемое имя файла.
//
//  Возвращаемое значение:
//   Строка, СоветДругогоМастера - Текущее установленное значение для гетера, ЭтотОбъект для сеттера.
//
Функция ИмяФайлаСоЗначениямиДеталек(НовоеЗначение = Неопределено) Экспорт

	Если НовоеЗначение <> Неопределено Тогда
		ИмяФайлаСоЗначениямиДеталек = НовоеЗначение;
		Возврат ЭтотОбъект;
	КонецЕсли;

	Возврат ИмяФайлаСоЗначениямиДеталек;

КонецФункции

// Установить/получить относительный путь к каталогу, где хранятся файл со значениями деталек.
//
// Параметры:
//   НовоеЗначение - Строка - устанавливаемый путь к каталогу.
//
//  Возвращаемое значение:
//   Строка, СоветДругогоМастера - Текущее установленное значение для гетера, ЭтотОбъект для сеттера.
//
Функция ДополнительныйКаталогПоискаФайлаСоЗначениямиДеталек(НовоеЗначение = Неопределено) Экспорт

	Если НовоеЗначение <> Неопределено Тогда
		ДополнительныйКаталогПоискаФайлаСоЗначениямиДеталек = НовоеЗначение;
		Возврат ЭтотОбъект;
	КонецЕсли;

	Возврат ДополнительныйКаталогПоискаФайлаСоЗначениямиДеталек;

КонецФункции

#КонецОбласти

#Область Инициализация

// Советы по созданию поделки, упакованные в объект.
//
Процедура ПриСозданииОбъекта()

	ЗначенияДеталек = Новый Соответствие();
	ПрефиксПеременныхСреды = "";
	ИмяФайлаСоЗначениямиДеталек = "autumn-properties";
	ДополнительныйКаталогПоискаФайлаСоЗначениямиДеталек = "src";

КонецПроцедуры

#КонецОбласти
