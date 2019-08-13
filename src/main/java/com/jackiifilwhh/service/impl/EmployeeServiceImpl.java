package com.jackiifilwhh.service.impl;

import com.jackiifilwhh.dao.IEmployeeDao;
import com.jackiifilwhh.domain.Employee;
import com.jackiifilwhh.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("employeeService")
public class EmployeeServiceImpl implements IEmployeeService {
    @Autowired
    IEmployeeDao employeeDao;

    public void setEmployeeDao(IEmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }

    @Override
    public List<Employee> findAllEmployee() {
        return employeeDao.findAllEmployee();
    }

    @Override
    public List<Employee> findAllEmployeeByName(String EName) {
        return employeeDao.findAllEmployeeByName(EName);
    }

    /**
     * 如果名字存在，返回true，否则返回false
     * @author : Jackiifilwhh
     * @date : 2019/8/6 20:24
     * @param EName : 被检查的名字
     * @return : boolean
     */
    @Override
    public boolean isNameExisted(String EName) {
        return !(employeeDao.findAllEmployeeByName(EName).size()==0);
    }

    @Override
    public Employee findEmployeeById(Integer id) {
        return employeeDao.findEmployeeById(id);
    }

    @Override
    public void addEmployee(Employee employee) {
        if(employeeDao.findEmployeeById(employee.getEId())!=null){
            //要添加的员工已经存在
            throw new RuntimeException();
        }
        else{
            employeeDao.addEmployee(employee);
        }
    }

    @Override
    public void deleteEmployee(Integer id) {
        if(employeeDao.findEmployeeById(id)==null){
            //要删除的员工不存在
            throw new RuntimeException();
        }
        else{
            employeeDao.deleteEmployee(id);
        }
    }

    @Override
    public void modifyEmployee(Employee employee) {
        if(employeeDao.findEmployeeById(employee.getEId())==null){
            //要删除的员工不存在
            throw new RuntimeException();
        }
        else{
            employeeDao.modifyEmployee(employee);
        }
    }
}
