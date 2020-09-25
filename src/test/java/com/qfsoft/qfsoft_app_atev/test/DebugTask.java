package com.qfsoft.qfsoft_app_atev.test;

import com.qfsoft.qfsoft_app_atev.main.MainTask;

import junit.framework.TestCase;

public class DebugTask extends TestCase {

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }

    public void testApp() throws Exception {
        String[] args = new String[]{"serial"};
        MainTask.main(args);
    }

}
