<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/func.tld" prefix="func"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/star-rating.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/star-rating.js"></script>
  <script type="text/javascript">
  $(document).on('ready', function(){
	    $('#input-4').rating();
	});
  </script>
  <style type="text/css">
    .date{
      width: 8%;
	  height: 64px;
	  float: left;
     }
    .day{
      display: block;
	  color: #161517;
	  font-size: 20px;
	  text-align: center;
	  width: 100%;
	  height: 30px;
	  background-color: #EDEDED;
    }
    .month{
      display: block;
	  text-decoration: none;
	  color: #FFFFFF;
	  font-size: 20px;
	  text-align: center;
	  width: 100%;
	  height: 30px;
	  background-color: #293782;	
    }
    .month:hover{
      text-decoration: none;
	  color: #FFFFFF;
	  background-color: #293782;
     }
    .title{
      float: left;
	  width: 60%;
	  height: 64px;
	  margin-left: 20px;
    }
    .title h2{
      margin: 0px;
	  height: 32px;
    }
   
    .title ul{
      width: 100%;
	  margin-top: 20px;
	  padding-left: 0px;
	  height: 20px;
	  list-style: none;
    }
   .title ul li{
     float: left;
	 margin-right: 20px;
   }
  </style>

	<style type="text/css">
		#score1 i {
			vertical-align: middle;
			display: inline-block;
			width: 32px;
			height: 32px;
			background: url('/img/jyxx/start.png') no-repeat center center;
			background-size: cover;
		}

		#score1 i.on {
			background-image: url('/img/jyxx/start_index.png');
		}
	</style>
</head>
<body>
<jsp:include page="jyxxTop.jsp"></jsp:include>
<div class="container">
	<div class="col-md-9" style="margin-top: 30px;padding: 0px 50px 0px 0px;">
		<div class="nr-content">
			<%--<iframe src="jyxxA.jsp" width="100%" onload="this.height=iframe_a.document.body.scrollHeight" name="iframe_a" scrolling="no" frameborder="0"></iframe>--%>
				<div class="main" style="height:600px">
					<div class="panel panel-default" style="margin-top: 30px; margin-right: 50px;">
						<div class="panel-heading" style="height: 90px;">
							<div class="date">
								<a href="" class="day" style="text-decoration: none;"><fmt:formatDate value="${mailboxAsk.askTime}" pattern="dd"/></a>
								<a href="" class="month">${func:changeMonth(mailboxAsk.askTime)}</a>
							</div>
							<div class="title">
								<h2>${mailboxAsk.title}</h2>
								<ul class="meta">
									<li><a href="#"><i class="glyphicon glyphicon-user">&nbsp;${mailboxAsk.askName}</i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-tasks">&nbsp;${typeName}</i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-heart">&nbsp;答复<span>2018-02-13</span><fmt:formatDate value="${item.replyTime}" pattern="yyyy-MM-dd"/></i></a></li>
									<li><a href=""><i class="glyphicon glyphicon-check">&nbsp;阅读次数:${mailboxAsk.readCount}</i></a></li>
								</ul>
							</div>
						</div>
						<div class="panel-body">
							<p>${mailboxAsk.context}</p>
							<c:if test="${not empty mailboxAsk.askAppendix}"><p style="text-align: right"><a
									href="/downloadAppendix?appendix=${mailboxAsk.askAppendix}">
								<i class="glyphicon glyphicon-paperclip">${askFile}</i></a></p></c:if>
						</div>
					</div>

					<div class="answer">
						<div class="panel panel-default" style="margin-right:50px">
							<div class="panel-heading" style="height: 46px; background-color: #055FA5;">
								<span style="color: #FFFFFF;line-height: 30px;font-size: 20px;font-weight: bold;">回复:</span>
							</div>
							<div class="panel-body">
								<p>${mailboxReply.context}</p>
								<c:if test="${not empty mailboxReply.replyAppendix}"><p style="text-align: right"><a
										href="/downloadAppendix?appendix=${mailboxReply.replyAppendix}">
								<i class="glyphicon glyphicon-paperclip">${replyFile}</i></a></p></c:if>
							</div>
							<c:if test="${showFlag eq 1}">
								<div>
									<span id="score1">
										<i></i><i></i><i></i><i></i><i></i>
									</span>
									<input type="button" value="提交" id="tj" onclick="Submit()">
								</div>
							</c:if>
							<c:if test="${not empty satisfied}">
								<div>
									评价：
									<c:forEach begin="1" end="${satisfied}">
										<i><img src="/img/jyxx/start_index.png"></i>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
				</div>
		</div>
	</div>

	<div class="col-md-3">
		<div class="search"style="margin-top: 30px;">
			<span style="font-size: 20px;">查询:</span>
			<div class="input-group" style="margin-top: 20px; margin-bottom: 30px;">
				<input type="text" name="" id="keyword" value="" class="form-control"onkeydown="onkeydown(event)" />
				<span class="input-group-addon"><i class="glyphicon glyphicon-search" onclick="query()"></i></span>
			</div>
		</div>
		<div class="hotq">
			<span style="font-size: 20px;">最热提问:</span>
			<ul style="margin-top: 10px;font-size: 14px;">
				<c:forEach items="${hot}" var="item">
					<li><a href="/showdetail?mailboxaskid=${item.mailboxAskId}">${item.title}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="jyxxBottom.jsp"></jsp:include>

<script type="text/javascript">
    function query() {
        var keyword = document.getElementById("keyword");
       // alert(keyword.value)
        window.location.href="/search?queryCode=" + keyword.value;
    }
</script>

<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    /**
     * [score 评分]
     * @param  {[String]} scoreId   [评分Id]
     * @param  {[String]} extentStr [需要变成实体的星星的样式class]
     * $(scoreId).val()　　[访问分数]
     */
    function score(scoreId, extentStr) {

        scoreId = "#" + scoreId;

        $(scoreId + " i").hover(function() { // 鼠标移入，未确定选择分数时

            for (var i = 0; i <= $(this).index(); i++) {

                $(scoreId + " i").eq(i).addClass(extentStr); // 实星星

            }
            var score;
            $(scoreId + " i").click(function() { // 点击评分，确定好分数后无法更改

                for (var i = 0; i <= $(this).index(); i++) {

                    $(scoreId + " i").eq(i).addClass(extentStr);

                }

                $(scoreId).val($(this).index()+1);

                $(scoreId + " i").unbind(); // 清除移入移出

            });

        }, function() { // 鼠标移出

            $(scoreId + " i").removeClass(extentStr); // 描线星星

        });

    }

    score("score1", "on");

    function Submit(){
        //alert("10");
       // alert("score=" + document.getElementById("score1").value);
        window.location.href='/commit?score='+document.getElementById("score1").value + '&replyid=${mailboxReply.mailboxReplyId}&askid=' + ${mailboxAsk.mailboxAskId};

        alert("评价成功，感谢您的评价")
    }
</script>
</body>
</html>