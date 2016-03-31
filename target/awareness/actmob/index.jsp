<%@ page import="com.awareness.trows.util.wechatSDK.entity.WeChatInfo" %>
<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String imgPath = WeChatInfo.imgPath;
%>
<%--测试信息设定--%>
<%--<%--%>
    <%--long id = 72814382461121L;--%>
    <%--session.setAttribute("userId", id);--%>
    <%--session.setAttribute("nickName","一屁冲天");--%>
    <%--if (session.getAttribute("token")==null)--%>
        <%--session.setAttribute("token", UUID.randomUUID().toString());--%>

<%--%>--%>
<%--========================--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

    <%--不使用缓存  测试使用--%>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <%--============================--%>
    <link rel="stylesheet" type="text/css" href="./actmob/css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" href="./actmob/css/act_show.css">
    <input type="hidden" id="imgPath" value="<%=imgPath%>">
</head>
<style>
</style>
<body>
<!--标题栏-->
<div>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <span>活动圈</span>
        </div>
    </nav>
</div>
<!--控制滚动部分-->
<div id="scroll" data-target="#navbar-example">
    <div id="navbar-example">
        <!--活动圈背景图-->
        <div class="row big_row">
            <div class="col-xs-12">
                <img src="./actmob/images/personal_bg.jpg" class="img-responsive" alt="Responsive image">

                <div class="row person">
                    <div class="col-xs-2 col-sm-1 col-xs-offset-5">
                        <p>${nickName}</p>
                        <%--<p>一屁冲天</p>--%>
                    </div>
                    <div class="col-xs-2 col-sm-4 col-xs-offset-1">
                        <img src="<%=imgPath%>${userId}.jpg" class="img-circle" alt="Responsive image">
                        <%--<img src="./actmob/images/personal_pic.png" class="img-circle" alt="Responsive image">--%>
                    </div>
                </div>
            </div>
        </div>

        <div id="myAct">
            <ul id="actUl">

            </ul>
            <!--//加载更多按钮-->
            <div id="loading" style="display:none">
                <a>加载更多...</a>
            </div>
        </div>
    </div>
</div>
<!--//发起活动按钮-->
<div>
    <nav class="navbar navbar-default navbar-fixed-bottom">
        <button type="button" class="btn btn-success ">发起活动</button>
    </nav>
</div>
<!--//点击发起按钮弹出部分-->
<div id="hidden_con">
    <div id="mask" style="display:none"></div>
    <!--关闭按钮  要换-->
    <div id="close" class="img-responsive" style="display:none"><img src="./actmob/images/close.png" alt=""/></div>
    <!--弹出的可选类型-->
    <div id="types" style="display:none">
        <div class="container">
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=5ZSx5q2M"><img src="./actmob/images/type1.png" alt=""
                                                                                   class="img-rounded img-responsive"
                                                                                   align="top"></a></div>
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=5ZCD6aWt"><img src="./actmob/images/type2.png" alt=""
                                                                        class="img-rounded img-responsive" align="top"></a>
                </div>
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=6LSt54mp"><img src="./actmob/images/type3.png" alt=""
                                                                        class="img-rounded img-responsive" align="top"></a>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>唱歌</p></div>
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>吃饭</p></div>
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>购物</p></div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=5oi35aSW"><img src="./actmob/images/type4.png" alt=""
                                                                                   class="img-rounded img-responsive"
                                                                                   align="top"></a></div>
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=55S15b2x"><img src="./actmob/images/type5.png" alt=""
                                                                        class="img-rounded img-responsive" align="top"></a>
                </div>
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=5peF5ri4"><img src="./actmob/images/type6.png" alt=""
                                                                        class="img-rounded img-responsive" align="top"></a>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>户外</p></div>
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>电影</p></div>
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>旅游</p></div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=5ryU5Ye6"><img src="./actmob/images/type7.png" alt=""
                                                                                   class="img-rounded img-responsive"
                                                                                   align="top"></a></div>
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=6L+Q5Yqo"><img src="./actmob/images/type8.png" alt=""
                                                                        class="img-rounded img-responsive" align="top"></a>
                </div>
                <div class="col-xs-3 col-sm-2 col-md-3"><a href="./actmob/inform.jsp?actType=5pu05aSa"><img src="./actmob/images/type9.png" alt=""
                                                                        class="img-rounded img-responsive" align="top"></a>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>演出</p></div>
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>运动</p></div>
                <div class="col-xs-3 col-sm-2 col-md-3 words"><p>更多</p></div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="basePath" value="<%=basePath%>">
<input type="hidden" id="nowUserId" value="${userId}">
</body>
<script src="./actmob/js/zepto.min.js"></script>
<script src='./actmob/js/act_promoter.js'></script>
</html>