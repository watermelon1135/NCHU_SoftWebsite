package com.nchu.software.manager.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName LoginInterceptor
 * @Description: 登录拦截器 用于拦截
 * @Author: watermelon
 * @CreateDate: 2019/1/11 21:35
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/11 21:35
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws IOException {
        //Object user =
        Object administrator = request.getSession().getAttribute("administrator");
        if (administrator == null){
            response.sendRedirect("/404");
            return false;
        }
        return true;
    }
}
