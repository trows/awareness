<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <script language="JavaScript" src="./comJs/jquery-2.1.4.min.js"></script>
    <title>${activity.getActivityTitle()}</title>

    <script type="application/javascript">
        function shareLink(shareDepth, shareNow, activityId) {

            if (shareDepth >= shareNow) {
                shareNow += 1;
                alert("222.24.63.100:9149/awareness/" + shareNow + "/" + activityId + "/getActivityById.do");
            } else {
                alert("活动发起人不允许此深度的分享");
            }
        }

        function join(actUserId, userId) {
            if (actUserId == userId) {
                var join = document.getElementById("join");
                join.type = "hidden";
            } else {
                var del = document.getElementById("del");
                var alter = document.getElementById("alter");
                del.style.visibility = "hidden";
                alter.style.visibility = "hidden";
                checkJoin(${flag});
            }
        }
        function checkJoin(flag) {
            if (flag) {
                var join = document.getElementById("join");
                join.type = "hidden";
                var div = document.getElementById("div1");
                div.innerHTML = "你已参加过这个活动";
            }
        }

        function delActivity() {
            if (confirm('是否删除这个活动？')) {
                document.getElementById("delActivity").submit();
            }
        }

        function del(obj,id) {
            $.ajax({
                type:'POST',
                url:'./delJoin.do',
                data:{participatorId : id,
                        },
                success:function(){

                    var tr = obj.getParentElement();
                    tr.getParentElement().removeChild(tr);
                }
            });

        }

        function cof(obj,id){
            $.ajax({
                type:'POST',
                url:'./cofJoin.do',
                data:{participatorId : id,
                    },
                success:function(){
                    alert("123");
                    var tr = obj.getParentElement();
                    tr.removeChildren();
                    var td1= document.createElement("td");
//                    td1.innerHTML = "<td>"+name+"</td> <td>审核通过</td> <td><input type='button' value='踢除' onclick='del(this,"+id+","+name+")'></td>"
                    tr.appendChild();
                },
                error:function(){
                    alert("返回错误");
                }
            });
        }

    </script>

</head>
<body onload="join(${activity.getUserId()},${userId})">
<div align="center">
    活动标题： ${activity.getActivityTitle()}<br>
    活动类型：${activity.getTypeName()}<br>
    发起人：${activity.getUserName()}<br>
    活动描述 ：${activity.getDescription()}<br>
    开始时间：${activity.getStartTime()}<br>
    结束时间：${activity.getEndTime()}<br>
    报名截止时间：${activity.getDeadLine()}<br>
    活动地点：${activity.getLocation()}<br>
    参与人数：${activity.getPersonNumber()}<br>
    预计个人花费：${activity.getPrivateCost()}<br>
    <input type="button" value="分享"
           onclick="shareLink(${activity.getShareDepth()},${shareNow},${activity.getActivityId()})">

    <form action="./joinActivity.do" method="post">
        <input type="hidden" name="activityId" value=${activity.getActivityId()}>
        <input type="hidden" name="participator" value=${userId}>
        <input type="hidden" name="joinCheck" value="${activity.getJoinCheck()}">
        <input type="hidden" name="pageToken" value="${token}">
        <input type="submit" id="join" value="加入这个活动">

    </form>
    <div id="div1">
        <br>

        <form action="./delActivity.do" method="post" id="delActivity">
            <input type="hidden" name="activityId" value="${activity.getActivityId()}">
            <input type="button" id="del" value="删除这项活动" onclick="delActivity()">
        </form>
        <br>

        <form action="./activity/alterAct.jsp" method="post">
            <input type="hidden" name="activityId" value="${activity.getActivityId()}">
            <input type="hidden" name="activityTitle" value="${activity.getActivityTitle()}">
            <input type="hidden" name="typeName" value="${activity.getTypeName()}">
            <input type="hidden" name="description" value="${activity.getDescription()}">
            <input type="hidden" name="startTime" value="${activity.getStartTime()}">
            <input type="hidden" name="endTime" value="${activity.getEndTime()}">
            <input type="hidden" name="deadLine" value="${activity.getDeadLine()}">
            <input type="hidden" name="personNumber" value="${activity.getPersonNumber()}">
            <input type="hidden" name="privateCost" value="${activity.getPrivateCost()}">
            <input type="hidden" name="location" value="${activity.getLocation()}">
            <input type="hidden" name="joinNow" value="${activity.getJoinNow()}">
            <input type="hidden" name="joinCheck" value="${activity.getJoinCheck()}">
            <input type="submit" id="alter" value="修改这个活动（正在施工）">
        </form>
        <br>
    </div>
    已报名人员<br>
    <table>
        <c:forEach var="participators" items="${participators}">
            <c:choose>
                <c:when test="${activity.getUserId()==userId}">
                    <c:choose>
                        <c:when test="${participators.getState()==0}">
                            <tr>
                                <td>${participators.getUserName()}</td>
                                <td>审核通过</td>
                                <td><input type="button" value="踢除" onclick="del(this,${participators.getId()})"></td>
                            </tr>
                        </c:when>
                        <c:when test="${participators.getState()==1}">
                            <tr>
                                <td>${participators.getUserName()}</td>
                                <td>未审核</td>
                                <td><input type="button" value="确认" onclick="cof(this,${participators.getId()})"></td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <tr>
                    <td>${participators.getUserName()}</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </table>
</div>

</body>

</html>
