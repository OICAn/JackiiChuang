<%--
  Created by IntelliJ IDEA.
  User: OIC-An
  Date: 2019/7/27
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <script src="static/js/jquery-3.4.1.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

    <h3 align="center">欢迎来到杰创人力资源管理系统！</h3>
    <a href="/employee/success">点击这儿</a>
    <form action="/employee/saveEmployee" method="post">
        ID：<input type="text" name="EId" /><br/>
        姓名：<input type="text" name="EName" /><br/>
        性别：<input type="text" name="Sex" /><br/>
        部门：<input type="text" name="Department" /><br/>
        <input type="submit" value="保存"/><br/>
    </form>

    <button class="btn btn-success">成功</button>
</body>
</html>
