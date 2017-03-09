<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<table width="418" border="1" cellpadding="5" cellspacing="0">

				<tr>
					<td><div align="right">地址：</div></td>
					<td><label> <input type="text" name="textfield" />
					</label></td>
				</tr>
				<tr>
					<td><div align="right">菜单名：</div></td>
					<td><input id="tss" type="text" name="name"
						data-options="required:true"></input> <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="sendMenu(this)">Submit</a></td>
				</tr>
			</table>
		</form>

		<!-- <a href="javascript:void(0)"
				onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
				Close</a> -->
	</div>
	<div id="fade" class="black_overlay"></div>
	<div id="cc" style="width: 100%; height: 100%">
		<div data-options="region:'west'" style="width: 40%;">
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

		<div data-options="region:'center'"
			style="height: 100%; padding: 10px">
			<table id="pg" class="easyui-propertygrid" style="width: 100%;height:95%"
				data-options="
			
				method:'get',
				showGroup:true,
				scrollbarSize:0
			">
			</table>
		</div>
	</div>
	<script type="text/javascript">
	$.ajax({
		url : '/admin/menu/getAllMenu.do',
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
				alert(JSON.stringify(data))	;
				
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
		

		$('#tree').tree(
				{
					onSelect : function() {
						var selected = $('#tree').tree("getSelected");
						
						$.ajax({
							url : '/admin/menu/lookMenuInfo.do?menuId='+selected.id,
							type : 'Get',
							data :"",
							dataType : 'json',
							success : function(data) {
								alert(JSON.stringify(data))	;
								$("#pg").propertygrid("loadData",data.resp_data)
							}
						})
						
					}
				});
		
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