package com.fh.shop.backend.mapper.area;

import com.fh.shop.backend.po.area.Area;

import java.util.List;

public interface IAreaMapper {


    List<Area> findAreaZtree();

    void addArea(Area area);

    void updateArea(Area area);

    void deleteIds(List<Integer> ids);

}
