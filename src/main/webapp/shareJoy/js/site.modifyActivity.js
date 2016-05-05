window.onload = function () {
    // var startTime = document.getElementById("perStartTime").value;
    // var perStartTime = startTime;
    // var time = perStartTime.split(' ');
    // var year = time[0].split('-');
    // var second = time[1].split(':');
    // alert(year[0]+'--'+ year[1]+'--'+year[2]+'--'+second[0]+ '--'+second[1]);
}


function submitForm() {
    var perNum = document.getElementById("perNum").value;
    var location = document.getElementById("location").value;
    var startTime = document.getElementById("datetime-picker").value;
    var desc = document.getElementById("desc").value;

    var perPerNum = document.getElementById("perPerNum").value;
    var perLocation = document.getElementById("perLocation").value;
    var perStartTime = document.getElementById("perStartTime").value;
    var perDesc = document.getElementById("perDesc").value;

    var remark = "";
    //alert(perNum+"xx"+location+"xx"+startTime+"xx"+desc);
    //alert(perPerNum+"xx"+perLocation+"xx"+perStartTime+"xx"+perDesc);

    if (perPerNum != "" && perNum != perPerNum) remark += "<br>·活动人数修改为：" + perNum + "人;";
    if (perLocation != "" && location != perLocation) remark += "<br>·活动地点修改为：" + location + ";";
    if (perStartTime != "" && startTime != perStartTime) remark += "<br>·活动时间修改为：" + startTime + ";";

    //alert(remark);
    document.getElementById("remark").value = remark;
    //alert(document.getElementById("remark").value );

    if(startTime.length==0){
        document.getElementById("datetime-picker").value = perStartTime;
    }

    document.getElementById("modifyAct").submit();

}