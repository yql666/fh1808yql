/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:Brand.java 
 * 包名:com.fh.shop.backend.po.brand 
 * 创建日期:2018年12月26日下午11:14:25 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.po.brand;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fh.shop.backend.po.Page;

/** 
 * <pre>项目名称：shop-admin    
 * 类名称：Brand    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2018年12月26日 下午11:14:25    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2018年12月26日 下午11:14:25    
 * 修改备注：       
 * @version </pre>    
 */
public class Brand extends Page implements Serializable{
	
	private static final long serialVersionUID = 4185201583467478089L;
	private Integer id;
	private String  brandName;
	private Date entryTime;
	private String entryTimeStr;
	private Date updateTime;
	private String updateTimeStr;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date minentryTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date maxentryTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date minupdateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date maxupdateTime;
	private String minentry;
	private String maxentry;
	private String minupdate;
	private String maxupdate;

	public String getEntryTimeStr() {
		return entryTimeStr;
	}

	public void setEntryTimeStr(String entryTimeStr) {
		this.entryTimeStr = entryTimeStr;
	}

	public String getUpdateTimeStr() {
		return updateTimeStr;
	}

	public void setUpdateTimeStr(String updateTimeStr) {
		this.updateTimeStr = updateTimeStr;
	}

	public String getMinentry() {
		return minentry;
	}
	public void setMinentry(String minentry) {
		this.minentry = minentry;
	}
	public String getMaxentry() {
		return maxentry;
	}
	public void setMaxentry(String maxentry) {
		this.maxentry = maxentry;
	}
	public String getMinupdate() {
		return minupdate;
	}
	public void setMinupdate(String minupdate) {
		this.minupdate = minupdate;
	}
	public String getMaxupdate() {
		return maxupdate;
	}
	public void setMaxupdate(String maxupdate) {
		this.maxupdate = maxupdate;
	}
	public Date getMinentryTime() {
		return minentryTime;
	}
	public void setMinentryTime(Date minentryTime) {
		this.minentryTime = minentryTime;
	}
	public Date getMaxentryTime() {
		return maxentryTime;
	}
	public void setMaxentryTime(Date maxentryTime) {
		this.maxentryTime = maxentryTime;
	}
	public Date getMinupdateTime() {
		return minupdateTime;
	}
	public void setMinupdateTime(Date minupdateTime) {
		this.minupdateTime = minupdateTime;
	}
	public Date getMaxupdateTime() {
		return maxupdateTime;
	}
	public void setMaxupdateTime(Date maxupdateTime) {
		this.maxupdateTime = maxupdateTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public Date getEntryTime() {
		return entryTime;
	}
	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	

}
