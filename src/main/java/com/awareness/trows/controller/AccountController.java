package com.awareness.trows.controller;

import com.awareness.trows.entity.Account;
import com.awareness.trows.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by Throws_exception on 2015/6/1.
 */
@Controller

public class AccountController {
    @Autowired
    private AccountService accountService;
    @RequestMapping("/get")
    public String getAccountByAccessToken(HttpServletRequest request) {
        Account account = new Account();
        account.setAccessToken("trows_ant");
        account = accountService.getEntityByValue(account, "getAccountByAccessToken");
        System.out.println(account);
        System.out.println("我尼玛");
        request.setAttribute("account",account);
        return "/activity/test";

    }

    /**
     * 添加用户
     * 并没有写完
     * @param request
     * @return
     */
    @RequestMapping("/addAccount")
    public void addAccount(HttpServletRequest request){
        Account account = new Account();
        String username = request.getParameter("username");
        UUID uuid = UUID.randomUUID();
        String accessToken = uuid.toString().substring(0,10);
        account.setAccessToken(accessToken);
        account.setUserName(username);
        accountService.insert(account, "addAccount");
    }

    @RequestMapping("/login")
    public void login(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Account account = new Account();
        String accessToken = request.getParameter("accessToken");

        account.setAccessToken(accessToken);
        account =  accountService.getEntityByValue(account,"getAccountByAccessToken");
        if ( account!=null && account.getAccessToken().equals(accessToken)){
            HttpSession session = request.getSession(true);
            String Goto = (String) session.getAttribute("Goto");


            session.setAttribute("userId", account.getUserId());
            session.setAttribute("nickName", account.getNickName());
            session.setAttribute("userType",account.getUserType());
            if(Goto==null ||Goto.equals("/activity/login.jsp")){
                request.getRequestDispatcher("./activity/welcome.jsp").forward(request,response);   //因为不确定转发的是命令还是
                                                                                                    //故使用转发而非框架返回
            }else {
                session.removeAttribute("Goto");
                request.getRequestDispatcher(Goto).forward(request,response);
            }
        }else {

            request.getRequestDispatcher("./activity/login.jsp").forward(request,response);
        }


    }

    @RequestMapping("/{userId}/getUserInfo")
    public String getUserInfo(@PathVariable long userId, HttpServletRequest request){

        Account account = accountService.getEntityByKey(userId,"getUserInfo");

        request.setAttribute("account",account);
        return "/shareJoy/userHomePage";
    }






}
