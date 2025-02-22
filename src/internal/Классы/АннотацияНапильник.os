#Использовать asserts
#Использовать collectionos

Перем _ПрименяетсяТолькоНа;

// Проверить, может ли текущий напильник применяться на указанном желуде.
//
// Параметры:
//   ОпределениеЖелудя - ОпределениеЖелудя - Определение желудя, для которого проверяется
//                                           применимость текущего напильника.
//
//  Возвращаемое значение:
//   Булево - Истина, если напильник может применяться на указанном желуде, иначе Ложь.
//
Функция МожетПрименятьсяНа(ОпределениеЖелудя) Экспорт
	
	НапильникМожетПрименяться = Ложь;
	
	Если _ПрименяетсяТолькоНа.Количество() = 0 Тогда
		НапильникМожетПрименяться = Истина;
	Иначе
	
		Для Каждого Идентификатор Из ОпределениеЖелудя.Прозвища() Цикл
			Если _ПрименяетсяТолькоНа.Содержит(Идентификатор) Тогда
				НапильникМожетПрименяться = Истина;
				Прервать;
			КонецЕсли;
		КонецЦикла;
		
	КонецЕсли;

	Возврат НапильникМожетПрименяться;

КонецФункции

// Специальный тип желудя для дополнительной обработки других желудей в процессе их создания.
//
// Может использоваться для добавления дополнительных действий или свойств создаваемым желудям. Метод `ОбработатьЖелудь`
// **может** возвращать другой объект, который подменит текущий желудь, или обертку-декоратор над текущим желудем.
//
// Каждый `&Напильник` дополнительно имеет `&Прозвище("Напильник")`.
//
// Напильник сам по себе является желудем, однако в силу своей специфики он может запрашивать прилепление только
// &Деталек и Поделки.
//
// Желудь, помеченный аннотацией `&Напильник`, должен реализовать следующий интерфейс:
// * `Функция ОбработатьЖелудь(Желудь, ОпределениеЖелудя) Экспорт`
//
// Размещается над конструктором класса.
//
// Параметры:
//   Значение - Строка - Имя желудя, под которым напильник добавляется в контекст Поделки.
//   ПрименяетсяТолькоНа - Строка - Повторяемый параметр. Ограничивает применение напильника только на желудях
//                                  с указанными именами.
//
// Пример:
// &Напильник
// Процедура ПриСозданииОбъекта()
// КонецПроцедуры
//
&Аннотация("Напильник")
&Прозвище("Напильник")
Процедура ПриСозданииОбъекта(Значение = "", &Повторяемый ПрименяетсяТолькоНа = Неопределено)
	
	_ПрименяетсяТолькоНа = Новый МножествоСоответствие();
	Для Каждого МестоПрименения Из ПрименяетсяТолькоНа Цикл
		Ожидаем.Что(МестоПрименения, "Ограничение применения напильника должно быть задано строкой").ИмеетТип("Строка");
		
		_ПрименяетсяТолькоНа.Добавить(МестоПрименения);
	КонецЦикла;

КонецПроцедуры
