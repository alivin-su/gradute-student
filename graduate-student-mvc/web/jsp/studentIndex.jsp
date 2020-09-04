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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/web/static/css/studentIndex.css" type="text/css" rel="stylesheet">
</head>

<body>


<div class="container">
    <%--  标题  --%>
    <div class="row">
        <div class="col-md-12"><h1>studentIndex</h1></div>
    </div>
    <%--    顶部按钮--%>
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <a class="btn btn-default" href="#" role="button">添加</a>
            <a class="btn btn-default" href="#" role="button">批量删除</a>
        </div>
    </div>
    <%--   表格 --%>
    <div class="row">
        <table class="table table-hover" id="studentTable">
            <thead>
            <tr>
                <th></th>
                <th>论文题目</th>
                <th>发表刊物</th>
                <th>作者</th>
                <th>发表年份</th>
                <th>是否通过审核</th>
                <th>操作</th>
            </tr>
            </thead>
            <c:forEach items="${thesis.pageData}" var="thesis">
                <tbody>
                <tr>
                    <td>${thesis.id}</td>
                    <td>${thesis.title}</td>
                    <td>${thesis.type}</td>
                    <td>${thesis.author}</td>
                    <td>${thesis.year}</td>
                    <td>${thesis.check}</td>
                    <td>
                        <button type="button" class="btn btn-info btn-sm"><a
                                href="/thesis/updateThesis?thesisID=${thesis.id}">修改</a>
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-info btn-sm"><a
                                href="/thesis/deleteThesis?thesisID=${thesis.id}">删除</a>
                        </button>
                    </td>
                </tr>
                </tbody>
            </c:forEach>

        </table>
    </div>
    <%--   分页按钮 --%>
    <div class="table-responsive">
        <table class="row">
            <tr>
                <td colspan="3" align="center">
                    当前${thesis.currentPage }/${thesis.totalPage }页，总${thesis.totalPage}页，总${thesis.totalCount}条记录  
                    <a href="/thesis/selectThesis?currentPage=1&name=${thesis.student.name}">首页</a>
                    <a href="/thesis/selectThesis?currentPage=${thesis.currentPage-1}&name=${thesis.student.name}">上一页</a>
                    <a href="/thesis/selectThesis?currentPage=${thesis.currentPage+1}&name=${thesis.student.name}">下一页</a>
                    <a href="/thesis/selectThesis?currentPage=${thesis.totalPage}&name=${thesis.student.name}">末页</a>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
