<%@ page import="com.awareness.trows.util.wechatSDK.entity.WeChatInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String imgPath = WeChatInfo.imgPath;
%>
<!DOCTYPE html>
<html>
<head>

    <title>活动修改</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" type="text/css" href="css/modifyActivity.css">
    <link rel="stylesheet" type="text/css" href="css/weui.min.css">
    <script type="text/javascript" src="js/flexible.js"></script>
</head>
<body>
<!--修改活动表单-->
<form id="modifyAct" action="../alterAct.do">
    <div id="body">
        <!--活动人数-->
        <input type="text" name="perNum" id="perNum" placeholder="活动人数" value="${param.perNum}"/>
        <input type="text" name="location" id="location" placeholder="活动地点" value="${param.location}"/>
        <!--活动时间-->
        <div class="weui_cell_bd weui_cell_primary">
            <input placeholder="活动时间" class="weui_input" type="datetime-local" name="startTime" id="startTime"
                   value="${param.startTime}"/>
        </div>
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
<input type="hidden" id="perStartTime" value="${param.startTime}">
<input type="hidden" id="perDesc" ${param.desc}>

<script src="js/site.modifyActivity.js"></script>
</body>
</html>