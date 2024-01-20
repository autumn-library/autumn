#Использовать reflector

Процедура ПриДобавленииОпределенияЖелудя(Знач ОпределениеЖелудя) Экспорт

	ЭтоЗаготовка = ОпределениеЖелудя.Прозвища().Найти("Заготовка") <> Неопределено;
	Если НЕ ЭтоЗаготовка Тогда
		Возврат;
	КонецЕсли;

	РефлекторОбъекта = Новый РефлекторОбъекта(ОпределениеЖелудя.ТипЖелудя());
	
	Ожидаем
		.Что(
			РефлекторОбъекта.ЕстьПроцедура("ПриИнициализацииПоделки", 1),
			"Заготовка должна иметь процедуру ПриИнициализацииПоделки(Поделка)"
		)
		.ЭтоИстина();

КонецПроцедуры

&Приемка
Процедура ПриСозданииОбъекта()
	
КонецПроцедуры