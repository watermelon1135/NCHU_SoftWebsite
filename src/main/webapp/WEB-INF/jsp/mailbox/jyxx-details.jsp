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
    <link rel="stylesheet" type="text/css" href="/css/Administration.css"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/star-rating.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/star-rating.js"></script>
    <style>
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
            width: 85%;
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
    </style>
    <script language="JavaScript">
        function jupm(temp) {
            //$("#iframe_a").attr("src",temp.attr("href"));
            //alert(temp);
            window.location = '${pageContext.request.contextPath}' + temp;
        }
        function ret() {
            history.back(-1);
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

        <div class="col-md-10" style="margin-top: 30px;padding: 0px 50px 0px 30px;">
            <div class="panel panel-default" style="margin: 30px 50px 0px 20px;width: 95%">
                <div class="panel-heading" style="height: 90px;">
                    <div class="date">
                        <a class="day" style="text-decoration: none;"><fmt:formatDate value="${mailboxAsk.askTime}"
                                                                                      pattern="dd"/></a>
                        <a class="month">${func:changeMonth(mailboxAsk.askTime)}</a>
                    </div>
                    <div class="title">
                        <h2>${mailboxAsk.title}</h2>
                        <ul class="meta">
                            <li><a><i class="glyphicon glyphicon-user">&nbsp;${mailboxAsk.askName}</i></a></li>
                            <%--li><a href="#"><i class="glyphicon glyphicon-tasks">&nbsp;教务处</i></a></li>--%>
                            <li><a><i class="glyphicon glyphicon-send">&nbsp;<span>${mailboxAsk.mailbox}</span></i></a>
                            </li>
                            <li><a><i
                                    class="glyphicon glyphicon-phone">&nbsp;<span>${mailboxAsk.phone}</span></i></a>
                            </li>
                            <li><a><i class="glyphicon glyphicon-heart">&nbsp;答复时间：<span><fmt:formatDate
                                    value="${mailboxReply.replyTime}" pattern="yyyy-MM-dd"/></span></i></a></li>
                            <li><a><i class="glyphicon glyphicon-check">&nbsp;阅读次数：${mailboxAsk.readCount}</i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="panel-body" >
                    <p>${mailboxAsk.context}</p>
                    <c:if test="${not empty mailboxAsk.askAppendix}"><p style="text-align: right"><a
                            href="/downloadAppendix?appendix=${mailboxAsk.askAppendix}">
                        <i class="glyphicon glyphicon-paperclip">${askFile}</i></a></p></c:if>
                </div>
            </div>

            <div class="answer">
                <div class="panel panel-default" style="margin: 30px 50px 0px 20px;width:95%">
                    <div class="panel-heading" style="height: 46px; background-color: #055FA5;">
                        <span style="color: #FFFFFF;line-height: 30px;font-size: 20px;font-weight: bold;">回复:</span>
                    </div>
                    <div class="panel-body">
                        <p>${mailboxReply.context}</p>
                        <c:if test="${not empty mailboxReply.replyAppendix}"><p style="text-align: right"><a
                                href="/downloadAppendix?appendix=${mailboxReply.replyAppendix}">
                            <i class="glyphicon glyphicon-paperclip">${replyFile}</i></a></p></c:if>

                    </div>
                </div>
                <div style="margin-left:30px">
                    <c:if test="${not empty mailboxReply.satisfied}">
                        <div>
                            评价：
                            <c:forEach begin="1" end="${mailboxReply.satisfied}">
                                <i><img src="/img/jyxx/start_index.png"></i>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </div>
            <div style="width:4%;margin:26px 0px 0px 450px">
                <input type="button" value="返&nbsp;&nbsp;回" onclick="ret()" class="btn"
                       style="color:#ffffff ;background-color:#055fa5">
            </div>
        </div>
    </div>
</div>
</body>
</html>