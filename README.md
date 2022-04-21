# Pocket-bartender

Приветствую тебя, дружок-пирожок! Ты не ошибся, нужный тебе репозиторий не на пару этажей выше, можешь не снимать свой кожаный прикид ;)

Данное приложение под названием "Pocket bartender" - небольшой тестовый проект для отработки навыков верстки через код и обработки сетевых запросов. 

  Суть приложения - проста. При помощи AlamoFire делается запрос к https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic . Результат - 
названия популярных коктейлей. Эти названия выводятся на экран приложения в виде кликабельных облачков. Размеры каждого ряда динамически рассчитываются, 
исходя из размеров самих облачков. Пользователю предоставляется UITextField, в которое можно вводить названия интересующих коктейлей. Облачка, название 
коктейля в которых совпадает с тем, что ввел пользователь в UITextField, выделяются градиентом. При нажатии на облачко делается повторный запрос к тому же 
API по названию нажатого коктейля. По результатам запроса для пользователя отображается фотография коктейля и его рецептик. 

При разработке использовался паттерн MVC. Фреймворки, использованные в приложении - AlamoFire, UIKit, SnapKit. 

Наслаждайтесь, но не злоупотребляйте. С последним я справлюсь сам ;)
