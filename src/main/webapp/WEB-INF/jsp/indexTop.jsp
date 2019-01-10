<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 范孝发
  Date: 2019/1/6
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8"/>
    <!--<meta name="viewport" content="width=device-width,initial-scale=1.0"/>-->
    <title>南昌航空大学软件学院</title>
    <link rel="stylesheet" type="text/css" href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/index.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/home_page.css"/>
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="../../js/homepage.js"></script>
</head>
<body>
<!--
作者：2515873961@qq.com
时间：2018-12-23
描述：头部开始
-->
<div class="row-fluid">
    <div class="top">
        <div class="container">Hi，欢迎访问软件学院！</div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-5"
             style="display: inline-block; padding-top: 40px; width: 28.6%; height: 130px;float: left;"><img
                class="form-inline" src="/img/home_page_slices/software.png"/></div>
        <div class="col-xs-4" style="display: inline-block; padding-top: 20px; width: 46%; height: 130px;float: left;">
            <img class="form-inline" src="../../img/home_page_slices/yuanxun.gif"/></div>
        <div class="col-xs-3" style="display: inline-block; padding-top: 70px; height: 130px;">
            <div class="row">
                <form class="navbar-form navbar-left" action="" method="post"
                      style="display: inline-block;margin-left: 40px;">
                    <input type="text" value="" placeholder="输入关键字" class="form-control input-lg"/>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--
    作者：2515873961@qq.com
    时间：2018-12-23
    描述：头部结束
-->
<!--
    作者：2515873961@qq.com
    时间：2018-12-23
    描述：导航开始，aside导航
-->
<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div>
            <ul class="nav navbar-nav">
                <c:forEach items="${menus}" var="menu">
                    <li class="dropdown"><a href="/${menu.firstMenu.firstMenuUrl}.html" onclick=""><span>${menu.firstMenu.firstMenuName}</span></a>
                        <c:if test="${not empty menu.list}">
                            <ul class="dropdown-menu">
                                <c:forEach items="${menu.list}" var="twoMenu">
                                    <li><a href="/${twoMenu.secondMenuUrl}.html">${twoMenu.secondMenuName}</a></li>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>
<script type="text/javascript">
    function jump(name) {
        var jump = name.href.toString();
        //alert(jump)
        if (jump.lastIndexOf("/index") == -1)
            return false;
        return true;
    }
</script>


<!--
    作者：2515873961@qq.com
    时间：2018-12-23
    描述：导航结束
-->
</body>
</html>
