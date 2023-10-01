#Область ОписаниеПеременных

// Соответствие - Значения деталек в виде соответствия
// для последующей передачи в МенеджерПараметров.
//
Перем ЗначенияДеталек;

// Строка - префикс переменных среды, хранящих значения деталек.
//
Перем ПрефиксПеременныхСреды;

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Установить/получить значения деталек.
//
// Параметры:
//   НовоеЗначение - Соответствие - устанавливаемые значения деталек.
//
//  Возвращаемое значение:
//   Соответствие - Текущее установленное значение.
//
Функция ЗначенияДеталек(НовоеЗначение = Неопределено) Экспорт

	Если НовоеЗначение <> Неопределено Тогда
		ЗначенияДеталек = НовоеЗначение;
	КонецЕсли;

	Возврат ЗначенияДеталек;

КонецФункции

// Установить/получить префикс переменных среды, хранящих значения деталек.
//
// Параметры:
//   НовоеЗначение - Строка - устанавливаемый префикс переменных среды.
//
//  Возвращаемое значение:
//   Строка - Текущее установленное значение.
//
Функция ПрефиксПеременныхСреды(НовоеЗначение = Неопределено) Экспорт
	
	Если НовоеЗначение <> Неопределено Тогда
		ПрефиксПеременныхСреды = НовоеЗначение;
	КонецЕсли;
	
	Возврат ПрефиксПеременныхСреды;

КонецФункции

#КонецОбласти

#Область Инициализация

Процедура ПриСозданииОбъекта()

	ЗначенияДеталек = Новый Соответствие();
	ПрефиксПеременныхСреды = "";
	
КонецПроцедуры

#КонецОбласти
