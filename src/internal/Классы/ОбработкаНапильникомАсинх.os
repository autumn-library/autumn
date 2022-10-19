#Использовать decorator

Функция ОбработатьЖелудь(Желудь, ОпределениеЖелудя) Экспорт
	
	Методы = ОпределениеЖелудя.НайтиМетодыСАннотациями("Асинх");

	Если Методы.Количество() = 0 Тогда
		Возврат Желудь;
	КонецЕсли;

	ПостроительДекоратора = Новый ПостроительДекоратора(Желудь);

	Параметр_ИмяМетода = Новый ПараметрМетода("НапильникАсинх_ИмяМетода");
	Параметр_ПараметрыМетода = Новый ПараметрМетода("НапильникАсинх_ПараметрыМетода");
	
	ТелоСлужебногоМетода = 
	"НапильникАсинх_Результат = Декоратор_Рефлектор.ВызватьМетод(
	|	Декоратор_ИсходныйОбъект,
	|	НапильникАсинх_ИмяМетода,
	|	НапильникАсинх_ПараметрыМетода
	|);
	|
	|ОбработкаДекоратора.СинхронизироватьПоля(Декоратор_ИсходныйОбъект, ЭтотОбъект);
	|
	|Возврат НапильникАсинх_Результат;
	|";

	СлужебыйМетод = Новый Метод("НапильникАсинх_Служебный")
		.Публичный()
		.Параметр(Параметр_ИмяМетода)
		.Параметр(Параметр_ПараметрыМетода)
		.ТелоМетода(ТелоСлужебногоМетода);
	
	ПостроительДекоратора.Метод(СлужебыйМетод);

	ШаблонТелаПерехватчика = 
	"НапильникАсинх_ПараметрыМетода = Новый Массив;
	|НапильникАсинх_ПараметрыМетода.Добавить(""%1"");
	|
	|НапильникАсинх_ЗначенияПараметровМетода = Новый Массив;
	|%2
	|
	|НапильникАсинх_ПараметрыМетода.Добавить(НапильникАсинх_ЗначенияПараметровМетода);
	|
	|ФоновоеЗадание = ФоновыеЗадания.Выполнить(ЭтотОбъект, ""НапильникАсинх_Служебный"", НапильникАсинх_ПараметрыМетода);
	|
	|Возврат ФоновоеЗадание;
	|";

	ШаблонПараметрМетода = "НапильникАсинх_ЗначенияПараметровМетода.Добавить(%1);";

	Для Каждого Метод Из Методы Цикл
		
		ПараметрыМетода = Новый Массив;
		Для Каждого Параметр Из Метод.Параметры Цикл
			ПараметрыМетода.Добавить(СтрШаблон(ШаблонПараметрМетода, Параметр.Имя));
		КонецЦикла;

		Перехватчик = Новый Перехватчик(Метод.Имя)
			.ТипПерехватчика(ТипыПерехватчиковМетода.Перед)
			.Тело(СтрШаблон(ШаблонТелаПерехватчика, Метод.Имя, СтрСоединить(ПараметрыМетода, Символы.ПС)));

		ПостроительДекоратора.Перехватчик(Перехватчик);

	КонецЦикла;
	
	Возврат ПостроительДекоратора.Построить();

КонецФункции

&Напильник
Процедура ПриСозданииОбъекта()

КонецПроцедуры
