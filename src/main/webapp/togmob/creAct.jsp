<!--创建活动-->
<%@ page import="com.awareness.trows.util.wechatSDK.entity.WeChatInfo" %>
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
    <%--session.setAttribute("nickName","一屁冲天");--%>
    <%--if (session.getAttribute("token")==null)--%>
        <%--session.setAttribute("token", UUID.randomUUID().toString());--%>

<%--%>--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <link rel="stylesheet" type="text/css" href="./togmob/css/bootstrap.min.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="./togmob/css/act_style.css" media="screen">
    <script src="./togmob/js/jquery-2.1.3.min.js"></script>
    <script src="./togmob/js/mobiscroll_002.js" type="text/javascript"></script>
    <script src="./togmob/js/mobiscroll_004.js" type="text/javascript"></script>
    <link href="./togmob/css/mobiscroll_002.css" rel="stylesheet" type="text/css">
    <link href="./togmob/css/mobiscroll.css" rel="stylesheet" type="text/css">
    <script src="./togmob/js/mobiscroll.js" type="text/javascript"></script>
    <script src="./togmob/js/mobiscroll_003.js" type="text/javascript"></script>
    <script src="./togmob/js/mobiscroll_005.js" type="text/javascript"></script>
    <script type="text/javascript" src="./togmob/js/start_act.js"></script>
    <link href="./togmob/css/mobiscroll_003.css" rel="stylesheet" type="text/css">
    <title></title>
</head>
<body>
<div id="content">
<form action="./addActivity.do" name="myForm" method="post">
    <%--获取活动类型信息--%>
    <input type="hidden" name="actType" value="${param.actType}">
    <%--设置表单令牌--%>
    <input type="hidden" name="pageToken" value="${token}">
<!--活动名称-->
<div id="act_name" style="display:block;">
    <!--<div class="img_left">-->
        <!--<img src="images/sjx.png" />-->
    <!--</div>-->
    <!------------整体部分的div-------->
    <div  class="container-fluid content">
        <!-------标题部分开始--------->
        <h1 class="name">活动名称</h1>
        <!-------标题部分结束--------->
        <div class="row">
            <!-------输入框部分开始--------->
            <input type="text" class="form col-xs-11 col-sm-11 col-md-11 col-lg-11" id="actName" name="actName" placeholder="请输入活动名称" autocomplete="off"/>
            <span class="notNull" style="display:none">所填内容不能为空！</span>
            <span class="maxLen" style="display:none">不能超过10个字符！</span>
            <!-------输入框部分结束--------->
            <!-------确定按钮部分开始--------->
            <div class="button">
                <button type="button" class="btn btn-danger ">确定</button>
            </div>
        </div>
    </div>
    <div class="img_right">
        <img src="./togmob/images/sjx0.png" />
    </div>
   <!-----整体的div部分结束-------->
    </div>


<!--活动地点-->
<div id="act_place" style="display:none;">
    <!------------左边的小三角形部分开始--------->
    <div  class="img_left">
        <img src="./togmob/images/sjx.png" />
    </div>
    <!------------左边的小三角形部分结束--------->
    <!------------整体部分的div-------->
    <div  class="container-fluid content">
        <!-------标题部分开始--------->
        <h1 class="name">活动地点</h1>
        <!-------标题部分结束--------->
        <div class="row">
            <!-------输入框部分开始--------->
            <input type="text" class="form col-xs-11 col-sm-11 col-md-11 col-lg-11" id="actPlace" name="actPlace" placeholder="请输入活动地点" autocomplete="off">
            <span class="notNull" style="display:none">所填内容不能为空！</span>
            <span class="maxLen" style="display:none">不能超过20个字符！</span>
            <!-------输入框部分结束--------->
            <!-------确定按钮部分开始--------->
            <div class="button">
                <button type="button" class="btn btn-danger ">确定</button>
            </div>
            <!-------确定按钮部分结束--------->
      </div>
    </div>
    <!-------整体的div部分结束--------->
    <!------------右边的小三角形部分开始--------->
    <div class="img_right">
        <img src="./togmob/images/sjx0.png" />
    </div>
    <!------------右边的小三角形部分结束--------->
</div>
    <!---参与人数-->
<div id="act_pnum" style="display:none;">
    <!------------左边的小三角形部分开始--------->
    <div class="img_left">
        <img src="./togmob/images/sjx.png" />
    </div>
    <!------------左边的小三角形部分结束--------->
<div class="container-fluid content">
    <!-------标题部分开始--------->
    <h1 class="name">参与人数</h1>
    <!-------标题部分结束--------->
    <div class="row">
        <!-------输入框部分开始--------->
        <input type="text" class="form" id="num" name="actNum" placeholder="请输入参与人数" autocomplete="off"></div>
        <span class="notNull" style="display:none;">所填内容不能为空！</span>
        <span class="maxLen" style="display:none;">所填内容必须为数字！</span>
        <!-------输入框部分结束--------->
        <!-------确定按钮部分开始--------->
    <div class="button">
        <button type="button" class="btn btn-danger">确定</button>
    </div>
        <!-------确定按钮部分结束--------->
    </div>

<!-------整体的div部分结束--------->
<!------------右边的小三角形部分开始--------->
    <div class="img_right">
         <img src="./togmob/images/sjx0.png" />
    </div>
<!------------右边的小三角形部分结束--------->
 </div>

    <!---活动开始日期-->
    <div id="act_statime" style="display:none;">
        <!------------左边的小三角形部分开始--------->
        <div class="img_left">
            <img src="./togmob/images/sjx.png" />
        </div>
        <!------------左边的小三角形部分结束--------->
        <div class="container-fluid content">
            <!-------标题部分开始--------->
            <h1 class="name">活动开始时间</h1>
            <!-------标题部分结束--------->
            <div class="row">
                <!-------输入框部分开始--------->
                <input type="text" class="form" id="appDateTime1" name="appDateTime1" readonly="readonly"
                       autocomplete="off" />

                <!--<p>开始时间</p>-->
                <span class="notNull" style="display: none;">请选择时间！</span>
                <!-------输入框部分结束--------->
                <!-------确定按钮部分开始--------->
                <div class="button">
                    <button type="button" class="btn btn-danger">确定</button>
                </div>
                <!-------确定按钮部分结束--------->
            </div>
        </div>
        <!-------整体的div部分结束--------->
        <!------------右边的小三角形部分开始--------->
        <div class="img_right">
            <img src="./togmob/images/sjx0.png" />
        </div>
        <!------------右边的小三角形部分结束--------->
    </div>
    <!---活动结束日期-->
    <div id="act_endt" style="display:none;">
        <!------------左边的小三角形部分开始--------->
        <div class="img_left" >
            <img src="./togmob/images/sjx.png" />
        </div>
        <!------------左边的小三角形部分结束--------->
        <div class="container-fluid content">
            <!-------标题部分开始--------->
            <h1 class="name">活动结束时间</h1>
            <!-------标题部分结束--------->
            <div class="row">
                <!-------输入框部分开始--------->
                <input type="text" class="form" id="appDateTime2" placeholder="活动结束时间" name="appDateTime2" readonly="readonly"
                       autocomplete="off">

                <!--<p>结束时间</p>-->
                <span class="notNull" style="display:none;">请选择时间！</span>
                <span class="maxLen" style="display:none;">结束时间晚于开始时间!</span>
                <!-------输入框部分结束--------->
                <!-------确定按钮部分开始--------->
                <div class="button">
                    <button type="button" class="btn btn-danger">确定</button>
                </div>
                <!-------确定按钮部分结束--------->
            </div>
        </div>
        <!-------整体的div部分结束--------->
        <!------------右边的小三角形部分开始--------->
        <div class="img_right">
            <img src="./togmob/images/sjx0.png" />
        </div>
        <!------------右边的小三角形部分结束--------->
    </div>

    <!---报名截止日期-->
    <div id="act_endtime" style="display:none;">
        <!------------左边的小三角形部分开始--------->
        <div class="img_left">
            <img src="./togmob/images/sjx.png" />
        </div>
        <!------------左边的小三角形部分结束--------->
        <div  class="container-fluid content">
            <!-------标题部分开始--------->
            <h1 class="name">报名截止日期</h1>
            <!-------标题部分结束--------->
            <div class="row">
                <!-------输入框部分开始--------->
                <input type="text" class="form" id="appDateTime3" name="appDateTime3" readonly="readonly"
                       placeholder="报名截止时间"
                       autocomplete="off">
                <span class="notNull" style="display:none;">请选择时间！</span>
                <span class="maxLen" style="display:none;">报名截止时间晚于开始时间！</span>
                <!-------输入框部分结束--------->
                <!-------确定按钮部分开始--------->
                    <div class="button">
                        <button type="button" class="btn btn-danger ">确定</button>
                    </div>
                <!-------确定按钮部分结束--------->
            </div>
        </div>
        <!-------整体的div部分结束--------->
        <!------------右边的小三角形部分开始--------->
        <div class="img_right">
            <img src="./togmob/images/sjx0.png" />
        </div>
        <!------------右边的小三角形部分结束--------->
    </div>

    <!---活动描述-->
    <div id="act_show" style="display:none;">
        <!------------左边的小三角形部分开始--------->
        <div class="img_left">
            <img src="./togmob/images/sjx.png" />
        </div>
        <!------------左边的小三角形部分结束--------->
        <div class="container-fluid content">
            <!-------标题部分开始--------->
            <h1 class="name">活动描述</h1>
            <!-------标题部分结束--------->
            <div class="row">
                <!-------输入框部分开始--------->
               <textarea class="form" name="disc" id="disc" cols="50" rows="5" placeholder="不超过140字"
                         autocomplete="off"></textarea>
                <span class="notNull" style="display:none">所填内容不能为空！</span>
                <span class="maxLen" style="display:none">不能超过100个字符！</span>
                <!-------输入框部分结束--------->
                <!-------确定按钮部分开始--------->

                <div class="submit">
                    <button type="submit" class="btn btn-danger" onclick="actForm.submit()">提交</button>
                </div>

                <!-------确定按钮部分结束--------->
            </div>
        </div>
        <!-------整体的div部分结束--------->
        <!------------右边的小三角形部分开始--------->
        <!--<div class="img_right">-->
            <!--<img src="images/sjx0.png" />-->
        <!--</div>-->
        <!------------右边的小三角形部分结束--------->
    </div>
    </form>
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