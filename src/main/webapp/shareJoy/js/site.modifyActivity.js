function submitForm() {
    var perNum = document.getElementById("perNum").value;
    var location = document.getElementById("location").value;
    var startTime = document.getElementById("startTime").value;
    var desc = document.getElementById("desc").value;

    var perPerNum = document.getElementById("perPerNum").value;
    var perLocation = document.getElementById("perLocation").value;
    var perStartTime = document.getElementById("perStartTime").value;
    var perDesc = document.getElementById("perDesc").value;

    var remark = "";
    //alert(perNum+"xx"+location+"xx"+startTime+"xx"+desc);
    //alert(perPerNum+"xx"+perLocation+"xx"+perStartTime+"xx"+perDesc);

    if (perNum != "" && perNum != perPerNum) remark += "<br>·活动人数修改为：" + perNum + "人;";
    if (location != "" && location != perLocation) remark += "<br>·活动地点修改为：" + location + ";";
    if (startTime != "" && startTime != perStartTime) remark += "<br>·活动时间修改为：" + startTime + ";";

    //alert(remark);
    document.getElementById("remark").value = remark;
    alert(document.getElementById("remark").value );
    document.getElementById("modifyAct").submit();

}