<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		<c:if test="${!empty brandList}">
			<table  class="list" border="1" cellpadding="0" cellspacing="0" id="tableId">
				<thead>
				<tr>
				<th><input type="checkbox" id="checkAll">全/<input type="checkbox" id="reCheck">反</th>
				<th>商品品牌</th>
				<th>录入时间<input type="button" data-sort-property="entryTime" data-sort="asc" value="∴" /><input type="button" data-sort-property="entryTime" data-sort="desc" value="∵" /></th>
				<th>修改时间<input type="button" data-sort-property="updateTime" data-sort="asc" value="∴" /><input type="button" data-sort-property="updateTime" data-sort="desc" value="∵" /></th>
				<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${brandList}" var="brandList">
				<tr>
				<th><input type="checkbox" name="checkList" value="${brandList.id}"/></th>
				<th>${brandList.brandName}</th>
				<th><fmt:formatDate value="${brandList.entryTime}" pattern="yyyy/MM/dd"/></th>
				<th><fmt:formatDate value="${brandList.updateTime}" pattern="yyyy/MM/dd"/></th>
				<th><input type="button" value="删除" onclick="deleteBrand('${brandList.id}')">
				<input type="button" value="修改" onclick="toUpdate('${brandList.id}')">
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