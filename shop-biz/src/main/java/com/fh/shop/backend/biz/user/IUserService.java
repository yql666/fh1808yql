/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:UserService.java 
 * 包名:com.fh.shop.backend.biz.user 
 * 创建日期:2019年1月7日下午3:56:30 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */
package com.fh.shop.backend.biz.user;

import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.user.User;

import java.util.List;

/**
 * <pre>
 * 项目名称：shop-admin    
 * 类名称：UserService    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月7日 下午3:56:30    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月7日 下午3:56:30    
 * 修改备注：       
 * &#64;version
 * </pre>
 */
public interface IUserService {

	/**
	 * <pre>
	 * findUser(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月7日 下午4:00:53    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月7日 下午4:00:53    
	 * 修改备注： 
	 * &#64;param user
	 * </pre>
	 */
	User findUser(User user);

	/**
	 * <pre>
	 * addUser(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月7日 下午4:54:21    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月7日 下午4:54:21    
	 * 修改备注： 
	 * &#64;param user
	 * </pre>
	 */
	ServerResponse addUser(User user);

	/**
	 * <pre>
	 * findUserName(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月7日 下午4:57:57    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月7日 下午4:57:57    
	 * 修改备注： 
	 * &#64;param user
	 * </pre>
	 */
	ServerResponse findUserName(User user);

    void updateUser(User user);

    void updateUserStatus(User user);

	void updateUserErrorCount(User user);

	void updateUserLogCount(User user);

	void resetStatus(User user);

    void updateErrorLogTime(User user);

	void resetLogCount(User user);

    void deleteUser(Integer id);

	void deleteIds(String ids);

	User toUpdateUser(Integer id);

	void updateUserInfo(User user);

    void addUserDialog(User user);

    void deleteByPids(List<Integer> ids);

	DataTableResponse findUserDateTable(User user);

    void updateUserDept(User user);

	List<User> findDeptList(List<Integer> idArr);
}
