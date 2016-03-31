<!--活动圈-->
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
<%--session.setAttribute("nickName","一屁冲天");--%>
<%--if (session.getAttribute("token")==null)--%>
<%--session.setAttribute("token", UUID.randomUUID().toString());--%>

<%--%>--%>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>活动圈</title>
    <link rel="stylesheet" type="text/css" href="./togmob/css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" href="./togmob/css/act_circle.css">

</head>
<body>
<header>
<!-------------------------------------------顶部头像部分开始-------------------->
<div class="container" id="my_pic">
    <div id="person" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <!--------------------头像外的白色边框开始----------->
        <img src="./togmob/images/border1.png" width="85" height="85" alt=""/>
        <!--------------------头像外的白色边框结束----------->
        <!--------------------头像图片部分开始----------->
        <div id="head_pic" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <img src="<%=imgPath%>${userId}.jpg" width="80" height="80" alt="" />
        </div>
        <!--------------------头像图片部分结束----------->
    </div>
</div>
<!----------------------------------头像部分结束-------------------------->
<!-------------------------------------------顶部头像名部分开始-------------------->
<div class="container" id="name">
    <div class="name" class="col-xs-12 col-sm-12 col-md-12">
        ${nickName}
    </div>
</div>
    </header>
<!-------------------------------------------顶部头像名部分结束-------------------->
<div id="myAct">
    <ul id="actUl">
        <%--此处为添加位置--%>
    </ul>
    <div id="loading" style="display:none" align="center">
        <a>加载更多...</a>
    </div>
</div>
<!-------------------------------------------发起活动按钮开始-------------------->
<div id="btn_click">
    <nav class="navbar navbar-default">
        <button type="button" id="btn_act" class="btn  btn-danger ">发起活动</button>
    </nav>
</div>
<!-------------------------------------------发起活动按钮部分结束------------------>
<div id="shadow" style="display:none;"></div>
<div id="content-shadow" style="display:none;">
    <div id="act_style" class="container-fluid">
        <ul>
            <li class="row">
              <img class="col-xs-12 col-sm-12 col-md-12 col-lg-12" src="./togmob/images/font.png"  />
            </li>
            <li class="row">
                <a href="./togmob/creAct.jsp?actType=5ZCD6aWt"><img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/eat.png" /></a>
                <a href="./togmob/creAct.jsp?actType=55S15b2x"> <img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/files.png" /></a>
                <a href="./togmob/creAct.jsp?actType=5oi35aSW" ><img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/outdoors.png" /></a>
            </li>
            <li class="row">
                <a href="./togmob/creAct.jsp?actType=6LSt54mp"><img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/shopping.png" /></a>
                <a href="./togmob/creAct.jsp?actType=5ZSx5q2M"><img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/KTV.png" /></a>
                <a href="./togmob/creAct.jsp?actType=5ryU5Ye6"><img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/performance.png" /></a>
            </li>
            <li class="row">
                <a href="./togmob/creAct.jsp?actType=6L+Q5Yqo"><img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/sport.png" /></a>
                <a href="./togmob/creAct.jsp?actType=5peF5ri4"><img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/travel.png" /></a>
                <a href="./togmob/creAct.jsp?actType=5pu05aSa"><img class="col-xs-4 col-sm-4 col-md-4 col-lg-4" src="./togmob/images/more.png" /></a>
            </li>
            </ul>
        </div>
    </div>
    <div class="container-fluid" id="close">
        <div class="row">
            <img class="col-xs-1 col-sm-1 col-md-1 col-lg-1" src="./togmob/images/close.png" />
        </div>
    </div>

    <input type="hidden" id="basePath" value="<%=basePath%>">
    <input type="hidden" id="nowUserId" value="${userId}">
    <input type="hidden" id="hImg" value="<%=imgPath%>">

</body>
<script src="./togmob/js/zepto.min.js"></script>
<script type="text/javascript" src="./togmob/js/act_circle.js"></script>
</html>