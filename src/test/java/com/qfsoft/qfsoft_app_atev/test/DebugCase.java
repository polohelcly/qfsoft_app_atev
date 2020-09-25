package com.qfsoft.qfsoft_app_atev.test;

import com.qfsoft.qfsoft_app_atev.main.MainCase;

import junit.framework.TestCase;

public class DebugCase extends TestCase {

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }

    public void testApp() throws Exception {
        String[] args = new String[]{"X_01_001", "C11001", "function", "java.code", "auto", "1", "1"};
        MainCase.main(args);
    }

}
