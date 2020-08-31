<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sudi
  Date: 2020/8/30
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<h1>studentIndex</h1>

    <table>
        <thead>
        <tr>
            <th>论文题目</th>
            <th>发表刊物</th>
            <th>作者</th>
            <th>发表年份</th>
            <th>是否通过审核</th>
            <th colspan="2">操作</th>
        </tr>
        </thead>
        <c:forEach items="${thesis}" var="thesis">
        <tbody>
        <tr>
            <td>${thesis.id}</td>
            <td>${thesis.title}</td>
            <td>${thesis.type}</td>
            <td>${thesis.author}</td>
            <td>${thesis.year}</td>
            <td>${thesis.check}</td>
            <td onclick="location.href ='/' ">修改</td>
            <td>删除</td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
</body>
</html>
