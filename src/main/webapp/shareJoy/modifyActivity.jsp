<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>活动修改</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/weui.min.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/sm.min.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/base.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/postActivity.css">
    <script type="text/javascript" src="./shareJoy/js/zepto.min.js"></script>
</head>
<body>
<!--修改活动表单-->
<form id="modifyAct" action="./alterAct.do">
    <div id="body">
        <!--活动时间-->
        <div class="page page-current" id='page-datetime-picker'>
            <input type="text" placeholder="" id='datetime-picker' name="startTime" />
        </div>
        <!--活动人数-->

        <input type="text" name="perNum" id="perNum" placeholder="活动人数" value="${param.perNum}"/>
        <br><br> <br><br>
        <input type="text" name="location" id="location" placeholder="活动地点" value="${param.location}"/>

        <!--活动内容-->
        <textarea class="act-content" placeholder="活动详情" rows="3" cols="20" name="desc"
                  id="desc">${param.desc}</textarea>
        <input type="hidden" id="remark" name="remark" value="">
        <input type="hidden" id="actId" name="actId" value="${param.actId}">
        <input type="hidden" name="pageToken" value="${token}">
        <!--提交按钮-->
        <button type="button" class="act-public weui_btn weui_btn_primary" onclick="submitForm()">提交</button>
    </div>
</form>
<input type="hidden" id="perPerNum" value="${param.perNum}">
<input type="hidden" id="perLocation" value="${param.location}">
<input type="hidden" id="perStartTime" value="${fn:substring(param.startTime,0,16)}">
<input type="hidden" id="perDesc" value="${param.desc}">
<input type="hidden" id="nowPerson" value="${param.nowPerson}" >

<script type="text/javascript" src="./shareJoy/js/sm.min.js"></script>
<script src="./shareJoy/js/site.modifyActivity.js"></script>

</body>
</html>