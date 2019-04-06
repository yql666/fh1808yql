package com.fh.shop.backend.controller.area;

import com.fh.shop.backend.biz.area.IAreaService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.area.Area;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/area")
public class AreaController {

    @Resource(name = "areaService")
    private IAreaService areaService;

    @RequestMapping("findAreaZtree")
    public ServerResponse findAreaZtree() {
        List<Area> areaList = areaService.findAreaZtree();
        return ServerResponse.success(areaList);
    }

    @RequestMapping("addArea")
    public ServerResponse addArea(Area area) {
        areaService.addArea(area);
        return ServerResponse.success(area.getId());
    }
    @RequestMapping("updateArea")
    public ServerResponse updateArea(Area area) {
        areaService.updateArea(area);
        return ServerResponse.success();
    }

    @RequestMapping("deleteIds")
    public ServerResponse deleteIds(@RequestParam("ids[]") List<Integer> ids) {
        areaService.deleteIds(ids);
        return ServerResponse.success();
    }


}
