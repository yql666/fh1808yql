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
<title>Insert title here</title>
</head>
<body>
<center>
	<form>
		<table>
			<tr>
			<td>
			品牌名称:
			</td>
			<td>
			<input type="text" id="brandName">
			</td>
			</tr>
			<tr>
			<td>
			名称查询:
			</td>
			<td>
			<input type="button" value="查询" onclick="findList(1)"><input type="reset" value="重置">
			</td>
			</tr>
		</table>
	</form>
	<div id="brandPageDiv">
	<jsp:include page="/WEB-INF/view/brand/brands/pageList.jsp"></jsp:include>
	</div>
	<input type="text" id="addBrandName" ><br>
	<input type="button" value="增加" onclick="addBrand()">
</center>	
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
		function addBrand(){
			$.ajax({
				url:"<%=request.getContextPath()%>/brandList/addBrand.jhtml",
				type:"post",
				data:{"brandName":$("#addBrandName").val()},
				success:function(result){
					if(result.code==200){
						$("#addBrandName").val("");
						findList(1);
					}
				},
			})
		}
		function editor(brandId){
				var brandName=$("th[data-brandId='"+brandId+"']").attr("data-info");
				$("th[data-brandId='"+brandId+"']").html("<input type='text' id='brandId_"+brandId+"'  value='"+brandName+"'><input type='button' onclick='updateBrand(\""+brandId+"\")' value='保存'><input type='button' onclick='cancel(\""+brandId+"\",\""+brandName+"\")' value='取消'>");
		}
		function cancel(brandId,brandName){
			$("th[data-brandId='"+brandId+"']").html(brandName);
		}
		function updateBrand(brandId){
			var v_brandName=$("#brandId_"+brandId+"").val();
			$.ajax({
				url:"<%=request.getContextPath()%>/brandList/updateBrand.jhtml",
				type:"post",
				data:{
					"id":brandId,
					"brandName":v_brandName
					},
				success:function(result){
					if(result.code==200){
						$("th[data-brandId='"+brandId+"']").html(v_brandName);
						$("th[data-brandId='"+brandId+"']").attr("data-info",v_brandName);	
					}
				}
			})
		}
			function delBrand(id){
					$.ajax({
						url:"<%=request.getContextPath()%>/brandList/updateBrand.jhtml",
						type:"post",
						data:{
							"id":id
						},
						success:function(res){
							if(res.code==200){
								findList(1);
							}
						}
					})
				}
		function  findList(page){
			$.ajax({
				url:"<%=request.getContextPath()%>/brandList/findList.jhtml",
				type:"post",
				data:{
					"flag":1,
					"brandName":$("#brandName").val(),
					"pageIndex":page
				},
				success:function(result){
						$("#brandPageDiv").html(result);
				}
			})
		}
		function turnPage(pageIndex){
			findList(pageIndex);
		}
</script>
</body>
</html>