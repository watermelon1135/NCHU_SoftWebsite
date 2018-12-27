<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<body>

    <form action="/test" method="post">
        名字：<input type="text" name="name"><br>
        日期：<input type="date" name="date">
        <br>
        <input type="submit" value="提交">
    </form>
</body>
</html>
