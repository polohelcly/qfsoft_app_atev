package com.qfsoft.qfsoft_app_atev.edi;

import com.qfsoft.qfsoft_app_atev.impl.ProjectTaskExec;
import com.qfsoft.qfsoft_app_atev.util.ProjectCache;
import com.qfsoft.qfsoft_app_atev.util.ProjectMethod;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import qfsoft.framework.ate.core.TestAPIExec;
import qfsoft.framework.ate.core.TestFunExec;
import qfsoft.framework.ate.core.testcase.CodeExec;
import qfsoft.framework.ate.core.testcase.ViewExec;
import qfsoft.framework.ate.instance.TaskThread;
import qfsoft.framework.ate.instance.TestExecObject;
import qfsoft.framework.ate.util.FrameworkMethod;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

@RestController
@RequestMapping(value = "/execute")
public class Execute {

    @ApiOperation(value = "执行任务", notes = "执行任务")
    @RequestMapping(value = "/task", method = {RequestMethod.POST, RequestMethod.GET})
    public String execute_task() {
        try {
            JSONObject data = new JSONObject();
            if (ProjectCache.running_task_flag == true) {
                data.put("code", "1");
                data.put("message", "已有测试任务正在执行...");
                return data.toString();
            }
            ProjectCache.running_task_flag = true;
            ProjectTaskExec task = new ProjectTaskExec();
            task.execute();
            ProjectCache.running_task_flag = false;
            data.put("code", "0");
            data.put("message", "测试任务执行完毕...");
            return data.toString();
        } catch (IllegalArgumentException e) {
            ProjectCache.running_task_flag = false;
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            ProjectCache.running_task_flag = false;
            e.printStackTrace();
            return null;
        }
    }

    @ApiOperation(value = "执行用例", notes = "执行用例")
    @ApiImplicitParams({@ApiImplicitParam(name = "product_code", value = "产品编码", paramType = "query", required = true, dataType = "String", defaultValue = "qfsoft_web_prp"),
            @ApiImplicitParam(name = "module_code", value = "模块编码", paramType = "query", required = true, dataType = "String", defaultValue = "1_02_001"),
            @ApiImplicitParam(name = "test_code", value = "用例编码", paramType = "query", required = true, dataType = "String", defaultValue = "C11001"),
            @ApiImplicitParam(name = "test_type", value = "测试类型", paramType = "query", required = false, dataType = "String", defaultValue = "function"),
            @ApiImplicitParam(name = "run_plugin", value = "执行插件", paramType = "query", required = false, dataType = "String", defaultValue = "java.code"),
            @ApiImplicitParam(name = "last_status", value = "状态", paramType = "query", required = false, dataType = "String", defaultValue = "auto"),
            @ApiImplicitParam(name = "concurrent", value = "并发次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "cycle", value = "循环次数", paramType = "query", required = false, dataType = "int", defaultValue = "1")})
    @RequestMapping(value = "/case", method = {RequestMethod.POST, RequestMethod.GET})
    public String execute_case(@RequestParam String product_code, @RequestParam String module_code, @RequestParam String test_code,
                               @RequestParam(required = false, defaultValue = "function") String test_type, @RequestParam(required = false, defaultValue = "java.code") String run_plugin,
                               @RequestParam(required = false, defaultValue = "auto") String last_status, @RequestParam(required = false, defaultValue = "1") int concurrent,
                               @RequestParam(required = false, defaultValue = "1") int cycle) {
        try {
            JSONObject data = new JSONObject();
            if (ProjectCache.running_case_flag == true) {
                data.put("code", "1");
                data.put("message", "已有测试用例正在执行...");
                return data.toString();
            }
            ProjectCache.running_case_flag = true;
            FrameworkMethod.framework_init();
            ProjectMethod.init_param();

            int pos = 0;
            JSONArray results = new JSONArray();
            TestExecObject teo = new TestExecObject(product_code, module_code, test_code, test_type, run_plugin, last_status, concurrent, cycle);
            for (int j = 0; j < teo.concurrent; j++) {
                for (int k = 0; k < teo.cycle; k++) {
                    if (teo.run_plugin.equals("java.code")) {
                        CodeExec exec = new CodeExec(teo.listv, pos);
                        JSONObject result = exec.test();
                        results.put(result);
                    }
                    if (teo.run_plugin.equals("java.view")) {
                        ViewExec exec = new ViewExec(teo.listv, pos);
                        JSONObject result = exec.test();
                        results.put(result);
                    }
                    pos++;
                }
            }
            FrameworkMethod.framework_end();
            ProjectCache.running_case_flag = false;
            data.put("code", "0");
            data.put("message", "测试用例执行完毕...");
            data.put("result", results);
            return data.toString();
        } catch (IllegalArgumentException e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            return null;
        }
    }

    @ApiOperation(value = "执行用例并发", notes = "执行用例并发")
    @ApiImplicitParams({@ApiImplicitParam(name = "product_code", value = "产品编码", paramType = "query", required = true, dataType = "String", defaultValue = "qfsoft_web_prp"),
            @ApiImplicitParam(name = "module_code", value = "模块编码", paramType = "query", required = true, dataType = "String", defaultValue = "1_02_001"),
            @ApiImplicitParam(name = "test_code", value = "用例编码", paramType = "query", required = true, dataType = "String", defaultValue = "C11001"),
            @ApiImplicitParam(name = "test_type", value = "测试类型", paramType = "query", required = false, dataType = "String", defaultValue = "function"),
            @ApiImplicitParam(name = "run_plugin", value = "执行插件", paramType = "query", required = false, dataType = "String", defaultValue = "java.code"),
            @ApiImplicitParam(name = "last_status", value = "状态", paramType = "query", required = false, dataType = "String", defaultValue = "auto"),
            @ApiImplicitParam(name = "concurrent", value = "并发次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "cycle", value = "循环次数", paramType = "query", required = false, dataType = "int", defaultValue = "1")})
    @RequestMapping(value = "/case_parallel", method = {RequestMethod.POST, RequestMethod.GET})
    public String execute_case_parallel(@RequestParam String product_code, @RequestParam String module_code, @RequestParam String test_code,
                                        @RequestParam(required = false, defaultValue = "function") String test_type, @RequestParam(required = false, defaultValue = "java.code") String run_plugin,
                                        @RequestParam(required = false, defaultValue = "auto") String last_status, @RequestParam(required = false, defaultValue = "1") int concurrent,
                                        @RequestParam(required = false, defaultValue = "1") int cycle) {
        try {
            JSONObject data = new JSONObject();
            if (ProjectCache.running_case_flag == true) {
                data.put("code", "1");
                data.put("message", "已有测试用例正在执行...");
                return data.toString();
            }
            ProjectCache.running_case_flag = true;
            FrameworkMethod.framework_init();
            ProjectMethod.init_param();

            TestExecObject teo = new TestExecObject(product_code, module_code, test_code, test_type, run_plugin, last_status, concurrent, cycle);
            int total = FrameworkMethod.get_totalv(teo);
            ExecutorService pool = Executors.newFixedThreadPool(total);
            Future[] futures = new Future[total];
            int pos = 0;
            JSONArray results = new JSONArray();
            for (int j = 0; j < teo.concurrent; j++) {
                for (int k = 0; k < teo.cycle; k++) {
                    TaskThread c = new TaskThread(teo);
                    futures[pos] = pool.submit(c);
                    pos++;
                }
            }
            pool.shutdown();
            for (int i = 0; i < total; i++) {
                String result = (String) futures[i].get();
                results.put(result);
            }
            FrameworkMethod.framework_end();
            ProjectCache.running_case_flag = false;
            data.put("code", "0");
            data.put("message", "测试用例执行完毕...");
            data.put("result", results);
            return data.toString();
        } catch (IllegalArgumentException e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            return null;
        }
    }

    @ApiOperation(value = "执行功能", notes = "执行功能")
    @ApiImplicitParams({@ApiImplicitParam(name = "product_code", value = "产品编码", paramType = "query", required = true, dataType = "String", defaultValue = "qfsoft_web_prp"),
            @ApiImplicitParam(name = "module_code", value = "模块编码", paramType = "query", required = true, dataType = "String", defaultValue = "1_02_001"),
            @ApiImplicitParam(name = "test_code", value = "功能编码", paramType = "query", required = true, dataType = "String", defaultValue = "F11001"),
            @ApiImplicitParam(name = "test_type", value = "测试类型", paramType = "query", required = false, dataType = "String", defaultValue = "function"),
            @ApiImplicitParam(name = "run_plugin", value = "执行插件", paramType = "query", required = false, dataType = "String", defaultValue = "java.code"),
            @ApiImplicitParam(name = "last_status", value = "状态", paramType = "query", required = false, dataType = "String", defaultValue = "auto"),
            @ApiImplicitParam(name = "concurrent", value = "并发次数", paramType = "query", required = false, dataType = "String", defaultValue = "1"),
            @ApiImplicitParam(name = "cycle", value = "循环次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "params", value = "请求参数", paramType = "query", required = true, dataType = "int", defaultValue = "{}")})
    @RequestMapping(value = "/fun", method = {RequestMethod.POST, RequestMethod.GET})
    public String execute_fun(@RequestParam String product_code, @RequestParam String module_code, @RequestParam String test_code,
                              @RequestParam(required = false, defaultValue = "function") String test_type, @RequestParam(required = false, defaultValue = "java.code") String run_plugin,
                              @RequestParam(required = false, defaultValue = "auto") String last_status, @RequestParam(required = false, defaultValue = "1") int concurrent,
                              @RequestParam(required = false, defaultValue = "1") int cycle, @RequestParam String params) {
        try {
            JSONObject data = new JSONObject();
            if (ProjectCache.running_case_flag == true) {
                data.put("code", "1");
                data.put("message", "已有测试功能正在执行...");
                return data.toString();
            }
            ProjectCache.running_case_flag = true;
            FrameworkMethod.framework_init();
            ProjectMethod.init_param();

            int pos = 0;
            JSONArray results = new JSONArray();
            TestExecObject teo = new TestExecObject(product_code, module_code, test_code, test_type, run_plugin, last_status, concurrent, cycle);
            for (int j = 0; j < teo.concurrent; j++) {
                for (int k = 0; k < teo.cycle; k++) {
                    if (teo.run_plugin.equals("java.code")) {
                        TestFunExec exec = new TestFunExec(teo.listv, pos, new JSONObject(params));
                        JSONObject result = exec.test();
                        results.put(result);
                    }
                    pos++;
                }
            }
            FrameworkMethod.framework_end();
            ProjectCache.running_case_flag = false;
            data.put("code", "0");
            data.put("message", "测试功能执行完毕...");
            data.put("result", results);
            return data.toString();
        } catch (IllegalArgumentException e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            return null;
        }
    }

    @ApiOperation(value = "执行接口", notes = "执行接口")
    @ApiImplicitParams({@ApiImplicitParam(name = "product_code", value = "产品编码", paramType = "query", required = true, dataType = "String", defaultValue = "qfsoft_web_prp"),
            @ApiImplicitParam(name = "module_code", value = "模块编码", paramType = "query", required = true, dataType = "String", defaultValue = "1_02_001"),
            @ApiImplicitParam(name = "test_code", value = "接口编码", paramType = "query", required = true, dataType = "String", defaultValue = "A11001"),
            @ApiImplicitParam(name = "test_type", value = "测试类型", paramType = "query", required = false, dataType = "String", defaultValue = "function"),
            @ApiImplicitParam(name = "run_plugin", value = "执行插件", paramType = "query", required = false, dataType = "String", defaultValue = "java.code"),
            @ApiImplicitParam(name = "last_status", value = "状态", paramType = "query", required = false, dataType = "String", defaultValue = "auto"),
            @ApiImplicitParam(name = "concurrent", value = "并发次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "cycle", value = "循环次数", paramType = "query", required = false, dataType = "int", defaultValue = "1"),
            @ApiImplicitParam(name = "params", value = "请求参数", paramType = "query", required = true, dataType = "String", defaultValue = "{\"header\":{},\"path\":{},\"query\":{},\"body\":{}}")})
    @RequestMapping(value = "/api", method = {RequestMethod.POST, RequestMethod.GET})
    public String execute_api(@RequestParam String product_code, @RequestParam String module_code, @RequestParam String test_code,
                              @RequestParam(required = false, defaultValue = "function") String test_type, @RequestParam(required = false, defaultValue = "java.code") String run_plugin,
                              @RequestParam(required = false, defaultValue = "auto") String last_status, @RequestParam(required = false, defaultValue = "1") int concurrent,
                              @RequestParam(required = false, defaultValue = "1") int cycle, @RequestParam String params) {
        try {
            JSONObject data = new JSONObject();
            if (ProjectCache.running_case_flag == true) {
                data.put("code", "1");
                data.put("message", "已有测试用例正在执行...");
                return data.toString();
            }
            ProjectCache.running_case_flag = true;
            FrameworkMethod.framework_init();
            ProjectMethod.init_param();

            int pos = 0;
            JSONArray results = new JSONArray();
            TestExecObject teo = new TestExecObject(product_code, module_code, test_code, test_type, run_plugin, last_status, concurrent, cycle);
            for (int j = 0; j < teo.concurrent; j++) {
                for (int k = 0; k < teo.cycle; k++) {
                    if (teo.run_plugin.equals("java.code")) {
                        TestAPIExec exec = new TestAPIExec(teo.listv, pos, new JSONObject(params));
                        JSONObject result = exec.test();
                        results.put(result);
                    }
                    pos++;
                }
            }
            FrameworkMethod.framework_end();
            ProjectCache.running_case_flag = false;
            data.put("code", "0");
            data.put("message", "测试用例执行完毕...");
            data.put("result", results);
            return data.toString();
        } catch (IllegalArgumentException e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            ProjectCache.running_case_flag = false;
            e.printStackTrace();
            return null;
        }
    }

}