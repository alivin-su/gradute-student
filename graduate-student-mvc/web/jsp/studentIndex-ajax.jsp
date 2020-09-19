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
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="studentPage"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="studentNavPage"></div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        //去首页
        to_page("test", 1);
    });

    //1.页面加载完成后，直接去发送ajax请求嘛，要到分页数据。
    function to_page(name, currentPage) {
        $.ajax({
            url: "/thesis/selectThesis",
            data: "name=" + name + "&currentPage=" + currentPage,
            type: "GET",
            success: function (result) {
                // 解析员工数据
                build_thesis_table(result);
                // console.log(result);
                //显示条
                build_thesis_page(result);
                //搭建分页条
                built_thesis_nav(result);
            }
        });
    }

    function build_thesis_table(result) {
        $("#studentTable tbody").empty();
        var thesises = result.extend.thesis.pageData;
        $.each(thesises, function (index, item) {
            var thesisid = $("<td></td>").append();
            var thesisName = $("<td></td>").append(item.title);
            var thesisType = $("<td></td>").append(item.type);
            var thesisAuthor = $("<td></td>").append(item.author);
            var thesisYear = $("<td></td>").append(item.year);
            var thesisCheck = $("<td></td>").append(item.check);
            var editBtn = $("<button></button>").addClass("btn btn-default").append($("<span></span>").append("添加"));
            var deleteBtn = $("<button></button>").addClass("btn btn-default").append($("<span></span>").append("删除"));
            $("<tr></tr>").append(thesisid)
                .append(thesisName)
                .append(thesisType)
                .append(thesisAuthor)
                .append(thesisYear)
                .append(thesisCheck)
                .append(editBtn)
                .append(deleteBtn)
                .appendTo("#studentTable tbody");
        })
    }

    function build_thesis_page(result) {
        $("#studentPage").empty();
        $("#studentPage").append("当前第" + result.extend.thesis.currentPage + "页,")
            .append("总" + result.extend.thesis.totalPage + "页")
            .append("总" + result.extend.thesis.totalCount + "条");
    }

    function built_thesis_nav(result) {
        $("#studentNavPage").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>")).append("首页"));
        var previewPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>")).append("上一页"));
        var nextPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>")).append("下一页"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>")).append("末页"));
        ul.append(firstPageLi).append(previewPageLi).append(nextPageLi).append(lastPageLi);

        firstPageLi.click(function () {
            to_page(result.extend.thesis.student.name,1);
        });

        previewPageLi.click(function () {
            to_page(result.extend.thesis.student.name,result.extend.thesis.currentPage - 1);
        });

        nextPageLi.click(function () {
            to_page(result.extend.thesis.student.name,result.extend.thesis.currentPage + 1);
        });

        lastPageLi.click(function () {
            to_page(result.extend.thesis.student.name,result.extend.thesis.totalPage);
        });

        //
        // previewPageLi.click(function () {
        //     var tar = result.extend.thesis.currentPage - 1;
        //     //如果当前页<=0，将当前页设为1
        //     // if (tar < 1)
        //     //     to_page(result.extend.thesis.student.name,1);
        //         to_page(result.extend.thesis.student.name,tar);
        // })
        //
        // previewPageLi.click(function () {
        //     var tar = result.extend.thesis.currentPage + 1;
        //     //若果当前页大于总页数，将当前页设置为最后一页
        //     // if (tar > result.extend.thesis.totalPage)
        //     //     to_page(result.extend.thesis.student.name,result.extend.thesis.totalPage);
        //         to_page(result.extend.thesis.student.name,tar);
        // })
        //
        // lastPageLi.click(function () {
        //     to_page(result.extend.thesis.student.name,result.extend.thesis.totalPage);
        // })
        //
        var navEle = $("<nav></nav>").append(ul);
        $("#studentNavPage").append(navEle);
    }
</script>
</body>
</html>
