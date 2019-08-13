<%--
  Created by IntelliJ IDEA.
  User: OIC-An
  Date: 2019/7/27
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>员工信息页面</title>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container-fluid">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>成功！来这里修改信息</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-info">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>员工ID</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>部门</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.EId }</th>
                            <th>${emp.EName }</th>
                            <th>${emp.sex=="M"?"Male":"Female" }</th>
                            <th>${emp.department }</th>
                            <th>
                                <button class="btn btn-info btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                当前第${pageInfo.pageNum}页，一共${pageInfo.pages}页，总共${pageInfo.total}条记录
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <%--首页按钮逻辑--%>
                        <c:if test="${pageInfo.isFirstPage}">
                            <li  class="disabled"><a href="#">首页</a></li>
                        </c:if>
                        <c:if test="${!pageInfo.isFirstPage}">
                            <li><a href="${APP_PATH}/employee/success?pn=1">首页</a></li>
                        </c:if>

                        <%--上一页按钮逻辑--%>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/employee/success?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <%--页数按钮逻辑--%>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num==pageInfo.pageNum}">
                                <li class="active"><a href="#">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num!=pageInfo.pageNum}">
                                <li><a href="${APP_PATH}/employee/success?pn=${page_Num}">${page_Num}</a></li>
                            </c:if>
                        </c:forEach>

                        <%--下一页按钮逻辑--%>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/employee/success?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <%--末页按钮逻辑--%>
                        <c:if test="${pageInfo.isLastPage}">
                            <li  class="disabled"><a href="#">末页</a></li>
                        </c:if>
                        <c:if test="${!pageInfo.isLastPage}">
                            <li><a href="${APP_PATH}/employee/success?pn=${pageInfo.pages}">末页</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
