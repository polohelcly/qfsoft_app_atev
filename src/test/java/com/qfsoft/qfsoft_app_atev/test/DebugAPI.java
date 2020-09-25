package com.qfsoft.qfsoft_app_atev.test;

import org.json.JSONArray;
import org.json.JSONObject;

import com.qfsoft.qfsoft_app_atev.main.MainApi;

import junit.framework.TestCase;
import qfsoft.library.common.util.CommonMethod;

public class DebugAPI extends TestCase {

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }

    public void testApp() throws Exception {
        JSONObject data = new JSONObject();
        JSONObject data_param = new JSONObject();
        data_param.put("wd", "docker");
        data.put("data_param", data_param);
        String[] args = new String[]{"X_01_001", "A11001", "function", "java.code", "auto", "1", "1", data.toString()};
        JSONArray results = MainApi.main(args);
        CommonMethod.log(results.toString());
    }

}
