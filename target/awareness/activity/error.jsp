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
    必须授权才能访问友伴哟<br>
    <a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx1bf779f6964967e6&redirect_uri=http://180.76.143.33/getUsrInfo.do&response_type=code&scope=snsapi_userinfo&state=${requestPath}#wechat_redirect">点我重新授权</a>
</div>
</body>
</html>
