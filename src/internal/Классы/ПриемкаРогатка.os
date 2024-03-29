#Использовать reflector

Процедура ПриДобавленииОпределенияЖелудя(Знач ОпределениеЖелудя) Экспорт

	ЭтоРогатка = ОпределениеЖелудя.Прозвища().Найти("Рогатка") <> Неопределено;
	Если НЕ ЭтоРогатка Тогда
		Возврат;
	КонецЕсли;

	РефлекторОбъекта = Новый РефлекторОбъекта(ОпределениеЖелудя.ТипЖелудя());
		
	Ожидаем
		.Что(
			РефлекторОбъекта.ЕстьПроцедура("ПриЗапускеПриложения", 0),
			"Рогатка должна иметь процедуру ПриЗапускеПриложения()"
		)
		.ЭтоИстина();

КонецПроцедуры

&Приемка
Процедура ПриСозданииОбъекта()
	
КонецПроцедуры