package com.qfsoft.qfsoft_app_atev.util;

import java.util.LinkedHashMap;

import javax.swing.table.DefaultTableModel;

import org.apache.log4j.Level;
import org.json.JSONObject;

import qfsoft.framework.ate.exception.FunctionException;
import qfsoft.framework.ate.instance.TestExecDetail;
import qfsoft.framework.ate.util.FrameworkMethod;
import qfsoft.library.common.method.DealDatabase;
import qfsoft.library.common.method.DealTable;

public class ProjectMethod {

    public final static void initParam() throws Exception {
        ProjectCache.params = new LinkedHashMap<String, String>();
    }

    public final static void setJson(JSONObject json, String key, Object value) throws Exception {
        if (value == null) {
            String memo = key + "对应的键值设置为空";
            throw new FunctionException(memo);
        }
        json.put(key, value);
    }

}
