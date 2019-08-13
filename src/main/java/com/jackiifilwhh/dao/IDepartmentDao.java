package com.jackiifilwhh.dao;

import com.jackiifilwhh.domain.Department;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("departmentDao")
public interface IDepartmentDao {
    @Select("select * from department")
    List<Department> findAllDepartment();

    @Select("select * from department where DId=#{id}")
    Department findDepartmentById(Integer id);

    @Insert("insert into department(DName,DPlace,DEmployeeNum) values(#{DName},#{DPlace},#{DEmployeeNum})")
    void addDepartment(Department department);

    @Delete("delete from department where DId=#{DId}")
    void deleteDepartment(Department department);

    @Update("update department set ")
    void modifyDepartment(Department oldDepartment, Department newDepartment);
}
