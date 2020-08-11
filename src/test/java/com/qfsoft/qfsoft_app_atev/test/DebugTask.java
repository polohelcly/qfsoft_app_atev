package com.qfsoft.qfsoft_app_atev.test;

import com.qfsoft.qfsoft_app_atev.impl.ProjectTaskExec;
import com.qfsoft.qfsoft_app_atev.util.ProjectMethod;
import junit.framework.TestCase;
import qfsoft.framework.ate.util.FrameworkMethod;

public class DebugTask extends TestCase {

    protected void setUp() throws Exception {
        FrameworkMethod.framework_init();
        ProjectMethod.init_param();
    }

    protected void tearDown() throws Exception {
        FrameworkMethod.framework_end();
    }

    public void testApp() throws Exception {
        ProjectTaskExec task = new ProjectTaskExec();
        task.execute();
    }

}
