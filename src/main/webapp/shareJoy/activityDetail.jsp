<%@ page import="com.awareness.trows.util.wechatSDK.entity.WeChatInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String imgPath = WeChatInfo.imgPath;
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>活动详情</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/base.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/activityDetail.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/weui.min.css">
    <script type="text/javascript" src="./shareJoy/js/flexible.js"></script>
</head>
<body ontouchstart>
<!--提示分享弹出层-->
<div class="dialog" id="dialod">
    <img class="sharetit" src="./shareJoy/asset/sharetit.png"/>
    <img class="sharetip" src="./shareJoy/asset/sharetip.png"/>
    <img class="guanggao" src="./shareJoy/asset/guanggao.png"/>
</div>
<!--中间内容-->
<div id="body">
    <!--个人信息-->
    <div class="act-head-message">
        <!--头像-->
        <a href="./${act.getUserId()}/getUserInfo.do">
            <img class="headimg" src="<%=imgPath%>${act.getUserId()}.jpg"/>
        </a>
        <ul class="detail">
            <!--用户名-->
            <li class="per-name">${act.getUserName()}</li>
            <!--发布时间-->
            <li class="act-tag">${fn:substring(act.getCreateTime(),0,16)}</li>
        </ul>
        <p>${act.getActivityTitle()}</p>
    </div>
    <div class="act-place-time">
        <ul>
            <!--地点-->
            <li class="place">${act.getLocation()}</li>
            <!--时间-->
            <li class="time">${fn:substring(act.getStartTime(),0,16)}</li>
        </ul>
    </div>
    <!--活动详情-->
    <div class="act-text">
        ${act.getDescription()}
        ${act.getRemark()}
    </div>
    <!--参与者列表-->
    <div class="act-join">
        <p>参与者<span>(<span id="joinSp">${act.getJoinNow()}</span>/${act.getPersonNumber()})</span></p>
        <!--成员列表-->
        <ul class="act-member">

        </ul>
    </div>

</div>
<!--底部按钮-->
<div class="act-btn">
    <div class="overdue" id="joinButton"><span id="joinText">已过期</span></div>
    <div class=" share bd spacing">
        <a href="javascript:;" class="weui_btn weui_btn_primary" id="showDialog1">分享</a>
    </div>

</div>
<form id="modify" name="modify" action="./shareJoy/modifyActivity.jsp" method="post">
    <input type="hidden" id="desc" name="desc" value="${act.getDescription()}">
    <input type="hidden" id="actId" name="actId" value="${act.getActivityId()}">
    <input type="hidden" id="perNum" name="perNum" value="${act.getPersonNumber()}">
    <input type="hidden" id="location" name="location" value="${act.getLocation()}">
    <input type="hidden" id="startTime" name="startTime" value="${act.getStartTime()}">
    <input type="hidden" id="nowPerson" name="nowPerson" value="${act.getJoinNow()}">
</form>
<input type="hidden" id="userName" value="${act.getUserName()}">

<input type="hidden" id="img" value="<%=imgPath%>">
<input type="hidden" id="basePath" value="<%=basePath%>">
<input type="hidden" id="actUserId" value="${act.getUserId()}">
<input type="hidden" id="nowUserId" value="${userId}">
<input type="hidden" id="nowUserName" value="${nickName}">
<input type="hidden" id="shareNow" value="${shareNow}">
<input type="hidden" id="pageToken" value="${token}">
<input type="hidden" id="joinNow" value="${act.getJoinNow()}">
<input type="hidden" id="deadLine" value="${act.getDeadLine()}">

<script src="./shareJoy/js/zepto.min.js"></script>
<script src="./shareJoy/js/actionsheet.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="./shareJoy/js/site.actDetail.js"></script>


</body>
</html>