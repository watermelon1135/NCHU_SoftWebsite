<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 范孝发
  Date: 2019/1/5
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <!--<meta name="viewport" content="width=device-width,initial-scale=1.0"/>-->
    <link rel="stylesheet" type="text/css" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="/css/home_page.css"/>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="/js/homepage.js"></script>
</head>
<body>

<jsp:include page="indexTop.jsp"/>
<!--
        	作者：2515873961@qq.com
        	时间：2018-12-23
        	描述：banner轮播
        -->
<div class="row-fluid">
    <div id="demo" class="carousel slider" data-ride="carousel">
        <!--指示符-->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slider-to="0" class="active"></li>
            <li data-target="#demo" data-slider-to="1"></li>
            <li data-target="#demo" data-slider-to="2"></li>
        </ul>
        <!--轮播图片-->
        <div class="carousel-inner">
            <div class="item active">
                <img src="../../img/home_page_slices/1.jpg" style="text-align: center;"/>
            </div>
            <div class="item">
                <img src="../../img/home_page_slices/2.jpg"/>
            </div>
            <div class="item">
                <img src="../../img/home_page_slices/3.png"/>
            </div>
        </div>
        <!--左右切换按钮-->
        <a href="#demo" class="left carousel-control" data-slide="prev" style="height: 100%;">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a href="#demo" class="right carousel-control" data-slide="next" style="height: 100%;">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div>
<!--
    作者：2515873961@qq.com
    时间：2018-12-23
    描述：主体部分开始
-->
<div class="container">
    <div class="row" style="padding-top: 40px;height: 475px; padding-bottom: 0px;">
        <div class="panel panel-default" style="float: left;">
            <div class="panel-heading">
                <span>新闻速览</span>
                <a href="${news.secondMenuUrl}">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
               <%-- <div class="newspicture">
                    <img src="/img/home_page_slices/xinwen.png" style="width: 100%;"/>
                </div>--%>
                   <div class="newspicture" style="height: 200px; width: 100%;">
                       <div id="myCarousel" class="carousel slider">
                           <div class="carousel-inner">
                               <div class="item active" style="height: 200px; width: 100%;">
                                   <img src="img/home_page_slices/xinwen.png " alt="first slid"/>
                                   <div class="carousel-caption" style="padding-bottom: 0px;">标题1</div>
                               </div>
                               <div class="item" style="height: 200px; width: 100%;">
                                   <img src="img/home_page_slices/mmexport1463302710255.jpg" alt="second slid"/>
                                   <div class="carousel-caption" style="padding-bottom: 0px;">标题2</div>
                               </div>
                               <div class="item" style="height: 200px; width: 100%;">
                                   <img src="img/home_page_slices/mmexport1463302547647.jpg" alt="third slid"/>
                                   <div class="carousel-caption" style="padding-bottom: 0px;">标题3</div>
                               </div>
                               <div class="item" style="height: 200px; width: 100%;">
                                   <img src="img/home_page_slices/mmexport1463302567194.jpg" alt="third slid"/>
                                   <div class="carousel-caption" style="padding-bottom: 0px;">标题4</div>
                               </div>
                           </div>
                           <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                               <span class="sr-only">Previous</span>
                           </a>
                           <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                               <span class="sr-only">next</span>
                           </a>
                       </div>
                   </div>

                   <div class="news">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty newsHeads}">
                            <c:forEach items="${newsHeads}" var="news">
                                <li><a href="${news.pageContextUrl}" target="_blank"
                                       title="${news.title}">${news.title}</a>
                                    <span class="art-date"><fmt:formatDate value="${news.uploadTime}"
                                                                           pattern="MM-dd"/></span>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty newsHeads}">
                            <li>
                                <a target="_blank" style="color: red">暂时还没有任何信息！</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default" style="float: left;margin-left: 31px; margin-right: 31px;">
            <div class="panel-heading">
                <span>${inform.secondMenuName}</span>
                <a href="${inform.secondMenuUrl}">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                <div class="inform">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty informHeads}">
                            <c:forEach items="${informHeads}" var="inform">
                                <li><a href="${inform.pageContextUrl}" target="_blank"
                                       title="${inform.title}">${inform.title}</a>
                                    <span class="art-date"><fmt:formatDate value="${inform.uploadTime}"
                                                                           pattern="MM-dd"/></span>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty informHeads}">
                            <li>
                                <a target="_blank" style="color: red">暂时还没有任何信息！</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <div class="disan" style="float: left;">
            <form action="" class="form-horizontal" role="form">
                <div style="padding-top: 6px;">
                    <span>统一认证登录</span>
                </div>
                <div class="form-group">
                    <label class="user control-label">工号：</label>
                    <input class="form-control" type="text" name="focusedInput" id="focusedInput" value=""/>
                </div>
                <div class="form-group">
                    <label class="password control-label">密码：</label>
                    <input class="form-control" type="text" name="focusedInput" id="focusedInput" value=""/>
                </div>
                <div class="s">
                    <button type="submit" class="btn btn-default" style="width: 20%;">登录</button>
                </div>
            </form>
            <div class="xian">
                <img src="/img/home_page_slices/xuxian.png"/>
            </div>
            <div class="letter">
                <div class="xinxiang" style="width: 100%; height:150px ;">
                    <img src="/img/home_page_slices/xinxiang.png" style="float: left; padding-left: 10px;"/>
                    <a href="" style="float: right;"><img src="/img/home_page_slices/xin.png"/></a>
                </div>
            </div>
        </div>
    </div>


    <div class="row" style="padding-bottom: 0px;">
        <div class="panel panel-default" style="float: left;">
            <div class="panel-heading">
                <span>${party.secondMenuName}</span>
                <a href="${party.secondMenuUrl}">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                <div class="inform">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty partyHeads}">
                            <c:forEach items="${partyHeads}" var="party">
                                <li><a href="${party.pageContextUrl}" target="_blank"
                                       title="${party.title}">${party.title}</a>
                                    <span class="art-date"><fmt:formatDate value="${party.uploadTime}"
                                                                           pattern="MM-dd"/></span>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty partyHeads}">
                            <li>
                                <a target="_blank" style="color: red">暂时还没有任何信息！</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default" style="float: left;margin-left: 31px; margin-right: 31px;">
            <div class="panel-heading">
                <span>${research.secondMenuName}</span>
                <a href="${research.secondMenuUrl}">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                <div class="inform">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty researchHeads}">
                            <c:forEach items="${researchHeads}" var="research">
                                <li><a href="${research.pageContextUrl}" target="_blank"
                                       title="${research.title}">${research.title}</a>
                                    <span class="art-date"><fmt:formatDate value="${research.uploadTime}"
                                                                           pattern="MM-dd"/></span>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty researchHeads}">
                            <li>
                                <a target="_blank" style="color: red">暂时还没有任何信息！</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default" style="float: left;">
            <div class="panel-heading">
                <span>${enroll.secondMenuName}</span>
                <a href="${enroll.secondMenuUrl}">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                <div class="inform">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty enrollHeads}">
                            <c:forEach items="${enrollHeads}" var="enroll">
                                <li><a href="${enroll.pageContextUrl}" target="_blank"
                                       title="${enroll.title}">${enroll.title}</a>
                                    <span class="art-date"><fmt:formatDate value="${enroll.uploadTime}"
                                                                           pattern="MM-dd"/></span>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty enrollHeads}">
                            <li>
                                <a target="_blank" style="color: red">暂时还没有任何信息！</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 25px;">
        <div class="listone">
            <div class="one">
                <div class="op" style="width: 26px; height: 29px; float: left;">
                    <img src="/img/home_page_slices/dangzheng.png" style="width: 100%; height: 100%;"/>
                </div>
                <div class="os" style="float: left; margin-left: 4px;">
                    <a href="${union.firstMenuUrl}"><span>${union.firstMenuName}</span></a>
                </div>
            </div>
        </div>
        <div class="listone" style="margin-left: 80px;">
            <div class="one">
                <div class="op" style="width: 26px; height: 29px; float: left;">
                    <img src="/img/home_page_slices/keyanchengguo.png" style="width: 100%; height: 100%;"/>
                </div>
                <div class="os" style="float: left; margin-left: 4px;">
                    <a href="${guide.firstMenuUrl}"><span>${guide.firstMenuName}</span></a>
                </div>
            </div>
        </div>
        <div class="listone" style="margin-left: 80px;">
            <div class="one">
                <div class="op" style="width: 26px; height: 29px; float: left;">
                    <img src="/img/home_page_slices/rencaipeiyang.png" style="width: 100%; height: 100%;"/>
                </div>
                <div class="os" style="float: left; margin-left: 4px;">
                    <a href="${foster.firstMenuUrl}"><span>${foster.firstMenuName}</span></a>
                </div>
            </div>
        </div>
        <div class="listone" style="float: right;">
            <div class="one">
                <div class="op" style="width: 26px; height: 29px; float: left;">
                    <img src="/img/home_page_slices/student.png" style="width: 100%; height: 100%;"/>
                </div>
                <div class="os" style="float: left;margin-left: 4px;">
                    <a href="${eap.firstMenuUrl}"><span>${eap.firstMenuName}</span></a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="indexBottom.jsp"/>

</body>
</html>
