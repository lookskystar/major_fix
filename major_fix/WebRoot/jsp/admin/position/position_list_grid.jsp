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
	    <title>职位管理数据列表</title>
		<!--框架必需start-->
		<script type="text/javascript" src="js/jquery-1.4.js"></script>
		<script type="text/javascript" src="js/framework.js"></script>
		<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
		<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
		<!--框架必需end-->
		<!--截取文字start-->
		<script type="text/javascript" src="js/text/text-overflow.js"></script>
		<!--截取文字end-->
		<script type="text/javascript">
		$(document).ready(function(){
			//提交表单刷新数据grid关闭窗口
			top.Dialog.close();
			
			//pageSize[5, 10, 15] 
			$("#pageSize").bind('change', function(){
				var pageSize = $(this).val();
				//设置分页pageSize
				$("#pageSize", parent.document).val(pageSize);
				//提交查询
				var queryForm = $("#admin_position_query_form", parent.document);
				queryForm.attr("action", "positionAction!dataGridOfPosition.action");
				queryForm.submit();
			});
		});
		
		//批量删除职位信息
		function positionDeleteOfBatch(){
			var rows = $("input[name='position']:checked");
			var ids = [];
		    if (rows.length > 0) {  
		    	top.Dialog.confirm("确认删除？",function(){
		    		for ( var i = 0; i < rows.length; i++) {
						ids.push($(rows[i]).val());
					}
		    		$.ajax({
						type : "get",
						dataType : 'json',
						url:"<%=basePath%>positionAction!positionRemoveOfBatch.action",
						data:{"ids":ids.join(",")},
						success : function(obj, textStatus, jqXHR) {
							top.Dialog.alert(obj.message, function(){
								top.window.frmright.frames("frmrightGrid").location.href = 
									top.window.frmright.frames("frmrightGrid").location.href;
			    			});
						}
					});
		    	});
		    }else {
		    	top.Dialog.alert("请至少选择一条信息！");
		    }
		};
		
		//删除职位信息
		function positionDelete(id){
	    	top.Dialog.confirm("确认删除？",function(){
	    		$.ajax({
					type : "post",
					dataType : 'json',
					url:"<%=basePath%>positionAction!positionRemove.action",
					data:{"id":id},
					success : function(obj, textStatus, jqXHR) {
						top.Dialog.alert(obj.message, function(){
							top.window.frmright.frames("frmrightGrid").location.href = 
								top.window.frmright.frames("frmrightGrid").location.href;
		    			});
					}
				});
	    	});
		};
		
		//编辑职位信息
		function positionEditOfBatch(){
			var rows = $("input[name='position']:checked");
		    if (rows.length > 0) {  
				var diag = new top.Dialog();
				diag.Title = "编辑职位";
				diag.Height = 270;
				diag.Width = 420;
				diag.URL = "positionAction!positionEditShow.action?id="+ rows[0].value;
				diag.show();
		    }else {
		    	top.Dialog.alert("请至少选择一条信息！");
		    }
		};
		
		//编辑职位信息
		function positionEdit(id){
			var diag = new top.Dialog();
			diag.Title = "编辑职位";
			diag.Height = 270;
			diag.Width = 420;
			diag.URL = "positionAction!positionEditShow.action?id="+ id;
			diag.show();
		};

		//查看职位信息
		function positionView(id){
			var diag = new top.Dialog();
			diag.Title = "查看职位";
			diag.Height = 300;
			diag.Width = 420;
			diag.URL = "positionAction!positionView.action?id="+ id;
			diag.show();
		};

		//排序
		function positionSort(sortColum){
			//设置排序字段
			var sort = $("#sort", parent.document);
			sort.val(sortColum);
			//设置排序方式
			var order = $("#order", parent.document);
			order.val((order.val() == "desc")? "asc": "desc");
			var offSet = ${pm.offset};
			//提交查询
			var queryForm = $("#admin_position_query_form", parent.document);
			queryForm.attr("action", "positionAction!dataGridOfPosition.action?pager.offset=" + offSet);
			queryForm.submit();
		};
		</script>
	</head>
  	<body>
  		<div>
			<table class="tableStyle" sortMode="true" headFixMode="true" useMultColor="true" useCheckBox="true">
				<tr>
					<th width="7%"></th>
					<th width="10%"><span id="num" onclick="positionSort(this.id);">职位编号</span></th>
					<th width="12%"><span id="name" onclick="positionSort(this.id);">职位名称</span></th>
					<th width="20%"><span id="desc" onclick="positionSort(this.id);">职位描述</span></th>
					<th width="20%"><span id="createTime" onclick="positionSort(this.id);">创建时间</span></th>
					<th width="20%"><span id="lastModifyTime" onclick="positionSort(this.id);">最后修改时间</span></th>
					<th width="10%">操作</th>
				</tr>
			</table>
		</div>
   		<div id="scrollContent">
   			<div style="height: 275px;overflow: auto;">
				<table class="tableStyle" useMultColor="true" useCheckBox="true">
					<c:if test="${!empty pm.datas}">
						<c:forEach items="${pm.datas}" var="position">
							<tr align="center">
								<td width="7%"><input type="checkbox" id="${position.id }" name="position" value="${position.id }"/></td>
								<td width="10%">${position.num }</td>
								<td width="12%">${position.name }</td>
								<td width="20%">${position.desc }</td>
								<td width="20%">${position.createTime }</td>
								<td width="20%">${position.lastModifyTime }</td>
								<td width="10%">
									<span class="img_view hand" title="查看" style="margin-left: 10px;" onclick="positionView('${position.id }');"></span>
									<span class="img_edit hand" title="修改" style="margin-left: 10px;" onclick="positionEdit('${position.id }');"></span>
									<span class="img_delete hand" title="删除" style="margin-left: 10px;" onclick="positionDelete('${position.id }');"></span>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pm.datas}">
						<tr> <td class="ver01" align="center" colspan="8">没有相应的职位信息!</td></tr>
					</c:if>
				</table>
			</div>
			<!-- 处理分页start -->
			<div style="height: 150px;">
				<div class="float_left padding5">  当前共有${pm.count}条信息。</div>
				<div class="float_right padding5 paging">
					<div class="float_left padding_top4">
						<pg:pager maxPageItems="${pm.pageSize }" url="positionAction!dataGridOfPosition.action" items="${pm.count }" export="currentPageNumber=pageNumber">
							<pg:param name="name" value="${position.name }" />
							<pg:param name="num" value="${position.num }" />
							<pg:param name="pageSize" value="${pm.pageSize }" />
					  		<pg:first>
								 <span><a href="${pageUrl }" id="first">首页</a></span>
					 		</pg:first>
					 		<pg:prev>
								  <span><a href="${pageUrl }">上一页</a></span>
					  		</pg:prev>
				  	  		<pg:pages>
								<c:choose>
									<c:when test="${currentPageNumber==pageNumber }">
										<span class="paging_current"><a href="javascript:;">${pageNumber }</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="${pageUrl }">${pageNumber }</a></span>
									</c:otherwise>
								</c:choose>
					  		</pg:pages>
					  		<pg:next>
							    <span><a href="${pageUrl }">下一页</a></span>
					  		</pg:next>
					  		<pg:last>
							  	<span><a href="${pageUrl }">末页</a></span>
					 		</pg:last>
					 	</pg:pager>
					</div>
					<div class="float_left" style="margin-top: 2px;">
						每页
						<select autoWidth="true" class="default" id="pageSize">
							<option value="5"<c:if test="${pm.pageSize == 5}">selected="selected"</c:if>>5</option>
							<option value="10"<c:if test="${pm.pageSize == 10}">selected="selected"</c:if>>10</option>
							<option value="15"<c:if test="${pm.pageSize == 15}">selected="selected"</c:if>>15</option>
						</select>
						条记录
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<!-- 处理分页end -->
		</div>
  	</body>
</html>
