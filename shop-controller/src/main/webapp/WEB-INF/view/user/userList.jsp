<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/ztree/css/zTreeStyle/zTreeStyle.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>

</head>
<body>
<nav class="navbar navbar-inverse ">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:skip()">信息列表</a>
        </div>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/product/toProductList.jhtml">产品管理</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/brand/toBrand.jhtml">品牌管理<span class="sr-only">(current)</span></a></li>
                <li><a href="/user/toUser.jhtml">用户管理</a></li>
                <li><a href="/log/toLog.jhtml">日志信息</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">java教程<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">云计算</a></li>
                        <li><a href="#">云应用</a></li>
                        <li><a href="#">云数据</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分布式开发</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">大数据挖掘</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="相关信息查询">
                </div>
                <button type="submit" class="btn btn-default">点击查询</button>
            </form>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-success">
                <div class="panel-heading">
                    部门信息展示
                    <div class="btn-group">
                        <form id="userForm" method="post">
                            <input type="hidden" name="sheetName">
                            <input type="hidden" name="cellIds">
                            <button type="button" class="btn btn-success" onclick="excelDept()">
                                <span class="glyphicon glyphicon-download-alt"></span>
                                按部门导出excel
                            </button>
                        </form>
                        <button type="button" class="btn btn-success" onclick="addDetpDialog()">
                            <span class="glyphicon glyphicon-plus"></span>
                            点击添加
                        </button>
                        <button class="btn btn-primary btn-info " onclick="updateDetpDialog()">
                            <span class="glyphicon glyphicon-pencil"></span>
                            修改
                        </button>
                        <button class="btn btn-primary btn-danger" onclick="delDetp()">
                            <span class="glyphicon glyphicon-remove"></span>
                            删除
                        </button>
                    </div>
                </div>
                <div class="panel-body">
                    <ul id="deptZtree" class="ztree"></ul>
                    <div id="ZtreeDiv" style="display: none">
                        <ul id="deptZtreeInfo" class="ztree"></ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-success">
                <div class="panel-heading">
                    用户表展示
                    <div class="btn-group">
                        <button class="btn btn-primary" onclick="findUserList()">
                            <span class="glyphicon glyphicon-zoom-in"></span>
                            查找账号
                        </button>
                        <button class="btn btn-default" type="button" onclick="resetUser()">
                            <span class="glyphicon glyphicon-refresh"></span>
                            重置
                        </button>
                    </div>
                    <button type="button" class="btn btn-info" onclick="addUserDialog()">
                        <span class="glyphicon glyphicon-plus"></span>
                        点击添加
                    </button>
                    <button type="button" class="btn btn-info" onclick="updateUserDept()">
                        <span class="glyphicon glyphicon-pencil"></span>
                        批量修改部门
                    </button>
                    <div class="btn-group">
                        <button class="btn btn-primary btn-danger">
                            <span class="glyphicon glyphicon-remove"></span>
                            <a href="javascript:deleteIds()">批量删除</a>
                        </button>
                    </div>
                </div>
                <div class="panel-heading">
                    <div class="col-md-6">
                        <input type="text" style="width: 200px" class="form-control" id="userName" placeholder="查找账户">
                        <input type="text" style="width: 200px" class="form-control" id="userRealName" placeholder="姓名">
                        未锁定<input type="radio" name="status" value="1">
                        锁定<input type="radio" name="status" value="2">
                        男<input type="radio" name="sex" value="1">
                        女<input type="radio" name="sex" value="2">
                    </div>
                    <div class="col-md-6">
                        生日
                        <div class="input-group">
                            <input type="text" class="form_date input-sm form-control" id="minBirthday"/>
                            <span class="input-group-addon">
                                        --
									</span>
                            <input type="text" class="form_date input-sm form-control" id="maxBirthday"/>
                        </div>
                        薪资
                        <div class="input-group">
                            <input type="text" class="input-sm form-control" id="minSelary"/>
                            <span class="input-group-addon">
                                        --
									</span>
                            <input type="text" class="input-sm form-control" id="maxSelary"/>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-success">
                                <span class="glyphicon glyphicon-pencil"></span>
                                <a href="javascript:resetStatus(1)">解锁账号</a>
                            </button>
                            <button class="btn btn-primary btn-danger">
                                <span class="glyphicon glyphicon-pencil"></span>
                                <a href="javascript:resetStatus(2)">锁定账号</a>
                            </button>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-primary btn-info " onclick="updateUserInfo()">
                                <span class="glyphicon glyphicon-pencil"></span>
                                修改
                            </button>
                            <button class="btn btn-primary btn-danger">
                                <span class="glyphicon glyphicon-remove"></span>
                                <a href="javascript:deleteUser()">删除</a>
                            </button>
                        </div>
                    </div>

                </div>
                <div class="panel-body">
                    <table id="userTable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>选择</th>
                            <th>账户</th>
                            <th>姓名</th>
                            <th>头像</th>
                            <th>性别</th>
                            <th>生日</th>
                            <th>部门</th>
                            <th>薪资</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>选择</th>
                            <th>账户</th>
                            <th>姓名</th>
                            <th>头像</th>
                            <th>性别</th>
                            <th>生日</th>
                            <th>部门</th>
                            <th>薪资</th>
                            <th>状态</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid" id="addUserDialog" style="display: none">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">添加用户表</div>
            <div class="panel-body">
                <form>
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th>
                                用户账户:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input class="form-control" id="addUserName" type="text" placeholder="用户名称。。"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                用户名称:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input class="form-control" id="addUserRealName" type="text" placeholder="真实姓名.."/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                用户头像:
                            </th>
                            <td>
                                <div class="form-group">
                                    <div class="col-md-8">
                                        <input id="uploadFile" name="uploadImgFile" type="file"/>
                                        <input id="filePath" type="hidden"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                用户密码:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input class="form-control" id="userPassword" type="password" placeholder="密码。。"/>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                性别:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    男<input type="radio" name="sex" value="1">
                                    女<input type="radio" name="sex" value="2">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                生日:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input type="text" class="form_datetime form-control" id="birthday"/>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                薪资:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input class="form-control" id="userSelary" type="text" placeholder="工资"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                相关部门:
                            </th>
                            <td>
                                <div class="col-lg-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="selectId" placeholder="">
                                        <span class="input-group-btn">
                                        <button class="btn btn-success" onclick="getZtree()" type="button">选择部门</button>
                                      </span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="col-md-3">

        </div>
    </div>
</div>
<div class="container-fluid" id="updateUserInfo" style="display: none">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">修改用户表</div>
            <div class="panel-body">
                <form>
                    <table class="table table-striped table-bordered">

                        <tr>
                            <th>
                                用户账户:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input class="form-control" id="toUserName" type="text" placeholder="填写用户名。。"/>
                                    <input id="toDeptId" type="hidden"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                用户名称:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input class="form-control" id="toUserRealName" type="text" placeholder="真实姓名。。"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                用户头像:
                            </th>
                            <td>
                                <div class="form-group">
                                    <div class="col-md-8">
                                        <input id="toUploadFile" name="uploadImgFile" type="file"/>
                                        <input id="toFilePath" type="hidden"/>
                                        <input id="toHeadPath" type="hidden"/>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                用户密码:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input class="form-control" id="toUserPassword" type="password" placeholder="不详！！"/>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                性别:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    男<input type="radio" name="updateSex" value="1">
                                    女<input type="radio" name="updateSex" value="2">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                生日:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input type="text" class="form_datetime form-control" id="toBirthday"/>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                薪资:
                            </th>
                            <td>
                                <div class="col-sm-6">
                                    <input class="form-control" id="toSelary" type="text" placeholder="工资。。"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                相关部门:
                            </th>
                            <td>
                                <div class="col-lg-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="toDeptName" placeholder="选择部门。。">
                                        <span class="input-group-btn">
                                        <button class="btn btn-success" onclick="updateZtree()"
                                                type="button">选择部门</button>
                                      </span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="col-md-3">

        </div>
    </div>
</div>
<div class="container-fluid" id="addDeptDiv" style="display: none">
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">部门管理添加</div>
                <div class="panel-body">
                    <form>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>
                                    部门名称:
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="deptName" placeholder="请输入..."/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="col-md-12">
                                        <textarea class="form-control" rows="4" cols="45" id="remark"
                                                  placeholder="请输入一些相关描述"></textarea>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3">

        </div>
    </div>
</div>

<div class="container-fluid" id="updateDeptDiv" style="display: none">
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">部门管理添加</div>
                <div class="panel-body">
                    <form>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>
                                    部门名称:
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="updateDeptName"
                                               placeholder="请输入..."/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="col-md-12">
                                        <textarea class="form-control" rows="4" cols="45" id="updateRemark"
                                                  placeholder="请输入一些相关描述"></textarea>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3">

        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/common/javaScript.jsp"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ztree/js/jquery.ztree.excheck.js"></script>
<script>
    $(function () {
        initUserTable();
        clickChecked("userTable");
        findDetpZtree();
        $(".form_date").datetimepicker({format: 'yyyy-mm-dd', language: 'zh-CN',});
    })

    function inituploadFile() {
        $("#uploadFile").fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload: false, //显示整体上传的按钮
            showRemove: false,//显示整体删除的按钮
            uploadUrl: "/file/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            enctype: 'multipart/form-data',
            allowedFileExtensions: ["jpg", "png", "gif", "docx", "zip", "xlsx", "txt"], /*上传文件格式限制*/
        }).on("fileuploaded", function (event, data, previewId, index) {
            console.log(data.response);
            $("#filePath", v_addUserDialog).val(data.response.message)
        });
    }

    function uploadFile(path) {
        $("#toUploadFile").fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload: false, //显示整体上传的按钮
            showRemove: false,//显示整体删除的按钮
            initialPreview:path,
            initialPreviewAsData: true,
            uploadUrl: "/file/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            enctype: 'multipart/form-data',
            allowedFileExtensions: ["jpg", "png", "gif", "docx", "zip", "xlsx", "txt"], /*上传文件格式限制*/
        }).on("fileuploaded", function (event, data, previewId, index) {
            $("#toFilePath", v_updateUserInfo).val(data.response.message)
        });
    }

    function resetUser() {
        ztreeIds = [];
        $("#userName").val("");
        $("#userRealName").val("");
        $("input[name='status']").val("");
        $("input[name='sex']").val("");
        $("#minBirthday").val("");
        $("#maxBirthday").val("");
        $("#minSelary").val("");
        $("#maxSelary").val("");
        var treeObj = $.fn.zTree.getZTreeObj("deptZtree");
        treeObj.cancelSelectedNode();
        findUserList();
    }

    function deleteIds() {
        var v_ids = v_rowIds.join(",");
        if (v_ids != null && v_ids != "") {
            bootbox.confirm({
                title: "提示信息",
                message: "您确认要删除吗?",
                size: "small",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if (result) {
                        $.ajax({
                            url: "<%=basePath%>/user/deleteIds.jhtml",
                            type: "post",
                            data: {
                                "ids": v_ids
                            },
                            success: function (result) {
                                if (result.code == 200) {
                                    findUserList()
                                } else {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: "<span class=\"glyphicon glyphicon-info-sign\"></span>删除失败",
                                        size: "small",
                                    });
                                }
                            },
                        })
                    }
                }
            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "<span class=\"glyphicon glyphicon-info-sign\"></span>至少选择一个",
                size: "small",
            });
        }
    }

    function deleteUser() {
        $("input[name='checkList']").each(function () {
            if (this.checked) {
                bootbox.confirm({
                    message: "您确认要删除吗?",
                    buttons: {
                        confirm: {
                            label: '确定',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: '取消',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {
                        if (result) {
                            $.ajax({
                                url: "<%=basePath%>/user/deleteUser.jhtml",
                                type: "post",
                                data: {
                                    "id": this.value
                                },
                                success: function (data) {
                                    if (data.code == 200) {
                                        findUserList()
                                    } else {
                                        bootbox.alert({
                                            title: "提示信息",
                                            message: "删除失败",
                                            size: "small",
                                        });
                                    }
                                },
                            })

                        }
                    }
                });
            } else {
                bootbox.alert({
                    title: "提示信息",
                    message: "请选择一个",
                    size: "small",
                });
                return false;
            }
        })
    }

    function resetStatus(flag) {
        $("input[name='checkList']").each(function () {
            if (this.checked) {
                $.ajax({
                    url: "<%=request.getContextPath()%>/user/resetStatus.jhtml",
                    type: "post",
                    data: {
                        "id": this.value,
                        "flag": flag
                    },
                    success: function (result) {
                        if (result.code == 200) {
                            findUserList();
                        } else {
                            bootbox.alert({
                                title: "提示信息",
                                message: "<span class=\"glyphicon glyphicon-info-sign\"></span>操作失败",
                                size: "small",
                            });
                        }
                    },
                })
            }
        })

    }


    var userTable;

    //展示userTable
    function initUserTable() {
        userTable = $('#userTable').DataTable(
            {
                "order": [],
                pageLength: 3,
                fixedHeader: true,
                fixedColumns: {
                    leftColumns: 0,
                    rightColumns: 1
                },
                lengthMenu: [
                    [3, 6, 9, -1],
                    ['3 条', '6 条', '9 条', '全部']
                ],
                language: {
                    url: "/datatable/Chinese.json"
                },
                "searching": false,
                "processing": true,
                "serverSide": true,
                "ajax": {
                    "url": "<%=request.getContextPath()%>/user/findUserList.jhtml",
                    "type": "POST",
                    "dataSrc": function (res) {
                        res.draw = res.data.draw;
                        res.recordsTotal = res.data.recordsTotal;
                        res.recordsFiltered = res.data.recordsFiltered;
                        return res.data.data;
                    }
                },
                "columns": [
                    {
                        "sClass": "text-center",
                        "data": "id",
                        "render": function (id) {
                            return '<input type="checkbox"  name="checkList"   value="' + id + '" />';
                        },
                        "bSortable": false,  //是否可以排序
                        'width': '5%'
                    },
                    {
                        "data": "userName",
                        "orderable": false
                    },
                    {
                        "data": "userRealName",
                        "orderable": false
                    },
                    {
                        "data": "headPath",
                        "render": function (headPath) {
                            return '<img src="' + headPath + '" class="img-rounded"  width="100px">';
                        },
                    },
                    {
                        "data": "sex",
                        "orderable": false,
                        "render": function (sex) {
                            return ('' + sex + '' == 1 ? "男" : "女");
                        },
                    },
                    {
                        "data": "birthday",
                        "render": function (data) {
                            //时间格式化
                            var date = new Date(data);
                            return date.toLocaleDateString();
                        }
                    },
                    {
                        "data": "deptName",
                        "orderable": false
                    },
                    {"data": "selary"},
                    {
                        "data": "status",
                        "orderable": false,
                        "render": function (status) {
                            return ('' + status + '' == 1 ? "未锁定" : "锁定");
                        },
                    },
                ],
                "drawCallback": function () {
                    $("#userTable tbody tr input[type='checkbox']").each(function () {
                        if (isExist(this.value)) {
                            this.checked = true
                            $(this).closest("tr").css("background", "gainsboro")
                        }
                    })
                },

            });

    }

    //dataTableAjax动态查询
    function findUserList() {
        var userInfo = {};
        userInfo.ids = ztreeIds.toString();
        userInfo.userName = $("#userName").val();
        userInfo.userRealName = $("#userRealName").val();
        userInfo.minBirthday = $("#minBirthday").val();
        userInfo.maxBirthday = $("#maxBirthday").val();
        userInfo.minSelary = $("#minSelary").val();
        userInfo.maxSelary = $("#maxSelary").val();
        userInfo.status = $("input[name='status']:checked").val();
        userInfo.sex = $("input[name='sex']:checked").val();
        userTable.settings()[0].ajax.data = userInfo;
        userTable.ajax.reload();

    }

    var nodesIds = [];

    //删除ztree节点同时删除对应用户信息
    function delDetp() {
        var treeObj = $.fn.zTree.getZTreeObj("deptZtree");
        var checked = treeObj.getSelectedNodes();
        if (checked.length > 0) {
            var nodes = treeObj.transformToArray(checked);
            for (var i = 0; i < nodes.length; i++) {
                if (!resTrue(nodes[i].id)) {
                    nodesIds.push(nodes[i].id)
                }
            }
            bootbox.confirm({
                message: "您确认要删除吗?",
                buttons: {
                    confirm: {
                        label: '确定',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if (result) {
                        $.ajax({
                            url: "<%=basePath%>/dept/deleteIds.jhtml",
                            type: "post",
                            data: {
                                "ids": nodesIds
                            },
                            success: function (data) {
                                if (data.code == 200) {
                                    for (var i = 0; i < nodes.length; i++) {
                                        treeObj.removeNode(nodes[i]);
                                    }
                                    findUserList();
                                } else {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: "删除失败",
                                        size: "small",
                                    });
                                }
                            },
                        })

                    }
                }
            });
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择一个",
                size: "small",
            });

        }

    }

    function resTrue(id) {
        for (var i = 0; i < nodesIds.length; i++) {
            if (nodesIds[i] == id) {
                return true;
            }
        }
    }

    //增加ztree
    function addDetpDialog() {
        var treeObj = $.fn.zTree.getZTreeObj("deptZtree");
        var checked = treeObj.getSelectedNodes();
        if (checked.length == 1) {
            var v_DeptDialog = bootbox.dialog({
                title: '提示信息！！',
                message: $("#addDeptDiv").html(),
                size: 'large',
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-plus"></span>点击添加',
                        className: 'btn-success',
                        callback: function (result) {
                            if (result) {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/dept/addDept.jhtml",
                                    type: "post",
                                    data: {
                                        "parentId": checked[0].id,
                                        "deptName": $("#deptName", v_DeptDialog).val(),
                                        "remark": $("#remark", v_DeptDialog).val()
                                    },
                                    success: function (result) {
                                        if (result.code == 200) {
                                            var dept = {};
                                            dept.deptName = $("#deptName", v_DeptDialog).val();
                                            dept.id = result.data
                                            dept.remark = $("#remark", v_DeptDialog).val()
                                            treeObj.addNodes(checked[0], dept);
                                        } else {
                                            bootbox.alert({
                                                title: "提示信息",
                                                message: "<span class=\"glyphicon glyphicon-info-sign\"></span>添加失败",
                                                size: "small",
                                            });
                                        }
                                    },
                                })
                            }
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger',
                    },
                },
            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择一个",
                size: "small",
            });
        }
    }

    var v_addUserDialog;

    //增加用户
    function addUserDialog() {
        var UserDialog = $("#addUserDialog").html();
        inituploadFile();
        $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd', language: 'zh-CN',});
        v_addUserDialog = bootbox.dialog({
            title: '提示信息！！',
            message: $("#addUserDialog form"),
            size: 'large',
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-plus"></span>点击添加',
                    className: 'btn-success',
                    callback: function (result) {
                        if (result) {
                            $.ajax({
                                url: "<%=request.getContextPath()%>/user/addUserDialog.jhtml",
                                type: "post",
                                data: {
                                    "userName": $("#addUserName", v_addUserDialog).val(),
                                    "userRealName": $("#addUserRealName", v_addUserDialog).val(),
                                    "password": hex_md5($("#userPassword", v_addUserDialog).val()),
                                    "sex": $("input[name='sex']:checked", v_addUserDialog).val(),
                                    "birthday": $("#birthday", v_addUserDialog).val(),
                                    "selary": $("#userSelary", v_addUserDialog).val(),
                                    "headPath": $("#filePath", v_addUserDialog).val(),
                                    "department.id": selectId,
                                },
                                success: function (result) {
                                    if (result.code == 200) {
                                        findUserList();
                                    } else {
                                        bootbox.alert({
                                            title: "提示信息",
                                            message: "<span class=\"glyphicon glyphicon-info-sign\"></span>添加失败",
                                            size: "small",
                                        });
                                    }
                                },
                            })
                        }
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger',
                },
            },
        })
        $("#addUserDialog").html(UserDialog)
    }

    var ztreeIds = []

    //动态模糊相关部门
    function zTreeOnClick(event, treeId, treeNode) {
        ztreeIds = []
        var treeObj = $.fn.zTree.getZTreeObj("deptZtree");
        var nodes = treeObj.transformToArray(treeNode);
        for (var i = 0; i < nodes.length; i++) {
            if (!resultTrue(nodes[i].id)) {
                ztreeIds.push(nodes[i].id)
            }
        }
        findUserList();
    };

    function resultTrue(id) {
        for (var i = 0; i < ztreeIds.length; i++) {
            if (ztreeIds[i] == id) {
                return true;
            }
        }
    }

    var v_updateUserInfo;

    //修改单个用户所有信息
    function updateUserInfo() {
        if (v_row.length == 0) {
            bootbox.alert({
                title: "提示信息",
                message: "请选择一个",
                size: "small",
            });
            return;
        }
        var v_updateUserDiv = $("#updateUserInfo").html();
        $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd', language: 'zh-CN',});
        $.ajax({
            url: "<%=request.getContextPath()%>/user/toUpdateUser.jhtml",
            type: "post",
            data: {
                "id": v_row[0],
            },
            success: function (data) {
                if (data.code == 200) {
                    var userInfo = data.data;
                        $("#toDeptName").val(userInfo.department.deptName),
                        $("#toUserName").val(userInfo.userName),
                        $("#toUserRealName").val(userInfo.userRealName),
                        $("input[name='updateSex'][value='" + data.data.sex + "']").attr("checked", true),
                        $("#toBirthday").val(userInfo.birthdayStr),
                        $("#toSelary").val(userInfo.selary)
                        $("#toHeadPath").val(userInfo.headPath)
                        $("#toDeptId").val(userInfo.department.id)
                        var pathArr=[];
                        pathArr.push(userInfo.headPath);
                        uploadFile(pathArr)
                    v_updateUserInfo = bootbox.dialog({
                        title: '提示信息！！',
                        message: $("#updateUserInfo form"),
                        size: 'large',
                        onEscape: true,
                        backdrop: true,
                        buttons: {
                            confirm: {
                                label: '<span class="glyphicon glyphicon-plus"></span>点击修改',
                                className: 'btn-success',
                                callback: function (result) {
                                    if (result) {
                                        $.ajax({
                                            url: "<%=request.getContextPath()%>/user/updateUserInfo.jhtml",
                                            type: "post",
                                            data: {
                                                "id": userInfo.id,
                                                "userName": $("#toUserName", v_updateUserInfo).val(),
                                                "userRealName": $("#toUserRealName", v_updateUserInfo).val(),
                                                "password": hex_md5($("#toUserPassword", v_updateUserInfo).val()),
                                                "sex": $("input[name='updateSex']:checked", v_updateUserInfo).val(),
                                                "birthday": $("#toBirthday", v_updateUserInfo).val(),
                                                "selary": $("#toSelary", v_updateUserInfo).val(),
                                                "headPath": $("#toFilePath", v_updateUserInfo).val(),
                                                "toHeadPath": $("#toHeadPath", v_updateUserInfo).val(),
                                                "department.id": $("#toDeptId", v_updateUserInfo).val(),
                                            },

                                            success: function (result) {
                                                if (result.code == 200) {
                                                    findUserList();
                                                } else {
                                                    bootbox.alert({
                                                        title: "提示信息",
                                                        message: "<span class=\"glyphicon glyphicon-info-sign\"></span>添加失败",
                                                        size: "small",
                                                    });
                                                }
                                            },
                                        })
                                    }
                                }
                            },
                            cancel: {
                                label: '<span class="glyphicon glyphicon-remove"></span>取消',
                                className: 'btn-danger',
                            }
                        },

                    })
                    $("#updateUserInfo").html(v_updateUserDiv);
                } else {
                    bootbox.alert({
                        title: "提示信息",
                        message: "<span class=\"glyphicon glyphicon-info-sign\"></span>修改失败",
                        size: "small",
                    });
                }
            },
        })

    }

    //加载Ztree
    function findDetpZtree() {

        var setting = {
            callback: {
                onClick: zTreeOnClick
            },
            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "parentId"
                },
                key: {
                    name: "deptName"
                }
            }
        };
        $.ajax({
            url: "<%=request.getContextPath()%>dept/findDeptZtree.jhtml",
            type: "post",
            success: function (result) {
                if (result.code == 200) {
                    $.fn.zTree.init($("#deptZtree"), setting, result.data);
                }

            }
        })
    }

    //加载DialogZtree
    var selectId;

    function getZtree() {
        var ztreeUl = $("#ZtreeDiv").html();
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "parentId"
                },
                key: {
                    name: "deptName"
                }
            }
        };
        $.ajax({
            url: "<%=request.getContextPath()%>dept/findDeptZtree.jhtml",
            type: "post",
            success: function (result) {
                if (result.code == 200) {
                    $.fn.zTree.init($("#deptZtreeInfo"), setting, result.data);
                    bootbox.dialog({
                        title: '提示信息！！',
                        message: $("#deptZtreeInfo"),
                        size: 'small',
                        onEscape: true,
                        backdrop: true,
                        buttons: {
                            confirm: {
                                label: '<span class="glyphicon glyphicon-plus"></span>点击添加',
                                className: 'btn-success',
                                callback: function (result) {
                                    if (result) {
                                        var treeObj = $.fn.zTree.getZTreeObj("deptZtreeInfo");
                                        var checked = treeObj.getSelectedNodes();
                                        $("#selectId", v_addUserDialog).val(checked[0].deptName)
                                        selectId = checked[0].id;
                                    }
                                }
                            },
                            cancel: {
                                label: '<span class="glyphicon glyphicon-remove"></span>取消',
                                className: 'btn-danger',
                            }
                        },

                    })
                    $("#ZtreeDiv").html(ztreeUl);
                }

            }
        })
    }

    //修改部门Ztree
    function updateDetpDialog() {
        var treeObj = $.fn.zTree.getZTreeObj("deptZtree");
        var checked = treeObj.getSelectedNodes();
        $("#updateDeptName").attr("value", checked[0].deptName);
        $("#updateRemark").html(checked[0].remark);
        if (checked.length == 1) {
            var v_DeptDialog = bootbox.dialog({
                title: '提示信息！！',
                message: $("#updateDeptDiv").html(),
                size: 'large',
                onEscape: true,
                backdrop: true,
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-plus"></span>点击修改',
                        className: 'btn-success',
                        callback: function (result) {
                            if (result) {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/dept/updateDept.jhtml",
                                    type: "post",
                                    data: {
                                        "id": checked[0].id,
                                        "deptName": $("#updateDeptName", v_DeptDialog).val(),
                                        "remark": $("#updateRemark", v_DeptDialog).val()
                                    },
                                    success: function (result) {
                                        if (result.code == 200) {
                                            checked[0].deptName = $("#updateDeptName", v_DeptDialog).val();
                                            checked[0].id = checked[0].id;
                                            checked[0].remark = $("#updateRemark", v_DeptDialog).val();
                                            treeObj.updateNode(checked[0]);
                                        } else {
                                            bootbox.alert({
                                                title: "提示信息",
                                                message: "<span class=\"glyphicon glyphicon-info-sign\"></span>添加失败",
                                                size: "small",
                                            });
                                        }
                                    },
                                })
                            } else {

                            }
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger',
                        callback: function () {
                            return false;
                        }
                    }
                },

            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择一个",
                size: "small",
            });
        }


    }

    //批量修改用户部门
    function updateUserDept() {
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "parentId"
                },
                key: {
                    name: "deptName"
                }
            }
        };

        $.ajax({
            url: "<%=request.getContextPath()%>dept/findDeptZtree.jhtml",
            type: "post",
            success: function (result) {
                if (result.code == 200) {
                    $.fn.zTree.init($("#deptZtreeInfo"), setting, result.data);
                    bootbox.dialog({
                        title: '提示信息！！',
                        message: $("#deptZtreeInfo"),
                        size: 'small',
                        onEscape: true,
                        backdrop: true,
                        buttons: {
                            confirm: {
                                label: '<span class="glyphicon glyphicon-plus"></span>点击添加',
                                className: 'btn-success',
                                callback: function (result) {
                                    if (result) {
                                        var treeObj = $.fn.zTree.getZTreeObj("deptZtreeInfo");
                                        var checked = treeObj.getSelectedNodes();
                                        $.ajax({
                                            url: "<%=request.getContextPath()%>/user/updateUserDept.jhtml",
                                            type: "post",
                                            data: {
                                                "department.id": checked[0].id,
                                                "ids": v_row.toString()
                                            },
                                            success: function (result) {
                                                if (result.code == 200) {
                                                    findUserList();
                                                } else {
                                                    bootbox.alert({
                                                        title: "提示信息",
                                                        message: "<span class=\"glyphicon glyphicon-info-sign\"></span>添加失败",
                                                        size: "small",
                                                    });
                                                }
                                            },
                                        })
                                    }
                                }
                            },
                            cancel: {
                                label: '<span class="glyphicon glyphicon-remove"></span>取消',
                                className: 'btn-danger',
                            }
                        },

                    })
                    $("#ZtreeDiv").html(ztreeUl);
                }

            }
        })
    }

    function updateZtree() {
        var ztreeUl = $("#ZtreeDiv").html();
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "parentId"
                },
                key: {
                    name: "deptName"
                }
            }
        };
        $.ajax({
            url: "<%=request.getContextPath()%>dept/findDeptZtree.jhtml",
            type: "post",
            success: function (result) {
                if (result.code == 200) {
                    $.fn.zTree.init($("#deptZtreeInfo"), setting, result.data);
                    bootbox.dialog({
                        title: '提示信息！！',
                        message: $("#deptZtreeInfo"),
                        size: 'small',
                        onEscape: true,
                        backdrop: true,
                        buttons: {
                            confirm: {
                                label: '<span class="glyphicon glyphicon-plus"></span>点击添加',
                                className: 'btn-success',
                                callback: function (result) {
                                    if (result) {
                                        var treeObj = $.fn.zTree.getZTreeObj("deptZtreeInfo");
                                        var checked = treeObj.getSelectedNodes();
                                        if (checked.length == 1) {
                                            $("#toDeptName", v_updateUserInfo).val(checked[0].deptName)
                                            selectId = checked[0].id;
                                        }
                                    }
                                }
                            },
                            cancel: {
                                label: '<span class="glyphicon glyphicon-remove"></span>取消',
                                className: 'btn-danger',
                            }
                        },

                    })
                    $("#ZtreeDiv").html(ztreeUl);
                }

            }
        })

    }

    var sheetName = "";
    var cellIds = "";
    function excelDept() {
        sheetName = "";
        cellIds = "";
        var treeObj = $.fn.zTree.getZTreeObj("deptZtree");
        var checked = treeObj.getSelectedNodes();
        if (checked.length == 1) {
            var nodes = treeObj.getNodesByParam("parentId", checked[0].id);
            for (var i = 0; i < nodes.length; i++) {
                var sheetIds = [];
                sheetName += nodes[i].deptName + ",";
                var cellId = treeObj.transformToArray(nodes[i]);
                for (var j = 0; j < cellId.length; j++) {
                    sheetIds.push(cellId[j].id)
                }
                cellIds += sheetIds.join(",") + ";";
            }
            $("input[name='sheetName']").val(sheetName)
            $("input[name='cellIds']").val(cellIds)
            var userForm = document.getElementById("userForm");
            userForm.action = "<%=basePath%>/user/excelDept.jhtml"
            userForm.submit();
        }
    }

</script>
</body>
</html>