package com.awareness.trows.util.wechatSDK.method;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.awareness.trows.entity.Account;
import com.awareness.trows.util.httpClient.Client;
import com.awareness.trows.util.wechatSDK.entity.WeChatInfo;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Throws_exception on 2015/7/16.
 */
public class AcotMethod {
    //获取用户基本信息
    public Account GetUsrInfoByCode(String code) {

        //通过code换取用户AccessToken及openid
        String userAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + WeChatInfo.appID + "&secret=" + WeChatInfo.appsecret + "&code=" + code + "&grant_type=authorization_code";
        Client client = Client.getSingletonClient();
        String resultJson = client.clientGet(userAccessTokenUrl);  //向服务器发送请求
        Map<String, String> mapToken = JSON.parseObject(resultJson, new TypeReference<Map<String, String>>() {});//解析Json数据
        String refreshToken = mapToken.get("refresh_token");
        String accessTokrn = mapToken.get("access_token");
        String openid = mapToken.get("openid");
        String unionid = mapToken.get("unionid");

        //通过API获取用户信息
        String userInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=" + accessTokrn + "&openid=" + openid + "&lang=zh_CN";
        resultJson = client.clientGet(userInfoUrl);
        Map<String, String> mapInfo = JSON.parseObject(resultJson, new TypeReference<Map<String, String>>() {
        });
        Account newAccount = new Account();
        newAccount.setRefreshTime(System.currentTimeMillis());  //获取更新时间
        newAccount.setAccessToken(accessTokrn);
        newAccount.setRefreshToken(refreshToken);
        newAccount.setOpenid(openid);
        if (unionid!=null&& !unionid.equals("")){
            newAccount.setUnionid(unionid);
        }
        newAccount.setUnionid(unionid);
        newAccount.setSex(Integer.parseInt(mapInfo.get("sex")));
        newAccount.setHeadimgurl(mapInfo.get("headimgurl"));
        newAccount.setProvince(mapInfo.get("province"));
        newAccount.setCity(mapInfo.get("city"));
        newAccount.setCountry(mapInfo.get("country"));
        newAccount.setNickName(mapInfo.get("nickname"));
        newAccount.setPriviege(mapInfo.get("priviege"));

        return newAccount;
    }

    public String GetOpenidByCode(String code){

        String userAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + WeChatInfo.appID + "&secret=" + WeChatInfo.appsecret + "&code=" + code + "&grant_type=authorization_code";
        Client client = Client.getSingletonClient();
        String resultJson = client.clientGet(userAccessTokenUrl);  //向服务器发送请求
        Map<String, String> mapToken = JSON.parseObject(resultJson, new TypeReference<Map<String, String>>() {});//解析Json数据
        return mapToken.get("openid");
    }

    /**
     * 持久化图片至图片服务器
     */
    public void PersistenceImg(String outPutRoute,String fileName,String address){
        Client client = Client.getSingletonClient();
        String url =  WeChatInfo.imgServer;
        Map<String,String> map = new HashMap<String, String>();
        map.put("outPutRoute",outPutRoute);
        map.put("fileName",fileName);
        map.put("address",address);
        client.clientPost(url,map);
    }

}
