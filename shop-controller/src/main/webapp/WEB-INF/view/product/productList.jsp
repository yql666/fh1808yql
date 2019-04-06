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
    <title>产品展示</title>
    <style>
        body {
            padding-top: 55px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
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
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default" style="margin:0;">

                    <div class="panel-heading">
                        <a href="<%=request.getContextPath()%>/user/toArea.jhtml" data-toggle="collapse">
                            <i class="icon-user-md icon-large"></i>点击查看省市县</a>
                    </div>
                    <ul data-parent="#accordion" class="nav collapse">
                        <li class="active"><a href="#"><i class="icon-user"></i>产品增加</a></li>
                        <li><a href="#"><i class="icon-edit"></i>产品修改</a></li>
                        <li><a href="#"><i class="icon-trash"></i>产品删除</a></li>
                        <li><a href="#"><i class="icon-list"></i>产品列表</a></li>

                    </ul>
                </div>

                <div class="panel panel-default" style="margin:0;">

                    <div class="panel-heading">
                        <a href="#userMeun2" data-parent="#accordion" data-toggle="collapse"><i
                                class="icon-user-md icon-large"></i>品牌管理</a>
                    </div>

                    <ul class="nav collapse">
                        <li><a href="#"><i class="icon-user"></i>品牌增加</a></li>
                        <li><a href="#"><i class="icon-edit"></i>品牌修改</a></li>
                        <li><a href="#"><i class="icon-trash"></i>品牌删除</a></li>
                        <li><a href="#"><i class="icon-list"></i>品牌列表</a></li>

                    </ul>
                </div>

                <div class="panel panel-default" style="margin:0;">
                    <div class="panel-heading">
                        <a href="#userMeun3" data-parent="#accordion" data-toggle="collapse"><i
                                class="icon-user-md icon-large"></i> 用户管理</a>
                    </div>

                    <ul id="userMeun3" class="nav collapse">
                        <li><a href="#"><i class="icon-user"></i> 增加用户</a></li>
                        <li><a href="#"><i class="icon-edit"></i> 修改用户</a></li>
                        <li><a href="#"><i class="icon-trash"></i> 删除用户</a></li>
                        <li><a href="#"><i class="icon-list"></i> 用户列表</a></li>

                    </ul>
                </div>
                <div class="panel panel-default" style="margin:0;">
                    <div class="panel-heading">
                        <a href="#userMeun3" data-parent="#accordion" data-toggle="collapse"><i
                                class="icon-user-md icon-large"></i>用户异常处理</a>
                    </div>
                </div>
            </div>
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    Cras justo odio
                </a>
                <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                <a href="#" class="list-group-item">Morbi leo risus</a>
                <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                <a href="#" class="list-group-item">Vestibulum at eros</a>
            </div>
        </div>

        <div class="col-md-10">
            <form class="form-horizontal" role="form" id="productForm" method="post">
                <fieldset>
                    <legend>
                        <font style="color: red">欢迎${user.userName}登陆
                        上次登录时间<fmt:formatDate value="${user.loginTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
                        今天登录${user.loginCount}次</font></legend>
                    <div class="btn-group" style="float: right">
                    <button class="btn btn-xs btn-danger">
                        <span class="glyphicon glyphicon-remove"></span>
                        <a href="/user/logOff.jhtml">点击退出</a>
                    </button>
                </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-4">
                            <input class="form-control" id="productName" name="productName" type="text"
                                   placeholder="苹果"/>
                        </div>
                        <label class="col-sm-2 control-label">录入日期</label>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <input type="text" class="form_date input-sm form-control" id="minInsertTime"
                                       name="minInsertTime"/>
                                <span class="input-group-addon">
                                        --
									</span>
                                <input type="text" class="form_date input-sm form-control" id="maxInsertTime"
                                       name="maxInsertTime"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品价格</label>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <input type="text" class="input-sm form-control" id="minPrice" name="minPrice"/>
                                <span class="input-group-addon">
                                        --
									</span>
                                <input type="text" class="input-sm form-control" id="maxPrice" name="maxPrice"/>
                            </div>
                        </div>
                        <label class="col-sm-2 control-label">修改时间</label>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <input type="text" class="form_datetime input-sm form-control" id="minUpdateTime"
                                       name="minUpdateTime"/>
                                <span class="input-group-addon">
                                        --
									</span>
                                <input type="text" class="form_datetime input-sm form-control" id="maxUpdateTime"
                                       name="maxUpdateTime"/>
                            </div>
                        </div>

                        <label class="col-sm-2 control-label">产品类型</label>
                        <div class="col-sm-4">
                            <select name="brandName" style="width: 100px" class="form-control">
                                <option value="-1">--请选择--</option>
                            </select>
                        </div>

                    </div>
                </fieldset>

                <div class="clearfix form-actions" style="text-align:center">

                    <button class="btn btn-success" type="button" onclick="findProduct()">
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
            <div style="background:#d8d8d8;text-align:right;">
                <button type="button" class="btn btn-info" onclick="addProductDialog()">
                    <span class="glyphicon glyphicon-plus"></span>
                    点击添加
                </button>
                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove"></span>
                    <a href="javascript:delBatch()">批量删除</a>
                </button>
                <button type="button" class="btn btn-info">
                    <span class="glyphicon glyphicon-download-alt"></span>
                    <a href="javascript:exportExcel()">下载excel</a>
                </button>

                <button type="button" class="btn btn-info">
                    <span class="glyphicon glyphicon-download-alt"></span>
                    <a href="javascript:exportExcelByBrand()">按品牌下载excel</a>
                </button>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading">产品列表</div>
                <div class="panel-body">
                    <table id="tableId" class="table table-striped table-bordered" width="100%">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="checkAll">全反<input type="checkbox" id="reCheck"></th>
                            <th>产品名称</th>
                            <th>产品价格</th>
                            <th>产品品牌</th>
                            <th>产品图片</th>
                            <th>录入日期</th>
                            <th>修改日期</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>全反</th>
                            <th>产品名称</th>
                            <th>产品价格</th>
                            <th>产品品牌</th>
                            <th>产品图片</th>
                            <th>录入日期</th>
                            <th>修改日期</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid" id="addProductDiv" style="display: none">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-5">
            <div class="panel panel-primary">
                <div class="panel-heading">添加产品表</div>
                <div class="panel-body">
                    <form>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>
                                    商品名称:
                                </th>
                                <td>
                                    <div class="col-sm-12">
                                        <input class="form-control" name="productName" type="text" placeholder=""/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    商品价格:
                                </th>
                                <td>
                                    <div class="col-sm-12">
                                        <input class="form-control" name="productPrice" type="text" placeholder=""/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    商品类型:
                                </th>
                                <td>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <select name="brandName" class="form-control">
                                                <option value="-1">--请选择--</option>
                                            </select>
                                        </div>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <th>
                                    商品图片:
                                </th>
                                <td>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <input id="uploadFile" name="uploadImgFile" type="file"/>
                                                <input id="filePath" type="hidden"/>
                                                <input id="uploadFiles" name="uploadImgFiles" type="file" multiple/>
                                                <input id="filePaths" type="hidden"/>
                                            </div>
                                        </div>
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

<div class="container-fluid" id="updateProductDiv" style="display: none">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="panel panel-info">
                <div class="panel-heading">产品修改表</div>
                <div class="panel-body">
                    <form>
                        <input type="hidden" id="id">
                        <input type="hidden" id="productPath">
                        <input type="hidden" id="imgPaths">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th width="100px" style="text-align: center">
                                    商品名称:
                                </th>
                                <td>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="toproductName">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align: center">
                                    商品价格:
                                </th>
                                <td>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="toprice">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align: center">
                                    商品图片:
                                </th>
                                <td>
                                    <div id="imgPath"></div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <input id="toImgFile" name="uploadImgFile" type="file"/>
                                                <input id="toFilePath" type="hidden"/>
                                                <input id="toImgFiles" name="uploadImgFiles" type="file" multiple/>
                                                <input id="toFilePaths" type="hidden"/>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th style="text-align: center">
                                    商品子图:
                                </th>
                                <td>
                                   <div id="imageDiv">

                                   </div>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align: center">
                                    商品品牌:
                                </th>
                                <td>
                                    <select name="brandName" id="brandId" class="form-control">
                                        <option value="-1">--请选择--</option>
                                    </select>
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
<script type="text/javascript">
    $(function () {
        dataTable();
        allAndRe();
        initBrand("brandName");
        clickChecked("tableId");
        $(".form_date").datetimepicker({format: 'yyyy-mm-dd', language: 'zh-CN',});
        $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh', language: 'zh-CN',});
    })
    //增加子图FileInput
    function initFiles() {
        $("#uploadFiles").fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload: true, //显示整体上传的按钮
            showRemove: true,//显示整体删除的按钮
            uploadAsync: true,//默认异步上传
            uploadLabel: "上传",//设置整体上传按钮的汉字
            removeLabel: "移除",//设置整体删除按钮的汉字
            uploadClass: "btn btn-primary",//设置上传按钮样式
            showCaption: true,//是否显示标题
            dropZoneEnabled: false,//是否显示拖拽区域
            uploadUrl: "/file/uploadFiles.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            maxFileSize: 666,//文件大小限制
            maxFileCount: 10,//允许最大上传数，可以多个，
            enctype: 'multipart/form-data',
            allowedFileExtensions: ["jpg", "png", "gif", "docx", "zip", "xlsx", "txt"], /*上传文件格式限制*/
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            showBrowse: true,
            browseOnZoneClick: true,
        }).on("fileuploaded", function (event, data, previewId, index) {
            $("#filePaths", v_ProductDialog).val($("#filePaths", v_ProductDialog).val() + "," + data.response.message)
        });
    }
    //增加主图FileInput
    function inituploadFile() {
        $("#uploadFile").fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload: false, //显示整体上传的按钮
            showRemove: false,//显示整体删除的按钮
            uploadUrl: "/file/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            enctype: 'multipart/form-data',
            allowedFileExtensions: ["jpg", "png", "gif", "zip", "xlsx", "txt"], /*上传文件格式限制*/
        }).on("fileuploaded", function (event, data, previewId, index) {
            $("#filePath", v_ProductDialog).val(data.response.message)
        });
    }
    //子图回显FileInput
    function toInitFile(path) {
        $("#toImgFiles").fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload: true, //显示整体上传的按钮
            showRemove: true,//显示整体删除的按钮
            initialPreview:path,
            initialPreviewAsData: true,
            uploadUrl: "/file/uploadFiles.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            maxFileSize: 666,//文件大小限制
            maxFileCount: 10,//允许最大上传数，可以多个，
            enctype: 'multipart/form-data',
            allowedFileExtensions: ["jpg", "png", "gif", "docx", "zip", "xlsx", "txt"], /*上传文件格式限制*/
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            showBrowse: true,
            browseOnZoneClick: true,
        }).on("fileuploaded", function (event, data, previewId, index) {
            $("#toFilePaths", v_UpProductDialog).val($("#toFilePaths", v_UpProductDialog).val() + "," + data.response.message)
        });
    }
    //主图回显FileInput
    function toUploadFile(path) {
        $("#toImgFile").fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload: false, //显示整体上传的按钮
            showRemove: false,//显示整体删除的按钮
            initialPreview:path,
            initialPreviewAsData: true,
            uploadUrl: "/file/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            enctype: 'multipart/form-data',
            allowedFileExtensions: ["jpg", "png", "gif", "zip", "xlsx", "txt"], /*上传文件格式限制*/
        }).on("fileuploaded", function (event, data, previewId, index) {
            $("#toFilePath", v_UpProductDialog).val(data.response.message)
        });
    }


    var v_ProductDialog;

    function addProductDialog() {
        var v_addProductDiv = $("#addProductDiv").html();
        inituploadFile();
        initFiles();
        v_ProductDialog = bootbox.dialog({
            title: '提示信息！！',
            message: $("#addProductDiv form"),
            size: 'large',
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-plus"></span>点击添加',
                    className: 'btn-success',
                    callback: function (result) {
                        if (result) {
                            var product = {};
                            product.productName = $("input[name='productName']", v_ProductDialog).val();
                            product.productPrice = $("input[name='productPrice']", v_ProductDialog).val();
                            product.productPath = $("#filePath", v_ProductDialog).val(),
                            product.imgPaths = $("#filePaths", v_ProductDialog).val(),
                            product["brand.id"] = $("select[name='brandName']", v_ProductDialog).val(),
                            $.ajax({
                                url: "/product/addProduct.jhtml",
                                type: "post",
                                data: product,
                                success: function (result) {
                                    if (result.code == 200) {
                                        findProduct();
                                     }
                                }
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
        $("#addProductDiv").html(v_addProductDiv);
    }

    function ImageList(id){
        $.ajax({
            url: "/product/toImage.jhtml",
            type: "post",
            data: {"id": id},
            success: function (result) {
                if (result.code == 200) {
                   var imageArr=[];
                    imageArr.push(result.data.imgPath)
                    toInitFile(imageArr)
                }
            }
        })
    }
    var v_UpProductDialog;
    function update(id) {
        var v_updateProductDiv = $("#updateProductDiv").html();
        ImageList(id);
        $.ajax({
            url: "/product/toProduct.jhtml",
            type: "post",
            data: {"id": id},
            success: function (result) {
                if (result.code == 200) {
                    console.log(result.data)
                    $("#id").val(result.data.id);
                    $("#toproductName").val(result.data.productName);
                    $("#toprice").val(result.data.productPrice);
                    $("#brandId").val(result.data.brand.id);
                    $("#productPath").val(result.data.productPath);
                    var pathArr=[];
                    pathArr.push(result.data.productPath);
                    toUploadFile(pathArr)
                    v_UpProductDialog = bootbox.dialog({
                        title: '提示信息！！',
                        message: $("#updateProductDiv form"),
                        size: 'large',
                        buttons: {
                            confirm: {
                                label: '<span class="glyphicon glyphicon-plus"></span>点击修改',
                                className: 'btn-success',
                                callback: function (result) {
                                    if (result) {
                                        var product = {};
                                            product.id = $("#id", v_UpProductDialog).val(),
                                            product.productName = $("#toproductName", v_UpProductDialog).val(),
                                            product.productPrice = $("#toprice", v_UpProductDialog).val(),
                                            product["brand.id"] = $("#brandId", v_UpProductDialog).val(),
                                            product.productPath = $("#toFilePath", v_UpProductDialog).val(),
                                            product.oldPath = $("#productPath", v_UpProductDialog).val(),
                                            product.imgPaths = $("#toFilePaths", v_UpProductDialog).val(),
                                            product.paths = $("#imgPaths", v_UpProductDialog).val(),
                                            $.ajax({
                                                url: "/product/updateProduct.jhtml",
                                                type: "post",
                                                data: product,
                                                success: function (result) {
                                                    if (result.code == 200) {
                                                        findProduct();
                                                    }
                                                }
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
                    $("#updateProductDiv").html(v_updateProductDiv);
                }
            }
        })
    }

    function downloadFile() {
        var imgPath = $("#imgPath").val();
        if (confirm("是否下载")) {
            location.href = "/product/downloadFile.jhtml?fileName=" + imgPath;
        }
    }

    function exportExcel() {
        var productForm = document.getElementById("productForm");
        productForm.action = "<%=basePath%>/product/exportExcel.jhtml"
        productForm.submit();
    }

    function exportExcelByBrand() {
        var productForm = document.getElementById("productForm");
        productForm.action = "<%=basePath%>/product/exportExcelByBrand.jhtml"
        productForm.submit();
    }


    function deleteProduct(id) {
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
                        url: "/product/deleteProduct.jhtml",
                        type: "post",
                        data: {
                            "id": id
                        },
                        success: function (data) {
                            if (data.code == 200) {
                                findProduct()
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
        })
    }

    function delBatch() {
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
                            url: "<%=basePath%>/product/deleteIds.jhtml",
                            type: "post",
                            data: {
                                "ids": v_ids
                            },
                            success: function (result) {
                                if (result.code == 200) {
                                    findProduct()
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

    var tableId;

    function dataTable() {
        tableId = $('#tableId').DataTable({
            "searching": false,
            columnDefs: [{
                'targets': [0, 1, 3, 4, 7],
                'orderable': false
            }],
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
                "url": "<%=request.getContextPath()%>/product/findProduct.jhtml",
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
                },
                {"data": "productName"},
                {"data": "productPrice"},
                {"data": "brandName"},
                {
                    "data": "productPath",
                    "render": function (productPath) {
                        return '<img src="' + productPath + '" onclick="downloadFile(' + productPath + ')" class="img-rounded" width="100px">';
                    },
                },
                {
                    "data": "insertTime",
                    "render": function (data) {
                        //时间格式化
                        var date = new Date(data);
                        return date.toLocaleString();
                    }
                },
                {
                    "data": "updateTime",
                    "render": function (data) {
                        //时间格式化
                        var date = new Date(data);
                        return date.toLocaleString();
                    }
                },
                {
                    "data": "id",
                    "render": function (id) {
                        return '<div class="btn-group"><button class="btn btn-primary btn-info ">'
                            + '<span class="glyphicon glyphicon-pencil"></span>'
                            + '<a href="javascript:update(' + id + ')">修改</a></button><button class="btn btn-primary btn-danger">'
                            + '<span class="glyphicon glyphicon-remove"></span>'
                            + '<a href="javascript:deleteProduct(' + id + ')">删除</a></button>' +
                            '<button class="btn btn-primary btn-success"><span class="glyphicon glyphicon-folder-open"></span><a href="<%=request.getContextPath()%>/image/findImg.jhtml?id=' + id + '">查看子图</a></button>' +
                            '</div>';
                    },
                },
            ],
            "drawCallback": function () {
                $("#tableId tbody tr input[type='checkbox']").each(function () {
                    if (isExist(this.value)) {
                        this.checked = true
                        $(this).closest("tr").css("background", "gainsboro")
                    }
                })
            },
        });
    }

    function findProduct() {
        var productInfo = {};
        productInfo.productName = $('#productName').val();
        productInfo.minPrice = $('#minPrice').val();
        productInfo.maxPrice = $('#maxPrice').val();
        productInfo.minInsertTime = $('#minInsertTime').val();
        productInfo.maxInsertTime = $('#maxInsertTime').val();
        productInfo.minUpdateTime = $('#minUpdateTime').val();
        productInfo.maxUpdateTime = $('#maxUpdateTime').val();
        productInfo["brand.id"] = $("select[name='brandName']").val();
        tableId.settings()[0].ajax.data = productInfo;
        tableId.ajax.reload();
    }
</script>
</body>
</html>