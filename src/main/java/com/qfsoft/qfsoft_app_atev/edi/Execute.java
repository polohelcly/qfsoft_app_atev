package com.qfsoft.qfsoft_app_atev.edi;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.qfsoft.qfsoft_app_atev.main.MainApi;
import com.qfsoft.qfsoft_app_atev.main.MainCase;
import com.qfsoft.qfsoft_app_atev.main.MainFun;
import com.qfsoft.qfsoft_app_atev.main.MainTask;
import com.qfsoft.qfsoft_app_atev.util.ProjectCache;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import qfsoft.library.common.method.DealException;

@RestController
@RequestMapping(value = "/execute")
public class Execute {

    @ApiOperation(value = "执行任务", notes = "执行任务")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "run_type", value = "运行类型", paramType = "query", required = false, dataType = "String", defaultValue = "serial")})
    @RequestMapping(value = "/task", method = {RequestMethod.POST, RequestMethod.GET})
    public String executeTask(@RequestParam(required = false, defaultValue = "serial") String run_type) {
        try {
            if (ProjectCache.running_task_flag == true) {
                JSONObject error = new JSONObject();
                error.put("code", 1);
                error.put("message", "已有测试任务正在执行...");
                return error.toString();
            }
            String[] args = new String[]{run_type};
            MainTask.main(args);
            JSONObject data = new JSONObject();
            data.put("code", 0);
            data.put("message", "测试任务执行完毕...");
            return data.toString();
        } catch (Exception e) {
            ProjectCache.running_task_flag = false;
            e.printStackTrace();
            JSONObject error = new JSONObject();
            error.put("code", 1);
            error.put("message", "测试任务执行错误：" + DealException.getDetail(e));
            return error.toString();
        }
    }

    @ApiOperation(value = "执行用例", notes = "执行用例")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "module_code", value = "模块编码", paramType = "query", required = true, dataType = "String", defaultValue = "1_01_002"),
            @ApiImplicitParam(name = "test_code", value = "用例编码", paramType = "query", required = true, dataType = "String", defaultValue = "C11001"),
            @ApiImplicitParam(name = "test_type", value = "测试类型", paramType = "query", required = false, dataType = "String", defaultValue = "function"),
            @ApiImplicitParam(name = "run_plugin", value = "执行插件", paramType = "query", required = false, dataType = "String", defaultValue = "java.code"),
            @ApiImplicitParam(name = "last_status", value = "状态", paramType = "query", required = false, dataType = "String", defaultValue = "auto"),
            @ApiImplicitParam(name = "concurrent", value = "并发次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "cycle", value = "循环次数", paramType = "query", required = false, dataType = "int", defaultValue = "1")})
    @RequestMapping(value = "/case", method = {RequestMethod.POST, RequestMethod.GET})
    public String executeCase(@RequestParam String module_code, @RequestParam String test_code,
                              @RequestParam(required = false, defaultValue = "function") String test_type,
                              @RequestParam(required = false, defaultValue = "java.code") String run_plugin,
                              @RequestParam(required = false, defaultValue = "auto") String last_status, @RequestParam(required = false, defaultValue = "1") int concurrent,
                              @RequestParam(required = false, defaultValue = "1") int cycle) {
        try {
            if (ProjectCache.running_case_flag == true) {
                JSONObject error = new JSONObject();
                error.put("code", 1);
                error.put("message", "已有测试用例正在执行...");
                return error.toString();
            }
            String[] args = new String[]{module_code, test_code, test_type, run_plugin, last_status, String.valueOf(concurrent), String.valueOf(cycle)};
            MainCase.main(args);
            JSONObject data = new JSONObject();
            data.put("code", 0);
            data.put("message", "测试用例执行完毕...");
            return data.toString();
        } catch (Exception e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            JSONObject error = new JSONObject();
            error.put("code", 1);
            error.put("message", "测试用例执行错误：" + DealException.getDetail(e));
            return error.toString();
        }
    }

    @ApiOperation(value = "执行功能", notes = "执行功能")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "module_code", value = "模块编码", paramType = "query", required = true, dataType = "String", defaultValue = "1_02_001"),
            @ApiImplicitParam(name = "test_code", value = "功能编码", paramType = "query", required = true, dataType = "String", defaultValue = "F11001"),
            @ApiImplicitParam(name = "test_type", value = "测试类型", paramType = "query", required = false, dataType = "String", defaultValue = "function"),
            @ApiImplicitParam(name = "run_plugin", value = "执行插件", paramType = "query", required = false, dataType = "String", defaultValue = "java.code"),
            @ApiImplicitParam(name = "last_status", value = "状态", paramType = "query", required = false, dataType = "String", defaultValue = "auto"),
            @ApiImplicitParam(name = "concurrent", value = "并发次数", paramType = "query", required = false, dataType = "String", defaultValue = "1"),
            @ApiImplicitParam(name = "cycle", value = "循环次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "params", value = "请求参数", paramType = "query", required = true, dataType = "int", defaultValue = "{}")})
    @RequestMapping(value = "/fun", method = {RequestMethod.POST, RequestMethod.GET})
    public String executeFun(@RequestParam String module_code, @RequestParam String test_code,
                             @RequestParam(required = false, defaultValue = "function") String test_type,
                             @RequestParam(required = false, defaultValue = "java.code") String run_plugin,
                             @RequestParam(required = false, defaultValue = "auto") String last_status, @RequestParam(required = false, defaultValue = "1") int concurrent,
                             @RequestParam(required = false, defaultValue = "1") int cycle, @RequestParam String params) {
        try {
            if (ProjectCache.running_case_flag == true) {
                JSONObject error = new JSONObject();
                error.put("code", 1);
                error.put("message", "已有测试功能正在执行...");
                return error.toString();
            }
            String[] args = new String[]{module_code, test_code, test_type, run_plugin, last_status, String.valueOf(concurrent), String.valueOf(cycle),
                    params};
            JSONArray results = MainFun.main(args);
            JSONObject data = new JSONObject();
            data.put("code", 0);
            data.put("message", "测试功能执行完毕...");
            data.put("result", results);
            return data.toString();
        } catch (Exception e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            JSONObject error = new JSONObject();
            error.put("code", 1);
            error.put("message", "测试功能执行错误：" + DealException.getDetail(e));
            return error.toString();
        }
    }

    @ApiOperation(value = "执行接口", notes = "执行接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "module_code", value = "模块编码", paramType = "query", required = true, dataType = "String", defaultValue = "1_02_001"),
            @ApiImplicitParam(name = "test_code", value = "接口编码", paramType = "query", required = true, dataType = "String", defaultValue = "A11001"),
            @ApiImplicitParam(name = "test_type", value = "测试类型", paramType = "query", required = false, dataType = "String", defaultValue = "function"),
            @ApiImplicitParam(name = "run_plugin", value = "执行插件", paramType = "query", required = false, dataType = "String", defaultValue = "java.code"),
            @ApiImplicitParam(name = "last_status", value = "状态", paramType = "query", required = false, dataType = "String", defaultValue = "auto"),
            @ApiImplicitParam(name = "concurrent", value = "并发次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "cycle", value = "循环次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "params", value = "请求参数", paramType = "query", required = true, dataType = "String", defaultValue = "{\"header\":{},\"data_path\":{},\"data_param\":{},\"data_body\":{}}")})
    @RequestMapping(value = "/api", method = {RequestMethod.POST, RequestMethod.GET})
    public String executeApi(@RequestParam String module_code, @RequestParam String test_code,
                             @RequestParam(required = false, defaultValue = "function") String test_type,
                             @RequestParam(required = false, defaultValue = "java.code") String run_plugin,
                             @RequestParam(required = false, defaultValue = "auto") String last_status, @RequestParam(required = false, defaultValue = "1") int concurrent,
                             @RequestParam(required = false, defaultValue = "1") int cycle, @RequestParam String params) {
        try {
            if (ProjectCache.running_case_flag == true) {
                JSONObject error = new JSONObject();
                error.put("code", 1);
                error.put("message", "已有测试接口正在执行...");
                return error.toString();
            }
            String[] args = new String[]{module_code, test_code, test_type, run_plugin, last_status, String.valueOf(concurrent), String.valueOf(cycle),
                    params};
            JSONArray results = MainApi.main(args);
            JSONObject data = new JSONObject();
            data.put("code", 0);
            data.put("message", "测试接口执行完毕...");
            data.put("result", results);
            return data.toString();
        } catch (Exception e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            JSONObject error = new JSONObject();
            error.put("code", 1);
            error.put("message", "测试接口执行错误：" + DealException.getDetail(e));
            return error.toString();
        }
    }

}