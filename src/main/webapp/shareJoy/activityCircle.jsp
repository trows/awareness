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
    <title>享趣活动圈</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/base.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/activityCircle.css">
    <link rel="stylesheet" type="text/css" href="./shareJoy/css/weui.min.css">
    <script type="text/javascript" src="./shareJoy/js/flexible.js"></script>
</head>
<body ontouchstart>
<div id="body">
    <!--活动信息-->

</div>
<!------------底部按钮---------->
<div class="container js_container">
    <div class="page slideIn actionsheet" style="overflow: hidden">
        <div class="bd spacing">
            <a href="javascript:;" class="weui_btn weui_btn_primary" id="showActionSheet"><img alt=""
                                                                                               src="./shareJoy/asset/public-btn.png"/></a>
        </div>
        <!--BEGIN actionSheet-->
        <div id="actionSheet_wrap">
            <div class="weui_mask_transition" id="mask"></div>
            <!--+号按钮-->
            <div class="weui_actionsheet" id="weui_actionsheet">
                <div class="share-box" style="display:none"><img src="./shareJoy/asset/share-text.png"/></div>
                <!--活动类型按钮-->
                <div class="weui_actionsheet_menu">
                    <a href="./shareJoy/postActivity.jsp?actType=6Z+z5LmQ">
                        <div class="weui_actionsheet_cell">
                            <img alt="" src="./shareJoy/asset/music.png">
                        </div>
                    </a>
                    <a href="./shareJoy/postActivity.jsp?actType=55S15b2x">
                        <div class="weui_actionsheet_cell"><img alt="" src="./shareJoy/asset/photo.png"></div>
                    </a>
                    <a href="./shareJoy/postActivity.jsp?actType=6L+Q5Yqo">
                        <div class="weui_actionsheet_cell"><img alt="" src="./shareJoy/asset/motion.png"></div>
                    </a>
                    <a href="./shareJoy/postActivity.jsp?actType=55Sf5rS7">
                        <div class="weui_actionsheet_cell"><img alt="" src="./shareJoy/asset/life.png"></div>
                    </a>
                    <a href="./shareJoy/postActivity.jsp?actType=5ZCD6aWt">
                        <div class="weui_actionsheet_cell"><img alt="" src="./shareJoy/asset/food.png"></div>
                    </a>
                    <a href="./shareJoy/postActivity.jsp?actType=5peF5ri4">
                        <div class="weui_actionsheet_cell"><img alt="" src="./shareJoy/asset/tourism.png"></div>
                    </a>
                </div>
                <!--取消按钮-->
                <div class="weui_actionsheet_action">
                    <a href="#" class="cancel-btn">
                        <div class="weui_actionsheet_cell cancel" id="actionsheet_cancel">取消</div>
                    </a>
                </div>
            </div>
        </div>
        <!--END actionSheet-->
    </div>
</div>

<input type="hidden" id="basePath" value="<%=basePath%>">
<input type="hidden" id="nowUserId" value="${userId}">
<input type="hidden" id="hImg" value="<%=imgPath%>">

<script src="./shareJoy/js/zepto.min.js"></script>
<script src="./shareJoy/js/actionsheet.js"></script>
<script src="./shareJoy/js/site.actCircle.js"></script>
<%--<script>--%>
<%--$("body").on("touchend",function(){--%>
<%--alert("你滑动了页面");--%>
<%--});--%>
<%--</script>--%>


</body>
</html>