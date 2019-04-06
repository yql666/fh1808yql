package com.fh.shop.backend.biz.product;

import com.fh.shop.backend.base.BaseService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.mapper.image.IImageMapper;
import com.fh.shop.backend.mapper.product.IProductMapper;
import com.fh.shop.backend.po.image.Image;
import com.fh.shop.backend.po.product.Product;
import com.fh.shop.backend.util.*;
import com.fh.shop.backend.vo.ProductVo;
import com.google.gson.Gson;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

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
//<bean id="productServiceImpl" class="com.fh.shop.backend.biz.product.ProductServiceImpl">
//</bean>
//@Service("productService")//service注解相当于spring中的Bean给上参数相当于BeanId
@Service
public class ProductServiceImpl extends BaseService implements IProductService {

    /* (non-Javadoc)
     * @see com.fh.shop.backend.biz.product.IProductService#addProduct(com.fh.shop.backend.po.product.Product)
     */

    @Resource
    private IProductMapper productMapper;

    @Resource
    private IImageMapper imageMapper;


    public DataTableResponse findDataTable(Product product,
                                           Map<String, String[]> resMap) {
        //将前台传入的数据转换后返回给Product
        resultProduct(product, resMap);
        //查询每页条数
        Long pageListCount = productMapper.findPageCount(product);
        //将product包装成productVo
        List<ProductVo> productVoList = wrapperProduct(product);
        //将查询出来的数据转换成DataTable格式
        DataTableResponse result = DataTableResponse.resultResponse(product.getDraw(), pageListCount, pageListCount, productVoList);
        return result;
    }
    private List<ProductVo> wrapperProduct(Product product) {
        List<Product> productList = productMapper.findProduct(product);
        List<ProductVo> productVoList = new ArrayList<>();
        for (Product productInfo : productList) {
            ProductVo productVo = new ProductVo();
            productVo.setId(productInfo.getId());
            productVo.setProductName(productInfo.getProductName());
            productVo.setProductPrice(productInfo.getProductPrice());
            productVo.setProductPath(productInfo.getProductPath());
            productVo.setInsertTime(productInfo.getInsertTime());
            productVo.setUpdateTime(productInfo.getUpdateTime());
            productVo.setBrandName(productInfo.getBrand().getBrandName());
            productVoList.add(productVo);
        }
        return productVoList;
    }

    private void resultProduct(Product product, Map<String, String[]> resMap) {
        //将前台传递的参数进行转换
        String newProperty = "";
        Gson gson = new Gson();
        Map map = gson.fromJson(SystemContent.MAP_PRODUCT, Map.class);
        String column = resMap.get(SystemContent.MAP_ORDER_COLUMN)[0];
        if (StringUtils.isNotEmpty(column)) {
            String data = resMap.get(getStateKey(column))[0];
            String dataMap = (String) map.get(data);
            newProperty = StringUtils.isNotEmpty(dataMap) ? dataMap : data;
            String dir = resMap.get(SystemContent.MAP_ORDER_DIR)[0];
            product.setProperty(newProperty);
            product.setSort(dir);
        }
    }


    @Override
    public ServerResponse addProduct(Product product) {
        Date date = new Date();
        product.setInsertTime(date);
        product.setUpdateTime(date);
        //添加商品
        productMapper.addProduct(product);
        if(StringUtils.isNotEmpty(product.getImgPaths())){
            List<Image> imgList=new ArrayList<>();
            String[] img = product.getImgPaths().substring(1).split(",");
            for (String s : img) {
                Image image = new Image();
                image.setImgPath(s);
                image.setProductId(product.getId());
                imgList.add(image);
            }
            imageMapper.addBatchImage(imgList);
        }
        return ServerResponse.success();
    }

    @Override
    public void deleteProduct(Integer id, String realPath) {
        Product product = productMapper.toProduct(id);
        FileUtil.delFilePath(realPath + product.getProductPath());
        productMapper.deleteProduct(id);
    }

    @Override
    public Product toProduct(Integer id) {
        Product product = productMapper.toProduct(id);
        return product;
    }


    public ServerResponse update(Product product) {
        product.setUpdateTime(new Date());
        if(StringUtils.isNotEmpty(product.getProductPath())){
            CosUtil.deleteFile(product.getOldPath());
        }else {
            product.setProductPath(product.getOldPath());
        }
        productMapper.update(product);
        return ServerResponse.success();
    }

    @Override
    public void deleteIds(String ids) {
        List<Integer> idsList = resultList(ids);
        if (idsList.size() > 0) {
            productMapper.deleteIds(idsList);
        }
    }

    @Override
    public Product findBrandId(Integer id) {
        Product product = productMapper.findBrandId(id);
        return product;
    }

    public List<Product> findProductList(Product product) {
        List<Product> productList = productMapper.findProductList(product);
        return productList;
    }
}
