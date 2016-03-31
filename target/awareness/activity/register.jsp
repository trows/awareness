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
          请填写用户信息<br/>
          <form action="./wechart/connect.do">
          <input type="text" id="username" name="username">
          <input type="submit" >
          </form>
        </div>
</body>
</html>
