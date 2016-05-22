window.onload = function () {
    $(document).on("pageInit", "#page-datetime-picker", function (e) {
        $("#datetime-picker").datetimePicker({
            toolbarTemplate: '<header class="bar bar-nav">\
          <button class="button button-link pull-right close-picker">确定</button>\
          <h1 class="title">选择日期和时间</h1>\
          </header>'
        });
        //设置默认时间

        var date = new Date();
        $("#datetime-picker").datetimePicker({
            value: [date.getFullYear(), date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes()]
        });
    });


    $.init();
}

function submitMyForm() {
    var num = document.getElementById("actNum").value;
    console.log(num);
    console.log(num.length);
    if (num.length == 0) {
        alert("活动人数不能为空！");
        return false;
    } else if (isNaN(num) || num.split('.').length > 1) {
        alert("活动人数只能输入整数哦");
        return false;
    } else {
        var actName = document.getElementById("actName").value;
        console.log(actName);
        console.log(actName.length);
        if (actName.length == 0) {
            alert("活动描述不能为空！");
            return false;
        } else {
            return true;
        }
    }

}


function sub() {
    if (submitMyForm()) document.getElementById("postAct").submit();
}