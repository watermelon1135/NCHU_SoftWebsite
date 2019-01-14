<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/func.tld" prefix="func" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jyxx.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body style="height:600px">
<ul  class="nav nav-tabs" style="margin: 20px 50px">
    <li><a href="/mailbox/1/1">未读邮件</a></li>
    <li><a href="/mailbox/1/2">公开邮件</a></li>
    <li><a href="/mailbox/1/3">私密邮件</a></li>
</ul>
<div class="tab-content">
    <c:if test="${empty mailboxAskHeads}">
        <p style="color: red">暂时还没有任何信息！</p>
    </c:if>
    <c:if test="${not empty mailboxAskHeads}">
        <c:forEach items="${mailboxAskHeads}" var="mailboxAskHead">
            <div class="panel panel-default" style="margin-top: 30px;margin-left: 50px; margin-right: 50px;">
                <div class="panel-heading" style="height: 90px;">
                    <div class="date">
                        <a href="/mailbox/mail/${mailboxAskHead.flag}/${mailboxAskHead.mailboxAskId}"
                           class="day"
                           style="text-decoration: none;">
                            <fmt:formatDate value="${mailboxAskHead.askTime}" pattern="dd"/></a>
                        <a href="/mailbox/mail/${mailboxAskHead.flag}/${mailboxAskHead.mailboxAskId}"
                           class="month"> ${func:changeMonth(mailboxAskHead.askTime)}</a>
                    </div>
                    <div class="title">
                        <h2>${mailboxAskHead.title}</h2>
                        <ul class="meta">
                            <li><a href="#"><i
                                    class="glyphicon glyphicon-user">&nbsp;${mailboxAskHead.askName}</i></a>
                            </li>
                                <%--<li><a href="#"><i class="glyphicon glyphicon-tasks">&nbsp;教务处</i></a></li>--%>
                            <c:if test="${!(mailboxAskHead.flag eq 1)}">
                                <li><a href="#"><i
                                        class="glyphicon glyphicon-check">&nbsp;阅读次数：${mailboxAskHead.readCount}</i></a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="panel-body">
                    <c:if test="${fn:length(mailboxAskHead.context)>100 }">
                        <p>${fn:substring(mailboxAskHead.context, 0, 100)}...</p>
                    </c:if>
                    <c:if test="${fn:length(mailboxAskHead.context)<=100 }">
                        <p>${mailboxAskHead.context }</p>
                    </c:if>
                    <div class="detail"
                         style="float: right; background-color: #293782; margin-right: 30px; width: 7%;height: 30px;">
                        <a href="/mailbox/mail/${mailboxAskHead.flag}/${mailboxAskHead.mailboxAskId}"
                           style="width: 100%;height: 30px;color: #FFFFFF;text-decoration: none;margin: 4px 0px 0px 10px;display: block;">查看详情</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
<div class="pa" style="width:100%;text-align:center">
    <ul class="pagination">
        <li>
            <a href=" <c:if test="${pages.pageNum!=1}">/mailbox/${mailboxAskHeads[0].mailboxType}/${mailboxAskHeads[0].flag}?pagenum=${pages.pageNum-1}</c:if>">
                &laquo;</a></li>
        <c:if test="${pages.pageNum>5}">
        <li>
            <a href="/mailbox/${mailboxAskHeads[0].mailboxType}/${mailboxAskHeads[0].flag}?pagenum=${pages.pageNum-5}">...</a>
        <li>
            </c:if>
            <c:forEach var="i" begin="${pagesBegin}" end="${pagesEnd}">
        <li class="<c:if test="${i==pages.pageNum}">active</c:if> "><a
                href="/mailbox/${mailboxAskHeads[0].mailboxType}/${mailboxAskHeads[0].flag}?pagenum=${i}">${i}</a>
        </li>
        </c:forEach>
        <c:if test="${pages.pageNumAll>pagesEnd}">
        <li>
            <a href="/mailbox/${mailboxAskHeads[0].mailboxType}/${mailboxAskHeads[0].flag}?pagenum=${pages.pageNum+5}">...</a>
        <li>
            </c:if>
        <li>
            <a href=" <c:if test="${pages.pageNum!=pages.pageNumAll}">/mailbox/${mailboxAskHeads[0].mailboxType}/${mailboxAskHeads[0].flag}?pagenum=${pages.pageNum+1}</c:if>">&raquo;</a>
        </li>
</div>
</body>
</html>