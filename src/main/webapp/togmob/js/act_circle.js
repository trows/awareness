/**
 * Created by Administrator on 2015/8/25.
 */

var ac_pageSize = 5;   //页面每次加载显示信息的数量
var ac_total = 0;
var basePath = document.getElementById("basePath").value;
var nowUserId = document.getElementById("nowUserId").value;
var imgpath = document.getElementById("hImg").value;
window.onload=function(){
    var oPic=document.getElementById('my_pic');
    var oNae=document.getElementById('name');
    var oTent=document.getElementById('myAct');
    var oBtn1=document.getElementById('btn_click');
    var oDiv=document.getElementById('shadow');
    var oDov=document.getElementById('content-shadow');
    var oClos=document.getElementById('close');
    var oBtn=document.getElementById('btn_act');
    oPic.style.display='block';
    oNae.style.display='block';
    oTent.style.display='block';
    oBtn1.style.display='block';
    oDiv.style.display='none';
    oDov.style.display='none';
    oClos.style.display='none';
    oBtn.onclick=function(){
        oPic.style.display='block';
        oNae.style.display='block';
        oTent.style.display='block';
        oBtn1.style.display='block';
        oDiv.style.display='block';
        oDov.style.display='block';
        oClos.style.display='block';
        oClos.onclick=function(){
            oPic.style.display='block';
            oNae.style.display='block';
            oTent.style.display='block';
            oBtn1.style.display='block';
            oDiv.style.display='none';
            oDov.style.display='none';
            oClos.style.display='none';
        }
    }

    getInfo();
};

function getInfo() {
    $.ajax({
        type: 'POST',
        url: './getMyJoinActivityListByUserId.do',
        timeout: 5000,
        dataType: 'json',      //声明返回文件类型
        data: [
            {name: "pageNow", value: ac_total / ac_pageSize+1}, //发送分页所需数据
            {name: "pageSize", value: ac_pageSize}
        ],

        success: function (data) {
            var jsonData = data;
            if (jsonData != null) {
                var size = jsonData.length;
                for (var i = 0; i < size; i++) { //遍历 为页面添加节点

                    //声明需要增加的节点
                    var link = basePath+'1/'+jsonData[i].activityId+'/'+nowUserId+'/getActivityById.do';
                    var actName =jsonData[i].activityTitle;
                    var actImg = imgpath + jsonData[i].userId + '.jpg';
                    var actNum = jsonData[i].personNumber;
                    var joinNow = jsonData[i].joinNow;

                    var htm = '<div class="media"><div class="media-left media-middle"><a href="'+link+'"> <img src="./togmob/images/border2.png" width="63" height="63"> <div class="head_p"> <img class="media-object img-circle" src="'+actImg+'" width="60"  height="60" alt=""> </div> </a> </div> <div class="media-body"> <p class="act_name">'+actName+'</p> <p class="act_num">已有'+joinNow+'人报名</p> </div> <div class="media-right media-middle"> <a href=""><img src="./togmob/images/click.png" alt=""/></a> </div> </div> <div class="progress_sm"> <div class="progress-bar_sm progress-striped progress-bar-danger" name="probar" role="progressbar" aria-valuenow="'+joinNow+'" aria-valuemin="0" aria-valuemax="'+actNum+'"></div></div>';
                    var ul = document.getElementById("actUl");//获取将增加节点的父节点
                    var li = document.createElement("li");//创造li
                    var hr = document.createElement("hr");//创造hr
                    li.innerHTML = htm;   //写入节点信息
                    ul.appendChild(li); //更改页面dom节点
                    ul.appendChild(hr);
                    ac_total++;    //计数器总数加一
                    if(ac_total%ac_pageSize==0){
                        var lod = document.getElementById("loading");   //获取到更多加载的对象
                        lod.style.display = "block";    //‘更多’设置为可见
                        lod.onclick = function(){   //执行翻页方法
                            getInfo();
                            lod.style.display="none";}
                    }


                }

            }
        }

    })
}

