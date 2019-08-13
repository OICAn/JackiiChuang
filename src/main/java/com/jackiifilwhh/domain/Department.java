package com.jackiifilwhh.domain;

import java.io.Serializable;

public class Department implements Serializable {
    private Integer DId;
    private String DName;
    private String DPlace;
    private Integer DEmployeeNum;

    public Department() {}

    public Integer getDId() {
        return DId;
    }

    public void setDId(Integer DId) {
        this.DId = DId;
    }

    public String getDName() {
        return DName;
    }

    public void setDName(String DName) {
        this.DName = DName;
    }

    public String getDPlace() {
        return DPlace;
    }

    public void setDPlace(String DPlace) {
        this.DPlace = DPlace;
    }

    public Integer getDEmployeeNum() {
        return DEmployeeNum;
    }

    public void setDEmployeeNum(Integer DEmployeeNum) {
        this.DEmployeeNum = DEmployeeNum;
    }
}
