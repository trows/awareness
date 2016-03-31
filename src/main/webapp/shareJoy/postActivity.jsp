<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>发布活动</title>
	<meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />

	<link rel="stylesheet" type="text/css" href="css/weui.min.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/postActivity.css">
	<script type="text/javascript" src="js/flexible.js"></script>
</head>
<body>

<!--发布活动表单-->
 <form id="postAct" action="../addActivity.do" name="myForm" method="post">
	 <%--获取活动类型信息--%>
	 <input type="hidden" name="actType" value="${param.actType}">
	 <%--设置表单令牌--%>
	 <input type="hidden" name="pageToken" value="${token}">
 	<div id="body"> 
 	    <!--活动人数-->
	 	<input placeholder="活动人数" name="actNum"/>
	 	<!--活动时间-->
	 	<div class="weui_cell_bd weui_cell_primary">
           <input placeholder="活动时间" class="weui_input" type="datetime-local" name="appDateTime1"/>
        </div>
        <!--活动内容-->
	 	<textarea class="act-content" placeholder="活动简述" name="actName"></textarea>
	 	<!--发布按钮-->
	 	<button type="submit" class="act-public weui_btn weui_btn_primary">发布活动</button>
    </div>
 </form>
 
</body>
</html>