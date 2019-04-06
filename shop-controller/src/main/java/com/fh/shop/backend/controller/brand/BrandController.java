/**
 * <pre>项目名称:shop-admin
 * 文件名称:BrandController.java
 * 包名:com.fh.shop.backend.web.controller.brand
 * 创建日期:2018年12月26日下午11:18:20
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.controller.brand;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.base.BaseController;
import com.fh.shop.backend.biz.brand.IBrandService;
import com.fh.shop.backend.biz.product.IProductService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.brand.Brand;
import com.fh.shop.backend.po.product.Product;
import com.fh.shop.backend.util.SystemContent;
import com.fh.shop.backend.vo.BrandVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <pre>
 * 项目名称：shop-admin    
 * 类名称：BrandController    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2018年12月26日 下午11:18:20    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2018年12月26日 下午11:18:20    
 * 修改备注：       
 * &#64;version
 * </pre>
 */
@Controller
@RequestMapping("/brand")
public class BrandController extends BaseController {
    @Resource
    private IBrandService brandService;
    @Resource
    private IProductService productService;

    /**
     * <pre>
     * findBrand(查询方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月27日 上午8:51:09
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月27日 上午8:51:09
     * 修改备注：
     * &#64;param map
     * &#64;param brand
     * &#64;param flag
     * &#64;return
     * </pre>
     */
    @RequestMapping("findBrand")
    @ResponseBody
    public ServerResponse findBrand(Brand brand,
                                       HttpServletRequest request
    ) {
        resultBrand(brand,request);
        DataTableResponse result=brandService.findBrandDataTable(brand);
        return ServerResponse.success(result);
    }

    private void resultBrand(Brand brand, HttpServletRequest request) {
        String column = request.getParameter(SystemContent.MAP_ORDER_COLUMN);
        if(column!=null){
            String property = request.getParameter(getStateKey(column));
            String sort = request.getParameter(SystemContent.MAP_ORDER_DIR);
            brand.setProperty(property);
            brand.setSort(sort);
        }
        brand.setStartPos(brand.getStart());
        brand.setPageSize(brand.getLength());
    }

    /**
     * <pre>
     * findBrandList(查询所有品牌后展示前台)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2019年1月9日 下午8:11:09
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2019年1月9日 下午8:11:09
     * 修改备注：
     * &#64;return
     * </pre>
     */
    @RequestMapping("findBrandList")
    public @ResponseBody
    ServerResponse findBrandList() {
        List<BrandVo> BrandVoList = brandService.findBrandList();
        return ServerResponse.success(BrandVoList);
    }

    /**
     * <pre>
     * buildDate(将字符串时间类型转换为Date)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2019年1月2日 下午7:23:10
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2019年1月2日 下午7:23:10
     * 修改备注：
     * &#64;param brand
     * </pre>
     */

    /**
     * <pre>
     * toAdd(跳转到Jsp页面)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月27日 上午9:04:56
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月27日 上午9:04:56
     * 修改备注：
     * &#64;return
     * </pre>
     */
    @RequestMapping("toAdd")
    public String toAdd() {
        return "/brand/addBrand";
    }

    @RequestMapping("toBrand")
    public String toBrand() {
        return "/brand/brandList";
    }

    /**
     * <pre>
     * addBreand(增加方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月27日 上午8:53:33
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月27日 上午8:53:33
     * 修改备注：
     * &#64;return
     * </pre>
     */
    @RequestMapping("addBrand")
    @LogAnnotation("增加方法")
    public String addBrand(Brand brand) {
        brandService.addBrand(brand);
        return "redirect:/brand/toBrand.jhtml";
    }

    /**
     * <pre>
     * deleteBrand(删除方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月27日 上午11:14:29
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月27日 上午11:14:29
     * 修改备注：
     * &#64;param id
     * </pre>
     */
    @RequestMapping("deleteBrand")
    @ResponseBody
    @LogAnnotation("删除方法")
    public ServerResponse deleteBrand(Integer id, HttpServletResponse resp) {
        Product product = productService.findBrandId(id);
        if (product != null) {
            return ServerResponse.error("清楚相关信息后才能删除");
        }
        brandService.deleteBrand(id);
        return ServerResponse.success();
    }

    /**
     * <pre>
     * toUpdate(回显方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月27日 下午2:15:38
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月27日 下午2:15:38
     * 修改备注：
     * &#64;param id
     * &#64;param map
     * &#64;return
     * </pre>
     */
    @RequestMapping("toUpdate")
    public String toUpdate(Integer id, ModelMap map) {
        Brand brand = brandService.toUpdate(id);
        map.put("brand", brand);
        return "/brand/update";
    }

    /**
     * <pre>
     * updateBrand(修改方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月27日 下午2:16:02
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月27日 下午2:16:02
     * 修改备注：
     * &#64;param brand
     * &#64;return
     * </pre>
     */
    @RequestMapping("updateBrand")
    @LogAnnotation("修改方法")
    public String updateBrand(Brand brand) {
        brandService.update(brand);
        return "redirect:/brand/findBrand.jhtml";
    }

    /**
     * <pre>
     * deleteIds(批量删除)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月27日 下午3:16:55
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月27日 下午3:16:55
     * 修改备注：
     * &#64;param ids
     * </pre>
     */
    @RequestMapping("deleteIds")
    @ResponseBody
    @LogAnnotation("批量删除方法")
    public ServerResponse deleteIds(String ids) {
        brandService.deleteIds(ids);
        return ServerResponse.success();
    }
}
