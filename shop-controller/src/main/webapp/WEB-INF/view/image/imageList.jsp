<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-sm-6 col-md-4">
            <div class="panel panel-success">
                <div class="panel-heading">产品子图</div>
                <div class="panel-body">
                    <div class="thumbnail">
                        <c:forEach items="${imgList}" var="imgList">
                            <img src="<%=request.getContextPath()%>${imgList.imgPath}" width="50px"
                                 onclick="downloadFile()">
                            <input type="hidden" value="${imgList.imgPath}" id="imgPath">
                        </c:forEach>
                        <div class="caption">
                            <font style="color: red"><h1>点击图片进行下载！！</h1></font>
                            <p><a href="#" class="btn btn-primary" onclick="downloadFile()" role="button">点击下载</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">

        </div>

    </div>
</div>


<jsp:include page="/WEB-INF/common/javaScript.jsp"></jsp:include>
</body>
<script>
    function downloadFile() {
        var imgPath = $("#imgPath").val();
        bootbox.confirm({
            title: "提示信息",
            message: "您确认要下载吗?",
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
                    location.href = "<%=request.getContextPath()%>/image/downloadFile.jhtml?fileName=" + imgPath;
                }
            }
        })
    }
</script>
</html>