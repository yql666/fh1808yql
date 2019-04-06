
package com.fh.shop.backend.mapper.product;
import java.util.List;
import com.fh.shop.backend.po.product.Product;

/** 
 * <pre>项目名称：shop-admin    
 * 类名称：IProductDao    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2018年12月23日 下午5:41:40    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2018年12月23日 下午5:41:40    
 * 修改备注：       
 * @version </pre>    
 */
public interface IProductMapper {
	
	public void addProduct(Product product);

	/** <pre>findProduct(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月24日 下午7:31:16    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月24日 下午7:31:16    
	 * 修改备注： 
	 * @return</pre>    
	 */
	 List<Product> findProduct(Product product);

	/** <pre>deleteProduct(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月24日 下午7:43:53    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月24日 下午7:43:53    
	 * 修改备注： 
	 * @param
	 */
	 void deleteProduct(Integer id);

	/** <pre>toProduct(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月24日 下午7:55:51    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月24日 下午7:55:51    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	public Product toProduct(Integer id);

	/** <pre>update(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月24日 下午8:30:34    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月24日 下午8:30:34    
	 * 修改备注： 
	 * @param product</pre>    
	 */
	public void update(Product product);

	/** <pre>deleteIds(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月25日 下午5:08:41    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月25日 下午5:08:41    
	 * 修改备注： 
	 * @param list</pre>    
	 */
	public void deleteIds(List<Integer> list);

	/** <pre>findPageListCount(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月26日 下午1:28:35    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月26日 下午1:28:35    
	 * 修改备注： 
	 * @param product
	 * @return</pre>    
	 */
	 Long findPageCount(Product product);

	/** <pre>findBrandId(这里用一句话描述这个方法的作用)   
	 * 创建人：杨乾隆 710245665@qq.com    
	 * 创建时间：2018年12月29日 下午2:07:30    
	 * 修改人：杨乾隆 710245665@qq.com     
	 * 修改时间：2018年12月29日 下午2:07:30    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */

	public Product findBrandId(Integer id);

    List<Product> findProductList(Product product);

    List<Product> findProductApi();

}
