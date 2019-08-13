<%--
  Created by IntelliJ IDEA.
  User: OIC-An
  Date: 2019/8/5
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<!-- 员工添加的模态框 -->
<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="EName" class="form-control" id="empName_add_input" placeholder="张三">
                            <span id="eName_add_span" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="Sex" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="Sex" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select name="Department" class="form-control" id="select_add_depts">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_add_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 员工修改的模态框 -->
<div class="modal fade" id="emp_modify_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_modify_input"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="Sex" id="sel_male" value="男"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="Sex" id="sel_female" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select name="Department" class="form-control" id="select_modify_depts">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_modify_save_btn">修改</button>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>成功！来这里修改信息</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-info" id="emp_add_modal_btn">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增
            </button>
            <button class="btn btn-danger" id="emp_delete_all_btn">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all"/></th>
                        <th>员工ID</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>部门</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
</div>
<script type="text/javascript">
    var total, currentPage;
    var iniAdd=true, iniModify=true, nameTrue=false;
    //1.页面加载完成以后，直接去发送ajax请求，得到分页数据
    $(document).ready((function () {
        to_page(1);
    }));
    
    //完成全选框的逻辑
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //全选框的状态随单个单选框的选定总数变化
    $(document).on("click", ".check_item", function () {
        //如果都选中，则全选框也变为选中
        var chooseAll = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked", chooseAll);
    });
    
    //批量删除按钮添加事件
    $("#emp_delete_all_btn").click(function () {
        var ids="", names="";
        $.each($(".check_item:checked"), function () {
            ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            names+=$(this).parents("tr").find("td:eq(2)").text()+"，";
        });
        ids=ids.substring(0,ids.length-1);
        if(confirm("将要删除"+names+"是否确认?所有ID序列为"+ids)){
            $.ajax({
                url:"${APP_PATH}/employee/"+ids,
                type:"DELETE",
                success:function (result) {
                    to_page(currentPage);
                }
            });
        }
    });

    //新增按钮绑定模态框
    $("#emp_add_modal_btn").click(function () {
        //输入员工姓名的表单重置
        $("#empName_add_input").val("");
        $("#emp_add_modal").find("*").removeClass("has-success has-error");
        $("#emp_add_modal").find(".help-block").text("");
        //发送ajax，查出部门信息，显示在下拉列表中
        if(iniAdd){
            getDepts("#select_add_depts");
            iniAdd = false;
        }

        //弹出模态框
        $("#emp_add_modal").modal({
            backdrop:"static"
        })
    });

    //绑定姓名栏内容改变时动态检验
    validate_input("#empName_add_input");
    //下面这个是个静态组件，尴尬
    //validate_input("#empName_modify_input");

    //模态框中保存按钮绑定事件，添加员工
    $("#emp_add_save_btn").click(function () {
        //1.模态框中填写的表单数据交给服务器进行保存
        //2.校验成功后发送ajax请求保存员工
        if(nameTrue){
            $.ajax({
                url:"${APP_PATH}/employee/saveEmployee",
                type:"POST",
                data:$("#emp_add_modal form").serialize(),
                success:function (result) {
                    //如果返回状态码100表示校验成功，否则失败
                    if ((result.code)==100){
                        //保存成功后,nameTrue置为false，并清除合格样式
                        nameTrue=false;
                        //成功后先关闭模态框
                        $("#emp_add_modal").modal("hide");
                        //显示最后一页数据，查看保存效果
                        to_page(total);
                    }else{
                        show_valid("#empName_add_input", "error", result.extend.errorFields.EName);
                    }
                }
            });
        }else{
            show_valid("#empName_add_input", "error", "请输入正确的姓名！")
        }
    });

    //每一栏的员工删除按钮新增事件
    $(document).on("click", ".delete_btn", function () {
        var emp_id=$(this).attr("delete_id");
        var emp_name=$(this).attr("delete_name");
        if (confirm("确认要删除id号为"+emp_id+"，姓名为"+emp_name+"的员工吗")){
            $.ajax({
                url:"${APP_PATH}/employee/"+emp_id,
                type:"DELETE",
                success:function (result) {
                    to_page(currentPage);
                }
            });
        };
    });

    //每一栏的员工编辑按钮新增事件
    $(document).on("click", ".edit_btn", function () {
        if(iniModify){
            getDepts("#select_modify_depts");
            iniModify = false;
        }
        getEmp($(this).attr("edit_id"));
        //给修改按钮传递id值
        $("#emp_modify_save_btn").attr("emp_id", $(this).attr("edit_id"));
    });

    //编辑模态框中的修改按钮绑定事件
    $("#emp_modify_save_btn").click(function () {
        //1.模态框中填写的表单数据交给服务器进行保存
            $.ajax({
                url:"${APP_PATH}/employee/"+$(this).attr("emp_id"),
                type:"PUT",
                data:$("#emp_modify_modal form").serialize(),
                success:function (result) {
                    //如果返回状态码100表示校验成功，否则失败
                    if ((result.code)==100){
                        //成功后先关闭模态框
                        $("#emp_modify_modal").modal("hide");
                        //跳转到当前页面，查看修改后的效果
                        to_page(currentPage);
                    }
                }
            });
    });
    
    //查询单个员工信息并显示的方法
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/employee/"+id,
            type:"GET",
            success:function (result) {
                //将各组件属性值设为修改之前的值
                var empData=result.extend.employee;
                $("#empName_modify_input").text(empData.ename);
                $("#emp_modify_modal input[name=Sex]").val([empData.sex]);
                $("#emp_modify_modal select").val([empData.department]);
            }
        });
        $("#emp_modify_modal").modal({
            backdrop:"static"
        });
    }

    //为ele元素绑定动态检验事件
    function validate_input(ele) {
        $(ele).change(function () {
            var empName = this.value;
            $.ajax({
                url:"${APP_PATH}/employee/checkUser",
                data:"EName="+empName,
                type:"POST",
                success:function (result) {
                    if (result.code==100){
                        if(validate_add_form(ele))
                            nameTrue=true;
                        else nameTrue=false;
                    }else{
                        nameTrue=false;
                        show_valid("#empName_add_input", "error", "名称已存在！请使用姓名后面加数字的格式！");
                    }
                }
            });
        });
    }
    
    //校验表单数据格式规范性
    function validate_add_form(ele) {
        //1.拿到要校验的数据，使用正则表达式
        var empName = $(ele).val();
        var regName = /(^[A-Za-z0-9]{6,16}$)|(^[\u4E00-\u9FA50-9_]{2,6})/;
        if(regName.test(empName)){
            show_valid("#empName_add_input", "success","姓名可用");
            return true;
        }else{
            show_valid("#empName_add_input", "error","姓名格式有误，规定为6-16位的英文数字组合或者2-6位中文数字组合，请检查后重新输入！");
            return false;
        }
    }

    //对输入栏的内容进行校验后的样式改变
    function show_valid(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        //如果校验成功
        if(status == "success"){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if(status == "error"){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //查出所有的部门信息
    function getDepts(ele) {
        $.ajax({
            url:"${APP_PATH}/department/depts",
            type:"GET",
            success:function (result) {
                var depts = result.extend.depts;
                $.each(depts, function () {
                   var optionEle = $("<option></option>").append(this.dname);
                    $(ele).append(optionEle);
                });
            }
        });
    }

    //跳转到对应页面的函数
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/employee/test",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                currentPage=pn;
                //1.解析并显示员工信息
                build_emps_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //产生员工表格体的函数
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var pageInfo = result.extend.pageInfo;
        var emps = pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBox = $("<td></td>").append($("<input type='checkbox'/>").addClass("check_item"));
            var empId = $("<td></td>").append(item.eid);
            var empNameTd = $("<td></td>").append(item.ename);
            var empSexTd = $("<td></td>").append(item.sex);
            var departmentTd = $("<td></td>").append(item.department);
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil").attr("arid-hidden","true"))
                .append(" 编辑");
            //为edit添加属性edit_id，保存该位置员工的id值
            editBtn.attr("edit_id", item.eid);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash").attr("arid-hidden","true"))
                .append(" 删除");
            //为delete添加属性delete_id，保存该位置员工的id值
            deleteBtn.attr("delete_id", item.eid);
            //为delete添加属性delete_name,保存该员工的姓名
            deleteBtn.attr("delete_name", item.ename);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            $("<tr></tr>").append(checkBox)
                .append(empId)
                .append(empNameTd)
                .append(empSexTd)
                .append(departmentTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    //解析显示分页信息的函数
    function build_page_info(result) {
        $("#page_info_area").empty();
        var pageInfo = result.extend.pageInfo;
        total = pageInfo.total;
        $("#page_info_area").append("当前"+pageInfo.pageNum+"页，一共"+pageInfo.pages+"页，总"+pageInfo.total+"条记录");
    }

    //解析并显示分页条的函数
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var pageInfo = result.extend.pageInfo;
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#")).click(function () {
            to_page(1);
        });
        var prePageLi = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Previous")
            .append($("<span></span>").attr("aria-hidden","true").append("&laquo;")));
        //如果没有前一页，添加逻辑
        if(pageInfo.hasPreviousPage == false){
            prePageLi.addClass("disabled");
        }else{
            prePageLi.click(function () {
                to_page(pageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Next")
            .append($("<span></span>").attr("aria-hidden","true").append("&raquo;")));
        //如果没有后一页，添加逻辑
        if(pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                to_page(pageInfo.pageNum + 1);
            })
        }
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#")).click(function () {
            to_page(pageInfo.pages);
        });
        //添加首页和前一页
        var ul = $("<ul></ul>").addClass("pagination").append(firstPageLi).append(prePageLi);

        $.each(pageInfo.navigatepageNums, function (index, item) {
            //添加具体页码
            var pageLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if(item==pageInfo.pageNum)
                pageLi.addClass("active");
            pageLi.click(function () {
                to_page(item);
            });
            ul.append(pageLi);
        });
        //添加下一页和末页
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul).attr("aria-label", "Page navigation");
        $("#page_nav_area").append(navEle);
    }
</script>
</body>
</html>
