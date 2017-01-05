<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/js/jquery-easyui-1.4.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/js/jquery-easyui-1.4.5/themes/icon.css">
<script type="text/javascript"
	src="/js/jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript"
	src="/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
</head>
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>

<body style="height: 95%;">
<div id="light" class="white_content">
			<form id="ff" method="post">
				<table cellpadding="5" border="1">
					<tr>
						<td>菜单名:</td>
						<td><input id="tss"  type="text" name="name"
							data-options="required:true"></input> <a
							href="javascript:void(0)" class="easyui-linkbutton"
							onclick="sendMenu(this)">Submit</a></td>
					</tr>


				</table>
			</form>
			<a href="javascript:void(0)"
				onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
				Close</a>
		</div>
		<div id="fade" class="black_overlay"></div>
		<div style="height: 100%;">
	<div id="cc" style="width:100%;height: 100%;">
		<div data-options="region:'west'" style="width:40%;">
		<ul id="tree" class="easyui-tree"
				data-options="
				onContextMenu: function(e,node){
					e.preventDefault();
					
					$(this).tree('select',node.target);
					$('#mm').menu('show',{
						left: e.pageX,
						top: e.pageY
					});
				}
			">
			</ul>
		
		
		</div>
				
		<div data-options="region:'center'" style="height:100%;padding:10px">
			<table class="easyui-datagrid" style="width:100%;height:100%"
			data-options="rownumbers:true,singleSelect:true,url:'/admin/role/showRoles.do',method:'get',toolbar:toolbar">
		<thead>
			<tr>
				<th data-options="field:'name',width:200">姓名</th>
				<th data-options="field:'id',width:100">年龄</th>
				<th data-options="field:'id',width:50">性别</th>
				
			</tr>
		</thead>
	</table>
	
		</div>
	</div>
	</div>
	<script type="text/javascript">
	$.ajax({
		url : '/admin/org/list.do?parentId=0',
		type : 'GET',
		data : '',
		dataType : 'json',
		success : function(data) {
			alert(JSON.stringify(data.resp_data))
			$('#tree').tree("loadData", data.resp_data)
		}
	})
	
	function showMenuframe() {
		document.getElementById('light').style.display = 'block';
		document.getElementById('fade').style.display = 'block';
	}
	
	
	function sendMenu(dom) {
		var selected = $("#tree").tree("getSelected");
		//alert(dom.id)
		var child = new Object();

		child['parentId'] = selected.id;
		child['text'] = document.getElementById("tss").value;
		menujson = child;
		alert(JSON.stringify(menujson));
		$.ajax({
			url : '/admin/menu/save.do',
			type : 'POST',
			data : JSON.stringify(menujson),
			contentType : "application/json;charset=utf-8",
			dataType : 'json',
			success : function(data) {
				alert(JSON.stringify(data))	
			}
		})

	}
	
		$(function(){
			$('#cc').layout();
			//setHeight();
		});
		
		function addItem(){
			$('#cc').layout('panel','center').append('<p>More Panel Content.</p>');
		//	setHeight();
		}
		
		function removeItem(){
			$('#cc').layout('panel','center').find('p:last').remove();
		//	setHeight();
		}
		
		function setHeight(){
			var c = $('#cc');
			var p = c.layout('panel','center');	// get the center panel
			var oldHeight = p.panel('panel').outerHeight();
			p.panel('resize', {height:'auto'});
			var newHeight = p.panel('panel').outerHeight();
			c.layout('resize',{
				height: (c.height() + newHeight - oldHeight)
			});
		}
	</script>
	<script type="text/javascript">
		var toolbar = [{
			text:'新建',
			iconCls:'icon-add',
			handler:function(){alert('add')}
		},{
			text:'删除',
			iconCls:'icon-cut',
			handler:function(){alert('cut')}
		},'-',{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){alert('save')}
		}];
	</script>
	<div id="mm" class="easyui-menu" style="width: 120px;">
	<div onclick="showMenuframe()" data-options="iconCls:'icon-add'">新建</div>
	<div onclick="removeit()" data-options="iconCls:'icon-remove'">删除</div>
	<div class="menu-sep"></div>
	<div onclick="expand()">Expand</div>
	<div onclick="collapse()">Collapse</div>
</div>
</body>
</html>