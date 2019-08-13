package com.jackiifilwhh.controller;

import com.jackiifilwhh.domain.Department;
import com.jackiifilwhh.domain.Msg;
import com.jackiifilwhh.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(path = "/department")
public class DepartmentController {
    @Autowired
    private IDepartmentService departmentService;

    /**
     * 返回所有的部门信息
     * @author : Jackiifilwhh
     * @date : 2019/8/6 14:32
     * @param null
     * @return : com.jackiifilwhh.domain.Msg
     */
    @RequestMapping(path = "/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> departments = departmentService.findAllDepartment();
        return Msg.succeed().add("depts", departments);
    }
}
