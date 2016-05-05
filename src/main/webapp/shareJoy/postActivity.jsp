<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<title>发布活动</title>
	<meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<link rel="stylesheet" type="text/css" href="./shareJoy/css/weui.min.css">

	<link rel="stylesheet" type="text/css" href="./shareJoy/css/sm.min.css">
	<link rel="stylesheet" type="text/css" href="./shareJoy/css/base.css">
	<link rel="stylesheet" type="text/css" href="./shareJoy/css/postActivity.css">
	<script type="text/javascript" src="./shareJoy/js/zepto.min.js"></script>
</head>
<body>

<!--发布活动表单-->
 <form id="postAct" action="./addActivity.do" name="myForm" method="post">
	 <div id="body">
	 <%--获取活动类型信息--%>
	 <input type="hidden" name="actType" value="${param.actType}">
	 <%--设置表单令牌--%>
	 <input type="hidden" name="pageToken" value="${token}">

 	    <!--活动人数-->
	 	<input placeholder="活动人数" name="actNum"/>
	 	<!--活动时间-->
		<div class="page page-current" id='page-datetime-picker'>
			<input type="text" placeholder="" id='datetime-picker' name="startTime" />
		</div>
        <!--活动内容-->
	 	<textarea class="act-content" placeholder="活动简述" name="actName"></textarea>
	 	<!--发布按钮-->
	 	<button type="submit" class="act-public weui_btn weui_btn_primary">发布活动</button>
	 </div>
 </form>
 <%--<script src="postActivity.jsp" type="javascript"></script>--%>
<script type="text/javascript" src="./shareJoy/js/sm.min.js"></script>
<script type="text/javascript">
	$(function(){

		$(document).on("pageInit", "#page-datetime-picker", function(e) {
			$("#datetime-picker").datetimePicker({
				toolbarTemplate: '<header class="bar bar-nav">\
          <button class="button button-link pull-right close-picker">确定</button>\
          <h1 class="title">选择日期和时间</h1>\
          </header>'
			});
			//设置默认时间
			$("#datetime-picker").datetimePicker({
				value: ['1985', '12', '04', '9', '34']
			});
		});


		$.init();
	})
</script>
</body>
</html>