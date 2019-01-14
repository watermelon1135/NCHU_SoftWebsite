<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: 范孝发
  Date: 2019/1/5
  Time: 23:43
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
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="../../js/homepage.js"></script>


</head>
<body>
<jsp:include page="/WEB-INF/jsp/indexTop.jsp"/>
<div class="row-fluid">
    <div class="main">
        <div class="container" style="background-color: #F8F8F8;">
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
                <div class="nr-content">
                    <%--<fmt:formatDate value="${pagecontext.uploadTime}" pattern="MM月dd日" />--%>
                    ${pagecontext.context}
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
<jsp:include page="/WEB-INF/jsp/indexBottom.jsp"/>
</body>
</html>
