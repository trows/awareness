package com.awareness.trows.controller;

import com.alibaba.fastjson.JSON;
import com.awareness.trows.entity.Activity;
import com.awareness.trows.entity.ActPat;
import com.awareness.trows.entity.Relation;
import com.awareness.trows.service.ActPatService;
import com.awareness.trows.service.ActivityService;
import com.awareness.trows.service.RelationService;
import com.awareness.trows.util.youbandUtil.CreatID;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import sun.misc.BASE64Decoder;

/**
 * 活动信息控制器  处理活动信息的curd
 */

@Controller
public class ActivityController {
    @Autowired
    private ActivityService activityService;    //活动信息持久化服务
    @Autowired
    private ActPatService actPatService;    //活动参与持久服务
    @Autowired
    private RelationService relationService;


    /**
     * 通过页面表单信息添加活动 （持久化）
     *
     * @param request
     * @return
     */
    @RequestMapping("/addActivity")
    public String addActivity(HttpServletRequest request) {
        HttpSession session = request.getSession(true);

        //防止页面后退重复提交
        String token = (String) session.getAttribute("token");  //获取当前系统令牌
        String pageToken = request.getParameter("pageToken");   //获取页面令牌
        //=======================================
        if (pageToken.equals(token)) {  //令牌验证成功
            String actType = null; //活动类型
            try {
                actType = new String(new BASE64Decoder().decodeBuffer(request.getParameter("actType")), "UTF-8");
            } catch (IOException e) {
                e.printStackTrace();
            }
            String activityTitle = request.getParameter("actName");     //活动标题--
            String startTime = request.getParameter("startTime");   //开始时间--
            int personNumber = Integer.parseInt(request.getParameter("actNum").trim());//活动人数--
//            int shareDepth = Integer.parseInt(request.getParameter("shareDepth"));//分享深度**
            long userId = (Long) session.getAttribute("userId");//通过session获取当前用户的id--
            String userName = (String) session.getAttribute("nickName");
            long activityId = CreatID.getActID(userId); //创建活动id

            //=================获取数据的分割线=========================
            Activity activity = new Activity(); //创建活动对象
            activity.setActivityTitle(activityTitle);   //注入活动信息
            activity.setActivityId(activityId);
            activity.setStartTime(startTime);

            activity.setPersonNumber(personNumber);
            activity.setShareDepth(1);//&&  控制分享深度
            activity.setUserId(userId);
            activity.setTypeName(actType);
            activity.setUserName(userName);
            activity.setJoinNow(1);

            //========================活动注入完毕==========================================
            activityService.insert(activity, "addActivity"); //持久化

            //新建活动参与对象
            ActPat actPat = new ActPat();
            actPat.setActivityId(activityId); //注入活动id
            actPat.setParticipator(userId);   //注入参与者信息
            actPat.setPatName(userName);//注入用户名

            actPatService.insert(actPat, "joinActivity");//持久化参与信息

            //=======================持久化完成 页面跳转处理================================

            activity.setUserName(userName);    //获取发起者用户名

            request.setAttribute("act", activity);     //把存好的活动对象放入request
            request.setAttribute("shareNow", -1);   //向request中存入当前分享层级

            session.removeAttribute("token");//提交成功移除token

            return "/shareJoy/activityDetail";  //活动发表  持久化成功 带参数跳转至活动详情页面
        } else {
            request.setAttribute("repeat", true);   //token检查出错跳转至欢迎页面
            return "/shareJoy/activityCircle";
        }

    }

    /**
     * 通过活动ID获取活动详细信息及已报名人员
     *
     * @param shareNow
     * @param activityId
     * @param request
     */
    @RequestMapping("/{shareNow}/{activityId}/{preUser}/getActivityById")
    public String showActivityDetailById(@PathVariable int shareNow, @PathVariable long activityId, @PathVariable long preUser, HttpServletRequest request) {
        //获得单个活动的详细信息

        Activity activity = activityService.getEntityByKey(activityId, "getActivityById");
        if (activity == null) return "/shareJoy/index";  //如果活动不存在  则跳转至个人主页

        String[] remarkList = activity.getRemark().split(";");
        int size = remarkList.length;
        if (size > 1) {
            StringBuilder st = new StringBuilder();
            st.append("<hr>");
            for (int i = size - 1; i > size - 6 && i > 0; i--) {
                st.append(remarkList[i]);
            }
            activity.setRemark(st.toString());
        } else {
            activity.setRemark("");
        }
        HttpSession session = request.getSession(true);
        request.setAttribute("act", activity);
        request.setAttribute("shareNow", shareNow);
        Relation relation = new Relation();


        //========持久化用户关系数据===================暂时关闭
        long userId = (Long) session.getAttribute("userId");
        if (preUser != userId) {
            relation.setMasterId(preUser);
            relation.setFriendId(userId);
            relation.setHot(1);
            relationService.insert(relation, "addRelation");
        }
        //==========================================
        return "/shareJoy/activityDetail";
    }

    /**
     * 通过用户ID获取用户自身发布的活动的列表
     *
     * @param request
     * @return
     */
    @RequestMapping("/{userId}/getAUserActList")
    public String getActivityList(@PathVariable long userId, HttpServletRequest request) {
        List<Activity> activityList = activityService.getListByKey(userId, "getAUserActList");
        request.setAttribute("activityList", activityList);
        return "/togmob/myAct";
    }

    /**
     * 通过用户ID获取用户参与的活动信息列表
     *
     * @param request
     * @return
     */
    @RequestMapping("/getMyJoinActivityListByUserId")
    public void getMyJoinActivityListByUserId(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        int pageNow = Integer.parseInt(request.getParameter("pageNow"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String uid = request.getParameter("userId");
        long userId;
        if (uid == null || "".equals(uid)) {
            userId = (Long) session.getAttribute("userId");

        } else {
            userId = Long.parseLong(uid);
            System.out.println("userId");
        }


        PageHelper.startPage(pageNow, pageSize); //设定分页信息
        List<Activity> activityList = activityService.getListByKey(userId, "getMyJoinActivityListByUserId");//查询数据库
        if (activityList != null) {

            String jsonStr = JSON.toJSONString(activityList);
            System.out.println(jsonStr);
            response.setCharacterEncoding("UTF-8");
            try {
                PrintWriter out = response.getWriter();
                out.print(jsonStr);     //向客户端返回数据
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 删除活动（未使用）
     *
     * @param request
     */
    @RequestMapping("delActivity")
    public void delActivity(HttpServletRequest request, HttpServletResponse response) {
        activityService.deleteByKey(Long.parseLong(request.getParameter("activityId")), "delActivity");

        try {
            request.getRequestDispatcher("./getActivityListByUserId.do").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 修改活动（未完成）
     *
     * @param request
     * @return
     */

    @RequestMapping("alterAct")
    public String alterAct(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        //防止页面后退重复提交
        String token = (String) session.getAttribute("token");  //获取当前系统令牌
        String pageToken = request.getParameter("pageToken");   //获取页面令牌
        //=======================================
        if (pageToken.equals(token)) {  //令牌验证成功

            Long actId = Long.parseLong(request.getParameter("actId"));
            int perNum = Integer.parseInt(request.getParameter("perNum").trim());
            String location = request.getParameter("location");
            String desc = request.getParameter("desc");
            String startTime = request.getParameter("startTime");
            String remark = request.getParameter("remark");

//        System.out.println(actId+perNum+location+desc+startTime+remark+"hahahahahah");

            Activity act = new Activity();
            act.setPersonNumber(perNum);
            act.setLocation(location);
            act.setDescription(desc);
            act.setStartTime(startTime);
            act.setRemark(remark);
            act.setActivityId(actId);
            activityService.update(act, "alterAct");

            Activity activity = activityService.getEntityByKey(actId, "getActivityById");
            if (activity == null) return "/shareJoy/activityCircle";  //如果活动不存在  则跳转至个人主页

            String[] remarkList = activity.getRemark().split(";");
            int size = remarkList.length;
            if (size > 1) {
                StringBuilder st = new StringBuilder();
                st.append("<hr>");
                for (int i = size - 1; i > size - 6 && i > 0; i--) {
                    st.append(remarkList[i]);
                }
                activity.setRemark(st.toString());
            } else {
                activity.setRemark("");
            }

            request.setAttribute("act", activity);
            session.removeAttribute("token");//提交成功移除token
        }
        return "/shareJoy/activityDetail";
    }


}



