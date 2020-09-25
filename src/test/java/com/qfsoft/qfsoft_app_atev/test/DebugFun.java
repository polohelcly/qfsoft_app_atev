package com.qfsoft.qfsoft_app_atev.test;

import org.json.JSONArray;
import org.json.JSONObject;

import com.qfsoft.qfsoft_app_atev.main.MainFun;

import junit.framework.TestCase;
import qfsoft.library.common.util.CommonMethod;

public class DebugFun extends TestCase {

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }

    public void testApp() throws Exception {
        JSONObject params = new JSONObject();
        params.put("关键字", "docker");
        String[] args = new String[]{"X_01_001", "F11001", "function", "java.code", "auto", "1", "1", params.toString()};
        JSONArray results = MainFun.main(args);
        CommonMethod.log(results.toString());
    }

}
