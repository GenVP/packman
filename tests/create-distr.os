#Использовать asserts
#Использовать "../src"

Функция ПолучитьСписокТестов(Тестирование) Экспорт
    
    Список = Новый Массив;
    Список.Добавить("Тест_ДолженПроверитьЧтоВерсияПолученаИзХранилища");
    Список.Добавить("Тест_ДолженПроверитьЧтоПараметрыКомСтрокиПолученияВерсииРазобраны");
    
    Возврат Список;
    
КонецФункции

Процедура Тест_ДолженПроверитьЧтоПараметрыКомСтрокиПолученияВерсииРазобраны() Экспорт
    
    ПараметрыКомСтроки = Новый Соответствие;
    ПараметрыКомСтроки["АдресХранилища"] = "/some/path/storage";
    ПараметрыКомСтроки["КаталогСборки"] = "/some/path/buildRoot";
    ПараметрыКомСтроки["ВерсияКонфигурации"] = "1.0.4.1";
    ПараметрыКомСтроки["-storage-user"] = "Администратор";
    ПараметрыКомСтроки["-storage-pwd"]  = "123";
    ПараметрыКомСтроки["-storage-v"]    = "4";
    ПараметрыКомСтроки["-cfu-basedir"]  = "/some/path/basedir";
    ПараметрыКомСтроки["-update-from"]  = "1.0.2.1, 1.0.3.7";
    
    Команда = Новый КомандаСоздатьФайлыПоставки;
    
    Параметры = Команда.РазобратьПараметры(ПараметрыКомСтроки);
    
    Ожидаем.Что(Параметры.АдресХранилища).Равно("/some/path/storage");
    Ожидаем.Что(Параметры.КаталогСборки).Равно("/some/path/buildRoot");
    Ожидаем.Что(Параметры.ВерсияКонфигурации).Равно("1.0.4.1");
    Ожидаем.Что(Параметры.ПользовательХранилища).Равно("Администратор");
    Ожидаем.Что(Параметры.ПарольХранилища).Равно("123");
    Ожидаем.Что(Параметры.ВерсияХранилища).Равно("4");
    Ожидаем.Что(Параметры.КаталогВерсий).Равно("/some/path/basedir");
    Ожидаем.Что(Параметры.ПредыдущиеВерсии).ИмеетТип("Массив");
    Ожидаем.Что(Параметры.ПредыдущиеВерсии[0]).Равно("1.0.2.1");
    Ожидаем.Что(Параметры.ПредыдущиеВерсии[1]).Равно("1.0.3.7");
    
КонецПроцедуры
    