<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/func.tld" prefix="func" %>
<%--
  Created by IntelliJ IDEA.
  User: 范孝发
  Date: 2019/1/12
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发展趋势</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
<form method="post" action="/trend">
    <input type="text" name="classNo" value="${classNo}" placeholder="请输入要查询的班级" class="form-control" style="width: 20%;display: inline">
    <input type="submit" class="btn btn-primary" value="分析">
</form>
</body>
</html>
