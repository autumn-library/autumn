#Использовать asserts
#Использовать "../../src"
#Использовать "../ОшибочныеКлассы/АннотацияСПовторяемымиПараметрами"

&Тест
Процедура ПовторениеНеповторяемыхПараметровКидаетИсключение() Экспорт

	БылаОшибка = Ложь;

	Попытка
		Поделка = Новый Поделка(); // BSLLS:UnusedLocalVariable-off
	Исключение
		БылаОшибка = Истина;
		Ожидаем.Что(ИнформацияОбОшибке().Описание).Содержит("но параметр не помечен аннотацией ""Повторяемый""");
	КонецПопытки;

	Ожидаем.Что(БылаОшибка).ЭтоИстина();

КонецПроцедуры
