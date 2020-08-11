package com.qfsoft.qfsoft_app_atev.edi;

import io.swagger.annotations.ApiOperation;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/")
public class Index {

    @ApiOperation(value = "框架", notes = "主页")
    @RequestMapping(value = "/index", method = {RequestMethod.GET})
    public String get_index() {
        JSONObject data = new JSONObject();
        data.put("code", "0");
        data.put("message", "系统运行正常！");
        return data.toString();
    }

}