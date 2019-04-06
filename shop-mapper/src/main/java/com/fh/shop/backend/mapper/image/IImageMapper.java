/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:IBrandMapper.java 
 * 包名:com.fh.shop.backend.mapper.brand 
 * 创建日期:2018年12月26日下午11:35:05 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.image;


import com.fh.shop.backend.po.image.Image;
import com.fh.shop.backend.po.product.Product;

import java.util.List;

public interface IImageMapper {

	List<Image> findImgList(Integer id);

	void deleteImgIds(List<Integer> ids);

    void addBatchImage(List<Image> imgFileList);
}
