<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'AddFilmMsg1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">
		var time=3;
		function bian(){
			var div=document.getElementById("div1");
			div.innerHTML="添加成功<font color='red'>"+time+"</font>秒后跳转";
			time--;
			setTimeout("bian()",1000);
		}
	</script>
  </head>
  
  <body onload="bian()" background="../Image/right_1.gif">
  <% 
  	response.setHeader("refresh","3;url=AddFilm.jsp");
  %>
    <div id="div1" style="position: absolute;left:200px;top:200px;"></div>
  </body>
</html>
