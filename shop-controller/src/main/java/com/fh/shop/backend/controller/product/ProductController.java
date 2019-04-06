/**
 * <pre>项目名称:shop-admin
 * 文件名称:ProductController.java
 * 包名:com.fh.shop.backend.web.controller.product
 * 创建日期:2018年12月23日下午5:36:36
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.controller.product;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.base.BaseController;
import com.fh.shop.backend.biz.brand.IBrandService;
import com.fh.shop.backend.biz.image.IImageService;
import com.fh.shop.backend.biz.product.IProductService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.image.Image;
import com.fh.shop.backend.po.product.Product;
import com.fh.shop.backend.util.FileUtil;
import com.fh.shop.backend.vo.BrandVo;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 * 项目名称：shop-admin
 * 类名称：ProductController
 * 类描述：
 * 创建人：杨乾隆 710245665@qq.com
 * 创建时间：2018年12月23日 下午5:36:36
 * 修改人：杨乾隆 710245665@qq.com
 * 修改时间：2018年12月23日 下午5:36:36
 * 修改备注：
 * &#64;version
 * </pre>
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {

    @Resource
    private IProductService productService;
    @Resource
    private IBrandService brandService;
    @Resource
    private IImageService imageService;


    /**
     * <pre>
     * findProduct(查询产品方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月24日 下午7:52:09
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月24日 下午7:52:09
     * 修改备注：
     * &#64;return
     * </pre>
     */
    @RequestMapping("findProduct")
    @ResponseBody
    // ModelMap相当于一个普通的Map
    // flag 用来判断是否属于ajax请求
    public ServerResponse findProduct(Product product,
                                      HttpServletRequest request
    ) {
        //第一种做法
         /* Map<String, String[]> parameterMap = request.getParameterMap();
        Iterator<String> iterator = parameterMap.keySet().iterator();
        while (iterator.hasNext()) {
            String key = iterator.next();
            if(key.equals("order[0][column]")){
                String strings = parameterMap.get(key)[0];
                    String data = parameterMap.get("columns[" + strings + "][data]")[0];
                    String dataMap = map.get(data);
                    String dir = parameterMap.get("order[0][dir]")[0];
                    newProperty=StringUtils.isNotEmpty(dataMap) ? dataMap : data ;
                    product.setProperty(newProperty);
                    product.setSort(dir);
            }
        }*/
        //获取前台传入的参数
        Map<String, String[]> resMap = request.getParameterMap();
        // 查询dataTable数据
        DataTableResponse result = productService.findDataTable(product, resMap);
        return ServerResponse.success(result);
    }

    @RequestMapping("toArea")
    public String toArea() {
        return "/area/areaList";
    }

    @RequestMapping("toMember")
    public String toMember() {
        return "/member/memberList";
    }

    @RequestMapping("toProductList")
    public String toProductList() {
        return "/product/productList";
    }

    /**
     * <pre>
     * addProduct(增加方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月24日 下午7:53:00
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月24日 下午7:53:00
     * 修改备注：
     * &#64;param product
     * &#64;param requset
     * &#64;param productName
     * &#64;param productPrice
     * &#64;return
     * </pre>
     */
    @RequestMapping("addProduct")
    @LogAnnotation("添加方法")
    @ResponseBody
    public ServerResponse addProduct(Product product) {
        productService.addProduct(product);
        return ServerResponse.success();
    }

    /**
     * <pre>
     * deleteProduct(删除方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月24日 下午7:53:16
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月24日 下午7:53:16
     * 修改备注：
     * &#64;param product
     * &#64;return
     * </pre>
     */
    @RequestMapping("deleteProduct")
    @ResponseBody
    @LogAnnotation("删除方法")
    public ServerResponse deleteProduct(Integer id, HttpServletRequest request) {
        String realPath = getRealPath(request);
        productService.deleteProduct(id, realPath);

        return ServerResponse.success();
    }

    /**
     * <pre>
     * toProduct(回显方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月24日 下午7:53:39
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月24日 下午7:53:39
     * 修改备注：
     * &#64;return
     * </pre>
     */

    @RequestMapping("toProduct")
    @ResponseBody
    public ServerResponse toProduct(Integer id) {
        Product productInfo = productService.toProduct(id);
        return ServerResponse.success(productInfo);
    }

    @RequestMapping("toImage")
    @ResponseBody
    public ServerResponse toImage(Integer id) {
        List<Image> imgList = imageService.findImgList(id);
        return ServerResponse.success(imgList);
    }

    /**
     * <pre>
     * update(修改方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月24日 下午8:35:49
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月24日 下午8:35:49
     * 修改备注：
     * &#64;param product
     * &#64;return
     * </pre>
     */
    @RequestMapping("updateProduct")
    @LogAnnotation("修改方法")
    @ResponseBody
    public ServerResponse update(Product product) {
        return productService.update(product);
    }

    /**
     * <pre>
     * deleteIds(批量删除方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2018年12月25日 下午5:14:56
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2018年12月25日 下午5:14:56
     * 修改备注：
     * &#64;param ids
     * &#64;param resp
     * </pre>
     */
    @RequestMapping("deleteIds")
    @ResponseBody
    @LogAnnotation("批量删除方法")
    public ServerResponse deleteIds(String ids) {
        productService.deleteIds(ids);
        return ServerResponse.success();
    }

    //按条件导出商品Excel
    @RequestMapping("exportExcel")
    public void exportExcel(Product product, HttpServletResponse response) {
        //获取查询到的条件数据
        List<Product> productList = productService.findProductList(product);
        //根据当前查询的数据创建workbook
        XSSFWorkbook workbook = creteWorkBook(productList);
        //调用工具类进行下载
        FileUtil.excelDownload(workbook, response);
    }

    private XSSFWorkbook creteWorkBook(List<Product> productList) {
        //创建workbook
        XSSFWorkbook workbook = new XSSFWorkbook();
        //创建表头
        XSSFSheet createTitle = createTitle(workbook);
        //创建表内容
        createTbody(productList, createTitle, workbook);
        return workbook;
    }

    private void createTbody(List<Product> productList, XSSFSheet sheet, XSSFWorkbook workbook) {
        XSSFCellStyle formatDate = workbook.createCellStyle();
        formatDate.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));
        XSSFCellStyle priceColor = workbook.createCellStyle();
        priceColor.setFillBackgroundColor(IndexedColors.RED.getIndex());
        priceColor.setFillPattern(HSSFCellStyle.ALIGN_FILL);
        int rowId = 11;
        int cellId = 9;
        for (int i = 0; i < productList.size(); i++) {
            Product productInfo = productList.get(i);
            XSSFRow row = sheet.createRow(rowId + i);
            row.createCell(cellId).setCellValue(productInfo.getProductName());
            XSSFCell productPrice = row.createCell(cellId + 1);
            if (productInfo.getProductPrice() < 100) {
                productPrice.setCellStyle(priceColor);
            }
            productPrice.setCellValue(productInfo.getProductPrice());
            row.createCell(cellId + 2).setCellValue(productInfo.getBrand().getBrandName());
            XSSFCell insertTime = row.createCell(cellId + 3);
            insertTime.setCellStyle(formatDate);
            insertTime.setCellValue(productInfo.getInsertTime());
            XSSFCell updateTime = row.createCell(cellId + 4);
            updateTime.setCellStyle(formatDate);
            updateTime.setCellValue(productInfo.getUpdateTime());
        }
    }

    private XSSFSheet createTitle(XSSFWorkbook workbook) {
        XSSFCellStyle titleStyle = createTitleStyle(workbook);
        //合并单元格
        //四个参数firstRow 开始行 lastRow 结束行 firstCol开始列 lastCol结束列
        CellRangeAddress rangeAddress = new CellRangeAddress(4, 9, 9, 13);
        XSSFSheet sheet = workbook.createSheet("产品表");
        XSSFCell titleName = sheet.createRow(4).createCell(9);
        titleName.setCellValue("产品表");
        titleName.setCellStyle(titleStyle);
        sheet.addMergedRegion(rangeAddress);
        createHead(workbook, sheet);
        return sheet;
    }

    private void createHead(XSSFWorkbook workbook, XSSFSheet sheet) {
        XSSFCellStyle headStyle = createHeadStyle(workbook);
        String[] head = {"产品名称", "产品价格", "产品品牌", "创建时间", "修改时间"};
        XSSFRow row = sheet.createRow(10);
        for (int i = 0; i < head.length; i++) {
            XSSFCell cell = row.createCell(9 + i);
            cell.setCellStyle(headStyle);
            cell.setCellValue(head[i]);
        }
    }

    private XSSFCellStyle createHeadStyle(XSSFWorkbook workbook) {
        XSSFFont titleFont = workbook.createFont();
        titleFont.setFontName("黑体");//设置字体名称
        titleFont.setBold(true);//加粗
        XSSFCellStyle headStyle = workbook.createCellStyle();
        headStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);//水平居中
        headStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);// 垂直居中
        headStyle.setFont(titleFont);
        return headStyle;
    }

    private XSSFCellStyle createTitleStyle(XSSFWorkbook workbook) {
        XSSFFont font = workbook.createFont();
        font.setFontName("华文行楷");//设置字体名称
        font.setFontHeightInPoints((short) 28);//设置字号
        font.setColor(HSSFColor.RED.index);//设置字体颜色
        // 声明样式
        XSSFCellStyle syle = workbook.createCellStyle();
        syle.setAlignment(XSSFCellStyle.ALIGN_CENTER);//水平居中
        syle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);// 垂直居中
        syle.setFont(font);
        syle.setFillBackgroundColor(IndexedColors.BLUE.getIndex());
        syle.setFillPattern(HSSFCellStyle.ALIGN_FILL);
        return syle;
    }


    //按条件导出品牌Excel
    @RequestMapping("exportExcelByBrand")
    public void exportExcelByBrand(Product product, HttpServletResponse response) {
        //
        List<BrandVo> brandList = brandService.findBrandList();
        XSSFWorkbook workbook = createBrandWorkBook(product, brandList);
        FileUtil.excelDownload(workbook, response);
    }

    private XSSFWorkbook createBrandWorkBook(Product product, List<BrandVo> brandList) {
        XSSFWorkbook workbook = new XSSFWorkbook();
        //创建titleStyle
        XSSFCellStyle titleStyle = createTitleStyle(workbook);
        //获取当前传入的brandId
        Integer brandId = product.getBrand().getId();
        List<Product> productList = null;
        for (BrandVo brandInfo : brandList) {
            if (brandId == -1) {
                product.getBrand().setId(brandInfo.getId());
                productList = productService.findProductList(product);
            } else {
                if (brandInfo.getId() == product.getBrand().getId()) {
                    productList = productService.findProductList(product);
                } else {
                    productList = new ArrayList<>();
                }
            }
            String sheetName = brandInfo.getBrandName() + "(" + productList.size() + ")";
            XSSFSheet sheet = workbook.createSheet(sheetName);
            mergeCells(titleStyle, sheet);
            createHead(workbook, sheet);
            createBody(workbook, productList, sheet);
        }
        return workbook;
    }

    private void mergeCells(XSSFCellStyle titleStyle, XSSFSheet sheet) {
        //合并单元格
        //四个参数firstRow 开始行 lastRow 结束行 firstCol开始列 lastCol结束列
        CellRangeAddress rangeAddress = new CellRangeAddress(4, 9, 9, 13);
        sheet.addMergedRegion(rangeAddress);
        XSSFCell cell = sheet.createRow(4).createCell(9);
        cell.setCellValue("产品表");
        cell.setCellStyle(titleStyle);
    }

    private void createBody(XSSFWorkbook workbook, List<Product> productList, XSSFSheet sheet) {
        XSSFCellStyle formatDate = workbook.createCellStyle();
        formatDate.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));
        XSSFCellStyle formatDateColor = workbook.createCellStyle();
        formatDateColor.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));
        formatDateColor.setFillBackgroundColor(IndexedColors.RED.getIndex());
        formatDateColor.setFillPattern(HSSFCellStyle.ALIGN_FILL);
        XSSFCellStyle backgroundColor = workbook.createCellStyle();
        backgroundColor.setFillBackgroundColor(IndexedColors.RED.getIndex());
        backgroundColor.setFillPattern(HSSFCellStyle.ALIGN_FILL);
        int rowId = 11;
        int cellId = 9;
        for (int j = 0; j < productList.size(); j++) {
            Product productInfo = productList.get(j);
            XSSFRow row1 = sheet.createRow(rowId + j);
            XSSFCell productName = row1.createCell(cellId);
            productName.setCellValue(productInfo.getProductName());
            XSSFCell productPrice = row1.createCell(cellId + 1);
            productPrice.setCellValue(productInfo.getProductPrice());
            XSSFCell brandName = row1.createCell(cellId + 2);
            brandName.setCellValue(productInfo.getBrand().getBrandName());
            XSSFCell insertTime = row1.createCell(cellId + 3);
            insertTime.setCellValue(productInfo.getInsertTime());
            XSSFCell updateTime = row1.createCell(cellId + 4);
            updateTime.setCellValue(productInfo.getUpdateTime());
            if (productList.get(j).getProductPrice() < 100) {
                productName.setCellStyle(backgroundColor);
                productPrice.setCellStyle(backgroundColor);
                brandName.setCellStyle(backgroundColor);
                insertTime.setCellStyle(formatDateColor);
                updateTime.setCellStyle(formatDateColor);
            } else {
                insertTime.setCellStyle(formatDate);
                updateTime.setCellStyle(formatDate);
            }
        }
    }
}

