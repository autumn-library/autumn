
#Использовать ".."
#Использовать asserts
#Использовать "."
#Использовать "./ОдноименныеЖелуди"

&Тест
Процедура ИмяЖелудяАвтоматическиОпределяетсяИзТипа() Экспорт
	// Дано
	Поделка = Новый Поделка();
	
	// Когда
	Поделка.ДобавитьЖелудь(Тип("ВерхнеУровневыйЖелудь"));

	// Тогда
	ОпределениеЖелудя = Поделка.ПолучитьОпределениеЖелудя("ВерхнеУровневыйЖелудь");
	
	Ожидаем.Что(ОпределениеЖелудя.ТипЖелудя()).Равно(Тип("ВерхнеУровневыйЖелудь"));
	Ожидаем.Что(ОпределениеЖелудя.Имя()).Равно("ВерхнеУровневыйЖелудь");

КонецПроцедуры

&Тест
Процедура СоздаетсяПростойЖелудь() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("ЖелудьНижнегоУровня"))
		.ЗапуститьПриложение();
	
	// Когда
	Желудь = Поделка.НайтиЖелудь("ЖелудьНижнегоУровня");

	// Тогда
	Ожидаем.Что(Желудь).Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура СоздаетсяЖелудьСЗависимостью() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("ВерхнеУровневыйЖелудь"))
		.ДобавитьЖелудь(Тип("ЖелудьНижнегоУровня"))
		.ЗапуститьПриложение();
	
	// Когда
	Желудь = Поделка.НайтиЖелудь("ВерхнеУровневыйЖелудь");

	// Тогда
	Ожидаем.Что(Желудь).Не_().Равно(Неопределено);

	Ожидаем.Что(Желудь.ЖелудьНижнегоУровня()).Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура ЖелудиИнициализируютсяКакСинглтоны() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("ВерхнеУровневыйЖелудь"))
		.ДобавитьЖелудь(Тип("ЖелудьНижнегоУровня"))
		.ЗапуститьПриложение();
	
	// Когда
	ВерхнеУровневыйЖелудь = Поделка.НайтиЖелудь("ВерхнеУровневыйЖелудь");
	ЖелудьНижнегоУровня = Поделка.НайтиЖелудь("ЖелудьНижнегоУровня");

	// Тогда
	Ожидаем.Что(ВерхнеУровневыйЖелудь.ЖелудьНижнегоУровня()).Равно(ЖелудьНижнегоУровня);
КонецПроцедуры

&Тест
Процедура ДубСоздаетПростойЖелудь() Экспорт

	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьДуб(Тип("ГлавныйДуб"))
		.ЗапуститьПриложение();

	// Когда
	Структура = Поделка.НайтиЖелудь("Структура");

	// Тогда
	Ожидаем.Что(Структура).Не_().Равно(Неопределено);
	Ожидаем.Что(Структура.Ключ).Равно(0);

КонецПроцедуры

&Тест
Процедура ДубСоздаетСложныйЖелудь() Экспорт

	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьДуб(Тип("ГлавныйДуб"))
		.ЗапуститьПриложение();

	// Когда
	Массив = Поделка.НайтиЖелудь("Массив");

	// Тогда
	Ожидаем.Что(Массив).Не_().Равно(Неопределено);
	Ожидаем.Что(Массив[0].Ключ).Равно(0);

	// Когда
	Структура = Поделка.НайтиЖелудь("Структура");
	Структура.Ключ = 1;

	// Тогда
	Ожидаем.Что(Массив[0].Ключ).Равно(1);

КонецПроцедуры

&Тест
Процедура ПластилинВнедряетсяВПоляЖелудя() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("ВерхнеУровневыйЖелудь"))
		.ДобавитьЖелудь(Тип("ЖелудьНижнегоУровня"))
		.ЗапуститьПриложение();
	
	// Когда
	ВерхнеУровневыйЖелудь = Поделка.НайтиЖелудь("ВерхнеУровневыйЖелудь");

	// Тогда
	Ожидаем.Что(
		ВерхнеУровневыйЖелудь.ВнедряемыйЖелудьНижнегоУровня(),
		"Желудь внедрился в поле"
	).Не_().Равно(Неопределено);

	Ожидаем.Что(
		ВерхнеУровневыйЖелудь.ВнедряемыйЖелудьНижнегоУровняЧерезСеттер(),
		"Желудь внедрился через сеттер"
	).Не_().Равно(Неопределено);

	Ожидаем.Что(
		ВерхнеУровневыйЖелудь.ВнедряемыйЖелудьНижнегоУровняЧерезСеттерСоСтраннымИменем(),
		"Желудь внедрился через сеттер со странным именем"
	).Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура ПостКонстрактОтрабатывает() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("ВерхнеУровневыйЖелудь"))
		.ДобавитьЖелудь(Тип("ЖелудьНижнегоУровня"))
		.ЗапуститьПриложение();
	
	// Когда
	ВерхнеУровневыйЖелудь = Поделка.НайтиЖелудь("ВерхнеУровневыйЖелудь");

	// Тогда
	Ожидаем.Что(ВерхнеУровневыйЖелудь.ПеременнаяВИнит(), "Переменная в инит проинициализировалась").Равно(1);
КонецПроцедуры

&Тест
Процедура СканированиеКаталогаРегистрируетНужныеЖелуди() Экспорт
	// Дано
	Поделка = Новый Поделка();

	// Когда
	Каталог = ОбъединитьПути(ТекущийКаталог(), "tests", "Классы");
	Поделка
		.ПросканироватьКаталог(Каталог)
		.ЗапуститьПриложение();

	Желудь = Поделка.НайтиЖелудь("ВерхнеУровневыйЖелудь");

	// Тогда
	Ожидаем.Что(Желудь).Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура КомпанейскиеЖелудиРеИнициализируются() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("КомпанейскийЖелудь"))
		.ЗапуститьПриложение();
	
	// Когда
	Желудь1 = Поделка.НайтиЖелудь("КомпанейскийЖелудь");
	Желудь2 = Поделка.НайтиЖелудь("КомпанейскийЖелудь");

	// Тогда
	Ожидаем.Что(Желудь1, "Разные инстансы желудей").Не_().Равно(Желудь2);
КонецПроцедуры

&Тест
Процедура ЖелудьРегистрируетсяПодИменемИзАннотации() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("Желудь1"))
		.ЗапуститьПриложение();

	// Когда
	Желудь = Поделка.НайтиЖелудь("ТестовыйЖелудь");
	
	// Тогда
	Ожидаем.Что(Желудь, "Не удалось получить желудь по имени из аннотации").Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура ДваЖелудяСОднимИменемКонфликтуют() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка.ДобавитьЖелудь(Тип("Желудь1"));

	// Когда-Тогда
	ПараметрыМетода = Новый Массив();
	ПараметрыМетода.Добавить(Тип("Желудь2"));
	Ожидаем
		.Что(Поделка)
		.Метод("ДобавитьЖелудь", ПараметрыМетода)
		.ВыбрасываетИсключение("Определение желудя с именем ""ТестовыйЖелудь"" уже существует")
	;
	
КонецПроцедуры

&Тест
Процедура ВерховныйЖелудьМожетПереопределитьОбычный() Экспорт
	
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("Желудь1"))
		.ДобавитьЖелудь(Тип("ВерховныйТестовыйЖелудь"))
		.ЗапуститьПриложение();

	// Когда
	Желудь = Поделка.НайтиЖелудь("ТестовыйЖелудь");
	
	// Тогда
	Ожидаем.Что(Желудь, "Верховный желудь не переопределил обычный").ИмеетТип("ВерховныйТестовыйЖелудь");
	
КонецПроцедуры

Процедура ОбычныйЖелудьНеМожетПереопределитьВерховный() Экспорт
	
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("ВерховныйТестовыйЖелудь"))
		.ДобавитьЖелудь(Тип("Желудь1"))
		.ЗапуститьПриложение();

	// Когда
	Желудь = Поделка.НайтиЖелудь("ТестовыйЖелудь");
	
	// Тогда
	Ожидаем.Что(Желудь, "Верховный желудь переопределился обычным").ИмеетТип("ВерховныйТестовыйЖелудь");
	
КонецПроцедуры

&Тест
Процедура ДвухВерховныхЖелудейБытьНеМожет() Экспорт

	// Дано
	Поделка = Новый Поделка();
	Поделка.ДобавитьЖелудь(Тип("ВерховныйТестовыйЖелудь"));

	// Когда-Тогда
	ПараметрыМетода = Новый Массив();
	ПараметрыМетода.Добавить(Тип("ВторойВерховныйТестовыйЖелудь"));
	Ожидаем
		.Что(Поделка)
		.Метод("ДобавитьЖелудь", ПараметрыМетода)
		.ВыбрасываетИсключение("Определение верховного желудя с именем ""ТестовыйЖелудь"" уже существует")
	;
КонецПроцедуры

&Тест
Процедура ЖелудьМожноПолучитьПоПрозвищу() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("Желудь1"))
		.ЗапуститьПриложение();

	// Когда
	Желудь = Поделка.НайтиЖелудь("Кругляш");
	
	// Тогда
	Ожидаем.Что(Желудь, "Не удалось получить желудь по прозвищу").Не_().Равно(Неопределено);
	
КонецПроцедуры

&Тест
Процедура УЖелудяМожетБытьНесколькоПрозвищ() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("Желудь1"))
		.ЗапуститьПриложение();

	// Когда
	Желудь1 = Поделка.НайтиЖелудь("Кругляш");
	Желудь2 = Поделка.НайтиЖелудь("Мелкий");
	
	// Тогда
	Ожидаем.Что(Желудь1, "Не удалось получить желудь по прозвищу Кругляш").Не_().Равно(Неопределено);
	Ожидаем.Что(Желудь2, "Не удалось получить желудь по прозвищу Мелкий").Не_().Равно(Неопределено);

	Ожидаем.Что(Желудь1, "По разным прозвищам вернулись разные желуди").Равно(Желудь2);
	
КонецПроцедуры


&Тест
Процедура МассивЖелудейМожноВнедритьЧерезПластилин() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("ВерхнеУровневыйЖелудь"))
		.ДобавитьЖелудь(Тип("ЖелудьНижнегоУровня"))
		.ДобавитьЖелудь(Тип("Желудь1"))
		.ДобавитьЖелудь(Тип("Желудь3"))
		.ЗапуститьПриложение();

	// Когда
	Желудь = Поделка.НайтиЖелудь("ВерхнеУровневыйЖелудь");
	Желуди = Желудь.ВнедряемыеЖелудиПоПрозвищу;

	// Тогда
	Ожидаем
		.Что(Желуди, "Не удалось внедрить желуди по прозвищу")
		.ИмеетТип("ФиксированныйМассив")
		.ИмеетДлину(2);
	
	Ожидаем
		.Что(Желуди.Найти(Поделка.НайтиЖелудь("ТестовыйЖелудь")), "Не удалось найти тестовый желудь")
		.Не_().Равно(Неопределено);
	Ожидаем
		.Что(Желуди.Найти(Поделка.НайтиЖелудь("Желудь3")), "Не удалось найти Желудь3")
		.Не_().Равно(Неопределено);
КонецПроцедуры

&Тест
Процедура ДваЖелудяСОднимПрозвищемНельзяПолучитьКакОдинЖелудь() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("Желудь1"))
		.ДобавитьЖелудь(Тип("Желудь3"))
		.ЗапуститьПриложение();

	// Когда-Тогда
	ПараметрыМетода = Новый Массив();
	ПараметрыМетода.Добавить("Кругляш");
	Ожидаем
		.Что(Поделка)
		.Метод("НайтиЖелудь", ПараметрыМетода)
		.ВыбрасываетИсключение("Найдено несколько желудей с именем/прозвищем ""Кругляш""")
	;
	
КонецПроцедуры

&Тест
Процедура ДваЖелудяСОднимПрозвищемМожноПолучитьКакМассив() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("Желудь1"))
		.ДобавитьЖелудь(Тип("Желудь3"))
		.ЗапуститьПриложение();

	// Когда
	Желуди = Поделка.НайтиЖелуди("Кругляш");

	// Тогда
	Ожидаем
		.Что(Желуди, "Не удалось получить список желудей по прозвищу")
		.ИмеетДлину(2)
	;

	Ожидаем
		.Что(Желуди.Найти(Поделка.НайтиЖелудь("ТестовыйЖелудь")), "Не удалось найти тестовый желудь")
		.Не_().Равно(Неопределено);
	Ожидаем
		.Что(Желуди.Найти(Поделка.НайтиЖелудь("Желудь3")), "Не удалось найти Желудь3")
		.Не_().Равно(Неопределено);
	
КонецПроцедуры

&Тест
Процедура ЖелудьНаполняетсяДетальками() Экспорт
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьЖелудь(Тип("ЖелудьНижнегоУровня"))
		.ДобавитьЖелудь(Тип("ЖелудьСНастройками"))
		.ЗапуститьПриложение();

	// Когда
	Желудь = Поделка.НайтиЖелудь("ЖелудьСНастройками");
	
	// Тогда
	Ожидаем.Что(Желудь.ПростаяНастройка, "Простая настройка не прочиталась").Равно("Значение простой настройки");
	Ожидаем.Что(Желудь.ХитраяНастройка, "Хитрая настройка не прочиталась").Равно("Значение очень хитрой настройки");
	Ожидаем.Что(Желудь.ЧисловаяНастройка, "В настройку не подставилось значение по умолчанию").Равно(123);
	Ожидаем.Что(Желудь.ЧисловаяНастройка(), "Конструктор не принял настройку").Равно(123);
	Ожидаем.Что(Желудь.ЖелудьНижнегоУровня(), "Конструктор не принял пластилин").ИмеетТип("ЖелудьНижнегоУровня");
	Ожидаем.Что(Желудь.ЖелудьНижнегоУровняЧерезСеттер(), "Сеттер не принял пластилин").ИмеетТип("ЖелудьНижнегоУровня");
	Ожидаем.Что(Желудь.ЖелудьНижнегоУровняЧерезСеттерПоУмолчанию(), "Сеттер по умолчанию не принял пластилин").ИмеетТип("ЖелудьНижнегоУровня");
	
КонецПроцедуры

&Тест
Процедура НапильникПолучаетЖелудьЧерезКонструктор() Экспорт
	
	// Дано
	Поделка = Новый Поделка();
	Поделка
		.ДобавитьНапильник(Тип("НапильникСЖелудемВКонструкторе"))
		.ДобавитьЖелудь(Тип("ЖелудьНижнегоУровня"))
		.ЗапуститьПриложение();

	// Когда
	Желудь = Поделка.НайтиЖелудь("ЖелудьНижнегоУровня");
	Напильник = Поделка.НайтиЖелудь("НапильникСЖелудемВКонструкторе");
	ЖелудьИзНапильника = Напильник.ПолучитьЖелудьНижнегоУровня();
	
	// Тогда
	Ожидаем.Что(ЖелудьИзНапильника, "Желудь в напильнике не пустой").Не_().Равно(Неопределено);
	Ожидаем.Что(ЖелудьИзНапильника, "Желудь в напильнике корректный").Равно(Желудь);
		
КонецПроцедуры

НапильникПолучаетЖелудьЧерезКонструктор();