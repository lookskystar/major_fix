<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base href="<%=basePath%>">
	    <title>后台管理</title>
	    <!--框架必需start-->
		<script type="text/javascript" src="js/jquery-1.4.js"></script>
		<script type="text/javascript" src="js/framework.js"></script>
		<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
		<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
		<!--框架必需end-->
		<!--引入弹窗组件start-->
		<script type="text/javascript" src="js/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="js/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
		<script type="text/javascript" src="js/nav/ddaccordion.js"></script>
		<script type="text/javascript" src="js/text/text-overflow.js"></script>
		<script type="text/javascript">
		(function(){
	
	
		})();
		</script>
	</head>
  	<body leftFrame="true">
  		<div id="scrollContent">
			<div class="arrowlistmenu">
				<div class="menuheader expandable"><span class="normal_icon1"></span>组织管理</div>
				<ul class="categoryitems">
					<li><a href="javascript:void;" target="frmright"><span class="text_slice">用户管理</span></a></li>
					<li><a href="javascript:void;" target="frmright"><span class="text_slice">部门管理</span></a></li>
					<li><a href="<%=basePath%>jsp/admin/position/position_list_main.jsp" target="frmright"><span class="text_slice">职位管理</span></a></li>
					<li><a href="javascript:void;" target="frmright"><span class="text_slice">角色管理</span></a></li>
					<li><a href="javascript:void;" target="frmright"><span class="text_slice">资源管理</span></a></li>
					<li><a href="javascript:void;" target="frmright"><span class="text_slice">权限管理</span></a></li>
				</ul>
			</div>	
		</div>		
  	</body>
</html>
