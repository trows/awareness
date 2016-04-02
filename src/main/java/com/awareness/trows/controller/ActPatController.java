package com.awareness.trows.controller;

import com.alibaba.fastjson.JSON;
import com.awareness.trows.entity.ActPat;
import com.awareness.trows.entity.Relation;
import com.awareness.trows.service.ActPatService;
import com.awareness.trows.service.ActivityService;
import com.awareness.trows.service.RelationService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Throws_exception on 2015/6/15.
 */
@Controller
public class ActPatController {
    @Autowired
    private ActPatService actPatService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private RelationService relationService;

    /**
     * 加入活动
     * @param request
     * @return
     */
    //参与活动方法  (已使用)
    @RequestMapping("/joinAct")
    public void joinActivity(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        String id = request.getParameter("actId");
        String patName = (String) session.getAttribute("nickName");
        String pageToken = request.getParameter("pageToken");
        String actMaStr = request.getParameter("actMaster");
        String token = (String)session.getAttribute("token");
        if (!token.equals(pageToken)) return;   //校验令牌信息

        if(id!=null){
            long actId = Long.parseLong(id);
            long userId = (Long) session.getAttribute("userId");
            ActPat actPat = new ActPat();
            actPat.setActivityId(actId); //注入活动id
            actPat.setParticipator(userId);   //注入参与者信息
            actPat.setPatName(patName);//注入用户名

            actPatService.insert(actPat, "joinActivity");//持久化参与信息

            try {
                PrintWriter out = response.getWriter();
                out.print("ok");
            } catch (IOException e) {
                e.printStackTrace();
            }
            //===============持久化用户关系数据======================================
            Relation relation = new Relation();
            System.out.println(actMaStr);
            relation.setFriendId(userId);
            relation.setMasterId(Long.parseLong(actMaStr));
            relationService.update(relation, "increaseRel");
            //===================================================
            activityService.updateByKey(actId,"updateJoinNum"); //增加参与人数
        }
    }

    /**
     * 通过 活动id 获取 参与活动信息（完成）
     * @param request
     * @param response
     */
    @RequestMapping("/getJoinInfo")
    public void getJoinInfo(HttpServletRequest request,HttpServletResponse response){

        int pageSize = Integer.parseInt(request.getParameter("pageSize"));   //获取分页大小

        Long actId = Long.parseLong(request.getParameter("actId")); //获得活动id
        int pageNow = Integer.parseInt(request.getParameter("pageNow")); //获得活动id

        PageHelper.startPage(pageNow, pageSize);
        List<ActPat> list = actPatService.getListByKey(actId, "getJoinInfo");
        String data = JSON.toJSONString(list);

        try {
            PrintWriter out = response.getWriter();
            out.print(data);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 判断用户是否参与过这个活动（完成）
     * @param request
     * @param response
     */
    @RequestMapping("/joinCheck")
    public void joinCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String id = request.getParameter("actId");
        if (id!=null){
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            long userId = (Long) session.getAttribute("userId");

            ActPat actPat = new ActPat();
            actPat.setActivityId(Long.parseLong(id));
            actPat.setParticipator(userId);
            Long resId = actPatService.getKeyByValue(actPat, "joinCheck");
            if (resId!=null){
                    out.print("true");
            }else {
                out.print("false");
            }
        }
    }


}
