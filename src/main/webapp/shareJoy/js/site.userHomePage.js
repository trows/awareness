var ac_pageSize = 5;   //页面每次加载显示信息的数量
var ac_total = 0;
var basePath = document.getElementById("basePath").value;
var userId = document.getElementById("userId").value;
var imgpath = document.getElementById("hImg").value;
var classNum = 0;
window.onload = function () {
    getInfo();
}

function getInfo() {
    $.ajax({
        type: 'POST',
        url: './getMyJoinActivityListByUserId.do',
        timeout: 5000,
        dataType: 'json',      //声明返回文件类型
        data: [
            {name: "pageNow", value: ac_total / ac_pageSize + 1}, //发送分页所需数据
            {name: "pageSize", value: ac_pageSize},
            {name:"userId",value: userId}
        ],

        success: function (data) {
            var jsonData = data;
            if (jsonData != null) {
                var size = jsonData.length;
                var myAct = document.getElementById("myAct");
                var myJoinAct = document.getElementById("myJoinAct");
                for (var i = 0; i < size; i++) { //遍历 为页面添加节点

                    //声明需要增加的节点
                    var link = basePath + '1/' + jsonData[i].activityId + '/' + userId + '/getActivityById.do';
                    var actName = jsonData[i].activityTitle;
                    var actImg = imgpath + jsonData[i].userId + '.jpg';
                    var startTime = jsonData[i].startTime;
                    var location = jsonData[i].location;
                    var createTime = jsonData[i].createTime;
                    var userName = jsonData[i].userName;

                    var htm = '<div class="person">' +
                        '<a href="' + link + '">' +
                        '<div class="act-messgae">' +
                        '<div class="headimg">' +
                        '<img  src="' + actImg + '"/>' +  //活动发起者头像
                        '</div>' +
                        '<ul class="act-con">' +
                        '<li class="per-name">' + userName + '</li>' +   //活动发起者昵称
                        '<li class="act-tag">' + actName + '</li>' +    //活动名称
                        '<li class="act-time"><img src="./shareJoy/asset/time.png" />' + startTime.substring(0,16) + '</li>' +     //活动开始时间
                        '<li class="act-place"><img src="./shareJoy/asset/place.png">' + location + '</li>' +//活动地点
                        '</ul>' +
                        '</a>' +
                        '<ul class="act-member act-member' + classNum + '" data = '+jsonData[i].activityId+'>' +
                        '</ul>' +
                        '</div>' +
                        '</div>';


                    var div = document.createElement("div");
                    div.innerHTML = htm;   //写入节点信息
                    if(jsonData[i].userId == userId){
                        myAct.appendChild(div);
                    }else {
                        myJoinAct.appendChild(div);
                    }
                    ac_total++;    //计数器总数加一

                }
                //填充活动参与信息   存在重大bug  ！！！！
                var className = 'act-member' +classNum;
                //console.log(className);
                var divList = document.getElementsByClassName(className);

                //alert("获取到class长度" + divList.length);

                for (var i = 0; i < size; i++) {
                    //console.log("first"+i);
                    $.ajax({
                        type: 'POST',
                        url: './getJoinInfo.do',
                        timeout: 5000,
                        dataType: 'json',      //声明返回文件类型
                        async:false,
                        data: [
                            {name: "pageNow", value: 1},     //提供所需要的页数
                            {name: "pageSize", value: 7},  //提供没页的大小
                            {name: "actId", value: divList[i].getAttribute("data")} //提供页面的id

                        ],
                        success: function (JData) {
                            //console.log("sec"+i);
                            //成功返回单个活动的参与者信息
                            if (JData != null) {
                                var length = JData.length;
                                var li = document.createElement("li");
                                var htmlText="";
                                for (var j = 0; j < length; j++) {
                                    //alert(JData[j].participator);
                                    htmlText = htmlText + '<img src="' + imgpath + JData[j].participator + '.jpg">';
                                    //console.log("thr"+i);
                                }
                                li.innerHTML =htmlText;
                                divList[i].appendChild(li);
                            }
                        }
                    })
                }
                classNum+=1;
            }
        }

    })
}

//function setBackImg(){
//    alert("你特么执行啊");
//    document.getElementById('header').style.background='url('+imgpath+userId+'.jpg) no-repeat center center';
//}



