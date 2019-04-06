package com.fh.shop.backend.biz.area;

import com.fh.shop.backend.base.BaseService;
import com.fh.shop.backend.mapper.area.IAreaMapper;
import com.fh.shop.backend.po.area.Area;
import com.fh.shop.backend.util.RedisUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("areaService")
public class AreaServiceImpl extends BaseService implements IAreaService {

    @Autowired
    private IAreaMapper areaMapper;

    @Override
    public List<Area> findAreaZtree() {
        Gson gson = new Gson();
        String result = RedisUtil.get(AREA_LIST);
        if(StringUtils.isNotEmpty(result)){
            List<Area> areaList = gson.fromJson(result, new TypeToken<List<Area>>() {
            }.getType());
            return areaList;
        }
        List<Area> area = areaMapper.findAreaZtree();
        String toJson = gson.toJson(area);
        RedisUtil.set(AREA_LIST,toJson);
        return area;
    }

    @Override
    public void addArea(Area area) {
        areaMapper.addArea(area);
        RedisUtil.del(AREA_LIST);
    }

    @Override
    public void updateArea(Area area) {
        areaMapper.updateArea(area);
        RedisUtil.del(AREA_LIST);
    }

    @Override
    public void deleteIds(List<Integer> ids) {
        areaMapper.deleteIds(ids);
        RedisUtil.del(AREA_LIST);
    }
}
