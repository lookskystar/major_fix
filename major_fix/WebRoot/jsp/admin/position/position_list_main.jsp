<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="pg" uri="page-taglib" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base href="<%=basePath%>">
	    <title>职位管理</title>
		<!--框架必需start-->
		<script type="text/javascript" src="js/jquery-1.4.js"></script>
		<script type="text/javascript" src="js/framework.js  "></script>
		<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
		<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
		<!--框架必需end-->
		<script type="text/javascript">
		$(document).ready(function(){
			//添加职位 
			$('#add').bind('click', function(){
				var diag = new top.Dialog();
				diag.Title = "添加职位";
				diag.Height = 270;
				diag.Width = 420;
				diag.URL = "<%=basePath%>jsp/admin/position/position_add.jsp";
				diag.show();
			});

			//批量删除职位
			$("#remove").bind('click', function(){
				document.frames("frmrightGrid").positionDeleteOfBatch(); 
			});
			
			//编辑职位
			$("#edit").bind('click', function(){
				document.frames("frmrightGrid").positionEditOfBatch(); 
			});

			
		});
		</script>
	</head>
	<body>
		<div class="position">
			<div class="center">
			<div class="left">
			<div class="right">
				<span>当前位置：后台管理 >> 组织管理 >> <font style="color: black;">职位管理</font>：您可以通过以下表格对<font style="color: black;">职位</font>进行
					<font style="color: black;">增加</font>、
					<font style="color: black;">删除</font>、
					<font style="color: black;">修改</font>、
					<font style="color: black;">查询</font>操作！
				</span>
			</div>	
			</div>	
			</div>
		</div>
		<!-- 查询条件start -->
		<div class="box2" roller="false">
			<table>
				<form id="admin_position_query_form" action="<%=basePath%>positionAction!dataGridOfPosition.action" method="post" target="frmrightGrid">
				<input type="hidden" id="sort" name="sort"/>
				<input type="hidden" id="order" name="order"/>
				<input type="hidden" id="pageSize" name="pageSize"/>
				<tr>
					<td>职位名称：</td>
					<td><input type="text" id="name" name="name"/></td>
					<td>职位编号：</td>
					<td><input type="text" id="num" name="num"/></td>
					<td><button id="query"><span class="icon_find">查询</span></button></td>
				</tr>
				</form>
				<tr>
					<td colspan="3">
						<button id="add" style="margin-left: 2px;"><span class="icon_page">新建</span></button>
						<button id="edit" style="margin-left: 2px;"><span class="icon_edit">编辑</span></button>
						<button id="remove" style="margin-left: 2px;"><span class="icon_delete">删除</span></button>
					</td>
				</tr>
			</table>
		</div>
		<!-- 查询条件end -->
		
		<!-- 数据Grid -->
		<IFRAME scrolling="no" height="100%" width="100%" frameBorder=0 id=frmrightGrid name=frmrightGrid onload="this.height = top.document.body.scrollHeight" src="<%=basePath%>positionAction!dataGridOfPosition.action"  allowTransparency="true"></IFRAME>
	</body>