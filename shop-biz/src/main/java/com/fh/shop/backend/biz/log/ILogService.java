/** 
 * <pre>项目名称:shop-admin-yql 
 * 文件名称:LogService.java 
 * 包名:com.fh.shop.backend.biz.log 
 * 创建日期:2019年1月10日下午8:37:32 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.log;

import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.po.log.Log;


import java.util.List;

/** 
 * <pre>项目名称：shop-admin-yql    
 * 类名称：LogService    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月10日 下午8:37:32    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月10日 下午8:37:32    
 * 修改备注：       
 * @version </pre>    
 */
public interface ILogService {

	/** <pre>addLog(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月10日 下午8:41:38    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月10日 下午8:41:38    
	 * 修改备注： 
	 * @param log</pre>    
	 */
	void addLog(Log log);

	DataTableResponse findDataTable(Log log);
}
