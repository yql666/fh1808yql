<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>会员展示</title>
    <link rel="stylesheet" href="/ztree/css/zTreeStyle/zTreeStyle.css">
    <style>
        body {
            padding-top: 55px;
        }
    </style>
</head>
<body>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div style="display: none">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        省市县
                    </div>
                    <div class="panel-body">
                        <ul id="areaZtree" class="ztree"></ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <form class="form-horizontal" role="form">
                <fieldset>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">账户</label>
                        <div class="col-sm-4">
                            <input class="form-control" id="userName" type="text"/>
                        </div>
                        <label class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <input type="text" class="form_date input-sm form-control" id="minBirthday"/>
                                <span class="input-group-addon">
                                        --
									</span>
                                <input type="text" class="form_date input-sm form-control" id="maxBirthday"/>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group">
                    <div class="col-md-10" id="selectTd">
                        <label class="col-sm-2 control-label">省市县</label>

                    </div>
                </div>
                <div class="clearfix form-actions" style="text-align:center">
                    <button class="btn btn-success" type="button" onclick="findMember()">
                        <i class="glyphicon glyphicon-ok"></i>
                        点击查询
                    </button>
                    <button class="btn btn-default" type="reset">
                        <i class="glyphicon glyphicon-refresh"></i>
                        重置
                    </button>
                </div>
            </form>
            <br/>
            <div class="panel panel-success">
                <div class="panel-heading">用户信息表</div>
                <div class="panel-body">
                    <table id="tableId" class="table table-striped table-bordered" width="100%">
                        <thead>
                        <tr>
                            <th>账户</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>生日</th>
                            <th>地区</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>账户</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>生日</th>
                            <th>地区</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>
<div class="container-fluid" id="updateMember" style="display: none" >
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">会员修改</div>
                <div class="panel-body">
                    <form>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>
                                    账号:
                                </th>
                                <td>
                                    <div class="col-md-10">
                                        <input class="form-control" id="memberName" type="text" placeholder="账号。。"/>
                                        <input id="areaIds" type="hidden" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    密码:
                                </th>
                                <td>
                                    <div class="col-sm-10">
                                        <input class="form-control" id="password" type="password" placeholder="密码。。"/>
                                        <input class="form-control" id="pwd" type="hidden"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    手机号:
                                </th>
                                <td>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="phone" placeholder="手机号..">
                                            <span class="input-group-btn">
                                            <button class="btn btn-success" type="button">
                                                    <span onclick="getCode()" id="codeTime">发送验证码</span>
                                            </button>
                                        </span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    验证码:
                                </th>
                                <td>
                                    <div class="col-md-6">
                                        <input class="form-control" id="code" type="text" placeholder="输入验证码"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>省市县</th>
                                <td id="updateSelect">
                                    <div class="col-sm-10" >
                                        <div class="input-group" id="areaNameDiv">
                                            <input type="text" class="form-control" id="areaName" readonly="true" >
                                            <span class="input-group-btn">
                                            <button class="btn btn-success" type="button">
                                                    <span onclick="getSelect()">点击编辑进行修改</span>
                                            </button>
                                        </span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    邮箱:
                                </th>
                                <td>
                                    <div class="col-md-10">
                                        <input class="form-control" id="email" type="email" placeholder="邮箱。。"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    生日:
                                </th>
                                <td>
                                    <div class="col-md-10">
                                        <input type="text" class="form_date form-control" id="birthday"/>
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
<jsp:include page="/WEB-INF/common/javaScript.jsp"></jsp:include>
<script type="text/javascript" src="/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript">
    $(function () {
        findArea();
        dataTable();
        $(".form_date").datetimepicker({format: 'yyyy-mm-dd', language: 'zh-CN',});
    })

    var i = 30;

    function countDown() {
        i = i - 1;
        $("#codeTime").attr("onclick", "").html(i + "秒后重新发送");
        if (i == 0) {
            $("#codeTime").attr("onclick", "getCode()").html("重新发送");
            i = 30;
            return;
        }
        setTimeout('countDown()', 1000);
    }

    function getCode() {
        var v_phone = $("#phone").val();
        if (v_phone.length == 11) {
            countDown();
            $.ajax({
                url: "http://localhost:8083/api/member/findUserByPhone.jhtml",
                data: {"phone": v_phone},
                dataType: "jsonp",
                success: function (result) {
                    if (result.code == 200) {
                        $.ajax({
                            url: "/member/sendCode.jhtml",
                            data: {
                                "phone": v_phone
                            },
                            type: "post",
                            success: function (result) {
                                if (result.code == 200) {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: "<span class=\"glyphicon glyphicon-ok\"></span>发送成功，请等待",
                                        size: "small",
                                    });
                                } else {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: "<span class=\"glyphicon glyphicon-remove\"></span>服务器繁忙！！！",
                                        size: "small",
                                    });
                                }
                            }
                        })
                    }
                }
            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "<span class=\"glyphicon glyphicon-remove\"></span>手机号码不合法！！",
                size: "small",
            });
        }
    }
    var setting = {
        data: {
            simpleData: {
                enable: true,
                pIdKey: "pid"
            },
            key: {
                name: "areaName"
            }
        }
    };

    function findArea(id, obj) {
        if (obj) {
            $(obj).parent().nextAll().remove();
        }
        if (id) {
            var treeObj = $.fn.zTree.getZTreeObj("areaZtree");
            var nodes = treeObj.getNodesByParam("pid", id);
            if (nodes.length == 0) {
                return;
            }
            var v_select = "<div class='col-md-3'>" +
                "<select class='form-control' onchange='findArea(this.value,this)' name='selectName'>" +
                "<option value='-1'>--请选择--</option>";
            for (var i = 0; i < nodes.length; i++) {
                v_select += "<option  value='" + nodes[i].id + "'>" + nodes[i].areaName + "</option>";
            }
            v_select += "</select></div>"
            $("#selectTd").append(v_select);
            return;
        }
        $.ajax({
            url: "http://localhost:8083/api/area/findAreaApi.jhtml",
            dataType: "jsonp",
            success: function (result) {
                if (result.code == 200) {
                    $.fn.zTree.init($("#areaZtree"), setting, result.data);
                    var v_select = "<div class='col-md-3'>" +
                        "<select class='form-control' onchange='findArea(this.value,this)' name='selectName'>" +
                        "<option value='-1'>--请选择--</option>";
                    for (var i = 0; i < result.data.length; i++) {
                        if (result.data[i].areaType == 1) {
                            v_select += "<option  value='" + result.data[i].id + "'>" + result.data[i].areaName + "</option>";
                        }
                    }
                    v_select += "</select></div>"
                    $("#selectTd").append(v_select);
                }
            }
        })
    }

    function getSelect(id, obj) {
        $("#areaNameDiv",v_memberDialog).hide();
        if (obj) {
            $(obj).parent().nextAll().remove();
        }
        if (id) {
            var treeObj = $.fn.zTree.getZTreeObj("areaZtree");
            var nodes = treeObj.getNodesByParam("pid", id);
            if (nodes.length == 0) {
                return;
            }
            var v_select = "<span><div class='col-md-3'>" +
                "<select class='form-control' onchange='getSelect(this.value,this)' name='selectName'>" +
                "<option value='-1'>--请选择--</option>";
            for (var i = 0; i < nodes.length; i++) {
                v_select += "<option  value='" + nodes[i].id + "'>" + nodes[i].areaName + "</option>";
            }
            v_select += "</select></div>"
            $("#updateSelect",v_memberDialog).append(v_select+"<div class='btn-group'><button type='button' onclick='showDiv(this)' class='btn btn-primary btn-danger' >"
                + "<span class='glyphicon glyphicon-remove'></span>退出</button></div></span>");
            return;
        }
        $.ajax({
            url: "http://localhost:8083/api/area/findAreaApi.jhtml",
            dataType: "jsonp",
            success: function (result) {
                if (result.code == 200) {
                    $.fn.zTree.init($("#areaZtree"), setting, result.data);
                    var v_select = "<span><div class='col-md-3'>" +
                        "<select class='form-control' onchange='getSelect(this.value,this)' name='selectName'>" +
                        "<option value='-1'>--请选择--</option>";
                    for (var i = 0; i < result.data.length; i++) {
                        if (result.data[i].areaType == 1) {
                            v_select += "<option  value='" + result.data[i].id + "'>" + result.data[i].areaName + "</option>";
                        }
                    }
                    v_select += "</select></div>"
                    $("#updateSelect",v_memberDialog).append(v_select+"<div class='btn-group'><button type='button' onclick='showDiv(this)' class='btn btn-primary btn-danger' >"
                    + "<span class='glyphicon glyphicon-remove'></span>退出</button></div></span>");
                }
            }
        })
    }

    function showDiv(obj){
        $("#areaNameDiv",v_memberDialog).show();
        $(obj).closest("span").remove();
    }

    var tableId;
    function dataTable() {
        tableId = $('#tableId').DataTable({
            "searching": false,
            "ordering": false,
            pageLength: 3,　//初始化显示几条数据
            fixedHeader: true,　//这个是用来固定头部
            fixedColumns: { //这个是用来固定列的
                leftColumns: 0,
                rightColumns: 1
            },
            lengthMenu: [　//显示几条数据设置
                [3, 30, 45, -1],
                ['3 条', '30 条', '45 条', '全部']
            ],
            language: {
                url: "/datatable/Chinese.json"
            },
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "/member/findMemberList.jhtml",
                "type": "POST",
                "dataSrc": function (res) {
                    res.draw = res.data.draw;
                    res.recordsTotal = res.data.recordsTotal;
                    res.recordsFiltered = res.data.recordsFiltered;
                    return res.data.data;
                }
            },
            "columns": [
                {"data": "userName"},
                {"data": "phone"},
                {"data": "email"},
                {
                    "data": "birthday",
                    "render": function (data) {
                        //时间格式化
                        var date = new Date(data);
                        return date.toLocaleDateString();
                    }
                },
                {"data": "areaName"},
                {
                    "data": "id",
                    "render": function (id) {
                        return "<div class='btn-group'><button type='button' onclick='findUserById(" + id + ")' class='btn btn-primary btn-info' >"
                            + "<span class='glyphicon glyphicon-pencil'></span>修改</button></div>";
                    }
                },

            ],
        });
    }

    var v_memberDialog;
    var v_areaName = "";
    var v_areaIds = "";
    function findUserById(id) {
        v_areaName = "";
        v_areaIds = "";
        $(".form_date").datetimepicker({format: 'yyyy-mm-dd', language: 'zh-CN',});
        var v_updateMember = $("#updateMember").html();
        $.ajax({
            url: "http://localhost:8083/api/member/findUserById.jhtml",
            dataType: "jsonp",
            data: {
                "id": id,
            },
            success: function (data) {
                if (data.code == 200) {
                    var member = data.data;
                        $("#memberName").val(member.userName),
                        $("#pwd").val(member.password),
                        $("#phone").val(member.phone),
                        $("#areaName").val(member.areaName),
                        $("#areaIds").val(member.areaIds),
                        $("#email").val(member.email),
                        $("#birthday").val(member.birthdayStr),
                        v_memberDialog = bootbox.dialog({
                            title: '提示信息！！',
                            message: $("#updateMember form"),
                            size: 'large',
                            onEscape: true,
                            backdrop: true,
                            buttons: {
                                confirm: {
                                    label: '<span class="glyphicon glyphicon-plus"></span>点击修改',
                                    className: 'btn-success',
                                    callback: function (result) {
                                        if (result) {
                                            $("select[name='selectName']").each(function () {
                                                if(this.value!=-1){
                                                    v_areaName += this.options[this.selectedIndex].text
                                                    v_areaIds +="," + this.value;
                                                }
                                            })
                                            if(v_areaIds.length>0){
                                                v_areaIds=v_areaIds.substring(1);
                                            }else {
                                                v_areaName= member.areaName;
                                                v_areaIds=member.areaIds;
                                            }
                                            $.ajax({
                                                url: "/member/updateMember.jhtml",
                                                type: "post",
                                                data: {
                                                    "id": id,
                                                    "userName": $("#memberName", v_memberDialog).val(),
                                                    "password": $("#password", v_memberDialog).val(),
                                                    "pwd": $("#pwd", v_memberDialog).val(),
                                                    "phone": $("#phone", v_memberDialog).val(),
                                                    "email": $("#email", v_memberDialog).val(),
                                                    "birthday": $("#birthday", v_memberDialog).val(),
                                                    "areaName": v_areaName,
                                                    "areaIds": v_areaIds
                                                },
                                                success: function (result) {
                                                    if (result.code == 200) {
                                                        findMember(1);
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
                                }
                            },

                        })
                    $("#updateMember").html(v_updateMember);
                    $(".form_date").datetimepicker({format: 'yyyy-mm-dd', language: 'zh-CN',});
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
    var v_ids="";
    function findMember(id) {
        if(id!=1){
            v_ids = "";
            $("select[name='selectName']").each(function(){
                if(this.value!=-1){
                    v_ids +="," + this.value;
                }
            })
            v_ids=v_ids.substring(1);
        }
        var memberInfo = {};
        memberInfo.userName = $('#userName').val();
        memberInfo.maxBirthday = $('#maxBirthday').val();
        memberInfo.minBirthday = $('#minBirthday').val();
        memberInfo.areaIds = v_ids;
        tableId.settings()[0].ajax.data = memberInfo;
        tableId.ajax.reload();
    }
</script>
</body>
</html>