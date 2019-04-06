/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:IproductService.java 
 * 包名:com.fh.shop.backend.biz.product 
 * 创建日期:2018年12月23日下午5:39:20 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.image;

import com.fh.shop.backend.po.image.Image;

import java.util.List;


public interface IImageService {

	List<Image> findImgList(Integer id);



}
