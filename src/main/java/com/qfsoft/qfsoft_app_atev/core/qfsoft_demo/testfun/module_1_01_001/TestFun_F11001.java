package com.qfsoft.qfsoft_app_atev.core.qfsoft_demo.testfun.module_1_01_001;

import org.json.JSONObject;
import qfsoft.framework.ate.instance.TestExecDetail;
import qfsoft.framework.ate.plugin.HttpMethod;

public class TestFun_F11001 {

    public final static JSONObject test_exec(TestExecDetail ted, JSONObject params) throws Exception {
        HttpMethod.send_get(ted, "http://league.aicai.com/league/scoreresult!ajaxscoreResult.htm?leagueId=" + params.getString("联赛编码") + "&season=" + params.getString("赛季") + "&round="
                + params.getString("轮次") + "&matchType=0");
        JSONObject result = new JSONObject();
        result.put("code", ted.response_code);
        result.put("data", ted.response_context);
        return result;
    }

}
