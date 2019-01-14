<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 范孝发
  Date: 2019/1/5
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <!--<meta name="viewport" content="width=device-width,initial-scale=1.0"/>-->
    <link rel="stylesheet" type="text/css" href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/second-level.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/home_page.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/xyxw.css"/>
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="../../js/homepage.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/indexTop.jsp"/>
<div class="row-fluid">
    <div class="main">
        <div class="container" style="background-color: #F8F8F8; padding-bottom: 50px;">
            <div class="list-left">
                <div class="catlog-selected"><span style="line-height: 55px;height: 55px;">
                    ${firstMenu}</span></div>
                <ul class="catlog">
                    <c:forEach items="${twoMenus}" var="twoMenu">
                        <li><a href="/${twoMenu.secondMenuUrl}.html" title="${twoMenu.secondMenuName}">${twoMenu.secondMenuName}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="nr-right">
                <div class="nr-top">
                    <span>${two.secondMenuName}</span>
                </div>
                <div class="c-events">
                    <ul>
                        <c:forEach items="${pagecontexts}" var="page" varStatus="index">
                        <li><a href="/item/${page.pageContextId}" target="_blank" title="${page.title}"> ${page.title}</a>
                            <% Date date = new Date();pageContext.setAttribute("nowDate",date); %>
                                 <c:if test="${(nowDate.time-page.uploadTime.time)<3600000*24*showNewDate}"><img src="../../img/qipao.png"/></c:if><span><fmt:formatDate value="${page.uploadTime}" pattern="MM-dd" /></span></li>
                        </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="pa">
                    <ul class="pagination">
                        <li><a href=" <c:if test="${pages.pageNum!=1}">/${two.secondMenuUrl}?pagenum=${pages.pageNum-1}</c:if>"> &laquo;</a></li>
                        <c:if test="${pages.pageNum>5}">
                        <li><a href="/${two.secondMenuUrl}?pagenum=${pages.pageNum-5}">...</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${pagesBegin}" end="${pagesEnd}">
                        <li class="<c:if test="${i==pages.pageNum}">active</c:if> "><a href="/${two.secondMenuUrl}?pagenum=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${pages.pageNumAll>pagesEnd}">
                        <li><a href="/${two.secondMenuUrl}?pagenum=${pages.pageNum+5}">...</a></li>
                        </c:if>
                        <li><a href=" <c:if test="${pages.pageNum!=pages.pageNumAll}">/${two.secondMenuUrl}?pagenum=${pages.pageNum+1}</c:if>">&raquo;</a></li>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/jsp/indexBottom.jsp"/>
</body>
</html>
