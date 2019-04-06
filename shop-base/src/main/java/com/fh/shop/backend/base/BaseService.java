package com.fh.shop.backend.base;

import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BaseService implements Serializable {


    protected static final  String  DEPT_LIST= "deptList";

    protected static final  String  PRODUCT_LIST= "productList";

    protected static final  String  BREAN_LIST= "brandList";

    protected static final  String  AREA_LIST= "areaList";

    protected static String   getStateKey(String column){
        return "columns[" + column + "][data]";
    }


    protected static List<Integer>   resultList(String  ids){
        List<Integer>  idsList=new ArrayList<>();
        if(StringUtils.isNotEmpty(ids)){
            String[] idArr = ids.split(",");
            for (String id : idArr) {
                idsList.add(Integer.valueOf(id));
            }
        }
        return idsList;
    }

}
