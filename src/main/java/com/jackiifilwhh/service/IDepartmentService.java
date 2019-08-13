package com.jackiifilwhh.service;

import com.jackiifilwhh.domain.Department;

import java.util.List;

public interface IDepartmentService {
    List<Department> findAllDepartment();
    Department findDepartmentById(Integer id);
    void addDepartment(Department department);
    void deleteDepartment(Department department);
    void modifyDepartment(Department oldDepartment, Department newDepartment);
}
