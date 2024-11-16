// Добавляет к желудю дополнительный идентификатор, по которому его можно в последствии доставать из Поделки.
// Желудь может иметь несколько прозвищ. Одно и то же прозвище может использоваться для нескольких желудей.
//
// Может быть использовано, например, для группировки желудей и получении их в виде массива.
//
// Параметры:
//   Значение - Строка - Задаваемое прозвище.
//
// Пример:
//
// &Прозвище("ПодписчикНаСобытие")
// &Прозвище("ПользовательскийЖелудь")
// &Желудь("МойЖелудь")
// Процедура ПриСозданииОбъекта()
// КонецПроцедуры
//
&Аннотация("Прозвище")
Процедура ПриСозданииОбъекта(Значение)

КонецПроцедуры
