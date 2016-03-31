<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    System.out.println(basePath);
    System.out.println(path);
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Test Controller</title>

</head>
<body>
    <script>
        alert(window.location.href);
//        alert(window.location.pathname);
//        alert(window.location.protocol);
//        alert(window.location.host);
//        alert(window.location.port);

    </script>


</body>
</html>
