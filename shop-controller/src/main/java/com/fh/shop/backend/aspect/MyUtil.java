package com.fh.shop.backend.aspect;


import com.fh.shop.backend.po.log.Log;
import com.fh.shop.backend.po.user.User;
import com.fh.shop.backend.util.SystemContent;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

public class MyUtil {
	public static Log logInfo(String info, Integer status, HttpServletRequest request, long  useTime, String content){
		User userInfo = (User)request.getSession().getAttribute(SystemContent.LOG_USER);
		if(userInfo==null){
			return null;
		}
		Log logInfo =new Log();
		logInfo.setCreateTime(new Date());
		logInfo.setUserName(userInfo.getUserName());
		logInfo.setInfo(info);
		logInfo.setStatus(status);
		logInfo.setIpAdd(request.getRemoteAddr());
		logInfo.setUseTime(useTime);
		logInfo.setContent(content);
		return logInfo;
	}

}
