/**
 * Created by Administrator on 2015/8/26.
 */
window.onload=function() {
    var b = /^[0-9]*$/;
    var oTet = document.getElementById('content');
    var oImg=oTet.getElementsByTagName('img');
    var spans = document.getElementsByClassName('notNull');
    var maxLen = document.getElementsByClassName('maxLen');
    var actName = document.getElementById('actName');
    var actPlace = document.getElementById('actPlace');
    var nums = document.getElementById('num');
    var dis = document.getElementById('disc');
    var start = document.getElementById('appDateTime1');
    var end = document.getElementById('appDateTime2');
    var lastTime = document.getElementById('appDateTime3');
    var oAct1 = document.getElementById('act_name');
    var oAct2 = document.getElementById('act_place');
    var oAct3 = document.getElementById('act_pnum');
    var oAct4 = document.getElementById('act_show');
    var oAct5 = document.getElementById('act_statime');
    var oAct6 = document.getElementById('act_endtime');
    var oAct7 = document.getElementById('act_endt');
    var oBtn = document.getElementsByTagName('button');
    var actForm = document.getElementsByName('myForm');
    oAct1.focus();
    oAct1.style.display = 'block';//名称
    oAct2.style.display = 'none';//地点
    oAct3.style.display = 'none';//人数
    oAct4.style.display = 'none';//活动描述
    oAct5.style.display = 'none';//开始时间
    oAct6.style.display = 'none';//截止时间
    oAct7.style.display = 'none';//结束时间
    //function getNum(date){
    //
    //}
    //控制textarea的输入字符上限
    //function textCounter(filed,maxlimit){
    //    if(filed.value.length>maxlimit)
    //    {
    //        //如果大于上限，按照最大字符数截断
    //        filed.value=filed.value.substring(0,maxlimit);
    //    }
    //
    //}
    //名称
    oBtn[0].onclick= function () {//点击确定按钮
        if (actName.value.length == 0)            //判断input里的值是否为空
        {
            maxLen[2].style.display = "none";
            spans[0].style.display = "block";       //如果空给出提示
        }
        else if (actName.value.length > 10) {          //字数不超过10
            spans[0].style.display = "none";
            maxLen[0].style.display = "block";        //超过则给出提示
        }
        else {                                       //判断成功
            spans[0].style.display = "none";
            maxLen[0].style.display = "none";
            oAct2.style.display = 'block';//显示地点
            oAct1.style.display = 'none';
            oAct2.focus();
        }
    };
    //地点
    oBtn[1].onclick = function () {
        if (actPlace.value.length == 0)               //判空
        {
            maxLen[1].style.display = "none";
            spans[1].style.display = "block";       //给出不能为空的提示
        }
        else if (actPlace.value.length > 20) {          //不超过20个字
            spans[1].style.display = "none";
            maxLen[1].style.display = "block";        //给出超过限定字数的提示
        }
        else {                                       //判断成功
            spans[1].style.display = "none";
            maxLen[1].style.display = "none";
            oAct2.style.display = 'none';
            oAct3.style.display = 'block';//显示地点，第三条表单出现
            oAct3.focus();
        }
    };
    //人数
    oBtn[2].onclick = function () {
        if (nums.value.length == 0)                    //判空
        {
            maxLen[2].style.display = "none";
            spans[2].style.display = "block";       //如果空给出不能为空的提示
        }
        else if ((b.test(nums.value) == false))      //判断是否为数字
        {
            spans[2].style.display = "none";
            maxLen[2].style.display = "block";        //给出只能是数字的提示
        }
        else {                                       //填写正确
            spans[2].style.display = "none";
            maxLen[2].style.display = "none";
            oAct3.style.display = 'none';
            oAct5.style.display = 'block';//显示开始时间
            oAct5.focus();//下一表单出现
        }
    };

    //开始时间
    oBtn[3].onclick = function () {
        if (start.value.length == 0 )        //开始时间为空时，给出提示
        {
            spans[4].style.display = "block";
        }
        else {
            oAct5.style.display = 'none';
            oAct7.style.display = 'block';//显示结束时间
            oAct4.focus();
        }

    };
    //结束时间
    oBtn[4].onclick=function(){
        if (end.value.length == 0 )        //开始时间为空时，给出提示
        {
            spans[4].style.display = "block";
            maxLen[4].style.display = "none";
        }
       else if(start.value!=0&&start.value!=0) {
            if (start.value >= end.value) {
                spans[4].style.display = "none";
                maxLen[4].style.display = "block";
            }
            else {
                oAct7.style.display = 'none';
                oAct6.style.display = 'block';//显示截止时间
                oAct6.focus();
            }
        }

    };


//截止时间
    oBtn[5].onclick = function () {
        if (lastTime.value.length == 0)              //判空并给出提示
        {
            spans[5].style.display = "block";
            maxLen[5].style.display = "none";
        }
       else if (lastTime.value > start.value)              //报名截止时间小于开始时间，通过，并跳到下一条表单
        {
            maxLen[5].style.display = "block";
            spans[5].style.display = "none";
        }
        else {
            spans[5].style.display = "none";
            maxLen[5].style.display = "none";
            oAct1.style.display = 'none';//名称
            oAct2.style.display = 'none';//地点
            oAct3.style.display = 'none';//人数
            oAct4.style.display = 'block';//活动描述
            oAct5.style.display = 'none';//开始时间
            oAct6.style.display = 'none';//截止时间
            oAct7.style.display = 'none';//结束时间
            oAct4.focus();
        }

    };
    oImg[0].onclick=function(){
        oAct2.style.display = 'block';//显示地点2
        oAct1.style.display = 'none';
        oAct3.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct5.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };
    oImg[1].onclick=function(){
        oAct2.style.display = 'none';
        oAct1.style.display = 'block';//显示名称1
        oAct3.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct5.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };
    oImg[2].onclick=function(){
        oAct2.style.display = 'none';
        oAct3.style.display = 'block';//显示人数3
        oAct1.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct5.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };
    oImg[3].onclick=function(){
        oAct2.style.display = 'block';
        oAct3.style.display = 'none';//显示地点2
        oAct1.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct5.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };
    oImg[4].onclick=function(){
        oAct5.style.display = 'block';
        oAct3.style.display = 'none';//显示开始时间4
        oAct1.style.display = 'none';//人数
        oAct2.style.display = 'none';//活动描述
        oAct4.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };
    oImg[5].onclick=function(){
        oAct3.style.display = 'block';
        oAct2.style.display = 'none';//显示人数3
        oAct1.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct5.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };
    oImg[6].onclick=function(){
        oAct7.style.display = 'block';
        oAct3.style.display = 'none';//显示结束时间5
        oAct1.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct2.style.display = 'none';//开始时间
        oAct5.style.display = 'none';//截止时间
        oAct6.style.display = 'none';//结束时间
    };
    oImg[7].onclick=function(){
        oAct5.style.display = 'block';
        oAct3.style.display = 'none';//显示开始时间4
        oAct1.style.display = 'none';//人数
        oAct2.style.display = 'none';//活动描述
        oAct4.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };
    oImg[8].onclick=function(){
        oAct6.style.display = 'block';
        oAct3.style.display = 'none';//显示截止时间6
        oAct1.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct5.style.display = 'none';//开始时间
        oAct2.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };
    oImg[9].onclick=function(){
        oAct7.style.display = 'block';
        oAct3.style.display = 'none';//显示结束时间5
        oAct1.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct2.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct5.style.display = 'none';//结束时间
    };
    oImg[10].onclick=function(){
        oAct4.style.display = 'block';
        oAct3.style.display = 'none';//显示描述7
        oAct1.style.display = 'none';//人数
        oAct7.style.display = 'none';//活动描述
        oAct5.style.display = 'none';//开始时间
        oAct6.style.display = 'none';//截止时间
        oAct2.style.display = 'none';//结束时间
    };
    oImg[11].onclick=function(){
        oAct6.style.display = 'block';
        oAct3.style.display = 'none';//显示截止时间6
        oAct1.style.display = 'none';//人数
        oAct4.style.display = 'none';//活动描述
        oAct5.style.display = 'none';//开始时间
        oAct2.style.display = 'none';//截止时间
        oAct7.style.display = 'none';//结束时间
    };


    //描述
    oBtn[6].onclick = function () {
        if (dis.value.length == 0) {
            maxLen[6].style.display = "none";
            spans[6].style.display = "block";
        }
        else if (dis.value.length > 140) {          //字数限制
                spans[6].style.display = "none";
                maxLen[6].style.display = "block";
            }
            else {                                   //填写完整，提交表单
                spans[6].style.display = "none";
                maxLen[6].style.display = "none";
                actForm.submit();
            }
    };
};