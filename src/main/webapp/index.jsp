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

<jsp:include page="WEB-INF/jsp/indexTop.jsp"/>
<!--
        	作者：2515873961@qq.com
        	时间：2018-12-23
        	描述：banner轮播
        -->
<script type="text/javascript">
    var i=0;
    var timer;
    //页面加载完毕执行该函数
    $(function () {
        $(".carousel-inner .item").eq(0).show().siblings().hide();
        ShowTime();
        //实现鼠标放上去 图片变化效果
        $(".carousel-indicators li").hover(function () {
            i=$(this).index();//获取当前鼠标放在哪个tab下
            Show();//轮播到当前tab
            clearInterval(timer);//悬停在当前tab的时候 停止轮播
        },function () {
            ShowTime();//移走的时候恢复轮播
        })

        $(".carousel-inner").hover(function () {
            $("#demo .carousel-control").show();
        },function () {
            $("#demo .carousel-control").hide();
        });

        $("#demo .carousel-control").hover(function () {
            $("#demo .left").show();
            $("#demo .right").show();
        })

        //按下向左按钮 执行相关操作
        $("#demo .left").click(function () {

            if (--i < 0){
                i=2;
            }

            Show();
            clearInterval(timer);
            ShowTime();
        });

        //按下向右按钮 执行相关操作
        $("#demo .right").click(function () {
            clearInterval(timer);
            if (++i>2){
                i=0;
            }
            //alert(i);
            Show();
            ShowTime();
        });

    });

    function Show() {
        $(".carousel-inner .item").eq(i).show().siblings().hide();//轮播

        $(".carousel-indicators li").eq(i).addClass("active").siblings().removeClass("active");//图标颜色跟随图片变化
    }
    function ShowTime() {
        timer = setInterval(function () {
            i=(++i)%3;
            Show();
        },2000);
    }
    <%--用于校验用户名与密码是否为空--%>
        function check() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            if (username == null || username == "") {
                document.getElementById("username").focus();
                alert("用户名不能为空！！");
                return;
            }
            if (password == null || password == "") {
                document.getElementById("password").focus();
                alert("密码不能为空！！");
                return;
            }
            frm.submit();
        }

</script>


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
                <img src="img/home_page_slices/1.jpg" style="text-align: center;"/>
            </div>
            <div class="item">
                <img src="img/home_page_slices/2.jpg"/>
            </div>
            <div class="item">
                <img src="img/home_page_slices/3.png"/>
            </div>
        </div>
        <%--<!--左右切换按钮-->
        <a href="#demo" role="button" class="left carousel-control" data-slide="prev" style="height: 100%;">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a href="#demo" role="button" class="right carousel-control" data-slide="next" style="height: 100%;">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>--%>
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
                <a href="${news.secondMenuUrl}.html">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                   <div class="newspicture" style="height: 200px; width: 100%;">
                       <div id="myCarousel" class="carousel slider">
                           <div class="carousel-inner">
                               <div class="item active" style="height: 200px; width: 100%;">
                                   <img src="img/home_page_slices/xinwen4.png " alt="first slid"/>
                                   <div class="carousel-caption" style="padding-bottom: 0px;">标题4</div>
                               </div>
                               <div class="item" style="height: 200px; width: 100%;">
                                   <img src="img/home_page_slices/xinwen3.png" alt="second slid"/>
                                   <div class="carousel-caption" style="padding-bottom: 0px;">标题3</div>
                               </div>
                               <div class="item" style="height: 200px; width: 100%;">
                                   <img src="img/home_page_slices/xinwen2.png" alt="third slid"/>
                                   <div class="carousel-caption" style="padding-bottom: 0px;">标题2</div>
                               </div>
                               <div class="item" style="height: 200px; width: 100%;">
                                   <img src="img/home_page_slices/xinwen.png" alt="third slid"/>
                                   <div class="carousel-caption" style="padding-bottom: 0px;">标题1</div>
                               </div>
                           </div>
                           <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                               <%--<span class="sr-only">Previous</span> --%>
                           </a>
                           <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                               <%--<span class="sr-only">next</span>--%>
                           </a>
                       </div>
                   </div>

                   <div class="news">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty newsHeads}">
                            <c:forEach items="${newsHeads}" var="news">
                                <li><a href="/item/${news.pageContextId}" target="_blank"
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
                <a href="${inform.secondMenuUrl}.html">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                <div class="inform">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty informHeads}">
                            <c:forEach items="${informHeads}" var="inform">
                                <li><a href="/item/${inform.pageContextId}" target="_blank"
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
            <form  name="frm" action="/login" method="post" class="form-horizontal" role="form">
                <div style="padding-top: 6px;">
                    <span>统一认证登录</span>&nbsp;&nbsp;&nbsp;<span style="color: red">${msg}</span>
                </div>
                <div class="form-group">
                    <label class="user control-label">工号：</label>
                    <input class="form-control" type="text" name="username" id="username" value="${username}"/>
                </div>
                <div class="form-group">
                    <label class="password control-label">密码：</label>
                    <input class="form-control" type="password" name="password" id="password" value=""/>
                </div>
                <div class="s">
                    <button type="button" class="btn btn-default" style="width: 20%;" onclick="check()">登录</button>
                </div>
            </form>
            <div class="xian">
                <img src="/img/home_page_slices/xuxian.png"/>
            </div>
            <div class="letter">
                <div class="xinxiang" style="width: 100%; height:150px ;">
                    <img src="/img/home_page_slices/xinxiang.png" style="float: left; padding-left: 10px;"/>
                    <a href="/mailboxshow.html" style="float: right;"><img src="/img/home_page_slices/xin.png"/></a>
                </div>
            </div>
        </div>
    </div>


    <div class="row" style="padding-bottom: 0px;">
        <div class="panel panel-default" style="float: left;">
            <div class="panel-heading">
                <span>${party.secondMenuName}</span>
                <a href="${party.secondMenuUrl}.html">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                <div class="inform">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty partyHeads}">
                            <c:forEach items="${partyHeads}" var="party">
                                <li><a href="/item/${party.pageContextId}" target="_blank"
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
                <a href="${research.secondMenuUrl}.html">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                <div class="inform">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty researchHeads}">
                            <c:forEach items="${researchHeads}" var="research">
                                <li><a href="/item/${research.pageContextId}" target="_blank"
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
                <a href="${enroll.secondMenuUrl}.html">more>></a>
                <img src="/img/home_page_slices/icon1.png"/>
            </div>
            <div class="panel-body">
                <div class="inform">
                    <ul id="arthd" class="news-list">
                        <c:if test="${not empty enrollHeads}">
                            <c:forEach items="${enrollHeads}" var="enroll">
                                <li><a href="/item/${enroll.pageContextId}" target="_blank"
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
                    <a href="${union.firstMenuUrl}.html"><span>${union.firstMenuName}</span></a>
                </div>
            </div>
        </div>
        <div class="listone" style="margin-left: 80px;">
            <div class="one">
                <div class="op" style="width: 26px; height: 29px; float: left;">
                    <img src="/img/home_page_slices/keyanchengguo.png" style="width: 100%; height: 100%;"/>
                </div>
                <div class="os" style="float: left; margin-left: 4px;">
                    <a href="${guide.firstMenuUrl}.html"><span>${guide.firstMenuName}</span></a>
                </div>
            </div>
        </div>
        <div class="listone" style="margin-left: 80px;">
            <div class="one">
                <div class="op" style="width: 26px; height: 29px; float: left;">
                    <img src="/img/home_page_slices/rencaipeiyang.png" style="width: 100%; height: 100%;"/>
                </div>
                <div class="os" style="float: left; margin-left: 4px;">
                    <a href="${foster.firstMenuUrl}.html"><span>${foster.firstMenuName}</span></a>
                </div>
            </div>
        </div>
        <div class="listone" style="float: right;">
            <div class="one">
                <div class="op" style="width: 26px; height: 29px; float: left;">
                    <img src="/img/home_page_slices/student.png" style="width: 100%; height: 100%;"/>
                </div>
                <div class="os" style="float: left;margin-left: 4px;">
                    <a href="${eap.firstMenuUrl}.html"><span>${eap.firstMenuName}</span></a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="WEB-INF/jsp/indexBottom.jsp"/>

</body>
</html>
