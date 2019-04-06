/**
 * <pre>项目名称:shop-admin
 * 文件名称:Interceptors.java
 * 包名:com.fh.shop.backend.interceptor
 * 创建日期:2019年1月7日下午8:06:31
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fh.shop.backend.util.CookieUtil;
import com.fh.shop.backend.util.RedisUtil;
import com.fh.shop.backend.util.SystemContent;
import com.google.gson.Gson;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fh.shop.backend.po.user.User;

/**
 * <pre>项目名称：shop-admin    
 * 类名称：Interceptors    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月7日 下午8:06:31    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月7日 下午8:06:31    
 * 修改备注：       
 * @version </pre>    
 */
public class Interceptor implements HandlerInterceptor {

    /* (non-Javadoc)
     * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
     */
    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {

    }

    /* (non-Javadoc)
     * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
     */
    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {

    }

    /* (non-Javadoc)
     * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        HttpSession session = request.getSession();
        //User user=(User)session.getAttribute(SystemContent.LOG_USER);
        //从cookie中获取对应的value
        String fh_id = CookieUtil.requestCookie(request, SystemContent.COOKIE_KEY);
        //判断为空直接返回登录页面
        if(StringUtils.isEmpty(fh_id)){
            response.sendRedirect(request.getContextPath() + SystemContent.USER_LOGIN);
            return false;
        }
        //根据cookie对应的value获取指定的用户信息
        String user = RedisUtil.get(SystemContent.USER_KEY + fh_id);
        //session续命
        RedisUtil.expire(SystemContent.USER_KEY+fh_id,30*60);
        //转换数据放入session中显示前台
        Gson gson = new Gson();
        User userInfo = gson.fromJson(user, User.class);
        session.setAttribute(SystemContent.LOG_USER,userInfo);
        if (StringUtils.isEmpty(user)) {
            /*request.getRequestDispatcher(request.getContextPath()+"/login.jsp").forward(request, response);*/
            response.sendRedirect(request.getContextPath() + SystemContent.USER_LOGIN);
            return false;
        }
        return true;
    }

}
