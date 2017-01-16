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
	<div class="easyui-layout" style="width:100%;height: 98%;">
		<div id="p" data-options="region:'west'"  style="width:50%;height: 100%">
		<table class="easyui-datagrid" style="width:100%;height: 100%;padding:5px;"
			data-options="rownumbers:true,singleSelect:true,url:'/admin/role/showRoles.do',method:'get',toolbar:toolbar">
		<thead>
			<tr>
				<th data-options="field:'name',width:100">角色名</th>
				<th data-options="field:'id',width:100">角色编号</th>
				
			</tr>
		</thead>
	</table>
		</div>
		<div data-options="region:'center'" >
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
	</div>

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
		
	</script>
</body>
</html>