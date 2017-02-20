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
<body style="height: 95%;">
	<div class="easyui-layout" style="width: 100%; height: 98%;">
		<div id="p" data-options="region:'west'"
			style="width: 29%; height: 100%">
			<table id="dg" class="easyui-datagrid"
				style="width: 100%; height: 95%; padding: 5px;"
				data-options="rownumbers:true,singleSelect:true,url:'/admin/role/showRoles.do',method:'get',toolbar:toolbar">
				<thead>
					<tr>
						<th data-options="field:'name',width:100">角色名</th>
						<th data-options="field:'id',width:100">角色编号</th>

					</tr>
				</thead>
			</table>
		</div>
		<div data-options="region:'center'">
			<table id="tg" class="easyui-treegrid"
				style="width: 100%; height: 95%"
				data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
		     	cache:false,
		
				lines:true,
				collapsible: true,
				fitColumns: true,
				singleSelect:false,
				idField: 'id',
				treeField: 'checked',
				treeField: 'name',
				toolbar:toolbar2
			">
				<thead>
					<tr>
						<th
							data-options="field:'name',width:80,editor:'text'" >权限名字</th>
							<th
							data-options="field:'id',width:80,editor:'text'" >权id</th>
							
							<th
							data-options="field:'added',width:10,editor:'text',formatter:formatProgress"" >分配</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		var bflag = 0;
		var menus=null;
		var toolbar = [ {
			text : '新建',
			iconCls : 'icon-add',
			handler : function() {
				alert('add')
			}
		}, {
			text : '删除',
			iconCls : 'icon-cut',
			handler : function() {
				alert('cut')
			}
		}, '-', {
			text : '保存',
			iconCls : 'icon-save',
			handler : function() {
				alert('save')
			}
		} ];
		var toolbar2 = [ {
			text : '修改权限',
			iconCls : 'icon-edit',
			handler : function() {

				var selected = $('#dg').datagrid("getSelected");

				//alert('edit')
				
						$.ajax({
							url : '/admin/menu/getmenuSet.do',
							type : 'POST',
							data : "",
							dataType : 'json',
							success : function(data) {
							menus=	data.resp_data;
							alert(JSON.stringify(menus));//6030.99
								$.ajax({
									url : '/admin/menu/getAllMenu.do?roleId=' + selected.id,
									type : 'GET',
									data : '',
									dataType : 'json',
									success : function(data) {
										//	alert(JSON.stringify(data.resp_data))
										//unselectAll
										bflag = 1;
										$('#tg').treegrid("loadData", data.resp_data);
										alert(1);
										var selectons = $('#tg').treegrid("getSelections");
										alert(selectons.length);
										for (i = 0; i < selectons.length; i++) {
											$('#tg').treegrid("unselect", selectons[i].id);
										}

										$('#tg').treegrid("unselectAll");

										alert(2);
									}
								})
								
							}
						})
				
				
				
				

			}
		}, '-', {
			text : '保存',
			iconCls : 'icon-save',
			handler : function() {
				alert('save');
				assignMenu();
			}
		} ];

		/* $.ajax({
			url : '/admin/menu/getAllMenu.do',
			type : 'GET',
			data : '',
			dataType : 'json',
			success : function(data) {
				alert(JSON.stringify(data.resp_data))
				$('#tree').tree("loadData", data.resp_data)
			}
		}) */

		$(function() {
			$('#cc').layout();
		});

		function getSelected() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$.messager.alert('Info', row.name);
			}
		}

		$('#dg').datagrid(
				{
					onSelect : function() {
						//alert(2);

						var selected = $('#dg').datagrid("getSelected");
						//title

						//alert(selected.id)
						$.ajax({
							url : '/admin/menu/getMenusByRole.do?roleId='
									+ selected.id,
							type : 'GET',
							data : '',
							dataType : 'json',
							success : function(data) {
								//	alert(JSON.stringify(data.resp_data))
								bflag = 0;
								$('#tg').treegrid("loadData", data.resp_data);

							}
						})
					}
				});

		function assignMenu() {

		//	alert()
			alert(JSON.stringify($('#tg').treegrid("getSelections")))
				var selected = $('#dg').datagrid("getSelected");
			$.ajax({
							url : '/admin/menu/assignMenuByRole.do?roleId='
									+ selected.id+"&menus="+JSON.stringify($('#tg').treegrid("getSelections")),
							type : 'POST',
							data : "",
							dataType : 'json',
							success : function(data) {
								//	alert(JSON.stringify(data.resp_data))
								/* bflag = 0;
								$('#tg').treegrid("loadData", data.resp_data);
 */
							}
						})

		}
		function formatProgress(value) {

		var	flag=new Boolean(value)
			if (bflag == 1&&value==1) {
				var s = '<div style="width:100%;border:0px solid #ccc">'
					+ '<div style="width: + 100%'
					+ '%;background:#cf2020;color:#fff">' + '&nbsp' + '</div>'
					'</div>';
			return s;
			
			}
		if (bflag != 1) {
			return "是";
		}
			
		

		

		}
	</script>
</body>
</html>