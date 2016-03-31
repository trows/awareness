//window.onload=function(img1,name,data,img2){
//    var oDiv=document.getElementById('myAct');
//    var oLi=oDiv.createElement('li');
//    var htm='<div class="media"><div class="media-left media-middle"><a href="myAct.jsp"><img src="images/border2.png" width="63" height="63"><div class="head_p"><img class="media-object img-circle" src="images/user_pic.png" width="60"  height="60" alt=""></div</a></div><div class="media-body"><p class="act_name">С��</p><p class="act_num">2015��7��16�ձ���</p></div><div class="media-right media-middle"><img src="images/IMG_0730.PNG" class="img-circle" alt=""/></div> </div>	';
//    oLi.innerHTML=htm;
//    //oDiv.appendChild(oLi);
//}
window.onload=function(){
    var oBtn=document.getElementById('btn_submit');
    var oTet=document.getElementById('edit_it');
    var oShw=document.getElementById('shadow');
    var oActe=document.getElementById('act_endtime');
    var oActn=document.getElementById('act_pnum');
    var oActs=document.getElementById('act_show');

    var oIut=document.getElementById('input_k')
    oShw.style.display='none';
    oTet.style.display='block';
    oActe.onclick=function(){
        oTet.style.display='block';
        oShw.style.display='block';
        oIut.style.display='block';
    };
    oActn.onclick=function(){
        oTet.style.display='block';
        oShw.style.display='block';
        oIut.style.display='block';
    };
    oActs.onclick=function(){
        oTet.style.display='block';
        oShw.style.display='block';
        oIut.style.display='block';
    };
}