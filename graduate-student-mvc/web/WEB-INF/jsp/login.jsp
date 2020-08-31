<%--
  Created by IntelliJ IDEA.
  User: sudi
  Date: 2020/8/30
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
欢迎登陆
<form method="post" action="/loginController/isExist">
    账号:<label for="name"></label><input type="text" id="name" name="name">
    密码：<label for="password"></label><input type="password" id="password" name="password">
    <input type="submit" value="登录"> <a href="#" type="button">注册</a>
</form>
</body>
</html>
