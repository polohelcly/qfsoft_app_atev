package com.qfsoft.qfsoft_app_atev.test;

import com.qfsoft.qfsoft_app_atev.util.ProjectMethod;
import junit.framework.TestCase;
import org.apache.log4j.Level;
import qfsoft.framework.ate.instance.TaskThread;
import qfsoft.framework.ate.instance.TestExecObject;
import qfsoft.framework.ate.util.FrameworkMethod;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class DebugCaseParallel extends TestCase {

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
        int total = FrameworkMethod.get_totalv(teo);
        ExecutorService pool = Executors.newFixedThreadPool(total);
        Future[] futures = new Future[total];
        int pos = 0;
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
            FrameworkMethod.log(Level.INFO, result);
        }
    }

}
