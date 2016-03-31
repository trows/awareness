<%@ page import="com.awareness.trows.util.wechatSDK.entity.WeChatInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String imgPath = WeChatInfo.imgPath;
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <!--清除缓存 测试使用-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!--========-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <link rel="stylesheet" type="text/css" href="./actmob/css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="./actmob/css/more_infor.css" media="screen"/>

</head>
<body>
<!--标题栏-->
<div>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <span>${act.getActivityTitle()}</span>
        </div>
    </nav>
</div>
<!--背景图-->
<div class="row big_row">
    <div class="col-xs-12">
        <%--背景图--%>
        <img src="./actmob/images/personal_bg.jpg" class="img-responsive" alt="Responsive image">

        <div class="row person">
            <div class="col-xs-3 col-sm-8 col-xs-offset-0">
                <%--用户头像--%>
                <img src="<%=imgPath%>${act.getUserId()}.jpg" class="img-circle" alt="Responsive image">
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-5 col-sm-10 ">
        <p>${act.getUserName()}&nbsp;&nbsp;发起活动</p>
    </div>
</div>
<div class="row">
    <div class="col-xs-9 col-sm-10 col-xs-offset-1">
        <hr/>
    </div>
</div>
<div class="row">
    <div class="col-xs-8 col-sm-10 col-xs-offset-1">
        活动时间&nbsp;&nbsp;:&nbsp;&nbsp;${act.getStartTime()}
    </div>
</div>
<div class="row">
    <div class="col-xs-8 col-sm-10 col-xs-offset-1">
        活动地点&nbsp;&nbsp;:&nbsp;&nbsp;${act.getLocation()}
    </div>
</div>
<div class="row">
    <div class="col-xs-8 col-sm-10 col-xs-offset-1">
        活动描述&nbsp;&nbsp;:&nbsp;&nbsp;${act.getDescription()}
    </div>
</div>
<div class="row">
    <div class="col-xs-8 col-sm-10 col-xs-offset-1">
        活动人数&nbsp;&nbsp;:&nbsp;&nbsp;${act.getPersonNumber()}
    </div>
</div>
<div class="row">
    <div class="col-xs-7 col-sm-10 col-xs-offset-3">
        <div class="progress">
            <div class="progress-bar progress-bar-success" name="probar" role="progressbar" aria-valuenow="50"
                 aria-valuemin="0" aria-valuemax="100">
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-9 col-sm-10 col-xs-offset-1">
        <hr/>
    </div>
</div>
<div class="row participants">
    <div class="col-xs-12 col-sm-10 col-xs-offset-0">
        <p>参与者</p>
    </div>
</div>
<div id="myAct">
    <ul id="joinInfo">
        <li>
            <%--<div class="media"><div class="media-left media-middle"><a href="#"><img class="media-object" src="./actmob/images/user_pic.png" alt=""></a></div><div class="media-body"><p class="media-heading">小明</p><div>2015-2-4</div></div><div class="media-right media-middle"><p></p></div></div>--%>
        </li>
        <hr>

    </ul>
    <div id="loading" style="display:none">
        <a>加载更多...</a>
    </div>
</div>
<div>
    <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="row">
            <div id="join" class="col-xs-6 col-sm-10 col-xs-offset-0">
                <a id="joinText"><!--参加 --> <!--<span>（仅剩3天）</span>--></a>
            </div>
            <div class="col-xs-6 col-sm-10 col-xs-offset-0">
                <a href="">分享</a>
            </div>
        </div>
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
<%--引入js文件--%>

<%--微信jsSdk--%>
<script type="text/javascript" src="./comJs/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="./actmob/js/zepto.min.js"></script>
<script type="text/javascript" src="./actmob/js/add_newcomer.js"></script>
</html>
 