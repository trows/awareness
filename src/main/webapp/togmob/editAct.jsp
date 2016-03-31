<!--活动修改-->
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
    <%--long id = 45314399838820L;--%>
    <%--session.setAttribute("userId", id);--%>
    <%--session.setAttribute("nickName","一屁冲天");--%>
    <%--if (session.getAttribute("token")==null)--%>
        <%--session.setAttribute("token", UUID.randomUUID().toString());--%>

<%--%>--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>我爱我家</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/edit_sure.css" media="screen" />
    <script type="text/javascript" src="js/edit_sure.js"></script>
</head>


<body>

<!--编辑内容部分开始-->

<div class="container-fluid" id="edit_it">
    <ul>
        <li class="row"><p  class="col-xs-9 col-sm-9 col-md-9 col-lg-9 odd">活动名称</li>
        <li class="row"><input type="text" value="我爱我家" style="border:none;" class="col-xs-9 col-sm-9 col-md-9 col-lg-9 eve" readonly></li>
        <li class="row"><p class="col-xs-9 col-sm-9 col-md-9 col-lg-9 odd">活动地点</p></li>
        <li class="row"><input type="text" value="陕西省雁塔市含光区"  style="border:none;" class="col-xs-9 col-sm-9 col-md-9 col-lg-9 eve" readonly></li>
        <li class="row"><p class="col-xs-9 col-sm-9 col-md-9 col-lg-9 odd">活动开始时间</p></li>
        <li class="row"><input type="text"  value="2015-8-15" style="border:none;" class="col-xs-9 col-sm-9 col-md-9 col-lg-9 eve" readonly></li>
        <li class="row"><p class="col-xs-9 col-sm-9 col-md-9 col-lg-9 odd">活动结束时间</p></li>
        <li class="row"><input type="text" value="2015-8-25" style="border:none;" class="col-xs-9 col-sm-9 col-md-9 col-lg-9 eve" readonly></li>
        <li class="row"><p class="col-xs-9 col-sm-9 col-md-9 col-lg-9 odd">活动报名截止日期</p></li>
        <li class="row" id="act_endtime"><input type="text"  value="2015-8-13" class="col-xs-9 col-sm-9 col-md-9 col-lg-9 eve" ></li>
            <li class="row"><p class="col-xs-9 col-sm-9 col-md-9 col-lg-9 odd">参与人数</p></li>
            <li class="row" id="act_pnum"><input type="text" value="15人" class="col-xs-9 col-sm-9 col-md-9 col-lg-9 eve" readonly></li>
            <li class="row"><p class="col-xs-9 col-sm-9 col-md-9 col-lg-9 odd">活动描述</p></li>
            <li class="row" id="act_show"><input type="text" value="活动详情活动详情活动详情活动详情" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 eve" readonly></li>
        </ul>
    </div>
<!--编辑内容部分开始-->
<!--确定按钮部分开始-->
<div id="btn_submit">
    <nav class="navbar navbar-default">
        <button type="button" class="btn  danger pull-left" value="确定">确定</button>
    </nav>
</div>
<!--确定按钮部分结束-->
<div id="shadow"></div>
<div id="input_k" style="display:none;margin:4rem auto;">
    <input type="text" placeholder="请输入"/>
    <div class="button">
        <a href="editAct.jsp"><button type="button" class="btn btn-danger">确定</button></a>
    </div>
    </div>
</body>
</html>