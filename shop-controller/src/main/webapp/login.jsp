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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>
</head>
<body>
<%request.getSession().removeAttribute("user");%>
<div class="container-fluid" id="loginDiv">
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4" style="margin-top:200px">
            <div class="panel panel-success">
                <div class="panel-heading"><span class="glyphicon glyphicon-user"></span>用户登录<span id="login"></span></div>
                <div class="panel-body">
                    <div>
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">账户</label>
                                <div class="col-md-6">
                                    <input type="email" id="userName" class="form-control" value="yql" placeholder="请输入账户">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">密码</label>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="password" id="password" class="input-sm form-control"
                                               placeholder="密码框" value="666666" >
                                        <span class="input-group-addon">
										<span class="glyphicon glyphicon-eye-open" onclick='textOrPwd("password")'></span>
										</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">验证码</label>
                                <div class="col-md-2">
                                    <img src="<%=request.getContextPath()%>/imgCode" id="refreshImg">
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="imgCode" class="form-control" placeholder="请填写验证码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">操作</label>
                                <div class="col-sm-10">
                                    <button type="button" onclick="addUser()" class="btn btn-primary">
                                        <span class=" glyphicon glyphicon-plus"></span>
                                        注册
                                    </button>
                                    <button type="button" onclick="findUset()" class="btn btn-success">
                                        <span class="glyphicon glyphicon-ok"></span>
                                        登录
                                    </button>
                                    <button type="reset" onclick="findUset()" class="btn btn-info">
                                        <span class="glyphicon glyphicon-refresh"></span>
                                        重置
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</div>

<div class="container-fluid" id="addUserDiv">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" style="margin-top:200px">
            <div class="panel panel-danger">
                <div class="panel-heading"><span class="glyphicon glyphicon-user"></span>用户注册</div>
                <div class="panel-body">
                    <form>
                        <table class="table table-striped table-bordered">
                            <tr height="25">
                                <th colspan="2"><span id="tishi"></span></th>
                            </tr>
                            <tr>
                                <th>账户：</th>
                                <th>
                                    <div class="col-md-10">
                                        <input type='text' class="form-control" name='userName'
                                               onblur='findUserName(this)'>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <th>密码：</th>
                                <th>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <input type='password' id="addPassword" class="form-control"
                                                   name='password' onblur='isNot()' placeholder="密码框">
                                            <span class="input-group-addon">
										     <span class="glyphicon glyphicon-eye-open" onclick='textOrPwd("addPassword")'></span>
										     </span>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <th>确认密码：</th>
                                <th>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <input type='password' class="form-control" id='addPasswords'
                                                   onblur='isNot()'>
                                            <span class="input-group-addon">
										     <span class="glyphicon glyphicon-eye-open" onclick='textOrPwd("addPasswords")'></span>
										        </span>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <th>注册：</th>
                                <th>
                                    <div class="btn-group">
                                        <button class="btn btn btn-primary btn-info" onclick='insertUser()' id="add">
                                            <span class=" glyphicon glyphicon-plus"></span>
                                            注册
                                        </button>
                                        <button class="btn btn-primary">
                                            <span class="glyphicon glyphicon-refresh"></span>
                                            重置
                                        </button>
                                    </div>
                                </th>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>


<jsp:include page="/WEB-INF/common/javaScript.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        $("#refreshImg").click(function () {
            var r = new Date().getTime();
            $(this).attr("src", "<%=request.getContextPath()%>/imgCode?" + r)
        })

        $("#addUserDiv").hide();


    })
    var v_vo = false;

    function textOrPwd(id) {
        if (v_vo == false) {
            $("#"+id).prop("type", "text");
            v_vo = true;
        } else {
            $("#"+id).prop("type", "password");
            v_vo = false;
        }
    }

    function isNot() {
        var v_password = $("#addPassword").val();
        var v_passwords = $("#addPasswords").val();
        if (v_password != v_passwords) {
            $("#tishi").fadeIn(1000).html("<font color='red'>密码与确认密码不一致！！！</font>");
            setTimeout(function () {
                $("#tishi").css({"display": "none"});
            }, 2000);
            $("#add").prop("disabled", "disabled");
        }
        if (v_password == v_passwords) {
            $("#add").prop("disabled", "");
        }
    }

    function findUset() {
        var v_userName = $("#userName").val();
        var v_password = hex_md5($("#password").val());
        var v_imgCode = $("#imgCode").val();
        $.ajax({
            url: "<%=request.getContextPath()%>/user/findUser.jhtml",
            type: "post",
            data: {
                "userName": v_userName,
                "password": v_password,
                "imgCode": v_imgCode
            },
            success: function (result) {
                if (result.code == 200) {
                    location.href = "<%=request.getContextPath()%>product/toProductList.jhtml";
                } else {
                    $("#login").fadeIn(1000).html("<font color='red'>" + result.message + "！！！</font>");
                    setTimeout(function () {
                        $("#login").css({"display": "none"});
                    }, 2000);
                    bootbox.alert({
                        title: "提示信息",
                        message: ""+result.message+"",
                        size: "small",
                    });
                }
            }
        })
    }

    function addUser() {
        $("#loginDiv").hide();
        $("#addUserDiv").show(1000);
    }

    function insertUser() {
        var v_userName = $("input[name='userName']").val();
        if (v_userName == "" || v_userName == null) {
            $("#tishi").fadeIn(1000).html("<font color='red'>账号不能为空！！！</font>");
            setTimeout(function () {
                $("#tishi").css({"display": "none"});
            }, 2000);
            $("#add").prop("disabled", "disabled");
        }
        $.ajax({
            url: "<%=request.getContextPath()%>/user/addUser.jhtml",
            type: "post",
            data: {
                "userName": v_userName,
                "password": hex_md5($("#addPassword").val())
            },
            success: function (res) {
                if (res.code == 200) {
                    $("#addUserDiv").hide();
                    $("#loginDiv").show(1000);
                } else {
                    $("#tishi").fadeIn(1000).html("<font color='red'>" + res.message + "！！！</font>");
                    setTimeout(function () {
                        $("#tishi").css({"display": "none"});
                    }, 2000);
                    $("#add").prop("disabled", "disabled");
                }
            }
        })
    }

    function findUserName(obj) {
        $.ajax({
            url: "<%=request.getContextPath()%>/user/findUserName.jhtml",
            type: "post",
            data: {
                "userName": obj.value,
            },
            success: function (res) {
                if (res.code == 200) {
                    $("#tishi").fadeIn(1000).html("<font color='lime'>" + res.message + "!!!</font>");
                    setTimeout(function () {
                        $("#tishi").css({"display": "none"});
                    }, 2000);
                    $("#add").prop("disabled", "");
                } else {
                    $("#tishi").fadeIn(1000).html("<font color='red'>" + res.message + "！！！</font>");
                    setTimeout(function () {
                        $("#tishi").css({"display": "none"});
                    }, 2000);
                    $("#add").prop("disabled", "disabled");
                }
            }
        })
    }
</script>
</body>
</html>