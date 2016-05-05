<%@ page import="com.awareness.trows.util.wechatSDK.entity.WeChatInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String imgPath = WeChatInfo.imgPath;
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>用户主页</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <link rel="stylesheet" type="text/css" href="./shareJoy/css/base.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/userHomePage.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/weui.min.css">
    <script type="text/javascript" src="./shareJoy/js/flexible.js"></script>


</head>
<body>
<!--个人信息之头像，用户名，签名-->
<!--header背景图为头像放大平铺-->
<div id="header">
    <img id = "under" src="<%=imgPath%>${account.getUserId()}.jpg">
    <div class="header-message">
        <!--头像容器-->
        <!-- 添加canvas标签，并加上红色边框以便于在页面上查看 -->
        <img class="personHead" src="<%=imgPath%>${account.getUserId()}.jpg">
        <canvas id="header-head" class="header-head" width="100px" height="100px" >
            您的浏览器不支持canvas标签。
        </canvas>
        <script type="text/javascript">
            //获取Canvas对象(画布)
            var canvas = document.getElementById("header-head");
            var image = new Image();


            //简单地检测当前浏览器是否支持Canvas对象，以免在一些不支持html5的浏览器中提示语法错误

            if(canvas.getContext){
                //获取对应的CanvasRenderingContext2D对象(画笔)
                var ctx = canvas.getContext("2d");
                // var pattren = ctx.createPattern(image, "no-repeat");

                ctx.beginPath();
                //设置弧线的颜色为白色
                ctx.strokeStyle = "white";
                var circle1 = {
                    x : 50,    //圆心的x轴坐标值
                    y : 50,    //圆心的y轴坐标值
                    r : 45      //圆的半径
                };

                //沿着坐标点(100,100)为圆心、半径为50px的圆的顺时针方向绘制弧线
                ctx.arc(circle1.x, circle1.y, circle1.r, 0, 2*Math.PI, false);

                ctx.fillStyle="white";

                ctx.closePath();
                ctx.fill();

                ctx.beginPath();
                var circle2 = {
                    x : 50,    //圆心的x轴坐标值
                    y : 50,    //圆心的y轴坐标值
                    r : 40      //圆的半径
                };
                ctx.arc(circle2.x, circle2.y, circle2.r, 0, 2*Math.PI, false);
                //按照指定的路径绘制弧线
                ctx.stroke();
                // ctx.fillStyle = pattren;
                ctx.fill();
            }


        </script>

        <!--用户名容器-->
        <div class="header-name">
            <span>${account.getNickName()}</span>
        </div>
        <!--签名容器-->
        <div class="header-describe">
            <p>${account.getProvince()}&nbsp;&nbsp;&nbsp;${account.getCity()}</p>
        </div>

    </div>
</div>
<!--个人信息之活动例表-->
<div id="body">
    <ul class="act-btn">
        <li class="active">我的活动</li>
        <li>参加的活动</li>
    </ul>
    <div class="act-list">
        <!--我的活动列表-->

        <div class="myact" style="display:block">
            <div id="myAct">
                <!--我的活动1 -->

            </div>
        </div>
        <!--参加的活动-->
        <div class="myact" style="display:none">
            <!--参加过的活动1-->
            <div id="myJoinAct">

            </div>
        </div>

    </div>
</div>

<input type="hidden" id="basePath" value="<%=basePath%>">
<input type="hidden" id="userId" value="${account.getUserId()}">
<input type="hidden" id="hImg" value="<%=imgPath%>">
<script src="./shareJoy/js/zepto.min.js"></script>
<%--<script src="./shareJoy/js/caman.full.min.js"></script>--%>
<script src="./shareJoy/js/actionsheet.js"></script>
<script src="./shareJoy/js/site.userHomePage.js"></script>
</body>
</html>