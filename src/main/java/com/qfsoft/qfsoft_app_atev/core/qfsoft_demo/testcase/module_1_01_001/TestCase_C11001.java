package com.qfsoft.qfsoft_app_atev.core.qfsoft_demo.testcase.module_1_01_001;

import com.qfsoft.qfsoft_app_atev.core.qfsoft_demo.testfun.module_1_01_001.TestFun_F11001;
import org.json.JSONObject;
import qfsoft.framework.ate.instance.TestExec;
import qfsoft.framework.ate.instance.TestExecDetail;

public class TestCase_C11001 extends TestExec {

    // 用例实例演示: 查询联赛数据成功
    public TestCase_C11001(TestExecDetail ted, int cycle_pos) {
        super(ted, cycle_pos);
    }

    public JSONObject test_exec() throws Exception {
        String params = "{\"联赛编码\":\"41\", \"赛季\":\"2005-2006\", \"轮次\":\"1\"}";
        TestFun_F11001.test_exec(ted, new JSONObject(params));
        return new JSONObject();
    }

}