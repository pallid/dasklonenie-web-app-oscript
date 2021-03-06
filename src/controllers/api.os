
Функция Index() Экспорт
	Возврат Содержимое(ВернутьВерсиюАПИ());
КонецФункции

Функция ВернутьВерсиюАПИ()

	Возврат ВернутьJson("version", "0.0.0.1");

КонецФункции

Функция ВернутьJson(Ключ, Значение)

	Объект = Новый Соответствие;
	Объект.Вставить(Ключ, Значение);

	СтрокаJSON = json.ЗаписатьJSON(Объект);

	Возврат СтрокаJSON;

КонецФункции	

Функция declension() Экспорт

	Падеж = "И";
	Род = "";
	Режим = "ФИО";
	ФорматнаяСтрока = "";

	// в версии 0.3 доступен метод ПараметрыЗапроса()
	// а пока - парсим сами

	СтрокаЗапроса = РаскодироватьСтроку(ЗапросHttp.СтрокаЗапроса, СпособКодированияСтроки.КодировкаURL);
	Параметры = ОбщегоНазначения.РазобратьПараметрыЗапроса(СтрокаЗапроса);

	Выражение = Параметры["s"]; //Строка
	Падеж = Параметры["c"]; //case
	Род = Параметры["g"];//gender
	Режим = Параметры["m"]; //mode
	ФорматнаяСтрока = Параметры["fs"]; //format str
	
	Результат = МенеджерСклонения.daСклонение(Выражение, Падеж, Род, Режим, ФорматнаяСтрока);
	СтрокаJSON = ВернутьJson("result", Результат);

	Ответ = Новый РезультатДействияСодержимое();
	Ответ.КодСостояния = 200;
	Ответ.ТипСодержимого = "application/json;charset=UTF-8";
	Ответ.Содержимое = СтрокаJSON;

	Возврат Ответ;

КонецФункции	
