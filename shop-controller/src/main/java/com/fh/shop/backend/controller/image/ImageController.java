/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:ProductController.java 
 * 包名:com.fh.shop.backend.web.controller.product
 * 创建日期:2018年12月23日下午5:36:36 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */
package com.fh.shop.backend.controller.image;

import com.fh.shop.backend.biz.image.IImageService;
import com.fh.shop.backend.po.image.Image;
import com.fh.shop.backend.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller // controller注解相当于Spring中的bean
@RequestMapping("/image")
public class ImageController {


	@Resource
	private IImageService imageService;

	@RequestMapping("findImg")
	public String findImg(ModelMap map,Integer id) {
		List<Image> imgList = imageService.findImgList(id);
		map.put("imgList",imgList);
			return "/image/imageList";
		}

	@RequestMapping("downloadFile")
	public void downloadFile(HttpServletRequest request,HttpServletResponse response, String fileName) {
		FileUtil.downloadFile(request,response,fileName);
	}
}

