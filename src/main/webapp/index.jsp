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
	<link rel="stylesheet" type="text/css" href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="../../css/index.css"/>
	<link rel="stylesheet" type="text/css" href="../../css/home_page.css"/>
	<script src="../../js/jquery-3.3.1.min.js"></script>
	<script src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="../../js/homepage.js"></script>
</head>
<body>

<jsp:include page="WEB-INF/jsp/indexTop.jsp"/>
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
				<a href="yxgk.html">more>></a>
				<img src="../../img/home_page_slices/icon1.png"/>
			</div>
			<div class="panel-body">
				<div class="newspicture">
					<img src="../../img/home_page_slices/xinwen.png" style="width: 100%;"/>
				</div>
				<div class="news">
					<ul id="arthd" class="news-list">
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel panel-default" style="float: left;margin-left: 31px; margin-right: 31px;">
			<div class="panel-heading">
				<span>重要通知</span>
				<a href="#">more>></a>
				<img src="../../img/home_page_slices/icon1.png"/>
			</div>
			<div class="panel-body">
				<div class="inform">
					<ul id="arthd" class="news-list">
						<li><a href="" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
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
				<img src="../../img/home_page_slices/xuxian.png"/>
			</div>
			<div class="letter">
				<div class="xinxiang" style="width: 100%; height:150px ;">
					<img src="../../img/home_page_slices/xinxiang.png" style="float: left; padding-left: 10px;"/>
					<a href="" style="float: right;"><img src="../../img/home_page_slices/xin.png"/></a>
				</div>
			</div>
		</div>
	</div>


	<div class="row" style="padding-bottom: 0px;">
		<div class="panel panel-default" style="float: left;">
			<div class="panel-heading">
				<span>党群工作</span>
				<a href="#">more>></a>
				<img src="../../img/home_page_slices/icon1.png"/>
			</div>
			<div class="panel-body">
				<div class="inform">
					<ul id="arthd" class="news-list">
						<li><a href="" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel panel-default" style="float: left;margin-left: 31px; margin-right: 31px;">
			<div class="panel-heading">
				<span>科研成果</span>
				<a href="#">more>></a>
				<img src="../../img/home_page_slices/icon1.png"/>
			</div>
			<div class="panel-body">
				<div class="inform">
					<ul id="arthd" class="news-list">
						<li><a href="" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel panel-default" style="float: left;">
			<div class="panel-heading">
				<span>招生就业</span>
				<a href="#">more>></a>
				<img src="../../img/home_page_slices/icon1.png"/>
			</div>
			<div class="panel-body">
				<div class="inform">
					<ul id="arthd" class="news-list">
						<li><a href="" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
						<li><a href="#" target="_blank" title="我院选派节目参加江西二建集团创新.......................">我院选派节目参加江西二建集团创新.......................</a>
							<span class="art-date">01-25</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style="margin-top: 25px;">
		<div class="listone">
			<div class="one">
				<div class="op" style="width: 26px; height: 29px; float: left;">
					<img src="../../img/home_page_slices/dangzheng.png" style="width: 100%; height: 100%;"/>
				</div>
				<div class="os" style="float: left; margin-left: 4px;">
					<a href=""><span>党群工作</span></a>
				</div>
			</div>
		</div>
		<div class="listone" style="margin-left: 80px;">
			<div class="one">
				<div class="op" style="width: 26px; height: 29px; float: left;">
					<img src="../../img/home_page_slices/keyanchengguo.png" style="width: 100%; height: 100%;"/>
				</div>
				<div class="os" style="float: left; margin-left: 4px;">
					<a href=""><span>科研成果</span></a>
				</div>
			</div>
		</div>
		<div class="listone" style="margin-left: 80px;">
			<div class="one">
				<div class="op" style="width: 26px; height: 29px; float: left;">
					<img src="../../img/home_page_slices/rencaipeiyang.png" style="width: 100%; height: 100%;"/>
				</div>
				<div class="os" style="float: left; margin-left: 4px;">
					<a href=""><span>人才培养</span></a>
				</div>
			</div>
		</div>
		<div class="listone" style="float: right;">
			<div class="one">
				<div class="op" style="width: 26px; height: 29px; float: left;">
					<img src="../../img/home_page_slices/student.png" style="width: 100%; height: 100%;"/>
				</div>
				<div class="os" style="float: left;margin-left: 4px;">
					<a href=""><span>学生工作</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="WEB-INF/jsp/indexBottom.jsp"/>
</body>
</html>
