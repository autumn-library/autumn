Перем Значения;

Функция Инициализация() Экспорт
	Возврат "Инициализация";
КонецФункции

Функция ПостИнициализация() Экспорт
	Возврат "ПостИнициализация";
КонецФункции

Функция Выполнение() Экспорт
	Возврат "Выполнение";
КонецФункции

Функция Значения() Экспорт
	Возврат Значения;
КонецФункции

Значения = Новый Массив;
	
Значения.Добавить(Инициализация());
Значения.Добавить(ПостИнициализация());
Значения.Добавить(Выполнение());

Значения = Новый ФиксированныйМассив(Значения);
