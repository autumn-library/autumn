// BSLLS:MissingVariablesDescription-off
// BSLLS:ExportVariables-off
Перем ХранимаяБлестяшка;
Перем ЕщеХранимаяБлестяшка;

Перем Настройка Экспорт;
Перем ЖелудьИзПластилина Экспорт;

&Желудь
Процедура ПриСозданииОбъекта(&Пластилин ЖелудьНижнегоУровня, 
							&Блестяшка Число1, 
							&Блестяшка Число2, 
							&Деталька(ЗначениеПоУмолчанию = 123) ЧисловаяНастройка
							)
	ХранимаяБлестяшка = Число1;
	ЕщеХранимаяБлестяшка = Число2;
	Настройка = ЧисловаяНастройка;
	ЖелудьИзПластилина = ЖелудьНижнегоУровня;
КонецПроцедуры

Функция ПолучитьХранимуюБлестяшку() Экспорт
	Возврат ХранимаяБлестяшка;
КонецФункции

Функция ПолучитьВторуюХранимуюБлестяшку() Экспорт
	Возврат ЕщеХранимаяБлестяшка;
КонецФункции