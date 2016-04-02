var userName = document.getElementById("userName").value;
var desc = document.getElementById("desc").value;
var imgUrl = document.getElementById("img").value;
var link = document.getElementById("basePath").value;
var nowUserId = document.getElementById("nowUserId").value;
var actUserId = document.getElementById("actUserId").value;
var nowUserName = document.getElementById("nowUserName").value;
var actId = document.getElementById("actId").value;
var shareNow = document.getElementById("shareNow").value + 1;
var pageToken = document.getElementById("pageToken").value;
var ul = document.getElementById("joinInfo");
var joinNow = document.getElementById("joinNow").value;
var perNum = document.getElementById("perNum").value;
var startTime = document.getElementById("startTime").value;
var actMember = document.getElementsByClassName("act-member");
var joinText = document.getElementById("joinText");
var joinButton = document.getElementById("joinButton");
window.onload=function(){
    $.ajax({
        type: 'POST',
        url: './getSignature.do',
        timeout: 5000,
        dataType: 'json',      //声明返回文件类型
        data: [
            {name: "url", value: window.location.href}
        ],

        success: function (data) {
            //获取分享所必须的信息

            //判断用户属性
            if (nowUserId == actUserId) {//当前用户为活动发起者时
                link = link + '1/' + actId + '/' + nowUserId + '/getActivityById.do';
            } else {
                link = link + shareNow + '/' + actId + '/' + nowUserId + '/getActivityById.do';
            }
            //link 注入完毕
            //alert(title+"  "+desc+"  "+imgUrl+"  "+link);
            //===================
            wx.config({

                debug: false,
                appId: data.appId,
                timestamp: data.timestamp,
                nonceStr: data.nonceStr,
                signature: data.signature,
                jsApiList: [
                    'checkJsApi',
                    'onMenuShareTimeline',
                    'onMenuShareAppMessage',
                    'hideMenuItems',
                    'showMenuItems'
                ]
            });


            wx.ready(function () {
                //当启动时批量隐藏菜单
                wx.hideMenuItems({
                    menuList: [
                        'menuItem:readMode', // 阅读模式
                        'menuItem:copyUrl',// 复制链接
                        'menuItem:share:qq',//分享到qq
                        'menuItem:share:weiboApp',//分享到微博
                        'menuItem:share:facebook',
                        'menuItem:share:QZone',
                        'menuItem:editTag',//编辑标签
                        'menuItem:delete',//删除
                        'menuItem:copyUrl',//复制链接
                        'menuItem:originPage',//原网页
                        'menuItem:readMode',//阅读模式
                        'menuItem:openWithQQBrowser',//在QQ浏览器中打开
                        'menuItem:openWithSafari',
                        'menuItem:share:email',
                        'menuItem:share:brand'

                    ],
                    success: function (res) {
                        //alert('成功启动菜单隐藏');
                    },
                    fail: function (res) {
                        //alert(JSON.stringify(res));
                    }
                });
                /**
                 * 注入分享到朋友的信息
                 */
                wx.onMenuShareAppMessage({
                    title: userName+'发起的活动',
                    desc: desc,
                    link: link,
                    imgUrl: imgUrl + nowUserId + '.jpg',
                    trigger: function () {
                        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
                        //alert('用户点击发送给朋友');
                    },
                    success: function () {
                        //alert('已分享给朋友');
                    },
                    cancel: function () {
                        alert('已取消');
                    },
                    fail: function (res) {
                        alert(JSON.stringify(res));
                    }
                });
                /**
                 * 注入分享到朋友圈信息
                 */
                wx.onMenuShareTimeline({
                    title: userName+'发起的活动',
                    link: link,
                    imgUrl: imgUrl + nowUserId + '.jpg',
                    trigger: function () {
                        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
                        //alert('用户点击分享到朋友圈');
                    },
                    success: function () {
                        //alert('已分享至朋友圈');
                    },
                    cancel: function () {
                        alert('已取消');
                    },
                    fail: function (res) {
                        alert(JSON.stringify(res));
                    }
                });
            });
        }

    })
    //往下可以继续码需要初始化加载的方法

    getJoinInfo();

    proJoinButton();
}

function getJoinInfo(){

    $.ajax({
        type: 'POST',
        url: './getJoinInfo.do',
        timeout: 5000,
        dataType: 'json',      //声明返回文件类型
        data: [
            {name: "pageNow", value: 1},     //提供所需要的页数
            {name: "pageSize", value: 50},  //提供没页的大小
            {name: "actId", value: actId} //提供页面的id

        ],

        success: function (data) {  //当参数成功返回时
            var size = data.length;

            for (var i = 0; i < size; i++) {
                var imgLink = imgUrl+data[i].participator+'.jpg';
                addJoinInfo(imgLink);
            }

        }
    });

}

function addJoinInfo(imgLink){
    var li = document.createElement("li");
    var htm ='<img src="'+imgLink+'">';
    li.innerHTML = htm;
    actMember[0].appendChild(li);
}

function proJoinButton() {

    if (nowUserId == actUserId) {
        joinText.innerHTML = '编辑';
        joinButton.onclick = function(){
            $('#modify').action='./shareJoy/modifyActivity.jsp';
           $('#modify').submit();
        }
    } else {
        joinCheck();
    }

}

function joinCheck() {
    $.ajax({
        type: 'POST',
        url: './joinCheck.do',
        timeout: 5000,
        dataType: 'text',      //声明返回文件类型
        data: [
            {name: "actId", value: actId} //提供活动的id
        ],

        success: function (data) {
            if (data == 'true') {     //当用户已经参与活动时
                joinText.innerHTML = '已参加';
            } else {

                var str = startTime.replace(/-/g,"/");
                var lastDate = new Date(str);
                var now = new Date();

                //alert(joinNow+"--"+perNum+"--"+lastDate+"--"+now);
                if (parseInt(joinNow) < parseInt(perNum)  && lastDate>now) {
                    joinText.innerHTML = '参加';
                    joinButton.onclick = function () {
                        joinAct();
                    }
                }else{
                    joinText.innerHTML = '来晚了';
                }
            }
        }
    });
}

function joinAct() {
    $.ajax({
        type: 'POST',
        url: './joinAct.do',
        timeout: 5000,
        dataType: 'text',      //声明返回文件类型
        data: [
            {name: "actId", value: actId},
            {name: "pageToken", value: pageToken},    //提供活动的id
            {name: "actMaster" , value :actUserId}
        ],

        success: function (data) {
            if (data == 'ok') {     //当报名成功时
                joinButton.onclick = function () {
                };
                joinText.innerHTML = '已参加';
                var imgLink = imgUrl+nowUserId+'.jpg';
                addJoinInfo(imgLink);
                document.getElementById("joinSp").innerHTML = parseInt(joinNow)+1+"";
                alert("报名成功");
            } else {
                alert("报名失败请再次尝试");
            }
        }
    });
}