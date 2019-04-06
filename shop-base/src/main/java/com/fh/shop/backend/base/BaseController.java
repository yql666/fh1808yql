package com.fh.shop.backend.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.formula.functions.T;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

public class BaseController {


			protected static String   getStateKey(String column){
				return "columns[" + column + "][data]";
			}
		protected  static  String getRealPath(HttpServletRequest request){
			String realPath = request.getServletContext().getRealPath("");
			return realPath;
		}

		protected  static FileInfo  returnFileInfo(MultipartFile  multipartFile){
			FileInfo fileInfo = new FileInfo();
			try {
				if(!multipartFile.getOriginalFilename().isEmpty()){
					fileInfo.setIs(multipartFile.getInputStream());
					fileInfo.setFileName(multipartFile.getOriginalFilename());
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return fileInfo;
		}

		protected static List<FileInfo>  returnFileList(MultipartFile[]  multipartFile){
			List<FileInfo> fileInfo = new ArrayList<>();
			for (MultipartFile fileName : multipartFile) {
				if(!fileName.getOriginalFilename().isEmpty()){
					fileInfo.add(returnFileInfo(fileName));
				}
			}
			return fileInfo;
		}



	/**
	 * <pre>outJson(response回响前台)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月26日 下午6:31:37    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月26日 下午6:31:37    
	 * 修改备注： 
	 * @param
	 * @param response</pre>
	 */
	public static void outJson(Object obj, HttpServletResponse response) {
		// 设置返回格式 和编码
		response.setContentType("appliaction/json");
		response.setCharacterEncoding("utf-8");
		//提取出来用来关流
		PrintWriter writer = null;
		try {
			 // 获取writer 编写数据
			 writer = response.getWriter();
			 // 将传入的对象转换为字符串
			 String json = JSONObject.fromObject(obj).toString();
			 //将数据传送至前台响应前台页面AJAX
			 writer.write(json);
			 //刷新页面
			 writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//关流
			if (null != writer) {
				writer.close();
				writer = null;
			}
		}
	}
	/**
	 * <pre>ajaxOutSuccess(将字符串转换为json对象响应前台jsp)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月9日 下午2:50:29    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月9日 下午2:50:29    
	 * 修改备注： 
	 * @param tips
	 * @param resp</pre>
	 */
	public static void ajaxOutSuccess(String tips,HttpServletResponse resp){
		String jsonStr = "{\"success\":true,\"tips\":\""+tips+"\"}";
		outJson(jsonStr,resp);
	}
	
	/**
	 * <pre>outJson(传入List数组转换传入前台)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2019年1月9日 下午2:06:13    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2019年1月9日 下午2:06:13    
	 * 修改备注： 
	 * @param list
	 * @param response</pre>
	 */
	public static void outJson(List<T> list, HttpServletResponse response) {
		// 设置返回格式 和编码
		response.setContentType("appliaction/json");
		response.setCharacterEncoding("utf-8");
		//提取出来用来关流
		PrintWriter writer = null;
		try {
			 // 获取writer 编写数据
			 writer = response.getWriter();
			 // 将传入的对象转换为字符串
			 String json = JSONArray.fromObject(list).toString();
			 //将数据传送至前台响应前台页面AJAX
			 writer.write(json);
			 //刷新页面
			 writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//关流
			if (null != writer) {
				writer.close();
				writer = null;
			}
		}
	}
}
