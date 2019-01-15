<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User:陶丽卫
  Date: 2019/1/9
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>回收站</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/Administration.css"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
        function jupm(temp){
            //$("#iframe_a").attr("src",temp.attr("href"));
            //alert(temp);
            window.location='${pageContext.request.contextPath}'+temp;
        }
        function resetRecycle(id) {
            //alert(11);
            var h = "/admin/removeToRecycle/"+id;
            //alert(h);
            $.ajax({
                    type:"post",
                    contentType:"application/json",
                    url:h,
                    success:function (data) {
                        alert(data);
                        window.location=window.location;
                        console.log(data);
                    }
                }
            )
            return false;
        }
        function deletePageContent(id) {
            if(confirm("确认要永久删除吗?(不会进入回收站)")){
                var h = "/admin/deletePageContent/" + id;
                //alert(h);
                $.ajax({
                    type: "post",
                    contentType: "application/json",
                    url: h,
                    success: function (data) {
                        alert(data);
                        window.location = window.location;
                        console.log(data);
                    }
                });
                return true;
            }
           return false;
        }
    </script>
</head>
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
                    <span style="font-size: 24px;font-weight: bold; margin-left: 4px;">姓名</span><br />
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
                            <ul id="${menu.firstMenu.firstMenuId}" class="nav nav-list collapse secondmenu" style="height: 0px;">
                                <c:forEach items="${menu.list}" var="twoMenu">
                                    <li><a href="/admin/${twoMenu.secondMenuUrl}" target="iframe_a" onclick="jupm()">${twoMenu.secondMenuName}</a></li>
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
                            <li><a href="/mailbox/${type.mailboxtypeid}/1" target="_self" onclick="jupm()">${type.mailboxtypename}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li>
                    <a href="/admin/recycleList" data-toggle="collapse" onclick="jupm('/admin/recycleList')" class="nav-header">
                        回收站
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10" style="margin-top: 30px;padding: 0px 50px 0px 30px;">
            <div class="nr-content">
                    <c:if test="${pagecontexts.size() == 0 and pages.pageNum != 1}">
                        该页没有数据，你可以<a href="/admin/recycleList">回到首页</a>
                    </c:if>
                    <c:if test="${pagecontexts.size() == 0 and (empty pages.pageNum or pages.pageNum ==1)}">
                        回收站里面还没有数据！
                    </c:if>
                <table class="table">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>公告标题</th>
                        <th>恢复</th>
                        <th>彻底删除</th>
                    </tr>
                    </thead>
                    <c:forEach items="${pagecontexts}" var="page" varStatus="index">
                        <tr>
                            <td>${index.count}</td>
                            <td><a href="/item/${page.pageContextId}"
                                   title='时间: <fmt:formatDate value="${page.uploadTime}" pattern="yyyy年MM月dd日"/>   标题:${page.title}'
                                   target="_blank">${page.title}</a></td>
                            <td><button class="btn" onclick="resetRecycle(${page.pageContextId})" data-toggle="" data-target="l">恢复</button></td>
                            <td><button class="btn" onclick="deletePageContent(${page.pageContextId})" data-toggle="modal" data-target="#myModal">彻底删除</button></td>
                        </tr>
                    </c:forEach>
                    <%--</tbody>--%>
                </table>
                <%--<c:forEach items="${pagecontexts}" var="page">
                    <li>
                        <a href="/item/${page.pageContextId}" target="_blank">${page.title}</a>
                            &lt;%&ndash;<span class="pull-right glyphicon glyphicon-chevron-down"></span>&ndash;%&gt;
                        &nbsp;&nbsp;<a href="" onclick="resetRecycle(${page.pageContextId})">恢复</a>
                        &nbsp;&nbsp;<a href="" onclick="deletePageContent(${page.pageContextId})">删除</a>
                    </li>
                </c:forEach>--%>
            </div>
        </div>

        <c:if test="${pagecontexts.size() != 0}">
            <div style="width:100%;text-align:center">
                <ul class="pagination">
                    <li><a href=" <c:if test="${pages.pageNum!=1}">${curr}?pagenum=${pages.pageNum-1}</c:if>"> &laquo;</a></li>
                    <c:if test="${pages.pageNum>5}">
                    <li><a href="${curr}?pagenum=${pages.pageNum-5}">...</a></li>
                    </c:if>
                    <c:forEach var="i" begin="${pagesBegin}" end="${pagesEnd}">
                    <li class="<c:if test="${i==pages.pageNum}">active</c:if> "><a href="${curr}?pagenum=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${pages.pageNumAll>pagesEnd}">
                    <li><a href="${curr}?pagenum=${pages.pageNum+5}">...</a></li>
                    </c:if>
                    <li><a href=" <c:if test="${pages.pageNum!=pages.pageNumAll}">${curr}?pagenum=${pages.pageNum+1}</c:if>">&raquo;</a></li>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
