package com.fh.shop.backend.controller.log;
import com.fh.shop.backend.biz.log.ILogService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/log")
public class LogController {
    @Resource
    private ILogService logService;

    @RequestMapping("findLog")
    @ResponseBody
    public ServerResponse findLog(Log log) {
        DataTableResponse result = logService.findDataTable(log);
        return ServerResponse.success(result);
    }

    @RequestMapping("toLog")
    public String toLog() {
        return "/log/logList";
    }

}
