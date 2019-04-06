/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:IBrandService.java 
 * 包名:com.fh.shop.backend.biz.brand 
 * 创建日期:2018年12月26日下午11:20:23 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.brand;

import java.util.List;

import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.po.brand.Brand;
import com.fh.shop.backend.vo.BrandVo;

/** 
 * <pre>项目名称：shop-admin    
 * 类名称：IBrandService    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2018年12月26日 下午11:20:23    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2018年12月26日 下午11:20:23    
 * 修改备注：       
 * @version </pre>    
 */
public interface IBrandService {

	/** <pre>findPageCount(这里用一句话描述这个方法的作用)
	 * 创建人：杨乾隆 710245665@qq.com
	 * 创建时间：2018年12月26日 下午11:31:16
	 * 修改人：杨乾隆 710245665@qq.com
	 * 修改时间：2018年12月26日 下午11:31:16
	 * 修改备注：
	 * @param brand
	 * @return</pre>
	 */
	Long findPageCount(Brand brand);

	/** <pre>findBrand(这里用一句话描述这个方法的作用)
	 * 创建人：杨乾隆 710245665@qq.com
	 * 创建时间：2018年12月26日 下午11:39:19
	 * 修改人：杨乾隆 710245665@qq.com
	 * 修改时间：2018年12月26日 下午11:39:19
	 * 修改备注：
	 * @param brand
	 * @return</pre>
	 */
	List<Brand> findBrand(Brand brand);

	/** <pre>addBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 上午9:10:09    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 上午9:10:09    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	void addBrand(Brand brand);

	/** <pre>deleteBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 上午10:33:03    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 上午10:33:03    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	void deleteBrand(Integer id);

	/** <pre>toUpdate(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 上午11:24:55    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 上午11:24:55    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	Brand toUpdate(Integer id);

	/** <pre>update(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 上午11:53:00    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 上午11:53:00    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	void update(Brand brand);

	/** <pre>deleteIds(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月27日 下午2:19:55    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月27日 下午2:19:55    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	void deleteIds(String ids);

	/** <pre>findBrandList(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月29日 上午11:20:26    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月29日 上午11:20:26    
	 * 修改备注： 
	 * @return</pre>    
	 */
	List<BrandVo> findBrandList();

	 DataTableResponse findBrandDataTable(Brand brand);
}
