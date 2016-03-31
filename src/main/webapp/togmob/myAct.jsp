<!--我的活动-->
<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>我的活动</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/my_act.css" media="screen" />
<script type="text/javascript" src="js/activity.js"></script>
</head>

<body>
<header>
    <!----------------------------------头像部分开始-------------------------->
    <div class="container">
        <div id="person" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <!--------------------头像外的白色边框开始----------->
            <img src="images/border1.png" width="85" height="85" alt=""/>
            <!--------------------头像外的白色边框结束----------->
            <!--------------------头像图片部分开始----------->
            <div id="head_pic" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <img src="images/head_pic1.png" width="80" height="80" alt="" />
            </div>
            <!--------------------头像图片部分结束----------->
        </div>
    </div>
    <!----------------------------------头像部分结束-------------------------->
<div class="container">
    <div id="name" class="col-xs-12 col-sm-12 col-md-12">
        我是LU千金
    </div>
</div>
</header>
<section>
<div id="act_count">
	<ul>
    	<li class="pull-left" style="margin-left:3rem;">参加活动<br /><span>23次</span></li>
        <li class="pull-right" style="margin-right:3rem;">发起活动<br /><span>21次</span></li>
    </ul>
</div>
<div id="myAct">
    <ul>
        <li>
            <div class="media">
                <div class="media-body">
                    <p class="act_name">活动名称一</p>
                    <div class="progress_sm">
		  				<div class="progress-bar_sm progress-striped progress-bar-danger" name="probar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="50">
		  				</div>        
					</div>
                    <p class="act_num">报名进行中</p>
                </div>
                <div class="media-right media-middle">
                    <a href=""><img src="images/click.png" alt=""/></a>
                </div>
            </div>
        </li>
        <hr/>

    </ul> 
  </div>
</section>

</body>
</html>