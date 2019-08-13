package com.jackiifilwhh.service.impl;

import com.jackiifilwhh.dao.IDepartmentDao;
import com.jackiifilwhh.domain.Department;
import com.jackiifilwhh.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("departmentService")
public class DepartmentServiceImpl implements IDepartmentService {
    @Autowired
    private IDepartmentDao departmentDao;

    public void setDepartmentDao(IDepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }

    @Override
    public List<Department> findAllDepartment() {
        return departmentDao.findAllDepartment();
    }

    @Override
    public Department findDepartmentById(Integer id) {
        return departmentDao.findDepartmentById(id);
    }

    @Override
    public void addDepartment(Department department) {
        departmentDao.addDepartment(department);
    }

    @Override
    public void deleteDepartment(Department department) {
        departmentDao.deleteDepartment(department);
    }

    @Override
    public void modifyDepartment(Department oldDepartment, Department newDepartment) {
        departmentDao.modifyDepartment(oldDepartment, newDepartment);
    }
}
