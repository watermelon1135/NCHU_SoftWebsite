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
    <title>办事指南</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/Administration.css"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jyxx.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js">
    </script>
    <script src="/js/exportExcel.js"></script>

</head>

<style type="text/css">
    .sel {
        color: blue;
        background-color: #edf0ec;
    }
</style>

<script type="text/javascript">
    function jupm(temp) {
        //$("#iframe_a").attr("src",temp.attr("href"));
        //alert(temp);
        window.location = '${pageContext.request.contextPath}' + temp;
    }

    $(function () {
        var ali = $(".col-md-10 .nav li a");
        for (var i = 0; i < ali.length; ++i) {
            var url = window.location.href;
            url = url.toString();
            if (ali[i].href.indexOf(url) !== -1) {
                $(".col-md-10 .nav li a").eq(parseInt(i)).addClass("sel").siblings().removeClass("sel");
            }
        }
        //alert(url);
    })
</script>

<body style="background-color: #F8F8F8;">
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
            <ul class="nav nav-tabs" style="margin: 20px 50px">
                <li><a href="/admin/bszn/1">成绩导入</a></li>
                <li><a href="/admin/bszn/2">成绩分析</a></li>
                <li><a href="/creditwarn">学分预警</a></li>
                <li><a href="/recode">关联性分析</a></li>
            </ul>
        </div>
        <div class="tab-content">
            <div style="margin-left: 340px">
                <c:if test="${not empty pageUrl}">
                    <jsp:include page="${pageUrl}"></jsp:include>
                </c:if>

                <!-- 成绩分析 -->
                <c:if test="${not empty analyticResults}">
                    <input type="button" onclick="method(tab)" value="下载表格" class="btn btn-primary">
                    <table border="1" id="tab" class="table table-hover table-bordered"style="width: 80%;text-align: center">
                        <caption style="text-align: center;color: #0f0f0f;font-size: 25px">学生成绩趋势分析</caption>
                        <tr>
                            <th style="text-align: center">学号</th>
                            <th style="text-align: center">姓名</th>
                            <th style="text-align: center">一阶</th>
                            <th style="text-align: center">二阶</th>
                            <th style="text-align: center">三阶</th>
                            <th style="text-align: center">四阶</th>
                            <th style="text-align: center">五阶</th>
                        </tr>
                        <c:forEach items="${analyticResults}" var="analyticResult">
                            <tr>
                                <td>${analyticResult.stuId}</td>
                                <td>${analyticResult.stuName}</td>
                                <c:forEach items="${analyticResult.trend}" var="trend">
                                    <c:if test="${trend eq '下降'}">
                                        <td style="background-color: red">${trend}</td>
                                    </c:if>
                                    <c:if test="${trend eq '提高'}">
                                        <td style="background-color:#38F54B">${trend}</td>
                                    </c:if>
                                    <c:if test="${trend eq '不确定'}">
                                        <td style="background-color: #DFE1E3">${trend}</td>
                                    </c:if>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <!-- 学分预警 -->
                <c:if test="${not empty students}">
                <input type="button" value="下载表格" onclick="method(tab)" class="btn btn-primary">
                <table id="tab" border="1" class="table table-hover table-bordered"style="width: 80%;text-align: center">
                    <caption style="text-align: center;color: #0f0f0f;font-size: 25px">学分预警和学位预警</caption>
                    <tr>
                        <th style="text-align: center">学 号</th>
                        <th style="text-align: center">姓 名</th>
                        <th style="text-align: center">电话号码</th>
                        <th style="text-align: center">家庭号码</th>
                        <th style="text-align: center">所挂科目</th>
                    </tr>
                    <c:forEach items="${students}" var="item">
                    <tr>
                        <td> ${item.stuno}</td>
                        <td> ${item.name}</td>
                        <td>${item.phone}</td>
                        <td>${item.familyPhone}</td>
                        <td>
                            <c:forEach items="${item.courses}" var="index">
                                ${index}&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                    </tr>
                    </c:forEach>
                    </c:if>

                    <!-- 成绩关联性分析 -->
                    <c:if test="${not empty results}">
                    <input type="button" value="下载表格" onclick="method(tab)" class="btn btn-primary">
                    <table border="1" id="tab" class="table table-hover table-bordered"style="width: 80%;text-align: center">
                        <caption style="text-align: center;color: #0f0f0f;font-size: 25px">大学生网络行为与学习成绩进行关联性分析</caption>
                        <tr>
                            <th style="text-align: center">条件</th>
                            <th style="text-align: center">结果</th>
                            <th style="text-align: center">置信度</th>
                        </tr>
                        <c:forEach items="${results}" var="result">
                            <tr>
                                <td>
                                    <c:forEach items="${result}" var="item" end="${fn:length(result)-3}">
                                        ${func:changeRelevance(item)}&nbsp;&nbsp;
                                    </c:forEach>
                                </td>
                                <td>${func:changeRelevance(result[fn:length(result)-2])}</td>
                                <td>${result[fn:length(result)-1]}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>