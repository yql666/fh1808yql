<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>产品修改页面</title>
</head>
<body>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-5">
            <div class="panel panel-info">
                <div class="panel-heading">产品修改表</div>
                <div class="panel-body">
                    <form action="<%=request.getContextPath()%>/product/updateProduct.jhtml" method="post"
                          enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${product.id}">
                        <input type="hidden" name="productPath" value="${product.productPath}">
                        <input type="hidden" name="ids" id="ids">
                        <input type="hidden" id="paths" name="paths">
                        <input type="hidden" name="imgPaths" id="imgPaths">
                        <table class="table table-striped table-bordered" id="tabId">
                            <tr>
                                <th width="100px" style="text-align: center">
                                    商品名称:
                                </th>
                                <td>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="productName"
                                               value="${product.productName}">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align: center">
                                    商品价格:
                                </th>
                                <td>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="productPrice"
                                               value="${product.productPrice}">
                                    </div>
                                </td>
                            </tr>
                            <tr data-imgId="${product.id}">
                                <th style="text-align: center">
                                    商品图片:
                                </th>
                                <td>
                                    <div style="width:50px">
                                        <img src="<%=request.getContextPath()%>${product.productPath}" width="50px"
                                             class="img-rounded"
                                             onclick="downloadFile()">
                                    </div>
                                    <div class="col-md-9">
                                        <input type="file" class="form-control" name="productImgPath">
                                    </div>

                                </td>
                            </tr>

                            <tr>
                                <th style="text-align: center">
                                    商品子图:
                                </th>
                                <td width="255">
                                    <c:forEach items="${imgList}" var="imgList">
                                        <div id="${imgList.id}" style="width:50px;float: left;">
                                            <img src="<%=request.getContextPath()%>${imgList.imgPath}" width="50px"
                                                 height="50px" class="img-rounded">
                                            <center>
                                                <a href="javascript:deleteImg('${imgList.id}','${imgList.imgPath}')">×</a>
                                            </center>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr data-imgRow="imgRow">
                                <th style="text-align: center">
                                    商品子图:
                                </th>
                                <td>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="productImg" type="file" placeholder=""/>
                                    </div>
                                    <input type="button" onclick='addFileInput()' value="➕">
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align: center">
                                    商品品牌:
                                </th>
                                <td>
                                    <select name="brand.id" id="selected"  style="width: 100px" class="form-control">
                                        <option value="-1">--请选择--</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align: center">
                                    操作：
                                </th>
                                <td>
                                    <div class="btn-group">
                                        <button class="btn btn-primary btn-info" type="submit">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                            点击修改
                                        </button>
                                        <button class="btn btn-primary btn-default">
                                            <span class="glyphicon glyphicon-refresh"></span>
                                            重置
                                        </button>
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
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <div class="col-sm-12">
                    <input id="uploadFile" name="uploadImgFile" type="file" value="上传" multiple/>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/common/javaScript.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        initBrand("selected", '${product.brand.id}');

        $('#uploadFile').fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload : true, //显示整体上传的按钮
            showRemove : true,//显示整体删除的按钮
            uploadAsync: true,//默认异步上传
            uploadLabel: "上传",//设置整体上传按钮的汉字
            removeLabel: "移除",//设置整体删除按钮的汉字
            uploadClass: "btn btn-primary",//设置上传按钮样式
            showCaption: true,//是否显示标题
            dropZoneEnabled: false,//是否显示拖拽区域
            uploadUrl: "/product/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            maxFileSize : 666,//文件大小限制
            maxFileCount: 10,//允许最大上传数，可以多个，
            enctype: 'multipart/form-data',
            allowedFileExtensions : ["jpg", "png","gif","docx","zip","xlsx","txt"],/*上传文件格式限制*/
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            showBrowse: true,
            browseOnZoneClick: true,
            slugCallback : function(filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
        });
        $('#uploadFile').on("fileuploaded", function(event, data, previewId, index) {
            $("#paths").val($("#paths").val()+","+data.response.message)
        });

    })

    function deleteImg(imgId, imgPath) {
        $("#" + imgId).remove();
        $("#ids").val($("#ids").val() + "," + imgId);
        $("#imgPaths").val($("#imgPaths").val() + "," + imgPath);
    }

    function addFileInput() {
        $("tr[data-imgRow='imgRow']").last().after("<tr data-imgRow='imgRow']\"><th style='text-align: center'>商品子图:</th><td><div class='col-sm-6'><input type='file' class='form-control' name='productImg' ></div>" +
            "<div class='btn-group'><button class='btn btn-xs btn-danger' onclick='removeImg(this)'>\<span class='glyphicon glyphicon-remove'></span>取消</button></div></td></tr>")
    }

    function removeImg(obj) {
        $(obj).parents("tr").remove();
    }
</script>
</body>
</html>