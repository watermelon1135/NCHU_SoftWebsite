<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/1/8
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <style>
        .file {
            position: relative;
            display: inline-block;
            background: #055fa5;
            border: 1px solid #055fa5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #ffffff;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .file:hover {
            background: #055fa5;
            border-color: #055fa5;
            color: #ffffff;
            text-decoration: none;
        }
    </style>
    <script language="JavaScript">
        function ret() {
            history.back(-1);
        }

        function chan(id,fileerrorTip,showFileName) {
            var filePath = $("#"+id).val();
            if (filePath != "") {
                $("."+fileerrorTip).html("").hide();
                var arr = filePath.split('\\');
                var fileName = arr[arr.length - 1];
                $("."+showFileName).html(fileName);
            } else {
                $("."+showFileName).html("");
                $("."+fileerrorTip1).html("您未上传文件，或者您上传文件类型有误！").show();
                return false
            }
        }
    </script>
</head>
<body>
<form method="POST"  enctype="multipart/form-data"  action="/student">
    <h3>上传学生信息</h3>
    <a class="file">选择文件
        <input type="file" onchange="chan('upfile2','fileerrorTip2','showFileName2')" name="upfile2" id="upfile2">
    </a>
    <span class="fileerrorTip2"></span>
    <span class="showFileName2"></span>
    <br>
    <input type="submit" value="上传学生信息" class="btn btn-primary">
</form>
<br>
<form method="POST"  enctype="multipart/form-data" action="/course">

    <h3>上传课程信息</h3>
    <a class="file">选择文件
        <input type="file" onchange="chan('upfile3','fileerrorTip3','showFileName3')" name="upfile3" id="upfile3">
    </a>
    <span class="fileerrorTip3"></span>
    <span class="showFileName3"></span>
    <br>
    <input type="submit" value="上传课程信息" class="btn btn-primary">
</form>
<br>
<form method="POST"  enctype="multipart/form-data"  action="/achievement">
    <h3>上传成绩</h3>
    <a class="file">选择文件
        <input type="file" onchange="chan('upfile1','fileerrorTip1','showFileName1')" name="upfile1" id="upfile1">
    </a>
    <span class="fileerrorTip1"></span>
    <span class="showFileName1"></span>
    <br>
    <input type="submit" value="上传成绩" class="btn btn-primary">
</form>

</body>
</html>
