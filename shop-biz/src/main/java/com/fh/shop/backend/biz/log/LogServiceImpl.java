/** 
 * <pre>项目名称:shop-admin-yql 
 * 文件名称:LogServiceImpl.java 
 * 包名:com.fh.shop.backend.biz.log 
 * 创建日期:2019年1月10日下午8:37:54 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.log;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.util.DateUtils;
import com.fh.shop.backend.vo.LogVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fh.shop.backend.mapper.log.ILogMapper;
import com.fh.shop.backend.po.log.Log;

import java.util.ArrayList;
import java.util.List;

import static com.alibaba.dubbo.common.utils.DubboAppender.logList;

/** 
 * <pre>项目名称：shop-admin-yql    
 * 类名称：LogServiceImpl    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月10日 下午8:37:54    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月10日 下午8:37:54    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class LogServiceImpl implements ILogService{
		@Autowired
		private ILogMapper logMapper;

		@Override
		public void addLog(Log log) {
			logMapper.addLog(log);
		}

	@Override
	public DataTableResponse findDataTable(Log log) {
		long pageCount = logMapper.findPageCount(log);
		List<LogVo> logVoList = findLogList(log);
		DataTableResponse result = DataTableResponse.resultResponse(log.getDraw(), pageCount, pageCount, logVoList);
		return result;
	}

		public List<LogVo> findLogList(Log log) {
			List<Log> logList = logMapper.findLogList(log);
			List<LogVo> logVoList =new ArrayList<>();
			for (Log logInfo : logList) {
				LogVo logVo=new LogVo();
				logVo.setId(logInfo.getId());
				logVo.setUserName(logInfo.getUserName());
				logVo.setUseTime(logInfo.getUseTime());
				logVo.setInfo(logInfo.getInfo());
				logVo.setIpAdd(logInfo.getIpAdd());
				logVo.setStatus(logInfo.getStatus());
				logVo.setContent(logInfo.getContent());
				logVo.setCreateTimeStr(DateUtils.resultStrDate(logInfo.getCreateTime(),DateUtils.Y_M_D_H_M_S));
				logVoList.add(logVo);
			}
			return logVoList;
		}


}
