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
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            <a type="button" class="btn btn-primary btn-lg" id="addButton">
                添加
            </a>
            <a class="btn btn-default" href="#" role="button">批量删除</a>
        </div>
    </div>
    <%--   表格 --%>
    <div class="row">
        <table class="table table-hover" id="studentTable">
            <thead>
            <tr>
                <th>UserID</th>
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

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="addModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">论文添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addModeForm">
                    <div class="form-group">
                        <label for="userThesisId" class="col-sm-2 control-label">UserID</label>
                        <div class="col-sm-5">
                            <%-- <input class="form-control" id="thesisAuthor" name="thesisAuthor">--%>
                            <input class="form-control" id="userThesisId" name="userThesisId">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="author" class="col-sm-2 control-label">作者</label>
                        <div class="col-sm-5">
                            <%--                            <input class="form-control" id="thesisAuthor" name="thesisAuthor">--%>
                            <input class="form-control" id="author" name="author">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">论文题目</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="title" name="title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="year" class="col-sm-2 control-label">当前时间</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="year" name="year">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="thesisTypeId">发表刊物</label>
                        <div class="col-sm-5">
                            <%--                            <select class="form-control" id="selectThesisType" name="thesisTypeId">--%>
                            <select class="form-control" id="thesisTypeId" name="thesisTypeId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="check">审核通过</label>
                        <div class="col-sm-5">
                            <%--                            <select class="form-control" id="access" name="check">--%>
                            <select class="form-control" id="check" name="check">
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="thesisTypeSave">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--修改员工的模态框--%>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="updateModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">论文修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateModeForm">
                    <div class="form-group">
                        <label for="userThesisId" class="col-sm-2 control-label">UserID</label>
                        <div class="col-sm-5">
                            <%-- <input class="form-control" id="thesisAuthor" name="thesisAuthor">--%>
                            <span class="form-control" id="userUpdateThesisId" name="userThesisId">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="author" class="col-sm-2 control-label">作者</label>
                        <div class="col-sm-5">
                            <%--                            <input class="form-control" id="thesisAuthor" name="thesisAuthor">--%>
                            <input class="form-control" id="authorUpdate" name="author">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">论文题目</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="titleUpdate" name="title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="year" class="col-sm-2 control-label">当前时间</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="yearUpdate" name="year">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="thesisTypeIdUpdate">发表刊物</label>
                        <div class="col-sm-5">
                            <%--                            <select class="form-control" id="selectThesisType" name="thesisTypeId">--%>
                            <select class="form-control" id="thesisTypeIdUpdate" name="thesisTypeId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="checkUpdate">审核通过</label>
                        <div class="col-sm-5">
                            <%--                            <select class="form-control" id="access" name="check">--%>
                            <select class="form-control" id="checkUpdate" name="check">
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="thesisTypeSaveUpdate">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    var userName, totalRecord;
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
            var userThesisId = $("<td></td>").append(item.userThesisId);
            var thesisName = $("<td></td>").append(item.title);
            var thesisType = $("<td></td>").append(item.thesisTypeId);
            var thesisAuthor = $("<td></td>").append(item.author);
            var thesisYear = $("<td></td>").append(item.year);
            var thesisCheck = $("<td></td>").append(item.check);
            var editBtn = $("<button></button>").addClass("btn btn-default edit_btn").append($("<span></span>").append("编辑"));
            editBtn.attr("edit-id", item.id);
            var deleteBtn = $("<button></button>").addClass("btn btn-default delete_btn").append($("<span></span>").append("删除"));
            deleteBtn.attr("del-id", item.id);
            $("<tr></tr>").append(userThesisId)
                .append(thesisName)
                .append(thesisType)
                .append(thesisAuthor)
                .append(thesisYear)
                .append(thesisCheck)
                .append(editBtn)
                .append(deleteBtn)
                .appendTo("#studentTable tbody");
            userName = result.extend.thesis.student.name;
            $("#thesisTypeSaveUpdate").attr("currentPage",  result.extend.thesis.currentPage);
        })
    }

    function build_thesis_page(result) {
        $("#studentPage").empty();
        $("#studentPage").append("当前第" + result.extend.thesis.currentPage + "页,")
            .append("总" + result.extend.thesis.totalPage + "页")
            .append("总" + result.extend.thesis.totalCount + "条");
        totalRecord = result.extend.thesis.totalCount;
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
            to_page(result.extend.thesis.student.name, 1);
        });

        previewPageLi.click(function () {
            to_page(result.extend.thesis.student.name, result.extend.thesis.currentPage - 1);
        });

        nextPageLi.click(function () {
            to_page(result.extend.thesis.student.name, result.extend.thesis.currentPage + 1);
        });

        lastPageLi.click(function () {
            to_page(result.extend.thesis.student.name, result.extend.thesis.totalPage);
        });
        var navEle = $("<nav></nav>").append(ul);
        $("#studentNavPage").append(navEle);
    }

    //点击新增按钮弹出模态框
    $("#addButton").click(function () {
        //发送ajax请求，查出发表期刊类型，显示在下拉列表中
        getThesisType("#thesisTypeId");
        //弹出模态框
        $("#addModel").modal({
            backdrop: "static"
        });
    })

    //下拉列表的ajax请求
    function getThesisType(ele) {
        $(ele).empty();
        $.ajax({
            url: "/thesis/selectThesisType",
            type: "GET",
            success: function (result) {
                $.each(result.extend.thesisType, function (index, item) {
                    var optionEle = $("<option></option>").append(item.type).attr("value", item.id);
                    optionEle.appendTo(ele);
                });
            }
        });
    }


    //点击保存
    //先进行校验，校验成功之后再发送ajax请求
    $("#thesisTypeSave").click(function () {
        // alert($("#addModeForm").serialize());
        $.ajax({
            url: "/thesis/saveThesis",
            type: "POST",
            data: $("#addModeForm").serialize(),
            dataType: "json",
            success: function () {
                $("#addModel").modal('hide');
                to_page(userName, totalRecord);
            }
        });
    });

    //修改
    $(document).on("click", ".edit_btn", function () {
        // alert($(this).attr("edit-id"));
        //查出论文类型，并显示论文类型
        getThesisType("#thesisTypeIdUpdate");
        //查出员工信息，显示员工信息
        getThesisInfo($(this).attr("edit-id"));
        //把论文id传给模态框的更新按钮
        $("#thesisTypeSaveUpdate").attr("update-id",$(this).attr("edit-id"))
        $("#updateModel").modal({
            backdrop: "static"
        })
    })

    function getThesisInfo(id) {
        $.ajax({
            url: "/thesis/getThesisInfo/" + id,
            type: "GET",
            success: function (result) {
                $("#userUpdateThesisId").text(result.extend.thesisInfo.userThesisId);
                $("#authorUpdate").val(result.extend.thesisInfo.author);
                $("#titleUpdate").val(result.extend.thesisInfo.title);
                $("#yearUpdate").addClass("disabled").val(datetime1());
                $("#thesisTypeIdUpdate").val(result.extend.thesisInfo.thesisTypeId)
                $("#checkUpdate select").val(result.extend.thesisInfo.check);
            }
        });
    }

    //删除
    $(document).on("click",".delete_btn",function () {
        deleteThesisInfo($(this).attr("del-id"));
        // alert($(this).attr("del-id"));
    })

    function deleteThesisInfo(id){
        $.ajax({
            url:"/thesis/deleteThesisInfo/"+id,
            type:"GET",
            success: function () {
                to_page(userName,1)
            }
        })
    }

    $("#thesisTypeSaveUpdate").click(function () {
        // alert($("#thesisTypeSaveUpdate").attr("update-id"));
        // alert($("#thesisTypeSaveUpdate").attr("currentPage"));
        thesisTypeSaveUpdate($("#thesisTypeSaveUpdate").attr("update-id"));
        // thesisTypeSaveUpdate();
    })


    function thesisTypeSaveUpdate(id) {
    // function thesisTypeSaveUpdate() {
    //     alert($("#updateModeForm").serialize());
        $.ajax({
            url: "/thesis/updateThesisInfo/" + id, //controller层方法还没有创建
            type: "Post",
            data: $("#updateModeForm").serialize(),
            dataType: "json",
            success: function () {
                $("#updateModel").modal('hide');
                // alert(JSON.stringify(result));
                to_page(userName,$("#thesisTypeSaveUpdate").attr("currentPage"))
            }
        })
    }


    /*-------------------- 获取系统当前时间方法start------------------------ */
    function datetime() {
        var now = new Date();
        document.getElementById("year").value = now.getFullYear() + "-"
            + (now.getMonth() + 1) + "-" + now.getDate();
        document.getElementById("year").value += " " + now.getHours() + ":"
            + now.getMinutes();
    }

    window.setInterval("datetime()", 1000);

    function datetime1() {
        var now = new Date();
        document.getElementById("yearUpdate").value = now.getFullYear() + "-"
            + (now.getMonth() + 1) + "-" + now.getDate();
        document.getElementById("yearUpdate").value += " " + now.getHours() + ":"
            + now.getMinutes();
    }

    window.setInterval("datetime1()", 1000);
    /*--------------------------- 获取系统当前时间方法end------------------------ */
</script>
</body>
</html>
