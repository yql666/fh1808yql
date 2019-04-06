<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax品牌查询</title>
</head>
<body>
	<a href="javascript:addDiv()">点击增加</a>
	<a href="javascript:deleteIds()">批量删除</a>
	<form >
		<table border="1" cellpadding="0" cellspacing="0">
		<tr>
		<td>品牌名称</td>
		<td><input type="text" id="brandName"></td>
		</tr>
		<tr>
		<td>录入时间</td>
		<td><input type="date" id="minentryTime" >---<input type="date" id="maxentryTime" ></td>
		</tr>
		<tr>
		<td>修改时间</td>
		<td><input type="date" id="minupdateTime" >---<input type="date" id="maxupdateTime" ></td>
		</tr>
		<tr>
		<th colspan="2"><input type="button" value="点击查询" onclick="findBrandAjax(1)"><input type="reset" value="重置" ></th>
		</tr>
		</table>
	</form>
	<div id="addDiv">
	</div>
	<div id="brandPageDiv">
	<jsp:include page="/WEB-INF/view/brand/brandPage.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/common/javaScript.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
			$("#addDiv").hide();	
			initTable();
			allAndRe();
			initSort();
	})
		function addDiv(){
			$("#brandPageDiv").hide();
			$("#addDiv").show().html("<form>"
					+"品牌类型<input type='text' name='brandName'><br>"
					+"<input type='button' onclick='addBrand()' value='点击增加'>"
					+"<input type='reset'  value='重置'></form>")			
				}
		function addBrand(){
			$.ajax({
				url:"<%=request.getContextPath()%>/brandAjax/addBrandAjax.jhtml",
				data:{
					"brandName":$("input[name='brandName']").val(),
					},
				type:"post",
				success:function(res){
					if(res.code==200){
					$("#addDiv").hide();
					findBrandAjax(1);
					$("#brandPageDiv").show();
					}
				}
			})			
		}
		function updateBrandAjax(){
			$.ajax({
				url:"<%=request.getContextPath()%>/brandAjax/updateBrandAjax.jhtml",
				data:{
					"id":$("#brandId").val(),
					"brandName":$("#toBrandName").val(),
					},
				type:"post",
				dataType:"json",
				success:function(res){
					if(res.code==200){
					$("#addDiv").hide();
					$("#brandPageDiv").show();
					findBrandAjax(1);
					}
				}
			})			
		}
		var v_property;
		var v_sort;
		function initSort(){
			$("#tableId thead input[type='button']").each(function(){
				$("input[data-sort-property='"+v_property+"'][data-sort='"+v_sort+"']").css({"background":"red"})
				$(this).mouseover(function(){
					if(this.style.background!="red"){
						$(this).css({"background":"blue"});
					}
				})
				$(this).mouseout(function(){
					if(this.style.background!="red"){
						$(this).css({"background":""});
					}
				})
				$(this).click(function(){
					 v_property=$(this).attr("data-sort-property");
					 v_sort=$(this).attr("data-sort");
					 if(this.style.background=="red"){
						 v_property="";
					 }
					 findBrandAjax(1);	 
				})
			})
		}
		function findBrandAjax(page){
			$.ajax({
				url:"<%=request.getContextPath()%>/brandAjax/findBrandAjax.jhtml",
				data:{
					"brandName":$("#brandName").val(),
			  		"minentryTime":$("#minentryTime").val(),
					"maxentryTime":$("#maxentryTime").val(), 
					"minupdateTime":$("#minupdateTime").val(),
					"maxupdateTime":$("#maxupdateTime").val(),  
					"pageIndex":page,
					"property":v_property,
					"sort":v_sort,
					"flag":1
					},
				type:"post",
				success:function(data){
					$("#brandPageDiv").html(data);
					initTable();
					allAndRe();
					initSort();
				}
			})			
		}
		
		function turnPage(pageIndex){
			findBrandAjax(pageIndex);
		}
		
		function deleteBrand(id){
			$.ajax({
				url:"<%=request.getContextPath()%>/brandAjax/deleteBrand.jhtml",
				data:{
					"id":id
				},
				dataType:"json",
				type:"post",
				success:function(data){
					if(data.code==200){
						findBrandAjax(1);
						alert(data.message);
					}else{
						alert(data.message);
					}
				}
			})
		}
		function toUpdate(id){
			$("#brandPageDiv").hide();
			$("#addDiv").show().html("<form>"
					+"<input type='hidden' id='brandId'>"
					+"品牌类型<input type='text' id='toBrandName'><br>"
					+"<input type='button' onclick='updateBrandAjax()' value='点击修改'>"
					+"<input type='reset'  value='重置'></form>")
			$.ajax({
				url:"<%=request.getContextPath()%>/brandAjax/toUpdateAjax.jhtml",
				data:{
					"id":id
				},
				type:"post",
				success:function(data){
					$("#brandId").val(data.id)
					$("#toBrandName").val(data.brandName)
				}
			})
		}
		
		function deleteIds(){
				var v_ids="";
				$("input[name='checkList']:checkbox:checked").each(function(){
					v_ids+=","+this.value;
				})
				v_ids=v_ids.substring(1);
				if(v_ids.length>0){
					if(confirm("确定要批量删除么？"))
						$.ajax({
							url:"<%=request.getContextPath()%>/brandAjax/deleteIds.jhtml",
							type:"post",
							dataType:"json",
							data:{
								"ids":v_ids
							},
							success:function(res){
								if(res.code==200){
								findBrandAjax(1);
								}else{
									alert(res.message);
								}
							}
						})
				}else{
					alert("至少选择一个")
				}
		}
</script>	
</body>
</html>