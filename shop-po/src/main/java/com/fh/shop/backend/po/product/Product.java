/** 
 			* <pre>项目名称:shop-admin 
 * 文件名称:Product.java 
 * 包名:com.fh.shop.backend.po.product 
 * 创建日期:2018年12月23日下午5:30:46 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */
package com.fh.shop.backend.po.product;

import java.io.Serializable;
import java.util.Date;

import com.fh.shop.backend.po.dept.Department;
import org.springframework.format.annotation.DateTimeFormat;

import com.fh.shop.backend.po.Page;
import com.fh.shop.backend.po.brand.Brand;

/**
 * <pre>
 * 项目名称：shop-admin    
 * 类名称：Product    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2018年12月23日 下午5:30:46    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2018年12月23日 下午5:30:46    
 * 修改备注：       
 * &#64;version
 * </pre>
 */
public class Product extends Page implements Serializable {

	private static final long serialVersionUID = 5235205967303238958L;
	private Integer id;
	//产品名称
	private String productName;
	//产品价格
	private Float productPrice;
	//产品图片
	private String productPath;
	private String oldPath;
	//录入时间
	private Date insertTime;
	//修改时间
	private Date updateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date minInsertTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date maxInsertTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH")
	private Date minUpdateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH")
	private Date maxUpdateTime;
	private Float minPrice;
	private Float maxPrice;
	private Brand brand=new Brand();

	private String ids;

	private String paths;

	private String imgPaths;

	public String getOldPath() {
		return oldPath;
	}

	public void setOldPath(String oldPath) {
		this.oldPath = oldPath;
	}

	public String getPaths() {
		return paths;
	}

	public void setPaths(String paths) {
		this.paths = paths;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getImgPaths() {
		return imgPaths;
	}

	public void setImgPaths(String imgPaths) {
		this.imgPaths = imgPaths;
	}

	public String getProductPath() {
		return productPath;
	}
	public void setProductPath(String productPath) {
		this.productPath = productPath;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Float getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Float productPrice) {
		this.productPrice = productPrice;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getMinInsertTime() {
		return minInsertTime;
	}
	public void setMinInsertTime(Date minInsertTime) {
		this.minInsertTime = minInsertTime;
	}
	public Date getMaxInsertTime() {
		return maxInsertTime;
	}
	public void setMaxInsertTime(Date maxInsertTime) {
		this.maxInsertTime = maxInsertTime;
	}

	public Date getMinUpdateTime() {
		return minUpdateTime;
	}
	public void setMinUpdateTime(Date minUpdateTime) {
		this.minUpdateTime = minUpdateTime;
	}
	public Date getMaxUpdateTime() {
		return maxUpdateTime;
	}
	public void setMaxUpdateTime(Date maxUpdateTime) {
		this.maxUpdateTime = maxUpdateTime;
	}
	public Float getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Float minPrice) {
		this.minPrice = minPrice;
	}
	public Float getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Float maxPrice) {
		this.maxPrice = maxPrice;
	}
	
	

}
