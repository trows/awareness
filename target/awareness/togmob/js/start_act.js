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
    oAct1.style.display = 'block';//����
    oAct2.style.display = 'none';//�ص�
    oAct3.style.display = 'none';//����
    oAct4.style.display = 'none';//�����
    oAct5.style.display = 'none';//��ʼʱ��
    oAct6.style.display = 'none';//��ֹʱ��
    oAct7.style.display = 'none';//����ʱ��
    //function getNum(date){
    //
    //}
    //����textarea�������ַ�����
    //function textCounter(filed,maxlimit){
    //    if(filed.value.length>maxlimit)
    //    {
    //        //����������ޣ���������ַ����ض�
    //        filed.value=filed.value.substring(0,maxlimit);
    //    }
    //
    //}
    //����
    oBtn[0].onclick= function () {//���ȷ����ť
        if (actName.value.length == 0)            //�ж�input���ֵ�Ƿ�Ϊ��
        {
            maxLen[2].style.display = "none";
            spans[0].style.display = "block";       //����ո�����ʾ
        }
        else if (actName.value.length > 10) {          //����������10
            spans[0].style.display = "none";
            maxLen[0].style.display = "block";        //�����������ʾ
        }
        else {                                       //�жϳɹ�
            spans[0].style.display = "none";
            maxLen[0].style.display = "none";
            oAct2.style.display = 'block';//��ʾ�ص�
            oAct1.style.display = 'none';
            oAct2.focus();
        }
    };
    //�ص�
    oBtn[1].onclick = function () {
        if (actPlace.value.length == 0)               //�п�
        {
            maxLen[1].style.display = "none";
            spans[1].style.display = "block";       //��������Ϊ�յ���ʾ
        }
        else if (actPlace.value.length > 20) {          //������20����
            spans[1].style.display = "none";
            maxLen[1].style.display = "block";        //���������޶���������ʾ
        }
        else {                                       //�жϳɹ�
            spans[1].style.display = "none";
            maxLen[1].style.display = "none";
            oAct2.style.display = 'none';
            oAct3.style.display = 'block';//��ʾ�ص㣬������������
            oAct3.focus();
        }
    };
    //����
    oBtn[2].onclick = function () {
        if (nums.value.length == 0)                    //�п�
        {
            maxLen[2].style.display = "none";
            spans[2].style.display = "block";       //����ո�������Ϊ�յ���ʾ
        }
        else if ((b.test(nums.value) == false))      //�ж��Ƿ�Ϊ����
        {
            spans[2].style.display = "none";
            maxLen[2].style.display = "block";        //����ֻ�������ֵ���ʾ
        }
        else {                                       //��д��ȷ
            spans[2].style.display = "none";
            maxLen[2].style.display = "none";
            oAct3.style.display = 'none';
            oAct5.style.display = 'block';//��ʾ��ʼʱ��
            oAct5.focus();//��һ������
        }
    };

    //��ʼʱ��
    oBtn[3].onclick = function () {
        if (start.value.length == 0 )        //��ʼʱ��Ϊ��ʱ��������ʾ
        {
            spans[4].style.display = "block";
        }
        else {
            oAct5.style.display = 'none';
            oAct7.style.display = 'block';//��ʾ����ʱ��
            oAct4.focus();
        }

    };
    //����ʱ��
    oBtn[4].onclick=function(){
        if (end.value.length == 0 )        //��ʼʱ��Ϊ��ʱ��������ʾ
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
                oAct6.style.display = 'block';//��ʾ��ֹʱ��
                oAct6.focus();
            }
        }

    };


//��ֹʱ��
    oBtn[5].onclick = function () {
        if (lastTime.value.length == 0)              //�пղ�������ʾ
        {
            spans[5].style.display = "block";
            maxLen[5].style.display = "none";
        }
       else if (lastTime.value > start.value)              //������ֹʱ��С�ڿ�ʼʱ�䣬ͨ������������һ����
        {
            maxLen[5].style.display = "block";
            spans[5].style.display = "none";
        }
        else {
            spans[5].style.display = "none";
            maxLen[5].style.display = "none";
            oAct1.style.display = 'none';//����
            oAct2.style.display = 'none';//�ص�
            oAct3.style.display = 'none';//����
            oAct4.style.display = 'block';//�����
            oAct5.style.display = 'none';//��ʼʱ��
            oAct6.style.display = 'none';//��ֹʱ��
            oAct7.style.display = 'none';//����ʱ��
            oAct4.focus();
        }

    };
    oImg[0].onclick=function(){
        oAct2.style.display = 'block';//��ʾ�ص�2
        oAct1.style.display = 'none';
        oAct3.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct5.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };
    oImg[1].onclick=function(){
        oAct2.style.display = 'none';
        oAct1.style.display = 'block';//��ʾ����1
        oAct3.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct5.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };
    oImg[2].onclick=function(){
        oAct2.style.display = 'none';
        oAct3.style.display = 'block';//��ʾ����3
        oAct1.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct5.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };
    oImg[3].onclick=function(){
        oAct2.style.display = 'block';
        oAct3.style.display = 'none';//��ʾ�ص�2
        oAct1.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct5.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };
    oImg[4].onclick=function(){
        oAct5.style.display = 'block';
        oAct3.style.display = 'none';//��ʾ��ʼʱ��4
        oAct1.style.display = 'none';//����
        oAct2.style.display = 'none';//�����
        oAct4.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };
    oImg[5].onclick=function(){
        oAct3.style.display = 'block';
        oAct2.style.display = 'none';//��ʾ����3
        oAct1.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct5.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };
    oImg[6].onclick=function(){
        oAct7.style.display = 'block';
        oAct3.style.display = 'none';//��ʾ����ʱ��5
        oAct1.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct2.style.display = 'none';//��ʼʱ��
        oAct5.style.display = 'none';//��ֹʱ��
        oAct6.style.display = 'none';//����ʱ��
    };
    oImg[7].onclick=function(){
        oAct5.style.display = 'block';
        oAct3.style.display = 'none';//��ʾ��ʼʱ��4
        oAct1.style.display = 'none';//����
        oAct2.style.display = 'none';//�����
        oAct4.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };
    oImg[8].onclick=function(){
        oAct6.style.display = 'block';
        oAct3.style.display = 'none';//��ʾ��ֹʱ��6
        oAct1.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct5.style.display = 'none';//��ʼʱ��
        oAct2.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };
    oImg[9].onclick=function(){
        oAct7.style.display = 'block';
        oAct3.style.display = 'none';//��ʾ����ʱ��5
        oAct1.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct2.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct5.style.display = 'none';//����ʱ��
    };
    oImg[10].onclick=function(){
        oAct4.style.display = 'block';
        oAct3.style.display = 'none';//��ʾ����7
        oAct1.style.display = 'none';//����
        oAct7.style.display = 'none';//�����
        oAct5.style.display = 'none';//��ʼʱ��
        oAct6.style.display = 'none';//��ֹʱ��
        oAct2.style.display = 'none';//����ʱ��
    };
    oImg[11].onclick=function(){
        oAct6.style.display = 'block';
        oAct3.style.display = 'none';//��ʾ��ֹʱ��6
        oAct1.style.display = 'none';//����
        oAct4.style.display = 'none';//�����
        oAct5.style.display = 'none';//��ʼʱ��
        oAct2.style.display = 'none';//��ֹʱ��
        oAct7.style.display = 'none';//����ʱ��
    };


    //����
    oBtn[6].onclick = function () {
        if (dis.value.length == 0) {
            maxLen[6].style.display = "none";
            spans[6].style.display = "block";
        }
        else if (dis.value.length > 140) {          //��������
                spans[6].style.display = "none";
                maxLen[6].style.display = "block";
            }
            else {                                   //��д�������ύ��
                spans[6].style.display = "none";
                maxLen[6].style.display = "none";
                actForm.submit();
            }
    };
};