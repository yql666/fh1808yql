package com.fh.shop.backend.brand;

import com.fh.shop.backend.biz.brand.IBrandService;
import com.fh.shop.backend.po.brand.Brand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-biz.xml"})
public class TestBrand extends AbstractJUnit4SpringContextTests {

    @Resource
    private IBrandService brandService;

    @Test
    public void selectBrand(){
        Brand brand = new Brand();
        brand.setBrandName("真草了");
       brandService.addBrand(brand);

    }
}
