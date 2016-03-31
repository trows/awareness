<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title></title>
</head>
<body>
<div align="center">
    <form action="./addActivity.do" method="post">
        活动名称<input type="text" id="activityTitle" name="activityTitle"><br>
        活动类型<select id="typeId" name="typeId">
                    <c:forEach items="${actTypeList}" var="activityType">
                    <option value="${activityType.getTypeId()}">${activityType.getTypeName()}</option>
                    </c:forEach>
    </select><br>
        活动描述<input type="text" id="description" name="description"><br>
        活动开始时间<input type="text" id="startTime" value="格式：2015-06-18" name="startTime"><br>
        结束时间<input type="text" id="endTime" name="endTime"><br>
        报名截止时间<input type="text" id="deadLine" name="deadLine"><br>
        活动人数<input type="text" id="personNumber" name="personNumber"><br>
        活动地点<input type="text" id="location" name="location"><br>
        活动单人花费<input type="text" id="privateCost" name="privateCost" value="0"><br>
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
