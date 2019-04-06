<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		<c:if test="${!empty brandList}">
			<table  class="list" border="1" cellpadding="0" cellspacing="0" id="tableId">
				<thead>
				<tr>
				<th>序列</th>
				<th>商品品牌</th>
				<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${brandList}" var="brandList">
				<tr>
				<th>${brandList.id}</th>
				<th data-brandId="${brandList.id}" data-info="${brandList.brandName}">${brandList.brandName}</th>
				<th><input type="button" value="删除" onclick="delBrand('${brandList.id}')">
				<input type="button" value="修改" onclick="editor('${brandList.id}')">
				</th>
				</tr>
				</c:forEach>
				</tbody>
			</table>
				<jsp:include page="/WEB-INF/common/ajaxpage.jsp"></jsp:include>	
		</c:if>
	 <c:if test="${empty brandList}">
	 	<h1><font color="red">您查找的信息不存在！！！</font></h1>
	 </c:if>