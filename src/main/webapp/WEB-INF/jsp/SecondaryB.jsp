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
    <link rel="stylesheet" type="text/css" href="../../css/second-level.css"/>/>
    <link rel="stylesheet" type="text/css" href="../../css/home_page.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/xyxw.css"/>
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="../../js/homepage.js"></script>
</head>
<body>
<div class="row-fluid">
    <div class="main">
        <div class="container" style="background-color: #F8F8F8; padding-bottom: 50px;">
            <div class="list-left">
                <div class="catlog-selected"><span style="line-height: 55px;height: 55px;">${firstMenu}</span></div>
                <ul class="catlog">
                <c:forEach items="twoMenus" var="twoMenu">
                    <li><a href="${twoMenu.secondMenuUrl}" title="${twoMenu.secondMenuName}">${twoMenu.secondMenuName}</a></li>
                    <li><a href="#l" title="学院大事记">学院大事记</a></li>
                    <li><a href="" title="学院领导">学院领导</a></li>
                    <li><a href="#" title="组织结构">组织结构</a></li>
                    <li><a href="#" title="学院新闻">学院新闻</a></li>
                    <li><a href="" title="学院公告">学院公告</a></li>
                    <li style="border-bottom: none;"><a href="" title="文件下载">文件下载</a></li>
                </c:forEach>
                </ul>
            </div>
            <div class="nr-right">
                <div class="nr-top">
                    <span>${two.secondMenuName}</span>
                </div>
                <div class="c-events">
                    <ul>
                        <c:forEach items="heads" var="head">
                        <li><a href="${head.url}" target="_blank" title=" ${head.title}"> ${head.title}</a><img
                                src="../../img/qipao.png"/><span>${head.uploadTime}</span></li>

                        <li><a href="${head.url}" target="_blank" title=" ${head.title}"> ${head.title}</a><span>${head.uploadTime}</span>
                        </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="pa">
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li class="active"><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
