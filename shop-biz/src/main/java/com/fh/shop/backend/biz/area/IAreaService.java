package com.fh.shop.backend.biz.area;

import com.fh.shop.backend.po.area.Area;

import java.util.List;

public interface IAreaService {


    List<Area> findAreaZtree();

    void addArea(Area area);


    void updateArea(Area area);

    void deleteIds(List<Integer> ids);

}
