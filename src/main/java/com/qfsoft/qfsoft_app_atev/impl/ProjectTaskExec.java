package com.qfsoft.qfsoft_app_atev.impl;

import com.qfsoft.qfsoft_app_atev.util.ProjectMethod;
import qfsoft.framework.ate.instance.TaskExec;

public class ProjectTaskExec extends TaskExec {

    @Override
    public void project_init() throws Exception {
        tp_init();
    }

    @Override
    public void project_end() throws Exception {
        tp_end();
    }

    private void tp_init() throws Exception {
        ProjectMethod.init_param();
    }

    private void tp_end() throws Exception {
    }

}
