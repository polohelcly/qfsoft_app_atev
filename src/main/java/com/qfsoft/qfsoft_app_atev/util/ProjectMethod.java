package com.qfsoft.qfsoft_app_atev.util;

import org.json.JSONException;
import org.json.JSONObject;
import qfsoft.framework.ate.exception.FunctionException;
import qfsoft.library.common.method.DealString;
import qfsoft.library.common.util.CommonMethod;

import java.util.Iterator;
import java.util.LinkedHashMap;

public class ProjectMethod {

    public final static void init_param() throws Exception {
        ProjectCache.params = new LinkedHashMap<String, String>();
    }

    public final static String gen_step(String step_typev, String step_actionv, String step_keyv, String step_valuev) {
        boolean is_ok = CommonMethod.verify();
        if (!is_ok) {
            return null;
        }
        String script = "";
        JSONObject jsonv = new JSONObject(step_valuev);
        if (step_typev.equals("base")) {
            if (step_actionv.equals("module")) {
                String tm_code = jsonv.getString("tm_code");
                int cycle = Integer.parseInt(jsonv.getString("cycle"));
            }
            if (step_actionv.equals("global")) {
                String valuev = decode(jsonv.getString("value"));
                String paramv = decode(jsonv.getString("param"));
                String scriptv = "CacheList.params.put(" + paramv + ", \"" + valuev + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("local")) {
                String valuev = decode(jsonv.getString("value"));
                String paramv = decode(jsonv.getString("param"));
                String scriptv = "ted.params.put(" + paramv + ", \"" + valuev + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("query_server")) {
                String db_name = decode(jsonv.getString("db_name"));
                String sql = decode(jsonv.getString("sql"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "ted.params.put(param, FrameworkMethod.query_server(" + db_name + ", \"" + sql + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("run_shell")) {
                String ip = decode(jsonv.getString("ip"));
                int port = Integer.parseInt(decode(jsonv.getString("port")));
                String user = decode(jsonv.getString("user"));
                String pwd = decode(jsonv.getString("pwd"));
                String cmd = decode(jsonv.getString("cmd"));
                String scriptv = "DealSSH.run_cmd(\"" + ip + "\", " + port + ", \"" + user + "\", DealSecret.deBASE64(\"" + pwd + "\", \"UTF-8\"), \"" + cmd + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("check_equals")) {
                String name = decode(jsonv.getString("name"));
                String expect = decode(jsonv.getString("expect"));
                String real = decode(jsonv.getString("real"));
                String scriptv = "CommonMethod.check_equals(\"" + name + "\", \"" + expect + "\", \"" + real + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("check_match")) {
                String name = decode(jsonv.getString("name"));
                String expect = decode(jsonv.getString("expect"));
                String real = decode(jsonv.getString("real"));
                String scriptv = "CommonMethod.check_match(\"" + name + "\", \"" + expect + "\", \"" + real + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
        }
        if (step_typev.equals("selenium")) {
            if (step_actionv.equals("visit")) {
                String url = decode(jsonv.getString("url"));
                String scriptv = "SeleniumMethod.visit(ted, \"" + url + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("visit_exist")) {
                String url = decode(jsonv.getString("url"));
                String xpath = decode(jsonv.getString("xpath"));
                String scriptv = "SeleniumMethod.visitForExist(ted, \"" + url + "\", \"" + xpath + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("click")) {
                String xpath = decode(jsonv.getString("xpath"));
                String scriptv = "SeleniumMethod.click(ted, \"" + xpath + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("set_text")) {
                String xpath = decode(jsonv.getString("xpath"));
                String txt = decode(jsonv.getString("text"));
                String scriptv = "SeleniumMethod.setText(ted, \"" + xpath + "\", \"" + txt + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_text")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "SeleniumMethod.params.put(\"" + param + "\", SeleniumMethod.getText(ted, \"" + xpath + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_text2")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "SeleniumMethod.params.put(\"" + param + "\", SeleniumMethod.getText(ted, \"" + xpath + "\").replace(\"\\r\", \"\").replace(\"\\n\", \"\").replace(\" \", \"\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("select")) {
                String xpath = decode(jsonv.getString("xpath"));
                String item = decode(jsonv.getString("item"));
                String scriptv = "SeleniumMethod.select(ted, \"" + xpath + "\", \"" + item + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("set")) {
                String xpath = decode(jsonv.getString("xpath"));
                String type = decode(jsonv.getString("type"));
                String scriptv = "SeleniumMethod.set(ted, \"" + xpath + "\", \"" + type + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("upload")) {
                String xpath = decode(jsonv.getString("xpath"));
                String filepath = decode(jsonv.getString("filepath"));
                String scriptv = "SeleniumMethod.upload(ted, \"" + xpath + "\", \"" + filepath + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("set_prompt")) {
                String txt = decode(jsonv.getString("txt"));
                String scriptv = "SeleniumMethod.setPrompt(ted, \"" + txt + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("refresh")) {
                String scriptv = "SeleniumMethod.refresh(ted);";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("event")) {
                String xpath = decode(jsonv.getString("xpath"));
                String event = decode(jsonv.getString("event"));
                String scriptv = "SeleniumMethod.event(ted, \"" + xpath + "\", \"" + event + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("eventjs")) {
                String js = decode(jsonv.getString("js"));
                String scriptv = "SeleniumMethod.eventjs(ted, \"" + js + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("view")) {
                String xpath = decode(jsonv.getString("xpath"));
                String scriptv = "SeleniumMethod.view(ted, \"" + xpath + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("go_mainframe")) {
                String scriptv = "SeleniumMethod.goMainframe(ted);";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("go_window")) {
                String url = decode(jsonv.getString("url"));
                String scriptv = "SeleniumMethod.goWindow(ted, \"" + url + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("close_window")) {
                String scriptv = "SeleniumMethod.closeWindow(ted);";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("waitfor_exist")) {
                String xpath = decode(jsonv.getString("xpath"));
                String scriptv = "SeleniumMethod.waitforExist(ted, \"" + xpath + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("waitfor_exist_short")) {
                String xpath = decode(jsonv.getString("xpath"));
                String scriptv = "SeleniumMethod.waitforExistShort(ted, \"" + xpath + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("waitfor_not_exist")) {
                String xpath = decode(jsonv.getString("xpath"));
                String scriptv = "SeleniumMethod.waitforNotExist(ted, \"" + xpath + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("waitfor_not_exist_short")) {
                String xpath = decode(jsonv.getString("xpath"));
                String scriptv = "SeleniumMethod.waitforNotExistShort(ted, \"" + xpath + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("is_waitfor_exist")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "SeleniumMethod.params.put(\"" + param + "\", SeleniumMethod.isWaitforExist(ted, \"" + xpath + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("is_waitfor_exist_short")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "SeleniumMethod.params.put(\"" + param + "\", SeleniumMethod.isWaitforExistShort(ted, \"" + xpath + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("is_waitfor_enable")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "SeleniumMethod.params.put(\"" + param + "\", SeleniumMethod.isWaitforEnable(ted, \"" + xpath + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_attri")) {
                String xpath = decode(jsonv.getString("xpath"));
                String attri = decode(jsonv.getString("attri"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "SeleniumMethod.params.put(\"" + param + "\", SeleniumMethod.getAttri(ted, \"" + xpath + "\", \"" + attri + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_units")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "SeleniumMethod.params.put(\"" + param + "\", SeleniumMethod.getUnits(ted, \"" + xpath + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_table")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "SeleniumMethod.params.put(\"" + param + "\", SeleniumMethod.getTable(ted, \"" + xpath + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("input_text")) {
                String txt = decode(jsonv.getString("txt"));
                String scriptv = "SeleniumMethod.inputText(ted, \"" + txt + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("waitfor")) {
                int millisecond = Integer.parseInt(decode(jsonv.getString("millisecond")));
                String scriptv = "SeleniumMethod.waitfor(" + millisecond + ");";
                script = DealString.concat(script, scriptv, "\n");
            }
        }
        if (step_typev.equals("http")) {
            if (step_actionv.equals("send_get")) {
                String urlv = decode(jsonv.getString("url"));
                String paramv = jsonv.getString("param");
                JSONObject datav = new JSONObject(paramv);
                int posv = 0;
                Iterator it = datav.keys();
                while (it.hasNext()) {
                    String param_keyv = (String) it.next();
                    String param_valuev = decode(String.valueOf(datav.get(param_keyv)));
                    if (posv == 0) {
                        urlv = urlv + "?" + param_keyv + "=" + param_valuev;
                    } else {
                        urlv = urlv + "&" + param_keyv + "=" + param_valuev;
                    }
                    posv++;
                }
                String scriptv = "HttpMethod.send_get(ted, \"" + urlv + "\");";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("send_post")) {
                String url = decode(jsonv.getString("url"));
                String param = decode(jsonv.getString("param"));
                script = DealString.concat(script, "ArrayList<NameValuePair> input = new ArrayList<NameValuePair>();", "\n");
                String[] params = param.split("\r\n");
                for (int i = 0; i < params.length; i++) {
                    if (params[i].trim().length() == 0) {
                        continue;
                    }
                    int split = params[i].indexOf("=");
                    String key = params[i].substring(0, split).trim();
                    String value = decode(params[i].substring(split + 1, params[i].length()).trim());
                    script = DealString.concat(script, "input.add(new HttpParam(\"" + key + "\", \"" + value + "\"));", "\n");
                }
                String scriptv = "HttpMethod.send_post(ted, \"" + url + "\", input);";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("invoke_dubbo")) {
                String ip = decode(jsonv.getString("ip"));
                int port = Integer.parseInt(decode(jsonv.getString("port")));
                String cmd = decode(jsonv.getString("cmd"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "HttpMethod.params.put(\"" + param + "\", HttpMethod.invoke_dubbo(\"" + ip + "\", " + port + ", \"" + cmd + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("is_exist")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "HttpMethod.params.put(\"" + param + "\", HttpMethod.isExist(ted, \"" + xpath + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_text")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "HttpMethod.params.put(\"" + param + "\", HttpMethod.getText(ted, \"" + xpath + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_text2")) {
                String xpath = decode(jsonv.getString("xpath"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "HttpMethod.params.put(\"" + param + "\", HttpMethod.getText(ted, \"" + xpath + "\").replace(\"\\r\", \"\").replace(\"\\n\", \"\").replace(\" \", \"\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_params")) {
                String left = decode(jsonv.getString("left"));
                String right = decode(jsonv.getString("right"));
                String param = decode(jsonv.getString("param"));
                String scriptv = "HttpMethod.params.put(\"" + param + "\", HttpMethod.getParams(ted, \"" + left + "\", \"" + right + "\"));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("get_param")) {
                String left = decode(jsonv.getString("left"));
                String right = decode(jsonv.getString("right"));
                int pos = Integer.parseInt(decode(jsonv.getString("pos")));
                String param = decode(jsonv.getString("param"));
                String scriptv = "HttpMethod.params.put(\"" + param + "\", HttpMethod.getParam(ted, \"" + left + "\", \"" + right + "\", " + pos + "));";
                script = DealString.concat(script, scriptv, "\n");
            }
            if (step_actionv.equals("waitfor")) {
                int millisecond = Integer.parseInt(decode(jsonv.getString("millisecond")));
                String scriptv = "HttpMethod.waitfor(" + millisecond + ");";
                script = DealString.concat(script, scriptv, "\n");
            }
        }
        return script;
    }

    public final static String decode(String value) throws JSONException {
        boolean is_ok = CommonMethod.verify();
        if (!is_ok) {
            return null;
        }
        String[] params = DealString.getParams(value, "${", "}");
        for (int i = 0; i < params.length; i++) {
            if (params[i].startsWith("global(")) {
                String keyv = DealString.getParam(params[i], "(", ")", 0);
                String valuev = "\"+String.valueOf(CacheList.params.get(\"" + keyv.trim() + "\"))+\"";
                value = value.replace("${" + params[i] + "}", valuev);
            }
            if (params[i].startsWith("http(")) {
                String keyv = DealString.getParam(params[i], "(", ")", 0);
                String valuev = "\"+String.valueOf(HttpMethod.params.get(\"" + keyv.trim() + "\"))+\"";
                value = value.replace("${" + params[i] + "}", valuev);
            }
            if (params[i].startsWith("selenium(")) {
                String keyv = DealString.getParam(params[i], "(", ")", 0);
                String valuev = "\"+String.valueOf(SeleniumMethod.params.get(\"" + keyv.trim() + "\"))+\"";
                value = value.replace("${" + params[i] + "}", valuev);
            }
            if (params[i].startsWith("local.string(")) {
                String keyv = DealString.getParam(params[i], "(", ")", 0);
                String valuev = "\"+String.valueOf(ted.params.get(\"" + keyv.trim() + "\"))+\"";
                value = value.replace("${" + params[i] + "}", valuev);
            }
            if (params[i].startsWith("local.money(")) {
                String keyv = DealString.getParam(params[i], "(", ")", 0);
                String valuev = "\"+DealString.decToMoney(Double.parseDouble(String.valueOf(ted.params.get(\"" + keyv.trim() + "\"))), 2)+\"";
                value = value.replace("${" + params[i] + "}", valuev);
            }
            if (params[i].startsWith("table.string(")) {
                String[] keyvs = DealString.getParam(params[i], "(", ")", 0).split(",");
                String valuev = "\"+DealTable.getString((DefaultTableModel) ted.params.get(\"" + keyvs[0].trim() + "\"), Integer.parseInt(\"" + keyvs[1].trim() + "\"), \"" + keyvs[2].trim()
                        + "\")+\"";
                value = value.replace("${" + params[i] + "}", valuev);
            }
            if (params[i].startsWith("now(")) {
                String valuev = "\"+DealDate.getNowTimeStr()+\"";
                value = value.replace("${" + params[i] + "}", valuev);
            }
        }
        return value;
    }

    public final static void set_json(JSONObject json, String key, Object value) throws Exception {
        if (value == null) {
            String memo = key + "对应的键值设置为空";
            throw new FunctionException(memo);
        }
        json.put(key, value);
    }

}
