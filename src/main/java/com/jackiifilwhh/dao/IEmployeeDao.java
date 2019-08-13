package com.jackiifilwhh.dao;
import com.jackiifilwhh.domain.Employee;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("employeeDao")
public interface IEmployeeDao {

    @Select("select * from employee")
    List<Employee> findAllEmployee();

    @Select("select * from employee where EId=#{id}")
    Employee findEmployeeById(Integer id);

    @Select("select * from employee where EName = #{EName}")
    List<Employee> findAllEmployeeByName(String EName);

    @Insert("insert into employee(EName,Sex,Department) values(#{EName},#{Sex},#{Department})")
    void addEmployee(Employee employee);

    @Delete("delete from employee where EId=#{id}")
    void deleteEmployee(Integer id);

    @Update("update employee set Sex=#{Sex}, Department=#{Department} where EId=#{EId}")
    void modifyEmployee(Employee employee);
}
