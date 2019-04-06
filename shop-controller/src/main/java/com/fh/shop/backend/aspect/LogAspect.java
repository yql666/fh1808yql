/**
 * <pre>项目名称:shop-admin-yql
 * 文件名称:LogAspect.java
 * 包名:com.fh.shop.backend.aspect
 * 创建日期:2019年1月21日下午12:18:43
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.aspect;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.util.SystemContent;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.fh.shop.backend.biz.log.ILogService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.log.Log;

/**
 * <pre>项目名称：shop-admin-yql    
 * 类名称：LogAspect    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月21日 下午12:18:43    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月21日 下午12:18:43    
 * 修改备注：       
 * @version </pre>    
 */
public class LogAspect {

    @Resource
    private ILogService logService;
    @Resource
    private HttpServletRequest request;
    private static final Logger LOG = LoggerFactory.getLogger(LogAspect.class);

    public Object doLog(ProceedingJoinPoint pjp) {
        Object result = null;
        Log logInfo = null;
        //获取对应访问的类名
        String className = pjp.getTarget().getClass().getName();
        //获取对应访问的方法名
        String methodName = pjp.getSignature().getName();
        //获取方法返回值类型
        MethodSignature ms = (MethodSignature) pjp.getSignature();
        String methodValue = "";
        if (ms.getMethod().isAnnotationPresent(LogAnnotation.class)) {
            methodValue = ms.getMethod().getAnnotation(LogAnnotation.class).value();
        }
        try {
            long start = System.currentTimeMillis();
            result = pjp.proceed();
            long end = System.currentTimeMillis();
            logInfo = MyUtil.logInfo("进入" + className + "执行" + methodName + "成功", SystemContent.STATUS_SUCCESS, request, end - start, methodValue);
            if (logInfo != null && !logInfo.getUserName().isEmpty()) {
                LOG.info("{}进入{}执行{}()方法:成功", logInfo.getUserName(), className, methodName);
            }
        } catch (Throwable e) {
            //将错误信息详细打印在控制台
            e.printStackTrace();
            logInfo = MyUtil.logInfo("进入" + className + "执行" + methodName + "失败:" + e.getMessage(), SystemContent.STATUS_ERROR, request, SystemContent.USETIME_ERROR, methodValue);
            LOG.error("{}进入{}执行{}()方法:失败:{}", logInfo.getUserName(), className, methodName, e.getMessage());
            logService.addLog(logInfo);
            if (ms.getReturnType().getSimpleName().equalsIgnoreCase("string")) {
                return "/error";
            }
            return ServerResponse.error();
        }
        if (logInfo != null) {
            logService.addLog(logInfo);
        }
        return result;
    }


}
