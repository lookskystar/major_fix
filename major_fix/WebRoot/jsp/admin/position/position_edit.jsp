<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base href="<%=basePath%>">
	    <title>职位编辑</title>
		<!--框架必需start-->
		<script type="text/javascript" src="js/jquery-1.4.js"></script>
		<script type="text/javascript" src="js/framework.js"></script>
		<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
		<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
		<!--框架必需end-->
		<!--表单验证start -->
		<script src="js/form/validationEngine-cn.js" type="text/javascript"></script>
		<script src="js/form/validationEngine.js" type="text/javascript"></script>
		<!--表单验证end -->
		<!--表单遮罩start -->
		<script type="text/javascript" src="js/form/loadmask.js"></script>
		<!--表单遮罩end -->
		<script type="text/javascript" src="js/attention/messager.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			//编辑职位
			$('#submit').bind('click', function(){
				var access = $('#admin_position_edit_form').validationEngine({returnIsValid:true});
				if (access) {
					$('#admin_position_edit_div').mask("表单正在提交...");
					$.ajax({
						type : "post",
						async : false,
						dataType : 'json',
						url : "<%=basePath%>positionAction!positionEdit.action",
						data : $('#admin_position_edit_form').serialize(),
						success : function(obj, textStatus, jqXHR) {
						}
					});
					//刷新数据
					top.window.frmright.frames("frmrightGrid").location.href = 
						top.window.frmright.frames("frmrightGrid").location.href;
					//$("#admin_position_query_form", top.window.frmright.document).submit();
					//关闭窗口
					top.Dialog.close();
					
				}
			});
			
			//清空表单
			$('#clear').bind('click', function(){
				$('#admin_position_edit_form input').val("");
				$('#admin_position_edit_form textarea').text("");
			});
			
		});
		</script>
	</head>
  	<body>
  		<div id="admin_position_edit_div" style="margin-top: 2px;">
  			<form id="admin_position_edit_form">
  				<input type="hidden" name="id" value="${position.id }"/>
  				<input type="hidden" name="createTime" value="${position.createTime }"/>
  				<input type="hidden" name="lastModifyTime" value="${position.lastModifyTime }"/>
				<table class="tableStyle" formMode="true">
					<tr>
						<th colspan="2">编辑职位</th>
					</tr>
					<tr>
						<td>职位编号：</td><td><input type="text" name="num" value="${position.num }" class="validate[required]"/><span class="star">*</span></td>
					</tr>
					<tr>
						<td>职位名称：</td><td><input type="text" name="name" value="${position.name }" class="validate[required]"/><span class="star">*</span></td>
					</tr>
					<tr>
						<td>职位描述：</td>
						<td>
							<span class="float_left">
								<textarea name="desc" class="validate[required, custom[date]]">${position.desc }</textarea><span class="star">*</span>
							</span>
							<span class="img_light" style="height:80px;" title="限制在128字以内"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="submit">提 交</button>
							<button id="clear">重 置</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
  	</body>
</html>
