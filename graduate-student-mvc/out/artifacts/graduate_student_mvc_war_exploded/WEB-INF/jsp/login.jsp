<%--
  Created by IntelliJ IDEA.
  User: sudi
  Date: 2020/8/30
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
欢迎登陆
<form method="post" action="/loginController/isExist">
    账号:<label for="name"></label><input type="text" id="name" name="name">
    密码：<label for="password"></label><input type="password" id="password" name="password">
    <button type="submit" class="btn btn-info"><a type="button">登录</a></button>
    <button type="button" class="btn btn-info"><a href="#" type="button">注册</a></button>
</form>
</body>
</html>
