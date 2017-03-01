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
			style="width: 40%; height: 100%">
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
				singleSelect:true,
				idField: 'id',
				treeField: 'checked',
				treeField: 'name',
				toolbar:toolbar2
				
			">
				<thead>
					<tr>
						<th data-options="field:'name',width:80,editor:'text'">权限名字</th>
						<th data-options="field:'id',width:80,editor:'text',formatter:formatProgress">是否已分配</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		var bflag = 0;
		var menus = new Array();

		var toolbar = [ {
			text : '新建角色',
			iconCls : 'icon-add',
			handler : function() {
				alert('add')
			}
		}, {
			text : '删除角色',
			iconCls : 'icon-cut',
			handler : function() {
				alert('cut')
			}
		}, '-', {
			text : '保存角色',
			iconCls : 'icon-save',
			handler : function() {
				alert('save')
			}
		} ];
		var toolbar2 = [
				{
					text : '按角色授权',
					iconCls : 'icon-edit',
					handler : function() {

						var selected = $('#dg').datagrid("getSelected");

						//alert('edit')

						$.ajax({
							url : '/admin/menu/getmenuSet.do?roleId='
								+ selected.id,
							type : 'POST',
							data : "",
							dataType : 'json',
							success : function(data2) {
								menus = data2.resp_data;
								
								$.ajax({
									url : '/admin/menu/getAllMenu.do?roleId='
											+ selected.id,
									type : 'GET',
									data : '',
									dataType : 'json',
									success : function(data) {
										//	alert(JSON.stringify(data.resp_data))
										//unselectAll
										bflag = 1;
										$('#tg').treegrid("loadData",
												data.resp_data);
										var selectons = $('#tg').treegrid("getSelections");
										//alert(selectons.length);
										for (i = 0; i < selectons.length; i++) {
											$('#tg').treegrid("unselect",
													selectons[i].id);
										}

										$('#tg').treegrid("unselectAll");

									}
								})

							}
						})

					}
				}, '-', {
					text : '保存权限',
					iconCls : 'icon-save',
					handler : function() {
						//alert('save');
						//assignMenu();
						jqchk();
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

		/* function assignMenu() {

			//	alert()
			alert(JSON.stringify($('#tg').treegrid("getSelections")))
			var selected = $('#dg').datagrid("getSelected");
			

		} */

		function formatProgress(value) {
			var	cflag=0;
			//如果是修改权限    
			if (bflag == 1) {
				//如果该菜单分配给当前角色
				for(i=0;i<menus.length;i++){
					if(menus[i].id==value){
						cflag=1;
						break;
					}
				
				}				
				if (cflag == 1) {
				//	alert(JSON.stringify(menus));//6030.99
					var s = '<div style="width:100%;border:0px solid ">'
							+ '<div style="width: + 100%'
							+ '">'
							+ '<input name="fff" type="checkbox" value="'+value+'"  checked="checked"   />'
							+ '</div>'
					'</div>';
					return s;
				} else {
					var f = '<div style="width:100%;border:0px solid green">'
							+ '<div style="width: + 100%'
							+ ';">'
							+ '<input name="fff"  type="checkbox" value="'+value+'"   />'
							+ '</div>'
					'</div>';
					return f;
				}

			}
			
			
			
			if (bflag != 1) {
				return "是";
			}

		}

		function jqchk(){  //jquery获取复选框值    
			  var chk_value =[];  
				var selected = $('#dg').datagrid("getSelected");
			  $('input[name="fff"]:checked').each(function(){    
			   chk_value.push($(this).val());    
			  });    
		//	  alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);    
                     $.ajax({
				url : '/admin/menu/assignMenuByRole.do?roleId=' + selected.id,
				type : 'POST',
				data : JSON.stringify(chk_value),
				contentType : "application/json;charset=utf-8",
				dataType : 'json',
				success : function(data) {
				
				if(data.resp_code==200){
					alert("分配成功");
				}
					
				}
			})
		
		
		
		}   
		
		
	</script>
</body>
</html>