<%--
  Created by IntelliJ IDEA.
  User: 曾溱泷
  Date: 2019/1/14
  Time: 10:54
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/func.tld" prefix="func"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>院长信箱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home_page.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        .hotq li{
            margin-top: 4px;
        }
        .hotq a{
            text-decoration: none;
        }
        .ask{
            width: 10%;
            float:left;
            margin-top: 30px;
        }
        .ask button{
            background-color: #293782;
            color: #FFFFFF;
            height: 40px;
        }
        .user{
            float: left;
            margin: 31px 0px 0px 20px;
        }
        .exit{
            width:4%;
            float:left;
            font-size:18px;
            margin:31px 0px 0px 10px;
        }
        .exit a{
            text-decoration:none;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="container">
        <div class="logo" style="margin-top: 10px;width: 60%;float: left;">
            <img src="/img/jyxx/logo.png"/>
        </div>
        <div class="ask">
            <a href="/mailboxshow" target="_self" style="font-size: 20px;text-decoration: none;">首页</a>
        </div>
        <div class="ask">
            <a href="/askQuestion" target="_blank" style="font-size: 20px;text-decoration: none;">我要提问</a>
            <!--<button class="form-control" target="iframe_a">我要提问</button>-->
        </div>
        <div class="exit"><a href="/index">退出</a></div>
        <div class="user">
            <span style="font-size: 18px;"><i class="glyphicon glyphicon-user">&nbsp;用户名</i></span>
        </div>

    </div>
</div>
<div class="row-fluid"style="height: 40px; background-color:#055FA5;margin: 20px 0px 0px 0px"></div>
<div class="container-fluid" style="padding: 0px;">
    <img src="/img/jyxx/223.png"style="width: 100%;height: 300px"/>
</div>
</body>
</html>
