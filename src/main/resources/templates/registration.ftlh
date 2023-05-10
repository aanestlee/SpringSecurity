<!DOCTYPE html>
<html>
<head>
    <title>Регистрация</title>
    <style>
        body {
            background-image: url("https://kartinkin.net/uploads/posts/2021-07/1626252641_31-kartinkin-com-p-fioletovii-fon-odnotonnii-nezhnii-krasivo-33.png"); /* Фоновый цвет и фоновый рисунок*/
            color: #6A5ACD; /*Цвет текста на странице*/
            background-attachment: fixed; /* Фон страницы фиксируется */
            background-repeat: repeat-x; /* Изображение повторяется по горизонтали */
        }
    </style>
</head>
<body>

<h4>Регистрация</h4>
<form action="/registration" method="post">
    Имя пользователя: <input type="text" name="name"><br><br>
    Эл. почта: <input type="email" name="email"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вход"/>
</form>

</body>
</html>