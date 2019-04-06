/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:UserMapper.java 
 * 包名:com.fh.shop.backend.mapper.user 
 * 创建日期:2019年1月7日下午3:57:19 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.user;

import com.fh.shop.backend.po.user.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/** 
 * <pre>项目名称：shop-admin    
 * 类名称：UserMapper    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月7日 下午3:57:19    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月7日 下午3:57:19    
 * 修改备注：       
 * @version </pre>    
 */
public interface IUserMapper {

	/** <pre>findUser(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月7日 下午4:02:43    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月7日 下午4:02:43    
	 * 修改备注： 
	 * @return</pre>    
	 */
	User findUser(User user);

	/** <pre>addUser(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月7日 下午4:54:58    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月7日 下午4:54:58    
	 * 修改备注： 
	 * @param user</pre>    
	 */
	void addUser(User user);


    void updateUser(User user);

    void updateUserStatus(User user);

	void updateUserErrorCount(User user);

	void updateUserLogCount(User user);

    void resetStatus(User user);

    void updateErrorLogTime(User user);

	void resetLogCount(User user);

    List<User> findUserList(User user);

    Long findPageCount(User user);

    void deleteUser(Integer id);

	void deleteIds(List<Integer> arrList);

	User toUpdateUser(Integer id);

	void updateUserInfo(User user);

    void addUserDialog(User user);

    void deleteByPids(List<Integer> ids);


	void updateUserDept(User user);

    List<User> findDeptList(List<Integer> idArr);
}
