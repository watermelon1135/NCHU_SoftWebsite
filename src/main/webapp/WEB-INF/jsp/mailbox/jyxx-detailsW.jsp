<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/func.tld" prefix="func" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信箱回复</title>
    <link rel="stylesheet" type="text/css" href="/css/Administration.css"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        .date {
            width: 8%;
            height: 64px;
            float: left;
        }

        .day {
            display: block;
            color: #161517;
            font-size: 20px;
            text-align: center;
            width: 100%;
            height: 30px;
            background-color: #EDEDED;
        }

        .month {
            display: block;
            text-decoration: none;
            color: #FFFFFF;
            font-size: 20px;
            text-align: center;
            width: 100%;
            height: 30px;
            background-color: #293782;
        }

        .month:hover {
            text-decoration: none;
            color: #FFFFFF;
            background-color: #293782;
        }

        .title {
            float: left;
            width: 60%;
            height: 64px;
            margin-left: 20px;
        }

        .title h2 {
            margin: 0px;
            height: 32px;
        }

        .panel {
            width: 68%;
        }

        .title ul {
            width: 100%;
            margin-top: 20px;
            padding-left: 0px;
            height: 20px;
            list-style: none;
        }

        .title ul li {
            float: left;
            margin-right: 30px;
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
        function ret() {
            history.back(-1);
        }

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
<div class="row-fluid">
    <div class="container-fluid">
        <div class="logo"><img src="/img/main/software.png"/></div>
        <div class="exit">
            <span>欢迎访问后台！</span>
            <div class="exit-btn">
                <a href="/logout">退出登录</a>
                <a href="/index">回到主页</a>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <div class="administ">
                <img src="/img/main/guanliyuan.png"/>
                <div class="name">
                    <span style="font-size: 24px;font-weight: bold; margin-left: 4px;">管理员</span><br/>
                    <span style="font-size: 20px;font-weight: normal;">&nbsp;&nbsp;${administrator.name}</span>
                </div>
            </div>
            <ul id="main-nav" class="nav nav-stacked">
                <c:forEach items="${adminMenus}" var="menu">
                    <li>
                        <a href="#${menu.firstMenu.firstMenuId}" data-toggle="collapse" class="nav-header">
                                ${menu.firstMenu.firstMenuName}
                            <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                        </a>
                        <c:if test="${not empty menu.list}">
                            <ul id="${menu.firstMenu.firstMenuId}" class="nav nav-list collapse secondmenu"
                                style="height: 0px;">
                                <c:forEach items="${menu.list}" var="twoMenu">
                                    <li><a href="/admin/${twoMenu.secondMenuUrl}" target="_self"
                                           onclick="jupm()">${twoMenu.secondMenuName}</a></li>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </li>
                </c:forEach>
                <li>
                    <a href="#999" data-toggle="collapse" class="nav-header">
                        学院信箱
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="999" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <c:forEach items="${typeList}" var="type">
                            <li><a href="/mailbox/${type.mailboxtypeid}/1" target="_self"
                                   onclick="jupm()">${type.mailboxtypename}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li>
                    <a href="/admin/recycleList" data-toggle="collapse" onclick="jupm('/admin/recycleList')"
                       class="nav-header">
                        回收站
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="col-md-10" style="margin-top: 0px;padding: 0px 50px 0px 30px;">
            <div class="panel panel-default" style="margin: 30px 50px 0px 20px;width: 95%">
                <div class="panel-heading" style="height: 90px;">
                    <div class="date">
                        <a href="" class="day" style="text-decoration: none;"><fmt:formatDate
                                value="${mailboxAsk.askTime}"
                                pattern="dd"/></a>
                        <a href="" class="month"> ${func:changeMonth(mailboxAsk.askTime)}</a>
                    </div>
                    <div class="title">
                        <h2>${mailboxAsk.title}</h2>
                        <ul class="meta">
                            <li><a><i class="glyphicon glyphicon-user">&nbsp;${mailboxAsk.askName}</i></a></li>
                            <%--<li><a href="#"><i class="glyphicon glyphicon-tasks">&nbsp;教务处</i></a></li>--%>
                            <li><a><i class="glyphicon glyphicon-send">&nbsp;<span>${mailboxAsk.mailbox}</span></i></a>
                            </li>
                            <li><a><i
                                    class="glyphicon glyphicon-phone">&nbsp;<span>${mailboxAsk.phone}</span></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="panel-body">
                    <p>${mailboxAsk.context}</p>
                    <c:if test="${not empty mailboxAsk.askAppendix}"><p style="text-align: right"><a
                            href="/downloadAppendix?appendix=${mailboxAsk.askAppendix}">
                        <i class="glyphicon glyphicon-paperclip">${askFile}</i></a></p></c:if>
                </div>
            </div>
            <form action="/mailbox/reply" method="post" enctype="multipart/form-data">
                <div class="answer">
                    <div class="panel panel-default" style="margin: 30px 50px 0px 20px;width: 95%">
                        <div class="panel-heading" style="height: 46px; background-color: #055FA5;">
                            <span style="color: #FFFFFF;line-height: 30px;font-size: 20px;font-weight: bold;">回复:</span>
                        </div>
                        <div class=" panel-body">
                            <textarea name="context" rows="10" cols="" class="form-control"></textarea>
                            <div class="form-group" style="float:left;width:100%;margin-top: 10px">
                                <select class="selectpicker form-control" name="newFlag">
                                    <option value="1" <c:if test="${mailboxAsk.flag == 1}">${"selected"}</c:if>>请选择
                                    </option>
                                    <option value="2" <c:if test="${mailboxAsk.flag == 2}">${"selected"}</c:if>>公开信件
                                    </option>
                                    <option value="3" <c:if test="${mailboxAsk.flag == 3}">${"selected"}</c:if>>私密信件
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" style="float:left">
                                <a class="file">选择文件
                                    <input type="file" onchange="chan()" name="replyAppendix" id="upfile">
                                </a>
                                <span class="fileerrorTip1"></span>
                                <span class="showFileName1"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width:100%;margin:10px 0px 0px 420px">
                    <input type="hidden" value="${mailboxAsk.flag}" name="oldFlag">
                    <input type="hidden" value="${mailboxAsk.mailboxAskId}" name="mailboxAskId">
                    <input type="hidden" value="${mailboxAsk.mailboxType}" name="mailboxType">
                    <input type="submit" value="提&nbsp;&nbsp;交" class="btn"
                           style="color:#ffffff ;background-color:#055fa5;float:left">
                    <input type="button" value="返&nbsp;&nbsp;回" onclick="ret()" class="btn"
                           style="color:#ffffff ;background-color:#055fa5;float:left;margin-left:50px;margin-bottom: 30px;">

                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>