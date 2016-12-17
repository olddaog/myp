<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Custom Collapse Title in Layout - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css"
	href="../js/jquery-easyui-1.4.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../js/jquery-easyui-1.4.5/themes/icon.css">
<script type="text/javascript"
	src="../js/jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript"
	src="../js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
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
</head>
<body>


	<div id="cc" class="easyui-layout" style="width: 100%; height: 80%;">
		<div id="light" class="white_content">
			<form id="ff" method="post">
	    	<table cellpadding="5" border="1">
	    		<tr>
	    			<td>Name:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" name="name" data-options="required:true"></input>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="sendMenu()">Submit</a>
	    			</td>
	    		</tr>
	    		
	    		
	    	</table>
	    </form>
			<a href="javascript:void(0)"
				onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
				Close</a>
		</div>
		<div id="fade" class="black_overlay"></div>
		<div
			data-options="region:'north',split:true,hideCollapsedContent:false"
			style="width: 300px; height: 100px; background-color: 289898">
			<p>
				可以根据自己要求修改css样式<a href="javascript:void(0)"
					onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">点击这里打开窗口</a>
			</p>
		</div>
		<div
			data-options="region:'west',split:true,hideCollapsedContent:false"
			style="width: 300px;">
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
		<div
			data-options="region:'east',split:true,collapsed:true,
				hideExpandTool: true,
				expandMode: null,
				hideCollapsedContent: false,
				collapsedSize: 80,
				collapsedContent: function(){
					return $('#titlebar');
				}
				"
			title="east" style="width: 10%;"></div>
		<div id="con" name="5555" data-options="region:'center'">
		</div>
	</div>
	<div id="titlebar" style="padding: 2px">

		<a href="javascript:void(0)" class="easyui-linkbutton"
			style="width: 100%"
			data-options="iconCls:'icon-large-picture',size:'large',iconAlign:'top'"
			onclick="addPanel()">Picture</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" style="width: 100%"
			data-options="iconCls:'icon-large-shapes',size:'large',iconAlign:'top'"
			onclick="addPanel()">Shapes</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" style="width: 100%"
			data-options="iconCls:'icon-large-smartart',size:'large',iconAlign:'top'"
			onclick="addPanel()">SmartArt</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" style="width: 100%"
			data-options="iconCls:'icon-large-chart',size:'large',iconAlign:'top'"
			onclick="addPanel()">报表</a>

	</div>
</body>
<script type="text/javascript">
	var index = 0;
	var node;
	function addPanel() {
		index++;
		$('#tt').tabs('add', {
			title : 'Tab' + index,
			content : '右键单击菜单弹出菜单新建或编辑页面，新建菜单里面包括单的名字，指向的url ',
			closable : true
		});
	}
	function removePanel() {
		var tab = $('#tt').tabs('getSelected');
		if (tab) {
			var index = $('#tt').tabs('getTabIndex', tab);
			$('#tt').tabs('close', index);
		}
	}
	/* 	$(function(){
			
		    $("#tt2").click(function(e){  
		        $('#menu').menu('show', {
		            left: e.pageX,
		            top: e.pageY
		        });
		    });
		}); */
	function showMenuframe() {
		document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block';
	}
		
	function sendMenu(){
		var	selected=	$("#tree").tree("getSelected");	
		var child=new Object();
		
        child['parentId']=selected.id;
        child['text']="新建菜单";
      
		menujson=	child;  
		 alert(JSON.stringify(menujson));
	
		$.ajax({
			   url:'admin/menu/save.do',
			   type:'POST',
			   data:JSON.stringify(menujson),
			   contentType : "application/json;charset=utf-8",
			   dataType: 'json',
			   success:function(data){	
				   alert(JSON.stringify(data))
			    //	$('#tree').tree('append',{parent:parent.target,data:node}) 	
			    }
			})

		}
		
	function buildMenu(){
			 $.ajax({
				   url:'admin/menu/getmenu.do',
				   type:'GET',
				   data:'',
				   dataType: 'json',
				   success:function(data){	  
					   alert(JSON.stringify(data.resp_data))
					   $('#tree').tree("loadData",data.resp_data)
				    }
				})
		}		
		 buildMenu();
	
		 
		 
</script>

<div id="mm" class="easyui-menu" style="width: 120px;">
	<div onclick="showMenuframe()" data-options="iconCls:'icon-add'">新建</div>
	<div onclick="removeit()" data-options="iconCls:'icon-remove'">删除</div>
	<div class="menu-sep"></div>
	<div onclick="expand()">Expand</div>
	<div onclick="collapse()">Collapse</div>
</div>

<div id="menu" class="easyui-menu" style="width: 150px;">
	<div id="m-refresh">刷新</div>
	<div class="menu-sep"></div>
	<div id="m-closeall">全部关闭</div>
	<div id="m-closeother">除此之外全部关闭</div>
	<div class="menu-sep"></div>
	<div id="m-close">关闭</div>
</div>
</html>