<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<body>

	
	<div id="cc" style="width:100%;height:400px;">
	
	
		<div data-options="region:'west'" style="width:40%;"></div>
		<div data-options="region:'center'" style="height:100%;padding:10px">
			<p>Panel Content.</p>
			<p>Panel Content.</p>
			<p>Panel Content.</p>
			<p>Panel Content.</p>
			<p>Panel Content.</p>
		</div>
	</div>
	<script type="text/javascript">
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
</body>
</html>