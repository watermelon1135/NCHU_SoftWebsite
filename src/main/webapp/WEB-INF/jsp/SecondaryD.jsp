<%--
  Created by IntelliJ IDEA.
  User: zhouxuwen
  Date: 2019/1/7
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <!--<meta name="viewport" content="width=device-width,initial-scale=1.0"/>-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/second-level.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home_page.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/homepage.js"></script>
    <script type="text/javascript">
        $(function () {
            var strs = window.location.toString();
            strs = strs.split("/");
            strs=strs[strs.length-1];
            //alert(strs);
            $(".catlog li").eq(parseInt(strs)-1).addClass("twoMenus").siblings().removeClass("twoMenus");
        })
    </script>
    <style type="text/css">
        .twoMenus{
            background-color: #ddffff;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/indexTop.jsp"/>
<div class="row-fluid">
    <div class="main">
        <div class="container" style="background-color: #F8F8F8;">

            <div>
                <span style="font-size: 30px;margin-left:30%;font-family: 宋体;"><b>${pagecontext.title}</b></span>
                <hr>
                    <div style="margin-left:30%;">
                        作者: ${pagecontext.author}&nbsp;&nbsp;来源: ${pagecontext.source}&nbsp;&nbsp;
                        发布时间: <fmt:formatDate value="${pagecontext.uploadTime}" pattern="yyyy年MM月dd日"/>&nbsp;&nbsp;
                        点击数: ${pagecontext.count}&nbsp;
                    </div>

                <hr>
           </div>
            <div>
                ${pagecontext.context}
            </div>
        </div>
    </div>
</div>
<%--<jsp:include page="/WEB-INF/jsp/indexBottom.jsp"/>--%>
</body>
</html>

