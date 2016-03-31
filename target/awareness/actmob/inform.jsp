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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <!--清除缓存 测试使用-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!--========-->
    <link rel="stylesheet" type="text/css" href="./actmob/css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" href="./actmob/css/inform.css">
    <script src="./actmob/js/jquery-2.1.3.min.js"></script>
    <script src="./actmob/js/mobiscroll_002.js" type="text/javascript"></script>
    <script src="./actmob/js/mobiscroll_004.js" type="text/javascript"></script>
    <link href="./actmob/css/mobiscroll_002.css" rel="stylesheet" type="text/css">
    <link href="./actmob/css/mobiscroll.css" rel="stylesheet" type="text/css">
    <script src="./actmob/js/mobiscroll.js" type="text/javascript"></script>
    <script src="./actmob/js/mobiscroll_003.js" type="text/javascript"></script>
    <script src="./actmob/js/mobiscroll_005.js" type="text/javascript"></script>
    <script src="./actmob/js/inform.js"></script>
    <link href="./actmob/css/mobiscroll_003.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="form">
    <%--已修改内容 -- 为input添加name 添加隐藏表单actType 设置令牌--%>
    <%--表单所在位置 表单开始--%>
    <form action="./addActivity.do" name="myForm" method="post">
        <%--获取活动类型信息--%>
        <input type="hidden" name="actType" value="${param.actType}">
        <%--设置表单令牌--%>
        <input type="hidden" name="pageToken" value="${token}">

        <%--键入动名称 actName--%>
        <div class="form-group">
            <label>活动名称:</label>
            <input type="text" class="form" id="actName" name="actName" placeholder="请输入活动名称" autocomplete="off">
            <span class="notNull" style="display:none"><img src="" alt=""/>所填内容不能为空！</span>
            <span class="maxLen" style="display:none"><img src="" alt=""/>不能超过10个字符！</span>

            <div class="button">
                <button type="button" class="btn btn-success ">确定</button>
            </div>

        </div>


        <%--键入活动地点 actPlace--%>
        <div class="form-group" style="display:none">
            <label>活动地点:</label>
            <input type="text" class="form" id="actPlace" name="actPlace" placeholder="请输入活动地点" autocomplete="off">
            <span class="notNull" style="display:none"><img src="" alt=""/>所填内容不能为空！</span>
            <span class="maxLen" style="display:none"><img src="" alt=""/>不能超过20个字符！</span>

            <div class="button">
                <button type="button" class="btn btn-success ">确定</button>
            </div>
        </div>
        <%--键入参与人数 actNum--%>
        <div class="form-group" style="display:none">
            <label>参与人数:</label>
            <input type="text" class="form" id="num" name="actNum" placeholder="请输入参与人数" autocomplete="off">
            <span class="notNull" style="display:none"><img src="" alt=""/>所填内容不能为空！</span>
            <span class="maxLen" style="display:none"><img src="" alt=""/>所填内容必须为数字！</span>

            <div class="button">
                <button type="button" class="btn btn-success ">确定</button>
            </div>
        </div>

        <div class="form-group" style="display:none">
            <label>活动时间:</label>

            <div id="sT">
                <%--选择活动开始时间  appDateTime1--%>
                <input type="text" class="form" id="appDateTime1" name="appDateTime1" readonly="readonly"
                       autocomplete="off">

                <p>开始时间</p>
                <span class="notNull" style="display:none"><img src="" alt=""/>请选择时间！</span>
            </div>
            <div id="eT">
                <%--选择活动结束时间 appDateTime2--%>
                <input type="text" class="form" readonly="readonly" name="appDateTime2" id="appDateTime2"
                       autocomplete="off">

                <p>结束时间</p>
                <span class="notNull" style="display:none"><img src="" alt=""/>请选择时间！</span>
                <span class="maxLen" style="display: none">结束时间早于开始时间！</span>
            </div>
            <div class="button">
                <button type="button" class="btn btn-success ">确定</button>
            </div>
        </div>
        <div class="form-group" style="display:none">
            <label>报名截止时间:</label>
            <%--选择活动报名截止时间 appDateTime3--%>
            <input type="text" class="form" id="appDateTime3" name="appDateTime3" readonly="readonly"
                   placeholder="报名截止时间"
                   autocomplete="off">
            <span class="notNull" style="display:none"><img src="" alt=""/>请选择时间！</span>
            <span class="maxLen" style="display: none">报名截止时间晚于开始时间！</span>

            <div class="button">
                <button type="button" class="btn btn-success ">确定</button>
            </div>
        </div>
        <%--键入活动描述 disc--%>
        <div class="form-group" style="display:none">
            <label>活动描述：</label>
            <textarea class="form" name="disc" id="disc" cols="50" rows="5" placeholder="不超过140字"
                      autocomplete="off"></textarea>
            <span class="notNull" style="display:none"><img src="" alt=""/>所填内容不能为空！</span>
            <span class="maxLen" style="display:none"><img src="" alt=""/>不能超过10个字符！</span>

            <%--表单提交按钮--%>
            <div class="submit">

                <button type="submit" class="btn btn-success " onclick="actForm.submit()">提交</button>


            </div>
        </div>
    </form>
    <%--表单结束--%>
</div>
</body>

<script type="text/javascript">
    $(function () {
        var currYear = (new Date()).getFullYear();
        var opt = {};
        opt.date = {preset: 'date'};
        opt.datetime = {preset: 'datetime'};
        opt.time = {preset: 'time'};
        opt.default = {
            theme: 'android-ics light', //皮肤样式
            display: 'modal', //显示方式
            mode: 'scroller', //日期选择模式
            dateFormat: 'yyyy-mm-dd',
            lang: 'zh',
            showNow: true,
            nowText: "今天",
            startYear: currYear - 10, //开始年份
            endYear: currYear + 10 //结束年份
        };
        var optDateTime = $.extend(opt['datetime'], opt['default']);
        $("#appDateTime1").mobiscroll(optDateTime).datetime(optDateTime);
        $("#appDateTime2").mobiscroll(optDateTime).datetime(optDateTime);
        $("#appDateTime3").mobiscroll(optDateTime).datetime(optDateTime);
    });
</script>
</html>