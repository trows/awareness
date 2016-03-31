package com.awareness.trows.util.wechatSDK.method;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.awareness.trows.util.httpClient.Client;
import com.awareness.trows.util.wechatSDK.entity.WeChatInfo;
import com.awareness.trows.util.wechatSDK.entity.WxConfig;

import java.util.Map;
import java.util.UUID;

/**
 * Created by Throws_exception on 2015/8/18.
 * 此类为微信要求中继服务，为整个应用刷新accessToken，ticket
 * 服务启动3s后开始执行  每6800秒刷新一次
 */
public class WxTicketTask {

    /**
     * 任务方法，可被外界随时调用 调用一次系统刷新一次参数值
     *    WxConfig.accessToken;
         WxConfig.timestamp;
         WxConfig.nonceStr;
         WxConfig.ticket;
     */
    public void doTask() {
        //获取httpClient对象
        System.out.println("准备向微信发出请求更新微信ticket");
        Client client = Client.getSingletonClient();

        //创建请求url
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
                + WeChatInfo.appID + "&secret=" + WeChatInfo.appsecret;
        //向微信服务器发出请求
        String resultJson = client.clientGet(url);
        //解析微信返回的数据
        Map<String, String> mapToken = JSON.parseObject(resultJson, new TypeReference<Map<String, String>>() {
        });
        //获得公众平台的许可令牌
        String accessToken = mapToken.get("access_token");

        //生成请求ticket的url
        String tickUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + accessToken + "&type=jsapi";
        //向服务器发送请求
        resultJson = client.clientGet(tickUrl);
        mapToken = JSON.parseObject(resultJson, new TypeReference<Map<String, String>>() {
        });
//        获得ticket
        String ticket = mapToken.get("ticket");

//       当所有请求都成功返回时 更新内存之中的数据
        if ("ok".equals(mapToken.get("errmsg"))) {
            WxConfig.accessToken = accessToken;
            WxConfig.ticket = ticket;
            System.out.println("成功更新ticket");
        } else {//否则暂停5秒 重新执行
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.doTask();  //自我调用
        }

    }

}
