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
	z-index: 1003;
	overflow: auto;
}

.black_overlay2 {
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

.white_content2 {
	display: none;
	position: absolute;
	top: 5%;
	left: 5%;
	width: 90%;
	height: 85%;
	padding: 1px;
	border: 1px solid orange;
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
					<td><input id="tss" type="text" name="name"
						data-options="required:true"></input> <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="sendMenu(this)">Submit</a></td>
				</tr>


			</table>
		</form>
		<a href="javascript:void(0)"
			onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
			Close</a>
	</div>
	<div id="fade" class="black_overlay"></div>

	<div id="light2" class="white_content2">
		<form id="ff" method="post" action="/user/save.do">
			<br>
			<table width="731" border="1" cellpadding="5" cellspacing="0"
				bordercolor="#00FFFF" bgcolor="#FFFFFF">
				<tr bgcolor="#FFFFFF">
					<td width="162" height="41"><div align="right">姓名:</div></td>
					<td width="393"><input id="name" type="text" name="name"
						data-options="required:true"> </input></td>
					<td width="138" rowspan="3"><img src="" name="imgPre"
						width="96%" height="154" id="imgPre" style="display: block;"
						onclick="F_Open_dialog()" /></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="162" height="48"><div align="right">性别:</div></td>
					<td width="393"><input id="sex" type="text" name="sex"
						data-options="required:true"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="162" height="78"><div align="right">手机:</div></td>
					<td width="393"><input id="phone" type="text" name="phone"
						data-options="required:true"> </input></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="162" height="31"><div align="right">住址:</div></td>
					<td width="393"><input name="address" type="text" id="address"
						size="50" data-options="required:true"></td>
					<td></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="162" height="31"><div align="right">账号:</div></td>
					<td width="393"><input id="userName" type="text"
						name="userName" data-options="required:true"></td>
					<td></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="162" height="32"><div align="right">角色:</div></td>
					<td width="393" bordercolor="#FFFFFF"><label> <input
							class="easyui-combobox" name="language" style="width: 180px;"
							data-options="
					url:'combobox_data1.json',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'
			">
					</label></td>
					<td></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="162" height="44">&nbsp;</td>
					<td width="393">&nbsp;</td>
					<td><label>
							<div align="center">
								<button onclick="createUser()">创建</button>
							</div>
					</label></td>
				</tr>
			</table>
			<input id="imm" type="file" id="imgOne"
				onchange="preImg(this.id,'imgPre');" style="display: none">
		</form>
		<!-- <a href="javascript:void(0)"
				onclick="document.getElementById('light2').style.display='none';document.getElementById('fade2').style.display='none'">
				Close</a> -->
	</div>
	<div id="fade2" class="black_overlay2"></div>

	<div style="height: 100%;">
		<div id="cc" style="width: 100%; height: 100%;">
			<div data-options="region:'west'" style="width: 30%;">
				<ul id="tree" class="easyui-tree"
					data-options="
				onContextMenu: function(e,node){
					e.preventDefault();
					$(this).tree('select',node.target);
					$('#mm').menu('show',{
						left: e.pageX,
						top: e.pageY
					});
				},
				
				onSelect:function(e,node){
				//
					var selected = $('#tree').tree('getSelected');
					getUsersByOrgId(selected.id)
			     	alert(selected.text);
			     	
				}">
				</ul>


			</div>

			<div data-options="region:'center'"
				style="height: 100%; padding: 10px">
				<table id="dd" class="easyui-datagrid"
					style="width: 95%; height: 100%"
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
	
	
	
	
	function showMenuframe() {
		document.getElementById('light').style.display = 'block';
		document.getElementById('fade').style.display = 'block';
	}
	function showCreateUser() {
		document.getElementById('light2').style.display = 'block';
		document.getElementById('fade2').style.display = 'block';
	}
	
	function sendMenu(dom) {
		var selected = $("#tree").tree("getSelected");
		//alert(dom.id)
		var child = new Object();

		child['parentId'] = selected.id;
		child['text'] = document.getElementById("tss").value;
		child['name'] = document.getElementById("tss").value;
		menujson = child;
		alert(JSON.stringify(menujson));
		$.ajax({
			url : '/admin/org/save.do',
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
			$.ajax({
				url : '/admin/org/list.do?parentId=0',
				type : 'GET',
				data : '',
				dataType : 'json',
				success : function(data) {
				//	alert(JSON.stringify(data.resp_data))
					$('#tree').tree("loadData", data.resp_data)
				}
			})
		});
		var toolbar = [{
			text:'新建用户',
			iconCls:'icon-add',
			handler:function(){alert('add');
			showCreateUser();
			}
		},{
			text:'删除用户',
			iconCls:'icon-cut',
			handler:function(){alert('cut')}
		}];
		
		
		
		function getUsersByOrgId(id){
			$.ajax({
				url : '/user/getUsersByOrg.do?orgId='+id,
				type : 'GET',
				data : '',
				dataType : 'json',
				success : function(data) {
				//	alert(JSON.stringify(data.resp_data))
					$('#dd').datagrid("loadData", data.resp_data)
				}
			})
		}
		
      
		function createUser(){
			var name=$("#name").val();
			var sex=$("#sex").val();
			var phone=$("#phone").val();
			var userName=$("#userName").val();
			var User = {}; 
			User.name=name;
			User.sex=sex;
			User.phone=phone;
			User.userName=userName;
			var selected = $("#tree").tree("getSelected");
			alert(JSON.stringify(User))
			$.ajax({
				url : '/user/save.do?orgId='+selected.id,
				type : 'POST',
				data : JSON.stringify(User),
				contentType : "application/json;charset=utf-8",
				dataType : 'json',
				success : function(data) {
				
				}
			})
			
			
			
			
             			
			
	/* var	aaa=	$("#ff").serializeArray();
	alert(JSON.stringify(aaa));
		  //ajax表单提交
		  alert(21)
		  
			$("ff").submit(function(e){
				  alert("Submitted");
				}); */
		}
		
		function getFileUrl(sourceId) { 
			var url; 
			if (navigator.userAgent.indexOf("MSIE")>=1) { // IE 
			url = document.getElementById(sourceId).value; 
			} else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox 
			url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
			} else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome 
			url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
			} 
			return url; 
			} 

			/** 
			* 将本地图片 显示到浏览器上 
			*/ 
			function preImg(sourceId, targetId) { 
			var url = getFileUrl(sourceId); 
			var imgPre = document.getElementById(targetId); 
			imgPre.src = url; 
			} 
			 function F_Open_dialog() 
		       { 
		            document.getElementById("imm").click(); 
		       } 
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