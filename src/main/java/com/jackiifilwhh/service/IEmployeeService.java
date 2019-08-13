package com.jackiifilwhh.service;

import com.jackiifilwhh.domain.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAllEmployee();
    List<Employee> findAllEmployeeByName(String EName);
    boolean isNameExisted(String EName);
    Employee findEmployeeById(Integer id);
    void addEmployee(Employee employee);
    void deleteEmployee(Integer id);
    void modifyEmployee(Employee employee);
}
