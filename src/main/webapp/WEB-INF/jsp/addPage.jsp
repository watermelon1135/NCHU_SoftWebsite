
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>添加新闻</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/fileinput.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/fileinput.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/zh.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.parse.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="UTF-8" src ="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" charset="UTF-8" src ="${pageContext.request.contextPath}/js/messages_zh.js"></script>

<script>
    $("#reset").click(function() {
        validator.resetForm();
    });

    $.validator.setDefaults({
        submitHandler:function () {
            if(!UE.getEditor('context').hasContents()) {
                alert("内容为空！");
            }
            else {
                alert("提交成功！");
                //               $("#page").submit();
                form.submit();
            }

        }
    });
    $().ready(function () {
        $("#page").validate({
            rules:{
                secondMenuId:"required",
                title:"required",
                editor:{
                    required : true,
                    verifyReq : true
                }
            }
        });
        $.validator.addMethod("verifyReq",
            function(value, element) {
                if(!UE.getEditor('context').hasContents()) {
                    return false;
                }
            },
            "<span class='m_error'>请输入文本内容!</span>");
        $("#doReset").click(function() {
            if (confirm("确认要重置吗?")){
                editor.setContent("");
                $("#page")[0].reset();
            }
            return false;
        });
        $("#doReturn").click(function () {
            history.back(-1);
        });

    })




    function secondMenu(id) {
        //获取下拉框主键
        //var classifyId=$("#classifys").find('option:selected').val();
        var url="${pageContext.request.contextPath}/findSecondMenuList/"+id;
        $("#secondMenuId").empty();     //清空二级目录
        var classNext=$("#secondMenuId");
//        classNext.append("<option value="+0+">"+"二级菜单"+"</option>");
        $.ajax({
            type: "post",
            contentType:"application/json",
            url : url,
            success: function (data) {
                console.log(data);
//                var data = eval('(' + data + ')');
                if(data.length!="" && data.length!=null){
                    for ( var i = 0; i < data.length; i++) {
                        classNext.append("<option value="+data[i].secondMenuId+">"+data[i].secondMenuName +"</option>");
                    }
                }else{
                    classNext.append("<option  value=\"\">---无---</option>");
                }
            },
            error:function (data) {
                console.log(data);
            }
        });
    }


</script>
<style type="text/css">
    .form-group{
        margin: 20px;
        width: 80%;
    }
    .form-control{
       width:50%;
        display: inline;
    }
    .error label{

        display: inline;
        cursor: pointer;
        float: left;
        width: 65px;
        margin: 8px 20px;
        text-align: right;
        vertical-align: middle;
    }
    input{
        font-size: inherit;
        display: inline;
        vertical-align: middle;
        line-height: -moz-block-height;
    }
    .file-input{
        margin-left: 175px;
        width:100%
    }
    .a,.c,.b{
        background-color: #055FA5;
        color: #FFFFFF;
        margin-right: 10px;
    }
    .b:hover{
        background-color: #055FA5;
        color: #FFFFFF;
    }
    .a:hover{
        background-color: #055FA5;
        color: #FFFFFF;
    }
    .c:hover{
        background-color: #055FA5;
        color: #FFFFFF;
    }
    .error{
        color:red;

    }

</style>
<body>
<div class="container" style="margin-left: 30%; height: 100%;">
    <form method="post" action="/admin/saveContent" accept-charset="UTF-8" id="page">
        <div class="form-group" style="float: left;">
            <label for="orign">文章类别:</label>
            <select  name="firstMenu" onchange="secondMenu(this.value)"  class="selectpicker show-tick form-control"  style="width: 130px;display: inline">
                <option style="display: none" value="">请选择</option>
                <c:forEach items="${firsts}" var="first">
                    <option value="${first.firstMenuId}">${first.firstMenuName}</option>
                </c:forEach>
            </select>
            <select name="secondMenuId" id="secondMenuId" style="width: 130px;display: inline" class="selectpicker show-tick form-control" >
                <option style="display:none;" value="">请选择</option>
            </select>
        </div>
        <div class="form-group">
            <label for="title">公告标题:</label>
            <input type="text" class="form-control" name="title" id="title"placeholder="请输入标题" />
        </div>
        <div class="form-group">
            <label for="keyword">发&nbsp;&nbsp;布&nbsp;人:</label>
            <input type="text" class="form-control" name="author" id="keyword"placeholder="请输入发布人" />
        </div>
        <div class="form-group">
            <label >来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源:</label>
            <select class="selectpicker show-tick form-control" style="width: 130px" name="source">
                <option value="教务处">教务处</option>
                <option value="学工处">学工处</option>
                <option value="后勤处">后勤处</option>
            </select>
        </div>

        <b style="margin-left: 43px">文章内容:</b>
        <div class="context" id="context" name="context" ></div>


        <script type="text/javascript" charset="utf-8" name="editor">
            var editor = UE.getEditor('context',{initialFrameWidth:1000,initialFrameHeight:600});

        </script>
        <br>
        <br>
        <div class="form-group">
            <div class="btn" style="margin-left: 250px;">
                <input type="hidden" name="cur_page" value="">
                <button type="submit" class="btn btn-default b">保存</button>
                <button type="reset" id="doReset" class="btn btn-default c">重置</button>
                <button type="button" id="doReturn" class="btn btn-default c">返回</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
