/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:IBrandMapper.java 
 * 包名:com.fh.shop.backend.mapper.brand 
 * 创建日期:2018年12月26日下午11:35:05 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.brand;

import java.util.List;

import com.fh.shop.backend.po.brand.Brand;

/** 
 * <pre>项目名称：shop-admin    
 * 类名称：IBrandMapper    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2018年12月26日 下午11:35:05    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2018年12月26日 下午11:35:05    
 * 修改备注：       
 * @version </pre>    
 */
public interface IBrandMapper {

	/** <pre>findPageCount(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月26日 下午11:35:53    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月26日 下午11:35:53    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>    
	 */
	Long findPageCount(Brand brand);

	/** <pre>findBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月26日 下午11:40:08    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月26日 下午11:40:08    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>    
	 */
	List<Brand> findBrand(Brand brand);

	/** <pre>addBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 上午9:11:36    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 上午9:11:36    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	void addBrand(Brand brand);

	/** <pre>deleteBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 上午11:06:37    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 上午11:06:37    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	void deleteBrand(Integer id);

	/** <pre>toUpdate(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 上午11:25:43    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 上午11:25:43    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	Brand toUpdate(Integer id);

	/** <pre>update(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 上午11:53:50    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 上午11:53:50    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	void update(Brand brand);

	/** <pre>deleteIds(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 下午2:27:25    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 下午2:27:25    
	 * 修改备注： 
	 * @param listIds</pre>    
	 */
	void deleteIds(List<Integer> listIds);

	/** <pre>findBrandList(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月29日 上午11:20:59    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月29日 上午11:20:59    
	 * 修改备注： 
	 * @return</pre>    
	 */
	List<Brand> findBrandList();
	
}
