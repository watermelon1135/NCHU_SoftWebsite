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
    <title>院长信箱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home_page.css">
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
            width: 89%;
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
</head>
<body>
<jsp:include page="jyxxTop.jsp"></jsp:include>
<div class="container">
    <div class="col-md-9" style="margin-top: 30px;padding: 0px 50px 0px 0px;height: ${askmailboxlist.size()*220}px;">
        <div class="nr-content">
            <div class="container" style="float:left; height: 600px;">
                <c:forEach items="${askmailboxlist}" var="item">
                    <div class="panel panel-default" style="margin-top: 30px; margin-right: 50px;">
                        <div class="panel-heading" style="height: 90px;">
                            <div class="date">
                                <a href="/showdetail?mailboxaskid=${item.mailboxAskId}" class="day"
                                   style="text-decoration: none;"><fmt:formatDate value="${item.askTime}"
                                                                                  pattern="dd"/></a>
                                <a href="/showdetail?mailboxaskid=${item.mailboxAskId}"
                                   class="month">${func:changeMonth(item.askTime)}</a>
                            </div>
                            <div class="title">
                                <h2>${item.title}</h2>
                                <ul class="meta">
                                    <li><a href="/showdetail?mailboxaskid=${item.mailboxAskId}"><i
                                            class="glyphicon glyphicon-user">&nbsp;${item.askName}</i></a></li>
                                    <li><a href="/showdetail?mailboxaskid=${item.mailboxAskId}"><i
                                            class="glyphicon glyphicon-tasks">&nbsp;${item.mailboxTypeName}</i></a></li>
                                    <li><a href="/showdetail?mailboxaskid=${item.mailboxAskId}"><i
                                            class="glyphicon glyphicon-heart">&nbsp;答复<span><fmt:formatDate
                                            value="${item.replyTime}" pattern="yyyy-MM-dd"/></span></i></a></li>
                                    <li><a href="/showdetail?mailboxaskid=${item.mailboxAskId}"><i
                                            class="glyphicon glyphicon-check">&nbsp;阅读次数:${item.readCount}</i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:if test="${fn:length(item.context)>100 }">
                                <p>${fn:substring(item.context, 0, 100)}...</p>
                            </c:if>
                            <c:if test="${fn:length(item.context)<=100 }">
                                <p>${item.context }</p>
                            </c:if>
                            <div class="detail"
                                 style="float: right; background-color: #293782; margin-right: 30px; width: 10%;height: 30px;">
                                <a href="/showdetail?mailboxaskid=${item.mailboxAskId}"
                                   style="width: 100%;height: 30px;color: #FFFFFF;text-decoration: none;margin: 6px 0px 0px 7px;display: block;">查看详情>></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <div class="col-md-3">
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
<div class="pa" style="width:100%;text-align:center">
    <ul class="pagination">
        <li><a href=" <c:if test="${pages.pageNum!=1}">${pageUrl}?pagenum=${pages.pageNum-1}</c:if>"> &laquo;</a></li>
        <c:if test="${pages.pageNum>5}">
        <li><a href="${pageUrl}?pagenum=${pages.pageNum-5}">...</a></li>
        </c:if>
        <c:forEach var="i" begin="${pagesBegin}" end="${pagesEnd}">
        <li class="<c:if test="${i==pages.pageNum}">active</c:if> "><a
                href="${pageUrl}?pagenum=${i}&queryCode=${keyword}">${i}</a></li>
        </c:forEach>
        <c:if test="${pages.pageNumAll>pagesEnd}">
        <li><a href="${pageUrl}?pagenum=${pages.pageNum+5}&queryCode=${keyword}">...</a>
        <li>
            </c:if>
        <li>
            <a href=" <c:if test="${pages.pageNum!=pages.pageNumAll}">/${pageUrl}?pagenum=${pages.pageNum+1}&queryCode=${keyword}</c:if>">&raquo;</a>
        </li>

</div>
<jsp:include page="../indexBottom.jsp"></jsp:include>

<script type="text/javascript">
    function query() {
        var keyword = document.getElementById("keyword");
        //alert(keyword.value)
        window.location.href = "/search?queryCode=" + keyword.value;
    }
</script>
</body>
</html>