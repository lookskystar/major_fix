<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base href="<%=basePath%>">
	    <title>职位查看</title>
		<!--框架必需start-->
		<script type="text/javascript" src="js/jquery-1.4.js"></script>
		<script type="text/javascript" src="js/framework.js"></script>
		<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
		<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
		<!--框架必需end-->
		<script type="text/javascript">
		$(document).ready(function(){
			
			
		});
		</script>
	</head>
  	<body>
  		<div id="admin_position_view_div">
			<table class="tableStyle" formMode="true">
				<tr>
					<th colspan="2">职位信息</th>
				</tr>
				<tr>
					<td>职位编号：</td><td><input type="text" name="num" value="${position.num }" disabled="disabled"/></td>
				</tr>
				<tr>
					<td>职位名称：</td><td><input type="text" name="name" value="${position.name }" disabled="disabled"/></td>
				</tr>
				<tr>
					<td>职位描述：</td>
					<td>
						<span class="float_left">
							<textarea name="desc" disabled="disabled">${position.desc }</textarea>
						</span>
					</td>
				</tr>
				<tr>
					
					<td>创建时间：</td><td><input type="text" name="createTime" value="${position.createTime }" disabled="disabled"/></td>
				</tr>
				<tr>
					<td>修改时间：</td><td><input type="text" name="lastModifyTime" value="${position.lastModifyTime }" disabled="disabled"/></td>
				</tr>
				<tr>
					<td colspan="2">
						
					</td>
				</tr>
			</table>
		</div>
  	</body>
</html>
