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
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
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
            <tbody>

            </tbody>
        </table>
    </div>
    <%--   分页按钮 --%>
    <div class="table-responsive">
        <table class="row">
            <tr>
                <td colspan="3" align="center">
                    当前/页，总页，总条记录  
                    <a href="#">首页</a>
                    <a href="#">上一页</a>
                    <a href="#">下一页</a>
                    <a href="#">末页</a>
                </td>
            </tr>
        </table>
    </div>
</div>

<script type="text/javascript">
    //1.页面加载完成后，直接去发送ajax请求嘛，要到分页数据。
    $(function () {
        $.ajax({
            url:"/thesis/selectThesis",
            data: "name=test",
            type: "POST",
            success:function (result) {
               // 解析员工数据
                build_thesis_table(result);
                // console.log(result);
            }
        });
    });

    function build_thesis_table(result) {
        var thesises = result.extend(thesis.pageData);
        $.each(thesises, function (name, currentPage, item) {
            alert(item.title);
        })
    }
</script>
</body>
</html>
