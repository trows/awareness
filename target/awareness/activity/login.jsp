<%@ page import="com.awareness.trows.entity.Activity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<head>
    <base href="<%=basePath%>">
    <title></title>

</head>
<body>
    <div align="center">
        <form action="./login.do" method="post">
            请输入账号
            <input type="text" id="accessToken" name="accessToken"><br>
            <input type="submit" value="登入"><br>
            <input type="reset" value="重置">
        </form>
    </div>
</body>
</html>
