package com.qfsoft.qfsoft_app_atev.test;

import com.qfsoft.qfsoft_app_atev.util.ProjectMethod;
import junit.framework.TestCase;
import org.apache.log4j.Level;
import org.json.JSONObject;
import qfsoft.framework.ate.core.testcase.CodeExec;
import qfsoft.framework.ate.core.testcase.ViewExec;
import qfsoft.framework.ate.instance.TestExecObject;
import qfsoft.framework.ate.util.FrameworkMethod;

public class DebugCase extends TestCase {

    protected void setUp() throws Exception {
        FrameworkMethod.framework_init();
        ProjectMethod.init_param();
    }

    protected void tearDown() throws Exception {
        FrameworkMethod.framework_end();
    }

    public void testApp() throws Exception {
        String listv = "qfsoft_demo.1_01_001.C11001,function,java.code,auto,1,1";
        TestExecObject teo = new TestExecObject(listv);
        int pos = 0;
        for (int j = 0; j < teo.concurrent; j++) {
            for (int k = 0; k < teo.cycle; k++) {
                if (teo.run_plugin.equals("java.code")) {
                    CodeExec exec = new CodeExec(teo.listv, pos);
                    JSONObject result = exec.test();
                    FrameworkMethod.log(Level.INFO, result.toString());
                }
                if (teo.run_plugin.equals("java.view")) {
                    ViewExec exec = new ViewExec(teo.listv, pos);
                    JSONObject result = exec.test();
                    FrameworkMethod.log(Level.INFO, result.toString());
                }
                pos++;
            }
        }
    }

}
