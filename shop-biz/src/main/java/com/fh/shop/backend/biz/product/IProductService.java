/** 
 * <pre>项目名称:shop-admin 
 * 文件名称:IproductService.java 
 * 包名:com.fh.shop.backend.biz.product 
 * 创建日期:2018年12月23日下午5:39:20 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.product;

import java.util.List;
import java.util.Map;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.product.Product;

/** 
 * <pre>项目名称：shop-admin    
 * 类名称：IproductService    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2018年12月23日 下午5:39:20    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2018年12月23日 下午5:39:20    
 * 修改备注：       
 * @version </pre>    
 */
public interface IProductService {

	/** <pre>addProduct(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月23日 下午5:50:00    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月23日 下午5:50:00    
	 * 修改备注： 
	 * @param product</pre>    
	 */
	ServerResponse addProduct(Product product);

	/** <pre>deleteProduct(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月24日 下午7:42:59    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月24日 下午7:42:59    
	 * 修改备注： 
	 * @param
	 */
	void deleteProduct(Integer id,String realPath);

	/** <pre>toProduct(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月24日 下午7:55:00    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月24日 下午7:55:00    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	Product toProduct(Integer id);

	/** <pre>update(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月24日 下午8:29:55    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月24日 下午8:29:55    
	 * 修改备注： 
	 * @param product</pre>    
	 */
	ServerResponse update(Product product);

	/** <pre>deleteIds(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月25日 下午5:06:26    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月25日 下午5:06:26    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	void deleteIds(String ids);

	/** <pre>findBrandId(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月29日 下午2:06:56    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月29日 下午2:06:56    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	Product findBrandId(Integer id);

    List<Product> findProductList(Product product);

    DataTableResponse findDataTable(Product product, Map<String, String[]> resMap);




}
