<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body style="padding:30px 20px 0px 20px">
  <!-- 按钮 -->
  <div style="height:50px;width:100%">
    <div style="float:left;width:20%">
       <a class="btn" href="ggglB.jsp" style="background-color:#055fa5;color:#ffffff">添加</a>
    </div>
    <div style="float:right;width:20%">
      <a class="btn" style="background-color:#055fa5;color:#ffffff">添加</a>
    </div>
  </div>
  <!--表格-->
  <table class="table">
			<thead>
				<tr>
					<th>编号</th>
					<th>公告标题</th>
					<th>修改</th>
					<th>放入回收站</th>
					<th>彻底删除</th>
				</tr>
			</thead>
			<%--<tbody>
				<tr>
					<td>01</td>
					<td>我院选派节目参加江西二建集团创新</td>
					<td><button class="btn" data-toggle="" data-target="l">修改</button></td>
					<td><button class="btn" data-toggle="modal" data-target="#myModal2">放入回收站</button></td>
					<td><button class="btn" data-toggle="modal" data-target="#myModal">彻底删除</button></td>
				</tr>
				<tr>
					<td>02</td>
					<td>我院选派节目参加江西二建集团创新</td>
					<td><button class="btn" data-toggle="" data-target="">修改</button></td>
					<td><button class="btn" data-toggle="modal" data-target="#myModal2">放入回收站</button></td>
					<td><button class="btn" data-toggle="modal" data-target="#myModal">彻底删除</button></td>
				</tr>
				<tr>
					<td>03</td>
					<td>我院选派节目参加江西二建集团创新</td>
					<td><button class="btn" data-toggle="" data-target="">修改</button></td>
					<td><button class="btn" data-toggle="modal" data-target="#myModal2">放入回收站</button></td>
					<td><button class="btn" data-toggle="modal" data-target="#myModal">彻底删除</button></td>
				</tr>
				<tr>
					<td>04</td>
					<td>我院选派节目参加江西二建集团创新</td>
					<td><button class="btn" data-toggle="" data-target="">修改</button></td>
					<td><button class="btn" data-toggle="modal" data-target="#myModal2">放入回收站</button></td>
					<td><button class="btn" data-toggle="modal" data-target="#myModal">彻底删除</button></td>
				</tr>--%>
			</tbody>
		</table>
		<!-- 页码 -->
		<div style="width:100%;text-align:center">
		        	<ul class="pagination">
		        		<li><a href="">1</a></li>
		        		<li><a href="">2</a></li>
		        		<li><a href="">3</a></li>
		        		<li><a href="">4</a></li>
		        	</ul>
		</div>
		<!--模态框-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-label="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 20%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">确认删除</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal" >是</button>
						<button type="button" class="btn y">否</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-label="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 30%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">确认放入回收站</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">是</button>
						<button type="button" class="btn y">否</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>