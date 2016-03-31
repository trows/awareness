<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<script type="application/javascript">
    function check(userType){

            window.location.href = "./getActType.do" ;

    }

    function myActivity(userType){

            window.location.href = "./getActivityListByUserId.do" ;

    }

    function repeat(repeat){
        if(repeat){
            alert("请不要重复提交数据");
        }
    }

</script>
<html>
<head>
    <base href="<%=basePath%>">
    <title></title>
</head>
<body onload="repeat(${repeat})">
<div align="center">
 &nbsp; &nbsp; &nbsp; &nbsp;用户：${nickName}  <br>
    <input type="button" onclick="myActivity()" value="我的活动"><br>
    <a href="./getMyJoinActivityListByUserId.do">我参加的活动</a><br>
  <input type="button" onclick="check()" value="发起活动">

</div>
</body>
</html>
