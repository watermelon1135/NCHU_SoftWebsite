<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/fileinput.min.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.zh-CN.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/fileinput.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/zh.js"></script>
  <script type="text/javascript">
			$(function(){
				$("#date-input").datetimepicker({
					format: "dd MM yyyy - hh:ii",
					<!--language: 'zh-CN',-->
                    //autoclose: true,
                    todayBtn: true,
                    pickerPosition: "bottom-left"
                });
                $('#testfile').fileinput({
                	language: 'zh',
                    uploadUrl: location.pathname + 'upload/',
                    showCaption: true,
                    showUpload: true,
                    showRemove: true,
                    showClose: true,
                    layoutTemplates:{
                       actionDelete: ''
                    },
                    browseClass: 'btn btn-primary'
                });
			});
     </script>
     <style type="text/css">
       	.form-group{
       		margin: 20px;
       		width: 50%;
       	}
       	label{
       		display: inline-block;
       		cursor: pointer;
       		float: left;
       		width: 130px;
       		margin: 3px 20px;
       		text-align: right;
       		vertical-align: middle;
       	}
       	input{
       		font-size: inherit;
       		vertical-align: middle;
       		line-height: -moz-block-height;
       	}
       	.file-input{
       		margin-left: 175px;
       		width:100%
       	}
       	.a,.c,.b{
       		background-color: #055FA5;
       		color: #FFFFFF;
       		margin-right: 10px;
       	}
       	.b:hover{
       		background-color: #055FA5;
       		color: #FFFFFF;
       	}
       	.a:hover{
       		background-color: #055FA5;
       		color: #FFFFFF;
       	}
       	.c:hover{
       		background-color: #055FA5;
       		color: #FFFFFF;
       	}
       </style>
</head>
<body>
  <div class="container" style="margin: 50px; height: 1000px;">
			<form action="" class="form-inline" role="form">
			<div class="form-group">
				<label for="title">公告标题:</label>
				<input type="text" class="form-control" id="title"placeholder="请输入标题" />
			</div><br />
			<div class="form-group">
				<label for="keyword">发布人:</label>
				<input type="text" class="form-control" id="keyword"placeholder="请输入关键字" />
			</div><br>
			<div class="form-group">
				<label for="orign">来源:</label>
				<select class="selectpicker show-tick form-control" name="orign">
					<option value="">教务处</option>
					<option value="">学工处</option>
					<option value="">后勤处</option>
				</select>
			</div>
			<div class="form-group">
				<label for="date">发布时间:</label>
				<div class="input-append date form_datetime">
				    <input size="16" class="form-control" type="text" name="" id="date-input" value="" readonly style="width:40%">
			    </div>
			</div>
			<div class="form-group">
				<label for="date">编辑:</label>
				<textarea name="" rows="3" cols="" class="form-control" style="margin-left: 0px;"></textarea>
			</div>
			<div class="form-group">
				<label for="testfile" class="control-label">上传附件:</label>
				<input type="file" name="testfile" id="testfile" value="" multiple/>
			</div>
			<div class="form-group">
				<label for="orign">下拉:</label>
				<select class="selectpicker show-tick form-control" name="">
					<option value="">教务处</option>
					<option value="">学工处</option>
					<option value="">后勤处</option>
				</select>
			</div>
			<div class="form-group" style="float: left;">
				<label for="orign">下拉:</label>
				<select class="selectpicker show-tick form-control" name="">
					<option value="">教务处</option>
					<option value="">学工处</option>
					<option value="">后勤处</option>
				</select>
			</div>
			<div class="form-group">
				<div class="btn" style="margin-left: 200px;">
				    <button type="submit" class="btn btn-default b">提交</button>
				    <button type="submit" class="btn btn-default c">返回</button>
			    </div>
			</div>
		</form>
		</div>
</body>
</html>