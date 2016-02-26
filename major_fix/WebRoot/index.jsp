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
	    <title>广铁集团大机段检修系统</title>
		<!--框架必需start-->
		<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
		<link href="skins/sky/import_skin.css" rel="stylesheet" type="text/css" id="skin" themeColor="blue"/>
		<script type="text/javascript" src="js/jquery-1.4.js"></script>
		<script type="text/javascript" src="js/bsFormat.js"></script>
		<!--框架必需end-->
		<!--引入弹窗组件start-->
		<script type="text/javascript" src="js/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="js/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
		<!--修正IE6支持透明png图片start-->
		<script type="text/javascript" src="js/method/pngFix/supersleight.js"></script>
		<!--修正IE6支持透明png图片end-->
		<script type="text/javascript">
		(function(){
	
	
		})();
		//更改左侧模块菜单 
		function leftChange(pageName){
			var leftDom = $("#frmleft");
			leftDom.attr("src", pageName);
			return;
		}
		</script>
		<!--弹出式提示框start-->
		<script type="text/javascript" src="js/attention/messager.js"></script>
		<script>
			$(function(){
				setTimeout("openMsg()",1000)
			})
			function openMsg(){
			$.messager.lays(250, 140);
			$.messager.show(0,'<ul><li><a href="javascript:openWin()"><span class="icon_lightOn">系统消息：3条</span></a></li><div class="clear"></div>'+
			'<li><a href="javascript:openWin()"><span class="icon_lightOn">公共消息：10条</span></a></li><div class="clear"></div>'+
			'<li><a href="javascript:openWin()"><span class="icon_lightOn">私人消息：5条</span></a></li><div class="clear"></div>'+
			'<li><a href="javascript:openWin()"><span class="icon_lightOn">未读消息：15条</span></a></li><div class="clear"></div></ul>','stay');
			}
			function openWin(){
				top.Dialog.open({URL:"templete/msgBox.html",Title:"信件箱"});
			}
		</script>
		<!--弹出式提示框end-->
		<style>
		a {
			behavior:url(js/method/focus.htc)
		}
		</style>
	</head>
  	<body>
  	<div id="floatPanel-1"></div>		
	<div id="mainFrame">
	<!--头部与导航start-->
	<div id="hbox">
		<div id="bs_bannercenter">
		<div id="bs_bannerleft">
		<div id="bs_bannerright2">
			<div class="bs_banner_logo_hmenu"></div>
			<div class="bs_banner_title"></div>
			<div class="nav_icon_h">
				<div class="nav_icon_h_item">
				<a href="javascript:;" onclick="leftChange('left/accordition_general_fix.html');">
					<div class="nav_icon_h_item_img"><img src="icons/gif/01.gif"/></div>
					<div class="nav_icon_h_item_text">车辆检修</div>
				</a>
				</div>
				<div class="nav_icon_h_item">
				<a href="javascript:;" onclick="leftChange('left/accordition_parts_fix.html');">
					<div class="nav_icon_h_item_img"><img src="icons/gif/07.gif"/></div>
					<div class="nav_icon_h_item_text">配件管理</div>
				</a>
				</div>
				<div class="nav_icon_h_item">
				<a href="javascript:;" onclick="leftChange('left/accordition_plan_mana.html');">
					<div class="nav_icon_h_item_img"><img src="icons/gif/27.gif"/></div>
					<div class="nav_icon_h_item_text">计划管理</div>
				</a>
				</div>
				<div class="nav_icon_h_item">
				<a href="javascript:;" onclick="leftChange('left/accordition_tech_mana.html');">
					<div class="nav_icon_h_item_img"><img src="icons/gif/39.gif"/></div>
					<div class="nav_icon_h_item_text">技术管理</div>
				</a>
				</div>
				<div class="nav_icon_h_item">
				<a href="javascript:;" onclick="leftChange('left/accordition_workshop_mana.html');">
					<div class="nav_icon_h_item_img"><img src="icons/gif/35.gif"/></div>
					<div class="nav_icon_h_item_text">车间管理</div>
				</a>
				</div>
				<div class="nav_icon_h_item">
				<a href="javascript:;" onclick="leftChange('left/accordition_safety_mana.html');">
					<div class="nav_icon_h_item_img"><img src="icons/gif/08.gif"/></div>
					<div class="nav_icon_h_item_text">安全设备</div>
				</a>
				</div>
				<div class="nav_icon_h_item">
				<a href="javascript:;" onclick="leftChange('left/accordition_reports_mana.html');">
					<div class="nav_icon_h_item_img"><img src="icons/gif/45.gif"/></div>
					<div class="nav_icon_h_item_text">查询统计</div>
				</a>
				</div>
			</div>
			<div class="bs_nav">
				<div class="bs_navleft">
					<li>
						欢迎admin用户，今天是
					<script>
						var weekDayLabels = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
						var now = new Date();
					    var year=now.getFullYear();
						var month=now.getMonth()+1;
						var day=now.getDate()
					    var currentime = year+"年"+month+"月"+day+"日 "+weekDayLabels[now.getDay()]
						document.write(currentime)
					</script>
					</li>
					<li class="fontTitle">&nbsp;&nbsp;字号:</li>
					<li class="fontChange"><span><a href="javascript:;" setFont="16">大</a></span></li>
					<li class="fontChange"><span><a href="javascript:;" setFont="14">中</a></span></li>
					<li class="fontChange"><span><a href="javascript:;" setFont="12">小</a></span></li>
					<div class="clear"></div>
				</div>
				<div class="bs_navright">
					<span class="icon_mark hand" onclick='top.Dialog.open({URL:"lesson/skin_tree.html",Title:"皮肤管理",Width:720,Height:445});'>皮肤管理</span>
					<span class="icon_no hand" onclick='top.Dialog.confirm("确定要退出系统吗",function(){window.location="login.html"});'>退出系统</span>
					<a href="../pages/choose.html"><span class="icon_home hand">返回结构选择</span></a>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		</div>
		</div>
	</div>
	<!--头部与导航end-->
	<table width="100%" cellpadding="0" cellspacing="0" class="table_border0">
		<tr>
			<!--左侧区域start-->
			<td id="hideCon" class="ver01 ali01">
								<div id="lbox">
									<div id="lbox_topcenter">
									<div id="lbox_topleft">
									<div id="lbox_topright">
										<div class="lbox_title">操作菜单</div>
									</div>
									</div>
									</div>
									<div id="lbox_middlecenter">
									<div id="lbox_middleleft">
									<div id="lbox_middleright">
											<div id="bs_left">
											<IFRAME scrolling="no" width="100%"  frameBorder=0 id=frmleft name=frmleft src="left/accordition_general_fix.html"  allowTransparency="true"></IFRAME>
											</div>
											<!--更改左侧栏的宽度需要修改id="bs_left"的样式-->
									</div>
									</div>
									</div>
									<div id="lbox_bottomcenter">
									<div id="lbox_bottomleft">
									<div id="lbox_bottomright">
										<div class="lbox_foot"></div>
									</div>
									</div>
									</div>
								</div>
			</td>
			<!--左侧区域end-->
			
			<!--中间栏区域start-->
			<td class="main_shutiao">
				<div class="bs_leftArr" id="bs_center" title="收缩面板"></div>
			</td>
			<!--中间栏区域end-->
			
			<!--右侧区域start-->
			<td class="ali01 ver01"  width="100%">
								<div id="rbox">
									<div id="rbox_topcenter">
									<div id="rbox_topleft">
									<div id="rbox_topright">
										<div class="rbox_title">
											操作内容
										</div>
									</div>
									</div>
									</div>
									<div id="rbox_middlecenter">
									<div id="rbox_middleleft">
									<div id="rbox_middleright">
										<div id="bs_right">
										       <IFRAME scrolling="no" width="100%" frameBorder=0 id=frmright name=frmright src="templete/open.html"  allowTransparency="true"></IFRAME>
										</div>
									</div>
									</div>
									</div>
									<div id="rbox_bottomcenter" >
									<div id="rbox_bottomleft">
									<div id="rbox_bottomright">
	
									</div>
									</div>
									</div>
								</div>
			</td>
			<!--右侧区域end-->
		</tr>
	</table>
	<!--浏览器resize事件修正start-->
	<div id="resizeFix"></div>
	<!--浏览器resize事件修正end-->
  	</body>
</html>
