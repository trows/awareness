package com.awareness.trows.util.wechatSDK.entity;

/**
 * Created by Throws_exception on 2015/7/16.
 */
    public class WeChatInfo {
    public static final String appID = "wx7cda8c18b8f381a5";    //appID
    public static final String appsecret = "80649255ed5fdeb48f47fdfb496cbd36";  //appsecret

//    public static final String redirect_uri = "http://youband.wicp.net/awareness/getUsrInfo.do";
    public static final String redirect_uri = "http://www.zhishimap.com/awareness/getUsrInfo.do"; //回调地址
    public static final int overtime = 604800000;//用户信息超时刷新时间
    public static final String imgServer = "http://222.24.63.100:9149/uimage/perImage.do";  //图片服务器地址
    public static final String imgPath = "http://222.24.63.100:9149/uimage/headimg/";    //图片服务器调用地址


}
