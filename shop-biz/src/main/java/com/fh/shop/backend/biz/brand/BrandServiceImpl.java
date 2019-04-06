/**
 * <pre>项目名称:shop-admin
 * 文件名称:BrandServiceImpl.java
 * 包名:com.fh.shop.backend.biz.brand
 * 创建日期:2018年12月26日下午11:33:01
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.biz.brand;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fh.shop.backend.base.BaseService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.util.CacheManager;
import com.fh.shop.backend.util.DateUtils;
import com.fh.shop.backend.vo.BrandVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fh.shop.backend.mapper.brand.IBrandMapper;
import com.fh.shop.backend.po.brand.Brand;

/**
 * <pre>项目名称：shop-admin
 * 类名称：BrandServiceImpl
 * 类描述：
 * 创建人：杨乾隆 710245665@qq.com
 * 创建时间：2018年12月26日 下午11:33:01
 * 修改人：杨乾隆 710245665@qq.com
 * 修改时间：2018年12月26日 下午11:33:01
 * 修改备注：
 * @version </pre>
 */
@Service
public class BrandServiceImpl extends BaseService implements IBrandService {

    @Autowired
    private IBrandMapper brandMapper;

    @Override
    public Long findPageCount(Brand brand) {
        Long findPageCount = brandMapper.findPageCount(brand);
        return findPageCount;
    }

    @Override
    public List<Brand> findBrand(Brand brand) {
        List<Brand> findBrand = brandMapper.findBrand(brand);
        for (Brand brandInfo : findBrand) {
            brandInfo.setEntryTimeStr(DateUtils.resultStrDate(brandInfo.getEntryTime(), DateUtils.Y_M_D_H_M_S));
            brandInfo.setUpdateTimeStr(DateUtils.resultStrDate(brandInfo.getUpdateTime(), DateUtils.Y_M_D_H_M_S));
        }
        return findBrand;
    }

    @Override
    public void addBrand(Brand brand) {
        brand.setEntryTime(new Date());
        brand.setUpdateTime(new Date());
        brandMapper.addBrand(brand);
        CacheManager.getInstance().remove(BREAN_LIST);
    }

    @Override
    public void deleteBrand(Integer id) {
        brandMapper.deleteBrand(id);
        CacheManager.getInstance().remove(BREAN_LIST);
    }

    @Override
    public Brand toUpdate(Integer id) {
        Brand brand = brandMapper.toUpdate(id);
        return brand;
    }

    @Override
    public void update(Brand brand) {
        brand.setUpdateTime(new Date());
        brandMapper.update(brand);
        CacheManager.getInstance().remove(BREAN_LIST);
    }

    @Override
    public void deleteIds(String ids) {
        List<Integer> listIds = resultList(ids);
        if(listIds.size()>0){
            brandMapper.deleteIds(listIds);
            CacheManager.getInstance().remove(BREAN_LIST);
        }
    }

    @Override
    public List<BrandVo> findBrandList() {
        CacheManager instance = CacheManager.getInstance();
        Object brandList = instance.getObj(BREAN_LIST);
        if(brandList !=null ){
            return (List<BrandVo>) brandList;
        }
        List<Brand> findBrandList = brandMapper.findBrandList();
        List<BrandVo> BrandVoList = new ArrayList<>();
        for (Brand brandInfo : findBrandList) {
            BrandVo brandVo = new BrandVo();
            brandVo.setId(brandInfo.getId());
            brandVo.setBrandName(brandInfo.getBrandName());
            brandVo.setUpdateTime(brandInfo.getUpdateTime());
            brandVo.setEntryTime(brandInfo.getEntryTime());
            BrandVoList.add(brandVo);
        }
        instance.putObj(BREAN_LIST,BrandVoList);
        return BrandVoList;
    }

    @Override
    public DataTableResponse findBrandDataTable(Brand brand) {
        Long pageList = brandMapper.findPageCount(brand);
        List<BrandVo> BrandVoList = wrapperBrandVo(brand);
        DataTableResponse resultResponse = DataTableResponse.resultResponse(brand.getDraw(), pageList, pageList, BrandVoList);
        return resultResponse;
    }

    private List<BrandVo> wrapperBrandVo(Brand brand) {
        List<Brand> brandList = brandMapper.findBrand(brand);
        List<BrandVo> BrandVoList = new ArrayList<>();
        for (Brand brandInfo : brandList) {
            BrandVo brandVo = new BrandVo();
            brandVo.setId(brandInfo.getId());
            brandVo.setBrandName(brandInfo.getBrandName());
            brandVo.setUpdateTime(brandInfo.getUpdateTime());
            brandVo.setEntryTime(brandInfo.getEntryTime());
            BrandVoList.add(brandVo);
        }
        return BrandVoList;
    }
}
