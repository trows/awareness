package com.awareness.trows.util.youbandUtil;

/**
 * Created by Throws_exception on 2015/7/19.
 */
public class CreatID {
    private static volatile int union = 0;//静态变量  保证id不重复
    private static CreatID creatID = new CreatID();
    private CreatID(){}

    //生成用户id
    public static long getUserID(){
        String time = System.currentTimeMillis()+"";//获取当前系统时间
        time = time.substring(0,10);//截取时间前10位
        int random = (int) (100+Math.random()*888);//生成均匀分布的3位随机数
        long userID  = Long.parseLong(random+time+union);//生成用户id
        union++;
        if (union>9)union=0;//保证union循环
        return userID;
    }


    //生成活动id
    public static long getActID(long userID){
        String time = System.currentTimeMillis()+"";

        String tempId = userID+"";
        String actID = tempId.substring(tempId.length()-3)+time.substring(0,10);
        return Long.parseLong(actID);
    }

}
