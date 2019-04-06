/** 
 * <pre>项目名称:shop-admin-yql 
 * 文件名称:ILogMapper.java 
 * 包名:com.fh.shop.backend.mapper.log 
 * 创建日期:2019年1月10日下午8:39:52 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.log;

import com.fh.shop.backend.po.log.Log;
import com.fh.shop.backend.po.user.User;

import java.util.List;

/** 
 * <pre>项目名称：shop-admin-yql    
 * 类名称：ILogMapper    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月10日 下午8:39:52    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月10日 下午8:39:52    
 * 修改备注：       
 * @version </pre>    
 */
public interface ILogMapper {

	/** <pre>addLog(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月10日 下午8:43:42    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月10日 下午8:43:42    
	 * 修改备注： 
	 * @param log</pre>    
	 */
	void addLog(Log log);


    long findPageCount(Log log);

	List<Log> findLogList(Log log);

}
