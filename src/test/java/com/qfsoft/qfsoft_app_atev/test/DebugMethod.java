package com.qfsoft.qfsoft_app_atev.test;

import org.json.JSONObject;

import junit.framework.TestCase;
import qfsoft.framework.ate.plugin.HttpMethod;

public class DebugMethod extends TestCase {

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }

    public void testApp() throws Exception {
        JSONObject request = new JSONObject("{\"data\":{\"test1\":\"good1\",\"test2\":\"good2\"}}");
        JSONObject param2 = new JSONObject("{\"test2\":null}");
        JSONObject data = (JSONObject) HttpMethod.handle_null(HttpMethod.handle_data(request.get("data"), param2));
        System.out.println(data);
    }

}
