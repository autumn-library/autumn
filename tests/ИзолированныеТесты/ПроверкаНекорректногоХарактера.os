#Использовать asserts
#Использовать "../../src"
#Использовать "../ОшибочныеКлассы/ЖелудьСНекорректнымХарактером"

&Тест
Процедура ПроверкаНекорректногоХарактера() Экспорт

	БылаОшибка = Ложь;

	Попытка
		Поделка = Новый Поделка(); // BSLLS:UnusedLocalVariable-off
	Исключение
		БылаОшибка = Истина;
		Ожидаем.Что(ИнформацияОбОшибке().Описание).Содержит("Неизвестный характер желудя");
	КонецПопытки;

	Ожидаем.Что(БылаОшибка).ЭтоИстина();

КонецПроцедуры
