<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<title>管理界面</title>
		<link rel="stylesheet" type="text/css" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/Administration.css"/>
		<script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body style="background-color: #F8F8F8;">
		<div class="row-fluid">
			<div class="container-fluid">
				<div class="logo"><img src="img/main/software.png"/></div>
				<div class="exit">
					<span>欢迎访问后台！</span>
					<div class="exit-btn">
						<a href="../index.html">退出登录</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2">
					<div class="administ">
						<img src="img/main/guanliyuan.png"/>
						<div class="name">
							<span style="font-size: 24px;font-weight: bold; margin-left: 4px;">姓名</span><br />
							<span style="font-size: 12px;font-weight: normal;">系统管理员</span>
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
										<li><a href="/manage/${twoMenu.secondMenuUrl}" target="iframe_a">${twoMenu.secondMenuName}</a></li>
									</c:forEach>
								</ul>
								</c:if>
							</li>
						</c:forEach>
					</ul>

				</div>
				<div class="col-md-10" style="margin-top: 30px;padding: 0px 50px 0px 30px;">
					<div class="nr-content">
        				<iframe src="www.baidu.com" width="100%" onload="this.height=iframe_a.document.body.scrollHeight" name="iframe_a" scrolling="no" frameborder="0"></iframe>
        			</div>
				</div>
			</div>
		</div>
	</body>
</html>
