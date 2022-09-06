#Использовать ".."
#Использовать asserts
#Использовать "."

&Тест
Процедура ИнициализацияКонтекстаСоСтороныПриложения() Экспорт

	// Дано
	КонтекстПриложения = Новый КонтекстПриложения;

	// Когда
	КонтекстПриложения.ЗарегистрироватьЗаготовку(Тип("ТестовыйИнициализатор"));

	// Тогда
	Желудь = КонтекстПриложения.ПолучитьЖелудь("ЖелудьНижнегоУровня");
	Ожидаем.Что(Желудь).Не_().Равно(Неопределено);

КонецПроцедуры

&Тест
Процедура ПриЗапускеПриложенияОтрабатываетЗаготовка() Экспорт

	// Дано
	КонтекстПриложения = Новый КонтекстПриложения;
	КонтекстПриложения.ЗарегистрироватьДуб(Тип("ГлавныйДуб"));

	// Когда
	КонтекстПриложения.ЗарегистрироватьЗаготовку(Тип("ЗаготовкаПриЗапускеПриложения"));

	// Тогда
	Массив = КонтекстПриложения.ПолучитьЖелудь("Массив");
	Ожидаем.Что(Массив).ИмеетДлину(1);

	// Когда
	КонтекстПриложения.ЗапуститьПриложение();

	// Тогда
	Ожидаем.Что(Массив).ИмеетДлину(2);
	
КонецПроцедуры

