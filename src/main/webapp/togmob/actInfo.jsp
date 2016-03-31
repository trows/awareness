<!--活动详情-->
<%@ page import="java.util.UUID" %>
<%@ page import="com.awareness.trows.util.wechatSDK.entity.WeChatInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String imgPath = WeChatInfo.imgPath;
%>
<%--测试信息设定--%>
<%--<%--%>
    <%--long id = 45314399838820L;--%>
    <%--session.setAttribute("userId", id);--%>
    <%--session.setAttribute("nickName", "一屁冲天");--%>
    <%--if (session.getAttribute("token") == null)--%>
        <%--session.setAttribute("token", UUID.randomUUID().toString());--%>

<%--%>--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>${act.getActivityTitle()}</title>
    <link rel="stylesheet" type="text/css" href="./togmob/css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="./togmob/css/mypage.css" media="screen"/>

</head>

<body>
<header>
    <!----------------------------------头像部分开始-------------------------->
    <div class="container-fluid">
        <div id="person" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <!--------------------头像外的白色边框开始----------->
            <img src="./togmob/images/border1.png" width="85" height="85" alt=""/>
            <!--------------------头像外的白色边框结束----------->
            <!--------------------头像图片部分开始----------->
            <div id="head_pic" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <img src="<%=imgPath%>${act.getUserId()}.jpg" width="80" height="80" alt=""/>
            </div>
            <!--------------------头像图片部分结束----------->
        </div>
    </div>
    <!----------------------------------头像部分结束-------------------------->
    <!----------------------------------头像名称部分开始-------------------------->
    <div class="container-fluid">
        <!-----------------注释：用户网名开始-------------->
        <div id="name" class="col-xs-12 col-sm-12 col-md-12">
            ${act.getUserName()}
        </div>
        <!-----------------注释：用户网名结束-------------->
    </div>
    <!----------------------------------头像名称部分结束-------------------------->
</header>
<section>
    <!---------------------------活动详情部分开始--------------------------->
    <div class="container-fluid" id="act_detail"><!--活动详情-->
        <ul style="list-style:none;">
            <li class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <p class="num1">活动时间</p>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8">
                    <p class="num2">${act.getStartTime()}</p>
                </div>
            </li>
            <li class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <p class="num1">活动地点</p>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                    <p class="num2">${act.getLocation()}</p>
                </div>
            </li>
            <li class="row" style="line-height:28px;">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <p class="num1">活动描述</p>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                    <p class="num2" style="word-wrap:break-word;">${act.getDescription()}</p>
                </div>
            </li>
            <li class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <p class="num1">参与人数</p>
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                    <p di="showNum" class="num2" style="word-wrap:break-word;">${act.getJoinNow()}|${act.getPersonNumber()}人</p>
                </div>
            </li>
        </ul>
    </div>
    <!---------------------------活动详情部分结束--------------------------->

    <!---------------------------活动参与者详情部分开始---------------------------------------------------->
    <h3 class="list_name"><span class="pull-left">报名人员</span></h3>

    <div id="diviscroll" class="divscroll"
         style="width:100%;height:150px;overflow-x:auto;overflow-y:hidden;margin-top:-3rem;">
        <div id="wrapper" class="container-fluid" style="width:300%;">

            <ul id="actInfo_dom">
               <%--此处为参与人数--%>
            </ul>

        </div>
    </div>
</section>
<div>
    <nav class="navbar navbar-default">

        <div id="join">
        <button id="editBut" type="button" class="btn  btn-danger pull-left" style="margin-left:1.5rem;"></button>
        </div>
        <button id="shareBut" type="button" class="btn  btn-danger pull-right" style="margin-right:1.5rem;">分享</button>
    </nav>
</div>

<input type="hidden" id="hTitle" value="${act.getUserName()}发起的活动">
<input type="hidden" id="hDesc" value="${act.getDescription()}">
<input type="hidden" id="hImg" value="<%=imgPath%>">
<input type="hidden" id="basePath" value="<%=basePath%>">
<input type="hidden" id="actUserId" value="${act.getUserId()}">
<input type="hidden" id="nowUserId" value="${userId}">
<input type="hidden" id="actId" value="${act.getActivityId()}">
<input type="hidden" id="shareNow" value="${shareNow}">
<input type="hidden" id="pageToken" value="${token}">
<input type="hidden" id="nowUserName" value="${nickName}">
<input type="hidden" id="joinNow" value="${act.getJoinNow()}">
<input type="hidden" id="perNum" value="${act.getPersonNumber()}">
<input type="hidden" id="deadLine" value="${act.getDeadLine()}">

</body>
<script type="text/javascript" src="./togmob/js/actInfo.js"></script>
<script type="text/javascript" src="./comJs/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="./togmob/js/zepto.min.js"></script>
</html>
