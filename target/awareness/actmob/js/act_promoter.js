//window.onload=getInfo(1);
window.onload = shade();
var total = 0;  //计数器初始化为0
var imgpath = document.getElementById("imgPath").value; //获取到照片的绝对路径
var basePath = document.getElementById("basePath").value;
var nowUserId = document.getElementById("nowUserId").value;
function progress(now, total, actId) {
    /*-----------------进度条开始-----------------------*/
    var pros = document.getElementById(actId);
    var Width;

    function proWidth(n, m) {
        Width = n / m * 100;
        return (Width);
    }

    proWidth(now, total);
    if (Width <= 25) {
        pros.style.background = "green";
        pros.style.width = Width + '%';
        pros.style.border.color = "green";
    }
    else if (Width <= 75 && Width > 25) {
        pros.style.background = "orange";
        pros.style.width = Width + '%';
        pros.style.border.color = "orange";
    }
    else if (Width <= 100 && Width > 75) {
        pros.style.background = "red";
        pros.style.width = Width + '%';
        pros.style.border.color = "red";
    }

    /*-----------------进度条结束-----------------------*/


    /*------------------遮罩弹出---------------------------*/


    /*------------------结束遮罩-----------------------------*/
}

function shade() {
    var btn = $('button');
    var sHeight = window.screen.height + 'px';
    //var sWidth = document.body.Width;
    var oMask = document.getElementById('mask');
    var close = $('#close');
    var bottom = $('.navbar-fixed-bottom');
    oMask.style.height = sHeight;
    btn.on('click', function () {
        $('#mask').show();
        $('#types').show();
        $('#close').show();
        $('#scroll').css("height", "500px");
        $('#scroll').css("overflow", "hidden");

    })
    close.on('click', function () {
        $('#mask').hide();
        $('#types').hide();
        $('button').show();
        $('#close').hide();
        $('#scroll').show();
        $('#scroll').css("height", "auto");
    })

    getInfo(1);
}

//分页获取参数方法
function getInfo(pageNow) {
    var pageSize = 5;
    $.ajax({
        type: 'POST',
        url: './getMyJoinActivityListByUserId.do',
        timeout: 5000,
        dataType: 'json',      //声明返回文件类型
        data: [
            {name: "pageNow", value: pageNow}, //发送分页所需数据
            {name: "pageSize", value: pageSize}
        ],

        success: function (data) {
            //var jsonData = eval('(' + data + ')');;//将返回的json打包为json对象

            var jsonData = data;
            if (jsonData != null) {
                var size = jsonData.length;
                for (var i = 0; i < size; i++) { //遍历 为页面添加节点

                    //声明需要增加的节点
                    var link = basePath+'1/'+jsonData[i].activityId+'/'+nowUserId+'/getActivityById.do';
                    var htm = '<div class="media"> <div class="media-left media-middle"> <a href="'+link+'"> <img class="media-object img-circle" src="' + imgpath + jsonData[i].userId + '.jpg" alt=""> </a> </div> <div class="media-body"> <p class="media-heading">' + jsonData[i].activityTitle + '(' + jsonData[i].joinNow + '人已报名)</p> <div id="' + jsonData[i].activityId + '" class="progress"> <div class="progress-bar progress-bar-success" name="probar" role="progressbar"aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"> <span class="sr-only">40% Complete (success)</span> </div> </div> </div> <div class="media-right media-middle"> <span class="glyphicon glyphicon-heart"><a>(' + jsonData[i].hot + ')</a></span> </div> </div>';
                    var ul = document.getElementById("actUl");//获取将增加节点的父节点
                    var li = document.createElement("li");//创造li
                    var hr = document.createElement("hr");//创造hr
                    li.innerHTML = htm;   //写入节点信息
                    ul.appendChild(li); //更改页面dom节点
                    ul.appendChild(hr);
                    progress(jsonData[i].joinNow, jsonData[i].personNumber, jsonData[i].activityId);  //渲染进度条样式
                    total++;    //计数器总数加一


                }
                if (total % 5 == 0) {
                    var lod = document.getElementById("loading");   //获取到更多加载的对象
                    lod.style.display = "block";    //‘更多’设置为可见
                    lod.onclick = function(){   //执行翻页方法
                        getInfo(total/pageSize+1);
                        lod.style.display="none";
                    }
                }
                if (jsonData.length > 4)pageNow++; //为加载设置页码参数
            }
        }

    })
}



