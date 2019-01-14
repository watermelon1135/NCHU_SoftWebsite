<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
       margin:31px 0px 0px 0px;
     }
     .exit a{
       text-decoration:none;
     }
  </style>

</head>
<body> 
  <%--<div class="row">
			&lt;%&ndash;<div class="container">
				<div class="logo" style="margin-top: 10px;width: 75%;float: left;">
					<img src="img/jyxx/logo.png"/>
				</div>
				<div class="ask">
					<a href="jyxxQuestion.jsp" target="iframe_a" style="font-size: 20px;text-decoration: none;">我要提问</a>
					<!--<button class="form-control" target="iframe_a">我要提问</button>-->
				</div>
				<div class="exit"><a href="">退出</a></div>
				<div class="user">
					<span style="font-size: 18px;"><i class="glyphicon glyphicon-user">&nbsp;用户名</i></span>
				</div>

			</div>&ndash;%&gt;
		</div>
		<div class="row-fluid"style="height: 40px; background-color:#055FA5;margin-top: 20px;"></div>
		<div class="container">
			<img src="img/jyxx/223.png"style="width: 100%;height: 300px;"/>
		</div>--%>
   		<jsp:include page="jyxxTop.jsp"/>
		<div class="container">
			<div class="col-md-9" style="margin-top: 30px;padding: 0px 50px 0px 0px;">
					<div class="nr-content" style="height: 500px">
        				<p style="font-family: 微软雅黑;font-size: 32px">感谢投递!您的查询号为：<span style="color:#352deb;font-family: 隶书">${queryCode}</span>,可凭借查询号查看回复并作出评价。书记校长信箱作为公众与学校各部门沟通的桥梁，公众可就各部门职能范围内的工作进行咨询、提出建议或反映问题。</p>
        				<img src="img/xinjian.gif" style="width:50%;margin-left:150px"/>
        			</div>
				</div>

			<%--<div class="col-md-3">
				<div class="search"style="margin-top: 30px;">
					<span style="font-size: 20px;">查询:</span>
					<div class="input-group" style="margin-top: 20px; margin-bottom: 30px;">
						<input type="text" name="" id="" value="" class="form-control"onkeydown="onkeydown(event)" />
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
					</div>
				</div>
				<div class="hotq">
					<span style="font-size: 20px;">最热提问:</span>
					<ul style="margin-top: 10px;font-size: 14px;">
						<li><a href="">学校停车收费</a></li>
						<li><a href="">挂科</a></li>
						<li><a href="">四级</a></li>
						<li><a href="">寝室条件太差</a></li>
					</ul>
				</div>--%>
			</div>
		</div>
		
		<jsp:include page="jyxxBottom.jsp"/>

</body>
</html>