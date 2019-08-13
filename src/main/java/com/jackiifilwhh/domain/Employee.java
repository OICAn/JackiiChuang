package com.jackiifilwhh.domain;

import javax.validation.constraints.Pattern;
import java.io.Serializable;

public class Employee implements Serializable {
    private Integer EId;
    @Pattern(regexp = "(^[A-Za-z0-9]{6,16}$)|(^[\\u4E00-\\u9FA50-9_]{2,6})",
            message = "姓名格式有误，规定为6-16位的英文数字组合或者2-6位中文数字组合，请检查后重新输入！")
    private String EName;
    private String Sex;
    private String Department;

    @Override
    public String toString() {
        return "Employee{" +
                "EId=" + EId +
                ", EName='" + EName + '\'' +
                ", Sex='" + Sex + '\'' +
                ", Department='" + Department + '\'' +
                '}';
    }

    public Employee(){
        super();
    }

    public Integer getEId() {
        return EId;
    }

    public Employee(Integer EId, String EName, String sex, String department) {
        super();
        this.EId = EId;
        this.EName = EName;
        Sex = sex;
        Department = department;
    }

    public void setEId(Integer EId) {
        this.EId = EId;
    }

    public String getEName() {
        return EName;
    }

    public void setEName(String EName) {
        this.EName = EName;
    }

    public String getSex() {
        return Sex;
    }

    public void setSex(String Sex) {
        this.Sex = Sex;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String Department) {
        this.Department = Department;
    }
}
