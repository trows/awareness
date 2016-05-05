package com.awareness.trows.util.filter;

import com.awareness.trows.util.wechatSDK.entity.WeChatInfo;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

/**
 * 登入拦截器极其token的添加
 * 微信登入拦截器  默认静默授权
 * 显式授权在控制器中实现
 */

@WebFilter(filterName = "loginFilter", urlPatterns ={"*.jsp","*.do"},
        initParams = {
//                @WebInitParam(name = "loginPage",value = "/login.jsp"),
                @WebInitParam(name = "errorPage",value = "/error.jsp"),
                @WebInitParam(name = "registerAction" ,value="/getUsrInfo.do"),
                @WebInitParam(name = "registerPage",value = "/register.jsp"),
                @WebInitParam(name = "encoding",value = "UTF-8")
        },
        dispatcherTypes = {
                DispatcherType.FORWARD,
                DispatcherType.INCLUDE,
                DispatcherType.REQUEST,
                DispatcherType.ERROR, DispatcherType.ASYNC
        }
)
public class LoginFilter implements Filter {
    private FilterConfig config;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String errorPage = config.getInitParameter("errorPage");
        String registerPage = config.getInitParameter("registerPage");
//        String loginAction = config.getInitParameter("loginAction");
        String registerAction = config.getInitParameter("registerAction");

        String encoding = config.getInitParameter("encoding");
        servletRequest.setCharacterEncoding(encoding);

        HttpSession session = request.getSession(true);
      //设置token
        if (session.getAttribute("token")==null){
            String token =UUID.randomUUID().toString();
            session.setAttribute("token",token);
        }
      //===============================================
//       String  Goto = (String) session.getAttribute("Goto");
        String requestPath = request.getServletPath();  //拦截器 拦截路径 除去根目录的路径 /-1/27/getActivityById.do
                                                        // activity/myActivity.jsp
        if (session.getAttribute("openid")==null
               // && !requestPath.endsWith(loginPage)
                && !requestPath.endsWith(registerPage)
                && !requestPath.endsWith(errorPage)
                && !requestPath.endsWith(registerAction)
                ){
            String BaseUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WeChatInfo.appID+"&redirect_uri="+ WeChatInfo.redirect_uri+"&response_type=code&scope=snsapi_base&state="+requestPath+"o#wechat_redirect";
            //此URL为需要用户授权
//            session.setAttribute("opendId","oJZicwtURO78JTmkjOIw7OtaSL0s");
//            session.setAttribute("userId", "86514596435011");
//            session.setAttribute("nickName", "测试号");
//            session.setAttribute("userType", "1");
//            filterChain.doFilter(servletRequest,servletResponse);   //放行
            response.sendRedirect(BaseUrl);                                            //跳转至微信授权页面
        }else {
            filterChain.doFilter(servletRequest,servletResponse);   //放行
        }
}

    public void destroy() {
        config=null;
    }
}
