#Использовать annotations
#Использовать logos

&Пластилин
Перем Поделка;

&Пластилин(Значение = "Рогатка", Тип = "ТаблицаЗначений")
Перем Рогатки;

&Деталька(Значение = "core.ЗапускатьРогатки", ЗначениеПоУмолчанию = Истина)
Перем ЗапускатьРогатки;

Перем Лог;

Процедура ЗапуститьПриложение() Экспорт
	
	Если НЕ ЗапускатьРогатки Тогда
		Лог.Информация("Запуск рогаток отключен.");
		Возврат;
	КонецЕсли;

	КоличествоРогаток = Рогатки.Количество();
	Если КоличествоРогаток = 0 Тогда
		Лог.Отладка("Список рогаток пуст.");
		Возврат;
	КонецЕсли;

	ОпределениеАннотацииРогатка = Поделка.ПолучитьОпределенияАннотаций().Получить("рогатка");

	Лог.Отладка("Запускаю %1 рогаток.", КоличествоРогаток); 

	ЗапущенныеРогатки = Новый Массив;

	Для Каждого ДанныеРогатки Из Рогатки Цикл
		ОпределениеРогатки = ДанныеРогатки.ОпределениеЖелудя;
		Лог.Отладка("Запускаю рогатку %1", ОпределениеРогатки.Имя());

		Конструктор = ОпределениеРогатки.Завязь().ДанныеМетода();
		АннотацияРогатка = РаботаСАннотациями.ПолучитьАннотацию(Конструктор, "Рогатка");
		ОбъектАннотации = ОпределениеАннотацииРогатка.СоздатьОбъектАннотации(АннотацияРогатка);
		ЗапускатьВФоне = ОбъектАннотации.ЗапускатьВФоне();
		ОжидатьЗавершения = ОбъектАннотации.ОжидатьЗавершения();
		
		Рогатка = ДанныеРогатки.Желудь;

		Если ЗапускатьВФоне Тогда
			ДлительнаяЗадача = Истина;
			ФоновоеЗадание = ФоновыеЗадания.Выполнить(Рогатка, "ПриЗапускеПриложения", , ДлительнаяЗадача);

			Если ОжидатьЗавершения Тогда
				ЗапущенныеРогатки.Добавить(ФоновоеЗадание);
			КонецЕсли;
		Иначе
			Рогатка.ПриЗапускеПриложения();
		КонецЕсли;
	КонецЦикла;

	Если ЗапущенныеРогатки.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Пока ЗапущенныеРогатки.Количество() > 0 Цикл
		ИндексЗадания = ФоновыеЗадания.ОжидатьЛюбое(ЗапущенныеРогатки);
		ФоновоеЗадание = ЗапущенныеРогатки[ИндексЗадания];

		Если ФоновоеЗадание.Состояние = СостояниеФоновогоЗадания.ЗавершеноАварийно Тогда
			Лог.Ошибка(
				"Ошибка запуска рогатки %1%2%3",
				Строка(ФоновоеЗадание.Объект),
				Символы.ПС,
				ПодробноеПредставлениеОшибки(ФоновоеЗадание.ИнформацияОбОшибке)
			);
		КонецЕсли;

		ЗапущенныеРогатки.Удалить(ИндексЗадания);
	КонецЦикла;

	Лог.Отладка("Запуск приложения завершен");

КонецПроцедуры

&Желудь
Процедура ПриСозданииОбъекта()
	
	Лог = Логирование.ПолучитьЛог("oscript.lib.autumn.ЗапускательПриложения");

КонецПроцедуры
