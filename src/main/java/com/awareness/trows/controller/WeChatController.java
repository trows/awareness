package com.awareness.trows.controller;


import com.alibaba.fastjson.JSON;
import com.awareness.trows.entity.Account;
import com.awareness.trows.service.AccountService;
import com.awareness.trows.util.wechatSDK.entity.WeChatInfo;
import com.awareness.trows.util.wechatSDK.entity.WxConfig;
import com.awareness.trows.util.wechatSDK.method.AcotMethod;
import com.awareness.trows.util.youbandUtil.CreatID;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller


public class WeChatController {
    @Autowired
    private AccountService accountService;

    /**
     * 状态验证服务  暂时无需开启
     *
     * @param request
     * @param response
     */
    @RequestMapping("/connect")
    public void ConnectWechat(HttpServletRequest request, HttpServletResponse response) {

        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");           //按照微信要求获取四个参数，前三个供验证是否为微信官方信息
        String echostr = request.getParameter("echostr");       //最后为返回信息

        //连接测试 忽略验证环节

        //========================

        try {
            PrintWriter out = response.getWriter();
            out.print(echostr);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 通过微信API获取用户信息
     *
     * @param request
     */
    @RequestMapping("/getUsrInfo")
    public void getUsrInfoByWe(HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("code");
        String state = request.getParameter("state");

        if (null != code && state != null) {  //判断用户是否授权 是否有返回code
            String requestPath = state.substring(0, state.length() - 1);   //请求的页面 表示授权后跳转的页面
            String method = state.substring(state.length() - 1);  //method为state最后一位o表示静默授权 i表显式授权 r表示刷新 n表示特么的不知道是什么鬼  其余非法
            AcotMethod acotMethod = new AcotMethod();

            //静默授权处理方式

            if (method.equals("o")) {    //当授权方式为静默授权时
                Account account = accountService.getEntityByStr(acotMethod.GetOpenidByCode(code), "getAccByOid");//获取用户信息
                if (account != null) {
                    int time = (int) (System.currentTimeMillis() - account.getRefreshTime());//计算用户信息的存在时间
                    if (time > WeChatInfo.overtime) { //如果用户信息过期 让用户使用显式授权state状态为r
                        String refUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WeChatInfo.appID + "&redirect_uri=" + WeChatInfo.redirect_uri + "&response_type=code&scope=snsapi_userinfo&state=" + requestPath + "r#wechat_redirect";
                        try {
                            response.sendRedirect(refUrl);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else { //如果用户信息存在且未过期
                        HttpSession session = request.getSession(true);         //获取Session
                        session.setAttribute("openid", account.getOpenid());     //将用户openid写入seeion
                        session.setAttribute("nickName", account.getNickName());
                        session.setAttribute("userId", account.getUserId());
                        session.setAttribute("headimgurl", account.getHeadimgurl());
                        try {
                            response.sendRedirect("." + requestPath);     //用户验证成功跳转
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                } else { //如果用户不存在 则让用户使用显试授权
                    try {//state标记为i状态
                        String InfoUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WeChatInfo.appID + "&redirect_uri=" + WeChatInfo.redirect_uri + "&response_type=code&scope=snsapi_userinfo&state=" + requestPath + "i#wechat_redirect";
                        response.sendRedirect(InfoUrl);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            } else


            //显式授权处理方式


            { //当授权方式为显式时


                System.out.println("已经调用显示授权方式");
                Account account = acotMethod.GetUsrInfoByCode(code);
                if (method.equals("i")) {

                    //表示用户第一次授权 直接写入数据库
                    account.setUserId(CreatID.getUserID()); //生成用户id
                    try {
                        accountService.insert(account, "CreateNewAccount");//把新数据写入数据库
                        //写入用户头像至图片服务器
                        acotMethod.PersistenceImg("headimg", account.getUserId() + "", account.getHeadimgurl());
                    } catch (Exception e) {
                        System.out.println("========用户信息持久化过程出现异常，已捕获==========");
                        e.printStackTrace();
                        System.out.println("首次获取用户信息失败===原因未知 尝试继续完成登入操作");
                    }

                } else
                //此时为超期授权
                {
                    if (method.equals("r")) {
                        accountService.update(account, "updateAcc");//更新数据库
                        //更新用户头像至图片服务器
                        acotMethod.PersistenceImg("headimg", account.getUserId() + "", account.getHeadimgurl());
                    }
                }

                HttpSession session = request.getSession(true);         //获取Session
                session.setAttribute("openid", account.getOpenid());     //将用户openid写入seeion
                session.setAttribute("nickName", account.getNickName());
                session.setAttribute("userId", account.getUserId());
                session.setAttribute("headimgurl", account.getHeadimgurl());
                try {
                    response.sendRedirect("." + requestPath);     //用户验证成功跳转
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {     //code为空时 ||授权失败时
            try {
                if (state != null && state != "") {    //判断state是否非法
                    response.sendRedirect("./activity/error.jsp?requestPath=" + state);    //处理用户拒绝授权
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 通过ajax获取微信签名的方法
     *
     * @param request
     * @param response
     */
    @RequestMapping("getSignature")
    public void getSignature(HttpServletRequest request, HttpServletResponse response) {
        //======================处理微信签名============================
        System.out.println("开始签名");
        String url = request.getParameter("url");
        String timestamp = Long.toString(System.currentTimeMillis() / 1000);
        String nonceStr = UUID.randomUUID().toString().substring(0, 30);
        String jsapi_ticket = WxConfig.ticket;

        String string1 = "jsapi_ticket=" + jsapi_ticket +
                "&noncestr=" + nonceStr +
                "&timestamp=" + timestamp +
                "&url=" + url;

        String signature = DigestUtils.sha1Hex(string1);
//        System.out.println("==================我是ajax" + signature);
        Map<String, String> map = new HashMap<String, String>();
        map.put("appId", WeChatInfo.appID);
        map.put("nonceStr", nonceStr);
        map.put("timestamp", timestamp);
        map.put("url", url);
        map.put("signature", signature);
        map.put("jsapi_ticket", WxConfig.ticket);
        String data = JSON.toJSONString(map);
        try {
            PrintWriter out = response.getWriter();
            out.print(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
//            ===========================================================
    }


}
