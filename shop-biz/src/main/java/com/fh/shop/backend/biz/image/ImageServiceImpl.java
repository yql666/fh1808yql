/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:ProductServiceImpl.java 
 * 包名:com.fh.shop.backend.biz.product 
 * 创建日期:2018年12月23日下午5:40:00 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.image;

import com.fh.shop.backend.mapper.image.IImageMapper;
import com.fh.shop.backend.po.image.Image;
import com.fh.shop.backend.util.FileUtil;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/** 
 * <pre>项目名称：shop-admin    
 * 类名称：ProductServiceImpl    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2018年12月23日 下午5:40:00    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2018年12月23日 下午5:40:00    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class ImageServiceImpl implements IImageService{

	@Resource
	private IImageMapper imageMapper;

	@Override
	public List<Image> findImgList(Integer id) {
		return imageMapper.findImgList(id);
	}

	public void delImgPath(Integer id,String realPath) {
		List<Image> imgList = imageMapper.findImgList(id);
		List<Integer>  idsList=new ArrayList<>();
		if(imgList.size()>0){
			for (Image image : imgList) {
				FileUtil.delFilePath(realPath+image.getImgPath());
				idsList.add(image.getId());
			}
		}
		imageMapper.deleteImgIds(idsList);
	}
}
