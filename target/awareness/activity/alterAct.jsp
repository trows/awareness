<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>修改活动</title>
</head>
<body>
    <div align="center">
        <form action="./alterAct.do" method="post">
        <input type="hidden" name="activityId" value="${param.activityId}">
        活动名称：<input type="text" name="activityTitle" value="${param.activityTitle}"><br>
        活动类型：${param.typeName}<br>
        活动发起人：${userName}<br>
        活动地点：<input type="text" name="location" value="${param.location}"><br>
        活动开始时间：<input type="text" name="startTime" value="${param.startTime}"><br>
        活动结束时间:<input type="text" name="endTime" value="${param.endTime}"><br>
        报名截止时间:<input type="text" name="deadLine" value="${param.deadLine}"><br>
        活动描述：<input type="text" name="description" value="${param.description}"><br>
        预计个人花费：<input type="text" name="privateCost" value="${param.privateCost}"><br>
        是否允许分享
            <select id="shareDepth" name="shareDepth">
                <option value="1">是</option>
                <option value="-1">否</option>
            </select><br>
            是否需要验证报名人员
            <select id="joinCheck" name="joinCheck">
                <option value="0">否</option>
                <option value="1">是</option>
            </select>
            <input type="hidden" name="pageToken" value="${token}">
            <input type="submit" value="提交">
        </form>
    </div>
</body>
</html>
