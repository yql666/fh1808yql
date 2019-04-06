<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>品牌修改</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-5">

		</div>
		<div class="col-md-2">
			<div class="panel panel-success">
				<div class="panel-heading">商品添加列表</div>
				<div class="panel-body">
					<form  action="<%=request.getContextPath()%>/brand/updateBrand.jhtml" method="post">
						<input type="hidden" name="id" value="${brand.id}">
						<center><h1>品牌类型</h1></center><input type="text" class="form-control" value="${brand.brandName}" name="brandName">
						<div class="col-sm-10">
							<button type="button"   class="btn btn-success">
								<span class="glyphicon glyphicon-ok"></span>
								<input type="submit" value="点击修改">
							</button>
						</div>
					</form>
				</div>
			</div>

		</div>
		<div class="col-md-5">

		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/common/javaScript.jsp"></jsp:include>
</body>
</html>