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
        function ret() {
            history.back(-1);
        }
    </script>
</head>
<body>
<div class="main" style="height:600px">
    <div class="panel panel-default" style="margin: 30px 50px 0px 20px">
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
                            class="glyphicon glyphicon-phone">&nbsp;<span>${mailboxAsk.phone}</span></i></a></li>
                    <li><a><i class="glyphicon glyphicon-heart">&nbsp;答复时间：<span><fmt:formatDate
                            value="${mailboxReply.replyTime}" pattern="yyyy-MM-dd"/></span></i></a></li>
                    <li><a><i class="glyphicon glyphicon-check">&nbsp;阅读次数：${mailboxAsk.readCount}</i></a></li>
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

    <div class="answer">
        <div class="panel panel-default" style="margin: 30px 50px 0px 20px">
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
        <input type="button" value="返&nbsp;&nbsp;回" onclick="ret()" class="btn" style="color:#ffffff ;background-color:#055fa5">
    </div>
</div>
</body>
</html>