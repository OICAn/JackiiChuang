package com.jackiifilwhh.test;

import com.jackiifilwhh.service.IEmployeeService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
    @org.junit.Test
    public void run1(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        IEmployeeService employeeService = (IEmployeeService) applicationContext.getBean("employeeService");
        employeeService.findAllEmployee();
    }
}
