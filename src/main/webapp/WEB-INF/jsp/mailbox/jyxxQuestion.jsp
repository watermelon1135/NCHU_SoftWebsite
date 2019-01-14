<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/func.tld" prefix="func" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/fileinput.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/fileinput.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/zh.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/zh_CN.js"></script>
    <style type="text/css">
        .btn:hover {
            background-color: #055FA5;
            color: #FFFFFF;
        }

        .form-control input[type="text"] {
            width: 60%;
        }

        .a-upload {
            padding: 4px 10px;
            height: 31px;
            line-height: 20px;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            *display: inline;
            *zoom: 1
        }

        .a-upload input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }

        .a-upload:hover {
            color: #444;
            background: #eee;
            border-color: #ccc;
            text-decoration: none
        }

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
        function chan() {
            var filePath = $("#upfile").val();
            if (filePath != "") {
                $(".fileerrorTip1").html("").hide();
                var arr = filePath.split('\\');
                var fileName = arr[arr.length - 1];
                $(".showFileName1").html(fileName);
            } else {
                $(".showFileName1").html("");
                $(".fileerrorTip1").html("您未上传文件，或者您上传文件类型有误！").show();
                return false
            }
        }
    </script>
</head>
<body>
<jsp:include page="jyxxTop.jsp"></jsp:include>
<div class="container">
    <form action="/handle" method="post" enctype="multipart/form-data">
        <div class="col-md-6" style="margin-top: 30px;padding: 0px 50px 0px 0px;width: 20%;">
            <div class="nr-content">
                <div class="container" style="margin: 50px; height: 600px;">
                    <div class="form-group" style=" width: 50%;">
                        <div style="width: 60%;float:left;">
                            <label style="float:left;line-height: 30px">类型:</label>
                            <select name="mailboxtype" class="form-control" style=" width: 50%;float: left;">
                                <option>------请选择-----</option>
                                <c:forEach items="${typeList}" var="item">
                                    <option value='${item.mailboxtypeid}'>${item.mailboxtypename}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="width: 30%;float:left;">
                            <label style="float:left;line-height: 30px">是否匿名:</label>
                            <div class="radio-inline" style=" width: 50%;float: left;margin:5px 0px 0px 12px">
                                <label>
                                    <input type="radio" name="nameFlag" id="optionsRadios1" value="option1" checked>是
                                </label>
                                <label style="margin-left: 30px;">
                                    <input type="radio" name="nameFlag" id="optionsRadios1" value="option1" checked>否
                                </label>
                            </div>
                        </div>
                    </div>
                    <br><br><br>

                    <div class="form-group">
                        <div style="width: 30%;float:left;">
                            <label style="float:left;line-height: 30px">邮箱:</label>
                            <input name="mailbox" type="email" rows="2" cols="" style=" width: 50%;float: left;"
                                   class="form-control" placeholder="请输入邮箱">
                        </div>
                        <div style="width: 30%;float:left">
                            <label style="float:left;line-height: 30px">电话:</label>
                            <input name="phone" type="number" rows="2" cols="" style=" width: 50%;float: left;"
                                   class="form-control" placeholder="请输入号码">
                        </div>
                        <input type="hidden" name="askName" value="曾溱">
                    </div>
                    <br><br>

                    <div class="form-group">
                        <label>标题:</label>
                        <input type="text" class="form-control" name="title" style=" width: 50%;" placeholder="请输入标题"/>
                    </div>
                    <div class="form-group">
                        <label>建议内容:</label>
                        <textarea name="context" rows="10" cols="" class="form-control" style=" width: 50%;"
                                  placeholder="请输入内容"></textarea>
                    </div>
                    <div class="form-group">
                        <a class="file">上传附件
                            <input type="file" onchange="chan()" name="appendix" id="upfile">
                        </a>
                        <span class="fileerrorTip1"></span>
                        <span class="showFileName1"></span>
                    </div>

                    <div class="form-group" style="width: 50%;text-align: center">
                        <button type="submit" class="btn" style="color:#ffffff ;background-color:#055fa5"
                        >提交</button>
                    </div>

                </div>

            </div>

        </div>
    </form>


    <script type="text/javascript">
        $(function () {
            $('#myfile').fileinput({
                language: 'zh',
                uploadUrl: location.pathname + 'upload/',
                showCaption: true,
                showUpload: true,
                showRemove: true,
                showClose: true,
                layoutTemplates: {
                    actionDelete: ''
                },
                browseClass: 'btn btn-primary'
            });
            $('form').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    title: {
                        message: '请输入标题',
                        validators: {
                            notEmpty: {
                                message: '标题不能为空'
                            },
                        }
                    },
                    Recommend: {
                        message: '请输入建议内容',
                        validators: {
                            notEmpty: {
                                message: '建议内容不能为空'
                            },
                        }
                    },
                    mailbox: {
                        validators: {
                            emailAddress: {
                                message: '邮箱地址格式有误'
                            }
                        }
                    },
                    phone: {
                        validators: {
                            regexp: {
                                regexp: /^1\d{10}$/,
                                message: '请输入正确的11位手机号'
                            }
                        }
                    },
                    Type: {
                        message: '请选择类型',
                        validators: {
                            notEmpty: {
                                message: '类型不能为空'
                            },
                        }
                    }
                }
            });
        });
    </script>


    <div class="col-md-3" style="float:right">
        <div class="search" style="margin-top: 30px;">
            <span style="font-size: 20px;">查询:</span>
            <div class="input-group" style="margin-top: 20px; margin-bottom: 30px;">
                <input type="text" name="" id="keyword" value="" class="form-control" onkeydown="onkeydown(event)"/>
                <span class="input-group-addon"><i class="glyphicon glyphicon-search" onclick="query()"></i></span>
            </div>
        </div>
        <div class="hotq">
            <span style="font-size: 20px;">最热提问:</span>
            <ul style="margin-top: 10px;font-size: 14px;">
                <c:forEach items="${hot}" var="item">
                    <li><a href="/showdetail?mailboxaskid=${item.mailboxAskId}">${item.title}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="jyxxBottom.jsp"></jsp:include>

</body>
</html>