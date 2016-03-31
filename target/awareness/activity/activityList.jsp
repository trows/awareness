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
    我发起的活动
    <table>
        <c:forEach items="${activityList}" var="activity">
            <tr>

                <td>
                    <a href="./-1/${activity.getActivityId()}/getActivityById.do">${activity.getActivityTitle()}</a>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
