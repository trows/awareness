window.onload = function () {
    /*===========================点击确定跳到下一节==============================*/
    var b = /^[0-9]*$/;
    var btns = document.getElementsByClassName('btn-success');
    var forms = document.getElementsByClassName('form-group');
    var spans = document.getElementsByClassName('notNull');
    var maxLen = document.getElementsByClassName('maxLen');
    var actName = document.getElementById('actName');
    var actPlace=document.getElementById('actPlace');
    var nums = document.getElementById('num');
    var dis =document.getElementById('disc');
    var start = document.getElementById('appDateTime1');
    var end = document.getElementById('appDateTime2');
    var lastTime = document.getElementById('appDateTime3');
    var actForm = document.getElementsByName('myForm');
    actName.focus();

    btns[0].onclick = function () {             //活动名称判断
        if (actName.value.length==0)            //判空
        {
            maxLen[2].style.display="none";
            spans[0].style.display = "block";       //如果空给出提示
        }
        else if(actName.value.length>10){          //字数不超过10
            spans[0].style.display="none";
            maxLen[0].style.display="block";        //超过则给出提示
        }
        else{                                       //判断成功
            spans[0].style.display="none";
            maxLen[0].style.display="none";
            forms[0].style.display="none";
            forms[1].style.display="block";         //第二条表单出现
            actPlace.focus();
        }

    }
    btns[1].onclick = function () {                 //活动地点判断
        if (actPlace.value.length==0)               //判空
        {
            maxLen[2].style.display="none";
            spans[1].style.display = "block";       //给出不能为空的提示
        }
        else if(actPlace.value.length>20){          //不超过20个字
            spans[1].style.display="none";
            maxLen[1].style.display="block";        //给出超过限定字数的提示
        }
        else{                                       //判断成功
            spans[1].style.display="none";
            maxLen[1].style.display="none";
            forms[1].style.display="none";
            forms[2].style.display="block";         //第三条表单出现
            nums.focus();
        }

    }
    btns[2].onclick = function () {                 //活动人数判断

        if(nums.value.length==0)                    //判空
        {
            maxLen[2].style.display="none";
            spans[2].style.display = "block";       //如果空给出不能为空的提示
        }
        else if((b.test(nums.value) == false))      //判断是否为数字
        {
            spans[2].style.display="none";
            maxLen[2].style.display="block";        //给出只能是数字的提示
        }
        else{                                       //填写正确
            spans[2].style.display="none";
            maxLen[2].style.display="none";
            forms[2].style.display = "none";
            forms[3].style.display = "block";       //下一表单出现
        }

    }
    btns[3].onclick = function () {                 //开始时间


        if(start.value.length == 0 && end.value.length == 0)        //开始时间和结束时间都为空，给出提示
        {
            spans[3].style.display = "block";
            spans[4].style.display = "block";
        }
        else if(start.value.length >= 0 && end.value.length == 0)   //开始时间不空，结束时间为空，给出提示
        {
            spans[3].style.display = "none";
            spans[4].style.display = "block";
        }
        else if(start.value.length == 0 && end.value.length >= 0)   //开始时间为空，结束时间不空，给出提示
        {
            spans[3].style.display = "block";
            spans[4].style.display = "none";
        }
        else                            //都不为空
        {
            if(end.value>=start.value)          //结束时间大于开始时间，下一条表单出现
            {
                forms[3].style.display = "none";
                forms[4].style.display = "block";
            }
            else                                   //结束时间小于开始时间时，给出提示
            {
                maxLen[3].style.display="block";
                spans[3].style.display = "none";
                spans[4].style.display = "none";

            }
        }
    }
    btns[4].onclick = function () {                 //报名截止时间

        if(lastTime.value.length == 0)              //判空并给出提示
        {
            spans[5].style.display = "block";
        }
        else                                        //填写截止时间后，判断先后
        {
            if(lastTime.value<start.value)              //报名截止时间小于开始时间，通过，并跳到下一条表单
            {
                spans[5].style.display = "none";
                forms[4].style.display = "none";
                forms[5].style.display = "block";
                dis.focus();
            }
            else                                //报名时间晚于截止时间，给出提示
            {
                maxLen[4].style.display = "block";
            }

        }
    }
    btns[5].onclick = function () {             //活动描述

        if (dis.value.length==0)                //判空给出提示
        {
            maxLen[5].style.display="none";
            spans[6].style.display = "block";
        }
        else if(dis.value.length>140){          //字数限制
            spans[6].style.display="none";
            maxLen[5].style.display="block";
        }
        else{                                   //填写完整，提交表单
            spans[6].style.display="none";
            maxLen[3].style.display="none";
            actForm.submit();
        }
    }
    /*==============================结束=============================*/

    /*==========================表单验证============================*/

}
