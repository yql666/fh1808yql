/** 
 * <pre>项目名称:shop-admin-yql 
 * 文件名称:Log.java 
 * 包名:com.fh.shop.backend.po.log 
 * 创建日期:2019年1月10日下午8:23:06 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.po.log;


import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fh.shop.backend.po.Page;




/** 
 * <pre>项目名称：shop-admin-yql    
 * 类名称：Log    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月10日 下午8:23:06    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月10日 下午8:23:06    
 * 修改备注：       
 * @version </pre>    
 */
public class Log extends Page implements Serializable{
	private static final long serialVersionUID = 2523295824526208752L;
	private Long id;
	private String userName; //用户名
	private String info; //做了什么事：执行了哪个类的哪个方法
	private  Integer status; //1:成功，0:失败
	private  Date createTime; //(创建时间)
	private  String createTimeStr; //(创建时间)
	private  Long useTime; //(花了多长时间) 单位：毫秒]
	private String ipAdd;

	private String content;

	public String getCreateTimeStr() {
		return createTimeStr;
	}

	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date minCreateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date maxCreateTime;
	private Long minUseTime;
	private Long maxUseTime;

	public Date getMinCreateTime() {
		return minCreateTime;
	}

	public void setMinCreateTime(Date minCreateTime) {
		this.minCreateTime = minCreateTime;
	}

	public Date getMaxCreateTime() {
		return maxCreateTime;
	}

	public void setMaxCreateTime(Date maxCreateTime) {
		this.maxCreateTime = maxCreateTime;
	}

	public Long getMinUseTime() {
		return minUseTime;
	}

	public void setMinUseTime(Long minUseTime) {
		this.minUseTime = minUseTime;
	}

	public Long getMaxUseTime() {
		return maxUseTime;
	}

	public void setMaxUseTime(Long maxUseTime) {
		this.maxUseTime = maxUseTime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getUseTime() {
		return useTime;
	}

	public void setUseTime(Long useTime) {
		this.useTime = useTime;
	}

	public String getIpAdd() {
		return ipAdd;
	}

	public void setIpAdd(String ipAdd) {
		this.ipAdd = ipAdd;
	}
}
