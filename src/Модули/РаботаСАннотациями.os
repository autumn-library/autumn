#native

#Использовать fluent

Функция ПолучитьАннотацию(Свойство, ИмяАннотации) Экспорт
	Аннотация = ОтфильтроватьПервуюАннотациюПоИмени(Свойство.Аннотации, ИмяАннотации);
	Возврат Аннотация;
КонецФункции

Функция НайтиАннотацию(Аннотации, ИмяАннотации) Экспорт
	Возврат ОтфильтроватьПервуюАннотациюПоИмени(Аннотации, ИмяАннотации);
КонецФункции

Функция ПолучитьАннотации(Свойство, ИмяАннотации) Экспорт
	Аннотации = ОтфильтроватьАннотацииПоИмени(Свойство.Аннотации, ИмяАннотации);
	Возврат Аннотации;
КонецФункции

Функция НайтиАннотации(Аннотации, ИмяАннотации) Экспорт
	Возврат ОтфильтроватьАннотацииПоИмени(Аннотации, ИмяАннотации);
КонецФункции

Функция НайтиМетодыСАннотацией(Методы, ИмяАннотации) Экспорт

	Результат = Новый Массив();

	Для Каждого Метод Из Методы Цикл

		Если Метод.Аннотации = Неопределено Тогда
			Продолжить;
		КонецЕсли;

		Для Каждого Аннотация Из Метод.Аннотации Цикл
			
			Если НРег(Аннотация.Имя) = Нрег(ИмяАннотации) Тогда
				Результат.Добавить(Метод);
			КонецЕсли;

		КонецЦикла;

	КонецЦикла;

	Возврат Результат;
	
КонецФункции

Функция ОтфильтроватьАннотацииПоИмени(Аннотации, ИмяАннотации)
	Массив = Новый Массив();
	Для каждого Элемент Из Аннотации Цикл
		Если ВРег(Элемент.Имя) = ВРег(ИмяАннотации) Тогда
			Массив.Добавить(Элемент);
		КонецЕсли;
	КонецЦикла;
	Возврат Массив; 
КонецФункции

Функция ОтфильтроватьПервуюАннотациюПоИмени(Аннотации, ИмяАннотации)
	Для каждого Элемент Из Аннотации Цикл
		Если ВРег(Элемент.Имя) = ВРег(ИмяАннотации) Тогда
			Возврат Элемент;
		КонецЕсли;
	КонецЦикла;
	Возврат Неопределено; 
КонецФункции

Функция ПолучитьЗначенияПараметраАннотации(Аннотация, ИмяПараметра) Экспорт

	ПараметрыАннотации = ПолучитьПараметрыАннотации(Аннотация, ИмяПараметра);
	МассивПараметров = Новый Массив();

	Если ПараметрыАннотации.Количество() > 0 Тогда	
		Для каждого ТекПараметр Из ПараметрыАннотации Цикл
			МассивПараметров.Добавить(ТекПараметр.Значение);
		КонецЦикла;
	КонецЕсли;

	Возврат МассивПараметров;
КонецФункции

Функция ПолучитьЗначениеПараметраАннотации(
	Аннотация, 
	ИмяПараметра = "Значение", 
	ЗначениеПоУмолчанию = Неопределено,
	НеопределеноЭтоКорректноеЗначениеПараметра = Ложь
) Экспорт

	ИмяПараметраПоУмолчанию = "Значение";

	Если Аннотация = Неопределено ИЛИ Аннотация.Параметры = Неопределено ИЛИ Аннотация.Параметры.Количество() = 0 Тогда
		Возврат ЗначениеПоУмолчанию;
	КонецЕсли;

	ПараметрАннотации = ПолучитьПараметрАннотации(Аннотация, ИмяПараметра);

	Если ПараметрАннотации <> Неопределено Тогда
		Возврат ПараметрАннотации.Значение;
	КонецЕсли;

	ЭтоПараметрПоУмолчанию = ИмяПараметра = ИмяПараметраПоУмолчанию;
	АннотацияСодержитБольшеОдногоПараметра = Аннотация.Параметры.Количество() > 1;
	ЗначениеПараметраПередано = ЗначениеПоУмолчанию <> Неопределено ИЛИ НеопределеноЭтоКорректноеЗначениеПараметра;
	Если ЭтоПараметрПоУмолчанию И АннотацияСодержитБольшеОдногоПараметра И НЕ ЗначениеПараметраПередано Тогда
		Сообщение = СтрШаблон(
			"Аннотация %1 содержит несколько параметров, среди которых нет явного указания имени параметра ""%2""",
			Аннотация.Имя,
			ИмяПараметраПоУмолчанию
		);
		ВызватьИсключение Сообщение;
	ИначеЕсли ЭтоПараметрПоУмолчанию И Аннотация.Параметры[0].Имя = Неопределено Тогда
		Возврат Аннотация.Параметры[0].Значение;
	ИначеЕсли ЗначениеПоУмолчанию <> Неопределено ИЛИ НеопределеноЭтоКорректноеЗначениеПараметра Тогда
		Возврат ЗначениеПоУмолчанию;
	Иначе
		Сообщение = СтрШаблон("Не найден параметр аннотации %1", ИмяПараметра);
		ВызватьИсключение Сообщение; 
	КонецЕсли;

КонецФункции

Процедура УстановитьЗначениеПараметраАннотации(Аннотация, ИмяПараметра, ЗначениеПараметра) Экспорт
	Параметр = Аннотация.Параметры.Найти(ИмяПараметра, "Имя");
	Если Параметр = Неопределено Тогда
		Параметр = Аннотация.Параметры.Добавить();
		Параметр.Имя = ИмяПараметра;
	КонецЕсли;
	Параметр.Значение = ЗначениеПараметра;
КонецПроцедуры

Функция ПолучитьПараметрАннотации(Аннотация, ИмяПараметра) Экспорт
	Для каждого Элемент Из Аннотация.Параметры Цикл
		ИмяЭлемента = Элемент.Имя;
		Если ИмяЭлемента = Неопределено Тогда
			ИмяЭлемента = "Значение";
		КонецЕсли;
		Если ВРег(ИмяЭлемента) = ВРег(ИмяПараметра) Тогда
			Возврат Элемент;
		КонецЕсли;
	КонецЦикла;
	Возврат Неопределено;
КонецФункции

Функция ПолучитьПараметрыАннотации(Аннотация, ИмяПараметра) Экспорт
	
	Результат = Новый Массив;

	Для каждого Элемент Из Аннотация.Параметры Цикл
		ИмяЭлемента = Элемент.Имя;
		Если ИмяЭлемента = Неопределено Тогда
			ИмяЭлемента = "Значение";
		КонецЕсли;
		Если ВРег(ИмяЭлемента) = ВРег(ИмяПараметра) Тогда
			Результат.Добавить(Элемент);
		КонецЕсли;
	КонецЦикла;

	Возврат Результат;

КонецФункции