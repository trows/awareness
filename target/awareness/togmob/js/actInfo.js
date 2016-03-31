var af_title = document.getElementById("hTitle").value;
var af_desc = document.getElementById("hDesc").value;
var af_imgUrl = document.getElementById("hImg").value;
var af_link = document.getElementById("basePath").value;
var af_nowUserId = document.getElementById("nowUserId").value;
var af_actUserId = document.getElementById("actUserId").value;
var af_actId = document.getElementById("actId").value;
var af_shareNow = document.getElementById("shareNow").value + 1;
var af_pageToken = document.getElementById("pageToken").value;
var af_nowUserName = document.getElementById("nowUserName").value;
var af_totalInfo = 0;
var af_pageSize = 5;
var af_joinButton = document.getElementById("join");
var joinText = document.getElementById("editBut");
var af_ul = document.getElementById("joinInfo");
var af_joinNow = document.getElementById("joinNow").value;
var af_perNum = document.getElementById("perNum").value;
var af_deadLine = document.getElementById("deadLine").value;
var af_actInfo_dom = document.getElementById("actInfo_dom");
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
			if (af_nowUserId == af_actUserId) {//当前用户为活动发起者时
				af_link = af_link + '1/' + af_actId + '/' + af_nowUserId + '/getActivityById.do';
			} else {
				link = af_link + af_shareNow + '/' + af_actId + '/' + af_nowUserId + '/getActivityById.do';
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
					title: af_title,
					desc: af_desc,
					link: af_link,
					imgUrl: af_imgUrl + af_nowUserId + '.jpg',
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
					title: af_title,
					link: af_link,
					imgUrl: af_imgUrl + af_nowUserId + '.jpg',
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
			{name: "pageNow", value: af_totalInfo / af_pageSize + 1},     //提供所需要的页数
			{name: "pageSize", value: af_pageSize},  //提供没页的大小
			{name: "actId", value: af_actId} //提供页面的id

		],

		success: function (data) {  //当参数成功返回时
			var size = data.length;
			var flink = "#";

			for (var i = 0; i < size; i++) {
				var imgLink = af_imgUrl+data[i].participator+'.jpg';
				if(af_nowUserId==af_actUserId){
					flink = './'+data[i].participator+'/getAUserActList.do';
				}
				addJoinInfo(flink,imgLink, data[i].patName, data[i].joinTime);
			}

		}
	});

}

//新建DOM节点方法
function addJoinInfo(link,imgLink,joinUserName,joinTime){
	var li = document.createElement("li");
	var htm = '<div><div><a href="'+link+'"><img src="./togmob/images/border2.png" width="63" height="63"><div class="head_p"><img class="img-circle" src="'+imgLink+'" width="60" height="60" alt=""></div></a></div><p class="act_name">'+joinUserName+'</p><p class="act_num">'+joinTime+'</p></div>';
	li.innerHTML = htm;
	af_actInfo_dom.appendChild(li);
	af_totalInfo++;

}

function proJoinButton() {

	if (af_nowUserId == af_actUserId) {
		joinText.innerHTML = '编辑';
		af_joinButton.onclick = function(){
			window.location.href="./togmob/editAct.jsp";
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
			{name: "actId", value: af_actId} //提供活动的id
		],

		success: function (data) {
			if (data == 'true') {     //当用户已经参与活动时
				joinText.innerHTML = '已参加';
			} else {
				var str = af_deadLine.replace(/-/g,"/");
				var lastDate = new Date(Date.parse(str));
				var now = new Date();

				if (af_joinNow < af_perNum && lastDate>now) {
					joinText.innerHTML = '参加';
					af_joinButton.onclick = function () {
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
			{name: "actId", value: af_actId},
			{name: "pageToken", value: af_pageToken},    //提供活动的id
			{name: "patName", value: af_nowUserName},
			{name: "actMaster" , value :af_actUserId}
		],

		success: function (data) {
			if (data == 'ok') {     //当报名成功时
				af_joinButton.onclick = function () {
				};
				joinText.innerHTML = '已参加';
				var myDate = new Date();
				var imgLink = af_imgUrl+af_nowUserId+'.jpg';

				addJoinInfo('',imgLink, af_nowUserName,myDate.toLocaleDateString());
				var showNum = document.getElementById("showNum");
				showNum.innerHTML = (af_joinNow+1)+'|'+af_perNum;
					alert("报名成功");
			} else {
				alert("报名失败请再次尝试");
			}
		}
	});
}